Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B4B26980F
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 18:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747333433; cv=none; b=KB6w8XlNb4jCxFfhU+TXEMj3VY3HkHjiWdsdnFiVLDysWhhQOpCdFmnX8jXnjH3uJHYqMyhwg0ds7BWbPyqO2gl+zTo3BE7DQAoRnKgIBplZtcsus4CCs5thDpPkPWbOBzN/LIU9cqQ1LoWRwQlj1Es3GZ7UafSpnxSmmgrO8fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747333433; c=relaxed/simple;
	bh=YaE0d21aL4ypcSNyRnSQBH6nYjgCRfkHddqKY3G90JA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iSyOTPS/R4hIANq7JSz7wkFeWZJ+s5MDm8kGnwXYPviUT2WOyeRsfqu2MzaRBEju5xhDGz3BScR+9s4N8m1ricA8V0QRRMwAqWFu+hoE0cI8EkYN53v0St/ZVCsFhbypB3iA+QlryEClYaEEVsKRqPBrixlBL8696z99Sk4CqWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=FAoAOoLd; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="FAoAOoLd"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7c54b651310so159307785a.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 11:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1747333429; x=1747938229; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/UkhatAda5pzqxG11ONXrnfa3++BT9kkRoGoO4mFl6c=;
        b=FAoAOoLd6QYmSjM6SUEUmnwyBnT2AdRAN6cfGWxnEEpuhJYfAdi00tbPkfnLHJMYnw
         NWz+dNniMpXPt4ee3XoPx1edtzkLlkQiV/ThsDEQees28704JfYMgV7M6xk3kYhGHr7Z
         ja0lX+F2xuNJxx+8OopdGGeWkD7xpxUTHyhRDiLUsgYCSB1AsmGrRuJeLIT9JF3eQ2yd
         FwsdNfQ399hycjca8F/hajfpNAElD3MoGZ6N5cwYBZIuvNPqQFbE+en/tPzuB+gbIrwe
         zlMaP+EffIQUCn+tuLLVmPgDDEsOKaTJ7NWrQ/BsvJhQ5WqApOTnI42L7+JUhMimTgBz
         w2xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747333429; x=1747938229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/UkhatAda5pzqxG11ONXrnfa3++BT9kkRoGoO4mFl6c=;
        b=ZVhHbkkrY0RJ9ON7xItrAdED3qfHJpFXMXlYd6o7DAV08IKe7JHgBAW1QoM3DNG5sN
         GcX4/7Lcz6B/JG+VSau6EOwRaHxWsebsUmHFb2UNMaPuDz68+Krfwz9HTEVcU3AIaE1c
         Bi1IetPeAkDbkaOV53VXcbHwRN6dnj4Qreq+bdzX1N7UUezKiLJdhv+XdboBcwPBgSUP
         57w76p/EqCiQvoja9qjicNyAsrKqs4snwEnolUVEyGI5tSwhxo0rAWG3iiXYvBxqNE8f
         +Jq8KeHfUa5OBJLEWZ6F+4XOK6VqLejuo7uEjDP1bqHwAos4Oehq5rU5S1Jq8ve3zNR6
         6/2A==
X-Forwarded-Encrypted: i=1; AJvYcCWHisuIbdVC8KDn6NeuY3t7u8wDZxctCbPcKD+4F9Op4swevOoTUbxQEcKqDtK28R0fUxnvedeMQPSvI3k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2qXx1KYBAmvfP6+hVzRWOUD3O/Kb24eWdtfQwn42W/geNSxWD
	owrAKORPcjgxQMJXPsuYHusvs6F3lx0a6XWppwb1DlqonUretNSo1wEB4f5/XzTnWGs=
X-Gm-Gg: ASbGncuXpOpklbe5RCNz4sLv6GW++3Vm6LpAnQHevjI62/74A60PHYydgAF6tP3hHuC
	szn/ZeSA1WBl1X9LaSnlcXuMJB6juw6QiyycnMWnvVuzpnZqLzbNRHzW/l7ih3s0DdrLj/k/DGu
	yQghU07aaf5P/pt5neKVUZLwJRUoBkdVqd3viuOBEP9SGcslcaOunTZMPyzF783xEgwolhcBKKi
	39udwQgXYR2aT+zBrAZF3pUPltcFdzAVMi1YGD/7fkNiRopJQu57SDTpGsKzCfZYElHJ9cLBH7X
	6VMEYZWhyq6C3wxkMfncka+VtOKxIwSAlXzJUmzpuYe1ZddV5HfzaikUbanXzz5u13i55fXsyRJ
	fUl/11CEhu2gx0fpSjo9aywCMBSivU9IiX59INFmxi1IlY2WqQ2rFYtE=
X-Google-Smtp-Source: AGHT+IEMo9czCluXO4G1WUwXTZGTpWwBloBS5Kz3sFDyqt4FQLh+A2ENHLRTo8aoPbEVNVI7zemMmQ==
X-Received: by 2002:a05:620a:4885:b0:7cc:fde8:81cd with SMTP id af79cd13be357-7cd46722312mr74875585a.24.1747333429367;
        Thu, 15 May 2025 11:23:49 -0700 (PDT)
Received: from soleen.c.googlers.com.com (138.200.150.34.bc.googleusercontent.com. [34.150.200.138])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd466fc2afsm18218685a.0.2025.05.15.11.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 11:23:48 -0700 (PDT)
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
Subject: [RFC v2 16/16] MAINTAINERS: add liveupdate entry
Date: Thu, 15 May 2025 18:23:20 +0000
Message-ID: <20250515182322.117840-17-pasha.tatashin@soleen.com>
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

Add a MAINTAINERS file entry for the new Live Update Orchestrator
introduced in previous patches.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4fc28b6674bd..327b2084ab79 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13806,6 +13806,17 @@ F:	kernel/module/livepatch.c
 F:	samples/livepatch/
 F:	tools/testing/selftests/livepatch/
 
+LIVE UPDATE
+M:	Pasha Tatashin <pasha.tatashin@soleen.com>
+L:	linux-kernel@vger.kernel.org
+S:	Maintained
+F:	Documentation/ABI/testing/sysfs-kernel-liveupdate
+F:	Documentation/admin-guide/liveupdate.rst
+F:	drivers/misc/liveupdate/
+F:	include/linux/liveupdate.h
+F:	include/uapi/linux/liveupdate.h
+F:	tools/testing/selftests/liveupdate/
+
 LLC (802.2)
 L:	netdev@vger.kernel.org
 S:	Odd fixes
-- 
2.49.0.1101.gccaa498523-goog

