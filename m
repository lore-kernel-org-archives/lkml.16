Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C4E9261593;
	Tue, 11 Feb 2025 18:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739297604; cv=none; b=UIuD6HyzVaHpAU2OgQPx+bcX8xVEZ/6t8MTXZn8UiRqy1slM+PKaGpzp2+LqUSI5Z9iCFwCcbGR8sCixebp4PuIlt/ZUHQuhrTsGb6o9yjRDoiV6wtc6kPNp6L7DrKw/GBpkfXcLEHxO1gyT2W+XNJRzP9CK1pMfvtrWqGpEbe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739297604; c=relaxed/simple;
	bh=+AgoKUkUA1Aak2TOcIIsxbA5qPyG6rp4BgyXUt9iMW8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jx3asLgdO4yRKg8Yk0X7pT3xQpyRJCNwYli3NG1sH+91A8PowJcmRCGEG1Qtt7JAWFULJXlZpkyKL4xMUrXHtaAynlcV3E/VNOqqu4vmSMJYnkBecr8gb6Go7LcFeUP+YdNVn8sheq0tdFDclkgzHndhVazsafufJPPSjTl1XbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K4vm0b15; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K4vm0b15"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85AC0C4CEDD;
	Tue, 11 Feb 2025 18:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739297604;
	bh=+AgoKUkUA1Aak2TOcIIsxbA5qPyG6rp4BgyXUt9iMW8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K4vm0b15XQ5kwyLLu6DoSfoLae4vDqmf3DJZKoBSRUA8AYEf8xpj2ttomMvXUjdMp
	 iK9tkDuKuwr9hiv/qMuBVdEzP1jYWn8evm7q5wXSfhYFRNdT5AkTma7JYmUBPDXNe/
	 EayiSFnwiMTH6w5PMtq2vuTuXVPeMZeyMR3vYxAemTZ35Xn4CHiG3qIRyLjvDV5c4R
	 K7xJ307cMRS3d9tco0m9hGbX5bTsZy9ey4u/vWKaM8vjEXo+Hp1DRRCTFzl0cU7w73
	 kLc4qwOAhhN/YyjEe4QkKz9pzm8aKpqUaugCnds2BMq1mxT1m++xG+R5ioKCBuPndR
	 CE5Kn3Ch4mEJQ==
Date: Tue, 11 Feb 2025 13:13:19 -0500
From: Nathan Chancellor <nathan@kernel.org>
To: Michael Riesch <michael.riesch@wolfvision.net>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH 1/2] clang-format: do not allow short enums on a single
 line
Message-ID: <20250211181319.GA2995885@ax162>
References: <20250210-clang-format-fixes-v1-0-9bcf43a4b4b2@wolfvision.net>
 <20250210-clang-format-fixes-v1-1-9bcf43a4b4b2@wolfvision.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210-clang-format-fixes-v1-1-9bcf43a4b4b2@wolfvision.net>

On Mon, Feb 10, 2025 at 09:21:00AM +0100, Michael Riesch wrote:
> clang-format 11 introduced the option "AllowShortEnumsOnASingleLine".
> Set it to "false" in order to avoid short enums of the form:
> 
>     enum my_short_num { green, red };
> 
> With the option set to "false", they will be converted to
> 
>     enum my_short_num {
>             green,
>             red
>     };
> 
> which is consistent with the definition of enums with more items.
> 
> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>

Seems reasonable to me.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  .clang-format | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/.clang-format b/.clang-format
> index fe1aa1a30d40..8040b516185b 100644
> --- a/.clang-format
> +++ b/.clang-format
> @@ -19,6 +19,7 @@ AlignTrailingComments: false
>  AllowAllParametersOfDeclarationOnNextLine: false
>  AllowShortBlocksOnASingleLine: false
>  AllowShortCaseLabelsOnASingleLine: false
> +AllowShortEnumsOnASingleLine: false
>  AllowShortFunctionsOnASingleLine: None
>  AllowShortIfStatementsOnASingleLine: false
>  AllowShortLoopsOnASingleLine: false
> 
> -- 
> 2.34.1
> 
