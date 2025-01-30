Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2976319006F
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 08:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738225012; cv=none; b=MmwGx2pROIEVLwqZgS+0vvwR3LDOYJk2ujsnHP5+pf1qlfG7x59WGxCZI/j2uHHz7n1ybM/s+IkDhZVmFzy+fmezCUon+CmXDcsEuWpV2b04hDcNeI1VgjqHohrZwR3VMQzEcLzKbi3eZzSvFtNkNFIK7N+dWOdufx3eu+6QYhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738225012; c=relaxed/simple;
	bh=thFpIKSrzc48zBWfFcfPLiqFrhjEdaU6F0FW+zf4rsM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jqrPDlL+VIoMCLuJa7yJyGHTC75zTPjjGR3Jgt7YPtE9nu3vQe/4Qcrj2wsc+YSMSFsRBcyhd8QgzcQHXmHPraMcYuptcmtb8/45c+kPrKmfXZ3gZuWccbBhN8M/9A1wV6c18qj30yMT3OcgLRete92B/XFM9jAByrWpdMtFNpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g3zFRLgg; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g3zFRLgg"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4361e89b6daso2898965e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 00:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738225007; x=1738829807; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HbemEf+xhUc2mT3lWThkeJWiexh/Of8vPXBaz6+0qAg=;
        b=g3zFRLggPFw0YtjBkN6YnEFRlZMZW9LTQXOBwWWYMPG0QndvItFdHI8KWn5lFbs+Fg
         mNGM8mryHwjJFpsBw8gluchHkA5fqxMlaYGBojfjn3MbH7KX3DNRSKrnOmIuj8HrrpSy
         Rw4hFUZjbTp+8unK9frVIWeWY60yGLOhxL1heS3pt6edPBh9ge/EXqIq+bX3T7SoZjIH
         j3HiatdDWSBG24X59yvSKGI58SKls9nukbw9oL02TfJ/Tsw2WYzoCO2SAzBDM+xLqHxQ
         7knVL4nsCO2RMAN1ifT0SGVLfUG7ln+VLGpxMvcV49U2TaTqawi79z2nRUtmk8x3qA6U
         iiIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738225007; x=1738829807;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HbemEf+xhUc2mT3lWThkeJWiexh/Of8vPXBaz6+0qAg=;
        b=UPzX0M2h6wXqcXDYcQAcje9erhvNz3NKHv48xFwsi6YygCtfN5xI+LPdeEw5IOJjeU
         de8VXwV7Ti+dtDf+MsHVK7gR10xJnrnuqgyNzK072cfdwXqc7uw3Ct6fR/r9w1eQbBZI
         LSIMnZLPnq+Ohir3esImVqhRVttkNrJlv5qF2w/oYweplYyG6PX2QLtO2bVb2q0LjpU7
         gFl0bkzZjbZJaw2w0VqO0aPERnQ0KbtVddZIFynIIXlSjJ4WZ05x1R2mrhIN46OuRTIz
         dZd/Qmry/TQ4vxg5WmOzXRkNJyk0iUiXj3OzqvhwXuZftkUA93561HSuRp4JFwmYXUn0
         A0XA==
X-Forwarded-Encrypted: i=1; AJvYcCWAh/VQlSCHmVWxnbIK1jfl7+0i05vqV3xotjilKQ0vWcZIWjWmjqRU88TqEYgUxOawxWguN6+Y3QiVOxs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGujtBe3Iwbmio2/Vp/R/2m9Cwl/ctzWQLnCgmlLGZFI7/hYWT
	Iq5D8lAcrkH3biPnSBL5tSqTVaQlQHhG+TzjqGqqbfJrq00GbdAjELtySvzL6DE=
X-Gm-Gg: ASbGncsOjayIUtPj84sxyGoAncLQqk1FleUN9htD6iBBkLfIBXFXdyDczWlCNAICC8D
	Q8XF+65+QAMsboRpcB1nFO4LjQkNlvA1VOfN7EolXcXoVRpCNOdV5FmMr0/hPuA9MLouDz7UHiU
	7SoUieruofYBe3M188QxV9ZjvVXYkLUGCdx8t3liiLqTqr1t+0B6eCvkhMeu786zbphay0iO2AY
	lUL7iLYURbRkEAyQ1cNfZMg4L2bls0EUyJAUi1TlJo/GHE5gE8Nnv4r6fES8QV+QOdly5gLd688
	nVFh5WnQGqB0rNyh/m30
X-Google-Smtp-Source: AGHT+IHhtr9w91Nho4TPvuAAvm8MqwAGRZsNV86QLdJ6VOdB7b7cJnCAZnjkLka/hqqB6XtKlVfCAg==
X-Received: by 2002:a05:600c:870a:b0:434:a7b6:10e9 with SMTP id 5b1f17b1804b1-438dc3cbadcmr53604745e9.17.1738225007382;
        Thu, 30 Jan 2025 00:16:47 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc6df1esm50323705e9.27.2025.01.30.00.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 00:16:46 -0800 (PST)
