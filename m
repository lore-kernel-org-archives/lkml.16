Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A5A248F58
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 21:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749676625; cv=none; b=cxdDabwxaRPAwpw/D2HApWrWzdboYD5eV9/6w51EqjYptv8IEjrRQmBbSFB2mguPoRLlJ21xWpHlp4YpPToChnRDGdBp5MPDWzj8Kn/GiVNYds3M3KckHgOSrm7Tgt/YpvNNaVmZ/d9yV/QrkVjlCuD9H65N+VXhOkAy0WGzTLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749676625; c=relaxed/simple;
	bh=l18NNuz2zr+jRstrv6kyMt+9mV72sgFutUjjJmTOoto=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lsbN1o3PxG1XUfOVkN1UmvT1TmaZ1KcRUfZ+BUgfXqfjZp/9c10feesTQXEt7mT3HfjZcKJAMG+i6P3OgCtCfUNn+XKBbyiaD/wie8iMQ8G0xa7GUhZOHtUEz3XhGoIzHQwexNj4D6bELg/fxS58xvKVZEhETAqummDf+ODKtW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--afranji.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BejBy1vI; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--afranji.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BejBy1vI"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-7395d07a3dcso199631b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 14:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749676624; x=1750281424; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=AY4z8bScFURq5DitqWrBML6dYMJAiXsDf7kOOKjRLig=;
        b=BejBy1vIR7/Xw0bj5zIm74wS/L0gIi6tqSFUNGnGyOCQuYMiPsDWQgN0vyJdtZ7aWc
         avSYCpgn9pPMrJ5D2w74p5ZfzeqrHR2uk2zGIaqAt7IOjiAH6QSjzdowFqf8iwiihPyH
         jNFY3dIU4M+Q4HX5ZN/YK2mU17YwGzIEesGeMbUK+69GSkJqCqq1U6fQTWuHLWlS4/xP
         BGJ+wDrGQsWbqybLg1bVkvBmdsL+gjzu01itNGhz/ynggapTpgFK8Zhm3DZ1gSDRnAt4
         7cyZyGmlTigWLws7ffK14yE2cetuutnNGC9pujyjH+QMYM0yTXtNmqPtuLCbBjKxbTZc
         xZ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749676624; x=1750281424;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AY4z8bScFURq5DitqWrBML6dYMJAiXsDf7kOOKjRLig=;
        b=uu6AOrgHb01kw5WSfyz9jJ+bMWbWRTnkWWSSMlb4X052kR3MN2ipErI0W/DQAKxgaa
         GeaL5tPABrD4nYH/tYxJYP3zSvfEnJQ2I7x4urKyBnK851DmmPlSwrM5mRYa7yMR6cTi
         W73m2WczkeuE1lnXhJy0oOhlJDgqVuB1eqnNNf9l8mUJlQa3HFOx+c5Y316IGcAlepVO
         Yj/AKtKkdtpo19N8pu8fJAMSWeNp0cMBgfLTuYs4kt3G1xOLW9qLrH5EvxmEgP22kDOD
         xgUW6Sc4DNQY2EXkF8HCAyXF50duWxKIQTVgC4a0l3fUm8FVdNLsZOQ6/D2cFidbCHVt
         8Ttw==
X-Forwarded-Encrypted: i=1; AJvYcCUM1AAMTFtTmXYG6kp1hzsPhGy0D3jgTd+PdmFLVwoP+1z87wyBO0FFOHvC7/BbVwvCdxRAqWBOI3rjZT0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeeGwgo5ertxg04KGwOBZoShNkejm7rB9g/tpIVzVMhTF25ihR
	jeSbk8xy+fzBn7Pf6sN4jMLwwiVTUtjbdb+9T7g7hjiz5JOn5PUJyPMkJwORlwwtmjDXz5Zv6tn
	sPqhtGG42kg==
