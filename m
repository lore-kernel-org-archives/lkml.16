Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC8548CFC
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 20:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745959647; cv=none; b=l7SyI/bzS/s0YyOXPdqNIKde3mLlNPyKXE5xp5H7Ch/fo7ZhOMbHqyqFr1nIkbp3ZtLikoddu0GZuSfShI1VRpKwfd2SJhag+l25wRD+PnJTxWYq9yZ0mNhMtQqP9xP3C8Lkqacd+6GT/+I1o6AeQ8MlzrI3gVnEOWWsQUifWPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745959647; c=relaxed/simple;
	bh=QqcOdSbUWOmQ7xOdiF9jBdi+WEKBOn4XoknseksIirU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sudN3aDiqiv6+qQfgXesyR16ZBT12DQ6DK3u7c8h7Mb4Bookp8TWCdzCFvaRCGMTD+XV3PV1JPOFQpaqCDoWP5V+/6EttrHix7ttAwJ5yZwPH3eSmSf4RPkHQv7szIAsycRSNE7YEl2CeW/3GwoNtvtQHuMExC0U/QcEo6IqhzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Bf2D8cI2; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Bf2D8cI2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745959644;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9tDl4SM9LTrmRbXGWLMTTVmXyOXWasgXqOfwSbZ29mg=;
	b=Bf2D8cI2dc87DeF77mqwaIlcE0O5WkM7pMEe754pnu8cnHWVxh4LEqXmCQH6GkdTvQcJbh
	2EqK6h94UvDOqNhQPyywb8ppbdAo2DoYe7+TOqWkssTMe5y+y83+juTjrqUf8mDl78ZFpd
	l0CGB2VUxZJhJLIIvMT3bzzplrpa9AI=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-495-7VzJXsuAN9yvW_LAEjdziA-1; Tue, 29 Apr 2025 16:47:22 -0400
X-MC-Unique: 7VzJXsuAN9yvW_LAEjdziA-1
X-Mimecast-MFC-AGG-ID: 7VzJXsuAN9yvW_LAEjdziA_1745959642
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4768d63b1dcso5311811cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 13:47:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745959641; x=1746564441;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9tDl4SM9LTrmRbXGWLMTTVmXyOXWasgXqOfwSbZ29mg=;
        b=t2MqcbTR2dS3sj1vgpWvN01mOmXrLuMjDEkq2Ov7JWbjZtEIOiOf7P+HfVbrKQKKlX
         6lWXZkVP30cwMUKL+dINFggSWoQ827SAI0UWib7+HZ1dztLBS052BlMCbqGvxkcuugh5
         GFi4Ny++R3wHpt1Ct0EFJkQ3leE90By3ndbFokOvi/9MmeglzRC+3t71+Fjza2HWXRXC
         B+foIPHy+Qr9UL02YuZPWrnduolJ8htI6vxV6lDN2o1SZYlReKOk8L1kmTAvcccly+li
         OHNLYdg/81kTqxP06iSBaavzXDhLi4GIPGp/TgNslBvc55VmuPas6diW8imRQCdDzIRc
         8pww==
X-Forwarded-Encrypted: i=1; AJvYcCXbCPQ1790De9/Vp1bFB+zq3UwynN1FCKjPez2KRDv1GoURY82hKYFaFSMS9LeiPeBc+DtKtnE77ln7AXk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKFvvvklLgeEklNESNQf8qRcsByjEwW8n5+7cBegDqki4fWg0o
	5VenGmxKRcV/zTF+xrghldDLgsNJI/ogwlOXabEJCSe7rvJwDkzr/vNWtcmbmMzBqnsURSm7pwV
	1ZwT3HGy5kItbjeSihfaRmJAJxXb5fTV3vCLH480lGAry91a+Ce7raW3YiyTjSg==
X-Gm-Gg: ASbGncui4BOIJQ9I4TGZDBnt4p3c6A+jYwwhljPLF/RDTC7CXxiwkyiZQjMoLpR/+rG
	7vErEQ8NVDe/8INTg7FgZ6qot7kdYDfxBFT5mhjwsBso0bJeSmZrVibUmHtkVYu/yryNHQeZM3D
	g5DGCd4a4SRqRqG5IFGZJIGQFQnsqh29Lr+0ZOpf95f1KbDToHjlT8fi6RHimGDd0aXwxbMl8du
	EBEtjPetrSahj3lABMj4lES+A48sQrLEpjkiu3YgTsKgXY6z+H3W2TCoBMPYaFRHaMeeIEUheSi
	qkx5TVihZk5Tz0eOTmWM3zk=
X-Received: by 2002:a05:622a:1f17:b0:474:e033:3efb with SMTP id d75a77b69052e-489cdce6198mr4990021cf.24.1745959641647;
        Tue, 29 Apr 2025 13:47:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEB3zISEyNjnBvW374QL/ZY8r3V947KW/q/mBmF4gL3xZQoL9JsizIXWMEpRnC+4bSdQAo5dA==
