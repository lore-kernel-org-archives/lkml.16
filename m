Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90861A2389
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 20:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745441244; cv=none; b=PIt6+1TFGI7jGi3noKWqi3ZPyzz448wycFBtlnKbU0X3QYf1HdH/4u8CdMKPdUVfq/PAyTJnhqeXeVvPBBUJZSsxvnhl6IfciAoytQoR4lx3DcmAyXyTDj+lt37dtEbTRMBiR1oGslvwR0kf4lv1HTMaV9UzQaRXuJRvDgRLeeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745441244; c=relaxed/simple;
	bh=9o+fog/E8/Y/Ep3sI6pTRlp7waYxHqWZlzLlUSvxIbo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BA2AXTp//6dFIiuCnP30TPqw1sf8Dk20QtLuUKSb4qixJP1euODhthUWgAU4vYZlVDmbA4biAX0MJZqmBCZWx8qsG66hjR3fT0jCJJboVQ+dRFwxFT3S1tmkqus8ANG2bG5cG2xEMpjMPAhipztRZbMNTsgz7ED9FGxYOJIr+ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=K0BKg295; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="K0BKg295"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-aee773df955so1274301a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 13:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1745441242; x=1746046042; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qadNYoaJhFPVnikI7MqGvzeOQWIRrwJCqdY+2xJb3Ik=;
        b=K0BKg2958DiU4hWdg/ztCOoAJvYPW3CMDZWb+ZwOdV6Vl9Pv5dXsC/jmzEMVjtPXBB
         gHX+Xdkfw0E6jHzenQLnmmZkOTn8LG6zIg3qudIRXqOpWNqOQgUBOQJrAf9UIBrL5OLf
         LZeEWySKA3ix1BiFJxTB28jx3On+Wq0TN+eXE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745441242; x=1746046042;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qadNYoaJhFPVnikI7MqGvzeOQWIRrwJCqdY+2xJb3Ik=;
        b=w27Zss6fCv5cB/biDgjPLfJrFalHEDOz6hgiUBVlp6zjs0YsFmLoumt5jWKO+6Y7qi
         spa4qf4NtSrv+I8OFljv6zEQiXTgx/TjjUwz2k72bmhIyaMcYlm0Dmz2ImQ+UQxw7xSW
         6vb4zepLZbsGXSQ9dNNC/WW2IDMq7F+E3W43e1lCJA/+ZrK3XA0+O6q0AgrYu8EJpqyI
         wKwqaNkgpPp3ihFwP9mMdqF1zcz1lHdvQEvJ23pcCCNn2wrsUUe2JGvCgoZUgyt7MZOO
         qN6i67NdTwwTX2r/TdDR3E7REHxpeINEWDmNpSRaIf+1J8Gm13jpxLry+LAwHLXsbLlr
         za7Q==
X-Forwarded-Encrypted: i=1; AJvYcCX6eFNFKif4Av6YjOn3iA+wb7yJCw0TRx0LcZsRJzBqdulYOilRT2ankcfq/7yPXnDxBhyaWrBS7i4joho=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6b6t2qaOlf4hx8a67kr17bSpKksMzFyh/bNSM+Eue58bk3dT+
	gILcocXPQUgjk/JmI3+1RN4tnjG/8meDFChASTLGKKS/WRZ7d31U1P6AyS5QDwg=
X-Gm-Gg: ASbGncstJ5miiQ0OgKAtvzzU2m+7haBCWx/TfzoFpIw0R4gwcsnDJE0wN4hiUumewhT
	Z/ewmI+a7AOAiXJNf837W/IX32MTBT93RYzwU+iKkyfJemYPU59ZFYbNRGmvIvBaqmaKUDQ+tDx
	eku2oDWbX9fOPshOgLX2/6qnsGzOOnNbam38riSOlbjtFzhzaFgriqmcQn/60VbbL5mQeofz/Uy
	drdkoSt0EvkkJgPtRUXTUQyDrTgDBy8GPLJtGvOsg9GqH5K80rcIsjhqRQ64acElF+6XLRUSJJj
	cN+4W0B3agrxTBKtsGZSPHwA7oKTp5yqBE7kZaynSGVpm1iMoGLfPxQBAWU=
