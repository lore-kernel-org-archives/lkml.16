Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ADB328E5E5
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 18:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745432831; cv=none; b=olyHrW5iPU1zmeQlDaK+aZFVer5hB/xzK0oOcidzBMiEtBcAMdk0pePkMyYi1CBVsoO8/Ile9VAQCfXzM1tkcsGwredgc0IyDugn3+F+w3ZBYeXONleTj9widfbugKpBwF0BAF/jMbHlME+dAq7cuoq1tajNSNZgxybwpuIPvN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745432831; c=relaxed/simple;
	bh=zL5sHdCz+7jA44O4hfuhtBQLvE34dKh9l74abBoAdBk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HLdWhDeIBhhKdqrlBilVhhocmhjpF0hQpoqGbT3fhwKVum9sxz8U7Hk/sRZkHKHEm303S1QzlDRTAYPGTPrVJDeaRAhFaF0W4t4b2jIYH5x/wrDNnn8WMzai0ky8JqjxJv3XPU2arZrj0JgJoK603J5Bftz7hCbbR/suLRt5COk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jcjTmWUo; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jcjTmWUo"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-736c277331eso1352527b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 11:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745432829; x=1746037629; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3g25cudfdER1fultAc6guoG7d90Bj2J+6OCH21hX/70=;
        b=jcjTmWUoCdNNt83Pxxb/JbjRk6k/zaO5blqQbOPiunD/olHaxDsQJmlqRPHqG2I6u1
         Y5pexx5+98MPXbni2UCTLBd+wGOumy0JmvdzPMAo69O8m84un1gGXGQTCmz0aqpmVQXd
         OmThiWJjfwDGf/pbyyhsq5gkjuonPAItcsJQzO79vg351w/TBNeYiVJv+qFk2wfzFbBM
         PBbw58Jpovug5Pgx8VnxRkAIGItPEC0hHKGDpD88TAweFjBb1qqchOqWDsrC5iZvvI3s
         ZzNjKJ772c2fTGDSerJFu4mmCLQP+13hrUl/4SaPSzKR7DOYCi3SCFScMjS4LPFuqmvh
         ouqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745432829; x=1746037629;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3g25cudfdER1fultAc6guoG7d90Bj2J+6OCH21hX/70=;
        b=pfdv3VJefYsHRb7HPTKK0WkDTfMXEkstNBKE+VtOzEeetKLfyEiOTsyIe+hTgPp7Xw
         Yz7iSZq2onu6lcpdIBEEl0DKW8P3+5pPZO13er910dGyTWpwO4RcyhIDsfhENAOZXiI0
         /GxIuFUFCX0fFfHc1OdSGYG9EQXf91q6lu/2ppxHkbpe7rM8oGVWGdFM0jZLa4/9PM5K
         8UBX8+9+SVS1ZxkpRxCmT/bsAe/Cm7vCxH0JyQw4vq5l0fWN0wAJVnatxdnyruqTDWbb
         2TYPWDhCr2Oh56oVRP6VSt6GoG7wZTmNOZdY7YAQqg6jNyZx3KtJ/UEjdrqS+y6n4GTx
         uUBg==
X-Forwarded-Encrypted: i=1; AJvYcCX8egOnOu8utqhh6Sv+KUdIUUmFSEyVyuHo+je8q75LsoyuLRv5lg6zQbk2oJv7PSqfQ157W1cL55BC6gQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKCEujpDVujTzV7mCtRAwnJW9z40cCfPIolII0epF3+wD/+6Jj
	uKOSS7gNZdGQm1I3vwpY4Bx8ZfiO4wikrpXp82nzBdEBz1DWceE+
X-Gm-Gg: ASbGncta0TsyGz9ErwFTF5JIJCbKIhmYpf+1E6qdd/vtRSirKl/9Y0F4Brx2skkUhFN
	2nmE3i/yZI3hC1PXtkaxzgkCZT1QMKvotpdwLzSgITUpsHx7AG3uuTGXQXZrdp24XhunNnlSPOa
	82d35KSnWWEbpzfT+FvsZOpUnt7NAqHBMSYDzBJG7A1TxTvgSLLCuqN3ai06hNgcIoHRDrhhNIB
	v2t2j8PvlXJEbzGaKXiza1DB85mhoho125jFQTvlAxM8PYpyIGwSgtQ/KziA5kruVdGCZp43sNR
	LxxEqo+CeD0XsOISZFeFb1KJK8XUtidi08mx6Xg0bjYFgFFfaSo=
X-Google-Smtp-Source: AGHT+IGHyaRCja82Jp63ca6tDfY0vscU4gtWT0BCYYEH2SbVC6BGq3lUVFXS6KtlFAXf+XFDnn7bog==
X-Received: by 2002:a05:6a21:9105:b0:1f0:e2d0:fb65 with SMTP id adf61e73a8af0-20442d54a7fmr200581637.2.1745432828582;
        Wed, 23 Apr 2025 11:27:08 -0700 (PDT)
