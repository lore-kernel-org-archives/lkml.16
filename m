Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90FFF23BCF8
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 22:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749595246; cv=none; b=QKCB87XCYX+/ixm1/IE8hcPT4GzCeNupWBv2BXHZWhb0aMVeKuDdzMKZ8NsD4HjSsvcUwoZCd8Aq+skaBgQdnrpU6Xr44uLYy3QfBt1cIvkeVJSVwkAPr+rgOjaFzEX7qciuLMCShV7f8Y23aPjm9Zjr6NESKcurKYYc8x5C984=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749595246; c=relaxed/simple;
	bh=AMCXeZCE4mv1iIMBRl6FN9N8ESNeBQSn43C1XZV8EM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JUJ+YKw9Gvw5wtP/SDryIWqkhj9yegzwHQqlRPQ92nKAoGYWoLPb+c7o+0CZTVeLEoO5avPq8ZLkC8NQ9q+BexOlgJq+f6+fqqasH1e/Shkkt2ZxH6RiJq3rZbfZdoUhXYsKEIoS+vpnx9coX6RaI1gJVfg064u4R5y0fG+Fsvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hWyNNRsd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hWyNNRsd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70532C4CEED;
	Tue, 10 Jun 2025 22:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749595246;
	bh=AMCXeZCE4mv1iIMBRl6FN9N8ESNeBQSn43C1XZV8EM8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hWyNNRsdGrs1q/UaPGcQJK2Bm0DN06ee0o/qXGj90RSpnyGYH/gNGhglW4akybsRL
	 gumXHMqrJeKXpTvE4fbrHxm1Gb4buxMyu5ByM0JmydEAcQASJXsp/6B7XSHS0iVM06
	 TU6Damk031liYf2hXucp0T3/q7GPyStHUXknhdmF8jadF9p/UYPw+5Ex8+Pr9Mhj8J
	 OkCi9NZ8594e7AVqNG0Q2Bv4TcKG6siItIU58BH3BkGdled2adviMc5FpGX0DI5MKi
	 OGNovxWsEM+rgojjqknawFno6PHvRoy5D9xBAto+phtFkK+A+D9l0V0P2mErlDEu2t
	 a+47ljeYW9UCA==
Date: Tue, 10 Jun 2025 15:40:43 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Alexandre Chartre <alexandre.chartre@oracle.com>
Cc: linux-kernel@vger.kernel.org, mingo@kernel.org, peterz@infradead.org
Subject: Re: [RFC 05/13] objtool: Store instruction disassembly result
Message-ID: <h6a3m4kt5qucesxrjq2kdg63hph6zxjfpkodgykifq4ii7iyoa@gziflw3kfe7y>
References: <20250606153440.865808-1-alexandre.chartre@oracle.com>
 <20250606153440.865808-6-alexandre.chartre@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250606153440.865808-6-alexandre.chartre@oracle.com>

On Fri, Jun 06, 2025 at 05:34:32PM +0200, Alexandre Chartre wrote:
> +static int dbuffer_init(struct dbuffer *dbuf, size_t size)
> +{
> +	dbuf->used = 0;
> +	dbuf->size = size;
> +
> +	if (!size) {
> +		dbuf->addr = NULL;
> +		return 0;
> +	}
> +
> +	dbuf->addr = malloc(size);
> +	if (!dbuf->addr)
> +		return -1;
> +
> +	return 0;
> +}
> +
> +static void dbuffer_fini(struct dbuffer *dbuf)
> +{
> +	free(dbuf->addr);
> +	dbuf->size = 0;
> +	dbuf->used = 0;
> +}
> +
> +static void dbuffer_reset(struct dbuffer *dbuf)
> +{
> +	dbuf->used = 0;
> +}
> +
> +static char *dbuffer_data(struct dbuffer *dbuf)
> +{
> +	return dbuf->addr;
> +}
> +
> +static int dbuffer_expand(struct dbuffer *dbuf, size_t space)
> +{
> +	size_t size;
> +	char *addr;
> +
> +	size = dbuf->size + space;
> +	addr = realloc(dbuf->addr, size);
> +	if (!addr)
> +		return -1;
> +
> +	dbuf->addr = addr;
> +	dbuf->size = size;
> +
> +	return 0;
> +}
> +
> +static int dbuffer_vappendf_noexpand(struct dbuffer *dbuf, const char *fmt, va_list ap)
> +{
> +	int free, len;
> +
> +	free = dbuf->size - dbuf->used;
> +
> +	len = vsnprintf(dbuf->addr + dbuf->used, free, fmt, ap);
> +
> +	if (len < 0)
> +		return -1;
> +
> +	if (len < free) {
> +		dbuf->used += len;
> +		return 0;
> +	}
> +
> +	return (len - free) + 1;
> +}
> +
> +static int dbuffer_vappendf(struct dbuffer *dbuf, const char *fmt, va_list ap)
> +{
> +	int space_needed, err;
> +
> +	space_needed = dbuffer_vappendf_noexpand(dbuf, fmt, ap);
> +	if (space_needed <= 0)
> +		return space_needed;
> +
> +	/*
> +	 * The buffer is not large enough to store all data. Expand
> +	 * the buffer and retry. The buffer is expanded with enough
> +	 * space to store all data.
> +	 */
> +	err = dbuffer_expand(dbuf, space_needed * 2);
> +	if (err) {
> +		WARN("failed to expand buffer\n");
> +		return -1;
> +	}
> +
> +	return dbuffer_vappendf_noexpand(dbuf, fmt, ap);
> +}

I don't quite get the need for all this dbuffer stuff.

The buffer only needs to contain the output for a single instruction,
right?  Is there any reason not to just make it a 1k char array which
gets appended via strncat()?  If it exceeds that, it could just print a
warning and truncate the string.

-- 
Josh
