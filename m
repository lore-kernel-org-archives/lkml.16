Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B401078F
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 13:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746711153; cv=none; b=W0jU68C5tVzQrdWl0SIjKEtSZX40e2nX7lV2+f5OsUQWeyCzGUtQqUFC8avNatwAWsNHBgIYe7C2ersEJaSc8xFDYWv3tzPoJqhv700S7agYAYmipAgrKcyLjr4rL3PdIEP3+3nz32vuWw4hXMobt3m7JYOWQ+sermn6/PG8eEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746711153; c=relaxed/simple;
	bh=UaX7lHk6APGzrlNbZtyPi82/m8GJkmtjAztxLDCFxtM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=Vddx9BCFmLvSxF6u4CBDfg13edtWeuInRgDfW0T7SyR/uIz0mjLynrc/08fhlrDNU/4mmFJHwNQEa1Or4UQ230N8HdxI7qDLUr80OEzk1TcrZttw0C2pb52MyS2ZAqbnSOR+thPFcDyPugrd4ubXkusGw3dFjW5zdn2HBdIezks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=KLrTbFlp; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="KLrTbFlp"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cee550af2so422795e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 06:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746711149; x=1747315949; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ctop9M+S6pXp/ivb7RmdzyIsAM5dZO8eB9pvvIkCEbM=;
        b=KLrTbFlpR9vF/XiDJfMDK1ST0j/y9ahE3N6zOECj38aO3xGC8SSqB6BwFdrYf/2AjR
         Vk04OC7b0mTe1GYE8d+FEk0wXgArLp0AnZxLZcFsx0851Qz8qV8vdystFMGzGZbyU4RS
         X2rD5ZI6SweGZU+IGB9i6mUQ1UnQdpzKMG/cHqX7ncCQxgiMSqdTxhRxAj4W7Cb4DLvO
         JO7byWMbBm5+oFH1jeVkq0bMFq0Sh+4s0RnpRgqjUu5F+TE8tUVClYvtccDM5NtzLgQv
         dMbBHVPJ6hCPa0Q/6cIYBAHM0ANjIni0B4L3oR8aijJAuiISpIZWshRfgi3OtE5v/2XL
         hzyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746711149; x=1747315949;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ctop9M+S6pXp/ivb7RmdzyIsAM5dZO8eB9pvvIkCEbM=;
        b=ksyg/czgqoZBCOqEVTMz8lDmILbiTBemvT3VG6X/uhVw/niTyubThTDtLON/33oMAU
         Oowpzs9xPrktEVEhktuVEeFnVxXMnTN3TLfJyv7AAYQNbKi8qlnrnBpU2Bd54qAHOjeU
         mMavsh5f39CPgtHRxX40V6rVEp4FCbVP0eC7oRYLUpOx4LUy2CXXukB+q/udafhvKTxr
         C14tKa1/i/3WjcvogQOs4CZ8mzLwZR17i/Im/1jabO4KOBHiqG7O2mYSAjeZaEmEHanm
         h8rwhwJeruMt6b7VVxlnDSvQS6C1971pl8hKVy/6/YZsDrH2UT6aK33IakLqQX/xSQb9
         lyTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzHtRuQaVIvaHPy5rzzIEIN5Ehz+plg5eYBZI1rutVizT85wgmUlBGDp1whzTgOKXjQ70M/yrzoBJJlLA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTSuWanrysbGsA8laxWbMgXc/tbpyGVw+6jnsghShE2ybJlS2t
	YE4HEDCGIe4t7t4GFyqjMp9TpOi7tw7ejV64Q6HNzsEa6cv3CJzkzAOfuiUyLoo=
X-Gm-Gg: ASbGnctkpB50DHXPMfg9KxgMuIc5wLrwSsWJHVzvegsBsWL5vs/IJhKhVS/N80oAKGr
	85te1ODAhWIVhqqwBx1Xxlao/Sn6Xr4IBCIx810xcWveTAV/EIPvyM7bUH3B++zkruhHOKisty5
	J82mtNjzXgmpRa/QVAasR0UTCYgRhZVPM+EdwxPoFZ2XwwGj6h9ebc7SH1+kZKCWlNdK9XJ0gQo
	q6fVoG0yGBuXf02WlH6D3ihmYXpz8jjgaZMKQVwa2rqnGJ+HO1pUZluYUZMEP8GTxk0oiDHBkN8
	fbB2jDRTWrmfXs/C4qf8eCNUetXssBE03VrELxN6NysyEC5J
