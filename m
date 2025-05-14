Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE372512C9
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 23:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747266219; cv=none; b=WnYWhzeuwkFicrHpX3w+p8qRHCaKOWhy2HrkWd56TtKwCJgVYSkPMMYoTs46QGlBmNyjvgjhX16dQJQBGXncoJEvHQP0J0QJaVQy61oKQIEFUuGk72TFRO3WfAyGQegAmmgIMJzUbL9Qau+SUYGXKwmL1qQ48NK7InpoHSw2IOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747266219; c=relaxed/simple;
	bh=P4f0b62NWOp+NPWKRTgUNNPji/5ERCLjnY9pODYzlUE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=R9/bhmsbXz0OXNik+DEJdBzRql5LkCa4Pg6LH1JiU4yoXlYVafveGAKfufQM2SNa/hcTJAPxTjLJaC4OQtecVRamur3By9WnGXrbhlqd6k8dXeRpPPtvF+k7Zmhdsyal6q+Wd9o3Sm6I0mJ1xSUyYsxtpKUOs5gjsr3nyZnfPn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=X3aGCmoK; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="X3aGCmoK"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-30c4b072631so348101a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 16:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747266216; x=1747871016; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=B7idB2ZTiegZ6IK12Tr/2nYezS5KZiJSYYU8LHDGXMQ=;
        b=X3aGCmoKl/t1PnndVwmh2h0I9wXGB88CzUqrLj9/ASoXDCLVAuD2OpqN1iOg+Jsyv0
         QqAixmStyQqLyikPurcbAqeYN2p+nhIzBSC7KXw+kpoMm1TcTHe5yafvYBUkNt4EL+AK
         L13oz6T3422l+WFwQ88asyW6y/NYNH/jiVcKiSFdeDaFdgAqhiIRHqpb6pPf1iQaQgn4
         q0EqoPZ8zhO9J1ytmo6lLQHfxC4LW0eRkQrD1PG0NC0A+dTbvdTOCU/72Me9kYWeyChO
         0nsuwIUf+tT5GhDYh7S8FP8mTmWkIydqtEZBpBeNkSQ2082dVwMtrLg1OQQnUKBo9BIU
         8utw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747266216; x=1747871016;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B7idB2ZTiegZ6IK12Tr/2nYezS5KZiJSYYU8LHDGXMQ=;
        b=nKcrktUEDcdttVrJBjZiLVRa2VNXWOcPXJPcpLFFKU8LQL2IBSNZ+NoFxAMNI26gM6
         sH0XVi0A4BhbHqW3ZWJ4hK11RzAZ9ckChSk0bgE+oLK2H1LEtxllkzxiUHBp3/9hf2Mm
         18zQ9P+Sp9wsXEBaDS4hwBWXK+1fwE4GMs1cYH0lQJcfOlzkhAo8OX/+JIIF8PweULWr
         dJqYhkCSXRlsAOgmcMtLHcI4sQ5SWvrgGNii6BJTvRSxD37d+qYc/A42TUaL6/rKoEKB
         +UD7J0J04soMp6jYc8AaclNZMOMxw99LcfgnFbYdR9bvG/9xeprG2WF9Z6z6vtCf4L+e
         uUIA==
X-Forwarded-Encrypted: i=1; AJvYcCVtFGT6hfW2mKwjURktT8VNbeMIBfApy5NpJB9FQDLcUjXt+vwlORcR/uJJsA4Zh7k+Zv98DzqnSlM6pD4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvQtez8UK1+Qe+TGpxLb5FOyHgi0YrhClruR4B5jp2FscyqcJu
	wwKvc7VWHZZUFMfnmpejz7q/7rL8s20RT5r1CKNLGteecmrYkenbdWuloUs8k0hTWEJSNbxFvVT
	uesjBOT7dy9s4A6Roybi9Jg==
X-Google-Smtp-Source: AGHT+IE2emob7ne9xgmmOZ/2Nz4UUhKEr9sTG+LQ/jCh4mtM1mNcZXbWVXEVF+2dcFUaFpOL2yid3wyO7OHIppEddw==
X-Received: from pjbee7.prod.google.com ([2002:a17:90a:fc47:b0:2fa:1fac:269c])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:55d0:b0:309:fac6:44f9 with SMTP id 98e67ed59e1d1-30e51947471mr583415a91.31.1747266215905;
 Wed, 14 May 2025 16:43:35 -0700 (PDT)
Date: Wed, 14 May 2025 16:42:04 -0700
In-Reply-To: <cover.1747264138.git.ackerleytng@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1747264138.git.ackerleytng@google.com>
X-Mailer: git-send-email 2.49.0.1045.g170613ef41-goog
Message-ID: <b01365820cca734c1c37de6709167d8c81afb295.1747264138.git.ackerleytng@google.com>
Subject: [RFC PATCH v2 25/51] mm: truncate: Expose preparation steps for truncate_inode_pages_final
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

This will allow preparation steps to be shared while implementing
truncation differently.

Signed-off-by: Ackerley Tng <ackerleytng@google.com>
Change-Id: I83ad5965b8b50283ad930c20c99e3165cb5626c9
---
 include/linux/mm.h |  1 +
 mm/truncate.c      | 26 ++++++++++++++++----------
 2 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index bf55206935c4..e4e73c231ced 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -3514,6 +3514,7 @@ extern unsigned long vm_unmapped_area(struct vm_unmapped_area_info *info);
 extern void truncate_inode_pages(struct address_space *, loff_t);
 extern void truncate_inode_pages_range(struct address_space *,
 				       loff_t lstart, loff_t lend);
+extern void truncate_inode_pages_final_prepare(struct address_space *mapping);
 extern void truncate_inode_pages_final(struct address_space *);
 
 /* generic vm_area_ops exported for stackable file systems */
diff --git a/mm/truncate.c b/mm/truncate.c
index 5d98054094d1..057e4aa73aa9 100644
--- a/mm/truncate.c
+++ b/mm/truncate.c
@@ -457,16 +457,7 @@ void truncate_inode_pages(struct address_space *mapping, loff_t lstart)
 }
 EXPORT_SYMBOL(truncate_inode_pages);
 
-/**
- * truncate_inode_pages_final - truncate *all* pages before inode dies
- * @mapping: mapping to truncate
- *
- * Called under (and serialized by) inode->i_rwsem.
- *
- * Filesystems have to use this in the .evict_inode path to inform the
- * VM that this is the final truncate and the inode is going away.
- */
-void truncate_inode_pages_final(struct address_space *mapping)
+void truncate_inode_pages_final_prepare(struct address_space *mapping)
 {
 	/*
 	 * Page reclaim can not participate in regular inode lifetime
@@ -487,6 +478,21 @@ void truncate_inode_pages_final(struct address_space *mapping)
 		xa_lock_irq(&mapping->i_pages);
 		xa_unlock_irq(&mapping->i_pages);
 	}
+}
+EXPORT_SYMBOL(truncate_inode_pages_final_prepare);
+
+/**
+ * truncate_inode_pages_final - truncate *all* pages before inode dies
+ * @mapping: mapping to truncate
+ *
+ * Called under (and serialized by) inode->i_rwsem.
+ *
+ * Filesystems have to use this in the .evict_inode path to inform the
+ * VM that this is the final truncate and the inode is going away.
+ */
+void truncate_inode_pages_final(struct address_space *mapping)
+{
+	truncate_inode_pages_final_prepare(mapping);
 
 	truncate_inode_pages(mapping, 0);
 }
-- 
2.49.0.1045.g170613ef41-goog

