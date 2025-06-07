Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9965F1F4CB8;
	Sat,  7 Jun 2025 10:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749291083; cv=none; b=ETMuFjP+iOMkzDaPSc/AlBuU6DgO7F4tpxnGPruSiiAqw4iu2DafI+hVNnqJxsj/WBg1StFVYN9509V6Zre/pvo15WHoxd9nFrDjzAOdCDODVTunecKJmuOYQL82ysRwh6k289SZeIOnPLxEWyNu4rphnFy2Cpsw3RIpTLV+3D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749291083; c=relaxed/simple;
	bh=fXsO+sY1TQdxuHjZ7D/ldPyUI6Eq5DROOCyo6WXcORY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m9BTobGcbAfQth/QBVCrCGkOq4Flrgxnz+4na6hDp+ShIvVJhXiYnBSBKC6EKQ3drvvsNxXkf7gkLX6bQi49iFTrOBuDyqi1fgpLCNZzPgsFbcNTwP7bUfx+IArE0W5RmCq8ivt6r8E+aizlMDeEVomA4Y1amhB5W2lKIQXju9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jBo+O3oS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jBo+O3oS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ADBEC4CEF2;
	Sat,  7 Jun 2025 10:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749291083;
	bh=fXsO+sY1TQdxuHjZ7D/ldPyUI6Eq5DROOCyo6WXcORY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=jBo+O3oSyaGh84xg52kSNj+uGbO/hd6yy3yq7W3xs0Pp+5gKQadLJrk9CHNckCn4N
	 00NasTHujgFdLabdqLQ7WYha33FZQPPJV0hrunA+JdTx9xo/E6pNAHtMb7yBTNCac3
	 xAJnkiDOT3vZQ+KvkqU9s7EYvd2vsa6TkCeMo+zJMK8srC8vZjK0pzKC7OKn1+GNTO
	 vmD48QGWQNklVGfhkKLN+X0GCwzdnhy++MLe89VKCppktGsRluAiI9L62N8+cQpaFJ
	 mhQxZdZyyK8fGlHgycDDRUdkPJhR2adKNbzCAZqwv9TSmZfDaO8Ezi+cQdUInJ+kIA
	 q8RGrYCjhDHbw==
Date: Sat, 7 Jun 2025 12:11:19 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 8/9] docs: kdoc: move the declaration regexes out of
 process_name()
Message-ID: <20250607121119.0025047a@foz.lan>
In-Reply-To: <20250606163438.229916-9-corbet@lwn.net>
References: <20250606163438.229916-1-corbet@lwn.net>
	<20250606163438.229916-9-corbet@lwn.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Fri,  6 Jun 2025 10:34:37 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> Move two complex regexes up with the other patterns, decluttering this
> function and allowing the compilation to be done once rather than for every
> kerneldoc comment.
> 
> Signed-off-by: Jonathan Corbet <corbet@lwn.net>

LGTM.
Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

> ---
>  scripts/lib/kdoc/kdoc_parser.py | 30 +++++++++++++++++-------------
>  1 file changed, 17 insertions(+), 13 deletions(-)
> 
> diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
> index 4e1ab28ff7cc..55f38240d4e5 100644
> --- a/scripts/lib/kdoc/kdoc_parser.py
> +++ b/scripts/lib/kdoc/kdoc_parser.py
> @@ -47,7 +47,6 @@ doc_sect = doc_com + \
>                  flags=re.I, cache=False)
>  
>  doc_content = doc_com_body + KernRe(r'(.*)', cache=False)
> -doc_block = doc_com + KernRe(r'DOC:\s*(.*)?', cache=False)
>  doc_inline_start = KernRe(r'^\s*/\*\*\s*$', cache=False)
>  doc_inline_sect = KernRe(r'\s*\*\s*(@\s*[\w][\w\.]*\s*):(.*)', cache=False)
>  doc_inline_end = KernRe(r'^\s*\*/\s*$', cache=False)
> @@ -60,6 +59,18 @@ export_symbol_ns = KernRe(r'^\s*EXPORT_SYMBOL_NS(_GPL)?\s*\(\s*(\w+)\s*,\s*"\S+"
>  
>  type_param = KernRe(r"\@(\w*((\.\w+)|(->\w+))*(\.\.\.)?)", cache=False)
>  
> +#
> +# Tests for the beginning of a kerneldoc block in its various forms.
> +#
> +doc_block = doc_com + KernRe(r'DOC:\s*(.*)?', cache=False)
> +doc_begin_data = KernRe(r"^\s*\*?\s*(struct|union|enum|typedef)\b\s*(\w*)", cache = False)
> +doc_begin_func = KernRe(str(doc_com) +			# initial " * '
> +                        r"(?:\w+\s*\*\s*)?" + 		# type (not captured)
> +                        r'(?:define\s+)?' + 		# possible "define" (not captured)
> +                        r'(\w+)\s*(?:\(\w*\))?\s*' +	# name and optional "(...)"
> +                        r'(?:[-:].*)?$',		# description (not captured)
> +                        cache = False)
> +
>  #
>  # A little helper to get rid of excess white space
>  #
> @@ -1224,22 +1235,15 @@ class KernelDoc:
>          if doc_decl.search(line):
>              self.entry.identifier = doc_decl.group(1)
>  
> -            decl_start = str(doc_com)       # comment block asterisk
> -            fn_type = r"(?:\w+\s*\*\s*)?"  # type (for non-functions)
> -            parenthesis = r"(?:\(\w*\))?"   # optional parenthesis on function
> -            decl_end = r"(?:[-:].*)"         # end of the name part
> -
>              # Test for data declaration
> -            r = KernRe(r"^\s*\*?\s*(struct|union|enum|typedef)\b\s*(\w*)")
> -            r2 = KernRe(fr"^{decl_start}{fn_type}(?:define\s+)?(\w+)\s*{parenthesis}\s*{decl_end}?$")
> -            if r.search(line):
> -                self.entry.decl_type = r.group(1)
> -                self.entry.identifier = r.group(2)
> +            if doc_begin_data.search(line):
> +                self.entry.decl_type = doc_begin_data.group(1)
> +                self.entry.identifier = doc_begin_data.group(2)
>              #
>              # Look for a function description
>              #
> -            elif r2.search(line):
> -                self.entry.identifier = r2.group(1)
> +            elif doc_begin_func.search(line):
> +                self.entry.identifier = doc_begin_func.group(1)
>                  self.entry.decl_type = "function"
>              #
>              # We struck out.



Thanks,
Mauro
