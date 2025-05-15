Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0385625D91D
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 18:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747333413; cv=none; b=XwgVz+B+mtChJUwfTBYpTXzOM659ehzFSGFIktj8klmCmQl6wG0bPx4GPeDSATzKauWzrbul91GAL2kJZXEk3Ynzme6DyRxsfJLu3aqRbykg1nTA9PB5WWj1e04rCniMK+Myn4cbrzvPasKmzFAbad41jJKTnWP34UP7Nyc2bJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747333413; c=relaxed/simple;
	bh=34PU7KMU+N2wXJE1/J7frHbhOQwrIo8aVZDlebHSbbY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hKUwIqB1MOaZWbyJSF8fBlOTSMPVlnBc11INYAXdXgjRL+FNb+meDwp4uEUHb2XGgiX6cm+q6dKKM1k9xpoPY6xjp2X4ZXjDs9ON86QSkiLHnFTdslZqGrzIyoQfSurdW46YnSYni6o6BHTpju7FzJIHkm/W2lwsADHro8j5f3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=iD4iya/d; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="iD4iya/d"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4775ccf3e56so27930131cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 11:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1747333411; x=1747938211; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FLBg4PWpdjUgYuKX869tnqzLKlnuTQmJAhNrRi7i9EE=;
        b=iD4iya/d8DW52JB58NspQjkEx3yY1vOyuqnOseOy4BE8MkdMNShW3j2FOyqlD+TeV0
         Suf+St61GwxZuh1Zw0w/wZtXdd54dsHda3RRJDWHyuAGsNogC5tAnmchFHLmpF9x8KSs
         yTbgrpyBrSyiZfKR3dh2I0ldG6jyMBEchGSVxgzaUij2lb8zgP/3/RSj4HAscb4u/t0j
         NSY9lc6KoRjJn4f6jHN1bP4LWEUmJzL31kcie8HwuG8suBWLGei+c//KE5+SHu6e1k8H
         bAt9wUfbyVFvoU30uLTwMRto6TXTn/SqTTqkODkUuEFfMuGPSQauLqPKT4YgRoAc1HcS
         7M3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747333411; x=1747938211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FLBg4PWpdjUgYuKX869tnqzLKlnuTQmJAhNrRi7i9EE=;
        b=ZkqQfvhD+qrrJdWoR2oTIEgyUF/Q6/mvt/QOzl8wj9Lrnd4ZoKliz5ImxYmtfpgtiX
         Q05vFJucErn8QLIzlHRHdga2WcQKkrcpcEgDz7GFYMOwsidtbyupmAbVTkEQLB7cjUA9
         clo8rGaASolkNfE+oVDGD85cgTBBct16dqYxXK3ZyECIJB1dZq7+FT3dVKQrJIKB3zjv
         qshnD2a/aX5VK/LUZzuhvEhfP0RJEadg7cqmFNEwu/EFqza2zD/b+xvsoWOGGH5hsZP/
         veMMXy5rGqSRp8Cu3upRbq09mqB+Smg9L9wkoDAM2Mz39TLN+t/rq6KjzrkJvGHvBP5E
         3JxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqDkATJWJzTq3L+JdcAK2RIVRq43kugGAJwWwGEJdMxfr5EXrV252lx/yR5tSBArfRBFPcKal5h9TCdOY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyU0ju968/sQUjL8BWODmaVGoAQjdxUN+IjKSej9O1tnkFD17tC
	cOB9yduHqCovyhLPMqaItR9Au/X3oNIdsf+kXPu/KknT35Ti+wdgw3XTYEUeo2rzjPw=
X-Gm-Gg: ASbGncvl6CXj9SXXDvwrTqodmfwfUiUl9B3jxTylsMn9S1TfPKv69ao0xr8H8w2oCzp
	j+JtuMM299T+V3ieK6NnMu3UFbylM5mQ1U0NJKCBHdgR5/1escav8kpcZtrWvTRwVGxlKNgROug
	rAJW4Y5c4JtA/InhRq7M/+F7YPAqiVaqEA59Gjw6+ZSRemfVW/WWBFwavUR8n6g9lsuaymQvUwS
	sI+5Rsi4YTEUS0GEAcbMCdVs+nrnkKtxG9khGuL0UEVKpa3+OJ9GA6+9bEUxEojllWdokyK2B2j
	eh1aDtgrLCO2UBato7ZWj6MWaxHvwZtTQOud16MFq7G9wJc/LaX9yx97RwgFJR8yGBbz+toxwYK
	AFdswfgizodQtSx05Oq//9RQd5r702Ni1SK/btl1Xx8Bf
