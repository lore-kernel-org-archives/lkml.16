Received: from mail-yw1-f228.google.com (mail-yw1-f228.google.com [209.85.128.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E52B1D63E4
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 20:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743797220; cv=none; b=huSAMkeOlJaxttsTcq1puUtWfL1/ypIIaQi6E0qZVajp55HJQbVov7KEgoOHUXabjJ0y0hBYx3eKE2NMfAqV22E5BjT18ewTLSnpEmNwCdXt/E56N3+nXQavqCyPqs65De3ESRqxGYRvD9jDYmWu36KLMOnDeyZgE8NHWxrOek4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743797220; c=relaxed/simple;
	bh=16Fz2oRXNePBUnEYA2y0GPMsbknb5X8EAN1ke5x9w6w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=NRxY2dOe7fBgqIP1NtsHBdEM/AZv2lwpLokf6eF98HeknY33U/dmDBVPOsRDJmGbizkfMLIkCv5P/BODOlt2PHlH1s4lsgTNGTvf7plwaQ18Yj7sB++4FRhhv4FJzrKBpIJFkgK16Gnbivi4iNAoxjcf1f8rXqcWXtnXdqOunVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=T+dWpMdd; arc=none smtp.client-ip=209.85.128.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="T+dWpMdd"
Received: by mail-yw1-f228.google.com with SMTP id 00721157ae682-6f679788fd1so18755707b3.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 13:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1743797217; x=1744402017; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2M1hpXYJrQhzvhFIXGwXFXDV00AlUZW/lxOdiQ1kbxM=;
        b=T+dWpMddkRbiGF2oU/zkYSPfENuhwxo2gDDYsyRiE8nV3ZP5L04jHFPlwjnCx/MRfy
         w6bT1D94JgsKadG9+imKl3YaIpINvpGSOv+QlUS2zqWaK8kE7C8bNiVGnPjKsxAQEf2/
         kpPNxryjSw3jCEOY3C9Tm7RLM0qSE26ijCKOaBr5O/H3sPo9gUsIEYh6wssjPSdm9rBN
         pw6STtNWM92B05bHOs/t/PQKLyJIeq6YUOn5mKe/YsvhRMlozE5qcN5oRXc03m8UJKKn
         pUpb+gGm4ErJlmym0NZjEhkOIfqxZnmJavGdxbLExep3vzs1v6itObYYSPgdGpjp7sNe
         wLgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743797217; x=1744402017;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2M1hpXYJrQhzvhFIXGwXFXDV00AlUZW/lxOdiQ1kbxM=;
        b=E7u/REO5m5xyVTs2/QyHONVra8CTmRU1QnHOsfV7miw4yEeBuIJzZ5H8HWYNwwP78p
         mpVsdaCq7y+oQPGb7/yKo/hjrTHH3tmDhusP8kEZX/9Nbu9jYWC7lkdrTNssK6xEF3IT
         m5LwZJJsMLO5IoVE8ZcPbWE5KJamFVkZpnrtwNBtrkL95FhARSDGXHmpPGpw5kRSjgQ/
         D61D9phhMZBMWe2upXPtUKXOM52QQcLCHfs7OwzcxXzE+NCTKwbLgmrAIrMDmm6ihY+I
         BeFX93K8MSXEfgtAQ6LOj3U79k/oN4mcnwDdXZ2XEhQV807NXPi7f4j7AgeBGEu25kit
         /maA==
X-Forwarded-Encrypted: i=1; AJvYcCXN9l6JKK3qd6W0gMUgO5rsgiHzMtqBXLtrtfh+D/EzOM4DXG7JoKiS/1mUm7eBQMZrI4ORH/TeuiQ4Ilc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8ngYyAbdMs5h4M2LtUQ9bSyT9aXqwvdKhgHvPKTstkE6+k7ab
	IpLk3DPvLGHW3rPm3JW4GozQEYiuFcPD22kFuaB4vJdQ3hIze8xOjM+K2sAQFmsNUM+0ib0IuKN
	ubwmd7DIxs256nhMijLoPESc6DqXdYxI0
X-Gm-Gg: ASbGncsTCvQhf3AmnBICCMN0KdtDsb3+r/Z11fVWcxF/Ypf5LyuqAGMgq87gdm5V0x+
	sb7dvGhScbbeDqn+H0VJ1P2WFtHESnd/MnmH5S5Q0a9g5SIRyhXpS92Q79Nlcfpbub1GyxvKOKr
	24SMy4doa4mEqUtuUfoNSaXTrJy+LGORlasJp5729qfm8DiHMxKHg/s8teCmevkySRqRb2x12N/
	PAALXGlM1gAcQrDsgf15B07XuSPJjROZsgaYC1jSEtB7vEvakc5/6JS18iMtamU8Qce21MqTJBK
	i3tqAMIj4jHoFXeC6lc+8lERH00zF+sgEJ58fBEWMxmBxgvfZA==
X-Google-Smtp-Source: AGHT+IFcGdONDC85B/gSZoS4J+FgxMFotj48il2SfT+fCyI/ofRzxNcF2q2hE6zWGGUchQgcgJzgPHx2gnpx
X-Received: by 2002:a05:690c:4493:b0:6f0:23da:49a3 with SMTP id 00721157ae682-703e14f5708mr68698877b3.8.1743797217304;
        Fri, 04 Apr 2025 13:06:57 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([208.88.159.129])
        by smtp-relay.gmail.com with ESMTPS id 00721157ae682-703d1faebb6sm4324697b3.59.2025.04.04.13.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 13:06:57 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-ushankar.dev.purestorage.com (dev-ushankar.dev.purestorage.com [IPv6:2620:125:9007:640:7:70:36:0])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id 998883401CC;
	Fri,  4 Apr 2025 14:06:55 -0600 (MDT)
Received: by dev-ushankar.dev.purestorage.com (Postfix, from userid 1557716368)
	id 86E48E40F18; Fri,  4 Apr 2025 14:06:55 -0600 (MDT)
From: Uday Shankar <ushankar@purestorage.com>
Date: Fri, 04 Apr 2025 14:06:43 -0600
Subject: [PATCH] nvme: multipath: fix return value of nvme_available_path
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250404-nvme_type-v1-1-920053372832@purestorage.com>
X-B4-Tracking: v=1; b=H4sIANI78GcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDEwMT3byy3NT4ksqCVN1EixRTE8PUtDTjlEQloPqCotS0zAqwWdGxtbU
 A0tRvhVsAAAA=
X-Change-ID: 20250404-nvme_type-a8d541eff3da
To: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>
Cc: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Hannes Reinecke <hare@kernel.org>, Uday Shankar <ushankar@purestorage.com>
X-Mailer: b4 0.14.2

The function returns bool so we should return false, not NULL. No
functional changes are expected.

Signed-off-by: Uday Shankar <ushankar@purestorage.com>
---
 drivers/nvme/host/multipath.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nvme/host/multipath.c b/drivers/nvme/host/multipath.c
index 6b12ca80aa27305a759990348c4c107655664d94..94152cf423f165aaba9cbb57f370ef4708365f1a 100644
--- a/drivers/nvme/host/multipath.c
+++ b/drivers/nvme/host/multipath.c
@@ -427,7 +427,7 @@ static bool nvme_available_path(struct nvme_ns_head *head)
 	struct nvme_ns *ns;
 
 	if (!test_bit(NVME_NSHEAD_DISK_LIVE, &head->flags))
-		return NULL;
+		return false;
 
 	list_for_each_entry_srcu(ns, &head->list, siblings,
 				 srcu_read_lock_held(&head->srcu)) {

---
base-commit: 0514a1379e11c6b8038674f43a478b0857d47a5e
change-id: 20250404-nvme_type-a8d541eff3da

Best regards,
-- 
Uday Shankar <ushankar@purestorage.com>

