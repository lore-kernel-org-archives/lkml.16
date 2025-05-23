Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1EDB2DCBE7
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 03:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747970132; cv=none; b=ZWq84X0NIjNNy4xH9DxbeDhJEnWgnRsveD12BhK60W4RRLHYrzq5cQnYDy4mAlH3q4ySe6SuqUSeFCwN6nqAfRVK/1ee9WXwEwOTJcHDsezUeq+4xQJz6HJywWgFR89t9OwGGdjv21paXKK+KqWYz94e0jfOBkM1p8G3R5ZDbjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747970132; c=relaxed/simple;
	bh=LhNY0BxXuM4HdG4W9fFANPxQdVM0xhwalC4VKXm0rcY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QIMZafIU9Ye/cE4ynGaDR/bCuGq3L6VrPdmJFKacHBwHhzKC0VdHTOTWFPvw+Kt8TcldXxLCl4RjbQhgLPOLn8AGxyEcc9XbOyfDh+Lxmzwq6J1lt+p5F6uHoKEInJTFX2Of16Q7Sxd04i59h3silnwhlddDPEvHo3fZNW6zv9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=Hynr+nki; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="Hynr+nki"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-30e542e4187so6419873a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 20:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747970129; x=1748574929; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zf4cQwVYXNPOaen5hCKSUgiQvAl4J3+F/oWEnqL3rNw=;
        b=Hynr+nkiRVvKvXjcDK+V6Am1iNwJALIgzTDOImoJdFkXS1oGNidf2f7DzLBvZ0e8KL
         DT+ZBiFBnq4Z1i0McBS6VaL5PRIqGneKoNoLQqt0dxubinmGfn8lNg2gknUSuQAWpuRP
         z6TZCfGyoFEvRnwooadI8uuM97q7zG0luDrkdfXtdmc/xaQcyy0xnvfYzIAIQgqxFuU9
         dpzQldblSUeDP5XTM0Z5BxhUIAutRxUl64SrFAhoYpuij9uqWuwlsDK9agWHFyje/ydI
         7XFTGoPdPCp3/CQ5N7MBSPSDKy3v8neqtDtq3hjvXtMDF942EJxxD6TZeM/0Qjme6tCZ
         vrWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747970129; x=1748574929;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zf4cQwVYXNPOaen5hCKSUgiQvAl4J3+F/oWEnqL3rNw=;
        b=vVeBTxkLq5TSjqahW3osJ13mXu5M9trvNerDQyzDmUWMMPfe2Kuht5tBSDkuihn0I4
         xZCe/V8w7ArOtliMZPHgBAcfROaECpRaa8c6/fGO+/S73q5SroHL4M1zI2Z/Nxv6QNuB
         FzJPo5BmnkCOclJLN+GGoo/uv7BIlzn9P9ywcsl/KOtzZGxB/KpCrGUaxPyKjed2rJVi
         vVR/Uz0Z2aYedktMzWAeiSe4tJ/SIKKUZJSMdinc81D2npEpg2JHq6mI7rBvvoPRSxXp
         WsV8PkXXcqr3P4sEjDcQ6THy0MRhlV99bE+s7qZRO/NGEDtCmhVjtm4t5Vb7nRJgNs6m
         +f+w==
X-Forwarded-Encrypted: i=1; AJvYcCW4nvnZgpFBk9lleT+jf3IbDbQ7sHEbNtyk3kEpUU9eTwpiZeX44WUlP6XWK3g0xJ3SKxPe4REuPGybyNg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0CaNbHo6a7MypqklHIeg1DHqefCT/gSriTDsDpQpvVP7T5xXe
	WTRXCY2n4x42OCGUiBmQq66h9oTaxzuqAlwNSsH62wlJkdcyJUQy2vXyAbh/L8z4OuA=
