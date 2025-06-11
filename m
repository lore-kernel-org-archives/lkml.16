Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B0213C3F6
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 01:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749605658; cv=none; b=dbdK88K5pd0+3+sC0LFgk7QVp1PVJm6M7FAr9h5+5w4zm1tTU6CRrrku4eOYCFPfO8BzcLP4fsB9L7yB2hV/glltS8Cm+SUwRNaPwYCSagDGFcDPRJfWDvpkSb6GiBZrx4X/TsvxlzJTPOv2bpR5kykFU15CI62QIHMZ/c5jJv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749605658; c=relaxed/simple;
	bh=T1zFR9KSnYmuAdXqdoJjGT1ANyM3bPhGdYk/lAwcmik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QNz0LjZ56DNxgKvOAPIc/XaKnoYbpTxqHwAfIsrPD79rNdTMa94zJebmaxPuEHV1jE/ej6XcpQnSMveQUayyDF/3plZuL/2XUl3nXPhIffI4BRy624l5qolYCU6FgkPFhM+SHVH/j3a7jSjXjK7HvZrkeSs2+BZXvmmN9V8SqTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=fUXMibAY; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="fUXMibAY"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-70e2b601a6bso57074457b3.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 18:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1749605655; x=1750210455; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6OfSC4aKAfG8eTdD02PuQcspqksT9Z9uW1xlgcKms2U=;
        b=fUXMibAYMuGKERQZWkEmSA7Hyhj4LNBNE7xBId1pAkMoaxG6tjgTGSWfkAmsr5GLmm
         wdNhKF74P9IaDZy/Up+3puqqzme1xJku6vJfhwU4Rr9ztbOpx8+nK4suFWE0pZs+2RGz
         NMIoIj78szD7+wkBnSsekYPQPDqTqID1W8O8HojzegoqqvqSAo+YQ3qRFFrVx7O2xqtp
         5ck87TlpIf4a4/LNCe62B5ZPmW708ecrgba+nsvs9AzdGLjBMDjzrJKtwkG/AQcFJckc
         GtQ8JzJDQ62KsB/eTN7Gh3UD+j1Qy5UANgc62IqpKkW9t7zZnde1nnZt4u6sga+Aj7SW
         mmNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749605655; x=1750210455;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6OfSC4aKAfG8eTdD02PuQcspqksT9Z9uW1xlgcKms2U=;
        b=QYqmI+40h53rA70Vw9oNMX2VImydeuPpeuss7Pvmz3sTjBgzpgsJ3cSBQqLb/Ackc3
         aPck6WbEWkZ9Seh+sJft9lm6D2+RaUzfDA/Nm2NiAJGTRcOn+Fvuxfx1l4sW/XnaRwK1
         i7+LjZ4Tr6YC1wG7dZWvZ3O5/yT/AegGWqYd4GeZkwcUiKDZZz97mIVrAeX0rD9/ZsNq
         CVa9lV7jGvVldKX6XVM/BEt986t+XW/sBGTYm2vgvq3BkWhC75tRZF9xCnHPNnFe6IWT
         aut/Rcl9hDmcH6QiVPKdB/Bzaue44AUEcMew4uSLXEGeBTbYaMGsZBAKHFG5OaAAZxu6
         evLw==
X-Forwarded-Encrypted: i=1; AJvYcCUDT+iHdPBlFYjovC0Xy7idv0L0lTeQ/S7LYZJ7iPUGw+MR+8CjCFFr+Ainck5YUrRvGKCDYi+jFYqk7HU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZt6dDZ5cD8hHSiAksvBmWQYzhqLsWRpJDA+Fbg/O7yzFiFM7u
	s6bxNDZDr0DpfxyoyfTHZWnxKyml7V2FtrZ5xJT140HntdnvwadbuSCBuv3YLqps0WI=
X-Gm-Gg: ASbGnctUx5Eemzc8+009xZWZ6WUiFGeMQRL4EqM6il2AOvSN9UM37fJjpyAzcKFL3f+
	7rg/VWibD3FeQs6XAYb7hhTxjEHJIX9v3na4NJDpIEA42NkX02Kx1DnQxVSQt9H21jiO5OIGEZg
	7HnvN/lMI1jLJn8CpyZEZVlDMsXODKo0aTiIx7YmMYEuUqpBnMaL8KdEfHqg1imajT/w2BYt4nb
	wNhxESgw135jySRA9q7eQqBR/X62SQ02UNmm6014jkygH2rN5OVL3qI168V7Jlpj1xg/y9Ur223
	oDJEKfZvUQ/ILM2os2nbfslsZerq6fR+cxMFEOAIgrPScmv04g==
