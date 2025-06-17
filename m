Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 140BD15C140
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 21:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750194312; cv=none; b=hA2bQ+Hf1WQ3n6x6WQ1UZEK+oCSYOxr3guq2fbdhOH+RQRCKvc4WvrL1gCIci3jXJsmEdQo1K4UrTm3C0JWgMevT0FUKQ6mcJZmq9LrcJYm3WbdZYAW65xfofPI8apXnk98GvjKMrtFwKxbK+DhkA20T6pWo6to2WA6qZmzdaWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750194312; c=relaxed/simple;
	bh=z6As7b7u4dNJN+RFdc4kRkY6FNbad6JDPqBp4UFHYF4=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=NoCqXR1zWCYEW2QMC2cP3CxD/msNzhNGMVqSvoOznPKtwvanu5kx/Rsfau+yrsdcGaH4xa1Y6vLzCDHRQalF9+4zyB5V/RFXLa9T3Sad8846Voq2FQm2gNV6hSz8OMTW/YUpdRDxpPQ0Y392GD4P8uBAvxzMKgQuGIcp3UiDw1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--frankramirez.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1vyk0DZV; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--frankramirez.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1vyk0DZV"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-23632fd6248so56094045ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 14:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750194310; x=1750799110; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RT/4G+d3RfQXn0+3N/5uepvdPWq1t3QwRhcHYgh4JDs=;
        b=1vyk0DZVZtYfEGAs8yVJnexsyZS0l1zZW5tvzQcX1gR5iQQOauoTamOQ5MyxyrID9x
         LXZyZ0neQ6ZNW+J/ROcyywdNaP8aCHL8MlB17V1fI4hXtP1K1yRrEheYgTkQZb6JcAZh
         TUuRrvZlfdPxpBUZ6pEioA3VEQK+OS91PED94VQBZ2sVa+3qKXIjTWs3deYpilMH2CKo
         WjSgb1wfGPQbueDa9kha7Qax6mZV1sUT1pChHQmjoCFS+qrSho3wYvYpOUVEBdSrNVFu
         xzAzhmQkayMqA3Bc4m92irGB2/5HlFBWeG31LMhs82ecZNixPESETz4Rk+OJs64UgHBl
         yQ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750194310; x=1750799110;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RT/4G+d3RfQXn0+3N/5uepvdPWq1t3QwRhcHYgh4JDs=;
        b=C88odMJvfCny+39p2S3A5FpF6lSJefOfg//aAkwHmBz2eduUTdIFssH6uJht1Il3FO
         slU7vaUsX7UxJ/niygC7PO0oqkgCLAdwpTdZGkh6mi3tRY/z5sPyREhZmKRlHREPEqPo
         Wk8JKNO01ZCkpEZ7fY51ZXyo65/P859gy91rL5Q/JNqE98nuki9kSjjm9zcRZGwqB/9R
         lZH4gzsDfxyRNxctkDVXRLZsdTKqJMpfTuOj8odX/MDy7NSjndbNoJsqQBzjMRsxHPPj
         PClZLhK8Fzolq2FnEv0cZ+fnSb5tVQMl5gvJ+5qtJaSknuqfHsrEaXCwpVjWXlXPVluJ
         yMaA==
X-Forwarded-Encrypted: i=1; AJvYcCXu+QxWPxdavICUY25t6LI6GrQulT13A7ybVdpjs8bSdWrUCXcXimVSzhX3ZMQXokr1kkqyfJe9eAe2FfM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyX9xb6OE62CGByhPY8ylO2fPxHmGU+6t6LzqAMEsoJwePazkQ5
	iVS9cSorzEIp+4hKbFpXpbI9y8IXuOc3q4fYm0r6tDfdMkByeW+oWEb7wJkysYxuP5RavF6VaiR
	i+lWiysYLwhYhQYxtOV59bVms+e6K1w==
X-Google-Smtp-Source: AGHT+IHwTb+uzPjoYirGoN97S9QWNgf/j0GBXFgirky6u+kL8qRWr7c7rA1quvr+NJg+QHNBw4iPGY34zNToFLzov2M=
X-Received: from pgcv23.prod.google.com ([2002:a05:6a02:5317:b0:b2d:aac5:e874])
 (user=frankramirez job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:f8d:b0:235:225d:3083 with SMTP id d9443c01a7336-2366b32e499mr174900755ad.6.1750194310417;
 Tue, 17 Jun 2025 14:05:10 -0700 (PDT)
Date: Tue, 17 Jun 2025 21:04:43 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.rc2.696.g1fc2a0284f-goog
Message-ID: <20250617210443.989058-1-frankramirez@google.com>
Subject: [PATCH] scsi: pm80xx: Free allocated tags after failure
From: Francisco Gutierrez <frankramirez@google.com>
To: Jack Wang <jinpu.wang@cloud.ionos.com>, 
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Francisco Gutierrez <frankramirez@google.com>
Content-Type: text/plain; charset="UTF-8"

This change frees resources after an error is detected.

Signed-off-by: Francisco Gutierrez <frankramirez@google.com>
---
 drivers/scsi/pm8001/pm80xx_hwi.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/pm8001/pm80xx_hwi.c b/drivers/scsi/pm8001/pm80xx_hwi.c
index 5b373c53c0369..c4074f062d931 100644
--- a/drivers/scsi/pm8001/pm80xx_hwi.c
+++ b/drivers/scsi/pm8001/pm80xx_hwi.c
@@ -4677,8 +4677,12 @@ pm80xx_chip_phy_start_req(struct pm8001_hba_info *pm8001_ha, u8 phy_id)
 		&pm8001_ha->phy[phy_id].dev_sas_addr, SAS_ADDR_SIZE);
 	payload.sas_identify.phy_id = phy_id;
 
-	return pm8001_mpi_build_cmd(pm8001_ha, 0, opcode, &payload,
+	ret = pm8001_mpi_build_cmd(pm8001_ha, 0, opcode, &payload,
 				    sizeof(payload), 0);
+	if (ret < 0)
+		pm8001_tag_free(pm8001_ha, tag);
+
+	return ret;
 }
 
 /**
@@ -4704,8 +4708,12 @@ static int pm80xx_chip_phy_stop_req(struct pm8001_hba_info *pm8001_ha,
 	payload.tag = cpu_to_le32(tag);
 	payload.phy_id = cpu_to_le32(phy_id);
 
-	return pm8001_mpi_build_cmd(pm8001_ha, 0, opcode, &payload,
+	ret = pm8001_mpi_build_cmd(pm8001_ha, 0, opcode, &payload,
 				    sizeof(payload), 0);
+	if (ret < 0)
+		pm8001_tag_free(pm8001_ha, tag);
+
+	return ret;
 }
 
 /*
-- 
2.50.0.rc2.696.g1fc2a0284f-goog

