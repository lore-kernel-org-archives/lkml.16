Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84544C8EB
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 06:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738303247; cv=none; b=Anofc/euVAbbdrL7yE1EicsBZ6/fZfc+gtFcfM8r47JDXWs16VypjvAn0VfkTcNx+pNkKhJ/ZQFbtsVTXF94Il9S5Rohh2eSnZi034usRHS2bCAEt/GFVu9gusFZFX/Iy6xqfrm7N+8W6b5Yj5JRK+vem94WtJZfqWY6Rg4Qttw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738303247; c=relaxed/simple;
	bh=3StlmaIYrqB/LBrSAdSDquIwb302EjGVkIa/3tK417I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PzNzRZ8ZVlzpL8qe8OjZJS3aLRJ2SwN/Ly6dLJij/DqtHafooVepWWMxgwyILygjX+d1pEbj/BY+Cril0083ykiAQdOeGXsAFXWrxoJLsjZLti+lP1Q+y1a91tQ4AyaRAt+Kkzl/jUF2xp5xrzEkCgYrfzJ7cG4JbehJVyfqvu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=J+FrosMK; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="J+FrosMK"
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-2166022c5caso23973625ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 22:00:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738303244; x=1738908044; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MszCnuGzlzYtnQw0TdLrAActpTqVLNdV66U/Qofq/cM=;
        b=J+FrosMK6+XHj+dRiLkzN7QdAaDPvwWwDUE6LqC7J4F4u2aD3rZumjEcxyOuEkubP0
         Qg7ffD5SA2ZmKIW2hlexHlQ8tG9s7ZdysIa2P8171mpOsgx93RDeW4unUkVAtGUz06qn
         M/MKBbokuqny7D3wkj0d7fC15T4cdo1qmX+QXepasLcGBOdOpBCZxJ/fUgAh/UvHItcW
         MRUlqlNyJxzF38MHLy0TITtnn2Da/KgYtzadIHnAy6zVsDH/jmY56k8Vs1+KV6X81n4M
         wN9M6EbgPz1yOIMaM74ZV1jUWcIXc5j6dKCQaKknYR5vbkZBg7fOPLk2oZEKVLAzFhoe
         4frQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738303244; x=1738908044;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MszCnuGzlzYtnQw0TdLrAActpTqVLNdV66U/Qofq/cM=;
        b=Vf+QeyWvjgOk62zkTSj1jdlHjYUBT/JOxFNjXRiTeXMby5Dgogz8I4u4jGsDkH3nm6
         x5jCAPOOqaFFYlw3qSB8AHF31ihJsf2JFMeFPAIbt/CCMZX8pG9pqsl4/Dgt9QdfAnWk
         jPK8K7FS+9NokHA8Ih+rfsrAM+Iul3ObPt4PJ+neC0qLEhMIEDMaWoWSmCaLHUg0UFyC
         6hqjUx0tw0Zak0bJl4KhPfXd/v+Ypj2H8PIgJssB/F6j8rHki+6TzQPEwkL1k6fEndHF
         rE5RNEIEq7oD2nAdd6Dxm3fIw7G2kEmZ7w66wUkBM8zBWgkwb8CL0ZprCxFyQcAGaxHq
         LfQA==
X-Forwarded-Encrypted: i=1; AJvYcCUhe7Ve983dl+A/VjMeKyFPomwq5VE/OeuZkzpQNokhK7Ud9hqV7kLFciS5SDPcZQLAYlU4e/+dR7JWKPY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVfzbpCj/kMeOxuas221s9a7Ahdcttq7nw40vC0DoQvAQoIam0
	ZdfNx5Yc+pdhzWaIGGf0l9SBE2cfiPllSdkV1RNj5EPlsnsyCRuP4bTG+F1Qd9c=
X-Gm-Gg: ASbGncv5zCKNr7340An2WbV2FYoWOWdTZDyW6/uJ511I/bur9wr+5vpxMtJWT0NCikg
	tph9kCGcHadZZmMglFtEzXxd3/xMF1cFw4+7XOM/Oipgjb2iCg1kHIF0FjHUQ7RBZa2ZaZlf+h/
	W4k13EB8S2xD93MZXdUgJpvAuQQGGRavov1ah4YbiOceb53oZY0JF9etvuKyrXU20jM9HnJpzA6
	GDFDBYigbl3oD07Q9pV9D/4alYxq5GtoFYCPA2deiqo0e1LsQEHA55ZxUG7m+jf2WpCK5xPvlUQ
	KVjcSJpu6KyzfBn+g/Y1/tKDxivOkcc4Ygc8HSrMgH/pnbQS+Q==
X-Google-Smtp-Source: AGHT+IHEjh47WLl29mwABTt+y+uZawVfuUOc5k+586NfPsYbIn6BvlbJi4+9ZSHmZZ6XXv3G4ndRqw==
X-Received: by 2002:a05:6a21:8cc2:b0:1e8:a374:ceb1 with SMTP id adf61e73a8af0-1ed7a6e15d5mr13685080637.42.1738303244438;
        Thu, 30 Jan 2025 22:00:44 -0800 (PST)
