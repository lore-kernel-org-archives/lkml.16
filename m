Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77BBD12C499
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 22:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738277935; cv=none; b=I6xZAnccIygzFI6EFiCsHzZe80dwm2KL+UtWcu3J0947Urq8l9VB+6Z2BcNYexnPJ+9ltPQqUdqw2mSzKSfufHE16cdpCYaLIsUBvOMkgn2ESREAnF16VFztlH/DPaZDNMXn6IqyrLNVh7MK5+59tVxbLmZ6wQnHD4tGGR/Mjd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738277935; c=relaxed/simple;
	bh=pAn1iIMRIIBCqSolqYletqe8y+x3siOw0uL2FvEbOF0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pImF7ybkNKBLDzkgwrKFsgPkNad3GUBSd7wOAs4oh+Y/sM5t1yG9FmilJlg+2Z1sJDyXmZ92XjqQpSKi22R0brwtCRzVDISSWOnwYgy0cFV2bjeF4ZqkdPqkpEy5aGNGodAGdnr+FPwuY5nhjoT3xUaAjt/SXFjfRYBbLVMMan8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=aEssRJr4; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="aEssRJr4"
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-2166651f752so14024925ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 14:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738277931; x=1738882731; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iqrirXyAiJow4eUPN0yWoilteak1+pXXR1BTytYKwjs=;
        b=aEssRJr4oujzoLm/qvgL7KfCT/6j/0JIa8E/ILuee4Ww7WNs9ez6k/QtQ65uE51cJ3
         pHoS1ZXb/RPU9DPpxWAycGxXIk9HunTLbvMvcXDKYtb7Yd9wCbpdyqUfBohhoyvhNjB+
         RKWr6TWxsoLCJmzxcKaRSB3Dg9GfFrq7WXdbW8odVGIbp9q6CZC6ZW+MFVqsOv4H0Edl
         sI8sQxnDr/Uxz+nqxOnsXNef68KdFYdl0Zo96bvkZWfRi7jbTChE/pcQSdhP4p7zqD6/
         NcRazf/DoVrcA2vXSvu+Od29CH5913bv2j0yF+kd2q7PPzhwWVZLI7zqcakp7klo8kDx
         5aEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738277931; x=1738882731;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iqrirXyAiJow4eUPN0yWoilteak1+pXXR1BTytYKwjs=;
        b=J5jUr6z/AG++ZyY2CGiGIVVsipL34Zwqi8Xmbn9smZpE4wSAXfR/xQsBPe2K7GEtyC
         qmBCAAOWde+yKpEa7RexasPcMgPsWb2yelsbyLUUbFmrnmNy8eIzoFNlIuoqP4V/LcR3
         1xJMbrVu5VmYppCHU0zADr+fVToTnpY7juFB9QN0KZ9PNbACqMCzxkegeBke1rE1Tdk4
         FjWyEP32IVC/JE931EcyEd6lLKxQW0YP8O6UdD0Sd+izCFO6h0CQlIw6jx0qdWf9MMLK
         fqFgz1mU+yliyyvFZJCLJCQMkV/7bn6V/uAxSNQRvN/zz9/GUXJtJXxiRm1hlAAq018U
         Pnog==
X-Forwarded-Encrypted: i=1; AJvYcCWYf/d8ai6nfnsR6t14VpMZrFziPuyY3avj7v8hDcScEky6PBJBTpsoTOHM+3QRtzrg6em/tCIIn3T5s1E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbVPKAE0A2nSH9Au7p2Q8Ei17pTM0HoOtr5Moc7md2ECZ5klM6
	lksU4b38oeYY6Cv9suAkCRp0xN9JqZj5S6vy4JBcxvEAoT71Wb6aeMTWUdour8k=
X-Gm-Gg: ASbGncuxu7xoNriNRihe75dnll8zD4fO132wxVcubXLt55rjJuNkRiex3NYEGj7aQQJ
	OvRulKkH/d5kEv2dOLJ3zST7UnwLQT+qJCRahxI5nowU49EZ6XCUoFK+4YjiDC8jEeNSzlMiD9t
	YTYslcb+ptnSXa4/0S+l9E0VSX1rFj6VjFlFn9L/6sVZOy8QzShvSnxl2beIEpEV20kZYVwH2Aj
	BW2IPMBYQJfs/Gke2ojSyD3wqlLG3Pq1OAsq0/H82x055ZMo/qZbnhugWPBI2QAKgb7A4xK9nKy
	4sXzOEAO5Q==
X-Google-Smtp-Source: AGHT+IHYG+kmnkJ+gnSZiRaOKEhXPOUeShSwAFPSZgtsxgjBVvqKWV5HeZeT27pl7Y4bSuSI8Ka2Tw==
X-Received: by 2002:a17:903:18c:b0:216:49b1:fadc with SMTP id d9443c01a7336-21dd7deeef3mr132651725ad.42.1738277931641;
        Thu, 30 Jan 2025 14:58:51 -0800 (PST)
