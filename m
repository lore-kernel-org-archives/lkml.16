Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC8B28C846
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 17:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746638920; cv=none; b=eTnz+238h13sBzoRhCUA4fACZI/SXh0CdZMOBtRKrZdWc1bxncSplFTqHCJlmNoGpRU+DvJZaifGDCQgr9hEkKHuHrJT1huEqsMcVSCL6M63374a6wSg342WNQuoJH4RoOulhe6mjh+D7QBhQgje/DkPHyj1bIEMr0KS1p2RXq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746638920; c=relaxed/simple;
	bh=VEQsZlKiPlg8JG29HLY8kuFIcRJCMVZ5ZBC0vAQca9I=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=MoK5m23xgsRdFEXP4qvSRFBNe4LyM4i0Z+xXwD40cY5Fp2jnWQyT88GfnioJVe5gQhYMnedfnhCI6rAjF8ysku3NESe3umy2c7N6f9Xo5rlMKDzOdLEc7dFrT+PbAx1IpxEH5YdqkPlqf1KA1qUe6UEkVa9RQl50vZmkeekOInw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=f4RVo24t; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="f4RVo24t"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43ceeb85ab2so112375e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 10:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746638917; x=1747243717; darn=vger.kernel.org;
        h=in-reply-to:references:cc:subject:from:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n1k0mMQcs727Jg3GUuCAHgbefpxoeFAFqTEHafwowpE=;
        b=f4RVo24tqQrRj+RtDkDwSGKQvnLAOIiFUyOy/lepU07kCA0xqZZFYTNvB4Gw9AS/wv
         TIqRNd6EiK5t5f+AtMas4FCPENMa5yarpPP0vz904i3OH6p50LiAYfPx2P16/S8CWdn2
         40bSRGfPsoR6sNQxKQvY0Xe5q5FPtMKofbuX13xDoSCQdldCbJRx05CZU9nWAF0+mC18
         IiDuz7Woa23akTkZjkc2vubEsPvoYqGevt9EXhmEoWLq/H0AeYOBP853gtzwwDLIf5kV
         19pu7CboQHkqo0B44oo3Y9lS/ni39Fpxif0LbBiYYEh2sEwY6d3NyTI3+LNyxwLYibrt
         VrLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746638917; x=1747243717;
        h=in-reply-to:references:cc:subject:from:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n1k0mMQcs727Jg3GUuCAHgbefpxoeFAFqTEHafwowpE=;
        b=WIgysqDRMIHCX0e5kQLX6CPGBV2VZF1ILad6KvRop0eMWsbdO1dEwaN7q9NMtjFewQ
         tThyTAy5+w8IKu9RP0cfHWYYMId629nXTISIxyhJT5H3KsuaC65FfD4X1QYFsWKVYAH2
         6Awm+klJjfYMQw3HGA215urjfaVSwmUBQklxeMdn0/g/5A9WLtN471kewltEyY0rdQSZ
         z+3sNLLjEWlzGo5PeYYlGvWgIjB5NoSLtOrYWkbP3Qm4pczAl7DevDU9OGaJcwEZ8GbK
         Nu+CZo1icdhHSY/a0JseJ6GwuziQMqKfy2OEuAsdJQvOI4r+kPv8zfHstU4bS7Nb4HcB
         THWA==
X-Forwarded-Encrypted: i=1; AJvYcCVtRag0pb1cuKrcmGL7m0cIia1aYBGmt4FtVYcocDmo5/vwY9e+qLnU8NhJKkDwHqam7VKX0Lz1QNeFjmM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEE/5Bmqz0pC+r2m9/PEgpH/R+l4EXgtmn8MleELnTb3KYDLio
	Wn6K9ATy1VWa1EGV2CM672hv/Yaxi1QKorRBnZx5hhd5Tw7BaTC+xywFBitChmE=
X-Gm-Gg: ASbGncsN5vRFz9GsF8XSNPig8nL81Ck5iTEeAT1g9j0IF6MnQsvEG40a62F+Jz/Yy/d
	Hsdm4JBC/upH/RnQjK8xICQDUzjVuhrUfNbAjj1UjF86z+nIiI9Gyuwxg4eSnRhJWZ3GaEZ6QCi
	DJROGasTCJV7E2GyMdrt0B9tLroapcENWLHQ/TfUpRo3OPXjo4Qq5b/YxYX2kQSllJS/qNH8DAe
	YezZbFPRp4Q1SeHBs1CkaCitlsdyaD90X3GYjEUp6zUUuM6c+wPEYriJsNdxQMNB3YJRrK0aEqO
	BdP4ylb/qACBNlcEVNN7cnmBKhaf+ZQMQiHLlqom6G2q3bma
X-Google-Smtp-Source: AGHT+IHU+1d2rnAPUioAKK829WKkuchI8dVVAYZLNapz3Ruq/guJ3Nrk018+5LxP/Vpdt+N6B5rWQw==
X-Received: by 2002:a05:600c:8711:b0:439:9a40:aa27 with SMTP id 5b1f17b1804b1-441d44dd3b3mr14261685e9.5.1746638916681;
        Wed, 07 May 2025 10:28:36 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:f39f:9517:bfc5:cd5e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd3b7f18sm7953815e9.40.2025.05.07.10.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 10:28:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 07 May 2025 19:28:35 +0200
Message-Id: <D9Q3TKPXTPMO.39LSPFEO587XO@ventanamicro.com>
To: "Anup Patel" <anup@brainfault.org>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
Subject: Re: [PATCH 2/5] KVM: RISC-V: refactor sbi reset request
Cc: <kvm-riscv@lists.infradead.org>, <kvm@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Atish
 Patra" <atishp@atishpatra.org>, "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, "Andrew Jones"
 <ajones@ventanamicro.com>, "Mayuresh Chitale" <mchitale@ventanamicro.com>
References: <20250403112522.1566629-3-rkrcmar@ventanamicro.com>
 <20250403112522.1566629-5-rkrcmar@ventanamicro.com>
 <CAAhSdy0v7Cw+aGF8DDWh1gjTBXA23=H01KRK8R2LTQHLRHo5Kw@mail.gmail.com>
In-Reply-To: <CAAhSdy0v7Cw+aGF8DDWh1gjTBXA23=H01KRK8R2LTQHLRHo5Kw@mail.gmail.com>

2025-05-07T17:31:33+05:30, Anup Patel <anup@brainfault.org>:
> On Thu, Apr 3, 2025 at 5:02=E2=80=AFPM Radim Kr=C4=8Dm=C3=A1=C5=99 <rkrcm=
ar@ventanamicro.com> wrote:
>> diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/=
asm/kvm_vcpu_sbi.h
>> @@ -55,6 +55,8 @@ void kvm_riscv_vcpu_sbi_forward(struct kvm_vcpu *vcpu,=
 struct kvm_run *run);
>>  void kvm_riscv_vcpu_sbi_system_reset(struct kvm_vcpu *vcpu,
>>                                      struct kvm_run *run,
>>                                      u32 type, u64 flags);
>> +void kvm_riscv_vcpu_sbi_request_reset(struct kvm_vcpu *vcpu,
>> +                                      unsigned long pc, unsigned long a=
1);
>
> Use tabs for alignment instead of spaces.

Oops, I totally forgot that linux uses tabs even for alignment.

> Otherwise, it looks good to me.
> I have taken care of the above comment at the time
> of merging this patch.

Thanks, I'll post v2 without the three patches.
