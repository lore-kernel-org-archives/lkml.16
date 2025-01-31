Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999EFC8F0
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 00:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738285162; cv=none; b=DhzOtriGCu3OFrW2r/hyROmU6subhi8EAvQnRIn56FMCRIRC9BYQ7oDbziLamMd54GQBHA62dUT5prsWQjtWHkk/zkh0W4N50EFdRciVIwK1bcsSB3xm8ij+qIbl8rakN+WrljviRh+LrF0ZTR+VvJNuunmx9sonlJepPwkyuw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738285162; c=relaxed/simple;
	bh=SW75nAfISQZEy+34hxdsz2KfyDPh8ztc5EpCpCvpmSA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HS8x6DfVyUmNzufkDo2ZrsOEn1UjcKE+rBdYcEa73xVwsc66GRaZQC55zrTvKlLk2H3HS6ARnCZykwsT5WC1e1mYqMvntEVJ9wap5a5mPG2VrReYdyQsUsidS7pYCxvXbYYHLPVzQx8ZpsLTaQnZsAULf/Fl8l8yKmwje1Kux84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=wGRSO/Zk; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="wGRSO/Zk"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-21634338cfdso34956105ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 16:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738285159; x=1738889959; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cUgOKqFkRsm4oPHXb8aVKMWr0SLZSnGfeke0UV1RBn0=;
        b=wGRSO/ZkzSeAwgjkbgy9oG2g/pJrFQFuc6uG+NyJZSyYAF91eE6wwtFlGMBHA31q7O
         w/PXRzoxazS5hngeprAJEPQURHVhJ+UiqNMCYEsU0ILiThHyZUgrLRNNcj2L3FwKdnQ+
         Bsb7bE3Nfob59kCIBnCGrXtC7rRUvK9adSHiLp+kdIj3wvRvEgb6vGxxk6lBvCcw+nRm
         4OALa0o2F0bRqlw0bjiha3mxQRVcGmiflsvEvoVXKz9r1BRASStS4tsTZKGA4MNWBRHM
         6C0RM2+sKJSlhbdYB70LV5JL3vKDAHqmLYWh3Z2I9UeSN9WEZiS90KQhC1f/Lux/94JS
         S7zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738285159; x=1738889959;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cUgOKqFkRsm4oPHXb8aVKMWr0SLZSnGfeke0UV1RBn0=;
        b=S659kUC5bLwDuILP1e36kgJWcfGHXpfoKZFku+HBq1XPR3UQvYgGDC0nR29wBdiqRl
         HBC9Hz9Jyd1t+my19Hjez3CqlIPP3mrTKjAjHpFc0HZlkekEL4RJ5kRhs+3UcSc/wt4L
         OSCUklnhz7h3e4O/QHJiXOtlzZFHo3oeMr8zLOXqSbnwzokaPqhsmVd5ChvWVIji+Ixg
         b+OJdYfESZIqIhch10ndKb8Nc5RBZ/g7bofGKbnwQmC7cp50UHcxAYNGbemglBFnqf9N
         AaGyS43jdzaRseqXWi8BvOqRe30Bu91OVDn8DfCkJHYyGbo6PYmnpMLUNByiQLfYdLsO
         xX+w==
X-Forwarded-Encrypted: i=1; AJvYcCWo49qw0EGeU1KOZVZXwXJrPwqgO2csLDmQEmiv5vJmj1nhjGzrqwi7TRA/ULfhiJ9NXrsJbXae0bElf00=@vger.kernel.org
X-Gm-Message-State: AOJu0YxU2+F2G0sZCo+vwgyK/AKJDcYpu/9qMi/WPHhR4QoP0KCEVjsO
	uNR7we905j+/jBtIp4PY8wBe8rqdUijWHM45bkWnIms4TGk9FSbW46CDok79wTU=
X-Gm-Gg: ASbGncs3Bd37jblvudKqEyY9xYRPn6NTwnK2j2nFdDYGaxyDs5ssS+7A7Yy2LTPBbjo
	Hf4M6dFD14u0XLXIIMW2CJtFTSjK0Zrq4EDk1JZeIJKuXeVHXlanq3RJa8FFEyoQhXb42VDZpdO
	C70RBnbLVl1tm9FFg2SJMvdxzMuPb99xCBTuSOltanMViFcT3zbli439F0El+R9ljqeqyOueJMw
	k4agmq3iSlhvJeA8lapeDIaUOIYhu7e5+EV7xDaCuK7rmQ1Di+sDWFT3SdyS8Ok3kN2uynAR96z
	Dda3KfsVTSuZqm+4obi8C8abLq7bDnGxE7yw0DNxcUeXBRe3jg==
X-Google-Smtp-Source: AGHT+IGRII0QPm3rxHT+zVo2k8HvV+c2UWRw3gIsn7i7+HbIEYjPA+itL3Fh9hFoa0ppbbJxcfNQNQ==
X-Received: by 2002:a05:6a00:1946:b0:72a:aa0f:c86e with SMTP id d2e1a72fcca58-72fd0bda6c1mr13416483b3a.4.1738285158873;
        Thu, 30 Jan 2025 16:59:18 -0800 (PST)
