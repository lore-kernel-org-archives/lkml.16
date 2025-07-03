Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E87D1F5838;
	Thu,  3 Jul 2025 15:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751557614; cv=none; b=PW8FfnEz+LLOpYkuTkuKefS1DhNBGwDQEro7A6wb/1scSlk2HiQwe3t+ddRa3ZgIFAmzhIn1AblGEImlUlinXKkhutMULlBRAmdT5EkNeh/58ibkNGe1MLeCQyodCYc8uliUjCe7tle1HvMoYOQVr/RTQElWfTC9x42VHY8hkZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751557614; c=relaxed/simple;
	bh=wweLPN6pTGqewZOtIFO0m6VGIXq1xmCihrcEr6+/nFo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qxuQ9m+ow2r3z+lmHjUxl2zzUawoRvEN/J8u/PudKAvWrxRbeRT3b313/d+hUjphSbWXV1f+Sk+yF4J8iZz4PNXdQMur7epBPiSq3ZaBcpfete3rMW658YNBfGA6ogmBO6y6b20fAQj58nJFRzhmicpMQ++A6u8E0AFXcXabmSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ljFrZ1fH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ljFrZ1fH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDEA6C4CEE3;
	Thu,  3 Jul 2025 15:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751557614;
	bh=wweLPN6pTGqewZOtIFO0m6VGIXq1xmCihrcEr6+/nFo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ljFrZ1fHwuQjMx+aY+x2kcX/A5ziEUrszfWrbTTpgRG5rPjV0bU6PY8Xliqt2tulL
	 mDDI7s2lYZld2IkXXFRrmn7eaOh0YgbOhOET56ksM9IlU3zwP8UIHLEHAdgYBK3mdK
	 6zuxUiEDBR9FEsCX7Dv8G/6AqYXQ0dlaXQEY/0XWFYIA+nWBZF/JqY0Q1qqLrQamFW
	 QXLjMCO6I6/HpM08Yj5U61lV/CphiiR48GWDg4kCQxmVprfTat/27rSUcl1S78SLhx
	 ED8dmBUZ57lJT1y3vhs1pn+DRL6Thg75a9nxmECq51bPn/E0qvygBEqJ5ibETqjwy8
	 hjZjoUK5qJthw==
Date: Thu, 3 Jul 2025 17:46:48 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Akira Yokosawa
 <akiyks@gmail.com>
Subject: Re: [PATCH 4/7] docs: kdoc: rework type prototype parsing
Message-ID: <20250703174648.076087a0@sal.lan>
In-Reply-To: <20250701205730.146687-5-corbet@lwn.net>
References: <20250701205730.146687-1-corbet@lwn.net>
	<20250701205730.146687-5-corbet@lwn.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Tue,  1 Jul 2025 14:57:27 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> process_proto_type() is using a complex regex and a "while True" loop to
> split a declaration into chunks and, in the end, count brackets.  Switch to
> using a simpler regex to just do the split directly, and handle each chunk
> as it comes.  The result is, IMO, easier to understand and reason about.
> 
> The old algorithm would occasionally elide the space between function
> parameters; see struct rng_alg->generate(), foe example.  The only output
> difference is to not elide that space, which is more correct.
> 
> Signed-off-by: Jonathan Corbet <corbet@lwn.net>

LGTM.
Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

> ---
>  scripts/lib/kdoc/kdoc_parser.py | 43 +++++++++++++++++++--------------
>  1 file changed, 25 insertions(+), 18 deletions(-)
> 
> diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
> index 935f2a3c4b47..61da297df623 100644
> --- a/scripts/lib/kdoc/kdoc_parser.py
> +++ b/scripts/lib/kdoc/kdoc_parser.py
> @@ -1594,30 +1594,37 @@ class KernelDoc:
>  
>          # Strip C99-style comments and surrounding whitespace
>          line = KernRe(r"//.*$", re.S).sub('', line).strip()
> +        if not line:
> +            return # nothing to see here
>  
>          # To distinguish preprocessor directive from regular declaration later.
>          if line.startswith('#'):
>              line += ";"
> -
> -        r = KernRe(r'([^\{\};]*)([\{\};])(.*)')
> -        while True:
> -            if r.search(line):
> -                if self.entry.prototype:
> -                    self.entry.prototype += " "
> -                self.entry.prototype += r.group(1) + r.group(2)
> -
> -                self.entry.brcount += r.group(2).count('{')
> -                self.entry.brcount -= r.group(2).count('}')
> -
> -                if r.group(2) == ';' and self.entry.brcount <= 0:
> +        #
> +        # Split the declaration on any of { } or ;, and accumulate pieces
> +        # until we hit a semicolon while not inside {brackets}
> +        #
> +        r = KernRe(r'(.*?)([{};])')
> +        for chunk in r.split(line):
> +            if chunk:  # Ignore empty matches
> +                self.entry.prototype += chunk
> +                #
> +                # This cries out for a match statement ... someday after we can
> +                # drop Python 3.9 ...
> +                #
> +                if chunk == '{':
> +                    self.entry.brcount += 1
> +                elif chunk == '}':
> +                    self.entry.brcount -= 1
> +                elif chunk == ';' and self.entry.brcount <= 0:
>                      self.dump_declaration(ln, self.entry.prototype)
>                      self.reset_state(ln)
> -                    break
> -
> -                line = r.group(3)
> -            else:
> -                self.entry.prototype += line
> -                break
> +                    return
> +        #
> +        # We hit the end of the line while still in the declaration; put
> +        # in a space to represent the newline.
> +        #
> +        self.entry.prototype += ' '
>  
>      def process_proto(self, ln, line):
>          """STATE_PROTO: reading a function/whatever prototype."""
