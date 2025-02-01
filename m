Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B575136E21
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 01:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738372454; cv=none; b=RfE1WA5eL53jLpCgHVk9U26KmdEoakec26ygRtGOqISleAhHSF0pQa5IS4wy8OL2+tttbr3NS8iCZgaOwROYVyoZupzDc0cVn/j4MqbuZd4msKvbUjTD5sbnpVutQYG8HsTQ9B7Gdfb87QTb7i+1FFrrQmsHdka50E2m0n5OIU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738372454; c=relaxed/simple;
	bh=nQ+kS3OisfJcraTufDITt8+LXlQftkTYQ+rT/BSf7qk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NT9mhGcgQN+l58B6bBoYZgxQZb7tfsfQEF4NvccDUxqEWBlcSb53PtlMcS8rZnfhLfhiSZIiCYYTbMYF5ZvxiV4SaiA9BpR/p9zfG5V1EVCFcCHBXtBKFfrUp6wjoIYNK1KztXMFPERDKbvlqmjJWH3bH7pu9rkyo7Z1i0OOSQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xvy1Evqo; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xvy1Evqo"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2161d5b3eb5so50280975ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 17:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738372450; x=1738977250; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=LJrvKjeAKyqO/F6ebF2NAkHhUdXXGXXObzqZ1bzPsRo=;
        b=xvy1Evqoy9wvNjsgLqUCcYfVDBx4Qo7DRJtaVpPw6H9V0VrRTpeh5nmKSETDpaCXTB
         5xukqFXz2BSKPeiFMPwR6XPe1X8zdRd4Ttr+Q1uH6ABnuj8Q/g2IvgiDN57+0lWcLYHU
         +k2oyKC23llG3b8NIaC5v/f5NSps+we29/cZvHT6SHw8tPDtC3OGmX0zsUD167GMOxAG
         u/b0VxsDSH7QHVbbyjs+v3TFtfF5A0yW4hyDtfvk60ztaaLTVKHhjZzNN8ITIIOImawe
         QgEUQnOep3ou/u088aT2MZ3/pRtso3VFTWigm1+spklPc3TN+NXYQMii3tp9zmecihKn
         vb4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738372450; x=1738977250;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LJrvKjeAKyqO/F6ebF2NAkHhUdXXGXXObzqZ1bzPsRo=;
        b=m9UWmeWwYu0qsrjcnV/DHxqYPhX44scRjaRDo9TXA5X0cyJzBMIyOS7g4YJqac/KOU
         0iLr2MIBnrxEo+UaPFfYUgtqcFamv5SyUEkdNLpkpHKGbu7GdKLJUNNclZRBr7Z+6t7w
         2zAeepTmTWnyl42rAoDSJiVKKRig1htjQJys3oTutBeU4iLhnXMNB+NT01aecsyFStxR
         Gg5T0JXKgzeJWva/Ns52UzuBdRMNQ52ktuRnMVdZoKv3/3hqTareHzZYL76PZCrOg8q6
         Kf6bUlDAiU1FlHqijVzrNZVPkCsrrFQj/81X+qlpO0DjSk2/ptVZiD7r/X4h8cYfZXQT
         qiZw==
X-Forwarded-Encrypted: i=1; AJvYcCWNd+pztibfgLWDyJifMmwFrr6Q0Wo4N+jugZe3eaUVtvjMfLfpfxpKrZIDAuE69D3NPG3Wqq5fOJG6Ej4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo3j0YGbvCygniOknKRnjglsz5eV2umkW8LXzqCAoiNmpZuZe8
	RQqh3lsnFwqXdLQAcJ+vr3NqQvJLZQ6e5J9B8eAnai6IAA5eFG0aj9kDfDIbQaEgJmmrFnJM6St
	HEw==
X-Google-Smtp-Source: AGHT+IEYlUfqd6A5Aj96yRwdP4ZObhFRmvU9ZVL70lUJyS5rZhH4M3tJR1haMPbVdKWzhFgSF0mEex6ADm4=
X-Received: from pjbse7.prod.google.com ([2002:a17:90b:5187:b0:2ea:61ba:b8f7])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e5c9:b0:216:7cbf:951f
 with SMTP id d9443c01a7336-21dd7d82d98mr211620785ad.21.1738372450219; Fri, 31
 Jan 2025 17:14:10 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 31 Jan 2025 17:13:59 -0800
In-Reply-To: <20250201011400.669483-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250201011400.669483-1-seanjc@google.com>
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
Message-ID: <20250201011400.669483-5-seanjc@google.com>
Subject: [PATCH 4/5] KVM: x86/xen: Bury xen_hvm_config behind CONFIG_KVM_XEN=y
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	David Woodhouse <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzbot+cdeaeec70992eca2d920@syzkaller.appspotmail.com, 
	Joao Martins <joao.m.martins@oracle.com>, David Woodhouse <dwmw@amazon.co.uk>
Content-Type: text/plain; charset="UTF-8"

Now that all references to kvm_vcpu_arch.xen_hvm_config are wrapped with
CONFIG_KVM_XEN #ifdefs, bury the field itself behind CONFIG_KVM_XEN=y.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm_host.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 5193c3dfbce1..7f9e00004db2 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1402,8 +1402,6 @@ struct kvm_arch {
 	struct delayed_work kvmclock_update_work;
 	struct delayed_work kvmclock_sync_work;
 
-	struct kvm_xen_hvm_config xen_hvm_config;
-
 	/* reads protected by irq_srcu, writes by irq_lock */
 	struct hlist_head mask_notifier_list;
 
@@ -1413,6 +1411,7 @@ struct kvm_arch {
 
 #ifdef CONFIG_KVM_XEN
 	struct kvm_xen xen;
+	struct kvm_xen_hvm_config xen_hvm_config;
 #endif
 
 	bool backwards_tsc_observed;
-- 
2.48.1.362.g079036d154-goog

