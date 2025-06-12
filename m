Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8108223321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 12:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749732515; cv=none; b=KZkHZVaPyF//j5Jd9ai+o2QE5sI8mGGxPiir61KcSnPmYHrMxXFF9oVSG7LcC1iqWlkAhkmjDjuReH8tusZTXAKSXc+tdWcCPfvfW1L3S6qwr4jp2HRKppphIrzZOq6Ujmbden7RwvdqOp7PZBLkUcVjjpcCjunHRIkyzCwoRzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749732515; c=relaxed/simple;
	bh=uIpfV86I5hPV5TggbDl8CTaPWvS8Orv3jUk+S3wEWyg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qwFl7stT1jenJEThQ9yAmO7Gl/RgIbJVR+2Vccb9cG0BJvwzBipnNLV/59N4vOaiPKwhLHMFZQ8mrWe37kfADJzBBRtCnbwENgSXiBEw29JFFCp3A+/Nh/KtLyqxUiaVH3frA3lAF37v9wQbkBJGtTovTONqAxOGDNGfsHeaqeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mZaYPTpG; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mZaYPTpG"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b2c4331c50eso648765a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 05:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749732513; x=1750337313; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Un8c4hSuq68zw8qRr2FQLigByWgPP3IS2ZayC2CfFEk=;
        b=mZaYPTpG96J6e1RcNCyS7vupJyeXhs/JkNxgS1Z1b1YQIyfB0BBpSe5ylwjeEM8kLn
         re81pCKJLxayTh8hOlQB6F8nzcWyiL0TWp8cEc6u4tgyCxMEpb36e70r0H87E+5GGUkl
         OmnQYOytfMv/iwtyaSSsbXF1vcSVeChVEGBWssbhiFdklZ8aZTUJXfeMX5iPTyDBdHN3
         bV7phVpqvVQPsyTkNDuja1UG03DXuMVAoBLsvETpkxxmALDUqU51gPx8eddVUmpq8gMA
         fNbghgp89+uSsUB5lq1FJPtcNxfsCFBTMpd3PV0QY5aBaQ3CfpBEoL86JfjGQFLe0SJR
         JZZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749732513; x=1750337313;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Un8c4hSuq68zw8qRr2FQLigByWgPP3IS2ZayC2CfFEk=;
        b=YDHxMTXXvxtj2NrQkU8eKQh87p6dl0WOivncXbOYYywAuT9c21FOphjhZVCEw+Lbdk
         4vqeWbd1AR9Kv7Aa714NhDiY408kaWo3CU04cpYwpEROfX+4ht9fplsNIHldLTfQFAwc
         vLXDCebivCb8zS+2xzaHoiMXHmp7cU1DzIG0BiEBNDyr1HUVlvkSesWLtYITVkt+1Nql
         IgSLuGOtXxt4ku4qUfvz3KgXp3ewGl58G5wnGQI0jXnBeq/9YVWO6yPNsrbgY0auzRYj
         1CXJHFTOPRRgM9b5NPbJtneoVjxcS4UM9b1NrYDOZF+IQNmWnBtTOsfCh1z6USlQWXzD
         2ZpA==
X-Gm-Message-State: AOJu0Ywl35k6Zi9X2gKtuvYMeiws896Pon7FnDs1ZmCcN205hUvcEJ+K
	B2j3l3STmfTfDFTUlwMvkRYufNtJFEVMxWfQ6Hr3IXZIQaAIiYZ6H/PP
X-Gm-Gg: ASbGnctujpQieRJc1T46ZAIqLBPL6pqZ49wkOFdJYZWsS7p2zEHhN3k12CNmrhJJQAV
	pSUmDImYFZdkyZ38qA//jsMuceVsNmoSvDr+LTj44OPqjd/15IdvlFTIG96y+1GSZl5MzuntGoY
	axbjJQbxnmHdfIQGHHSm5wC7bF1LR/w3wF8Ku1g6k0+1Ac7B95apqt6mhMST5+Icf4Atbr/BuhK
	NNkgRRRkAL7YoMVu95r4MFfK1O9EvOWXvcs/MWrlLoRvbJbB/ImFbQCplHZDBrqzcdA95seSnn4
	MufcrGwskCN+4YDN2PQzEssDYH+UAsM5j2yPkWFVYKgmFq6gIDD4WUcL2geONatXjkzV
X-Google-Smtp-Source: AGHT+IHPPN6kLSixGb/big4CyW5D5xRPw8joJqbkJBxJ8MQ1m7AocngH+i51AVcjWCqF1viIVH5JSg==
X-Received: by 2002:a17:90b:2c90:b0:313:20d2:c99b with SMTP id 98e67ed59e1d1-313af11cb9bmr10910933a91.9.1749732513058;
        Thu, 12 Jun 2025 05:48:33 -0700 (PDT)
Received: from gye-ThinkPad-T590.. ([39.120.225.141])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1c5d80bsm1342010a91.35.2025.06.12.05.48.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 05:48:32 -0700 (PDT)
From: Gyeyoung Baek <gye976@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-kernel@vger.kernel.org,
	Gyeyoung Baek <gye976@gmail.com>
Subject: [PATCH v2] genirq/irq_sim: Initialize pointers properly.
Date: Thu, 12 Jun 2025 21:48:27 +0900
Message-ID: <20250612124827.63259-1-gye976@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Initialize `ops` member's pointers properly.

Signed-off-by: Gyeyoung Baek <gye976@gmail.com>
---
Changelog:

v2:
 - Edit commit message and subject. 
 - Use kzalloc() to initialize simply.
---
 kernel/irq/irq_sim.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/irq/irq_sim.c b/kernel/irq/irq_sim.c
index 1a3d483548e2..ae4c9cbd1b4b 100644
--- a/kernel/irq/irq_sim.c
+++ b/kernel/irq/irq_sim.c
@@ -202,7 +202,7 @@ struct irq_domain *irq_domain_create_sim_full(struct fwnode_handle *fwnode,
 					      void *data)
 {
 	struct irq_sim_work_ctx *work_ctx __free(kfree) =
-				kmalloc(sizeof(*work_ctx), GFP_KERNEL);
+				kzalloc(sizeof(*work_ctx), GFP_KERNEL);
 
 	if (!work_ctx)
 		return ERR_PTR(-ENOMEM);
-- 
2.43.0

