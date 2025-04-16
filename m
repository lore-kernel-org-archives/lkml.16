Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E2017B425;
	Wed, 16 Apr 2025 03:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744774746; cv=none; b=JKHq8xGfcpPCTVWEr7r8kkHR3XoG8ySlbx5R5ROBovOLTTPRFyiWS678K26zwqsXV/knL53csWCwDTdRnz3rUjWq5RPqEE0PM/ywJLn8kYnJeSKKlKnb47DkyNloClstbP1z2vW3qnqeEDD0rlq6wTiR26YHDvpukybOAdj3ZnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744774746; c=relaxed/simple;
	bh=7C69VSNAWxNC5ho0qxM3kMPZD93rz5lxDp3pMRgQFvo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bHaWnh0+a76rtyXRbYLXSsnzHlNPYhO/jMTE5Bs5qeUImOQ9ENU0Q47Zw/AxaNYY18m1g4/4LF004ZeW7zFyKpJHaWy4BlFRZmcnJYsQN9x4LQa4zQsccIBPGOk2+c4gbgu5JdUFpvezXfZQ9N99zZA6LS0OF+AcZKolnbgrv3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VPsXTRcT; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VPsXTRcT"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b074d908e56so2406965a12.2;
        Tue, 15 Apr 2025 20:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744774744; x=1745379544; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QjmRt8Cd/Lmh0JLS5OMRLpd5V7WUWWLlUBgOFlBKL7I=;
        b=VPsXTRcTvabKux9UfmSb8UEoNYaSn94/CdvdQSya8v4u6AwR+652qSgM4HGxbdWl4e
         GCvAU0Ylw8VAZg3xWozeAJtjj/vAQ22LsTXtmb8miaEQbAyjwiENEA5nD3NJCHllF82W
         vRgNgoehyRJsQwz/VSwQt1Gu95TRwrCe740+52JqihhEL3L18ssUnhvPmkFnWNm2RZ+D
         yhHyhfjstVgmZ3KH4Ypdb+BfaWrQoIHUeV8w/Ty8CMXbDJq41N2Z8eQjryIslXH3sNjc
         EDQxfdRyN+I5CggCaLkjzi9N8kx1HaTczB4HB1rDQkoO9fz1tXr7RiipO1TzoR2AQSGe
         AQxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744774744; x=1745379544;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QjmRt8Cd/Lmh0JLS5OMRLpd5V7WUWWLlUBgOFlBKL7I=;
        b=UE2x0NpaCdwXPcuOIdHUorX+ANBR6CpQWyLPv/AP88XYoTRjtfvOfozG7RI7axfLPz
         P0gGG8lru5a54M8F04EOcbUMfXeWf7wazwODGjIw14FeldTtYuBvvVcPvAVIR0vYjYFf
         TsgDEkIAA6mslAlZ2uKQS5Fq89rJCeB3jT1gQPa/rORDB8mrd8uCuGjf7hX6BN/P3Use
         tWhtnoF4ItAwYlVkkhrSM3cQ4ITTKmvkCFb3PymwuwyNXTY3LFE4LBSam6GO3f+Kj58z
         qAT6fNM7x/JCnRhtzM9oer+sB2zOOQTrBSZd1nhfcuUbCCPrnwrCCwMocfOzHRuR46xk
         joDA==
X-Forwarded-Encrypted: i=1; AJvYcCX1PTsQTJ+Y5lzztii4X8X+oO+fCaRkecGauyZ1fukYXUQ1dUmZ41f6FkXr0h0qfdzvWBKEf/97nbw2IpZeOCnsYLgyhg==@vger.kernel.org, AJvYcCXW/ORxIg15f0MMkPofelDGkj3O1Q+CX/rgD9JElT9Cd/x/5pWfz4MOjNXmM6HA/Xo0rFgdDeaFQMdLdTs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOwmm5S/gvDctpjQfCWK57hU9AAJiiO/ofuRHafJ/GywuIDhc1
	c7xV0OStDQq2zaeZ8ZDlT6O0aIrNgAr0fz9irqzw8/i9CBufngMm
X-Gm-Gg: ASbGncvy+1rH9lT2OVip7iuWIyr4CxLxZNzaa2v3V3LSxQkscDiBZOgDfTM7rOsz49C
	1iLGGlsjyJQIrfAowjwaH1cAaXJkErpwQjEyKrnVehDjmuNMkOCvDt0tRPcAIHKDk+6ACGQCKvO
	FlKbbiAKFMjsUEAF6RP9u9EhxhzhAqXLCo3vN2VJ2MzX3Hl9INYuA/vNrpgCzLzcALHf30TXwex
	Nq6XpY3kGDmCiZ5Uoz75/4ktkWqkUel5X/OBKvoGUYHq9EFZ9A+4t60X6AQ3FlFeu5g8bz/mIw+
	TgztSgeeQaySP/dokPzEloVqxPZhnltwXyspTHi1DoVYQZn53TCjUu1bdXtlq9sAIY9mNwgJPFy
	7KTMwEXPmgPfUew==
X-Google-Smtp-Source: AGHT+IHzlrFX/VmeFqIP0s0iWMtznw+UWhApP4Ue4ATagvNNEw9mTvsJpdOd/BH4xJPGu1cb8F8FiA==
X-Received: by 2002:a17:902:ce88:b0:21f:4b01:b978 with SMTP id d9443c01a7336-22c3597436cmr4642025ad.36.1744774744355;
        Tue, 15 Apr 2025 20:39:04 -0700 (PDT)
Received: from SHOUYELIU-MC0.tencent.com ([43.132.141.24])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33fa5a00sm3380645ad.138.2025.04.15.20.38.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 15 Apr 2025 20:39:03 -0700 (PDT)
From: shouyeliu <shouyeliu@gmail.com>
To: srinivas.pandruvada@linux.intel.com,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com
Cc: shouyeliu@gmail.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shouye Liu <shouyeliu@tencent.com>
Subject: [PATCH v2] platform/x86/intel-uncore-freq: Fix missing uncore sysfs during CPU hotplug
Date: Wed, 16 Apr 2025 11:38:42 +0800
Message-Id: <20250416033842.67394-1-shouyeliu@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Shouye Liu <shouyeliu@tencent.com>

In certain situations, the sysfs for uncore may not be present when all
CPUs in a package are offlined and then brought back online after boot.

This issue can occur if there is an error in adding the sysfs entry due
to a memory allocation failure. Retrying to bring the CPUs online will
not resolve the issue, as the uncore_cpu_mask is already set for the
package before the failure condition occurs.

This issue does not occur if the failure happens during module
initialization, as the module will fail to load in the event of any
error.

To address this, ensure that the uncore_cpu_mask is not set until the
successful return of uncore_freq_add_entry().

Signed-off-by: Shouye Liu <shouyeliu@tencent.com>
---
 .../x86/intel/uncore-frequency/uncore-frequency.c   | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency.c b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency.c
index 40bbf8e45fa4..bdee5d00f30b 100644
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
@@ -163,7 +161,14 @@ static int uncore_event_cpu_online(unsigned int cpu)
 	data->die_id = topology_die_id(cpu);
 	data->domain_id = UNCORE_DOMAIN_ID_INVALID;
 
-	return uncore_freq_add_entry(data, cpu);
+	ret = uncore_freq_add_entry(data, cpu);
+	if (ret)
+		return ret;
+
+	/* Use this CPU on this die as a control CPU */
+	cpumask_set_cpu(cpu, &uncore_cpu_mask);
+
+	return 0;
 }
 
 static int uncore_event_cpu_offline(unsigned int cpu)
-- 
2.19.1

