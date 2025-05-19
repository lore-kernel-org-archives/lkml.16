Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A41224244
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 23:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747697316; cv=none; b=deX1M5lFCvTomGeserKM/8YKSWlZURYMqOqSa/lcNGvgSpIsj/mmauJNRn5UiEAuF6n2TWYYTc0v5O8iYYYYfTNpgwcF4GqbSyVFL2v61y3zFrPArnKhx2d4HgDm3WcvjUvwsNJ1ogVbIKOjjw5ZGmbI4+F00JhpIVxNwzETIYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747697316; c=relaxed/simple;
	bh=kXdCtkWuECHGgWR2OT6Gy3/nttBLueu1XR40dPgOpQg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hDu0WBLxak1ydM6bpJg/7AG9+HgyZu2cKSVW04TUz1UFKpdcr3zrLSL7iP14m2Gg5RPilVBqFxlm+vshV7aTtBeh1dHya/uMw558nrjPNm6AsW4lOvqGn/+N+WpNJQAk6FhxQIH5Hi07gIqdVsHiZYDoMfI5RIJmvdyPwhE7V9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Uak+riy0; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Uak+riy0"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b26e6b84a31so2701934a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 16:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747697314; x=1748302114; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=9gLcS+OzRCY/eRWGmdNSRPdTQEpCa40B7+xlZSCIkqg=;
        b=Uak+riy0pk/lDPBqauIjSQ6y6gTKbo2844R+OrpbLvLBd9K/P8kWdBTPCZT9pFZDzY
         u7lCpONqecUQjGvGO85+bQSSa66pPhTVPovx0O/UvE3NSesM0ZI624lYgsuq0DbfGwUF
         tK+NfT/x56sFkKnGnGNXtWHk3nGVdMofRMtE2WBua1avIFiZ4cp6VYRd3y+pVhEV+Mjc
         ZiFDYDdcaD3WqZHRgYwrjfupuvYrQK10kK/vBY1x4l2xhW8m5eoZrZOC9pqF0rb6Xw3P
         zGmWd3sNmll6LanF35Ktm/Z29+ZtKXQuZU/L9ALDQtX4VmeWYqK7xBU2pwuE3+fCVPAZ
         nr/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747697314; x=1748302114;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9gLcS+OzRCY/eRWGmdNSRPdTQEpCa40B7+xlZSCIkqg=;
        b=O4qpWDLs2PwaCsc2qBfbePzzP/ym7t2tmN18RUvXn83/ZYz5xWO4W3Kogj1RPNyRI4
         F7oUIFHtCyxRIMaG3bv9LjNOmuhJgFfohhP4MWSC/1R9guKVQO8iBj+2Y7PSj3oAIxAB
         /EtF4okj5KQoJ5DH0xCYuSHys/pX/HKPwDzJuoUfzO2IuY7StHcPHKMPMYg5nKVzfS0T
         ArZQeGFT8v8HIt0/aJeX03tmq7Ugh2kxly+Nsbhyp7af8beC7RTXmMD+15zTukCjrhV7
         jL15GR3tyGxwuNUruTnE5+GGwvUXOuW+qT5uITbcwKIB2QosQ7YcR/wShm7T1ffjFb1h
         luuA==
X-Forwarded-Encrypted: i=1; AJvYcCVNEA2mDbSsz9Gkqqv6H7g9h1yOgK2GwoZeXpG5ErOgYiYu3Iry4KELnbktnX0aYPMN/puhKWpgRdWwC50=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmLwKwSB7pJt1v5zOn6JDwm6X1dCtnX2qAIqK0khmw8YE1RwHM
	9g3Hg+k+Pg4KanzNe3cWOV6nXZ/Q/oGwrtncCOsXIvidcUkA1KnhqMAouM2z50LnimFWvJuZvRA
	6B7vnDg==
X-Google-Smtp-Source: AGHT+IGsS44SKP9udDnxbnYqpNtWDNsH2nu1RdF7aCNajWwjT1ZSWe7ZKUxh/RwFmGOpvKqPfnwHgOPVukI=
X-Received: from pjbsl15.prod.google.com ([2002:a17:90b:2e0f:b0:2ea:448a:8cd1])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1343:b0:30e:9349:2d88
 with SMTP id 98e67ed59e1d1-30e93493309mr24785255a91.12.1747697314420; Mon, 19
 May 2025 16:28:34 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Mon, 19 May 2025 16:28:05 -0700
In-Reply-To: <20250519232808.2745331-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250519232808.2745331-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250519232808.2745331-13-seanjc@google.com>
Subject: [PATCH 12/15] KVM: Squash two CONFIG_HAVE_KVM_IRQCHIP #ifdefs into one
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Squash two #idef CONFIG_HAVE_KVM_IRQCHIP regions in KVM's trace events, as
the only code outside of the #idefs depends on CONFIG_KVM_IOAPIC, and that
Kconfig only exists for x86, which unconditionally selects HAVE_KVM_IRQCHIP.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/trace/events/kvm.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/include/trace/events/kvm.h b/include/trace/events/kvm.h
index 1065a81ca57f..0b6b79b1a1bc 100644
--- a/include/trace/events/kvm.h
+++ b/include/trace/events/kvm.h
@@ -82,7 +82,6 @@ TRACE_EVENT(kvm_set_irq,
 	TP_printk("gsi %u level %d source %d",
 		  __entry->gsi, __entry->level, __entry->irq_source_id)
 );
-#endif /* defined(CONFIG_HAVE_KVM_IRQCHIP) */
 
 #ifdef CONFIG_KVM_IOAPIC
 
@@ -93,8 +92,6 @@ TRACE_EVENT(kvm_set_irq,
 
 #endif /* CONFIG_KVM_IOAPIC */
 
-#if defined(CONFIG_HAVE_KVM_IRQCHIP)
-
 #ifdef kvm_irqchips
 #define kvm_ack_irq_string "irqchip %s pin %u"
 #define kvm_ack_irq_parm  __print_symbolic(__entry->irqchip, kvm_irqchips), __entry->pin
-- 
2.49.0.1101.gccaa498523-goog

