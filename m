Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7848F28B50A
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 14:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751295176; cv=none; b=LQDbIKtH2/lbSyVohJPO61r6mpaAFlqz8XuCWK1nrzyWJaQI+TQmEO1mu5rfl8K8RS7ipZHnFUVMlXpvxefm4/hFjGw5B1fe8hrT4GY2w8NvHFtZX6ETzRBXRbbyIAjsUPJEVbjB7vano069SFQP64DBsxcsMcsMVMfkp5f4ivc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751295176; c=relaxed/simple;
	bh=ErkM43EUKaSK2OOotKBYI1WtBpClVpvccCHSUcS7M84=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hLoZjt1PBEuh0IHfu6Y3+anHJQ1FQSedU410f+y23eUhhUlBoWtaIw+FzwB0cQ8IOugKPudkoQXEMxt7HL6eGAVloRVgn+eWWaLMpaLPDLD9g81zmknofvVxm+n3Ts/bNekp45IDKXkX1sFcgQiQ7Q0FqHOzMXV0qzAs5570Cys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TmDf+5Rh; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TmDf+5Rh"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-236192f8770so29094605ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 07:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751295175; x=1751899975; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HSkMxFCwzwQF2l8lMRczvBedd/hxZbtoBl06xjNahpM=;
        b=TmDf+5RhjEyZvB1RsOEb8WICjtDx+ex9zn0vulGSQy0Ejx1Ff71QWZo3EGrqO08lKl
         nstHze0ER5FVTOFCaHQSfeY2bes0Elm+c4dgsubZmC1J6TcD4x6Mh4jRYs/a3HU/rk+G
         7j+vnAVylJ3/4HDy6bHv3su/J0JXxtFgCcItrRNImSozW/7sClTHfIKoemj++3bNx9EB
         nkf5uuv1I8WDYIBd/DQTBoVnXyuIuwYX/oFsTFMs17ah9HAl0sJYYJuENzEHKG64FA02
         dZyIS2oJVSK169EOjtSgRiqd5mocLpZDO5Nju9CIKWhj+NiwDenmzmGZ82mPU/+8wAqO
         PSEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751295175; x=1751899975;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HSkMxFCwzwQF2l8lMRczvBedd/hxZbtoBl06xjNahpM=;
        b=B47YbC20XZQv22wUo7LOcLCl8a9Ib7x0Gg8lZ5cMXTiOyTHpKKxnLpNJEAYr3dxVvX
         52twrzPDtad/c2KUaJ5LZZKh/gDm/g9T1S5sBxycGgTCUAzDvSvphRRfvPxxCLP9geFw
         0ZLnfpcgu+R0ObmdFEhbPhLitloUkyD72RL06nuq+0hTMSRgleDCoT1Fly/CE/KIRqNM
         YNVYPSYRZFr5p2ztSo6fq5haa29x73uNu6Ys9nz3EXAeY81i/xJH/NOmO+Rz8EU8DJBZ
         Fbn02qBVwn4EQZM44aoLPxsnmrcnhZEzZssOZ/RrZ3ZCzSFiuJfXaUkNQ4InjLRsF2SY
         9+qQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlGOMHHj17aS4IYm3o4E+4JRu5X442TAEOjvuXGu2Rz0I38FiwdPDhH1Dg0cM3mSKn6OkExnufXf6NXLs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+vUdh9v+RKitNEHl+yQAX+EZkzMEQDHYy9ykkM88U0k7TcNIp
	jam1YEw4EEoQjOqjtVUEJbpiMhNDKcHfIyjM20t2S1Qfu86smaRUSxOn
X-Gm-Gg: ASbGnct/Nn/n6Z69udzUM3oo01WFToc7K3JBKlsj1iy1cdSW9dmfcOVBUOmrv6lSgok
	b2Ikz81vPElcgpZd1H4F6k1BBmhM0Mr6T6a1JdENuksjMPRIKr+LcTIrOhERC2Mny05y7Il/gkX
	K/OdA78fySE9ijCQL9nRHVRiPm5fABwMrI8360KZC4oxCGyLcd4dQ9tWE7oz35VVaWPQYB9ifKN
	qPv5lakSu17wPZIHGWmKonC1/HfhPAmPsZ8rMbXZPS7emBoPN2v0TXkaAhzdlsmoeRMQGBM7oDn
	hbWpednCiNtp59bbDQx54vFmH+EGRis2R8HSvmy7O6r1NDYteHLA1U8fNVxM0Q==
X-Google-Smtp-Source: AGHT+IEbCD0Ek1/qqYnBfR3wXF0YH5eyJSjMiZVswPeQdmGyRSZ2v9oD00ZJHlCLI9eXIn3Gan2Pog==
X-Received: by 2002:a17:903:3bcf:b0:234:9fe1:8fc6 with SMTP id d9443c01a7336-2390a512e07mr266639055ad.18.1751295174523;
        Mon, 30 Jun 2025 07:52:54 -0700 (PDT)
