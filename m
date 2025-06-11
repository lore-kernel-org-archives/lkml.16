Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA4F25D1FC
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 21:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749677790; cv=none; b=Q24PKtVnNLxkx6VYLbnUmyphxeW7TKlzkNDVnhC4cUzBiEPevsYH3GGg4ZCzN81Wg1RZPMOGEpRNgIDYW7eC9Y5mif9BJdfT2s6J8zWxE4azqO6UmnWtGEtChKATjVWU1A1kbVk+HXsWuE2j6oB36Q/rSrFm+7iDmbzfAEu/Rm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749677790; c=relaxed/simple;
	bh=pbzjMkYafGxcpLXLqdeS1eEDP6kDrKXYmWNpHPn0xGQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Yf6culoWvteGwKa3KcSlkA7baPKHJaF7aJifLaFuhDh30Vpz/Srh2HLYQ6XOibMb7jWVlhfawD5r0axWjSwNE4iGFkxmkDhuBr1Me+JIhwF/5CG1uJDrZ7Zb/KnhoqC4S8v86m3OK2ZLVv2YPJBmeSgkajziyo2gZQG12vb2oXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LkY8ERvl; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LkY8ERvl"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-31366819969so257427a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 14:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749677787; x=1750282587; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=Xzs0IiSJuwZzmnPBx3wmk+iVHWs9BLQaD0Cp4OIfdsI=;
        b=LkY8ERvlf3FnZ8ZUvjDgJuiVI4mII6ZvPbVgYoKvAr53Gr9Pf7Fbu4IaTCOkveE6v1
         RoWHSaNfkg9VUbYRIzVdtCzBHQ1Ew4hUTjeYNJ5X7PjFdyGkrvYsuTpxLgNjujWaq13X
         OnJk+ChHut6rduvNGeqep8UGAaXpLYzLFiAiHfL6TmC39FEz0vlFcKROeELyyapGJlBW
         bAWUDauTVck17KkkApFtxODVrV4FMG0WAIUqJA9TUyaaK0OmIWHV0THMCnvabHDikuZw
         WyHwnIKYlWzUlUHA1tFGNz3yHnUYrnq4n6M3LwKVXnYqjL5VLfyorYCcdbE1CXdO0n2V
         OKuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749677787; x=1750282587;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xzs0IiSJuwZzmnPBx3wmk+iVHWs9BLQaD0Cp4OIfdsI=;
        b=O4B+SMXUqMMxFIaOkE4CrMlhwXqYem1h79x8/24cLM9AGwNnScb38FvlKVhBpB67ZE
         AHhv8qvSjSVCWzwd2aq3pSb94wSE3kddxW1zYZwuvoDLf1V5YCkP+UTaBUo0/2PcE1zt
         H7gxpH1cvH4V2Zp/GEEolZ5hMOWwFcLp2/FbRoDmI7H8UjMpgoNZD7vPONYqViiGS181
         zG/8vs+erLL9ZVPSx+06ZTZPG2WDeCjXZUfjlZYEvDL55MZOLg2B6SoKxDlSTsq0b9sS
         3tzGewK498hEaRlCGgfvc06xHi9E65cNkWZx4EvnFfSrm9d7ak6+ZkL//NzDwSOLvVMV
         f/QA==
X-Forwarded-Encrypted: i=1; AJvYcCV3FZT7nA7jeVVa8Lqqa0aAU6qDbE+48sTSmmrud1/Jx/omm511i1JAKET28cSf85Mma4aXK1nl8jK9AJI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNFxlWNiIzXeHy86mT0HdP2w+kD9uS8AwTIvFlBdYR8GHf4nQB
	KkQOWG0c8yuEMTyEafhZEPaDnbp62gMdQykjKsHLZtrRiToJmUyfRNQlb2ZAQvz74rujV9/Ll7j
	ltetNTQ==
X-Google-Smtp-Source: AGHT+IHIvhKkqqWWcEQHXFR65K8FZLh/xEt/zChKvBvk4uS5J2RIxt1u9I6b9xAUE+S9NBqKiPkCbq7uF9c=
X-Received: from pjv12.prod.google.com ([2002:a17:90b:564c:b0:313:2b27:3f90])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4a8f:b0:311:ed2:b758
 with SMTP id 98e67ed59e1d1-313af0fd2c3mr5826535a91.3.1749677787281; Wed, 11
 Jun 2025 14:36:27 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 11 Jun 2025 14:35:54 -0700
In-Reply-To: <20250611213557.294358-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250611213557.294358-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250611213557.294358-16-seanjc@google.com>
Subject: [PATCH v2 15/18] KVM: Squash two CONFIG_HAVE_KVM_IRQCHIP #ifdefs into one
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kai Huang <kai.huang@intel.com>
Content-Type: text/plain; charset="UTF-8"

Squash two #idef CONFIG_HAVE_KVM_IRQCHIP regions in KVM's trace events, as
the only code outside of the #idefs depends on CONFIG_KVM_IOAPIC, and that
Kconfig only exists for x86, which unconditionally selects HAVE_KVM_IRQCHIP.

No functional change intended.

Acked-by: Kai Huang <kai.huang@intel.com>
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
2.50.0.rc1.591.g9c95f17f64-goog

