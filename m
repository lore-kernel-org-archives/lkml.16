Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C1A15E96
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 08:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749717961; cv=none; b=qagzr7br4CfjyNt0IlGZWYGBj0//Amb2GqAyM6xI6zuMGngCJx/Cc2mSkz8ZruoWwn8vzqn3MlITw3evVAzFymZEYx78u6S+uwXM24gUtv4vKVc26UnID6CKVZJJ4nx+f85NqFfIJlUGIfCmIV51ovPb91JoeNMVvyd89HkjMQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749717961; c=relaxed/simple;
	bh=N5wcwfcLu9AlsbJtqb6p3PuoyNM8HmZGrqcbr9Db6sc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U49sLON687v82KJuqKolOTLincnm/RAlCPlSbxaabkapG6WBaEqNA0BM3fW/mCbThRc5qfgRyz9XC+wH/lNTGZKJv7mLF/D0OaNmxjALpBJbQqCbs4WVkhM94giFY1K+EHWCftahxPQHvEg+bBqp/jnYJibQH38p+m6EcF4tXpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bi7pELAc; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bi7pELAc"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-74877ac9d42so540537b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 01:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749717959; x=1750322759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TpZLNWW0DOhsGzvSZThrO5Z24o9vsj5Ub5xo7XurfUA=;
        b=bi7pELAcLeHocAyOixA7yk/JIqU2qOQ1iD9UIHCEYMhyYIKPqSoFaQYmwpRM8PwlNM
         rBOWUffHCpse9GePdywFQ25luVlmVHEu83GsG2H7K6DShRCFjzr3SFuCHSTfXg8Ty9QD
         gi5CDlW9P565XyHBzNn61rVuqDkWoL0Hzn8fA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749717959; x=1750322759;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TpZLNWW0DOhsGzvSZThrO5Z24o9vsj5Ub5xo7XurfUA=;
        b=qHcg4bZO57dqV9TK+dgowfddUH50YMUgG7Wv2CTbnw2run+bZs8JsxrGI3sJj6eOn/
         IAp7FF53OJsFyBktzqI8j6D0zgQAFB+qwhjYCxQfXcMGUNIfKsjwcRC171IzE57/0uqo
         macV6awFra90KXVpTidJXZosYpMaLWRKcMtjchheNaEJ5+Ihj9foDPG5E2/kKDGvMOQm
         GB7dw3UzNEVyEQxXWmvTPQ5KGirTK3qWDSUwUsbXFhH9IU+foQeuVajlsfwCl/T60Kz/
         GB2ht03DN5cgjHcmK70t9wX4LJ2w4NIe2x0Y4NYRUj7/YpQtF7CBdloMze+g8+zwESt/
         mKSA==
X-Forwarded-Encrypted: i=1; AJvYcCUph5UYZo5OFtBepQYJyDGKJEpMCkEOU/J1iML06A8sHIIJbmp8uG+quVyr7dNenVvC33jhm//ABnCXICs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0g6CT4w+xXn9SxXvwOBDPnkv9cEPyWhOk/QM5eTms+UT+j51x
	CDpilT3Wfi2ND+5Jf/Rnm3EnXco+of9h/y2wHzXAYCjJKNwGHbmbHKxeiI+fljCgQA==
X-Gm-Gg: ASbGncsrByWpalugFoeXXf2bqrmE49fq8kbaMMlpDV4ngPQ6ivD9P82V45kgTtMA7a0
	XJfAdqVreRDYJtpIMuKAHRfS5cq8QELAz/0PYTCgAoDIWv+rPfGGwi5uVB8wWfGoVSMYNORFjSR
	bRdJiVZdvAl/lBB9vvAKLqMAxQp0Lr7S6kl8TNYYZWGKYw8wLbNAosxY1XH2su6InMx8lN3R9uH
	G3oibVeFb/4mUS2Avlj2ci+UEh3LA4SRc26hnq5dyipNtfQO8ujhg9Nf9Rs9uMe12zIdmHVLL6U
	nh/N8j+9TaefbUTqRKJWnrg6TCiBnsPv5NTca+7BtP0SJkE95SJdKM/ZWf/JqKdGMPfPR6mGKYG
	QsXdwxs+fdJ0=
X-Google-Smtp-Source: AGHT+IH+WHMtXn8bwbKfQnFjtwXx1iGxMWnJkL+ndCJJX/b5xWKBlUyZSGGvyl1WSRHTr2d/Tewnww==
X-Received: by 2002:a05:6a00:8593:b0:746:1e35:3307 with SMTP id d2e1a72fcca58-7487e22c268mr2650354b3a.14.1749717959076;
        Thu, 12 Jun 2025 01:45:59 -0700 (PDT)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:fcb5:79e0:99d6:8d5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74880a10152sm933200b3a.172.2025.06.12.01.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 01:45:58 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>,
	Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv3] wifi: ath11k: clear initialized flag for deinit-ed srng lists