X-Google-Smtp-Source: AGHT+IHdVpoXFzO5vpvPCK/fe5GtMM9oE80sh2/xmjSmGwo/5647bcIutgv4NbFJWhbe73WlciRiuA==
X-Received: by 2002:a05:622a:1999:b0:48d:4887:9850 with SMTP id d75a77b69052e-494a0e2b131mr70141661cf.19.1747333410606;
        Thu, 15 May 2025 11:23:30 -0700 (PDT)
Received: from soleen.c.googlers.com.com (138.200.150.34.bc.googleusercontent.com. [34.150.200.138])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd466fc2afsm18218685a.0.2025.05.15.11.23.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 11:23:30 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: pratyush@kernel.org,
	jasonmiu@google.com,
	graf@amazon.com,
	changyuanl@google.com,
	pasha.tatashin@soleen.com,
	rppt@kernel.org,
	dmatlack@google.com,
	rientjes@google.com,
	corbet@lwn.net,
	rdunlap@infradead.org,
	ilpo.jarvinen@linux.intel.com,
	kanie@linux.alibaba.com,
	ojeda@kernel.org,
	aliceryhl@google.com,
	masahiroy@kernel.org,
	akpm@linux-foundation.org,
	tj@kernel.org,
	yoann.congal@smile.fr,
	mmaurer@google.com,
	roman.gushchin@linux.dev,
	chenridong@huawei.com,
	axboe@kernel.dk,
	mark.rutland@arm.com,
	jannh@google.com,
	vincent.guittot@linaro.org,
	hannes@cmpxchg.org,
	dan.j.williams@intel.com,
	david@redhat.com,
	joel.granados@kernel.org,
	rostedt@goodmis.org,
	anna.schumaker@oracle.com,
	song@kernel.org,
	zhangguopeng@kylinos.cn,
	linux@weissschuh.net,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-mm@kvack.org,
	gregkh@linuxfoundation.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	rafael@kernel.org,
	dakr@kernel.org,
	bartosz.golaszewski@linaro.org,
	cw00.choi@samsung.com,
	myungjoo.ham@samsung.com,
	yesanishhere@gmail.com,
	Jonathan.Cameron@huawei.com,
	quic_zijuhu@quicinc.com,
	aleksander.lobakin@intel.com,
	ira.weiny@intel.com,
	andriy.shevchenko@linux.intel.com,
	leon@kernel.org,
	lukas@wunner.de,
	bhelgaas@google.com,
	wagi@kernel.org,
	djeffery@redhat.com,
	stuart.w.hayes@gmail.com,
	ptyadav@amazon.de
Subject: [RFC v2 03/16] kho: add kho_unpreserve_folio/phys
Date: Thu, 15 May 2025 18:23:07 +0000
Message-ID: <20250515182322.117840-4-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
In-Reply-To: <20250515182322.117840-1-pasha.tatashin@soleen.com>
References: <20250515182322.117840-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Changyuan Lyu <changyuanl@google.com>

Allow users of KHO to cancel the previous preservation by adding the
necessary interfaces to unpreserve folio.

Signed-off-by: Changyuan Lyu <changyuanl@google.com>
Co-developed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 include/linux/kexec_handover.h | 12 +++++
 kernel/kexec_handover.c        | 84 ++++++++++++++++++++++++++++------
 2 files changed, 83 insertions(+), 13 deletions(-)

diff --git a/include/linux/kexec_handover.h b/include/linux/kexec_handover.h
index f98565def593..3d209f9e9d3a 100644
--- a/include/linux/kexec_handover.h
+++ b/include/linux/kexec_handover.h
@@ -42,7 +42,9 @@ struct kho_serialization;
 bool kho_is_enabled(void);
 
 int kho_preserve_folio(struct folio *folio);
+int kho_unpreserve_folio(struct folio *folio);
 int kho_preserve_phys(phys_addr_t phys, size_t size);
+int kho_unpreserve_phys(phys_addr_t phys, size_t size);
 struct folio *kho_restore_folio(phys_addr_t phys);
 int kho_add_subtree(struct kho_serialization *ser, const char *name, void *fdt);
 int kho_retrieve_subtree(const char *name, phys_addr_t *phys);
@@ -69,11 +71,21 @@ static inline int kho_preserve_folio(struct folio *folio)
 	return -EOPNOTSUPP;
 }
 
+static inline int kho_unpreserve_folio(struct folio *folio)
+{
+	return -EOPNOTSUPP;
+}
+
 static inline int kho_preserve_phys(phys_addr_t phys, size_t size)
 {
 	return -EOPNOTSUPP;
 }
 
