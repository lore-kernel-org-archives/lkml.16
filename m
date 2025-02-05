Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEBF922A4FE
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 09:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738749482; cv=none; b=bOrMqOfRTee+y7tQBaoAQgQq9sj+NILeb4gteW2YFpse6ckOughdG1BVeNqkZ16krcKsZnq0ZKPdYEfcO2YVKoshtYbf/6J5NZ3FtHJRFbT91Sqg53VCCS+sBOkQYNcBHwPoGiuJpla39ZD6K5ijx6D8qt47V1ILvVcMzCPmpnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738749482; c=relaxed/simple;
	bh=Nq/kqlSP3svTs4A+e6SOH1ClmbqaPxsVt5+MQGotkk0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mL62DebwL+3tVbVhnWFdSeQ5unSkPPzjfHzbiJ/TosjHmelfrKsRyWdah+6IXZkbnf9andNr8XTGLGRp6RLkNnRyl2nEWt1GZbvr1lawIWnTFnACIfdfTStUlxbl9eyagLtdbcnrE0qLLFscIS31GrEFHYFpUV0iIefOAuTY2K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3lrzisyH; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3lrzisyH"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ab6ed8a5a04so1098603066b.3
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 01:58:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738749479; x=1739354279; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WbnvWfX7jxBUPOrY8qkhn5UbcYi3tt6+vaZLeX9aDhI=;
        b=3lrzisyHyjFW1xdE1qRign07v4pL+2Nq6ly8NrbkuS7ZxmFgGZgfdEU77ZzSAIQerq
         stkAFk7aSXhsT1bnkRZsPahfAR2Ebk1CLStgaevmXRuzTX+liOgWaZdP7nJMPYRzTYiJ
         tRCgZnuRWBx38ARuQooAIafyehObo22YTQDjh2zrDIFwiBfSSZgWwMUjWzeZEmYHFoxq
         3Pf6pr/sC6sIi7DPT6A3tIVXspapld/u0dndOKMsvNq9zZEfXDpGB/uDb7qSa0wTrMiq
         16Wi0braczV7LoogkutXsMTLE659vLRN2cNlcPv5VepL73O7WpXhIaCmTNC841LGfWSL
         1/5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738749479; x=1739354279;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WbnvWfX7jxBUPOrY8qkhn5UbcYi3tt6+vaZLeX9aDhI=;
        b=Ib2sXXEnIxXsQGPOb/nC3tHb0DO0rpkJp5WXwmhDlZr8k/PPgjXAFMDzuZ+qUa6KVi
         /BZO30jGB2VMviAKPJQADtQ/djaXn93c/IH4xLJF/MK+iozYhXd5hCCTTxiDvdpA3O7y
         f4vhyABzeWB/2pCCOhtxBqGIQoSvtOvpNclC8vMuaM9vXc0py+VEx2nT1tmWk0HCwZZH
         /Ka5+9uM+5eU8LWEdxp3zWlfklX32vDmZYsqv20F6ZFMMnPDwYHLvEAu6Chbj4flXaw9
         50wYd2EudBd8VXp6OlO9J9hS4UyxFv+KbllYSnSfjXBIQVMH+KUN63jGDJBI9roOAHzu
         k/vg==
X-Forwarded-Encrypted: i=1; AJvYcCVeWDpiI70lk//xaOSskK5go/BLcw9+ujE0rI/exx0oGG/DC4zkaERxsqQEg81ssdChuSOuq6MfwJmAHzU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGrK3OhO+62lrh6K7vkOkRlH37vjOkfQBgoGXKj6X02oGURfcv
	BrNMBST/5t+RPwwEPQNrj+snnky8k7j+PX+SlptAcF7dS2IKoPaJZkBD2/dKfw==
X-Gm-Gg: ASbGncsCJFUrC2dEA27eDmhWn6r+xF9FiVm2ABe/8ark4fgbiCZXXZKwSQhzL0nO5ky
	AVzqrWR9A1b88KxASzjJposX765DamCoCEd+DARImB2kxzeDZp29c2K3VA8Go5pZSmvSqNnGpr2
	mA5eKpmN0KQ2DxENAqVbecBqNzX+cwYEy/ThHBlJBGl2X+dTWDYMNRVH8t75tyCQZlz2b+sPxTM
	3FuE1req/ZkSWOmJr4rONhMec8Sb5cUpHPzfAb5t11jSXKwXqTuzmyYFCJXFNWxwJesxj0FAu9V
	WHghLo2i4nI94MLd33K8F0isCWh1ar8p9vynqV0eqvSB2iWrWzU4
X-Google-Smtp-Source: AGHT+IHlSCxcM4Gf9CJt6IMxYC+rLq5h9k2XD0ViVMFq5Bpo0iQeCY5EvWVi/Z+I81xJb2BJo1RUeA==
X-Received: by 2002:a17:907:7b82:b0:ab6:f89d:5a7 with SMTP id a640c23a62f3a-ab75e26358fmr257421066b.34.1738749479093;
        Wed, 05 Feb 2025 01:57:59 -0800 (PST)
Received: from google.com (229.112.91.34.bc.googleusercontent.com. [34.91.112.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e47d0dfasm1077074666b.71.2025.02.05.01.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 01:57:58 -0800 (PST)
Date: Wed, 5 Feb 2025 09:57:54 +0000
From: Quentin Perret <qperret@google.com>
To: Mark Brown <broonie@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>, uJap072421@linux.dev,
	Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Fuad Tabba <tabba@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Sebastian Ene <sebastianene@google.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 09/18] KVM: arm64: Introduce __pkvm_vcpu_{load,put}()
Message-ID: <Z6M2Ir6uAT8KcWma@google.com>
References: <20241218194059.3670226-1-qperret@google.com>
 <20241218194059.3670226-10-qperret@google.com>
 <5ca7588c-7bf2-4352-8661-e4a56a9cd9aa@sirena.org.uk>
 <Z6FO04PZtY8fsJhq@linux.dev>
 <5b73e1ac-a48d-4064-a095-26cd9662f0c1@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5b73e1ac-a48d-4064-a095-26cd9662f0c1@sirena.org.uk>

On Tuesday 04 Feb 2025 at 14:32:19 (+0000), Mark Brown wrote:
> On Mon, Feb 03, 2025 at 03:19:03PM -0800, Oliver Upton wrote:
> > On Mon, Feb 03, 2025 at 07:50:44PM +0000, Mark Brown wrote:
> 
> > > Current mainline crashes when running the arch_timer_edge_cases selftest
> > > in pKVM mode on a LibreTech Le Potato board, with a bisection pointing
> > > at this change.  The system dies like this:
> > > 
> > > # selftests: kvm: arch_timer_edge_cases
> > > [  130.599140] kvm [4518]: nVHE hyp panic at: [<ffff800081102b58>] __kvm_nvhe___vgic_v3_restore_vmcr_aprs+0x8/0x84!
> 
> > Thanks, fix posted here [*], although as a consequence this machine will
> > stop running KVM in protected mode (which was never meant to work in the
> > first place).
> 
> Yeah, I wasn't clear if this was something that was intended to work or
> not - it's all in a constant state of flux.

FWIW a770ee80e662 ("KVM: arm64: pkvm: Disable GICv2 support") did try to
explicitly disable things, but was clearly incomplete...

Thanks guys for the report and the quick fix!
Quentin
