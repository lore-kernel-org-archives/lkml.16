Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0358F20E310
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 15:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744989293; cv=none; b=h3krHPRW5BXwKe+u0sPfUeuEX+bAQzfOWATpmXtwcuNX37N2KoGsC3lRLp1fcl3JTs1FEV/0Jc9rQdre5kREF/lhpzuKTvhn8W8A8bQSMwHhqzDFnkoWiqpVAfwngVg8dNrZp8D3xRDwA88QKnTQJxjYTm2Hfysof/jc4MJMZpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744989293; c=relaxed/simple;
	bh=I8AmJAfFB1Br3VQWNtM8JST0BsY+1YK7YX16yQJsJTo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hrFiso7kTtMar8WTa5x11c1sV6AXTO4vGzh1w2ZneE4aubjRd+MQPwU71W4liEcYeyJGURZPj0dTBbQKhZiiA5WkLYBks3OwaNLkUMnWj8xFmQFX2Gw3czB9U0QCMEemWyB+ZzICnugeOZX16etjk2KklT7gaeKDSzw788D6qZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i+pfFv3d; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i+pfFv3d"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-227914acd20so25108325ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 08:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744989291; x=1745594091; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8tlr+U+ggvV9b6qUUYsEDpFnGs799KYouZS0u/xqDZw=;
        b=i+pfFv3dYiq/r/jmHge7o+I10NWya1G3bggXhn7OaIAHDKdfDMn0ILF9wgJ00fQrEB
         MYlXBDhNqQF9752hSK3xm4UACBHfn8NWAaQ1d3HYWoFiV/E1Kx8NcpYn8FAAGrGQdUS8
         XY71sCK5aWDEMlvtMQjSkxxJKo3z+KOLPsLc87G2u7FXGRvhkJ5PCynd5muK9GAT88Fq
         RzTmZ0fqUAjm1wAo0YmFPwHKU8FpYGE8z138fUi0eFOnrCqwtP/dFk7y2QSDICxxBup8
         2Lw3tzt32ts5KiTxjwe4EINmZ1WV1Eu4Mne6XOrIO/iCafxYd9L/sIzyhcOkmIqT3wGR
         FKXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744989291; x=1745594091;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8tlr+U+ggvV9b6qUUYsEDpFnGs799KYouZS0u/xqDZw=;
        b=vAZB+ygQHbMyOEYw5l77WStSbiUdrWyJuO6UXpeXt6jymLlx7rf22hcfCNA7Qp7Ulx
         TIz3uziJJRvqbxbyzyPHqPfQKI7uKN6VtiXZcR7RCaAnOFj/4N8uxHVl7R4ahS1wlY28
         X5/t0aAF8hCZus9GykpnUehxuvcx8adsA62UoQyE8qGZwVt9o6WDCFOgI1/7a/2ioDP5
         zWjAqoXC4gMpivIZEyRPH6HUDUESfJIleM5in90v3fZuRDr+8j2z//Y6sXLbVHT4zZ5Q
         TvrG27L3F6ttxtkvBl6oi6WKYkKRWUPQuBVKuw98Xof1niFFFEcXm05F3yccohKKfnFf
         VceQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3a0D63ZZk9u3G1E2nsGoMdff6kaYF4H2n6/inE9SE7TCpN76QuI83FYCj+9XhdWDjqTFgawZw2ZBDZpk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyab1CCEVIP3R4laFHWBanR94FUc0B0H57HbfPMs0dy1WcIRtYx
	HFSO/qT6zBirLMGeLvt6Wwv0MOopUHIehAXEppDvxGtNHPdrhjuz
X-Gm-Gg: ASbGncvmWCJTkssviUL/MpgJcfjiQt7WShPRoTdP2zjGdEKJAThzLR2W3H7comSgGlL
	zC298YHT/MfGnBkXeQJvkxruXgOBlXF60/fOjukAgV6PsFJTyDb2ROGXz3/05N6cEn14myQ1Mqx
	xjN3FewUm7TTpEA+plFjKF4O6hvAFNr3v+TALOYf/yOb8iHGIMA9IpOhFS/hncHTO3OvKf51ccV
	ouTRnI9WQUKOsypX6Wy5CJgvMnojyNyyPS3DSFkcWQOenQYvLvBVZs6SxkZS3P2cKk7HxRkwLUd
	CWD8k8wLcZp94QS8dHnpTkmW5NhVuG02h3mM4eg0