Received: from localhost ([216.228.127.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb2e22f6sm83147435ad.5.2025.06.30.07.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 07:52:53 -0700 (PDT)
Date: Mon, 30 Jun 2025 10:52:51 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] uapi: bitops: use UAPI-safe variant of BITS_PER_LONG
 again (2)
Message-ID: <aGKkw6b1QPTf9yii@yury>
References: <20250630-uapi-genmask-v1-1-eb0ad956a83e@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250630-uapi-genmask-v1-1-eb0ad956a83e@linutronix.de>

On Mon, Jun 30, 2025 at 03:02:18PM +0200, Thomas Weiﬂschuh wrote:
> BITS_PER_LONG does not exist in UAPI headers, so can't be used by the UAPI
> __GENMASK(). Instead __BITS_PER_LONG needs to be used.
> 
> When __GENMASK() was introduced in commit 3c7a8e190bc5 ("uapi: introduce uapi-friendly macros for GENMASK"),
> the code was fine. A broken revert in 1e7933a575ed ("uapi: Revert "bitops: avoid integer overflow in GENMASK(_ULL)"")
> introduced the incorrect usage of BITS_PER_LONG.
> That was fixed in commit 11fcf368506d ("uapi: bitops: use UAPI-safe variant of BITS_PER_LONG again").
> But a broken sync of the kernel headers with the tools/ headers in
> commit fc92099902fb ("tools headers: Synchronize linux/bits.h with the kernel sources")
> undid the fix.
> 
> Reapply the fix and while at it also fix the tools header.
> 
> Fixes: fc92099902fb ("tools headers: Synchronize linux/bits.h with the kernel sources")
> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>

Acked-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>

Arnaldo, do you want to move it yourself or with my branch?

> ---
>  include/uapi/linux/bits.h       | 4 ++--
>  tools/include/uapi/linux/bits.h | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/include/uapi/linux/bits.h b/include/uapi/linux/bits.h
> index 682b406e10679dc8baa188830ab0811e7e3e13e3..a04afef9efca42f062e142fcb33f5d267512b1e5 100644
> --- a/include/uapi/linux/bits.h
> +++ b/include/uapi/linux/bits.h
> @@ -4,9 +4,9 @@
>  #ifndef _UAPI_LINUX_BITS_H
>  #define _UAPI_LINUX_BITS_H
>  
> -#define __GENMASK(h, l) (((~_UL(0)) << (l)) & (~_UL(0) >> (BITS_PER_LONG - 1 - (h))))
> +#define __GENMASK(h, l) (((~_UL(0)) << (l)) & (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
>  
> -#define __GENMASK_ULL(h, l) (((~_ULL(0)) << (l)) & (~_ULL(0) >> (BITS_PER_LONG_LONG - 1 - (h))))
> +#define __GENMASK_ULL(h, l) (((~_ULL(0)) << (l)) & (~_ULL(0) >> (__BITS_PER_LONG_LONG - 1 - (h))))
>  
>  #define __GENMASK_U128(h, l) \
>  	((_BIT128((h)) << 1) - (_BIT128(l)))
> diff --git a/tools/include/uapi/linux/bits.h b/tools/include/uapi/linux/bits.h
> index 682b406e10679dc8baa188830ab0811e7e3e13e3..a04afef9efca42f062e142fcb33f5d267512b1e5 100644
> --- a/tools/include/uapi/linux/bits.h
> +++ b/tools/include/uapi/linux/bits.h
> @@ -4,9 +4,9 @@
>  #ifndef _UAPI_LINUX_BITS_H
>  #define _UAPI_LINUX_BITS_H
>  
> -#define __GENMASK(h, l) (((~_UL(0)) << (l)) & (~_UL(0) >> (BITS_PER_LONG - 1 - (h))))
> +#define __GENMASK(h, l) (((~_UL(0)) << (l)) & (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
>  
> -#define __GENMASK_ULL(h, l) (((~_ULL(0)) << (l)) & (~_ULL(0) >> (BITS_PER_LONG_LONG - 1 - (h))))
> +#define __GENMASK_ULL(h, l) (((~_ULL(0)) << (l)) & (~_ULL(0) >> (__BITS_PER_LONG_LONG - 1 - (h))))
>  
>  #define __GENMASK_U128(h, l) \
>  	((_BIT128((h)) << 1) - (_BIT128(l)))
> 
> ---
> base-commit: d0b3b7b22dfa1f4b515fd3a295b3fd958f9e81af
> change-id: 20250630-uapi-genmask-d36e3ffc5691
> 
> Best regards,
> -- 
> Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