X-Google-Smtp-Source: AGHT+IHYGlstnL4M4iWhk6sxTD3RYWQKzXMATO+N4nls5RZd5bT+SAnIsznl4txVxtyAQOR8wSa7pQ==
X-Received: by 2002:a05:690c:62c1:b0:6ef:652b:91cf with SMTP id 00721157ae682-71140af6a29mr24008467b3.27.1749605654861;
        Tue, 10 Jun 2025 18:34:14 -0700 (PDT)
Received: from ghost ([50.146.0.9])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-710f99e8f15sm18416907b3.71.2025.06.10.18.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 18:34:14 -0700 (PDT)
Date: Tue, 10 Jun 2025 18:34:13 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: rabenda.cn@gmail.com, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
	jesse@rivosinc.com, andybnac@gmail.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: vector: fix xtheadvector save/restore
Message-ID: <aEjdFYDO6AhtHEvf@ghost>
References: <CAAT7Ki8Z5O61j8bS3OkdYMbcnfJBY18zxJe=qZeJWCpYTibReg@mail.gmail.com>
 <mhng-08D1FAC4-22A7-424E-A1C8-89B71D89BF01@palmerdabbelt-mac>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <mhng-08D1FAC4-22A7-424E-A1C8-89B71D89BF01@palmerdabbelt-mac>

On Tue, Jun 10, 2025 at 03:05:58PM -0700, Palmer Dabbelt wrote:
> On Fri, 23 May 2025 02:46:50 PDT (-0700), rabenda.cn@gmail.com wrote:
> > I will release v2 later to add explanation and add fix tag
> 
> Sorry if I missed it, but I don't see a v2 (I'm scrubbing through stuff post
> merge window).

v2 is here: https://lore.kernel.org/all/9b9eb2337f3d5336ce813721f8ebea51e0b2b553.1747994822.git.rabenda.cn@gmail.com/

- Charlie

> 
> > 
> > Thanks,
> > 
> > Han
> > 
> > On Fri, May 23, 2025 at 4:54 PM Alexandre Ghiti <alex@ghiti.fr> wrote:
> > > 
> > > Hi Han,
> > > 
> > > On 5/22/25 19:27, Han Gao wrote:
> > > > Fix [1] save/restore vector register error
> > > >
> > > > Link: https://lore.kernel.org/all/20241113-xtheadvector-v11-9-236c22791ef9@rivosinc.com/ [1]
> > > 
> > > 
> > > Would you mind rephrasing the log? It should explain what was wrong and
> > > how you fixed it.
> > > 
> > > Thanks,
> > > 
> > > Alex
> > > 
> > > 
> > > >
> > > > Signed-off-by: Han Gao <rabenda.cn@gmail.com>
> > > > ---
> > > >   arch/riscv/include/asm/vector.h | 12 ++++++------
> > > >   1 file changed, 6 insertions(+), 6 deletions(-)
> > > >
> > > > diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
> > > > index e8a83f55be2b..7df6355023a3 100644
> > > > --- a/arch/riscv/include/asm/vector.h
> > > > +++ b/arch/riscv/include/asm/vector.h
> > > > @@ -200,11 +200,11 @@ static inline void __riscv_v_vstate_save(struct __riscv_v_ext_state *save_to,
> > > >                       THEAD_VSETVLI_T4X0E8M8D1
> > > >                       THEAD_VSB_V_V0T0
> > > >                       "add            t0, t0, t4\n\t"
> > > > -                     THEAD_VSB_V_V0T0
> > > > +                     THEAD_VSB_V_V8T0
> > > >                       "add            t0, t0, t4\n\t"
> > > > -                     THEAD_VSB_V_V0T0
> > > > +                     THEAD_VSB_V_V16T0
> > > >                       "add            t0, t0, t4\n\t"
> > > > -                     THEAD_VSB_V_V0T0
> > > > +                     THEAD_VSB_V_V24T0
> > > >                       : : "r" (datap) : "memory", "t0", "t4");
> > > >       } else {
> > > >               asm volatile (
> > > > @@ -236,11 +236,11 @@ static inline void __riscv_v_vstate_restore(struct __riscv_v_ext_state *restore_
> > > >                       THEAD_VSETVLI_T4X0E8M8D1
> > > >                       THEAD_VLB_V_V0T0
> > > >                       "add            t0, t0, t4\n\t"
> > > > -                     THEAD_VLB_V_V0T0
> > > > +                     THEAD_VLB_V_V8T0
> > > >                       "add            t0, t0, t4\n\t"
> > > > -                     THEAD_VLB_V_V0T0
> > > > +                     THEAD_VLB_V_V16T0
> > > >                       "add            t0, t0, t4\n\t"
> > > > -                     THEAD_VLB_V_V0T0
> > > > +                     THEAD_VLB_V_V24T0
> > > >                       : : "r" (datap) : "memory", "t0", "t4");
> > > >       } else {
> > > >               asm volatile (