X-Google-Smtp-Source: AGHT+IFgH6kH8q8Ukkj38k3Ycwx8mgsM0+PlhclwOyMownQr5Lp6Z8YsDqQFALXwipkdJoGcEZeG3A==
X-Received: by 2002:a17:902:fc4d:b0:225:abd2:5e5a with SMTP id d9443c01a7336-22c50bd610fmr55082235ad.4.1744989291024;
        Fri, 18 Apr 2025 08:14:51 -0700 (PDT)
Received: from localhost ([216.228.127.131])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eb64fbsm17891505ad.158.2025.04.18.08.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 08:14:50 -0700 (PDT)
Date: Fri, 18 Apr 2025 11:14:48 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Luo Jie <quic_luoj@quicinc.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Julia Lawall <Julia.Lawall@inria.fr>,
	Nicolas Palix <nicolas.palix@imag.fr>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>, linux-kernel@vger.kernel.org,
	cocci@inria.fr, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, andrew@lunn.ch, quic_kkumarcs@quicinc.com,
	quic_linchen@quicinc.com, quic_leiwei@quicinc.com,
	quic_suruchia@quicinc.com, quic_pavir@quicinc.com
Subject: Re: [PATCH v3 4/6] arm64: nvhe: Convert the opencoded field modify
Message-ID: <aAJsaNdznnz-1qap@yury>
References: <20250417-field_modify-v3-0-6f7992aafcb7@quicinc.com>
 <20250417-field_modify-v3-4-6f7992aafcb7@quicinc.com>
 <86r01rjald.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86r01rjald.wl-maz@kernel.org>

On Thu, Apr 17, 2025 at 12:23:10PM +0100, Marc Zyngier wrote:
> On Thu, 17 Apr 2025 11:47:11 +0100,
> Luo Jie <quic_luoj@quicinc.com> wrote:
> > 
> > Replaced below code with the wrapper FIELD_MODIFY(MASK, &reg, val)
> > - reg &= ~MASK;
> > - reg |= FIELD_PREP(MASK, val);
> > The semantic patch that makes this change is available
> > in scripts/coccinelle/misc/field_modify.cocci.
> > 
> > More information about semantic patching is available at
> > https://coccinelle.gitlabpages.inria.fr/website
> > 
> > Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> > ---
> >  arch/arm64/kvm/hyp/include/nvhe/memory.h | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/arch/arm64/kvm/hyp/include/nvhe/memory.h b/arch/arm64/kvm/hyp/include/nvhe/memory.h
> > index 34233d586060..b2af748964d0 100644
> > --- a/arch/arm64/kvm/hyp/include/nvhe/memory.h
> > +++ b/arch/arm64/kvm/hyp/include/nvhe/memory.h
> > @@ -30,8 +30,7 @@ enum pkvm_page_state {
> >  static inline enum kvm_pgtable_prot pkvm_mkstate(enum kvm_pgtable_prot prot,
> >  						 enum pkvm_page_state state)
> >  {
> > -	prot &= ~PKVM_PAGE_STATE_PROT_MASK;
> > -	prot |= FIELD_PREP(PKVM_PAGE_STATE_PROT_MASK, state);
> > +	FIELD_MODIFY(PKVM_PAGE_STATE_PROT_MASK, &prot, state);
> >  	return prot;
> >  }
> 
> Following up on my suggestion to *not* add anything new, this patch
> could be written as:
> 
> diff --git a/arch/arm64/kvm/hyp/include/nvhe/memory.h b/arch/arm64/kvm/hyp/include/nvhe/memory.h
> index 34233d5860607..08cb6ba0e0716 100644
> --- a/arch/arm64/kvm/hyp/include/nvhe/memory.h
> +++ b/arch/arm64/kvm/hyp/include/nvhe/memory.h
> @@ -30,9 +30,8 @@ enum pkvm_page_state {
>  static inline enum kvm_pgtable_prot pkvm_mkstate(enum kvm_pgtable_prot prot,
>  						 enum pkvm_page_state state)
>  {
> -	prot &= ~PKVM_PAGE_STATE_PROT_MASK;
> -	prot |= FIELD_PREP(PKVM_PAGE_STATE_PROT_MASK, state);
> -	return prot;
> +	u64 p = prot;
> +	return u64_replace_bits(p, state, PKVM_PAGE_STATE_PROT_MASK);
>  }

This is a great example where u64_replace_bit() should NOT be used. 

Thanks,
Yury
