Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23384224FD
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 17:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743960932; cv=none; b=MUU3RYArww+aa2ZB+wRn7by2km4y45pZz93zwGASldcspcD+xn6Q4i7cZCWtsWN9VPybO5WUqKlZVLeaG7hB7Bg/AxroVDRhIgFbZWMLKBYK0xtSBk40Q/QTrdO1OgOtaG9K/gcn998OQ6uYtAStw3Y+ATy3Nk5EtSuPfiAjuZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743960932; c=relaxed/simple;
	bh=92qJqoVZTJVQujxtrIm9byz8jxkfU+wopu23VnfZoPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jFzmjX8QJBgKeMqvR/tQLOMlnwZypQ7ZU1bs/63j3HZGVOwMk9DyWYM/cVY0HN4ckB2P60qjNdhieWHmDorta8gA+Ot3JBn0GwJvo7xa+0QKv34nxiLDoYzkEp39SPYQ1jCzkI1UO+pkFWVu8WJscJEY+FxEenEqIU/uRZg0Ou8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=neMmzBVl; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="neMmzBVl"
Date: Sun, 6 Apr 2025 13:35:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1743960928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=f4qfx8DHHSDnNQLtzm2SGLL+CYaWWhf/6Fc09qy8pKE=;
	b=neMmzBVlZkrz+uCrdNYKL8hXqIz5kHoBcDmDZImuUTBd/2fH0+Psb8TLbSfIMd3/WY0t4j
	tY06G6K3b4+n6wQxO5IuN0aRBTDGUPTmD3c1b3FEUJDKTKrerKpdj2wPkmIS7kg0kgMZo5
	gRrRpctMAGQ/Y73cE3HN2MaqiyoZSsA=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Integral <integral@archlinuxcn.org>
Cc: Kent Overstreet <kent.overstreet@gmail.com>, 
	linux-bcachefs@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] bcachefs: split error messages of invalid
 compression into two lines
Message-ID: <i2tzjbfyzxdymkbebyla3oqo5krj3mknpixtb54ojnaeqpg57t@vbiexo6jmkig>
References: <20250406152659.205997-2-integral@archlinuxcn.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250406152659.205997-2-integral@archlinuxcn.org>
X-Migadu-Flow: FLOW_OUT

On Sun, Apr 06, 2025 at 11:26:59PM +0800, Integral wrote:
> When an invalid compression type or level is passed as an argument
> to `--compression`, two error messages are squashed into one line:
> 
>     > bcachefs format --compression=lzo bcachefs-comp.img
>     invalid option: invalid compression typecompression: parse error
> 
>     > bcachefs format --compression=lz4:16 bcachefs-comp.img
>     invalid option: invalid compression levelcompression: parse error
> 
> To resolve this issue, add a newline character at the end of the
> first error message to separate them into two lines.
> 
> Signed-off-by: Integral <integral@archlinuxcn.org>

Applied

I've also been working on consistent indentation for multiline error/log
messages, so that we can see grouping better.

If you want to add that, the new helper is

  printbuf_indent_add_nextline()

With that we can initialize a printbuffer and at the same time set it so
that lines after the first are two space indented.

> ---
>  fs/bcachefs/compress.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/bcachefs/compress.c b/fs/bcachefs/compress.c
> index 28ed32449913..d68c3c7896a3 100644
> --- a/fs/bcachefs/compress.c
> +++ b/fs/bcachefs/compress.c
> @@ -714,7 +714,7 @@ int bch2_opt_compression_parse(struct bch_fs *c, const char *_val, u64 *res,
>  
>  	ret = match_string(bch2_compression_opts, -1, type_str);
>  	if (ret < 0 && err)
> -		prt_str(err, "invalid compression type");
> +		prt_str(err, "invalid compression type\n");
>  	if (ret < 0)
>  		goto err;
>  
> @@ -729,7 +729,7 @@ int bch2_opt_compression_parse(struct bch_fs *c, const char *_val, u64 *res,
>  		if (!ret && level > 15)
>  			ret = -EINVAL;
>  		if (ret < 0 && err)
> -			prt_str(err, "invalid compression level");
> +			prt_str(err, "invalid compression level\n");
>  		if (ret < 0)
>  			goto err;
>  
> -- 
> 2.49.0
> 