Date: Thu, 12 Jun 2025 17:45:06 +0900
Message-ID: <20250612084551.702803-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In a number of cases we see kernel panics on resume due
to ath11k kernel page fault, which happens under the
following circumstances:

1) First ath11k_hal_dump_srng_stats() call

 Last interrupt received for each group:
 ath11k_pci 0000:01:00.0: group_id 0 22511ms before
 ath11k_pci 0000:01:00.0: group_id 1 14440788ms before
 [..]
 ath11k_pci 0000:01:00.0: failed to receive control response completion, polling..
 ath11k_pci 0000:01:00.0: Service connect timeout
 ath11k_pci 0000:01:00.0: failed to connect to HTT: -110
 ath11k_pci 0000:01:00.0: failed to start core: -110
 ath11k_pci 0000:01:00.0: firmware crashed: MHI_CB_EE_RDDM
 ath11k_pci 0000:01:00.0: already resetting count 2
 ath11k_pci 0000:01:00.0: failed to wait wlan mode request (mode 4): -110
 ath11k_pci 0000:01:00.0: qmi failed to send wlan mode off: -110
 ath11k_pci 0000:01:00.0: failed to reconfigure driver on crash recovery
 [..]

2) At this point reconfiguration fails (we have 2 resets) and
  ath11k_core_reconfigure_on_crash() calls ath11k_hal_srng_deinit()
  which destroys srng lists.  However, it does not reset per-list
  ->initialized flag.

3) Second ath11k_hal_dump_srng_stats() call sees stale ->initialized
  flag and attempts to dump srng stats:

 Last interrupt received for each group:
 ath11k_pci 0000:01:00.0: group_id 0 66785ms before
 ath11k_pci 0000:01:00.0: group_id 1 14485062ms before
 ath11k_pci 0000:01:00.0: group_id 2 14485062ms before
 ath11k_pci 0000:01:00.0: group_id 3 14485062ms before
 ath11k_pci 0000:01:00.0: group_id 4 14780845ms before
 ath11k_pci 0000:01:00.0: group_id 5 14780845ms before
 ath11k_pci 0000:01:00.0: group_id 6 14485062ms before
 ath11k_pci 0000:01:00.0: group_id 7 66814ms before
 ath11k_pci 0000:01:00.0: group_id 8 68997ms before
 ath11k_pci 0000:01:00.0: group_id 9 67588ms before
 ath11k_pci 0000:01:00.0: group_id 10 69511ms before
 BUG: unable to handle page fault for address: ffffa007404eb010
 #PF: supervisor read access in kernel mode
 #PF: error_code(0x0000) - not-present page
 PGD 100000067 P4D 100000067 PUD 10022d067 PMD 100b01067 PTE 0
 Oops: 0000 [#1] PREEMPT SMP NOPTI
 RIP: 0010:ath11k_hal_dump_srng_stats+0x2b4/0x3b0 [ath11k]
 Call Trace:
 <TASK>
 ? __die_body+0xae/0xb0
 ? page_fault_oops+0x381/0x3e0
 ? exc_page_fault+0x69/0xa0
 ? asm_exc_page_fault+0x22/0x30
 ? ath11k_hal_dump_srng_stats+0x2b4/0x3b0 [ath11k (HASH:6cea 4)]
 ath11k_qmi_driver_event_work+0xbd/0x1050 [ath11k (HASH:6cea 4)]
 worker_thread+0x389/0x930
 kthread+0x149/0x170

Clear per-list ->initialized flag in ath11k_hal_srng_deinit().

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---

v3:
- updated commit message and subject line (Baochen Qiang)

 drivers/net/wireless/ath/ath11k/hal.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/hal.c b/drivers/net/wireless/ath/ath11k/hal.c
index 8cb1505a5a0c..cab11a35f911 100644
--- a/drivers/net/wireless/ath/ath11k/hal.c
+++ b/drivers/net/wireless/ath/ath11k/hal.c
@@ -1346,6 +1346,10 @@ EXPORT_SYMBOL(ath11k_hal_srng_init);
 void ath11k_hal_srng_deinit(struct ath11k_base *ab)
 {
 	struct ath11k_hal *hal = &ab->hal;
+	int i;
+
+	for (i = 0; i < HAL_SRNG_RING_ID_MAX; i++)
+		ab->hal.srng_list[i].initialized = 0;
 
 	ath11k_hal_unregister_srng_key(ab);
 	ath11k_hal_free_cont_rdp(ab);
-- 
2.50.0.rc1.591.g9c95f17f64-goog

