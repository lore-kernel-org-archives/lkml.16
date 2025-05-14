Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D902025A647
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 23:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747266235; cv=none; b=mER0t69zvy7vuWrMaOyCYVtdKJm6Z9GwrWCZppz68Mg6BvtRHVLBmSyWx1NMmvzAUX5kuyuATbfjLyB3BOoonr6v8PEjl7aTo5fNR2wVueyqDetaPUsrdIAXU+MdAJe/JBA29tW695qgymSxE10rsxq/gQ8fv/EaL+F3xzWiHvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747266235; c=relaxed/simple;
	bh=VqiXtJ8KCG1AwXpHhLg8Tkfzo/8n2mGO7InnOeWdcDY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JdHiwtstDrMkezmjeaI2J1dkzyaJ/82yQ764CixS12jQHhgHN9NhcC1xcsmryIE/qRBd9vvEdiB6iJZ0MEkXb9n6NLcRxBYcKkooE+kGmzR1T0G22I/Oy2D4cljM12F1iDvhLqtFHBtg5dYajWzQBKmNyRTb8UN5TjjXf/V2SiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=111Uf9wO; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="111Uf9wO"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-af534e796baso143661a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 16:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747266233; x=1747871033; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nKDqtrlVHa3bdl8p7B56FX6c4Fp0ZkjHF2tEioSPG28=;
        b=111Uf9wOEjtVRI+7u5zYWfd01lgDWNNuYt8aIRyqSwV3BHctLFinfwtB7sMMSzMb7Y
         KkDHErE14TALE8cOpztroHnZfVVrtiI1hqdQ29XCet0kqS9bKQap824RCfDEa7wWlr9H
         iMd+rmupLM85LytKutiGMozV75kGwHgCEiFN9tmESn2fhta6Eo7Q0Gy5YG3sPcTnpXfX
         g9NYnGteyAOoNpQr3Izzq38oKs6am5+Xkbn/zKNelh+lZvPHi8LTzCY5C+7AIK6iaMGC
         LUuDUQ8+xP7Trq+TVdPczkIMaJ4AMZhmJXScJqmP02PIUiX766dqRysonYu5OBMHwkgJ
         47EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747266233; x=1747871033;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nKDqtrlVHa3bdl8p7B56FX6c4Fp0ZkjHF2tEioSPG28=;
        b=E3CwLbZoEGpVoyUANdJnw9I7pRUxIh5mIZvJe/TBUTB9m5hAUqSJsMTZKVkwoRYuUG
         Gj4UCNfpJk5girI2fxfw82QfyIBJDAsMCsuze+CbzOvaSCNZAoiWOFbJBZbF7lMW7KbZ
         T167M9K9aApWPMqrjCVElu2ZRoBcMf4vuwBoH0f4sDNOBd6rM5ORhmIPG0nuQip0d83O
         Dx87LHEaUJgxv4yAaN4CDu/+Fkbpck/lIrLmlquHmK1EhuVmcVzoMvO3l+iPBJ58Sgzz
         rWTFjVcaHzqMaVRFNS89ejhXiygzJQ/3hVK2WotQrv1OWtP6OCcf5KjZdEZ2oT//ppaL
         jqcA==
X-Forwarded-Encrypted: i=1; AJvYcCWw2sJE4vyympl//1Ifrc6IamNyzB54/3gS2eR/4UpMSbAyzCmFdmhbzAjJ0Gh+TAARSizeHG/RH2Cyb1k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6CrQF7WT0AfUJNK6KNr2e+NXZBlt5qJ65/ZIUfG0OGtMvaB+H
	IqYuTTQZPNFa7bVhPtz3FBiLWxV8kNL6+lkxXBL32m7XjLBvMR3pc+mDJUt/oIX7kdHiVIUCnsv
	wxsbq5bnlX5XqWM7V/VQpjQ==
X-Google-Smtp-Source: AGHT+IGnPIRIGLxCiEdg+1CVTBfIREiEwND24QECga88Bq6mE7e6bLUoxaAGPBs3XSZHbyYwxbSdih97V+hzi1KYgg==
X-Received: from pjbsh12.prod.google.com ([2002:a17:90b:524c:b0:308:861f:fddb])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2742:b0:301:98fc:9b2f with SMTP id 98e67ed59e1d1-30e2e583da8mr7514670a91.1.1747266233160;
 Wed, 14 May 2025 16:43:53 -0700 (PDT)
