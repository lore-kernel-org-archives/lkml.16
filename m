Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879E51BB6BC
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 14:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738248030; cv=none; b=pGWI/yjiLlYCBV3LlnaNm0i49wfqO7oOhKn+6Ol3iIhywOhJpBVFESlI3JRobcCFqprzqgf5adoSnCQi9YmCo0v+MvFxiagMJ8hgRX9BYpg4/hvBczB4zgZNotCdHPhvCz7FjsTC4Os4xYV3h1yMtZ+cu8bSjjQbPq/gqRy392o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738248030; c=relaxed/simple;
	bh=atZ/x/APC8cnkpoYOoikaT0M2WZdbQIDnN6vZPmwfdw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UcIV6MbNov8O681EKK1A3HQxl/bvzuXoanlI1Goe1DNXRBpX+fOKg4C9kyuVXmdSP6JvH/MkP8kSWSDmyFi7LKaGwOyZsD0o0SM5D9dZ1XziCo3Zb848V/rI3nrxI1m8nwnsG/7VrVwRyNovlrYddiYrT5aY0TlgH18uVOK9Wqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=aJqz6TmT; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="aJqz6TmT"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-436a03197b2so6344515e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 06:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738248027; x=1738852827; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pPBTtW6Kt1BXFlVK5dAgEJRX/SS7fw33DzTFtzfc1pU=;
        b=aJqz6TmTLOBT6JtAZhELiB4how1nc4vl0c9ZSMnUZEEqamgr0YMFUHrZYOjK+xxr0q
         oWY7HOlNWEslgQtX4Np49APLHwTKjqz0lOaTNUCHSM2ibES8C2VyhkvXviZrdczhR9nz
         l89X0rHfwDM1ZkufzRAqWgwC4P6q5bFaxVfwZqtXrUG6xzGMP82p404PnUkwOMKJp9Vw
         hYx7xUmcqwO/u9dR1SbrVg0De1FA1S/0PW+vd9ahC/E2JMseZvcNBksd8tplZYmykzHK
         xsjUDMEkQjaPcAoqVk69uejniF4pUP5JQgH0YO20WaV2Q+UEBSizo4QR6bTqVPv+yL/j
         qGdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738248027; x=1738852827;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pPBTtW6Kt1BXFlVK5dAgEJRX/SS7fw33DzTFtzfc1pU=;
        b=Z9VpyANeFMGMyhNmVt3uoMlue1mMMPARu1qb+NbsDFQGyqQZErw79Rt+BZS+CG/0WW
         kBD8I9AS0U29mZ2wuum6dxmx4lef+e+4QvzJg/3oH9Jheugz6+3ixWvJJ4nu6h6xYEb+
         59Zj1iichjxqOnYFVtnebT6f9AffmSLLj041KmlMxuhLQ8qxjHDOilK9aDa93OFskqfw
         4/LkoXU35t/GiFnqGksnXTj0IUCP9x9cs+K6PSgU1xZXLIZV7c0EovPgRJT87y64lzhd
         jnfCUu/Dxcg93oTlvL7HweI2KrKUaD2VdsgAugvzsOne9R31+GilUgRIzcdkw6dWecQw
         hgCw==
X-Forwarded-Encrypted: i=1; AJvYcCVzuoR8ub58oBq0L845R2lRlSDPijfV/Z/cnHiLg725Q2w4VA/Pk6rsxwiq+LKIzNtb3KKSoKiMr9bzmFg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMbPCHb6V375ExOphJhCrD2JPZuF/weFKRBlCy+5dCI0Tol0AG
	Fs/cQR5VvgQf/Qunk+oZyyUkhvdyPfQ4JQbH2qm0/p9zQon0llHMypcDtfXVr3k=
X-Gm-Gg: ASbGncv4PWc/yLYN4cPTu7mnwJ72T6XsOmZLAJFnd9wPfsjEgves2G2Kdzmf+AOFpjI
	VIj9dysBRgWR3y0V7kqfHjGi/wftQqE3R7j/osn4FYc5IB82elLgpUyv9fhR+mAuBlKCranaeha
	pZSuwWV3nSufzpziGz9+MrqlIm5titESX0CneIdiZbFgy4l4S52+niYEVJgSt4oPJDtlhJCCksM
	Xq0Im3Ey9TZTHfKQQCa3xcUcFs9DVsVXfULHE2Pjy5kJJ/9zn4bcoPY2nKXPlJbCw1RZEGrA/jI
	34s=
X-Google-Smtp-Source: AGHT+IE9c1sUJxYYOz0IV0uwPeN3BgTxowpPJeI70581kypJPFyN9A9c1n7gfvfSwFoNCtR1uaegeA==
X-Received: by 2002:a05:600c:1e0d:b0:436:f960:3427 with SMTP id 5b1f17b1804b1-438dc40ffbbmr62574215e9.22.1738248025991;
        Thu, 30 Jan 2025 06:40:25 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::76fd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc1317fsm62032805e9.8.2025.01.30.06.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 06:40:25 -0800 (PST)
Date: Thu, 30 Jan 2025 15:40:24 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Andreas Schwab <schwab@suse.de>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv/atomic: Do proper sign extension also for unsigned
 in arch_cmpxchg
Message-ID: <20250130-603e0305dde8009a25bfb257@orel>
References: <mvmed0k4prh.fsf@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mvmed0k4prh.fsf@suse.de>

On Thu, Jan 30, 2025 at 10:25:38AM +0100, Andreas Schwab wrote:
> Sign extend also an unsigned compare value to match what lr.w is doing.
> Otherwise try_cmpxchg may spuriously return true when used on a u32 value
> that has the sign bit set, as it happens often in inode_set_ctime_current.
> 
> Do this in three conversion steps.  The first conversion to long is needed
> to avoid a -Wpointer-to-int-cast warning when arch_cmpxchg is used with a
> pointer type.  Then convert to int and back to long to always sign extend
> the 32-bit value to 64-bit.
> 
> Fixes: 6c58f25e6938 ("riscv/atomic: Fix sign extension for RV64I")
> Signed-off-by: Andreas Schwab <schwab@suse.de>
> ---
>  arch/riscv/include/asm/cmpxchg.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
> index 4cadc56220fe..427c41dde643 100644
> --- a/arch/riscv/include/asm/cmpxchg.h
> +++ b/arch/riscv/include/asm/cmpxchg.h
> @@ -231,7 +231,7 @@
>  		__arch_cmpxchg(".w", ".w" sc_sfx, ".w" cas_sfx,		\
>  			       sc_prepend, sc_append,			\
>  			       cas_prepend, cas_append,			\
> -			       __ret, __ptr, (long), __old, __new);	\
> +			       __ret, __ptr, (long)(int)(long), __old, __new);	\
>  		break;							\
>  	case 8:								\
>  		__arch_cmpxchg(".d", ".d" sc_sfx, ".d" cas_sfx,		\
> -- 
> 2.48.1
> 
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
