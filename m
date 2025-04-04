Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0E922A4EB
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 19:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743795630; cv=none; b=o0OGdplkmNjF9aiL+3i66QJpJSkjvKUzsHhVWFb9A359AsAsnuHniuKfVb8lPdg5Ime9zdb2hXzmDC2e225nGJROTr+2Mt70Nj4h0JFB/YneaQ8/+GLCv0AKNN95UwKf4D2Ro7uKi0zKp2Z0K//qUgx4n4gJCbKI9pbiBR9arEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743795630; c=relaxed/simple;
	bh=rV/TxCC8hJCF5joZAJwXSPguE6CTa8m1jVL3SS0Cme0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=kzmjh03uboHZLZzq/5JP/QbHJLlV40CK5BRh7KIzaSMEMWdyhAaU59ZkaEwrFAixqsbe/fRcfYu7qs4ebwlTsqAxvCfvLWcPKSekAztapj1fVksf2Nd5TDEbaF9Ww56S6b5e48aX6hQvuo6MzmS9CEQkTOelUI288r4vcnfyaEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oI1pLrrr; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oI1pLrrr"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-736b5f9279cso2255740b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 12:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743795629; x=1744400429; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=sjXqQKjnqBAECPoVdGNanQSTET+5wQh3LMPwBf9sL3o=;
        b=oI1pLrrrr0x6nNNuAZ9ctxzqrY+WwOMj8qkoYSdocaFDjT2XekgYu/IUI3mynd1aSl
         pF5q/c/Sln/3Dg91msaC5qu7s+HXeXKc5UX4TKTurMY5hTQrgo2iNFdBB2R6DfNCDOUB
         cav4hcV4QBAo7aKkZi3q7GKFV7H6KKH5n80NrpIyyPqxt/eZPBuXtMxWbpXpmGiIoUMf
         pZa6LTZWErVv2yXKbAL3zFh5v48En9bI3RKn5ozNbWyyrNR4hgCqj7yDj8RKAqjcXGh3
         B7o7C5veNLeUxgrPitwPyt34rEDUnJ/aMZ6MTPm79XMphA03whhG0Idhmy2XBg0mBQhX
         JDHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743795629; x=1744400429;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sjXqQKjnqBAECPoVdGNanQSTET+5wQh3LMPwBf9sL3o=;
        b=J2sUA55s00hSrAdzfwrDpSvgmGyjQfVFPIHgw6lnO2R/SW4Aes8BRUjTI2gMsC50zw
         RdXpJXb1+tCG/RWTHLh3bvK38DdL11+/U94P1iuI7n8sRDF58Gpw0SOLk/3Kd8i07ai3
         5UF+sOMyhb0i4i8ulLEg7Wl3/3EytLLdZT4o8cV1tSudvQomn50yhC6Xo8GFtbUBH+1r
         82VdvD6/YWuRVDgnEDxrD3geqtOuPvxsaZWZ09o7auyW1MyQp4sbyIyRB+Lubili1mob
         DJ50+0uh83N+5zm7w73p8eTxlGvfLNe/OOTa5POlb1aYPLOtRsq4QMlGbhUqQvdnVVCu
         v+Hw==
X-Forwarded-Encrypted: i=1; AJvYcCXpJO8XassX8gzkR+ut4J2SEPf4XlZmkALyLFqB51ZnJTCsGGblNgsj+kdGHXK6ge2yEltjIvI8Fp7jl3U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5xTWYkGFUsrkjvP29BQK4rMjJlHNo5G61FFEKnDa4X1FSiRwQ
	D4z02oqueKzH6DBCrkHu47W/y2747BYe1xmDayolrJ/AURHFxouW6gyAuicoG+YAD/JY2m4DC/o
	Vvw==
X-Google-Smtp-Source: AGHT+IEUqaCv0aXLLYu+YUsh9QZmyBiS+o0qosR4x1hBOl7XnC5m3r8JWP1RCDtDT+Khu5sOogVzwMt6Cak=
X-Received: from pfbci5.prod.google.com ([2002:a05:6a00:28c5:b0:736:79d0:fd28])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:94c8:b0:1f3:1eb8:7597
 with SMTP id adf61e73a8af0-2010479b14amr7567439637.35.1743795628671; Fri, 04
 Apr 2025 12:40:28 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri,  4 Apr 2025 12:38:39 -0700
In-Reply-To: <20250404193923.1413163-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250404193923.1413163-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250404193923.1413163-25-seanjc@google.com>
Subject: [PATCH 24/67] KVM: SVM: Add a comment to explain why
 avic_vcpu_blocking() ignores IRQ blocking
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Joerg Roedel <joro@8bytes.org>, David Woodhouse <dwmw2@infradead.org>, 
	Lu Baolu <baolu.lu@linux.intel.com>
Cc: kvm@vger.kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Maxim Levitsky <mlevitsk@redhat.com>, Joao Martins <joao.m.martins@oracle.com>, 
	David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

Add a comment to explain why KVM clears IsRunning when putting a vCPU,
even though leaving IsRunning=1 would be ok from a functional perspective.
Per Maxim's experiments, a misbehaving VM could spam the AVIC doorbell so
fast as to induce a 50%+ loss in performance.

Link: https://lore.kernel.org/all/8d7e0d0391df4efc7cb28557297eb2ec9904f1e5.camel@redhat.com
Cc: Maxim Levitsky <mlevitsk@redhat.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/avic.c | 31 ++++++++++++++++++-------------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index aba3f9d2ad02..60e6e82fe41f 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -1133,19 +1133,24 @@ void avic_vcpu_blocking(struct kvm_vcpu *vcpu)
 	if (!kvm_vcpu_apicv_active(vcpu))
 		return;
 
-       /*
-        * Unload the AVIC when the vCPU is about to block, _before_
-        * the vCPU actually blocks.
-        *
-        * Any IRQs that arrive before IsRunning=0 will not cause an
-        * incomplete IPI vmexit on the source, therefore vIRR will also
-        * be checked by kvm_vcpu_check_block() before blocking.  The
-        * memory barrier implicit in set_current_state orders writing
-        * IsRunning=0 before reading the vIRR.  The processor needs a
-        * matching memory barrier on interrupt delivery between writing
-        * IRR and reading IsRunning; the lack of this barrier might be
-        * the cause of errata #1235).
-        */
+	/*
+	 * Unload the AVIC when the vCPU is about to block, _before_ the vCPU
+	 * actually blocks.
+	 *
+	 * Note, any IRQs that arrive before IsRunning=0 will not cause an
+	 * incomplete IPI vmexit on the source; kvm_vcpu_check_block() handles
+	 * this by checking vIRR one last time before blocking.  The memory
+	 * barrier implicit in set_current_state orders writing IsRunning=0
+	 * before reading the vIRR.  The processor needs a matching memory
+	 * barrier on interrupt delivery between writing IRR and reading
+	 * IsRunning; the lack of this barrier might be the cause of errata #1235).
+	 *
+	 * Clear IsRunning=0 even if guest IRQs are disabled, i.e. even if KVM
+	 * doesn't need to detect events for scheduling purposes.  The doorbell
+	 * used to signal running vCPUs cannot be blocked, i.e. will perturb the
+	 * CPU and cause noisy neighbor problems if the VM is sending interrupts
+	 * to the vCPU while it's scheduled out.
+	 */
 	avic_vcpu_put(vcpu);
 }
 
-- 
2.49.0.504.g3bcea36a83-goog

