Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D381DED69
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 16:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749054505; cv=none; b=pdW8ipCKGM3Xghm2GwzNfWPeKMxMs5b4Rw4JxPnTaDnb3xvvlcME9wqdTXJrww3nZzWztauKxzo6QfjrfY8EFAxwmMapmqm0IpsNvdknwbBxwe22bedoY9DdZwN6MqUoQ/X3A2asRK38QcJBGoR6mBAlnWQVt/ca5G9v0VxbD4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749054505; c=relaxed/simple;
	bh=ZJyIckFTExpj1Y90auHWc4FV90jywqVwpSKCRNl8zVM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ivpLboILITFsfy/mZBX7fDypL4Z8IP/CExWr9xRptL1yb/iIBjtbpKvmwsJkYRrPSgFgmS2DW4hGDVLEOczuAZeibsTn3/4cgmyFEDMvfdWRT8H9y9pu/bTQUl/oxMGkCB7zPAnFls+3QDjFAPf8/rnxdLGmyb4X1jGz0EHcimA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=P+brBL3G; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="P+brBL3G"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b2c36951518so6373440a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 09:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749054503; x=1749659303; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1/PzlSGATB5QLnfIO/9xMz9wdcBK9gS0k4KlE7K+2X4=;
        b=P+brBL3GL+WkCqCZG73OPSkr1aeaFNiXEruGWSKDXLPmxdiJxBfu+xZmMeMYQDOBrN
         yvWoBMvhf/SjodiTb13kEGg2iIDG584yORArRgQH+6CoLI19I2RV4d4xtdB5u/F2ofvI
         bUlWii+utYBh0MBoiBqrZdFPijc4gPRPGFtcS/bsHY9oLzPKdK3YHlQAFT1OYD4ujQjV
         hKOcDzPyEKp0N4kjG6bHYhk1gAXCnsRiYgfQs1nP0Fc3dx2BHPiwqMFbYoRONDWoaAwh
         hQQCjMbDCE/yck5DLAi33NsXJzp/w0xPVznk10EgLQB9PfgBxE9JAM3f8kvl4/AXkY+A
         o9Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749054503; x=1749659303;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1/PzlSGATB5QLnfIO/9xMz9wdcBK9gS0k4KlE7K+2X4=;
        b=FxjTLPhzf3ufx9q4l+bY3SVbFWYHBDpRe9vNhB8B3lsbl5DHTz0Oi1IXS2TIAkciNI
         +hjtXdR1HCp735A4++aHLBAFeENiyJkYWsE47mmmC6GfjXnuCOyNGYgn43KjO+dinHA6
         W8NN8KRGxP9ZXvn+xQov5bChnpVEPSYJHutYn1mcZdjy+TunZZb1pGELetly1EvZ6EHI
         hoJkcCLvpbgUGue9EJDsYRYoqd8GVTmuS7wgVjhk3huQ8m7L/N6sFwpeOhW0A+qk2Dbu
         tx3Cx5nTgrB6bFsre7AS0/d8VQBbfDhMrVxlVNxtuV+wWSBcuLIBpM4Lw+5N2104NarO
         Hndg==
X-Forwarded-Encrypted: i=1; AJvYcCUAnN3hO49s/5JB0ctvQxr/JRjXc3vM+0+pAPm0Lyn4Q9khIju6Z43r7ZPYXvwOjymm00Hoa3iTUWsMMic=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1GhIgam7gLTB/EsiGfNflnao2/Q4wdADui9WV+iq7TAME+kVh
	LNxIYh97rGERbbl9ZvmnTWSwmpGobNci7Itj479qAB2Fiu2ruL3THvDtyCHnwVSfc2JozdUzqYp
	UuhNSxQ==
X-Google-Smtp-Source: AGHT+IEKjmRcgY92eBfv/tMGluyG//CiEtS2rija0phY6qR/oNwBHkY8e9r7FMkUXjtbaeAfSjA+T/QL5JE=
X-Received: from pfjt21.prod.google.com ([2002:a05:6a00:21d5:b0:747:a97f:513f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:a24b:b0:1f5:a577:dd10
 with SMTP id adf61e73a8af0-21d22c86371mr6166950637.36.1749054503567; Wed, 04
 Jun 2025 09:28:23 -0700 (PDT)
Date: Wed, 4 Jun 2025 09:28:21 -0700
In-Reply-To: <a9f3f64c-2f82-40b0-80c0-ed1482861dc2@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250529234013.3826933-1-seanjc@google.com> <20250529234013.3826933-26-seanjc@google.com>
 <a9f3f64c-2f82-40b0-80c0-ed1482861dc2@redhat.com>
Message-ID: <aEB0JZJNs3dDZWJx@google.com>
Subject: Re: [PATCH 25/28] KVM: nSVM: Access MSRPM in 4-byte chunks only for
 merging L0 and L1 bitmaps
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Borislav Petkov <bp@alien8.de>, Xin Li <xin@zytor.com>, Chao Gao <chao.gao@intel.com>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"

On Wed, Jun 04, 2025, Paolo Bonzini wrote:
> On 5/30/25 01:40, Sean Christopherson wrote:
> > @@ -1363,8 +1357,9 @@ void svm_leave_nested(struct kvm_vcpu *vcpu)
> >   static int nested_svm_exit_handled_msr(struct vcpu_svm *svm)
> >   {
> > -	u32 offset, msr, value;
> > -	int write, mask;
> > +	u32 offset, msr;
> > +	int write;
> > +	u8 value;
> >   	if (!(vmcb12_is_intercept(&svm->nested.ctl, INTERCEPT_MSR_PROT)))
> >   		return NESTED_EXIT_HOST;
> > @@ -1372,18 +1367,15 @@ static int nested_svm_exit_handled_msr(struct vcpu_svm *svm)
> >   	msr    = svm->vcpu.arch.regs[VCPU_REGS_RCX];
> >   	offset = svm_msrpm_offset(msr);
> >   	write  = svm->vmcb->control.exit_info_1 & 1;
> > -	mask   = 1 << ((2 * (msr & 0xf)) + write);
> 
> This is wrong.  The bit to read isn't always bit 0 or bit 1, therefore mask
> needs to remain.

/facepalm

Duh.  I managed to forget that multiple MSRs are packed into a byte.  Hrm, which
means our nSVM test is even more worthless than I thought.  I'll see if I can get
it to detect this bug.
