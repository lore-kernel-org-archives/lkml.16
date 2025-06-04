Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D35BD18E1F;
	Wed,  4 Jun 2025 14:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749049014; cv=none; b=eNK2V2ZFkpFK5DIw6eCbAH7Xg75PRNx/1jOSqeqxCYlPU59WtxwoNrEfssm2IBdQFjftq8IC39p4+M2h4+hcz0ufvgiCuLojiV2wKgzEo64OpYAlEzS/Jw3PMI7yiuIGN5PA1OMLZfkQ9+193L0td4+0y4qFVIwst7k6qU0lIRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749049014; c=relaxed/simple;
	bh=wddeUE2/c/FxnoHyLrTHZUffTHhKBZE1KhO8uBpo/Ac=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FGu9GcKoXNPofnayYWbfiAw+NLH61QXnxKB4ikD9i5fHYclRjGUf/sjMR+NJ3A5n6Ljp6Z761VL8b9bqFsOSvTNF0t9yC4wi3AnN3qFd7M1CncaZsseGjYjm9whW/O9cDMNnkE7NY1RiGnJc/2ClqBu4yHiBHD72YmG91WpCzyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SpdMCkGw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SpdMCkGw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24C50C4CEE4;
	Wed,  4 Jun 2025 14:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749049014;
	bh=wddeUE2/c/FxnoHyLrTHZUffTHhKBZE1KhO8uBpo/Ac=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=SpdMCkGw7xuSOebdrjOZyyo1Isa+ob+WBpHXijcGf3x3ke2GkkcbuuCweEI2ZejKV
	 a94JUxvoGoGmhXMI2wcUVX38q3WXHUD5nTsc41naDYFiIbSybcrmP02WDX+MFzqN3+
	 dtlV0VJcdwIlCbuTR7lUPKf9ZJ05X8NdQzbuCvox9VfL4gKPeM6lYT1VtF/oOpC6a4
	 2qSC9Q9OKf1wgJZorBfSrFEJsdQ+VQMGGdQA2OhJKG5vtw7mexp3gr0NRncO21aX8/
	 UNn9syZJHFy6uOE70qD65ekNk9iW5OzSSvYrfeBpq5aNoCP7zwMZKWLaOm8g7B3PPZ
	 zfvNbT7p2xQXw==
Date: Wed, 4 Jun 2025 16:56:49 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, "
 =?UTF-8?B?TsOtY29sYXM=?= F. R. A. Prado" <nfraprado@collabora.com>
Subject: Re: [PATCH v2 1/3] docs: automarkup: Remove some Sphinx 2 holdovers
Message-ID: <20250604165649.5a66cb6b@sal.lan>
In-Reply-To: <20250604143645.78367-2-corbet@lwn.net>
References: <20250604143645.78367-1-corbet@lwn.net>
	<20250604143645.78367-2-corbet@lwn.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Wed,  4 Jun 2025 08:36:43 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> Remove a few declarations that are no longer doing anything now that we
> have left Sphinx 2 behind.
> 
> Signed-off-by: Jonathan Corbet <corbet@lwn.net>

Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

> ---
> v2: Remove RE_generic_type as suggested by Mauro
> 
>  Documentation/sphinx/automarkup.py | 18 ++----------------
>  1 file changed, 2 insertions(+), 16 deletions(-)
> 
> diff --git a/Documentation/sphinx/automarkup.py b/Documentation/sphinx/automarkup.py
> index fd633f7a0bc3..7828aeac92e7 100644
> --- a/Documentation/sphinx/automarkup.py
> +++ b/Documentation/sphinx/automarkup.py
> @@ -22,12 +22,6 @@ from kernel_abi import get_kernel_abi
>  #
>  RE_function = re.compile(r'\b(([a-zA-Z_]\w+)\(\))', flags=re.ASCII)
>  
> -#
> -# Sphinx 2 uses the same :c:type role for struct, union, enum and typedef
> -#
> -RE_generic_type = re.compile(r'\b(struct|union|enum|typedef)\s+([a-zA-Z_]\w+)',
> -                             flags=re.ASCII)
> -
>  #
>  # Sphinx 3 uses a different C role for each one of struct, union, enum and
>  # typedef
> @@ -150,20 +144,12 @@ def markup_func_ref_sphinx3(docname, app, match):
>      return target_text
>  
>  def markup_c_ref(docname, app, match):
> -    class_str = {# Sphinx 2 only
> -                 RE_function: 'c-func',
> -                 RE_generic_type: 'c-type',
> -                 # Sphinx 3+ only
> -                 RE_struct: 'c-struct',
> +    class_str = {RE_struct: 'c-struct',
>                   RE_union: 'c-union',
>                   RE_enum: 'c-enum',
>                   RE_typedef: 'c-type',
>                   }
> -    reftype_str = {# Sphinx 2 only
> -                   RE_function: 'function',
> -                   RE_generic_type: 'type',
> -                   # Sphinx 3+ only
> -                   RE_struct: 'struct',
> +    reftype_str = {RE_struct: 'struct',
>                     RE_union: 'union',
>                     RE_enum: 'enum',
>                     RE_typedef: 'type',
