Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A2E3597C
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 01:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738372450; cv=none; b=tEsXqvqH6OMH3+ZSPh+Sj2JZ4enyN7AVY/a1e3UhPFIAgjOgRvIG5sToYA7R72n426fUgJ6rLn9cx8qZ+T/ddcnjG05XVKZ+9adUTv0K2z9JbvnQMQOQNw9xSsva1efCV4/c11Jtr8BdPyCUF3WLV9tdjP2r76wc1imp+I0jvYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738372450; c=relaxed/simple;
	bh=OFd/w/+tQL5wnrtXX2mRa0QEN0vkaY5t6IadhKHz+Lc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=g291384S8F3q5iCtFU6G5HS05WV8/K+qLa/vipXC4ArkAaQYJfmfn/pJ2dMu7JvGFetcUCjnSc+y/sUqq3VmtnQyjXIa00BuiX0iK9G52Yj94MmPHQnX59RYCAv+lieGTdhCfnFlG3BgDl/xr2tgCyHRd3qOGvB4TrlWhaPv7GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QxDaEz3+; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QxDaEz3+"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2ef7fbd99a6so4933150a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 17:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738372448; x=1738977248; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=UtIlwPLorJtN8uqaYIAxjcSWyabjL0SN/uMOv7FI8DM=;
        b=QxDaEz3+lCCYN0Uqxyh4/kjWl5RFPhXWWLjcqv3IuINW6RVjN1OETOjK9xCefL5jsT
         i+XH28+MQzVwzWdXErWO8XxRtwtS3D5crYIAmpLcK1s1I1i6oGjBgd/B8BMgE7IOu8su
         sjEOF2XBY0FXOsCkKejh0zIhWk0aWNwyubCtagau7NthcltvVWvqFUZaTq3HFFGPVNyT
         gHd4RH/s8tR/e/ssdeOkjl1x3Y9UG4QKZCpx3ldxReuosK0BvKvdiQITiFDmzGMakabV
         Z+VjiCL0rS3WP8KOm+FuDzngwZ50tXvscnkwa/gD5ynEeWU9lS9EzvpLBT5e3jJNorbF
         xw8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738372448; x=1738977248;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UtIlwPLorJtN8uqaYIAxjcSWyabjL0SN/uMOv7FI8DM=;
        b=VArmsVFcSyPjuunfPkO6qU++Wp9anjOzTXkKBHLfr0eMf8fg6dAs48sPe7r/zy/Q1V
         A2f1pgG6v+IKFWvt3tU2YpK1c5qYwSJOVcUi7JpsvWqotmQ8fXTINIyhhzjq2B3eVddA
         yjqe47UoJLkuKXjYdHBhY9n41fHVMxXIFw7ud8QjnJBZBofhqwuarOYer2H0g9mjFWRe
         EQWSP2TOOagxIGUVWScY5a/wXKmzRc2Q/1iK3Kab6QOc+Rv0y7WcAH5FgenjLIDarDGW
         rZwbOxGiQvbDqh5xWtWJXfqckXnCYmvO3p1uiiOc3URErDfwSMrt+slOCEwMotuihZ0E
         zfrg==
X-Forwarded-Encrypted: i=1; AJvYcCUexGOOvpx9YCghACli7JNfyQufaCFFdMbnMvYYJ/kUSf7B9fRylY6Y5gabDDjyfiKZvCpcgy3uzO6ENIs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcEesIRi2BvPSjWDxWAL+1BgyFByHTdbzTMVc9TrNacGcxHqKE
	dZDoewzcRMsweoYkvnlArt+DnuU4U9JYjzkeZoW0QkJPojmV/iyUGbzniFOWfHsBKfxR49LRsDn
	L7A==
X-Google-Smtp-Source: AGHT+IHdUP2wvkGWbJcC9vX8Zc2oaH78eyzzFFqJr7Tskwb7JAaDibUYRzKX3cLLCkGiVN2YpFq9EmueqBw=
X-Received: from pjbnb8.prod.google.com ([2002:a17:90b:35c8:b0:2ef:71b9:f22f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:c2c7:b0:2ef:33a4:ae6e
 with SMTP id 98e67ed59e1d1-2f83abd996dmr22783400a91.12.1738372448494; Fri, 31
 Jan 2025 17:14:08 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 31 Jan 2025 17:13:58 -0800
In-Reply-To: <20250201011400.669483-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250201011400.669483-1-seanjc@google.com>
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
Message-ID: <20250201011400.669483-4-seanjc@google.com>
Subject: [PATCH 3/5] KVM: x86/xen: Consult kvm_xen_enabled when checking for
 Xen MSR writes
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	David Woodhouse <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzbot+cdeaeec70992eca2d920@syzkaller.appspotmail.com, 
	Joao Martins <joao.m.martins@oracle.com>, David Woodhouse <dwmw@amazon.co.uk>
Content-Type: text/plain; charset="UTF-8"

Query kvm_xen_enabled when detecting writes to the Xen hypercall page MSR
so that the check is optimized away in the likely scenario that Xen isn't
enabled for the VM.

Deliberately open code the check instead of using kvm_xen_msr_enabled() in
order to avoid a double load of xen_hvm_config.msr (which is admittedly
rather pointless given the widespread lack of READ_ONCE() usage on the
plethora of vCPU-scoped accesses to kvm->arch.xen state).

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/xen.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/x86/kvm/xen.h b/arch/x86/kvm/xen.h
index e92e06926f76..1e3a913dfb94 100644
--- a/arch/x86/kvm/xen.h
+++ b/arch/x86/kvm/xen.h
@@ -58,6 +58,9 @@ static inline bool kvm_xen_msr_enabled(struct kvm *kvm)
 
 static inline bool kvm_xen_is_hypercall_page_msr(struct kvm *kvm, u32 msr)
 {
+	if (!static_branch_unlikely(&kvm_xen_enabled.key))
+		return false;
+
 	return msr && msr == kvm->arch.xen_hvm_config.msr;
 }
 
-- 
2.48.1.362.g079036d154-goog

