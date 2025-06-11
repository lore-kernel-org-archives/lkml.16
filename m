Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3212A5695
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 00:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749602919; cv=none; b=n2sqtxhK+BNJYicmy4JzUvDzduBgLkBJuirkKQvxjuWvHvkF4A7KvfwujCvUHDQmaMZkuhq7nBc/7lLCdivjKWbWJmxUWW1SzHSZ9mMCAbUC2ieq3XMi2wVw61jTxZJ1BhvOm5c5ZiR0P6EugZTfURmriZ++g/dmymDD5D5rDhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749602919; c=relaxed/simple;
	bh=0bUgisSuRWIdeKgbbyj2EYGe2W79vD23GyzkmsuhtZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nRIrx4F9XA6tmyWKLeQ8RycpgTJwJ1UVKE1YqFmQgC+JWQy+YT60LViWphj+Jt67UoQiFi/zBhIzdV6uWfmjaoQdFZoSIhMp1EWtnMuFPDTdytTHBgFlS/GTOUic0C5auDlgE5ZiRpPzdoyN+rQZ90w32WEAJtcQseaTn2MOdNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W5lFgEbr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W5lFgEbr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E53DC4CEED;
	Wed, 11 Jun 2025 00:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749602919;
	bh=0bUgisSuRWIdeKgbbyj2EYGe2W79vD23GyzkmsuhtZ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W5lFgEbrcj6xJY11pE8PBgtB4zOCspOAyZbraHcabNNl4HUbw2elW2pP7tGZ9Lcc6
	 w7C4LW5/qiFM7nX0cZE5YkVkZfnsBWbVskyAFvwFwp4fvxazYfYDvPq7htu7K+Q7i+
	 b/gFGSIERrf3UXlK0iqFA7pY2HbjSU0Fz14RHu/K9juylFiluPUGlAxUZbgFHeHX2D
	 YbGPyisQOPQpls+4zYY/+BwTSeQmOv1SQdogi2TWolXkt8gdzt19qeFD5IABPw8dIC
	 ofj70CIrojyWAlLc+a+2eFfeXIFWt02p2feSnxBV3Z0vxJ7L+aZcMDuBiyPcvZMffY
	 +cYytz+Wwenng==
Date: Tue, 10 Jun 2025 17:48:36 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Alexandre Chartre <alexandre.chartre@oracle.com>
Cc: linux-kernel@vger.kernel.org, mingo@kernel.org, peterz@infradead.org
Subject: Re: [RFC 09/13] objtool: Add option to trace function validation
Message-ID: <hijyjj2ammxiyeogytqtkjj7hbt3kmz7l65rueusftoy7u3pnv@vwtp3ctv7r2u>
References: <20250606153440.865808-1-alexandre.chartre@oracle.com>
 <20250606153440.865808-10-alexandre.chartre@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250606153440.865808-10-alexandre.chartre@oracle.com>

