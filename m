Received: from mail-qk1-f202.google.com (mail-qk1-f202.google.com [209.85.222.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6C72BEFE1
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 18:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750097067; cv=none; b=ImjjHod+XM6h7KEzAJgHTn/IeFbDFbD7aXfIJpBoyOdA/oVchBlHcB9F4/uTyaM062oGv020+FX5/gqHzthxEkX9piZfa5bP+H3j2BmXKUQO8uvwgaefz76zC+ln+b2azAhjtrSElVwEahH6Tf1sPyTfykaFFxUYmDerWRW0zm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750097067; c=relaxed/simple;
	bh=ieUrBpxnhAcHZVPIDjWg8YrjgXlXZRU0bnijma7YrcQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PN1CYowcc3LpD1ABlCOhYUO/0RnZJ6gpt41LEjbj4sO0jgCSHJYJdvi9C79IF6wkS4YPAWMIUSJOyqep7UB/f1gKmxcRaA5taIM2ynG88e6FyyHOG2AH7n+sGD/zt4aduPvZwGmMhJNZTPwreDs9UCWjrQ2jzuFALycGwa4vbCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2ejNruvq; arc=none smtp.client-ip=209.85.222.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2ejNruvq"
Received: by mail-qk1-f202.google.com with SMTP id af79cd13be357-7d3dcac892bso70929385a.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 11:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750097064; x=1750701864; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6s05CdLcRzyi2nsOTKC32FfCxvZXUgETWtMCfMXqdTs=;
        b=2ejNruvqmpZ8PKAflJwcgI8vtHD5yQX+487nSmSbi5XsI03pk6byB9hiYZE7XgORo5
         9WvK+lJdhW0n9Dvhn6zkiR+7yqyWtBIyA6BDmjp5ugn38tjEv7mCM36Ha5MhQtrJCNzq
         t9hYS2j4GuNjb4PDHZOmFDIU2sa4VC4PdZ01vRbMDk6BNtIE2nW4Z0PAsjMppyvXwx1l
         cRIoRk3+aFjqaneR0F6rAIMIbdZmP+1Y8DLcklKuPrmHiM/5yUFz/FWoattw6j5C+ekt
         PGkabO8SZGr5As0fhKenhYNNMvdzGXE+t5Z/DfcCdmNL2nXnyoyMmRnzkAgzoWM+FBHk
         w/Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750097064; x=1750701864;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6s05CdLcRzyi2nsOTKC32FfCxvZXUgETWtMCfMXqdTs=;
        b=ohHB1t5l7G9CWVk2lwybKILhLXNSw36xD8y64bT7PwW18DS8V3TD+SlK7S8r4E4M+5
         hiXhjWlgBobMgraVT7+sUO4Wf7BEEQr0kGeYXx9AivZodfFDhpAJKLkUWRx81Mv00OEB
         7AonTAoiYPlxydVDiVXocQmNm91aZn6/JWnkatD37C0TztubvBwOuv361OytDhyVrdjg
         33LVdR9pSbpcsh1QnrvOmux4ajedNNMBYFeAn85zEes0lQALDvQQ0wPNsviGsPARtHQR
         fDG2oRGEuow4WqX97l9WBW0X5rAgbiheo7S2TuDkIPuvOVa5Mt6vbrnmD6NS3XPE7ICZ
         JFPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdn3hd0JtVMZF43jU5I2McCfmnueXrRw4Aj0h2x6FwCACBmLv6K4H3wI08AZkV5uWfIdshnmkdARD4erg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu7HJB13i3QcTuLyzkgkECVP7b0W8AKbwYq6o8xUqgIpknJ6bR
	PvPH+q2EKxO7vNk4mF+S4hauKoWbxb0JzQr8w/LI+wn9Y+yBS/HnAMUgCD/X5Y4Bmha4q3sMfyq
	fsT9FAKQ+l5rfpkWdmKcWsA==
X-Google-Smtp-Source: AGHT+IE18+eJ2mJb0IiEY7AbbpEu86bBMFRR0dra4DbsFH8VnDPOgkInNK1ZU3CtXj87hevrPmaWTiBTb6wKlYzP
X-Received: from uabch3.prod.google.com ([2002:a05:6130:c83:b0:87e:c20a:bcb1])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:620a:2714:b0:7ce:fc0b:d39d with SMTP id af79cd13be357-7d3c5125037mr1849533285a.6.1750097064527;
 Mon, 16 Jun 2025 11:04:24 -0700 (PDT)
Date: Mon, 16 Jun 2025 18:04:23 +0000
In-Reply-To: <202506142050.kfDUdARX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <202506142050.kfDUdARX-lkp@intel.com>
X-Mailer: git-send-email 2.50.0.rc2.692.g299adb8693-goog
Message-ID: <20250616180423.2859920-1-jthoughton@google.com>
Subject: Re: [PATCH v4 1/7] KVM: x86/mmu: Track TDP MMU NX huge pages separately
From: James Houghton <jthoughton@google.com>
To: lkp@intel.com
Cc: dmatlack@google.com, jthoughton@google.com, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev, 
	pbonzini@redhat.com, seanjc@google.com, vipinsh@google.com
Content-Type: text/plain; charset="UTF-8"

> All errors (new ones prefixed by >>):
> 
>    arch/x86/kvm/mmu/mmu.c: In function 'kvm_recover_nx_huge_pages':
> >> arch/x86/kvm/mmu/mmu.c:7609:38: error: 'KVM_TDP_MMU' undeclared (first use in this function)
>     7609 |                 else if (mmu_type == KVM_TDP_MMU)
>          |                                      ^~~~~~~~~~~
>    arch/x86/kvm/mmu/mmu.c:7609:38: note: each undeclared identifier is reported only once for each function it appears in

Sorry for not trying to build on i386. :(

Fixup for this, as Sean originally had[1]:

[1]: https://lore.kernel.org/kvm/ZyJCjJx2lxnEnDwa@google.com/

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 9df15c9717771..d544a269c1920 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1358,6 +1358,10 @@ enum kvm_mmu_type {
 	KVM_NR_MMU_TYPES,
 };
 
+#ifndef CONFIG_X86_64
+#define KVM_TDP_MMU -1
+#endif
+
 struct kvm_arch {
 	unsigned long n_used_mmu_pages;
 	unsigned long n_requested_mmu_pages;