Received: from localhost ([216.228.127.130])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfa5d084sm11268524b3a.103.2025.04.23.11.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 11:27:07 -0700 (PDT)
Date: Wed, 23 Apr 2025 14:27:06 -0400
From: Yury Norov <yury.norov@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Marc Zyngier <maz@kernel.org>, Luo Jie <quic_luoj@quicinc.com>,
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
Message-ID: <aAkw-tFctkk3xyS8@yury>
References: <20250417-field_modify-v3-0-6f7992aafcb7@quicinc.com>
 <20250417-field_modify-v3-4-6f7992aafcb7@quicinc.com>
 <86r01rjald.wl-maz@kernel.org>
 <aAJsaNdznnz-1qap@yury>
 <aAkn8lvzoa1grdkt@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAkn8lvzoa1grdkt@shell.armlinux.org.uk>

On Wed, Apr 23, 2025 at 06:48:34PM +0100, Russell King (Oracle) wrote:
> On Fri, Apr 18, 2025 at 11:14:48AM -0400, Yury Norov wrote:
> > On Thu, Apr 17, 2025 at 12:23:10PM +0100, Marc Zyngier wrote:
> > > On Thu, 17 Apr 2025 11:47:11 +0100,
> > > Luo Jie <quic_luoj@quicinc.com> wrote:
> > > > 
> > > > Replaced below code with the wrapper FIELD_MODIFY(MASK, &reg, val)
> > > > - reg &= ~MASK;
> > > > - reg |= FIELD_PREP(MASK, val);
> > > > The semantic patch that makes this change is available
> > > > in scripts/coccinelle/misc/field_modify.cocci.
> > > > 
> > > > More information about semantic patching is available at
> > > > https://coccinelle.gitlabpages.inria.fr/website
> > > > 
> > > > Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> > > > ---
> > > >  arch/arm64/kvm/hyp/include/nvhe/memory.h | 3 +--
> > > >  1 file changed, 1 insertion(+), 2 deletions(-)
> > > > 
> > > > diff --git a/arch/arm64/kvm/hyp/include/nvhe/memory.h b/arch/arm64/kvm/hyp/include/nvhe/memory.h
> > > > index 34233d586060..b2af748964d0 100644
> > > > --- a/arch/arm64/kvm/hyp/include/nvhe/memory.h
> > > > +++ b/arch/arm64/kvm/hyp/include/nvhe/memory.h
> > > > @@ -30,8 +30,7 @@ enum pkvm_page_state {
> > > >  static inline enum kvm_pgtable_prot pkvm_mkstate(enum kvm_pgtable_prot prot,
> > > >  						 enum pkvm_page_state state)
> > > >  {
> > > > -	prot &= ~PKVM_PAGE_STATE_PROT_MASK;
> > > > -	prot |= FIELD_PREP(PKVM_PAGE_STATE_PROT_MASK, state);
> > > > +	FIELD_MODIFY(PKVM_PAGE_STATE_PROT_MASK, &prot, state);
> > > >  	return prot;
> > > >  }
> > > 
> > > Following up on my suggestion to *not* add anything new, this patch
> > > could be written as:
> > > 
> > > diff --git a/arch/arm64/kvm/hyp/include/nvhe/memory.h b/arch/arm64/kvm/hyp/include/nvhe/memory.h
> > > index 34233d5860607..08cb6ba0e0716 100644
> > > --- a/arch/arm64/kvm/hyp/include/nvhe/memory.h
> > > +++ b/arch/arm64/kvm/hyp/include/nvhe/memory.h
> > > @@ -30,9 +30,8 @@ enum pkvm_page_state {
> > >  static inline enum kvm_pgtable_prot pkvm_mkstate(enum kvm_pgtable_prot prot,
> > >  						 enum pkvm_page_state state)
> > >  {
> > > -	prot &= ~PKVM_PAGE_STATE_PROT_MASK;
> > > -	prot |= FIELD_PREP(PKVM_PAGE_STATE_PROT_MASK, state);
> > > -	return prot;
> > > +	u64 p = prot;
> > > +	return u64_replace_bits(p, state, PKVM_PAGE_STATE_PROT_MASK);
> > >  }
> > 
> > This is a great example where u64_replace_bit() should NOT be used. 
> 
> Why not? Explain it. Don't leave people in the dark, because right
> now it looks like it's purely a religous fanaticism about what
> should and should not be used. Where's the technical reasoning?

Because enum is an integer, i.e. 32-bit type. Now, the snippet above
typecasts it to 64-bit fixed size type, passes to 64-bit fixed-type
function, and the returned value is typecasted back to 32-bit int.

Doesn't sound the most efficient solution, right? On 32-bit arch it
may double the function size, I guess.

But the most important is that if we adopt this practice and spread it
around, it will be really easy to overflow the 32-bit storage. The
compiler will keep silence about that.

Fixed types are very useful in their specific areas - cross-ABI data
transfer, etc. But mixing them with native types like int may hurt
badly. 

Hope that helps.

Thanks,
Yury