X-Gm-Gg: ASbGnctYHlOV7TBMWq5E26jwVRLcAfUMz7ZhgjDsSOiwL2UrSVJzq882YfoS5CLWs0g
	vnex90MjbUPDzflYdfY6scVlgexu1ohwqSmEeQD2Agk8azTUCJjeev0LkOTM84NmhlBmo1WNZqd
	ZwnbwXtzsjq5z1ZCbeoIu1RQqqqD0ovOqUbLeNuXgo17V5m03Oi++tfaGbYfZ/zzlqtORgBdDg7
	5QezwkzPUO17nCVqgHO9TZO2vQu/3+zTZdm1YLFlMwl8bk8n6DON4t33vH7mcEu9QtY/phI+lOd
	WA2NJaf5bn6i+KkkpJ+wRSz/5scbHREbh0ZNcT6m2qG/hIQ=
X-Google-Smtp-Source: AGHT+IH9g1UYXJOSTj47YTF5i+3BMDAkYSeXiUVwIW9JAnWRQLqmnr8cIxWa5eVMHVjEfljqT4Hirg==
X-Received: by 2002:a17:90b:4a50:b0:2fa:157e:c790 with SMTP id 98e67ed59e1d1-30e7d4fe8c3mr36468278a91.5.1747970128754;
        Thu, 22 May 2025 20:15:28 -0700 (PDT)
Received: from ghost ([2601:647:6700:64d0:45bc:d2a6:c583:3b04])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f365f7a27sm6292567a91.48.2025.05.22.20.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 20:15:27 -0700 (PDT)
Date: Thu, 22 May 2025 20:15:25 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Han Gao <rabenda.cn@gmail.com>
Cc: linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Jesse Taube <jesse@rivosinc.com>, Andy Chiu <andybnac@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: vector: fix xtheadvector save/restore
Message-ID: <aC_oTWjLMUfgKeIK@ghost>
References: <c221c98dc2369ea691e3eb664bf084dc909496f6.1747934680.git.rabenda.cn@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c221c98dc2369ea691e3eb664bf084dc909496f6.1747934680.git.rabenda.cn@gmail.com>

On Fri, May 23, 2025 at 01:27:01AM +0800, Han Gao wrote:
> Fix [1] save/restore vector register error
> 
> Link: https://lore.kernel.org/all/20241113-xtheadvector-v11-9-236c22791ef9@rivosinc.com/ [1]
> 
> Signed-off-by: Han Gao <rabenda.cn@gmail.com>

Thank you!

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>

> ---
>  arch/riscv/include/asm/vector.h | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
> index e8a83f55be2b..7df6355023a3 100644
> --- a/arch/riscv/include/asm/vector.h
> +++ b/arch/riscv/include/asm/vector.h
> @@ -200,11 +200,11 @@ static inline void __riscv_v_vstate_save(struct __riscv_v_ext_state *save_to,
>  			THEAD_VSETVLI_T4X0E8M8D1
>  			THEAD_VSB_V_V0T0
>  			"add		t0, t0, t4\n\t"
> -			THEAD_VSB_V_V0T0
> +			THEAD_VSB_V_V8T0
>  			"add		t0, t0, t4\n\t"
> -			THEAD_VSB_V_V0T0
> +			THEAD_VSB_V_V16T0
>  			"add		t0, t0, t4\n\t"
> -			THEAD_VSB_V_V0T0
> +			THEAD_VSB_V_V24T0
>  			: : "r" (datap) : "memory", "t0", "t4");
>  	} else {
>  		asm volatile (
> @@ -236,11 +236,11 @@ static inline void __riscv_v_vstate_restore(struct __riscv_v_ext_state *restore_
>  			THEAD_VSETVLI_T4X0E8M8D1
>  			THEAD_VLB_V_V0T0
>  			"add		t0, t0, t4\n\t"
> -			THEAD_VLB_V_V0T0
> +			THEAD_VLB_V_V8T0
>  			"add		t0, t0, t4\n\t"
> -			THEAD_VLB_V_V0T0
> +			THEAD_VLB_V_V16T0
>  			"add		t0, t0, t4\n\t"
> -			THEAD_VLB_V_V0T0
> +			THEAD_VLB_V_V24T0
>  			: : "r" (datap) : "memory", "t0", "t4");
>  	} else {
>  		asm volatile (
> -- 
> 2.47.2
> 
