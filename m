Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDFEE22A4D5
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 12:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748002571; cv=none; b=Vjp+Te04IaMlqUL8LpRBCCcdEtHuClso4Tk5Ern5jdoAJSE+XKctA6UGWnY0laHgU7lDuSGe+48ITd6JxHSViOHWX8vR1tuFnxRjXaBoO1KkvdM+GaCK7BjI+DPRp/Hiu6MjV3/TFbCoqmT7swZhPsDGRBCd3K/o4JZf2Ls4mUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748002571; c=relaxed/simple;
	bh=EgDWebAmLIsMgY7vDv9DECCxG0h/SjOmQ/R1MVSCVoY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VJwq0KEhqQlqNfmjfq0eXaf5HMx4foTYIUzWPxgbPk4s/k25Bv3Y/rAnd72OgwoKCaNQslx0YI7Xvph0qR+abuBuKUvKJdp2MhiSbBTBhUnktQVvjZagLREaktpHCb2M84e+eBvK31zfKMXgD//J+IDskHRir//Kd9cEVAjlO4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JpXl2pYk; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JpXl2pYk"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7c5e1b40f68so1071639085a.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 05:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748002568; x=1748607368; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=V8BApzo+tcGxUQ4qyRc5kFvmPIaCYVT6klZyuYrkTWg=;
        b=JpXl2pYkjD5mK51Ywj3Txhc41HbNJW+R5mWVbKoI5AFR+UE6hhHd4u+mnDej/X96m2
         PFkdj6OE5lmajGftoyS6f/x/QwNwpA4w7G9QlK9RhPr03omo04I3SqmMW/MvIsvXKUrQ
         htAKMuv0fj70bwRof8+9RLiGP39HD3ms0PIAeZGaAY2QIcv/M9TZ4bzUIxPRPecltozS
         BFjGz9I6GvQrVwaB+ZgGJ1ZxZLOzo++qfJyYn2eTUHUG7Noq3psAxhQzxQSy2VmuiTk+
         EMTV929DHmPRLeFCBBDqNggslOTW47Qnt8JZfizXfa84/a/0eEop2s8gWj+7WY5upE7i
         D5vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748002568; x=1748607368;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V8BApzo+tcGxUQ4qyRc5kFvmPIaCYVT6klZyuYrkTWg=;
        b=tvzE0uEtog9z82YkmBBPcjCvAprFM8za+OOI/M5BJGze7j3VQowk4beoMkXfw4STZO
         rrgEV5VBQJeJItCAi5orsxLewMimhleFbwPwX/X2L8uVGAPH1SBcGz04gLnR9tCZiIBR
         VJh8/f33oiDkpSSJSOxiFDNAqKhp86Jtz+Zw/bTJ/1LzD8wsm/MRTOTSgN3GHd7LHntV
         3euHffdddedfJ7o3Zp0cex3qd4Tnms/vLICUWw9PLJPTt8aoJK/NMJmZkAE2F91zO2tc
         0j3bdj7ksXdbd5SOFCxnTO+qlLeW7Zz15hqFF/f0wMbcD3b6TlkbhUOcqAWzYATEC9Jq
         U8+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVQOVL1lJ3qEKQYKzg7PHk1Hjf5IbnQX2V8lZ8VPv/sF9A483XyCTPHDXHvvMHlEzB9gQGxDh4Jlj85AUc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxaHxzfc5IGRSdKxRqJ4Cgf12IkPYdUS5mX4jWvoHsug7MZgvT
	tgcARxzKQ9Tx/4mIld0KOKHnypVC6WWLSfBi+4nedXSRKngZTrA8Tr/Vvb2RyTW+VGIlqg7WTzc
	+RJ+uKVgARljRkVSaV1eBGSp6aVs9VaQtZU84owniUg==
X-Gm-Gg: ASbGncsuuZoxJjIkDWYPGZciwPnz9ii7JXSu+pxK9N6B7zquyZPCoWIa80O+2k2rVS4
	+e8eYoqRtbEzTWem01RsmJo2zlsEgHI/vzSeo4SRDFwEm5dQBxN0ueb0ZU+zNGqbPl5m81vLYui
	vgLLBH2+O84G0Lo6Vf+ELuFRY19zblmkgToW5taddGOd6n3ClyQDoy2RFg05xbiaQ=
