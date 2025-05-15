Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51397268FFF
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 18:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747333431; cv=none; b=Hh4nHmHgGazubyjxK+5i0Selcve8GnDOv89PtE5cEYLvgP1JX7Gn5pL2jCojguoy3solVKjQu//TVD8QhWQFr9nIllRMTpu1MqdVU42dzANvATAtoR1jIdfse/CWUy4Hl7wEVxsu0v6lNz6XwwghMlJ28SuOW8GICfXc8xZylt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747333431; c=relaxed/simple;
	bh=VRCETR/ZNMscZ4PQziAJBi6EbuBypp6uz2gXjli2EYg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fqzTFuvnY/vdUKOMFAL54nle1ztYW+pT71ZSf9WKv4N7vdPaj19MKipdrq6tStYzxfIVs5CghqxEV1H7vsICllkU3lA22kMLcqoQHNbQt/fPZVvEY31e+4yfgTwM2nc/K5a2Nk1qBkPdGw6Vjg3JjftJaSnOc8lAAy+1ykxCiNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=piDK4RO+; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="piDK4RO+"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7c96759d9dfso175719985a.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 11:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1747333428; x=1747938228; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P6KJXTjc0r76p8v9NLIxG+1plF/W6x+7amHEacWowEk=;
        b=piDK4RO+9tkwg4jUhMDgPVkkjIeDkrL4nwJsbE+YHnPeOJybDtb3y7k0a4xIPCj+L7
         0LssXD3ewidk9RUsycKZWGycnqGbtF1aQFW3fzIrzhRGJhzcTauaTst3CtqPUKJhM+cn
         B32VJc1PBbpJlzgrVOi8z6HQV5MC+SVlI/B9oC574jayWmDzcNMj1n+NBvygsQn5UKMq
         87Y+vUFE/+UgixTcN8XsE+1UgdYtyyZmhvzk8H1lu/PmwuVvwzRU778POKUdcGLS+Xzj
         fLZAtOGrh4zILl1SCRbdqy9xyTr7jdp3HHynCejX5VwT/M8e2yR1TxzGh6WissHUPoFP
         konQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747333428; x=1747938228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P6KJXTjc0r76p8v9NLIxG+1plF/W6x+7amHEacWowEk=;
        b=pj1ZviwKji5U6mrHA/sHjFWk1hXcuLVfEAEzmtQ4PRjJfTpZEMHuoXtDw8S29Bot/X
         SnWyjW5dLH3yMxPqf0PyscAvrpkJnlkrtHIG42EZZmP1TtapvTDjmzreUZ0JHW/fz4D9
         f9vb1Xacmq9Fobf7Ac3q08ctx1pyLo7YxpsiVbNN0bhB6Oc9t/HyANEw4m1YbH5Sn//W
         w6QzhyqGkZCC0tX5T/kxx8hinUVmVnTUKstMPqIDAZrCh8xmnUa6W8gBShkMtyWObIl3
         gvjgN5sekIhUwDXPAarxOc+xuzsZrrBHfuPQd+lE64TXps/DJxgfp2SgaLD1gU5F15Ei
         U8aw==
X-Forwarded-Encrypted: i=1; AJvYcCV+sD1B5ianTJMB48HjPU75Xvc75Q4YuKiQ/8WG74YwP7raKOH4a0bPsc3zZZCrpk+NKgoVGQwDJrUL0zU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkHBOnr01yIvTkgl40ShAYLhNthfsFOCwQsrX12ptzU70gdcS+
	36BperVR7s5iGuL/CUqMVclgReZPrMtdAcDDSRDlhypkwPE3CcaRKAQBwN31PmkbTvU=
X-Gm-Gg: ASbGncsakAGNIsyUn9WofQJ/iEB5CWQ+W4AD5D/T9Da6gZ+dRvegtjsZNbrymLmDJux
	IihlVwFOa98/p41zZ3a9o5mJ3qIJookK5crKV8DnR1fqVPOBz7JNv+zh9AJ3k2YJaGImBV1cT5C
	j8ytEzYXTK4RREF1oaTYtLy9WA3WyOc7pQiCvtiBqZJdzidLtR9jbR7REthPwQQEhiDPQZAOCQU
	7x8lsBFmsePUY7TL9EtvAwo+BHm39PSptbKZI+KrD5jdJwg9IlHKJIAQVT+pEhI06KBh7LLcQL8
	HYdPUUvomwQrwl3MTm6FZ4hHU4YnzL6jyXtVGHyQ1u17HuD6eXGLyeS73vZzmDJozDwHCYBiy38
	QqUNWr1g2+BhS41t+keHdhMkFMsme1tK7h/mnftjX9Yic
