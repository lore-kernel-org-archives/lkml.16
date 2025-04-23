Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1C6267AF8
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 15:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745423759; cv=none; b=crqof3RdjdYO191uJlNG06qjtPl/3+ApPkIKzCsWs03OcTJR5y0RQwg9ss/xYDx9igO6tatUCE6zMsioQ+hw1wbQlroY1kkYvTI/NAJmBp/Pn05poz6iwiUT69awF+fxIE2J3qvVcm1gt0donxENNrFO4n1TYWOQHqUjc81Tl80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745423759; c=relaxed/simple;
	bh=+2Q0TqTUlO+XxdYqin3kJ59kqtlT8h5Kw4yFiitoAu4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Rpygm/Bl2Bn/9L+6gECa72paeWoXzD5vh4aNWXqgT8vezLlKRAIyZjv386OPiAl+t8zQYo7bglh6yb8vNM3AW+3wrOljENVrpYHyKHPa2O8th8BHyQbc0T2HtBKblz7Zl7c9ahyNSS/uKAwR8Fxj1o7dH4QhoERRX+XEuNJO7u0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4OVJxLgq; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4OVJxLgq"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2ff6aaa18e8so19791a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 08:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745423758; x=1746028558; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jmJGVTNM68EN1Na+PFsjzt6zkvxFPDOKXQFGaHd/MNo=;
        b=4OVJxLgq7yQkXec/gpLkz9iv5/PLWU420CoYpKP8880ek60gBNTCC0WFREfJp5KC4Z
         SaXDyam9s72dD5F5N0+6m7DHBUlZgtvea/DvRDjDISL2bziWggyAF/CQTsQ9B00ihEq7
         ufw7MTg2fTrpGrAlpz30CLk5U+2T16iMINDFXwFxvoUY0So2pjLYQuLouKpA6ENTFTiK
         cvczy//hU74hhep9XwQnQCiqGsruOeHIsKrlIhV6ca3t/mHRdS0gqj9wVndmzmcSU/VY
         lya36nqLTPxKD2sA3bC1cAsK+xFJdbAIvdOQ7Uc26drvjYDDwfhj1XXKCu5PlVDW8feO
         DCRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745423758; x=1746028558;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jmJGVTNM68EN1Na+PFsjzt6zkvxFPDOKXQFGaHd/MNo=;
        b=St+evLYKkjEvXkR2WzF4I29cYaoXLnIkzsSR2MBmsHtXC33GybkX+4rysFX4hGMQgp
         /tWeAI4u1QJWUdxDTmxLHGA+BOusn0IhFMwjd0V7y5PHBE9jyUS31HFpo1KadFf9JODW
         CyTfHqBYYCZw4uowcmm3dUeI8NGNyE9hQ2934X02C+s3NyNhSiTcPU+thp1h3PsBw6Hu
         Jofu1kkv0cxregxZtFm9aJ/tfHO26i5xDrNh2VDneMxLeFuiphxVFx/uqeh8eBtz6+D5
         WBiPsosUaiGh/LFd4PGoRWc3OmUiZPpWhglLhdG5500fFm5cH6DWzlwivr2UD+CSYDVz
         eNtg==
X-Forwarded-Encrypted: i=1; AJvYcCWNv1dEAM8/9g8uFH6+4I4WzjeDZSzJQcmie41VOUiQDuKUk168Wgtqw+92hjwoiXuezkhRHOaFN5rp1OQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YztsNr/xn1wOhIrNk+78cG32T8hrgc1Yvua3Vug+MwW6zWhUISK
	jLkS3GenrkAEtVgKsFhC4qcegXjLcOovx+bpsxuQF+si6guRinIrB7lNr/vL3JxRatIIL41HRAv
	yfQ==
X-Google-Smtp-Source: AGHT+IHnOGraDXWHVwtcHF/KJZows5bTw5g1o0e7YCWv5QZQLWNkV6iHhA0+G3682VIduWV5Xwdn6KbTATw=
X-Received: from pjyp14.prod.google.com ([2002:a17:90a:e70e:b0:2fa:15aa:4d1e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2404:b0:309:eb44:2a58
 with SMTP id 98e67ed59e1d1-309eb442db3mr417907a91.22.1745423757994; Wed, 23
 Apr 2025 08:55:57 -0700 (PDT)
Date: Wed, 23 Apr 2025 08:55:56 -0700
In-Reply-To: <15e24c455fb9fca05b5af504251019b905b1bd77.camel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250404193923.1413163-32-seanjc@google.com> <15e24c455fb9fca05b5af504251019b905b1bd77.camel@gmail.com>
Message-ID: <aAkNjKIleB97r2fe@google.com>
Subject: Re: [PATCH 31/67] KVM: SVM: Extract SVM specific code out of get_pi_vcpu_info()
From: Sean Christopherson <seanjc@google.com>
To: Francesco Lavra <francescolavra.fl@gmail.com>
Cc: baolu.lu@linux.intel.com, dmatlack@google.com, dwmw2@infradead.org, 
	iommu@lists.linux.dev, joao.m.martins@oracle.com, joro@8bytes.org, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, mlevitsk@redhat.com, 
	pbonzini@redhat.com
Content-Type: text/plain; charset="us-ascii"

On Wed, Apr 23, 2025, Francesco Lavra wrote:
> On 2025-04-04 at 19:38, Sean Christopherson wrote:
> > @@ -876,20 +874,21 @@ int avic_pi_update_irte(struct kvm_kernel_irqfd
> > *irqfd, struct kvm *kvm,
> >  	 * 3. APIC virtualization is disabled for the vcpu.
> >  	 * 4. IRQ has incompatible delivery mode (SMI, INIT, etc)
> >  	 */
> > -	if (new && new->type == KVM_IRQ_ROUTING_MSI &&
> > -	    !get_pi_vcpu_info(kvm, new, &vcpu_info, &svm) &&
> > -	    kvm_vcpu_apicv_active(&svm->vcpu)) {
> > +	if (new && new && new->type == KVM_IRQ_ROUTING_MSI &&
> 
> The `&& new` part is redundant.

Ha, good job me.  Better safe than sorry?  :-)