X-Google-Smtp-Source: AGHT+IFI9cZTC1Lw+RkjnHQgJAawN/JkLsHsZMeuSEx0h5hDWONvffxErgEONGaLu2y1YUsI+OSBxtKp0HDD02GjIeA=
X-Received: by 2002:a05:620a:45a7:b0:7c5:6410:3a6 with SMTP id
 af79cd13be357-7cee31badcdmr357640685a.27.1748002568177; Fri, 23 May 2025
 05:16:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+G9fYsZPSJ55FQ9Le9rLQMVHaHyE5kU66xqiPnz6mmfhvPfbQ@mail.gmail.com>
 <70d46cd3-80f4-4f5e-b0fc-fa2a6f284404@app.fastmail.com>
In-Reply-To: <70d46cd3-80f4-4f5e-b0fc-fa2a6f284404@app.fastmail.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 23 May 2025 17:45:56 +0530
X-Gm-Features: AX0GCFsCp7KO-IJd_ns8HQ1m2sgketC1fMATdiktIg7OhSVKCwGOqNM2CvlFqFs
Message-ID: <CA+G9fYs1FMx6Z23i8g-yM-cABvZ4yTmPhfpRs4R1LBoP7Cyo5Q@mail.gmail.com>
Subject: Re: mips gcc-12 malta_defconfig 'SOCK_COREDUMP' undeclared (first use
 in this function); did you mean 'SOCK_RDM'?
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-fsdevel@vger.kernel.org, linux-mips@vger.kernel.org, 
	open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Anders Roxell <anders.roxell@linaro.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi Arnd,

On Thu, 22 May 2025 at 19:32, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Thu, May 22, 2025, at 15:22, Naresh Kamboju wrote:
>
> > ## Build log
> > net/unix/af_unix.c: In function 'unix_find_bsd':
> > net/unix/af_unix.c:1152:21: error: 'SOCK_COREDUMP' undeclared (first
> > use in this function); did you mean 'SOCK_RDM'?
> >  1152 |         if (flags & SOCK_COREDUMP) {
>
> SOCK_COREDUMP should be defined outside of ARCH_HAS_SOCKET_TYPES.
> How about reducing the scope of that check like this?
>
>       Arnd
>

Thanks for sharing a quick fix patch.
This below patch is applied and build test pass.

Tested-by: Naresh Kamboju  <naresh.kamboju@linaro.org>


> diff --git a/arch/mips/include/asm/socket.h b/arch/mips/include/asm/socket.h
> index 4724a563c5bf..43a09f0dd3ff 100644
> --- a/arch/mips/include/asm/socket.h
> +++ b/arch/mips/include/asm/socket.h
> @@ -36,15 +36,6 @@ enum sock_type {
>         SOCK_PACKET     = 10,
>  };
>
> -#define SOCK_MAX (SOCK_PACKET + 1)
> -/* Mask which covers at least up to SOCK_MASK-1.  The
> - *  * remaining bits are used as flags. */
> -#define SOCK_TYPE_MASK 0xf
> -
> -/* Flags for socket, socketpair, paccept */
> -#define SOCK_CLOEXEC   O_CLOEXEC
> -#define SOCK_NONBLOCK  O_NONBLOCK
> -
>  #define ARCH_HAS_SOCKET_TYPES 1
>
>  #endif /* _ASM_SOCKET_H */
> diff --git a/include/linux/net.h b/include/linux/net.h
> index 139c85d0f2ea..f60fff91e1df 100644
> --- a/include/linux/net.h
> +++ b/include/linux/net.h
> @@ -70,6 +70,7 @@ enum sock_type {
>         SOCK_DCCP       = 6,
>         SOCK_PACKET     = 10,
>  };
> +#endif /* ARCH_HAS_SOCKET_TYPES */
>
>  #define SOCK_MAX (SOCK_PACKET + 1)
>  /* Mask which covers at least up to SOCK_MASK-1.  The
> @@ -83,8 +84,6 @@ enum sock_type {
>  #endif
>  #define SOCK_COREDUMP  O_NOCTTY
>
> -#endif /* ARCH_HAS_SOCKET_TYPES */
> -
>  /**
>   * enum sock_shutdown_cmd - Shutdown types
>   * @SHUT_RD: shutdown receptions
>
>
