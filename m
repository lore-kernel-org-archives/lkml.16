Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4061A8401;
	Mon, 14 Apr 2025 09:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744622504; cv=none; b=SZwcXR6enavMj70Z93LLnRQHr4dzlCCaQWsSJhrH+03GIiak5Mquoms7ekz7rEo0oTybGDReNLQE9lc8bJ3Ta7a72hVQAy9uF+/zflJlCWsINMtd6/f7cI1JPVHUPb1BcaGoaq/eELVe9F4qolqV3vuhxvF1cw5rKJv5Ejx6W0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744622504; c=relaxed/simple;
	bh=N59YpcZcLeDa/zxZlDsu6vEbwkY/gNwqTb4h/B+Y8G8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=I5duJMsbzj8zGGXBPGg0K4cXUpx/FzCONmry78WFY1+u3zxSuwWS8Q2cGdA29xgFzKKU0bp4I8vp0ZngTrgkkK/vSbxBVv/nOzZzZx9eYLBWKZQjNtwyUhjHpOJofgomJwW4ko11yQ4/w6GU9KPj0T/wYgRFboL/VIhVjBUiLQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HXaeWxBa; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HXaeWxBa"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-224171d6826so56167375ad.3;
        Mon, 14 Apr 2025 02:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744622502; x=1745227302; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hcIpcFpfqBHwqvO9sUQQyRsFssd9wbcfPsd1vHKjYfc=;
        b=HXaeWxBao20l9uFPgR7JOVreQINODQTdgRbdE+PQtmsWihAr647MylkKtIX6J76r7D
         cETW3ZWSAt+cq84meig8ASA4Do3pgNt8jJvnFVkY6ML0WwzyeKIC6PsoCk4PJejaTR/u
         /EPmo4RArfGCTk79FOmRmnJSGwoInKUsqDO1r8U85J/W3uoesSdRWO6mlnQcL95W1Vbn
         XYtNt6cq9Ki+AuVX2NQCzkzlJyDNIZM7RelodNOwPJKiMHtW8t6mUIYS5yeYrCwRvRFT
         S7AKoWt1qRpimv6dpeGGbIpIrQ4ShZYsQdMfI6A/vrmi49CPCytqF8vntN8D1Fj8MOl3
         24xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744622502; x=1745227302;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hcIpcFpfqBHwqvO9sUQQyRsFssd9wbcfPsd1vHKjYfc=;
        b=l0xDp7zvVDAz41u90ImKvn5q4+FUwFgzRWYP4XDAiqrAbEEkv4kRb2wLnCUG3IZc0u
         irUUXt6UGa1LceD21ZuXRRe+UZPw+KCbSUMfR6Nu1/GTcexn38pWKLfNndGyTEF8qkXV
         B/ZXOgef2B9ErPf2UQlhyIfw+vUSF3v180SlTwyWhyYfa35SJs8N8VzZPWbuAWdh+PaJ
         XAXdSTNs1RzHnO0r7Vg89xVijjQ6esFEPXMGMUHpfAl1k1x4QHFkBZT0z5PVDAfteBY4
         xQXO4NqrHnDBnIEwuU4rRgewkYdxUMNnWU8LD8HT50EiQffkQiYrjSEiIoaM2FT3/HBJ
         Yajw==
X-Forwarded-Encrypted: i=1; AJvYcCXLkBheFuw2n2zWXaWIy0hrjeqr/hMxA+Cvs4Dr00KYXi8TcJ0cv11AJEx3g/8B6zyLBiaDM/Wh564AJm0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+Wypao2IPvbkRbWHssJDFJdU0GqoHXAC6W6IXK/KxDqX5UXNq
	p8IdND9H8sVuaio1ynFV0pWZXm/0798/3STWNPf9LtFqquK3hm/r
X-Gm-Gg: ASbGnct1WI3ZUNq8yij13TWZBAN8AfqttLeanl8OMiOuRI4tRVLUOmYE35+PtGtqmiN
	HLOjH31ME5YSEuFT6KBekJUJwnATjDm4o7hdBgokP3ME4kLvSsoWsbETU7DjTnnhjW5g1J191Md
	AkZ9ewctGHv9wg8vK3W5Z32mg84Z9r6u7hNhNhht7p+YrLwu4rvq0632YpyKOKMUHOMICiXhVIy
	LENW2ok/tzR/IAqWw47VfSQ79XAGmEWFQHneV4P1SbcO8yGNuy5LdgbV1n4ZYfthkzfMKjWbFNK
	X2jwtQ49Oq4stDHN8dxRoWHZp3/iPNDUl/PbpErj7JJTRAPBQIGW+PKhmH6A4pwVW7CKvWEbCcg
	f7/M=
X-Google-Smtp-Source: AGHT+IFbu47bl5tC8pp9w0xe/eoS/L4IF6o7u5p4WUZOUfDlClHyr5JNlXze4WFeUm2pxwMxdCQ/oQ==
X-Received: by 2002:a17:902:d2d1:b0:223:f928:4553 with SMTP id d9443c01a7336-22bea50bb7dmr166290245ad.44.1744622502234;
        Mon, 14 Apr 2025 02:21:42 -0700 (PDT)
Received: from SHOUYELIU-MC0.tencent.com ([43.132.141.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c99f23sm94987885ad.154.2025.04.14.02.21.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Apr 2025 02:21:41 -0700 (PDT)
From: shouyeliu <shouyeliu@gmail.com>
To: srinivas.pandruvada@linux.intel.com,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shouyeliu <shouyeliu@gmail.com>
Subject: [PATCH] platform/x86/intel-uncore-freq: fix inconsistent state on init failure
Date: Mon, 14 Apr 2025 17:21:32 +0800
Message-Id: <20250414092132.40369-1-shouyeliu@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When uncore_event_cpu_online() fails to initialize a control CPU (e.g.,
due to memory allocation failure or uncore_freq_add_entry() errors),
the code leaves stale entries in uncore_cpu_mask after that online CPU
will not try to call uncore_freq_add_entry, resulting in no sys interface.

Signed-off-by: shouyeliu <shouyeliu@gmail.com>
---
 .../x86/intel/uncore-frequency/uncore-frequency.c    | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency.c b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency.c
index 40bbf8e45fa4..1de0a4a9d6cd 100644
--- a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency.c
+++ b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency.c
@@ -146,15 +146,13 @@ static int uncore_event_cpu_online(unsigned int cpu)
 {
 	struct uncore_data *data;
 	int target;
+	int ret;
 
 	/* Check if there is an online cpu in the package for uncore MSR */
 	target = cpumask_any_and(&uncore_cpu_mask, topology_die_cpumask(cpu));
 	if (target < nr_cpu_ids)
 		return 0;
 
-	/* Use this CPU on this die as a control CPU */
-	cpumask_set_cpu(cpu, &uncore_cpu_mask);
-
 	data = uncore_get_instance(cpu);
 	if (!data)
 		return 0;
@@ -163,7 +161,13 @@ static int uncore_event_cpu_online(unsigned int cpu)
 	data->die_id = topology_die_id(cpu);
 	data->domain_id = UNCORE_DOMAIN_ID_INVALID;
 
-	return uncore_freq_add_entry(data, cpu);
+	ret = uncore_freq_add_entry(data, cpu);
+	if (!ret) {
+		/* Use this CPU on this die as a control CPU */
+		cpumask_set_cpu(cpu, &uncore_cpu_mask);
+	}
+
+	return ret;
 }
 
 static int uncore_event_cpu_offline(unsigned int cpu)
-- 
2.19.1

