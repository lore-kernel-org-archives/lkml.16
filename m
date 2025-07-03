Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5CEA222561;
	Thu,  3 Jul 2025 15:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751557711; cv=none; b=PxljARkuNUk5NXuL5PA8ajcPc1gkBwudsQmRVXT+f70k0BjlTAeI1vq1e7GSCtdX0utrhto0fBm3+fBQyNfIogy3ZGMPYiLN42SnrGJKtewF3o9zy/oGeFERFQbM376JRhUUF+aVAQGr7nA8uk85/zCdrZncOSepnBo4FE3/O9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751557711; c=relaxed/simple;
	bh=YUlTJubogaVf8vWj1k/2MOXltbdxw8OZ6jbDvUZH18w=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Hzba12wo+yx4BSp4ddJ3wfaFSajLBz6TuzYQH055cL+OqY7dQ3Ymi6yRzAnw4+3WZRlX47HhsmxF3wc4COyf/Yicr8tU9u+t7u3zzeAbVJKQNNjapAOhBzlS1T0ygn4Nhx0VMjixbIK1IQPxwFUkswjfUs3MVTilgk4aEIRE2cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qU15Kbaj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qU15Kbaj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F511C4CEE3;
	Thu,  3 Jul 2025 15:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751557710;
	bh=YUlTJubogaVf8vWj1k/2MOXltbdxw8OZ6jbDvUZH18w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qU15KbajMFLSqQVlloVOL5FLJHO/bXA5Ov0oN/Go7Z4/X/NBfzcZ2QBl30D2Qlmk0
	 sK5vu3Hod31ReB7adwpJgFQMsBgigAuXQkAuibQpX8ETTFhzKsEdp2C8brdzTyPuTU
	 M+QE201pkGGtYgqjHkAy/qeByMvIs1XxlfzefT46yCPNN0GxaXEHC7RF3znz8FmdY0
	 2wS2VArRIX6t2IO3IgzMhGD1915VAQs7qByAUoqgsw6g8sbxcPSV8nGOlTdb44evsq
	 OvPdcLRlTH4x25E6nF8FcilhxwOG6IohKVFBWpJeImmSBGQH88Rx1aHgDq9BDpmOoq
	 NvGPptewnrnaQ==
Date: Thu, 3 Jul 2025 17:48:24 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Akira Yokosawa
 <akiyks@gmail.com>
Subject: Re: [PATCH 5/7] docs: kdoc: some tweaks to process_proto_function()
Message-ID: <20250703174824.5dcb22f0@sal.lan>
In-Reply-To: <20250701205730.146687-6-corbet@lwn.net>
References: <20250701205730.146687-1-corbet@lwn.net>
	<20250701205730.146687-6-corbet@lwn.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Tue,  1 Jul 2025 14:57:28 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> Add a set of comments to process_proto_function and reorganize the logic
> slightly; no functional change.
> 
> Signed-off-by: Jonathan Corbet <corbet@lwn.net>

LGTM.
Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

> ---
>  scripts/lib/kdoc/kdoc_parser.py | 43 ++++++++++++++++++---------------
>  1 file changed, 24 insertions(+), 19 deletions(-)
> 
> diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
> index 61da297df623..d5ef3ce87438 100644
> --- a/scripts/lib/kdoc/kdoc_parser.py
> +++ b/scripts/lib/kdoc/kdoc_parser.py
> @@ -1553,39 +1553,44 @@ class KernelDoc:
>          """Ancillary routine to process a function prototype"""
>  
>          # strip C99-style comments to end of line
> -        r = KernRe(r"\/\/.*$", re.S)
> -        line = r.sub('', line)
> -
> +        line = KernRe(r"\/\/.*$", re.S).sub('', line)
> +        #
> +        # Soak up the line's worth of prototype text, stopping at { or ; if present.
> +        #
>          if KernRe(r'\s*#\s*define').match(line):
>              self.entry.prototype = line
> -        elif line.startswith('#'):
> -            # Strip other macros like #ifdef/#ifndef/#endif/...
> -            pass
> -        else:
> +        elif not line.startswith('#'):   # skip other preprocessor stuff
>              r = KernRe(r'([^\{]*)')
>              if r.match(line):
>                  self.entry.prototype += r.group(1) + " "
> -
> +        #
> +        # If we now have the whole prototype, clean it up and declare victory.
> +        #
>          if '{' in line or ';' in line or KernRe(r'\s*#\s*define').match(line):
>              # strip comments and surrounding spaces
> -            r = KernRe(r'/\*.*\*/')
> -            self.entry.prototype = r.sub('', self.entry.prototype).strip()
> -
> +            self.entry.prototype = KernRe(r'/\*.*\*/').sub('', self.entry.prototype).strip()
> +            #
>              # Handle self.entry.prototypes for function pointers like:
>              #       int (*pcs_config)(struct foo)
> -
> +            # by turning it into
> +            #	    int pcs_config(struct foo)
> +            #
>              r = KernRe(r'^(\S+\s+)\(\s*\*(\S+)\)')
>              self.entry.prototype = r.sub(r'\1\2', self.entry.prototype)
> -
> +            #
> +            # Handle special declaration syntaxes
> +            #
>              if 'SYSCALL_DEFINE' in self.entry.prototype:
>                  self.entry.prototype = self.syscall_munge(ln,
>                                                            self.entry.prototype)
> -
> -            r = KernRe(r'TRACE_EVENT|DEFINE_EVENT|DEFINE_SINGLE_EVENT')
> -            if r.search(self.entry.prototype):
> -                self.entry.prototype = self.tracepoint_munge(ln,
> -                                                             self.entry.prototype)
> -
> +            else:
> +                r = KernRe(r'TRACE_EVENT|DEFINE_EVENT|DEFINE_SINGLE_EVENT')
> +                if r.search(self.entry.prototype):
> +                    self.entry.prototype = self.tracepoint_munge(ln,
> +                                                                 self.entry.prototype)
> +            #
> +            # ... and we're done
> +            #
>              self.dump_function(ln, self.entry.prototype)
>              self.reset_state(ln)
>  