Received: from ghost (c-24-56-227-58.customer.broadstripe.net. [24.56.227.58])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-acebe856890sm2320390a12.42.2025.01.30.22.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 22:00:43 -0800 (PST)
Date: Thu, 30 Jan 2025 22:00:41 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Cyril Bur <cyrilbur@tenstorrent.com>
Cc: Jessica Clarke <jrtc27@jrtc27.com>, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, paul.walmsley@sifive.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [PATCH v2 2/4] riscv: uaccess: use input constraints for ptr of
 __put_user
Message-ID: <Z5xnCdp1l9tljwiO@ghost>
References: <20241118230112.2872978-1-cyrilbur@tenstorrent.com>
 <20241118230112.2872978-3-cyrilbur@tenstorrent.com>
 <EA2CB85E-E210-402E-B891-2F4420E55CDB@jrtc27.com>
 <f1218075-94a5-429a-ab35-f47d3e79e80e@tenstorrent.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f1218075-94a5-429a-ab35-f47d3e79e80e@tenstorrent.com>

On Fri, Jan 31, 2025 at 12:31:38PM +1100, Cyril Bur wrote:
> 
> 
> On 18/1/2025 9:34 am, Jessica Clarke wrote:
> > On 18 Nov 2024, at 23:01, Cyril Bur <cyrilbur@tenstorrent.com> wrote:
> > > 
> > > From: Jisheng Zhang <jszhang@kernel.org>
> > > 
> > > I believe the output constraints "=m" is not necessary, because
> > > the instruction itself is "write", we don't need the compiler
> > > to "write" for us. So tell compiler we read from memory instead
> > > of writing.
> > 
> > That’s not what =m does. =m tells the compiler “this assembly will be
> > writing to this memory location, and needs the address of the location
> > for that operand”. If you move it from an output to an input then you
> > get the same assembly generated, but the compiler believes you are
> > *reading* from that memory, not *writing* to it, and so does not
> > believe the memory may be clobbered.
> > 
> > Now, it may well be that, by virtue of this being userspace memory that
> > is only ever accessed via assembly, and any inline assembly being
> > marked volatile, this in effect doesn’t matter. But it is still
> > technically wrong to model it that way, and you cannot use the
> > justification you are using, because it is false, and demonstrates a
> > lack of understanding for how inline assembly works. It has to be
> > correctly justified.
> > 
> > (I do note that neither x86 nor arm64 seems to model this as an output)
> > 
> > Jess
> 
> Good points, I agree. I am happy to respin this patch
> move the =m to output constraint.
> 
> @Charlie Please let me know if you would like me to
> keep your tags on the tweaked version.

Can you remove the tags? Copy me on the next version and I will review
it again.

- Charlie

> 
> Thanks,
> 
> Cyril
> > 
> > > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > > Signed-off-by: Cyril Bur <cyrilbur@tenstorrent.com>
> > > ---
> > > arch/riscv/include/asm/uaccess.h | 18 +++++++++---------
> > > 1 file changed, 9 insertions(+), 9 deletions(-)
> > > 
> > > diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
> > > index 09d4ca37522c..84b084e388a7 100644
> > > --- a/arch/riscv/include/asm/uaccess.h
> > > +++ b/arch/riscv/include/asm/uaccess.h
> > > @@ -186,11 +186,11 @@ do { \
> > > __typeof__(*(ptr)) __x = x; \
> > > __asm__ __volatile__ ( \
> > > "1:\n" \
> > > - " " insn " %z2, %1\n" \
> > > + " " insn " %z1, %2\n" \
> > > "2:\n" \
> > > _ASM_EXTABLE_UACCESS_ERR(1b, 2b, %0) \
> > > - : "+r" (err), "=m" (*(ptr)) \
> > > - : "rJ" (__x)); \
> > > + : "+r" (err) \
> > > + : "rJ" (__x), "m"(*(ptr))); \
> > > } while (0)
> > > 
> > > #ifdef CONFIG_64BIT
> > > @@ -203,16 +203,16 @@ do { \
> > > u64 __x = (__typeof__((x)-(x)))(x); \
> > > __asm__ __volatile__ ( \
> > > "1:\n" \
> > > - " sw %z3, %1\n" \
> > > + " sw %z1, %3\n" \
> > > "2:\n" \
> > > - " sw %z4, %2\n" \
> > > + " sw %z2, %4\n" \
> > > "3:\n" \
> > > _ASM_EXTABLE_UACCESS_ERR(1b, 3b, %0) \
> > > _ASM_EXTABLE_UACCESS_ERR(2b, 3b, %0) \
> > > - : "+r" (err), \
> > > - "=m" (__ptr[__LSW]), \
> > > - "=m" (__ptr[__MSW]) \
> > > - : "rJ" (__x), "rJ" (__x >> 32)); \
> > > + : "+r" (err) \
> > > + : "rJ" (__x), "rJ" (__x >> 32), \
> > > + "m" (__ptr[__LSW]), \
> > > + "m" (__ptr[__MSW])); \
> > > } while (0)
> > > #endif /* CONFIG_64BIT */
> > > 
> > > -- 
> > > 2.34.1
> > > 
> > > 
> > > _______________________________________________
> > > linux-riscv mailing list
> > > linux-riscv@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/linux-riscv
> > 
> 