+static inline int kho_unpreserve_phys(phys_addr_t phys, size_t size)
+{
+	return -EOPNOTSUPP;
+}
+
 static inline struct folio *kho_restore_folio(phys_addr_t phys)
 {
 	return NULL;
diff --git a/kernel/kexec_handover.c b/kernel/kexec_handover.c
index 8ff561e36a87..eb305e7e6129 100644
--- a/kernel/kexec_handover.c
+++ b/kernel/kexec_handover.c
@@ -101,26 +101,33 @@ static void *xa_load_or_alloc(struct xarray *xa, unsigned long index, size_t sz)
 	return elm;
 }
 
-static void __kho_unpreserve(struct kho_mem_track *track, unsigned long pfn,
-			     unsigned long end_pfn)
+static void __kho_unpreserve_order(struct kho_mem_track *track, unsigned long pfn,
+				   unsigned int order)
 {
 	struct kho_mem_phys_bits *bits;
 	struct kho_mem_phys *physxa;
+	const unsigned long pfn_high = pfn >> order;
 
-	while (pfn < end_pfn) {
-		const unsigned int order =
-			min(count_trailing_zeros(pfn), ilog2(end_pfn - pfn));
-		const unsigned long pfn_high = pfn >> order;
+	physxa = xa_load(&track->orders, order);
+	if (!physxa)
+		return;
 
-		physxa = xa_load(&track->orders, order);
-		if (!physxa)
-			continue;
+	bits = xa_load(&physxa->phys_bits, pfn_high / PRESERVE_BITS);
+	if (!bits)
+		return;
 
-		bits = xa_load(&physxa->phys_bits, pfn_high / PRESERVE_BITS);
-		if (!bits)
-			continue;
+	clear_bit(pfn_high % PRESERVE_BITS, bits->preserve);
+}
 
-		clear_bit(pfn_high % PRESERVE_BITS, bits->preserve);
+static void __kho_unpreserve(struct kho_mem_track *track, unsigned long pfn,
+			     unsigned long end_pfn)
+{
+	unsigned int order;
+
+	while (pfn < end_pfn) {
+		order = min(count_trailing_zeros(pfn), ilog2(end_pfn - pfn));
+
+		__kho_unpreserve_order(track, pfn, order);
 
 		pfn += 1 << order;
 	}
@@ -607,6 +614,29 @@ int kho_preserve_folio(struct folio *folio)
 }
 EXPORT_SYMBOL_GPL(kho_preserve_folio);
 
+/**
+ * kho_unpreserve_folio - unpreserve a folio.
+ * @folio: folio to unpreserve.
+ *
+ * Instructs KHO to unpreserve a folio that was preserved by
+ * kho_preserve_folio() before.
+ *
+ * Return: 0 on success, error code on failure
+ */
+int kho_unpreserve_folio(struct folio *folio)
+{
+	const unsigned long pfn = folio_pfn(folio);
+	const unsigned int order = folio_order(folio);
+	struct kho_mem_track *track = &kho_out.ser.track;
+
+	if (kho_out.finalized)
+		return -EBUSY;
+
+	__kho_unpreserve_order(track, pfn, order);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(kho_unpreserve_folio);
+
 /**
  * kho_preserve_phys - preserve a physically contiguous range across kexec.
  * @phys: physical address of the range.
@@ -652,6 +682,34 @@ int kho_preserve_phys(phys_addr_t phys, size_t size)
 }
 EXPORT_SYMBOL_GPL(kho_preserve_phys);
 
+/**
+ * kho_unpreserve_phys - unpreserve a physically contiguous range across kexec.
+ * @phys: physical address of the range.
+ * @size: size of the range.
+ *
+ * Instructs KHO to unpreserve the memory range from @phys to @phys + @size
+ * across kexec.
+ *
+ * Return: 0 on success, error code on failure
+ */
+int kho_unpreserve_phys(phys_addr_t phys, size_t size)
+{
+	struct kho_mem_track *track = &kho_out.ser.track;
+	unsigned long pfn = PHYS_PFN(phys);
+	unsigned long end_pfn = PHYS_PFN(phys + size);
+
+	if (kho_out.finalized)
+		return -EBUSY;
+
+	if (!PAGE_ALIGNED(phys) || !PAGE_ALIGNED(size))
+		return -EINVAL;
+
+	__kho_unpreserve(track, pfn, end_pfn);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(kho_unpreserve_phys);
+
 int __kho_abort(void)
 {
 	int err;
-- 
2.49.0.1101.gccaa498523-goog

