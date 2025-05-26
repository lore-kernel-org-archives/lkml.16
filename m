Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B22B27454
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 11:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748258046; cv=none; b=NmQaDKtDtqnfBHlHg0xFKLZJ4KveVLIcgFqCNAn1h5YaJ53RZ8tQ7rat/lujSaEWByRL/bZ5iNTi4SMo1MoFmGSjt/0ngeBI2DyBlqrQo1Jiul5P6nsJ3YLZXQyUvt5aQrwrep0bGqQNMSTg0v/wRtdjVLLTKzKu2VB/rXkK+Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748258046; c=relaxed/simple;
	bh=VnAgd0ZQRivApTR3Ldr5WYwHCJLxJNgqjBaNl5DS1Ws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KOcbnQKzV9eOQymKC2VEZCcQZWwvn0qucl33C/7x2kW8Su5uHM8qct8Mm0pm6CgDo3kAvUIRLDMuevNx5SDQ+7hIaTpWJfYvjv66Uef7kzlaRlF+ryo9kwB/4sC7ewDSmrTYwD3NxDeKu4wIvqpX5Oevrj8s38LBHFhlL5vPB0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=Jfhx1B3P; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="Jfhx1B3P"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a365a6804eso1246769f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 04:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1748258042; x=1748862842; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1qGPkkOzz/AvcHXID85KRR2dfTKt6dbyAQOGmEwhnXA=;
        b=Jfhx1B3Pvz7gQ9A4b1+ihmbbCLVcUEkJPx5tG1uy9QiKB5QDFmZDLkAi19eUTuLlfx
         9Rd5+1lkrMHCL4xe9d7xVaF3oXL31FMnONihOSqEMm9WDGA08cj5XoZkFDbzW+/jTk8S
         Fvtkt0uh1kj8u9ZVDgjY/NRgC+k4KGoZrKDyFW22ILBY/8GJClANav3y9U6ZVBE+OLZ+
         zcPrH/QjG31aEirRja5RLoxdupCqTa+zcuGU25JmCmu7pZbDAVgXm0EptTSpr5tg9/o6
         Hx+GUu1iI/mIfMJpMxpctROQCAzEdWGrUoOqV9CFQ+R+EWgRQmCLVysZrzXOBo5OTRde
         3FqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748258042; x=1748862842;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1qGPkkOzz/AvcHXID85KRR2dfTKt6dbyAQOGmEwhnXA=;
        b=v9PKDn1Cs1HfCN+QEea19rAu9x7L+cfNpM0COQyYZqw8BCWXfbgCdiLSY9hUOdZM10
         gBYLqRH7seGLRt5IFcTQ+OXBpDdIV+7RYE6tP8YiI8mp8pDYoHnS3zXLLvRSUiKfM1oU
         fKOBWDJXnNedwDBg9SUCF/SfMW8dfLaII+i6wZ7B5FEaY2dv0eOMasKRsmfIMuTN/565
         yEcHBWLwy5jQp2IDQdLn6gcSguPKKqSqzJ7FaViR2h2Df8Gjl9eJLk3GI5aqC2CAdTpA
         Tse87TPBJSvHiGlNOe/1MFC7FOAeBI61uzlruvVi6IcMBZqOM9HWBzTfFJBK8jEBSX/z
         Iw4g==
X-Forwarded-Encrypted: i=1; AJvYcCUrHcl/l8g5RLZ7j1hIhuM1FWvdy9CSu8w6yp3cyMzfDXPtAcA+et0hiKNJ0yDIfFTBdIjUpFcgR1HZzZI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzN+5DgapxODL7hnU+IR13lO+WyP4xSl+1/7NS797k4OJrqFD3x
	gww0twyVzAKehUqIgSTI21YEH117o36DEW7B5PIVKJtFvuRehOGVlpx+0iF6jnANY6c=