Received: from ghost ([2001:428:6405:1e0:cd5c:b7b4:1f3d:62bb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de31f7885sm18881625ad.54.2025.01.30.14.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 14:58:50 -0800 (PST)
Date: Thu, 30 Jan 2025 14:58:49 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Cc: Aleksandar Rikalo <arikalo@gmail.com>, linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Jones <ajones@ventanamicro.com>,
	Christoph =?iso-8859-1?Q?M=FCllner?= <christoph.muellner@vrull.eu>,
	linux-kernel@vger.kernel.org,
	Djordje Todorovic <djordje.todorovic@htecgroup.com>
Subject: Re: [PATCH v3] riscv: Fix the PAUSE Opcode for MIPS P8700.
Message-ID: <Z5wEKS9q8-nYPO7h@ghost>
References: <20250129131703.733098-1-arikalo@gmail.com>
 <20250129-museum-slider-3bb634d124de@spud>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250129-museum-slider-3bb634d124de@spud>

On Wed, Jan 29, 2025 at 04:19:58PM +0000, Conor Dooley wrote:
> On Wed, Jan 29, 2025 at 02:17:03PM +0100, Aleksandar Rikalo wrote:
> > From: Djordje Todorovic <djordje.todorovic@htecgroup.com>
> > 
> > The riscv MIPS P8700 uses a different opcode for PAUSE.
> > It is a ‘hint’ encoding of the SLLI instruction, with rd=0, rs1=0 and
> > imm=5. It will behave as a NOP instruction if no additional behavior
> > beyond that of SLLI is implemented.
> 
> You say p8700, but the erratum will be applied on all systems that are
> identified as using a mips cpu. Why's that?
> 
> > +void mips_errata_patch_func(struct alt_entry *begin,
> > +					     struct alt_entry *end,
> > +					     unsigned long archid,
> > +					     unsigned long impid,
> > +					     unsigned int stage)
> > +{
> > +	struct alt_entry *alt;
> > +
> > +	BUILD_BUG_ON(ERRATA_MIPS_NUMBER >= RISCV_VENDOR_EXT_ALTERNATIVES_BASE);
> > +
> > +	if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
> > +		return;
> > +
> > +	for (alt = begin; alt < end; alt++) {
> > +		if (alt->vendor_id != MIPS_VENDOR_ID)
> > +			continue;
> > +
> > +		if (alt->patch_id >= ERRATA_MIPS_NUMBER) {
> > +			WARN(1, "MIPS errata id:%d not in kernel errata list\n",
> > +			     alt->patch_id);
> > +			continue;
> > +		}
> > +
> > +		mutex_lock(&text_mutex);
> > +		patch_text_nosync(ALT_OLD_PTR(alt), ALT_ALT_PTR(alt), alt->alt_len);
> > +		mutex_unlock(&text_mutex);
> > +	}
> > +}
> 
> > diff --git a/tools/arch/riscv/include/asm/vdso/processor.h b/tools/arch/riscv/include/asm/vdso/processor.h
> > index 662aca039848..880f26a24f69 100644
> > --- a/tools/arch/riscv/include/asm/vdso/processor.h
> > +++ b/tools/arch/riscv/include/asm/vdso/processor.h
> > @@ -14,7 +14,10 @@ static inline void cpu_relax(void)
> >  	__asm__ __volatile__ ("div %0, %0, zero" : "=r" (dummy));
> >  #endif
> >  
> > -#ifdef CONFIG_TOOLCHAIN_HAS_ZIHINTPAUSE
> > +#ifdef CONFIG_ERRATA_MIPS_P8700_PAUSE_OPCODE
> > +    /* MIPS P8700 pause opcode */
> > +    __asm__ __volatile__ (".4byte 0x00501013");
> > +#elif CONFIG_TOOLCHAIN_HAS_ZIHINTPAUSE
> >  	/*
> >  	 * Reduce instruction retirement.
> >  	 * This assumes the PC changes.
> 
> What about when the erratum is enabled and the toolchain supports
> Zihintpause?

So the other way to do this is having an hwprobe call to check if the
currently running processor is effected by this. However I was concerned
about the performance penalty of calling hwprobe here in the previous
version so I had suggested to use a flag instead so there is not the
penalty on other architectures. This does make it invalid to enable
this errata in the defconfig. This is a precedent for how we want to
handle errata in tools.

> Why don't you use the same implementation as the !tools
> copy of the header? (I'm not sure why they're different in the first
> place).

It is different because the headers in tools are userspace so it doesn't
make sense to have alternatives.

- Charlie

> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

