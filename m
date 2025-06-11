Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D902E2D5432
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 01:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749605014; cv=none; b=tS+guGZb+RZU8fgyAoOTwiJ5r3G2jQSFCUrp3NXawmbRYGl++YH0rXfT+sAolDuiX9ywRFEMSZEIBIudpM2Fro6gmnMS0TtbZPl2l4/xMMfCcVbevNn1ob7R8xy+K337U+bJuyRksYpUQV/BcZQhF+TtvZEd8iC0x1ODxJpl35Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749605014; c=relaxed/simple;
	bh=iwcIHMwT1YXFwedoNUBMtxUwu1Ja5R01HOB7PbHJAb0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AnRawoCn70k6FDvL5NQLkFDCpOVMMIw/HAlDH40S7Xuoe7adQmKcCKPrNMmIylgt0baBRhKx+hnXiufAF7Wm1gL0+EN7nUU21wvMFTklzLRng1xFm9kaNUXTzL6c2trUT7MxJbtp41X6GMeh97LaNGVE39LWIvygtN+gwYk351A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J6PWBfXa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J6PWBfXa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FEDAC4CEED;
	Wed, 11 Jun 2025 01:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749605014;
	bh=iwcIHMwT1YXFwedoNUBMtxUwu1Ja5R01HOB7PbHJAb0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J6PWBfXae+rf+cjyRTi5azEeGwzz1f1vRp0fHntIcZi5qzNlUGhS7PCmr2ENsBzrq
	 EzGHeolHAy7UwhTBvmRdxBXPIl1ptwxB5SbnbjWatk8feyzeADEduba9bXtVe+Y4G7
	 zwz0EzOnfAjy+z644wDZhC5mQ174a9BLZ5efq1VZpt2aDU7yQ0D6Vgg0e+CalqJh/Q
	 fLUuzJg3FbdyMXLfraLOgJOwQUuUhwqCVjCKFNDqiN17JzlIp23nzhhAbOFJqNjZcO
	 3AkqIIo63dwdzfxxhEHUcd7EsgVJt9AW+/jJth2V4pw8btjGSQQ3TsDpKolOuNucS0
	 JxcsX7QnUYcNw==
Date: Tue, 10 Jun 2025 18:23:31 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Alexandre Chartre <alexandre.chartre@oracle.com>
Cc: linux-kernel@vger.kernel.org, mingo@kernel.org, peterz@infradead.org
Subject: Re: [RFC 10/13] objtool: Trace instruction state changes during
 function validation
Message-ID: <u43x62rul2jxorsljyo6qb2xztnx3wufwdnz32erfhsdomao4a@on7c5uvse4jc>
References: <20250606153440.865808-1-alexandre.chartre@oracle.com>
 <20250606153440.865808-11-alexandre.chartre@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250606153440.865808-11-alexandre.chartre@oracle.com>