X-Google-Smtp-Source: AGHT+IFV8Gdwh/t9ZunwZV8yC9Gjd4YDqTg8K4dFRuyEe/kGcOgQumaKBu9osZaWckRfANKTr0Qn6g==
X-Received: by 2002:a05:600c:cca:b0:439:a3df:66f3 with SMTP id 5b1f17b1804b1-441d44e57d6mr24537645e9.6.1746711149535;
        Thu, 08 May 2025 06:32:29 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:a451:a252:64ea:9a0e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd32b0c8sm37984755e9.3.2025.05.08.06.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 06:32:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 08 May 2025 15:32:25 +0200
Message-Id: <D9QTFAE7R84D.2V08QTHORJTAH@ventanamicro.com>
Subject: Re: [PATCH 4/5] RISC-V: KVM: Enable envcfg and sstateen bits lazily
Cc: <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
To: "Atish Patra" <atishp@rivosinc.com>, "Anup Patel" <anup@brainfault.org>,
 "Atish Patra" <atishp@atishpatra.org>, "Paul Walmsley"
 <paul.walmsley@sifive.com>, "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Alexandre Ghiti" <alex@ghiti.fr>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250505-kvm_lazy_enable_stateen-v1-0-3bfc4008373c@rivosinc.com> <20250505-kvm_lazy_enable_stateen-v1-4-3bfc4008373c@rivosinc.com>
In-Reply-To: <20250505-kvm_lazy_enable_stateen-v1-4-3bfc4008373c@rivosinc.com>

2025-05-05T14:39:29-07:00, Atish Patra <atishp@rivosinc.com>:
> SENVCFG and SSTATEEN CSRs are controlled by HSENVCFG(62) and
> SSTATEEN0(63) bits in hstateen. Enable them lazily at runtime
> instead of bootime.
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
> diff --git a/arch/riscv/kvm/vcpu_insn.c b/arch/riscv/kvm/vcpu_insn.c
> @@ -256,9 +256,37 @@ int kvm_riscv_vcpu_hstateen_lazy_enable(struct kvm_v=
cpu *vcpu, unsigned int csr_
>  	return KVM_INSN_CONTINUE_SAME_SEPC;
>  }
> =20
> +static int kvm_riscv_vcpu_hstateen_enable_senvcfg(struct kvm_vcpu *vcpu,
> +						  unsigned int csr_num,
> +						  unsigned long *val,
> +						  unsigned long new_val,
> +						  unsigned long wr_mask)
> +{
> +	return kvm_riscv_vcpu_hstateen_lazy_enable(vcpu, csr_num, SMSTATEEN0_HS=
ENVCFG);
> +}

Basically the same comments as for [1/5]:

Why don't we want to set the ENVCFG bit (62) unconditionally?

It would save us the trap on first access.  We don't get anything from
the trap, so it looks like a net negative to me.

> +
> +static int kvm_riscv_vcpu_hstateen_enable_stateen(struct kvm_vcpu *vcpu,
> +						  unsigned int csr_num,
> +						  unsigned long *val,
> +						  unsigned long new_val,
> +						  unsigned long wr_mask)
> +{
> +	const unsigned long *isa =3D vcpu->arch.isa;
> +
> +	if (riscv_isa_extension_available(isa, SMSTATEEN))
> +		return kvm_riscv_vcpu_hstateen_lazy_enable(vcpu, csr_num, SMSTATEEN0_S=
STATEEN0);
> +	else
> +		return KVM_INSN_EXIT_TO_USER_SPACE;
> +}

The same argument applies to the SE0 bit (63) when the guest has the
sstateen extension.

KVM doesn't want to do anything other than stop trapping and reenter, so
it seems to me we could just not trap in the first place.

Thanks.
