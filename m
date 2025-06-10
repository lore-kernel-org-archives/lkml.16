Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE29226981C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 21:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749589964; cv=none; b=bHDeH/AIX/1MHcz+HzYCF22Bn1z0GT4cBViakmQgObZUT/yRzQB9aDGM5dURrd9xZ/1ZTjfWLRtGoGKnQNybNuWEbboMxpsY917i71V80bNpngpGkMbBEN/ax5qFFKona0PnyboNtmhCXa88F9YEqAZ5rFwGwumlGJeFAG88+z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749589964; c=relaxed/simple;
	bh=X044dweKfdqiNJePEQ8NSzxkyh+jMlcSMMkmCVs8xz0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aMlIw0QFc9kQmjVc2GAg1h5VPejbEFrLwb4oFWNSAUttP/eSAIQkcKTry9t8b0uQ7lI7KrqeacvvNDmz4jX/0OSKr0yLwl/2xgP7/zUiQe+6r1f7zxxnESOsGaVzirzDzHCaDssnBaH8K/8OkIOyzjwjRENMTM3mj1VyTNo+DII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YN+XPWEs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YN+XPWEs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FB92C4CEF3;
	Tue, 10 Jun 2025 21:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749589964;
	bh=X044dweKfdqiNJePEQ8NSzxkyh+jMlcSMMkmCVs8xz0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YN+XPWEsk+t+wGM0Y/fqajZdXFfw12SM9bsnZtHTvBoXY0ObJFU70VmAWjVObbTVp
	 HZLVDeJfdb93K02lQ3cOQ0QD4yzJbcwM9y+bfgyNuDK3XgCl1xE3zT5EU80/7LZEMU
	 Evxy5/XPsE2KP1VikbeRi1LF4k4wroLps/f2P0tyJXiEnRtJtJIRhlnb6olq0gv2/A
	 Ms0ntyPx4YOKoogJYRQ01uQGBXJeeuFH9htmCiWQtnX1AlC5p8uTcNxmLPRq6gfJH5
	 A8GYagP1vhjqXmHi8i/L+WKu+kztm60mc+nZ5AOw3OzCxcNm/tSVJ1pYWl71U8d9ZM
	 meoOIgyvhbK6Q==
Date: Tue, 10 Jun 2025 14:12:41 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Alexandre Chartre <alexandre.chartre@oracle.com>
Cc: linux-kernel@vger.kernel.org, mingo@kernel.org, peterz@infradead.org
Subject: Re: [RFC 02/13] objtool: Create disassembly context
Message-ID: <ck3keiqat6rbjfuequgihgtiu62weitsaj37dzxvqogotzqyrz@gzkshhu3wdxg>
References: <20250606153440.865808-1-alexandre.chartre@oracle.com>
 <20250606153440.865808-3-alexandre.chartre@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250606153440.865808-3-alexandre.chartre@oracle.com>

On Fri, Jun 06, 2025 at 05:34:29PM +0200, Alexandre Chartre wrote:
> +struct disas_context *disas_context_create(struct objtool_file *file)
> +{
> +	struct disas_context *dctx;
> +
> +	dctx = malloc(sizeof(*dctx));
> +	if (!dctx) {
> +		WARN("failed too allocate disassembly context\n");
> +		return NULL;

"too" -> "to".

Also, no newline needed for objtool warnings/error strings.

Also, might want to use WARN_GLIBC() here.

> +void disas_context_destroy(struct disas_context *dctx)
> +{
> +	free(dctx);
> +}

In general we try to avoid freeing memory in objtool for performance
reasons, though this is the error path so I suppose it's harmless.

> -void disas_warned_funcs(struct objtool_file *file)
> +void disas_warned_funcs(struct disas_context *dctx)
>  {
>  	struct symbol *sym;
>  	char *funcs = NULL, *tmp;
>  
> -	for_each_sym(file, sym) {
> +	if (!dctx) {
> +		ERROR("disassembly context is not defined");
> +		return;

This will have come from the error in disas_context_create(), no need to
print an additional error.

> +++ b/tools/objtool/include/objtool/objtool.h
> @@ -47,6 +47,9 @@ int check(struct objtool_file *file);
>  int orc_dump(const char *objname);
>  int orc_create(struct objtool_file *file);
>  
> -void disas_warned_funcs(struct objtool_file *file);
> +struct disas_context;
> +struct disas_context *disas_context_create(struct objtool_file *file);
> +void disas_context_destroy(struct disas_context *dctx);
> +void disas_warned_funcs(struct disas_context *dctx);

Can these go in a new disas.h file?

-- 
Josh
