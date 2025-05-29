Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC70729344F;
	Thu, 29 May 2025 20:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748550511; cv=none; b=Sxo+bAMhxNdW51LOKhtUyASeAYjXFz7/N3ud4tMSurnQi7bGVyFSKjNrwCcZV85F1mfpPUrYXzPx81yCwLkqL54ov01vcs3WFU6dKUf2F+KGEvSQmM8XzA+ahoBcySnkcjms13zCPOdRs0CxDnqsS9QhVTNmlAT88fonYMEPWwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748550511; c=relaxed/simple;
	bh=j4Rz+vKZeBfIclnN4tH4NBfCpbSSx+npFeWIyxOX1ws=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vpop0FfR64UEzgz86FzRWs9OUZ1zg4WpsXdu8qVAwLCwzs+sVnDgNOEIJsuonITitghxtHSCrD0L+k/QFIKxEkJcxXOXX6LbkcYLz7n1eB3XOgkw8sEs8Tt/pr/XxSB9FM23SsgFl+ZJKOle1SimPFjoqOrrM5wBzCWYuCIcE9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rsxl1NDw; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rsxl1NDw"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3fa6c54cc1aso836296b6e.1;
        Thu, 29 May 2025 13:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748550509; x=1749155309; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BDV8YPVZzgaow0FzJSxMsoVpPwzC55w9udNCWUvGvzo=;
        b=Rsxl1NDwM+PMVQijclVa9dnZe7XdpjD56tygFDKFCfkJnqSKoq/FE6fAc8mFBLdsIh
         b7A3lbezi+gDapR/K2GhB2ml+O3i1ld/yre852+TtEMe/G2YuPfL6yQBxR7MbQSST+kH
         sw0e2sDbTV/BcPqW2YwXwyY0d4uXRMuxRUN/bQ1/16MsF3E9fQwKvV+XuidNW0XSNm1q
         BDtt7ogad+LFJKsC9hIY4f7LXyRt+2DCRdpaBOcBYs2WU0XDIXQHcbMQeFPGwI3kPMd5
         rApW5m0BK5vdw7U5NF7fsI6PKVd63I/upsPrnpbSfCJJKN/y+Ddr5jKyGiTTTU31gc1+
         M0WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748550509; x=1749155309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BDV8YPVZzgaow0FzJSxMsoVpPwzC55w9udNCWUvGvzo=;
        b=qgwpJGB+ICk7yv0G2ps8cEBfVpVBfek7x4XOI2g2zh+r/rzsXrC3oa69U75j6Z1Zvf
         UM2vtphw6cf//cTQEmFUUMQmIewvVqIgKiIW/KDKql90ncp4cRdgLRClUGc7R/dPACQn
         Ws7MVcMbP6AuVQ8zyOxgHldm+mPfV2TAjvTCzQrhrcpHYYWUbhs3vz0qCSulvf9nXZwt
         F4x1mYwNMvGiuXfO4D84c9aQh41a4rDOi3gOtHVsecoiadescCQmxaDM9fLLuuNC8lml
         PmcgnGNzW3dGyLJXADa77YWof5CNTwmSk1uGNZyZmpDFcuy7zo+Rp1yUGEEXajqea/pd
         nyoQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7q5g2D3K37D6nPrS+Bg+on7Xgadw8Jta2NOUwvtX2zZFWVXo21rlvQktS7kX65lSV0tW+3E0muFhF9dMyvw0vVn2Y@vger.kernel.org
X-Gm-Message-State: AOJu0YzFK1wjESyTcc/ErcpINWBWEP0E/V/RERwJKFPuEjPv4MrEty/i
	4/RSlPvAjPs28XqNcTCjPgjc/+tTj+kzNOECdfsZrjyFu26CRT/LgkHmG7e8Ew==
X-Gm-Gg: ASbGncv/POpGtw7GhYaJHB+j0pCjqsIqJJP/ayflxd/mJwfCi1iu2kMvvXfWWJ4jtk7
	RjCwLTTvAcb0r2NN+UrzfUXnpNNCdm1Si/HB1B76Rmrg+98jlBQpTORlxWF15TG1v/CIeqLFZjb
	6lSuB/NgRMRjULJoP0hwDpp/Zvg1sOw3bKB4BIEqgsHAReYo7N8JBbw0rFcn7bgxvuu3GSRrNJv
	beOVb3JY87HQ0bBrwn3fn39++oSCKYnDa/dEwwbCqSp8b+g2kRJkingm0MxBMRvuTWwW5EwLArQ
	au/tNbgozoLD7Cy9Chg1VXoHL3qLyo9+XX2ZvsilnNOzcuzTIeoyZxo9dXavsVeHaEMkPIrVaAR
	KAf/XVQpcULqRcwZ78Q==
X-Google-Smtp-Source: AGHT+IH//Qn/Q627LmwtBoWMKKkwlc3ijdvxdDynb8jiZUe/1S98AeHj8C12hAeT75okkBa5b2tO2w==
X-Received: by 2002:a05:6808:6a94:b0:404:e0b3:12f with SMTP id 5614622812f47-40679630b29mr637179b6e.11.1748550508695;
        Thu, 29 May 2025 13:28:28 -0700 (PDT)
Received: from localhost.localdomain.adc.delllabs.net ([143.166.81.254])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40678bf36e7sm129240b6e.1.2025.05.29.13.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 13:28:28 -0700 (PDT)
From: Stuart Hayes <stuart.w.hayes@gmail.com>
To: linux-kernel@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org
Cc: Stuart Hayes <stuart.w.hayes@gmail.com>
Subject: [PATCH v3 3/4] platform/x86: dell_rbu: Stop overwriting data buffer
Date: Thu, 29 May 2025 15:27:57 -0500
Message-ID: <20250529202758.8440-4-stuart.w.hayes@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250529202758.8440-1-stuart.w.hayes@gmail.com>
References: <20250529202758.8440-1-stuart.w.hayes@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The dell_rbu driver will use memset() to clear the data held by each
packet when it is no longer needed (when the driver is unloaded, the
packet size is changed, etc).

The amount of memory that is cleared (before this patch) is the normal
packet size. However, the last packet in the list may be smaller.

Fix this to only clear the memory actually used by each packet, to prevent
it from writing past the end of data buffer.

Signed-off-by: Stuart Hayes <stuart.w.hayes@gmail.com>
---
 drivers/platform/x86/dell/dell_rbu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dell/dell_rbu.c b/drivers/platform/x86/dell/dell_rbu.c
index c03d4d55fcc1..7d5b26735a20 100644
--- a/drivers/platform/x86/dell/dell_rbu.c
+++ b/drivers/platform/x86/dell/dell_rbu.c
@@ -322,7 +322,7 @@ static void packet_empty_list(void)
 		 * zero out the RBU packet memory before freeing
 		 * to make sure there are no stale RBU packets left in memory
 		 */
-		memset(newpacket->data, 0, rbu_data.packetsize);
+		memset(newpacket->data, 0, newpacket->length);
 		set_memory_wb((unsigned long)newpacket->data,
 			1 << newpacket->ordernum);
 		free_pages((unsigned long) newpacket->data,
-- 
2.47.1