X-Google-Smtp-Source: AGHT+IF5+OdbC6uuNEBaPHTOjQ76F8Y9VNe3wZx/cneGiXQy2TYO2E3fpZtgPx1i/wPR7pX74IsDUw==
X-Received: by 2002:a17:90b:2801:b0:2f1:2e10:8160 with SMTP id 98e67ed59e1d1-309edab1bd7mr1408a91.11.1745441241864;
        Wed, 23 Apr 2025 13:47:21 -0700 (PDT)
Received: from localhost.localdomain ([2620:11a:c019:0:65e:3115:2f58:c5fd])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309e0d09cacsm2120908a91.49.2025.04.23.13.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 13:47:21 -0700 (PDT)
From: Joe Damato <jdamato@fastly.com>
To: netdev@vger.kernel.org
Cc: kuba@kernel.org,
	donald.hunter@gmail.com,
	Joe Damato <jdamato@fastly.com>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Hao Luo <haoluo@google.com>,
	Tejun Heo <tj@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] tools/Makefile: Add ynl target
Date: Wed, 23 Apr 2025 20:46:44 +0000
Message-ID: <20250423204647.190784-1-jdamato@fastly.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add targets to build, clean, and install ynl headers, libynl.a, and
python tooling.

Signed-off-by: Joe Damato <jdamato@fastly.com>
---
 tools/Makefile | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/tools/Makefile b/tools/Makefile
index 5e1254eb66de..c31cbbd12c45 100644
--- a/tools/Makefile
+++ b/tools/Makefile
@@ -41,6 +41,7 @@ help:
 	@echo '  mm                     - misc mm tools'
 	@echo '  wmi			- WMI interface examples'
 	@echo '  x86_energy_perf_policy - Intel energy policy tool'
+	@echo '  ynl			- ynl headers, library, and python tool'
 	@echo ''
 	@echo 'You can do:'
 	@echo ' $$ make -C tools/ <tool>_install'
@@ -118,11 +119,14 @@ freefall: FORCE
 kvm_stat: FORCE
 	$(call descend,kvm/$@)
 
+ynl: FORCE
+	$(call descend,net/ynl)
+
 all: acpi counter cpupower gpio hv firewire \
 		perf selftests bootconfig spi turbostat usb \
 		virtio mm bpf x86_energy_perf_policy \
 		tmon freefall iio objtool kvm_stat wmi \
-		debugging tracing thermal thermometer thermal-engine
+		debugging tracing thermal thermometer thermal-engine ynl
 
 acpi_install:
 	$(call descend,power/$(@:_install=),install)
@@ -157,13 +161,16 @@ freefall_install:
 kvm_stat_install:
 	$(call descend,kvm/$(@:_install=),install)
 
+ynl_install:
+	$(call descend,net/$(@:_install=),install)
+
 install: acpi_install counter_install cpupower_install gpio_install \
 		hv_install firewire_install iio_install \
 		perf_install selftests_install turbostat_install usb_install \
 		virtio_install mm_install bpf_install x86_energy_perf_policy_install \
 		tmon_install freefall_install objtool_install kvm_stat_install \
 		wmi_install debugging_install intel-speed-select_install \
-		tracing_install thermometer_install thermal-engine_install
+		tracing_install thermometer_install thermal-engine_install ynl_install
 
 acpi_clean:
 	$(call descend,power/acpi,clean)
@@ -214,12 +221,15 @@ freefall_clean:
 build_clean:
 	$(call descend,build,clean)
 
+ynl_clean:
+	$(call descend,net/$(@:_clean=),clean)
+
 clean: acpi_clean counter_clean cpupower_clean hv_clean firewire_clean \
 		perf_clean selftests_clean turbostat_clean bootconfig_clean spi_clean usb_clean virtio_clean \
 		mm_clean bpf_clean iio_clean x86_energy_perf_policy_clean tmon_clean \
 		freefall_clean build_clean libbpf_clean libsubcmd_clean \
 		gpio_clean objtool_clean leds_clean wmi_clean firmware_clean debugging_clean \
 		intel-speed-select_clean tracing_clean thermal_clean thermometer_clean thermal-engine_clean \
-		sched_ext_clean
+		sched_ext_clean ynl_clean
 
 .PHONY: FORCE

base-commit: 45bd443bfd8697a7da308c16c3e75e2bb353b3d1
-- 
2.43.0

