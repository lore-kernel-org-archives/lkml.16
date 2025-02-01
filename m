Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F318514A4D1
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 01:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738374933; cv=none; b=IpC3ECo8dbOc6FEN5Ms2CVAVTJmhA1mkbsFp/LBHjuiG91seNm/d49w9U9a4eGEABII9X+WAMKXlEy73EAWMAiDacyAF5Op6Nzjs0TVB9TX/Dez5YRY55pmEYcZZoaZWmWR/GM7ZpR8QpyhT3uR9OOIE7unsGmIHWkt0VkJeBbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738374933; c=relaxed/simple;
	bh=vmEbPbxbMS9aUOXfyT+ZSZRy/eMxMmE8Iua31butyQA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lbsg7mGl/03glSmQFKqkHvwjwryYypZc0ouJtl6ZIQk8Sql3eNVVCr+HYjhQEfUyJrmFQmgCoMKkLgqDqx37TMy5zOmSaMs6OhQmuXx6wVwFcebRUPVliDoPmbsv5kGXxc0/ojDV2KWBrqHtSb8OPogYLFtM7DpbLk1KeC1JDRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ixcVm+kT; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ixcVm+kT"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2efa0eb9dacso5045276a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 17:55:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738374931; x=1738979731; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=SSq5rYLAYG2vKFAF70mfCTOkmocHERBtCqn9i2vcAtY=;
        b=ixcVm+kT6Brw2ZztMSq1Qyqza4qGWq2GYtbj9GQ15xl8XlxP79inYPtXDjRukspZ8f
         BQBwUFx+MGdJQA4lWbdCCEgjY25fvewS4POj/zc9S0w4T8THjpMDNkNa088ALea2BZ12
         1sfHiQTshHN6rcm7Vqikk79brVhKjGDzZpDAraJc8CmfOT3bSiHFdpwpK9BG7KYX2xVU
         npj5+6oIbaviw8k/1FZp6j9z16axRIdh5tEvZLLgEMjfvOahLknWXdYSSL2Xk1tThzDX
         5p6rJ0+vej5A6ruM0M7xZg9nvbUEk77sVdZng49Q+g2C7Ld9vbHEXrIEg5h85OQmoRR9
         8Ogg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738374931; x=1738979731;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SSq5rYLAYG2vKFAF70mfCTOkmocHERBtCqn9i2vcAtY=;
        b=xQmQoUOhM6vGc0RPVlBGay2ymkPFW4NX44AesieUvJyJCTg80qoTXKoCmWwOEe8M67
         0jrma/2yuL6ZQ84Z2rxneOM04LG+zVhrXvAH5IL+fMYOSewLBfTDQcrLL1pRTYqgp18j
         fMtiudyPu+hz//N/U/5Oe7nhMbRuqDqSrYIjBhhSLtiY+0X2ksYzC3eEuVJtsKth5B3w
         9k5847Ff2hkYV3tRgMkHHQM0hw9v+lWmN+VknItggtDAqB7ywXsFEfJZ0tHTGX+K4xQO
         jnu1s72Gj9V7QjLsb0+D2CnRNaR+qVkvQ8eRDUhYAjNYN6imnzaU2ARNS3K8+NTRZ/qD
         woZA==
X-Forwarded-Encrypted: i=1; AJvYcCVEy7ZqeHyGIx0Xy0QQnLtKWFb5U213tlYwbOAzlBzvlEvj3D6oWMvaZfAkOKnKOVT1g+Uyemu3hIMk4I0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzygEBTxB/zlT1IoGpc4/s6vuIsmi/jcXGG86njHG7aIm59+NnK
	OGJzsLG5o8zbMf26rFLIbN+WpS60O4KEZFqCHeYn1PmOlXda3z33ZDW3qYR+WKaJa05uWzK4pGc
	qPg==
X-Google-Smtp-Source: AGHT+IEFpzfH3dkO4+Y860/dfQ4O1AiD1t9jfO7r11k85kQFFgtWqnFjO6ht6BavxIM9aAIGs8WsY8WQD2s=
X-Received: from pjbeu6.prod.google.com ([2002:a17:90a:f946:b0:2f4:47fc:7f17])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:390c:b0:2f8:4a3f:dd37
 with SMTP id 98e67ed59e1d1-2f84a3fed3dmr12867960a91.16.1738374931514; Fri, 31
 Jan 2025 17:55:31 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 31 Jan 2025 17:55:14 -0800
In-Reply-To: <20250201015518.689704-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250201015518.689704-1-seanjc@google.com>
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
Message-ID: <20250201015518.689704-8-seanjc@google.com>
Subject: [PATCH v2 07/11] KVM: x86: Plumb the emulator's starting RIP into
 nested intercept checks
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

When checking for intercept when emulating an instruction on behalf of L2,
pass the emulator's view of the RIP of the instruction being emulated to
vendor code.  Unlike SVM, which communicates the next RIP on VM-Exit,
VMX communicates the length of the instruction that generated the VM-Exit,
i.e. requires the current and next RIPs.

Note, unless userspace modifies RIP during a userspace exit that requires
completion, kvm_rip_read() will contain the same information.  Pass the
emulator's view largely out of a paranoia, and because there is no
meaningful cost in doing so.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/emulate.c     | 1 +
 arch/x86/kvm/kvm_emulate.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/x86/kvm/emulate.c b/arch/x86/kvm/emulate.c
index ca613796b5af..1349e278cd2a 100644
--- a/arch/x86/kvm/emulate.c
+++ b/arch/x86/kvm/emulate.c
@@ -480,6 +480,7 @@ static int emulator_check_intercept(struct x86_emulate_ctxt *ctxt,
 		.src_type   = ctxt->src.type,
 		.dst_type   = ctxt->dst.type,
 		.ad_bytes   = ctxt->ad_bytes,
+		.rip	    = ctxt->eip,
 		.next_rip   = ctxt->_eip,
 	};
 
diff --git a/arch/x86/kvm/kvm_emulate.h b/arch/x86/kvm/kvm_emulate.h
index 49ab8b060137..35029b12667f 100644
--- a/arch/x86/kvm/kvm_emulate.h
+++ b/arch/x86/kvm/kvm_emulate.h
@@ -47,6 +47,7 @@ struct x86_instruction_info {
 	u8  src_type;		/* type of source operand		*/
 	u8  dst_type;		/* type of destination operand		*/
 	u8  ad_bytes;           /* size of src/dst address              */
+	u64 rip;		/* rip of the instruction		*/
 	u64 next_rip;           /* rip following the instruction        */
 };
 
-- 
2.48.1.362.g079036d154-goog