X-Received: by 2002:a05:622a:1f17:b0:474:e033:3efb with SMTP id d75a77b69052e-489cdce6198mr4989631cf.24.1745959641208;
        Tue, 29 Apr 2025 13:47:21 -0700 (PDT)
Received: from thinkpad2024.redhat.com ([71.217.50.205])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47e9f1cfc4asm83668531cf.31.2025.04.29.13.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 13:47:20 -0700 (PDT)
From: "John B. Wyatt IV" <jwyatt@redhat.com>
To: Shuah Khan <skhan@linuxfoundation.org>,
	Thomas Renninger <trenn@suse.com>
Cc: "John B. Wyatt IV" <jwyatt@redhat.com>,
	linux-pm@vger.kernel.org,
	Shuah Khan <shuah@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	linux-kernel@vger.kernel.org,
	John Kacur <jkacur@redhat.com>,
	"John B. Wyatt IV" <sageofredondo@gmail.com>,
	Wander Lairson Costa <wander@redhat.com>
Subject: [PATCH] cpupower: change binding's makefile to use -lcpupower
Date: Tue, 29 Apr 2025 16:47:10 -0400
Message-ID: <20250429204711.127274-1-jwyatt@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Originally I believed I needed the .o files to make the bindings. The
linking failed due to a missing .so link in Fedora or by using make
install-lib from the cpupower directory. Amend the makefile and the
README.

Big thanks to Wander Lairson Costa <wander@redhat.com> for the help.

Signed-off-by: "John B. Wyatt IV" <jwyatt@redhat.com>
Signed-off-by: "John B. Wyatt IV" <sageofredondo@gmail.com>
---
 tools/power/cpupower/bindings/python/Makefile |  8 +++-----
 tools/power/cpupower/bindings/python/README   | 13 ++++++++-----
 2 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/tools/power/cpupower/bindings/python/Makefile b/tools/power/cpupower/bindings/python/Makefile
index 741f21477432..81db39a03efb 100644
--- a/tools/power/cpupower/bindings/python/Makefile
+++ b/tools/power/cpupower/bindings/python/Makefile
@@ -1,22 +1,20 @@
 # SPDX-License-Identifier: GPL-2.0-only
 # Makefile for libcpupower's Python bindings
 #
-# This Makefile expects you have already run the makefile for cpupower to build
-# the .o files in the lib directory for the bindings to be created.
+# This Makefile expects you have already run `make install-lib` in the lib
+# directory for the bindings to be created.
 
 CC := gcc
 HAVE_SWIG := $(shell if which swig >/dev/null 2>&1; then echo 1; else echo 0; fi)
 HAVE_PYCONFIG := $(shell if which python-config >/dev/null 2>&1; then echo 1; else echo 0; fi)
 
-LIB_DIR := ../../lib
 PY_INCLUDE = $(firstword $(shell python-config --includes))
-OBJECTS_LIB = $(wildcard $(LIB_DIR)/*.o)
 INSTALL_DIR = $(shell python3 -c "import site; print(site.getsitepackages()[0])")
 
 all: _raw_pylibcpupower.so
 
 _raw_pylibcpupower.so: raw_pylibcpupower_wrap.o
-	$(CC) -shared $(OBJECTS_LIB) raw_pylibcpupower_wrap.o -o _raw_pylibcpupower.so
+	$(CC) -shared -lcpupower raw_pylibcpupower_wrap.o -o _raw_pylibcpupower.so
 
 raw_pylibcpupower_wrap.o: raw_pylibcpupower_wrap.c
 	$(CC) -fPIC -c raw_pylibcpupower_wrap.c $(PY_INCLUDE)
diff --git a/tools/power/cpupower/bindings/python/README b/tools/power/cpupower/bindings/python/README
index 952e2e02fd32..2a4896b648b7 100644
--- a/tools/power/cpupower/bindings/python/README
+++ b/tools/power/cpupower/bindings/python/README
@@ -5,18 +5,21 @@ libcpupower (aside from the libcpupower object files).
 requirements
 ------------
 
-* You need the object files in the libcpupower directory compiled by
-cpupower's makefile.
+* If you are building completely from upstream; please install libcpupower by
+running `make install-lib` within the cpupower directory. This installs the
+libcpupower.so file and symlinks needed. Otherwise, please make sure a symlink
+to libcpupower.so exists in your library path from your distribution's
+packages.
 * The SWIG program must be installed.
-* The Python's development libraries installed.
+* The Python's development libraries must be installed.
 
 Please check that your version of SWIG is compatible with the version of Python
 installed on your machine by checking the SWIG changelog on their website.
 https://swig.org/
 
 Note that while SWIG itself is GPL v3+ licensed; the resulting output,
-the bindings code: is permissively licensed + the license of libcpupower's .o
-files. For these bindings that means GPL v2.
+the bindings code: is permissively licensed + the license of libcpupower's
+library files. For these bindings that means GPL v2.
 
 Please see https://swig.org/legal.html and the discussion [1] for more details.
 
-- 
2.49.0

