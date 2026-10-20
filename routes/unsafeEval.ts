import { type Request, type Response, type NextFunction } from 'express'

export function unsafeEval () {
  return (req: Request, res: Response, next: NextFunction) => {
    const expression = typeof req.query.expression === 'string' ? req.query.expression : ''

    try {
      const result = eval(expression) // vuln-code-snippet vuln-line insecureEval
      res.json({ result })
    } catch (error) {
      next(error)
    }
  }
}