Date: Thu, 30 Jan 2025 11:16:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: kernel test robot <lkp@intel.com>
Cc: Dan Carpenter <error27@gmail.com>,
	Steffen Klassert <steffen.klassert@secunet.com>,
	oe-kbuild-all@lists.linux.dev,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH net] xfrm: fix integer overflow in
 xfrm_replay_state_esn_len()
Message-ID: <f86c7660-0910-4ca2-9ff9-d2d142a968c7@stanley.mountain>
References: <018ecf13-e371-4b39-8946-c7510baf916b@stanley.mountain>
 <202501230035.cFbLTHtZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202501230035.cFbLTHtZ-lkp@intel.com>

I've added linux-hardening to the CC.

This is a fortify false positive.  I can't reproduce it on x86 with
gcc-14.  Perhaps it only affect mips?  It's a W=1 warning so it shouldn't
be a blocker in that sense.

regards,
dan carpenter

On Thu, Jan 23, 2025 at 12:53:14AM +0800, kernel test robot wrote:
> Hi Dan,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on net/main]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Dan-Carpenter/xfrm-fix-integer-overflow-in-xfrm_replay_state_esn_len/20250121-191827
> base:   net/main
> patch link:    https://lore.kernel.org/r/018ecf13-e371-4b39-8946-c7510baf916b%40stanley.mountain
> patch subject: [PATCH net] xfrm: fix integer overflow in xfrm_replay_state_esn_len()
> config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20250123/202501230035.cFbLTHtZ-lkp@intel.com/config)
> compiler: mips-linux-gcc (GCC) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250123/202501230035.cFbLTHtZ-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202501230035.cFbLTHtZ-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    In file included from include/linux/string.h:389,
>                     from include/linux/bitmap.h:13,
>                     from include/linux/cpumask.h:12,
>                     from arch/mips/include/asm/processor.h:15,
>                     from arch/mips/include/asm/thread_info.h:16,
>                     from include/linux/thread_info.h:60,
>                     from include/asm-generic/preempt.h:5,
>                     from ./arch/mips/include/generated/asm/preempt.h:1,
>                     from include/linux/preempt.h:79,
>                     from include/linux/spinlock.h:56,
>                     from include/net/xfrm.h:7,
>                     from net/xfrm/xfrm_replay.c:10:
>    In function 'memcmp',
>        inlined from 'xfrm_replay_notify_bmp' at net/xfrm/xfrm_replay.c:336:7:
> >> include/linux/fortify-string.h:120:33: warning: '__builtin_memcmp' specified bound 4294967295 exceeds maximum object size 2147483647 [-Wstringop-overread]
>      120 | #define __underlying_memcmp     __builtin_memcmp
>          |                                 ^
>    include/linux/fortify-string.h:727:16: note: in expansion of macro '__underlying_memcmp'
>      727 |         return __underlying_memcmp(p, q, size);
>          |                ^~~~~~~~~~~~~~~~~~~
>    net/xfrm/xfrm_replay.c: In function 'xfrm_replay_notify_bmp':
>    net/xfrm/xfrm_replay.c:308:53: note: source object allocated here
>      308 |         struct xfrm_replay_state_esn *replay_esn = x->replay_esn;
>          |                                                    ~^~~~~~~~~~~~
>    In function 'memcmp',
>        inlined from 'xfrm_replay_notify_esn' at net/xfrm/xfrm_replay.c:402:7:
> >> include/linux/fortify-string.h:120:33: warning: '__builtin_memcmp' specified bound 4294967295 exceeds maximum object size 2147483647 [-Wstringop-overread]
>      120 | #define __underlying_memcmp     __builtin_memcmp
>          |                                 ^
>    include/linux/fortify-string.h:727:16: note: in expansion of macro '__underlying_memcmp'
>      727 |         return __underlying_memcmp(p, q, size);
>          |                ^~~~~~~~~~~~~~~~~~~
>    net/xfrm/xfrm_replay.c: In function 'xfrm_replay_notify_esn':
>    net/xfrm/xfrm_replay.c:360:53: note: source object allocated here
>      360 |         struct xfrm_replay_state_esn *replay_esn = x->replay_esn;
>          |                                                    ~^~~~~~~~~~~~
> 
> 
> vim +/__builtin_memcmp +120 include/linux/fortify-string.h
> 
> 78a498c3a227f2 Alexander Potapenko 2022-10-24  118  
> 78a498c3a227f2 Alexander Potapenko 2022-10-24  119  #define __underlying_memchr	__builtin_memchr
> 78a498c3a227f2 Alexander Potapenko 2022-10-24 @120  #define __underlying_memcmp	__builtin_memcmp
> a28a6e860c6cf2 Francis Laniel      2021-02-25  121  #define __underlying_strcat	__builtin_strcat
> a28a6e860c6cf2 Francis Laniel      2021-02-25  122  #define __underlying_strcpy	__builtin_strcpy
> a28a6e860c6cf2 Francis Laniel      2021-02-25  123  #define __underlying_strlen	__builtin_strlen
> a28a6e860c6cf2 Francis Laniel      2021-02-25  124  #define __underlying_strncat	__builtin_strncat
> a28a6e860c6cf2 Francis Laniel      2021-02-25  125  #define __underlying_strncpy	__builtin_strncpy
> 2e577732e8d28b Andrey Konovalov    2024-05-17  126  
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