On Fri, Jun 06, 2025 at 05:34:36PM +0200, Alexandre Chartre wrote:
> +++ b/tools/objtool/builtin-check.c
> @@ -99,6 +99,7 @@ static const struct option check_options[] = {
>  	OPT_STRING('o',  "output", &opts.output, "file", "output file name"),
>  	OPT_BOOLEAN(0,   "sec-address", &opts.sec_address, "print section addresses in warnings"),
>  	OPT_BOOLEAN(0,   "stats", &opts.stats, "print statistics"),
> +	OPT_STRING(0,	"trace", &opts.trace, "func", "trace function validation"),

Here, "trace" is vertically misaligned with the other long options.

> @@ -36,6 +37,80 @@ static struct cfi_state force_undefined_cfi;
>  
>  static size_t sym_name_max_len;
>  
> +static bool vtrace;
> +static int vtrace_depth;

I'm not sure what the "v" means here and elsewhere, can we remove it to
improve readability?  The option is called "trace" after all.

> +/*
> + * Validation traces are sent to stderr so that they are output
> + * on the same flow as warnings.
> + */
> +#define VTRACE_PRINTF(fmt, ...)		fprintf(stderr, fmt, ##__VA_ARGS__)

I'm not sure this comment is really needed.  At least the reason for the
stderr seems obvious to me.  Besides that, it might make sense for
tracing to use stderr anyway, regardless of whether warnings existed.

Also I think the "_PRINTF" is self-evident, can we call it TRACE() or
so?  That would be more analagous to the existing WARN()/ERROR().

> +	/* print message if any */
> +	if (format) {
> +		VTRACE_PRINTF(" - ");
> +		va_start(args, format);
> +		vfprintf(stderr, format, args);

This breaks the macro abstraction, do we need a wrapper for
"vfprintf(stderr...)" as well?

VTRACE() maybe? (assuming the base macro gets renamed to TRACE)

> @@ -3580,10 +3665,8 @@ static int validate_branch(struct objtool_file *file, struct symbol *func,
>  		ret = validate_insn(file, func, insn, &state,
>  				    prev_insn, next_insn,
>  				    &validate_next);
> -		if (!validate_next)
> -			break;
>  
> -		if (!next_insn) {
> +		if (validate_next && !next_insn) {
>  			if (state.cfi.cfa.base == CFI_UNDEFINED)
>  				return 0;
>  			if (file->ignore_unreachables)
> @@ -3595,9 +3678,17 @@ static int validate_branch(struct objtool_file *file, struct symbol *func,
>  			return 1;
>  		}
>  
> +		if (!insn->vtrace) {
> +			if (ret)
> +				VTRACE_INSN(insn, "validated (%d)", ret);

I'm not sure what "validated" communicates here, should this instead
indicate there was an warning?

> +			else
> +				VTRACE_INSN(insn, NULL);
> +		}

Should these VTRACE_INSN()s be done before the !next_insn clause above
so we can see the last instruction before the branch validation stopped?

> @@ -3696,13 +3791,24 @@ static int validate_insn(struct objtool_file *file, struct symbol *func,
>  		return 1;
>  
>  	if (insn->alts) {
> +		int i, count;
> +
> +		count = 0;
> +		for (alt = insn->alts; alt; alt = alt->next)
> +			count++;

"count" is rather vague, how about "num_alts" or so.

> @@ -3733,13 +3841,21 @@ static int validate_insn(struct objtool_file *file, struct symbol *func,
>  	case INSN_JUMP_CONDITIONAL:
>  	case INSN_JUMP_UNCONDITIONAL:
>  		if (is_sibling_call(insn)) {
> +			VTRACE_INSN(insn, "sibling call");
>  			ret = validate_sibling_call(file, insn, statep);
>  			if (ret)
>  				return ret;
>  
>  		} else if (insn->jump_dest) {
> -			ret = validate_branch(file, func,
> -					      insn->jump_dest, *statep);
> +			if (insn->type == INSN_JUMP_UNCONDITIONAL) {
> +				VTRACE_INSN(insn, "unconditional jump");
> +				ret = do_validate_branch(file, func,
> +							 insn->jump_dest, *statep);
> +			} else {
> +				VTRACE_INSN(insn, "jump taken");
> +				ret = validate_branch(file, func,
> +						      insn->jump_dest, *statep);
> +			}

This can be simplified:

			if (insn->type == INSN_JUMP_UNCONDITIONAL)
				VTRACE_INSN(insn, "unconditional jump");
			else
				VTRACE_INSN(insn, "jump taken");

			ret = do_validate_branch(file, func, insn->jump_dest, *statep);
>  			if (ret) {
>  				BT_INSN(insn, "(branch)");
>  				return ret;
> @@ -3749,10 +3865,12 @@ static int validate_insn(struct objtool_file *file, struct symbol *func,
>  		if (insn->type == INSN_JUMP_UNCONDITIONAL)
>  			return 0;
>  
> +		VTRACE_INSN(insn, "jump not taken");
>  		break;
>  
>  	case INSN_JUMP_DYNAMIC:
>  	case INSN_JUMP_DYNAMIC_CONDITIONAL:
> +		VTRACE_INSN(insn, "dynamic jump");

Let's call it "indirect jump" (and yes, those enums are poorly named).

Shall we have a distinct trace for indirect calls (INSN_CALL_DYNAMIC) as
well?

> @@ -4253,9 +4391,22 @@ static int validate_symbol(struct objtool_file *file, struct section *sec,
>  	if (opts.uaccess)
>  		state->uaccess = sym->uaccess_safe;
>  
> +	if (opts.trace && fnmatch(opts.trace, sym->name, 0) == 0) {

Please use "!fnmatch(...)" instead of "fnmatch(...) == 0".

> +++ b/tools/objtool/include/objtool/check.h
> @@ -81,6 +81,8 @@ struct instruction {
>  	struct symbol *sym;
>  	struct stack_op *stack_ops;
>  	struct cfi_state *cfi;
> +
> +	u32 vtrace;
>  };

Can this just be a single bit instead of u32?  This struct is one of the
biggest memory hogs, vmlinux.o can have a gazillion instructions.  There
are actually some bits already reserved in this struct.

-- 
Josh
