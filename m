Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B287B25D20D
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 18:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747333412; cv=none; b=suRq5AnuxmKyNPUhgCGoecJFeCH2QYPl7esYkTpwzcnFNvRhOb4v2HDeBL4OnYdGA+XyL4sHn4UpMlV7LWUY0Ps00iNvYef2LFAyS1Mbf2deLVFxzekVTa3OZxqDSuHQmLIkQA9HKwKrgDI92gbR/Lpkbb4pSXSTMeD0yD8I3/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747333412; c=relaxed/simple;
	bh=1rYzlB4jt+NgzrmG5MLloEzusBe5IEirmGPBVFDNYcI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M3evkC27OsBDi7Cr9T0fDLiNOdL7exGvMKzce6dYQ2dmCA8OKHpmesLeBVd4pcZUfOMnqgV8LPIstQFCtWM2xgnwBAmC/1z7GynnKiMAzhf+Vs739dlpvM23uWitYaVOj5S3TffHGmB+m8qCreXxlz8vu3mgcE4d3FjYpGsyWp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=u9AQ1qIa; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="u9AQ1qIa"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-476f4e9cf92so10049241cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 11:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1747333409; x=1747938209; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/1cQld6s+fHhsQGRDIn5qKXAP1aMOMnCGujzp2H2Sb8=;
        b=u9AQ1qIapwgr8HRYKUxb2EmTswFXhzvguFJGm3MZfOmRXRFWYIEU0KMHJcvMGj4S8j
         Ixj9TQjQfElegZuG1vbLDlA/T5cVuJzs8ajiibWPo/RDiLN+D6JD8s7l1azqXwKOyeGR
         29ZiCWHCGzLyUOh5V0+WmMWXTCE7A0PBcGibfHS2hN3pn1cFrMqNV11UmjDQMjRGZr1c
         Kp3d3JdAe038R3M9QsGqeMganAGGN5POuPGJNHmT66nxA3Tx5tMIPlK47T50M+IXdRWN
         iQZCamTKWedAyBVHcmR5+5a+uhuhkAsgQodpaJH5hPXigx+FoimPa4rTZ1l3GWiczZpU
         iNgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747333409; x=1747938209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/1cQld6s+fHhsQGRDIn5qKXAP1aMOMnCGujzp2H2Sb8=;
        b=QRHDKQYoBx4dLk+UOfssFcW8EThmuaCMff/YycsizLIpbo0QaBTdNeiH2ziU5ZFVOZ
         SOvyRsytoqVSzKaYkIsylvvYzJJclZuH8zFhGXql0bZxiAMw4t9i8VzqULvXSCL+jw7L
         vA+bcelE5q33fd0dcLUn//qYz0Q7X7BCuzk8CXPddKfoXomvyrCqQlxn3oOy5x4Y/E+x
         8hJ+js0QvKfzgpY5ZTKxsJkWnalqNhzTcS782X3Lf+ymP8xojc+dQLMog8ZrEijjFs7d
         56m5qL2ZWqxYe2vBYkygEq9RXBGa08qaddoo0eHxZsB9sAoDeUZvVpOMC8I1TyOlM4NL
         Pxnw==
X-Forwarded-Encrypted: i=1; AJvYcCU3f72Dx6fEjoLiiZgW0TQPBX2pvbvb76j21FUY2ielRhtm4Lyenh6U9G77faN513Sf96fKV68HgX/fl8w=@vger.kernel.org
X-Gm-Message-State: AOJu0YyT0ftAX61uFh9exi4DhQqZYF/mNf3u0HKijvtCynoIDrDuxsvl
	CD9cVcBS3a01VXIsh8KYIPWAfRpGyUJxjLz8XXYZXklwoE+N9Gpy+/wLkl8n2tyjTY0=
X-Gm-Gg: ASbGncsXkVLA35r9Izs1HN22pqnfRHDsYTSn+Mgy2/J6VMddQq8KzJ8llYcVgCR/mL9
	vDAbhPwhXNCtj6U4/82CcmUhNKFeY98BQRVtEwiwkQgQqd5ksXc0gNuBQ8hK3u8uDb3nqPXB+Ay
	v/fp7MyO7jAkJmPxUa10D5k9YT5PjrAnt/0nM3VL8sNV1MHgzSyv5BseVrcVRszeVrt9WHtrKAH
	qKxdvCpIJX3uftHPw8sHcEKTyc7cVAble0xgR1cad+lFT1AWwqfJ0v/tOwsswxh+r2lLGLjlZfY
	DMFeUSdMKoWE1yp4ygQcMn73I51adfhdAwR6aq21lG4MHIk7rjmHUfSJyfINHwVqm5v8e038SV/
	AzyXmG/u7cKk8NR3E+l9zb4AJbR3cvnrp80Hzsofg/rwQ
X-Google-Smtp-Source: AGHT+IHMdR7jltadwLx3md1mkyCXtwpjmFH9FzZ/ZTOjwdYm/5D6IYoCeXD8qKkrvwmgbOc0uZ2I7w==
X-Received: by 2002:a05:622a:4ccc:b0:491:18c2:2d1 with SMTP id d75a77b69052e-494ae34b351mr5878641cf.7.1747333409292;
        Thu, 15 May 2025 11:23:29 -0700 (PDT)