On Fri, Jun 06, 2025 at 05:34:37PM +0200, Alexandre Chartre wrote:
> +++ b/tools/objtool/check.c
> @@ -111,6 +111,111 @@ static void vtrace_insn(struct instruction *insn, const char *format, ...)
>  		free((char *)addr_str);
>  }
>  
> +/*
> + * Macros to trace CFI state attributes changes.
> + */
> +
> +#define VTRACE_CFI_ATTR(attr, prev, next, fmt, ...)			\
> +	do {								\
> +		if ((prev)->attr != (next)->attr)			\
> +			VTRACE_PRINTF("%s=" fmt " ", #attr, __VA_ARGS__); \
> +	} while (0)
> +
> +#define VTRACE_CFI_ATTR_BOOL(attr, prev, next)				\
> +	VTRACE_CFI_ATTR(attr, prev, next,				\
> +			"%s", (next)->attr ? "true" : "false")
> +
> +#define VTRACE_CFI_ATTR_NUM(attr, prev, next, fmt)			\
> +	VTRACE_CFI_ATTR(attr, prev, next, fmt, (next)->attr)
> +
> +/*
> + * Functions and macros to trace CFI registers changes.
> + */
> +
> +static void vtrace_cfi_register(const char *prefix, int reg, const char *fmt,
> +				int base_prev, int offset_prev,
> +				int base_next, int offset_next)
> +{

In keeping with the namespace of the other vtrace_cfi_reg_*()
functions/macros, I'd suggest calling this vtrace_cfi_reg()

(or trace_cfi_reg() if we go with my previous suggestion to remove the "v"
everywhere)

> +	const char *rname;
> +
> +	if (base_prev == base_next && offset_prev == offset_next)
> +		return;
> +
> +	if (prefix)
> +		VTRACE_PRINTF("%s:", prefix);
> +
> +	rname = register_name(reg);

For similar reasons, "register_name()" -> "reg_name()".

> +
> +	if (base_next == CFI_UNDEFINED) {
> +		VTRACE_PRINTF("%1$s=<undef> ", rname);
> +	} else {
> +		VTRACE_PRINTF(fmt, rname,
> +			      register_name(base_next), offset_next);
> +	}
> +}
> +
> +static void vtrace_cfi_reg_value(const char *prefix, int reg,
> +				 int base_prev, int offset_prev,
> +				 int base_next, int offset_next)
> +{
> +	vtrace_cfi_register(prefix, reg, "%1$s=%2$s%3$+d ",
> +			    base_prev, offset_prev, base_next, offset_next);
> +}
> +
> +static void vtrace_cfi_reg_reference(const char *prefix, int reg,
> +				     int base_prev, int offset_prev,
> +				     int base_next, int offset_next)
> +{
> +	vtrace_cfi_register(prefix, reg, "%1$s=(%2$s%3$+d) ",
> +			    base_prev, offset_prev, base_next, offset_next);
> +}
> +
> +#define VTRACE_CFI_REG_VAL(reg, prev, next)				\
> +	vtrace_cfi_reg_value(NULL, reg, prev.base, prev.offset,		\
> +			     next.base, next.offset)
> +
> +#define VTRACE_CFI_REG_REF(reg, prev, next)				\
> +	vtrace_cfi_reg_reference(NULL, reg, prev.base, prev.offset,	\
> +				 next.base, next.offset)

For similar reasons, "*_val()" and "*_ref()".

> +
> +static void vtrace_insn_state(struct instruction *insn,
> +			      struct insn_state *sprev,
> +			      struct insn_state *snext)
> +{
> +	struct cfi_state *cprev, *cnext;
> +	int i;
> +
> +	if (memcmp(sprev, snext, sizeof(struct insn_state)) == 0)
> +		return;

"!memcmp()"

> @@ -3698,6 +3803,7 @@ static int validate_insn(struct objtool_file *file, struct symbol *func,
>  			 struct instruction *prev_insn, struct instruction *next_insn,
>  			 bool *validate_nextp)
>  {
> +	struct insn_state state_prev;

Can we call it prev_state for consistency with prev_insn?

>  	struct alternative *alt;
>  	u8 visited;
>  	int ret;
> @@ -3814,7 +3920,15 @@ static int validate_insn(struct objtool_file *file, struct symbol *func,
>  	if (skip_alt_group(insn))
>  		return 0;
>  
> -	if (handle_insn_ops(insn, next_insn, statep))
> +	if (vtrace)
> +		state_prev = *statep;
> +
> +	ret = handle_insn_ops(insn, next_insn, statep);
> +
> +	if (vtrace)
> +		vtrace_insn_state(insn, &state_prev, statep);

For consistency with the other tracing, can the trace statement be a
capitalized macro, with the "vtrace" check hidden?

	state_prev = *statep;
	ret = handle_insn_ops(insn, next_insn, statep);
	TRACE_INSN_STATE(insn, &state_prev, statep);

> +++ b/tools/objtool/disas.c
> @@ -29,6 +29,33 @@ struct disas_context {
>  	((*(dinfo)->fprintf_func)((dinfo)->stream, __VA_ARGS__))
>  
>  
> +#define REGISTER_NAME_MAXLEN   16
> +
> +/*
> + * Return the name of a register. Note that the same static buffer
> + * is returned if the name is dynamically generated.
> + */
> +const char *register_name(unsigned int reg)
> +{
> +	static char rname_buffer[REGISTER_NAME_MAXLEN];
> +
> +	switch (reg) {
> +	case CFI_UNDEFINED:
> +		return "<undefined>";
> +	case CFI_CFA:
> +		return "cfa";
> +	case CFI_SP_INDIRECT:
> +		return "(sp)";
> +	case CFI_BP_INDIRECT:
> +		return "(bp)";
> +	}
> +
> +	if (snprintf(rname_buffer, REGISTER_NAME_MAXLEN, "r%d", reg) == 1)
> +		return NULL;
> +
> +	return (const char *)rname_buffer;
> +}
> +

Would this not be a better fit as a static function in check.c?  Its
only callers are there.  And it references the CFI stuff.

Or we might also want to consider moving all the trace_*() functions to
their own file, trace.c or so.

-- 
Josh