Received: from ghost (c-24-56-227-58.customer.broadstripe.net. [24.56.227.58])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe64267aesm2097761b3a.47.2025.01.30.16.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 16:59:18 -0800 (PST)
Date: Thu, 30 Jan 2025 16:59:16 -0800
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
Message-ID: <Z5wgZHnvu9EeE4xq@ghost>
References: <20250129131703.733098-1-arikalo@gmail.com>
 <20250129-museum-slider-3bb634d124de@spud>
 <Z5wEKS9q8-nYPO7h@ghost>
 <20250131-unknotted-yoga-bccacad0c6d3@spud>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250131-unknotted-yoga-bccacad0c6d3@spud>

On Fri, Jan 31, 2025 at 12:43:12AM +0000, Conor Dooley wrote:
> On Thu, Jan 30, 2025 at 02:58:49PM -0800, Charlie Jenkins wrote:
> > On Wed, Jan 29, 2025 at 04:19:58PM +0000, Conor Dooley wrote:
> > > On Wed, Jan 29, 2025 at 02:17:03PM +0100, Aleksandar Rikalo wrote:
> > > > From: Djordje Todorovic <djordje.todorovic@htecgroup.com>
> > > > 
> > > > The riscv MIPS P8700 uses a different opcode for PAUSE.
> > > > It is a ‘hint’ encoding of the SLLI instruction, with rd=0, rs1=0 and
> > > > imm=5. It will behave as a NOP instruction if no additional behavior
> > > > beyond that of SLLI is implemented.
> > > 
> > > You say p8700, but the erratum will be applied on all systems that are
> > > identified as using a mips cpu. Why's that?
> > > 
> > > > +void mips_errata_patch_func(struct alt_entry *begin,
> > > > +					     struct alt_entry *end,
> > > > +					     unsigned long archid,
> > > > +					     unsigned long impid,
> > > > +					     unsigned int stage)
> > > > +{
> > > > +	struct alt_entry *alt;
> > > > +
> > > > +	BUILD_BUG_ON(ERRATA_MIPS_NUMBER >= RISCV_VENDOR_EXT_ALTERNATIVES_BASE);
> > > > +
> > > > +	if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
> > > > +		return;
> > > > +
> > > > +	for (alt = begin; alt < end; alt++) {
> > > > +		if (alt->vendor_id != MIPS_VENDOR_ID)
> > > > +			continue;
> > > > +
> > > > +		if (alt->patch_id >= ERRATA_MIPS_NUMBER) {
> > > > +			WARN(1, "MIPS errata id:%d not in kernel errata list\n",
> > > > +			     alt->patch_id);
> > > > +			continue;
> > > > +		}
> > > > +
> > > > +		mutex_lock(&text_mutex);
> > > > +		patch_text_nosync(ALT_OLD_PTR(alt), ALT_ALT_PTR(alt), alt->alt_len);
> > > > +		mutex_unlock(&text_mutex);
> > > > +	}
> > > > +}
> > > 
> > > > diff --git a/tools/arch/riscv/include/asm/vdso/processor.h b/tools/arch/riscv/include/asm/vdso/processor.h
> > > > index 662aca039848..880f26a24f69 100644
> > > > --- a/tools/arch/riscv/include/asm/vdso/processor.h
> > > > +++ b/tools/arch/riscv/include/asm/vdso/processor.h
> > > > @@ -14,7 +14,10 @@ static inline void cpu_relax(void)
> > > >  	__asm__ __volatile__ ("div %0, %0, zero" : "=r" (dummy));
> > > >  #endif
> > > >  
> > > > -#ifdef CONFIG_TOOLCHAIN_HAS_ZIHINTPAUSE
> > > > +#ifdef CONFIG_ERRATA_MIPS_P8700_PAUSE_OPCODE
> > > > +    /* MIPS P8700 pause opcode */
> > > > +    __asm__ __volatile__ (".4byte 0x00501013");
> > > > +#elif CONFIG_TOOLCHAIN_HAS_ZIHINTPAUSE
> > > >  	/*
> > > >  	 * Reduce instruction retirement.
> > > >  	 * This assumes the PC changes.
> > > 
> > > What about when the erratum is enabled and the toolchain supports
> > > Zihintpause?
> > 
> > So the other way to do this is having an hwprobe call to check if the
> > currently running processor is effected by this. However I was concerned
> > about the performance penalty of calling hwprobe here in the previous
> > version so I had suggested to use a flag instead so there is not the
> > penalty on other architectures. This does make it invalid to enable
> > this errata in the defconfig. This is a precedent for how we want to
> > handle errata in tools.
> 
> Gonna have to be marked non-portable then, if enabling it results in
> tools that might malfunction on other platforms.
> 
> > > Why don't you use the same implementation as the !tools
> > > copy of the header? (I'm not sure why they're different in the first
> > > place).
> > 
> > It is different because the headers in tools are userspace so it doesn't
> > make sense to have alternatives.
> 
> I assume that's an answer to the first part, and not the bit in
> brackets since the "first place" difference is about using the .4byte
> versus having an ifdef/else and you're talking about alternatives.
> That looks to have been some sort of sync issue or oversight in
> 6da111574baff, no?

Yeah it was a response to the first part.

As for the second part, yes it look it was a syncing issue.

- Charlie

