Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2394F1F75A9
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 13:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738936754; cv=none; b=R3vEL9FA9YH48FLQ5czqDGoQgozlPKyKUpEAgtdd389hvQcvUmdTXIuVNRrjyEAz3FYDjHpDvqQtOiDrH2/cnFPtyCeUIAMCC5+nlugKD7MH8tmkBH+zJSRnoGCzvImU3Uzz86e1HRt1ewqNVRVehw3iGIsyxVWrvxAdpvvF8Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738936754; c=relaxed/simple;
	bh=0l8kweRthgYGr7UBlp1dQcOEiAVowRzgn/fvw39kwak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B5Nh5H0EvSStUMnx4pmscN4clCrootcDR3VKR+pKEK4Sja/4ZyLcjMa51EGo91woz55607RcR0MYFQ/8zSJGGiGTcYQgQ1CwlU4KlML1QIvviCYeIQ5yrmlT1If5kGat1IDIaODH9UWUMVBlmC3FYPKVeHWR3l4lGdnN1UeQj/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=dp1t04UJ; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="dp1t04UJ"
Date: Fri, 7 Feb 2025 08:58:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738936744;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oH61fgoorFlv6J6tutTmJBpTb7/hGMeEYiEOFwLSzq0=;
	b=dp1t04UJay0KUgcxxmbjZ/1v44d1PCMZxanYmUV2FiMyhwYw94fCXzK683+T3r+ZkffIw8
	4HYsJPnYJRdvakJ01ddjqVCjPj6KKsgwHly2FXKMIkuFM1QZsf5ph1i0l4zqMq4NUZwD0R
	uFboieL8sYwXG3tuOYARGiV6hwwEj20=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Kees Cook <kees@kernel.org>
Cc: Suren Baghdasaryan <surenb@google.com>, 
	Andy Shevchenko <andy@kernel.org>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Philipp Reisner <philipp.reisner@linbit.com>, Miguel Ojeda <ojeda@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 2/3] compiler.h: Introduce __must_be_char_array()
Message-ID: <b3quyvbfszsimhotsooftcssesjc7zi5hci3o4oasz4bnktfzn@l5qpvyt4rj6n>
References: <20250206175216.work.225-kees@kernel.org>
 <20250206181133.3450635-2-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206181133.3450635-2-kees@kernel.org>
X-Migadu-Flow: FLOW_OUT

On Thu, Feb 06, 2025 at 10:11:29AM -0800, Kees Cook wrote:
> In preparation for adding stricter type checking to the str/mem*()
> helpers, provide a way to check that a variable is a character array
> via __must_be_char_array().
> 
> Signed-off-by: Kees Cook <kees@kernel.org>
> ---
>  include/linux/compiler.h | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/compiler.h b/include/linux/compiler.h
> index 7af999a131cb..a577fe0b1f8a 100644
> --- a/include/linux/compiler.h
> +++ b/include/linux/compiler.h
> @@ -221,7 +221,13 @@ void ftrace_likely_update(struct ftrace_likely_data *f, int val,
>  #endif /* __CHECKER__ */
>  
>  /* &a[0] degrades to a pointer: a different type from an array */
> -#define __must_be_array(a)	__BUILD_BUG_ON_ZERO_MSG(__same_type((a), &(a)[0]), "must be array")
> +#define __is_array(a)		(!__same_type((a), &(a)[0]))
> +#define __must_be_array(a)	__BUILD_BUG_ON_ZERO_MSG(!__is_array(a), \
> +							"must be array")
> +
> +#define __is_char_array(a)	(__is_array(a) && sizeof((a)[0]) == 1)
> +#define __must_be_char_array(a)	__BUILD_BUG_ON_ZERO_MSG(!__is_char_array(a), \
> +							"must be byte array")
>  
>  /* Require C Strings (i.e. NUL-terminated) lack the "nonstring" attribute. */
>  #define __must_be_cstr(p) \
> -- 
> 2.34.1
> 

Why not just use a combination of ARRAY_SIZE() and a function call
(to verify that it's a character array) for the typechecking?