Received: from soleen.c.googlers.com.com (138.200.150.34.bc.googleusercontent.com. [34.150.200.138])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd466fc2afsm18218685a.0.2025.05.15.11.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 11:23:28 -0700 (PDT)
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
Subject: [RFC v2 02/16] kho: allow to drive kho from within kernel
Date: Thu, 15 May 2025 18:23:06 +0000
Message-ID: <20250515182322.117840-3-pasha.tatashin@soleen.com>
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

Allow to do finalize and abort from kernel modules, so LUO could
drive the KHO sequence via its own state machine.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 include/linux/kexec_handover.h   | 15 +++++++++
 kernel/kexec_handover.c          | 54 ++++++++++++++++++++++++++++++++
 kernel/kexec_handover_debug.c    |  2 +-
 kernel/kexec_handover_internal.h |  2 ++
 4 files changed, 72 insertions(+), 1 deletion(-)

diff --git a/include/linux/kexec_handover.h b/include/linux/kexec_handover.h
index 348844cffb13..f98565def593 100644
--- a/include/linux/kexec_handover.h
+++ b/include/linux/kexec_handover.h
@@ -54,6 +54,10 @@ void kho_memory_init(void);
 
 void kho_populate(phys_addr_t fdt_phys, u64 fdt_len, phys_addr_t scratch_phys,
 		  u64 scratch_len);
+
+int kho_finalize(void);
+int kho_abort(void);
+
 #else
 static inline bool kho_is_enabled(void)
 {
@@ -104,6 +108,17 @@ static inline void kho_populate(phys_addr_t fdt_phys, u64 fdt_len,
 				phys_addr_t scratch_phys, u64 scratch_len)
 {
 }
+
+static inline int kho_finalize(void)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int kho_abort(void)
+{
+	return -EOPNOTSUPP;
+}
+
 #endif /* CONFIG_KEXEC_HANDOVER */
 
 #endif /* LINUX_KEXEC_HANDOVER_H */
diff --git a/kernel/kexec_handover.c b/kernel/kexec_handover.c
index 5b65970e9746..8ff561e36a87 100644
--- a/kernel/kexec_handover.c
+++ b/kernel/kexec_handover.c
@@ -734,6 +734,60 @@ int __kho_finalize(void)
 	return err;
 }
 
+int kho_finalize(void)
+{
+	int ret = 0;
+
+	if (!kho_enable)
+		return -EOPNOTSUPP;
+
+	mutex_lock(&kho_out.lock);
+
+	if (kho_out.finalized) {
+		ret = -EEXIST;
+		goto unlock;
+	}
+
+	ret = __kho_finalize();
+	if (ret)
+		goto unlock;
+
+	kho_out.finalized = true;
+	ret = kho_out_update_debugfs_fdt();
+
+unlock:
+	mutex_unlock(&kho_out.lock);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(kho_finalize);
+
+int kho_abort(void)
+{
+	int ret = 0;
+
+	if (!kho_enable)
+		return -EOPNOTSUPP;
+
+	mutex_lock(&kho_out.lock);
+
+	if (!kho_out.finalized) {
+		ret = -ENOENT;
+		goto unlock;
+	}
+
+	ret = __kho_abort();
+	if (ret)
+		goto unlock;
+
+	kho_out.finalized = false;
+	ret = kho_out_update_debugfs_fdt();
+
+unlock:
+	mutex_unlock(&kho_out.lock);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(kho_abort);
+
 struct kho_in kho_in = {
 	.fdt_list = LIST_HEAD_INIT(kho_in.fdt_list),
 };
diff --git a/kernel/kexec_handover_debug.c b/kernel/kexec_handover_debug.c
index 696131a3480f..a15c238ec98e 100644
--- a/kernel/kexec_handover_debug.c
+++ b/kernel/kexec_handover_debug.c
@@ -55,7 +55,7 @@ int kho_debugfs_fdt_add(struct kho_serialization *ser, const char *name,
 				     fdt);
 }
 
-static int kho_out_update_debugfs_fdt(void)
+int kho_out_update_debugfs_fdt(void)
 {
 	int err = 0;
 	struct fdt_debugfs *ff, *tmp;
diff --git a/kernel/kexec_handover_internal.h b/kernel/kexec_handover_internal.h
index 65ff0f651192..0b534758d39d 100644
--- a/kernel/kexec_handover_internal.h
+++ b/kernel/kexec_handover_internal.h
@@ -60,6 +60,7 @@ void kho_in_debugfs_init(const void *fdt);
 int kho_out_debugfs_init(void);
 int kho_debugfs_fdt_add(struct kho_serialization *ser, const char *name,
 			const void *fdt);
+int kho_out_update_debugfs_fdt(void);
 #else
 static inline int kho_debugfs_init(void) { return 0; }
 static inline void kho_in_debugfs_init(const void *fdt) { }
@@ -67,6 +68,7 @@ static inline int kho_out_debugfs_init(void) { return 0; }
 static inline int kho_debugfs_fdt_add(struct kho_serialization *ser,
 				      const char *name,
 				      const void *fdt) { return 0; }
+static inline int kho_out_update_debugfs_fdt(void) { return 0; }
 #endif /* CONFIG_KEXEC_HANDOVER_DEBUG */
 
 #endif /* LINUX_KEXEC_HANDOVER_INTERNAL_H */
-- 
2.49.0.1101.gccaa498523-goog

