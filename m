Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676E521A444;
	Sat,  7 Jun 2025 10:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749290982; cv=none; b=H0LwqgHMdxmVB6oGTXKJCwYiF+HcjzqDRgQdm/pqbZ7ROxKTEsNfiReDecBXYyIP6Wdt+QbavgkI2m7j87fiGxOnOyhLLx2TooM52zcpS64W54MRRm2e8ZNfsT1rv7d4IUwrmjfK19pPiIXvLh7FkjWEP+YSAahdAgZLEf1PxYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749290982; c=relaxed/simple;
	bh=VMsQayFX102UkoPt3qodDOypbtznneShqFEWMuHjzPo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L9YcHD0sbiT5RoHfp5Bz8ULCLzMItFcVjdEeHPTo25okcL2OKCp1Ob1R/pMFQGXBJOpahaVB0HATBppphFk9Jq/aP47UQviTM9jOUBHmtdt7IYr/UcYtlbGRDdbGOE6jf2BaOK3dBeSqytL0bu89/3RtL3/qb4sCsibp2e0EhKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dLkHTLCB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dLkHTLCB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06BF0C4CEE4;
	Sat,  7 Jun 2025 10:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749290981;
	bh=VMsQayFX102UkoPt3qodDOypbtznneShqFEWMuHjzPo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dLkHTLCBqvw/hU1WE8L9Gd5geoejaFfwb24JwmsECZZM9rCyxzgEutCPhiItjtIZk
	 PDiGt68zdhAeN8G2C8HJFzHi7NhAD99ZuyUch+mjXPHssSh33fhWcXxJhYbULYckU2
	 e87JvrhthpjJQALdYTvHPhUb0GHJKwyMJD7CeLN2nIeGLUFoP1pji/uz0Q+K1WTv7B
	 hNsjbieEocHBD8R/YI5JaZMp6g9Gvq+q7YRQCSbncv3w+w6T6FdotOyIORA6CLtNhj
	 Az8xs8Y9bH8Ait0r2/y850Uho+wJD7CMkKxR7pt+laXPhvXT1wte+ECz7ZEmLnuuQL
	 0Wbg3fSqNV1vw==
Date: Sat, 7 Jun 2025 12:09:37 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/9] docs: kdoc: remove some ineffective code
Message-ID: <20250607120937.43e90c7e@foz.lan>
In-Reply-To: <20250606163438.229916-8-corbet@lwn.net>
References: <20250606163438.229916-1-corbet@lwn.net>
	<20250606163438.229916-8-corbet@lwn.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Fri,  6 Jun 2025 10:34:36 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> The code testing for a pointer declaration in process_name() has no actual
> effect on subsequent actions; remove it.
> 
> Signed-off-by: Jonathan Corbet <corbet@lwn.net>
> ---
>  scripts/lib/kdoc/kdoc_parser.py | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
> index 7c635000f3de..4e1ab28ff7cc 100644
> --- a/scripts/lib/kdoc/kdoc_parser.py
> +++ b/scripts/lib/kdoc/kdoc_parser.py
> @@ -1229,11 +1229,6 @@ class KernelDoc:
>              parenthesis = r"(?:\(\w*\))?"   # optional parenthesis on function
>              decl_end = r"(?:[-:].*)"         # end of the name part
>  
> -            # test for pointer declaration type, foo * bar() - desc
> -            r = KernRe(fr"^{decl_start}([\w\s]+?){parenthesis}?\s*{decl_end}?$")
> -            if r.search(line):
> -                self.entry.identifier = r.group(1)
> -

I'm almost sure this was added at the Perl version to catch some corner
case. If this not need anymore, better to strip ;-)

Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

>              # Test for data declaration
>              r = KernRe(r"^\s*\*?\s*(struct|union|enum|typedef)\b\s*(\w*)")
>              r2 = KernRe(fr"^{decl_start}{fn_type}(?:define\s+)?(\w+)\s*{parenthesis}\s*{decl_end}?$")



Thanks,
Mauro