Date: Wed, 14 May 2025 16:42:15 -0700
In-Reply-To: <cover.1747264138.git.ackerleytng@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1747264138.git.ackerleytng@google.com>
X-Mailer: git-send-email 2.49.0.1045.g170613ef41-goog
Message-ID: <28d1e564df1b9774611563146afa7da91cdd4dc0.1747264138.git.ackerleytng@google.com>
Subject: [RFC PATCH v2 36/51] mm: Convert split_folio() macro to function
From: Ackerley Tng <ackerleytng@google.com>
To: kvm@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	x86@kernel.org, linux-fsdevel@vger.kernel.org
Cc: ackerleytng@google.com, aik@amd.com, ajones@ventanamicro.com, 
	akpm@linux-foundation.org, amoorthy@google.com, anthony.yznaga@oracle.com, 
	anup@brainfault.org, aou@eecs.berkeley.edu, bfoster@redhat.com, 
	binbin.wu@linux.intel.com, brauner@kernel.org, catalin.marinas@arm.com, 
	chao.p.peng@intel.com, chenhuacai@kernel.org, dave.hansen@intel.com, 
	david@redhat.com, dmatlack@google.com, dwmw@amazon.co.uk, 
	erdemaktas@google.com, fan.du@intel.com, fvdl@google.com, graf@amazon.com, 
	haibo1.xu@intel.com, hch@infradead.org, hughd@google.com, ira.weiny@intel.com, 
	isaku.yamahata@intel.com, jack@suse.cz, james.morse@arm.com, 
	jarkko@kernel.org, jgg@ziepe.ca, jgowans@amazon.com, jhubbard@nvidia.com, 
	jroedel@suse.de, jthoughton@google.com, jun.miao@intel.com, 
	kai.huang@intel.com, keirf@google.com, kent.overstreet@linux.dev, 
	kirill.shutemov@intel.com, liam.merwick@oracle.com, 
	maciej.wieczor-retman@intel.com, mail@maciej.szmigiero.name, maz@kernel.org, 
	mic@digikod.net, michael.roth@amd.com, mpe@ellerman.id.au, 
	muchun.song@linux.dev, nikunj@amd.com, nsaenz@amazon.es, 
	oliver.upton@linux.dev, palmer@dabbelt.com, pankaj.gupta@amd.com, 
	paul.walmsley@sifive.com, pbonzini@redhat.com, pdurrant@amazon.co.uk, 
	peterx@redhat.com, pgonda@google.com, pvorel@suse.cz, qperret@google.com, 
	quic_cvanscha@quicinc.com, quic_eberman@quicinc.com, 
	quic_mnalajal@quicinc.com, quic_pderrin@quicinc.com, quic_pheragu@quicinc.com, 
	quic_svaddagi@quicinc.com, quic_tsoni@quicinc.com, richard.weiyang@gmail.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, roypat@amazon.co.uk, 
	rppt@kernel.org, seanjc@google.com, shuah@kernel.org, steven.price@arm.com, 
	steven.sistare@oracle.com, suzuki.poulose@arm.com, tabba@google.com, 
	thomas.lendacky@amd.com, usama.arif@bytedance.com, vannapurve@google.com, 
	vbabka@suse.cz, viro@zeniv.linux.org.uk, vkuznets@redhat.com, 
	wei.w.wang@intel.com, will@kernel.org, willy@infradead.org, 
	xiaoyao.li@intel.com, yan.y.zhao@intel.com, yilun.xu@intel.com, 
	yuzenghui@huawei.com, zhiquan1.li@intel.com
Content-Type: text/plain; charset="UTF-8"

This will prevent the macro from overriding any function and function
calls defined as split_folio().

Change-Id: I88a66bd876731b272282a42468c3bf8ac008b7cc
Signed-off-by: Ackerley Tng <ackerleytng@google.com>
---
 include/linux/huge_mm.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
index e893d546a49f..f392ff49a816 100644
--- a/include/linux/huge_mm.h
+++ b/include/linux/huge_mm.h
@@ -99,7 +99,11 @@ extern struct kobj_attribute thpsize_shmem_enabled_attr;
 #define thp_vma_allowable_order(vma, vm_flags, tva_flags, order) \
 	(!!thp_vma_allowable_orders(vma, vm_flags, tva_flags, BIT(order)))
 
-#define split_folio(f) split_folio_to_list(f, NULL)
+int split_folio_to_list(struct folio *folio, struct list_head *list);
+static inline int split_folio(struct folio *folio)
+{
+	return split_folio_to_list(folio, NULL);
+}
 
 #ifdef CONFIG_PGTABLE_HAS_HUGE_LEAVES
 #define HPAGE_PMD_SHIFT PMD_SHIFT
-- 
2.49.0.1045.g170613ef41-goog

