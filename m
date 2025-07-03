Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A145A2E266F;
	Thu,  3 Jul 2025 15:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751557414; cv=none; b=ntK4mjdM4hfrEZsY2snknG8+iQq0pkLExRi8ARoICf9eo3xXZzAitRbSfaPVvmwKFGv7lB7nctYeeseqaoZifl76Dqz6e2lHm1sXPArVrU7BiWO6EyNvdrA/exttYNvZ5+6aZR4YcFElQI7ODbV47Vc44ocb13VM7BZaqhY3ChE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751557414; c=relaxed/simple;
	bh=az2rIwGdl6t842Nu7l3Tkn+KoW+i7GU7/1TZe7tvuQk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DbCjCLXzJTZXmX1V0cAL6pIA1DBpjFLZM9ORh2HyolNVwLElW1i/7S27RmQb5OybB0SPKKjy8RVnQVcaIcjnSUpUvCZgbtzJPoNr+MyF7vxe2lmgxo+Urf0CbmVjl+EHDqAg6MQWh/4/RNQXQ9dL9MtFSeGL9anGs5Brx0GIkSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jed8d0Gl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jed8d0Gl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73AE0C4CEED;
	Thu,  3 Jul 2025 15:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751557414;
	bh=az2rIwGdl6t842Nu7l3Tkn+KoW+i7GU7/1TZe7tvuQk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Jed8d0GlNEXmgn8XDlCflgldR1i5dqrgK08WHMLk/6mCz+k+tbdm72zxrZPXpBkvz
	 NPcqvMcSz+uyHJOwYJKjW3+UzpqcCxLyYWOf3ogcU0UvljclM1UN0z6FnIM+H7/5TL
	 nLYE/vQVVcicHV+fSl5QzCgB6u3WPxvfnCp+jZC05ySvwVFZqJVIoXjPAJSLjTG6uF
	 /z/TMZYnUVDJniKvwEBsf63O3WLrKg/rK8uNC/t6kcx9Ws928m3SpnCB4vgCWtoPmg
	 pXhP5XAXp2ejLAK5uJVFCaDIAnLOOD/SRLyWEsyefrM3eXnYqIe4qumBlHqPVaq4Aw
	 XKy6AuNxtafvw==
Date: Thu, 3 Jul 2025 17:43:28 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Akira Yokosawa
 <akiyks@gmail.com>
Subject: Re: [PATCH 1/7] docs: kdoc: don't reinvent string.strip()
Message-ID: <20250703174328.059685e7@sal.lan>
In-Reply-To: <20250701205730.146687-2-corbet@lwn.net>
References: <20250701205730.146687-1-corbet@lwn.net>
	<20250701205730.146687-2-corbet@lwn.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Tue,  1 Jul 2025 14:57:24 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> process_proto_type() and process_proto_function() reinventing the strip()
> string method with a whole series of separate regexes; take all that out
> and just use strip().
> 
> The previous implementation also (in process_proto_type()) removed C++
> comments *after* the above dance, leaving trailing whitespace in that case;
> now we do the stripping afterward.  This results in exactly one output
> change: the removal of a spurious space in the definition of
> BACKLIGHT_POWER_REDUCED - see
> https://docs.kernel.org/gpu/backlight.html#c.backlight_properties.
> 
> I note that we are putting semicolons after #define lines that really
> shouldn't be there - a task for another day.

Perhaps add a FIXME note for us to not forget again about this.

> 
> Signed-off-by: Jonathan Corbet <corbet@lwn.net>

Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

> ---
>  scripts/lib/kdoc/kdoc_parser.py | 27 +++++----------------------
>  1 file changed, 5 insertions(+), 22 deletions(-)
> 
> diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
> index 93938155fce2..d9ff2d066160 100644
> --- a/scripts/lib/kdoc/kdoc_parser.py
> +++ b/scripts/lib/kdoc/kdoc_parser.py
> @@ -1567,17 +1567,9 @@ class KernelDoc:
>                  self.entry.prototype += r.group(1) + " "
>  
>          if '{' in line or ';' in line or KernRe(r'\s*#\s*define').match(line):
> -            # strip comments
> -            r = KernRe(r'/\*.*?\*/')
> -            self.entry.prototype = r.sub('', self.entry.prototype)
> -
> -            # strip newlines/cr's
> -            r = KernRe(r'[\r\n]+')
> -            self.entry.prototype = r.sub(' ', self.entry.prototype)
> -
> -            # strip leading spaces
> -            r = KernRe(r'^\s+')
> -            self.entry.prototype = r.sub('', self.entry.prototype)
> +            # strip comments and surrounding spaces
> +            r = KernRe(r'/\*.*\*/')
> +            self.entry.prototype = r.sub('', self.entry.prototype).strip()
>  
>              # Handle self.entry.prototypes for function pointers like:
>              #       int (*pcs_config)(struct foo)
> @@ -1600,17 +1592,8 @@ class KernelDoc:
>      def process_proto_type(self, ln, line):
>          """Ancillary routine to process a type"""
>  
> -        # Strip newlines/cr's.
> -        line = KernRe(r'[\r\n]+', re.S).sub(' ', line)
> -
> -        # Strip leading spaces
> -        line = KernRe(r'^\s+', re.S).sub('', line)
> -
> -        # Strip trailing spaces
> -        line = KernRe(r'\s+$', re.S).sub('', line)
> -
> -        # Strip C99-style comments to the end of the line
> -        line = KernRe(r"\/\/.*$", re.S).sub('', line)
> +        # Strip C99-style comments and surrounding whitespace
> +        line = KernRe(r"//.*$", re.S).sub('', line).strip()
>  
>          # To distinguish preprocessor directive from regular declaration later.
>          if line.startswith('#'):