X-Google-Smtp-Source: AGHT+IEG7RwmXqR/Tm2fInhaZBiu3WtaiEVf8X1895Z0lbevuSTfErYi54kRZ9n6luWpwWWeTV+CYQ==
X-Received: by 2002:a05:620a:d89:b0:7c5:4b24:468d with SMTP id af79cd13be357-7cd46707195mr63632785a.2.1747333428187;
        Thu, 15 May 2025 11:23:48 -0700 (PDT)
Received: from soleen.c.googlers.com.com (138.200.150.34.bc.googleusercontent.com. [34.150.200.138])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd466fc2afsm18218685a.0.2025.05.15.11.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 11:23:47 -0700 (PDT)
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
Subject: [RFC v2 15/16] docs: add luo documentation
Date: Thu, 15 May 2025 18:23:19 +0000
Message-ID: <20250515182322.117840-16-pasha.tatashin@soleen.com>
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

Add the main documentation file for the Live Update Orchestrator
subsystem at Documentation/admin-guide/liveupdate.rst.

The new file is included in the main
Documentation/admin-guide/index.rst table of contents.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 Documentation/admin-guide/index.rst      |  1 +
 Documentation/admin-guide/liveupdate.rst | 62 ++++++++++++++++++++++++
 2 files changed, 63 insertions(+)
 create mode 100644 Documentation/admin-guide/liveupdate.rst

diff --git a/Documentation/admin-guide/index.rst b/Documentation/admin-guide/index.rst
index 259d79fbeb94..3f59ccf32760 100644
--- a/Documentation/admin-guide/index.rst
+++ b/Documentation/admin-guide/index.rst
@@ -95,6 +95,7 @@ likely to be of interest on almost any system.
    cgroup-v2
    cgroup-v1/index
    cpu-load
+   liveupdate
    mm/index
    module-signing
    namespaces/index
diff --git a/Documentation/admin-guide/liveupdate.rst b/Documentation/admin-guide/liveupdate.rst
new file mode 100644
index 000000000000..bff9475d2518
--- /dev/null
+++ b/Documentation/admin-guide/liveupdate.rst
@@ -0,0 +1,62 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+==============================
+Live Update Orchestrator (LUO)
+==============================
+:Author: Pasha Tatashin <pasha.tatashin@soleen.com>
+
+.. kernel-doc:: drivers/misc/liveupdate/luo_core.c
+   :doc: Live Update Orchestrator (LUO)
+
+LUO Subsystems Participation
+============================
+.. kernel-doc:: drivers/misc/liveupdate/luo_subsystems.c
+   :doc: LUO Subsystems support
+
+LUO Preserving File Descriptors
+===============================
+.. kernel-doc:: drivers/misc/liveupdate/luo_files.c
+   :doc: LUO file descriptors
+
+LUO ioctl interface
+===================
+.. kernel-doc:: drivers/misc/liveupdate/luo_ioctl.c
+   :doc: LUO ioctl Interface
+
+LUO sysfs interface
+===================
+.. kernel-doc:: drivers/misc/liveupdate/luo_sysfs.c
+   :doc: LUO sysfs interface
+
+LUO selftests ioctl
+===================
+.. kernel-doc:: drivers/misc/liveupdate/luo_selftests.c
+   :doc: LUO Selftests
+
+ioctl uAPI
+===========
+.. kernel-doc:: include/uapi/linux/liveupdate.h
+
+Public API
+==========
+.. kernel-doc:: include/linux/liveupdate.h
+
+.. kernel-doc:: drivers/misc/liveupdate/luo_core.c
+   :export:
+
+.. kernel-doc:: drivers/misc/liveupdate/luo_subsystems.c
+   :export:
+
+.. kernel-doc:: drivers/misc/liveupdate/luo_files.c
+   :export:
+
+Internal API
+============
+.. kernel-doc:: drivers/misc/liveupdate/luo_core.c
+   :internal:
+
+.. kernel-doc:: drivers/misc/liveupdate/luo_subsystems.c
+   :internal:
+
+.. kernel-doc:: drivers/misc/liveupdate/luo_files.c
+   :internal:
-- 
2.49.0.1101.gccaa498523-goog

