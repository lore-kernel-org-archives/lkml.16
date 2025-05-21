Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5157C264637
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 16:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747846794; cv=none; b=iWZVqtBNSPVeBMI35rYSliqusgxinG6Sfh0nU9ZA/YJESW3v/o4gau1ue4oVwqve+RUfItrGY7oSGalNOBFjw90OIWRbVFeU4ken22ei8BZS8xlAQ32+o2l40sFUydkMIxSM5RtvhVKd1kKvJWKtfgHD5m9DNCvtvzxXDh8e7Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747846794; c=relaxed/simple;
	bh=y0v3mpA4u0yZ8hVDzPt7b0GP7skmvPxgwdsGFyF72PA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=t35FxCs11EYnPU7l/qoisyRm7zs7BbiCwRUS+F1xlhk8ucyYIWDi+Z5QDF54yEbuCap15mP3LR9azsH46+EcRlbh/BxZOffKOVm8UC7uFz+fLdhiMuc/UL9XAVjNKvPA2DFdhqRP8HIm1Wc7It5uutwff4TB4Y1rIPGDlbtT2kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PrDXzSNx; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PrDXzSNx"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-310a0668968so728531a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 09:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747846792; x=1748451592; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nn5fm8k2Ml1brz+kg+Xc6EKFqD1WyZfu8AZFfGZAdFU=;
        b=PrDXzSNxPBQ2P0BVCmg25kUgoAJQ9K3vJ4AkgHzl99eMXAZzbPSamcxgoguTmzZ+Bw
         9/ygqaI4MGQERA6AkbgV7vmrgu6YEfwRp+8Xvbi2OYv7tsk3jq5IESyZd8kB9Vk8CLIQ
         Ik2VtHG/v9/yQG9Fc/ZQz3vvcoN0GEKWEfT/criEP15AwhyQzvOcCW54W7DAXsLY5ka4
         lV0uyGDueX6BVTSgDUBIyBY4J4l6IQovTp90aV92s8PUnBeo6sQQSAo/ZQZ0Ed6RU7/O
         45yWARheb/dCMuWjkMqEP7pcDcNTquL2VjmK3Tf9gU8iSM+9Hla6UqIoCUaKfnBwIbZG
         WfEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747846792; x=1748451592;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nn5fm8k2Ml1brz+kg+Xc6EKFqD1WyZfu8AZFfGZAdFU=;
        b=h25dfZujlaL3V0obV8DI2C7vyIRS5vjzMe9MpOylYIZGC4wHyZnZNgQeOZdG+AnTIj
         YE/lk8y/jBLRex7wCxqMRwAbdSsZFFwEHv6vJK+GAdo9eqhBuSDI//dzCfMSpCDE02Ek
         9ky6wn303kXBAV3JsqCGyOXB54+Bu7aJCREp4VoMohPcjtXSInk9hGOlL+nqMD5ZHm9W
         vRpLdbp32XHuRpLzdcSeoNulephVQW66WVbY76zL7pW+oX3tZaDZia4fHjXpuPPFbtIz
         iftpjlSoX/nQGTsM41gG55qObPyxvZvK5Rz6yFbWWw7LDjfQoyAkU35vGE9JOUlxX9dV
         iS+g==
X-Forwarded-Encrypted: i=1; AJvYcCVfzEuu+di2RaVUqw8Nx+4L5PXBk8CWFx1r2kb4I1VEUc+q7AJ6vtDQcQwvo2Hv6Ri9tIBclemY3NSXMCg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXiM43hlHR0oKoG51jkkntF5DdJP9Sn3Es1H2QBBEHysT7NEu9
	PNuoG+hKy1fnq5l4pCh5QpXRPqfbcf6CqTSOuVaQm6ejo9Kq91e1ZBWqKaSZJ2dnRSDpUDs7606
	do/P8Mw==
X-Google-Smtp-Source: AGHT+IG6dBlWQxswmpzRlpBNWMeMsVzFwgqg9N/lMiD/6PEBD2Bv2fiNQRCTifMOfGMxFV8XX1aGvjOU8lY=
X-Received: from pjbsn4.prod.google.com ([2002:a17:90b:2e84:b0:2fc:aac:e580])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1dd1:b0:2ff:784b:ffe
 with SMTP id 98e67ed59e1d1-30e7d522171mr38492906a91.11.1747846792524; Wed, 21
 May 2025 09:59:52 -0700 (PDT)
Date: Wed, 21 May 2025 09:59:51 -0700
In-Reply-To: <aC0c4U6tsVif+M4H@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250512085735.564475-1-chao.gao@intel.com> <aCYLMY00dKbiIfsB@gmail.com>
 <ed3adddc-50a9-4538-9928-22dea0583e24@intel.com> <aC0c4U6tsVif+M4H@intel.com>
Message-ID: <aC4Gh0YMxFzNVws1@google.com>
Subject: Re: [PATCH v7 0/6] Introduce CET supervisor state support
From: Sean Christopherson <seanjc@google.com>
To: Chao Gao <chao.gao@intel.com>
Cc: Dave Hansen <dave.hansen@intel.com>, Ingo Molnar <mingo@kernel.org>, x86@kernel.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, tglx@linutronix.de, 
	pbonzini@redhat.com, peterz@infradead.org, rick.p.edgecombe@intel.com, 
	weijiang.yang@intel.com, john.allen@amd.com, bp@alien8.de, 
	chang.seok.bae@intel.com, xin3.li@intel.com, 
	Aruna Ramakrishna <aruna.ramakrishna@oracle.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Eric Biggers <ebiggers@google.com>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, 
	Kees Cook <kees@kernel.org>, Maxim Levitsky <mlevitsk@redhat.com>, 
	Mitchell Levy <levymitchell0@gmail.com>, Nikolay Borisov <nik.borisov@suse.com>, 
	Oleg Nesterov <oleg@redhat.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Sohil Mehta <sohil.mehta@intel.com>, Stanislav Spassov <stanspas@amazon.de>, 
	Uros Bizjak <ubizjak@gmail.com>, Vignesh Balasubramanian <vigbalas@amd.com>, Zhao Liu <zhao1.liu@intel.com>
Content-Type: text/plain; charset="us-ascii"

On Wed, May 21, 2025, Chao Gao wrote:
> On Fri, May 16, 2025 at 08:20:54AM -0700, Dave Hansen wrote:
> >On 5/15/25 08:41, Ingo Molnar wrote:
> >> * Chao Gao <chao.gao@intel.com> wrote:
> >>> I kindly request your consideration for merging this series. Most of 
> >>> patches have received Reviewed-by/Acked-by tags.
> >> I don't see anything objectionable in this series.
> >> 
> >> The upcoming v6.16 merge window is already quite crowded in terms of 
> >> FPU changes, so I think at this point we are looking at a v6.17 merge, 
> >> done shortly after v6.16-rc1 if everything goes well. Dave, what do you 
> >> think?
> >
> >It's getting into shape, but it has a slight shortage of reviews. For
> >now, it's an all-Intel patch even though I _thought_ AMD had this
> >feature too. It's also purely for KVM and has some suggested-by's from
> >Sean, but no KVM acks on it.
> >
> >Sean is not exactly the quiet type about things, but it always warms me
> >heart to see an acked-by accompanying a suggested-by because it
> >indicates that the suggestion was heard and implemented properly.
> 
> Hi Sean, John,
> 
> Based on Dave's feedback, could you please review this series and provide your
> reviewed-by/acked-by if appropriate?

The initialization of default features is a bit gnarly and I think can be improved
without too much fuss, but otherwise this looks good.