X-Google-Smtp-Source: AGHT+IFEX+YyUhAFLiB4PDLh59KjEqWsCilHKWQI2mwBOBQTb2abCAlQoUn+D5s5FIrNKX3bLlnv1X5ckyXg
X-Received: from pfva20.prod.google.com ([2002:a05:6a00:c94:b0:746:2414:11ef])
 (user=afranji job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:189b:b0:736:450c:fa54
 with SMTP id d2e1a72fcca58-7487e10153dmr654396b3a.6.1749676623770; Wed, 11
 Jun 2025 14:17:03 -0700 (PDT)
Date: Wed, 11 Jun 2025 21:16:32 +0000
In-Reply-To: <cover.1749672978.git.afranji@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1749672978.git.afranji@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <3a4ee24c9eea7bd25c3c7a8f7060c89ba69f56d9.1749672978.git.afranji@google.com>
Subject: [RFC PATCH v2 05/10] KVM: TDX: Allow vCPUs to be created for migration
From: Ryan Afranji <afranji@google.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, x86@kernel.org
Cc: sagis@google.com, bp@alien8.de, chao.p.peng@linux.intel.com, 
	dave.hansen@linux.intel.com, dmatlack@google.com, erdemaktas@google.com, 
	isaku.yamahata@intel.com, kai.huang@intel.com, mingo@redhat.com, 
	pbonzini@redhat.com, seanjc@google.com, tglx@linutronix.de, 
	zhi.wang.linux@gmail.com, ackerleytng@google.com, andrew.jones@linux.dev, 
	david@redhat.com, hpa@zytor.com, kirill.shutemov@linux.intel.com, 
	linux-kselftest@vger.kernel.org, tabba@google.com, vannapurve@google.com, 
	yan.y.zhao@intel.com, rick.p.edgecombe@intel.com, 
	Ryan Afranji <afranji@google.com>
Content-Type: text/plain; charset="UTF-8"

During migration, vCPUs need to be created for an uninitialized VM.

This commit moves the TDX vCPU setup that requires an initialized VM
out of tdx_vcpu_create() and into tdx_td_vcpu_init().

Signed-off-by: Ryan Afranji <afranji@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 07583a11d6e3..4582f94175b7 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -664,9 +664,6 @@ int tdx_vcpu_create(struct kvm_vcpu *vcpu)
 	struct kvm_tdx *kvm_tdx = to_kvm_tdx(vcpu->kvm);
 	struct vcpu_tdx *tdx = to_tdx(vcpu);
 
-	if (kvm_tdx->state != TD_STATE_INITIALIZED)
-		return -EIO;
-
 	/*
 	 * TDX module mandates APICv, which requires an in-kernel local APIC.
 	 * Disallow an in-kernel I/O APIC, because level-triggered interrupts
@@ -692,12 +689,6 @@ int tdx_vcpu_create(struct kvm_vcpu *vcpu)
 	vcpu->arch.tsc_scaling_ratio = kvm_tdx->tsc_multiplier;
 	vcpu->arch.l1_tsc_scaling_ratio = kvm_tdx->tsc_multiplier;
 
-	vcpu->arch.guest_state_protected =
-		!(to_kvm_tdx(vcpu->kvm)->attributes & TDX_TD_ATTR_DEBUG);
-
-	if ((kvm_tdx->xfam & XFEATURE_MASK_XTILE) == XFEATURE_MASK_XTILE)
-		vcpu->arch.xfd_no_write_intercept = true;
-
 	tdx->vt.pi_desc.nv = POSTED_INTR_VECTOR;
 	__pi_set_sn(&tdx->vt.pi_desc);
 
@@ -3003,8 +2994,9 @@ static int tdx_vcpu_get_cpuid(struct kvm_vcpu *vcpu, struct kvm_tdx_cmd *cmd)
 
 static int tdx_vcpu_init(struct kvm_vcpu *vcpu, struct kvm_tdx_cmd *cmd)
 {
-	u64 apic_base;
+	struct kvm_tdx *kvm_tdx = to_kvm_tdx(vcpu->kvm);
 	struct vcpu_tdx *tdx = to_tdx(vcpu);
+	u64 apic_base;
 	int ret;
 
 	if (cmd->flags)
@@ -3013,6 +3005,15 @@ static int tdx_vcpu_init(struct kvm_vcpu *vcpu, struct kvm_tdx_cmd *cmd)
 	if (tdx->state != VCPU_TD_STATE_UNINITIALIZED)
 		return -EINVAL;
 
+	if (kvm_tdx->state != TD_STATE_INITIALIZED)
+		return -EIO;
+
+	vcpu->arch.guest_state_protected = !(kvm_tdx->attributes &
+					     TDX_TD_ATTR_DEBUG);
+
+	if ((kvm_tdx->xfam & XFEATURE_MASK_XTILE) == XFEATURE_MASK_XTILE)
+		vcpu->arch.xfd_no_write_intercept = true;
+
 	/*
 	 * TDX requires X2APIC, userspace is responsible for configuring guest
 	 * CPUID accordingly.
-- 
2.50.0.rc1.591.g9c95f17f64-goog

