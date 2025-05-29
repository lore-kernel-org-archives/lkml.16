Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B423254852
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 23:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748562023; cv=none; b=nI7eo0cte0nJt7LTeMwP+e8gdkiJoUuxC1MCu63yxvaKw2R2n6RW7OSkv73hZKyOSe+oToqzEtYB2hGgfPXvxrtedBAv7TqU2jnMzC8HdnyADY+QFtA88wsbUuGeJg9LW6CqhFWoj0tsyKsUVO0gP53pHCouSmSjhBHWlRuZRyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748562023; c=relaxed/simple;
	bh=oA5mIwWnWVZGa1VRqZsbYKhTebJt0ccotJH59gL4CN4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qTTSIjPBF6NSfbDrANNQLISXmcNH2FGEMbGoqnr7L/wk/ZGKMKv+aqUTG52Rcz741z8tT9QIww5a2qUCXJXkzVBANe3yagQu5OxoWkmMLIIvan9UZ9bCLti6AW63ogFQ3Zoj2ZRk4YSjHBE7fi3zAooQCUsaSf+TG+6yjfNjwTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yuk2tuF5; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yuk2tuF5"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-310a0668968so1332480a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 16:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748562020; x=1749166820; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=phkDMYd9+r063lx2wsvT2RvF4yzzenvwRrvfntVBbTY=;
        b=yuk2tuF5B4yf2m0y7JDpGH+/0pyJVKBzBVeBpaRGgmXtmVTr+pfAiyAuzBvI7GMPhW
         3JSwtFBCQ/z/LPKGfqmajZVunmu4350Kbg7EoErmDqwYFhVeLVfjHsThvPAKzqc3Fpy2
         rChNGKSNOTJe471XJI6oNbGY4uFOdTkl1rsV67q02lxlPHuvZ1olIhCs2oQBxR147ISi
         L1ypCkY2MsH2AnBhGRKPR0AKp1TU8LBa3TD49Uhc/tfpxQRW8ID11lQFjBjbN49cIJLC
         2U9V2D1Cx3IumZx1LAYx9btL6PvnOEwBVJ0q6RZBgKfhof0a3LmNk9ZuHllJ7Q+YxJcC
         h5+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748562020; x=1749166820;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=phkDMYd9+r063lx2wsvT2RvF4yzzenvwRrvfntVBbTY=;
        b=HB+qAvQ4tonLQ0p6NJLpNEf4slLydDOJBqvRrTVyUF1UAcAtxXvHsF/SAw/cGGVoJO
         7zs/rKaY3LjZMu6mui4AvGemZMFQaXaj3bsoJMTbToThPg/fJeMvIUQeiMzLho3Q78Nu
         0pniP5BOyL8EnjRHS7EF+eKygHafyV1p64Y1/ILvAmQ3ynSJ8F1mwBgJFDZ6Yx4oCOU8
         t/Gv/F5v9dh+TVsxgElB95ksyrjFuK2OeNATGrT0GWJTWnfnGZCiYQRQqJaZEvm/b69g
         HN97voAFy++lynwTyQIlfw5NI0qP3wZ6AdU6dD+EFAPvFgp05tY+fZRhdaflTMY9Rd9d
         pvtg==
X-Forwarded-Encrypted: i=1; AJvYcCW652gbc2mZhTWyTSA/+Eo8Nu13nHXiXQ5FyVtpqNTx8udD8sUkF4g2COSM2TulPnIXrQXi/9fHx9k/PD4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw20uN/yxVqpUf1iUFiUz/lavcZBBBjsfn2xCQsJnoJDW20hbYt
	9XGQOqKNl6xZZqNRzg76QOLoI/h+XLjWnjVHByXdAkeA/EzbzgnJ0ZSpVAAswrfGKbKLKcYI6ud
	r5TaExA==
X-Google-Smtp-Source: AGHT+IFQOlSYGltmai4IibO2+vegdOPkobvy+HaORjla/oWfdPWJdtFoLn10L6mMJII6JYzD7yJABkE/Stg=
X-Received: from pjtd7.prod.google.com ([2002:a17:90b:47:b0:311:ef56:7694])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:d448:b0:2fa:157e:c790
 with SMTP id 98e67ed59e1d1-3124100ca00mr1764491a91.5.1748562020565; Thu, 29
 May 2025 16:40:20 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 29 May 2025 16:39:47 -0700
In-Reply-To: <20250529234013.3826933-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250529234013.3826933-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Message-ID: <20250529234013.3826933-3-seanjc@google.com>
Subject: [PATCH 02/28] KVM: SVM: Tag MSR bitmap initialization helpers with __init
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Borislav Petkov <bp@alien8.de>, Xin Li <xin@zytor.com>, Chao Gao <chao.gao@intel.com>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

Tag init_msrpm_offsets() and add_msr_offset() with __init, as they're used
only during hardware setup to map potential passthrough MSRs to offsets in
the bitmap.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/svm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index bd75ff8e4f20..25165d57f1e5 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -945,7 +945,7 @@ static void svm_msr_filter_changed(struct kvm_vcpu *vcpu)
 	}
 }
 
-static int add_msr_offset(u32 offset)
+static __init int add_msr_offset(u32 offset)
 {
 	int i;
 
@@ -968,7 +968,7 @@ static int add_msr_offset(u32 offset)
 	return -EIO;
 }
 
-static int init_msrpm_offsets(void)
+static __init int init_msrpm_offsets(void)
 {
 	int i;
 
-- 
2.49.0.1204.g71687c7c1d-goog

