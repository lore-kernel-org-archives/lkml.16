Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0AC23BF91;
	Fri,  9 May 2025 21:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746827092; cv=none; b=oiE6Flc0QpB4iDbGPkA8+rM5zY+HRruEJfB+pdT/Ny9SAb0LaKPzlz/h+rUW7R+HlAfZy0GiseH69Lg/2TWYdpy6IiWESQaGTA6N7RS7J3LA7/09Uq79Hvw2emRI3rsfvuewlstopdSkoevf1KD8GPYhIPFTRJ02rwAY4whXTvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746827092; c=relaxed/simple;
	bh=ZQJPUtFwkixY7pMzGPDnOsK4+dBWxrmYnqSkzFl4BPk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f2vBPcp1lAqOwLcHvi2QsX/6lhzAPTaHfmB9NPmOWEPDgkORVCjsHEfQm/sfJU/LW40x6vkdsmKa26PZmAvUkjiuOng3BC2uvTdrps1N7AAMMJYdy3IgvhM0orQ6ngqyPSqueWZ173ksxf4NevCSycGZN5t19IjpHnabHJ0s9As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=FNeFPHKg; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="FNeFPHKg"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=OWVYsUIAExeYrgYEnP29MrWeFmitpmwgyrZUuJbMqMo=; b=FNeFPHKgpgiLJl6Wv/+Rur/F0S
	oUm2iVq2v7/4t0neRIY3navG5l6T7lp4r+tcQXasfnWpT7/7O0c7aao06d/5at7RUiSqoFZcSGAoO
	qUX+CpZzBk3p2zgOsjn3j9skY4Ek886nc0wX/soR3RTcN/ZJOY54kkzeGt927cNgDB3+B/W2aCRal
	fiYYLvjV0QpmBQKrl6SGt5o0ArDQDId8Np0tM3mbTMYc4NgQLK8ffkOZOnkzL+OYjOGHQNNq8xuba
	Z+h6ulCRExhmel1COJ2t6kGxo92mOPLz4z4oFhYkvK2Bre78JtxX5sVqLAQ5AYTCnhaEbUT7T2BH9
	3Za371MA==;
Received: from [50.39.124.201] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uDVWM-0000000GMaL-0yYG;
	Fri, 09 May 2025 21:44:43 +0000
Message-ID: <1a03fcbd-151f-4bba-828f-d6aaf40e4116@infradead.org>
Date: Fri, 9 May 2025 14:44:31 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] CodingStyle: flip the rule about curlies
To: Alexey Dobriyan <adobriyan@gmail.com>, corbet@lwn.net
Cc: workflows@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250509203430.3448-1-adobriyan@gmail.com>
 <20250509203430.3448-9-adobriyan@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250509203430.3448-9-adobriyan@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/9/25 1:34 PM, Alexey Dobriyan wrote:
> Require set of curlies {} in all if/else branches and all loops
> not matter how simple.
> 
> The rationale is that maintaining curlies increases churn and make
> patches bigger when those if/else branches grow and shrink so it is
> easier to always add them.
> 
> There are more important things in life than herding curlies.
> 
> Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
> ---
>  Documentation/process/coding-style.rst | 57 +++++++++++++++-----------
>  1 file changed, 32 insertions(+), 25 deletions(-)
> 
> diff --git a/Documentation/process/coding-style.rst b/Documentation/process/coding-style.rst
> index 494ab3201112..dc18ff40ebf2 100644
> --- a/Documentation/process/coding-style.rst
> +++ b/Documentation/process/coding-style.rst
> @@ -280,43 +280,50 @@ supply of new-lines on your screen is not a renewable resource (think
>  25-line terminal screens here), you have more empty lines to put
>  comments on.
>  
> -Do not unnecessarily use braces where a single statement will do.
> +All ``if``, ``for``, ``do``-``while``, ``switch`` and ``while`` statements
> +use braces even when C grammar allows to omit them:
>  
>  .. code-block:: c
>  
> -	if (condition)
> -		action();
> -
> -and
> -
> -.. code-block:: c
> -
> -	if (condition)
> -		do_this();
> -	else
> -		do_that();
> -
> -This does not apply if only one branch of a conditional statement is a single
> -statement; in the latter case use braces in both branches:
> +	if (cond) {
> +		t();
> +	}
>  
> -.. code-block:: c
> +	if (cond) {
> +		t();
> +	} else {
> +		f();
> +	}
>  
> -	if (condition) {
> -		do_this();
> -		do_that();
> +	if (cond1) {
> +		t1();
> +	} else if (cond2) {
> +		t2();
>  	} else {
> -		otherwise();
> +		f();
>  	}
>  
> -Also, use braces when a loop contains more than a single simple statement:
> +	for (int i = 0; i < N; i += 1) {
> +		f(i);
> +	}
>  
> -.. code-block:: c
> +	do {
> +		g();
> +	} while (0);
>  
> -	while (condition) {
> -		if (test)
> -			do_something();
> +	switch (x) {
> +	case X1:
> +		f();
>  	}
>  
> +	while (1) {
> +		f();
> +	}
> +
> +In the future, code will be added and deleted but braces stay untouched.
> +Maitaining them when if branches, loop bodies grow and shrink is useless

   Maintaining

> +busywork not even worthy of discussion.
> +
>  Spaces
>  ******
>  

-- 
~Randy