X-Gm-Gg: ASbGnctSkZKdUakiG7JQgb/RkgIrBOZNXq5cSUyPwsRYy9XLL8PMbf+67aJdoe33kep
	i0VnvLEyoJ3NhNo+fExz5kwa9AG5Jh9WEyCgZQfPahDUS40wz9/UCjmD2YiTqsFX9/Mgg7dADYB
	pf2b7wLVpxSqSkm33n23N0rYY2/wuwWRVm0+wd6IltzaYo2BZCm0eAP0SAIWHHb6E6ehsprPwi5
	gzY+M4DEQpe3WE4FQC/I+hDk6evoAVvzpXkeQh7KinBzvy8Buho5UpHPTnSm0+u+YEw5yz/3Fkb
	1lc420i+Mea1C/Q7GVdT5n+Xnl2J5tVpwWdS8EcjpPqUhdEfLvtmw0jwtHeEP2zm5CveP1H4A8S
	XsYSD
X-Google-Smtp-Source: AGHT+IEohXUMBSqO1qFUGi+04cLdFeL8i/QAY/ZQ64aMi3jtMK4s6/6493H521FOcUTuehMxIQIXpg==
X-Received: by 2002:a05:6000:40d9:b0:3a4:c2e4:11b with SMTP id ffacd0b85a97d-3a4cb4a962amr7086907f8f.51.1748258041562;
        Mon, 26 May 2025 04:14:01 -0700 (PDT)
Received: from localhost (cst2-173-28.cust.vodafone.cz. [31.30.173.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4cc932836sm7397037f8f.39.2025.05.26.04.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 04:14:01 -0700 (PDT)
Date: Mon, 26 May 2025 13:13:59 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: Atish Patra <atish.patra@linux.dev>, Anup Patel <anup@brainfault.org>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Mayuresh Chitale <mchitale@ventanamicro.com>, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Palmer Dabbelt <palmer@rivosinc.com>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv <linux-riscv-bounces@lists.infradead.org>
Subject: Re: [PATCH v3 9/9] RISC-V: KVM: Upgrade the supported SBI version to
 3.0
Message-ID: <20250526-224478e15ee50987124a47ac@orel>
References: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com>
 <20250522-pmu_event_info-v3-9-f7bba7fd9cfe@rivosinc.com>
 <DA3KSSN3MJW5.2CM40VEWBWDHQ@ventanamicro.com>
 <61627296-6f94-45ea-9410-ed0ea2251870@linux.dev>
 <DA5YWWPPVCQW.22VHONAQHOCHE@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DA5YWWPPVCQW.22VHONAQHOCHE@ventanamicro.com>

On Mon, May 26, 2025 at 11:00:30AM +0200, Radim Krčmář wrote:
> 2025-05-23T10:16:11-07:00, Atish Patra <atish.patra@linux.dev>:
> > On 5/23/25 6:31 AM, Radim Krčmář wrote:
> >> 2025-05-22T12:03:43-07:00, Atish Patra <atishp@rivosinc.com>:
> >>> Upgrade the SBI version to v3.0 so that corresponding features
> >>> can be enabled in the guest.
> >>>
> >>> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> >>> ---
> >>> diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> >>> -#define KVM_SBI_VERSION_MAJOR 2
> >>> +#define KVM_SBI_VERSION_MAJOR 3
> >> I think it's time to add versioning to KVM SBI implementation.
> >> Userspace should be able to select the desired SBI version and KVM would
> >> tell the guest that newer features are not supported.

We need new code for this, but it's a good idea.

> >
> > We can achieve that through onereg interface by disabling individual SBI 
> > extensions.
> > We can extend the existing onereg interface to disable a specific SBI 
> > version directly
> > instead of individual ones to save those IOCTL as well.
> 
> Yes, I am all in favor of letting userspace provide all values in the
> BASE extension.

This is covered by your recent patch that provides userspace_sbi.
With that, userspace can disable all extensions that aren't
supported by a given spec version, disable BASE and then provide
a BASE that advertises the version it wants. The new code is needed
for extensions that userspace still wants KVM to accelerate, but then
KVM needs to be informed it should deny all functions not included in
the selected spec version.

Thanks,
drew
