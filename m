Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97AE126AD9
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 23:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750548504; cv=none; b=tmwaiQSrdH5GgsBk1OopZ8FidM76uwJaLiWg9F0hP22roMMUFPruLyp7lhAd45bQ+7FF8DXOqbkgSigWr2/iLbECVRd67XUGmkvY1+ShPNmuWB7w6K1chFEe2sZgeFvZE0O18G3QfcWZkOBVXciZCqtJOk1PUce1CBbLlDB7qJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750548504; c=relaxed/simple;
	bh=1BMO7zCwVyq4cR5IMkJTR++wTf13wr3BBfUK/5fXB4I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AwPNwsA1ZnjbUIQDX7TVwdBQnYED/UAVNlrOlvLPPFm2Q2WrIEgMiVl9uwY84iu5NLzt+HE0PEe2nfAmeIZztFV9uHWRffRIq/NuX6FkN2n+yjDt7FuXd7vX2OD/rtvmUkPgU+f/uODG8mHTCDuMKYBZgPdlq8oScDqpjl1Qr0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GcEvQ2Xh; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GcEvQ2Xh"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-235a3dd4f0dso19928485ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 16:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750548502; x=1751153302; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C2fYTarwPpK0jvqPcWLAS7PDSZaF6F/fUngXjtT3TiI=;
        b=GcEvQ2XhVWmZrqWuMqwUezQxiFmelEgfgjHlsrsvYwxOqzgD2BwTwaAAJrLxBmvbSn
         qQT+qRA2cloP5x5NPdNi5EwD6lcemJVDOhMjLeP6SoL9BE//XcTWvIFK55uymX4FmRXE
         14xg4NNwocCClhRdf639suYQEwI0Z3Mj0sra4+hJum7BvHSaGBQRMv0hI+/ZppNYMGSd
         /yrNxlfvd//oVvI0ejLvcw9fvgrO4T1X6kqrKYAF/bt1W8eXZDZTXrXOdg6zbP+0Xfsy
         tUhiMiROnsml7n8f+p6kyUyVJbUSMZ1VK+M4oDNNAclB+50hsbonNOLzZUWqyspJfr7d
         HEZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750548502; x=1751153302;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C2fYTarwPpK0jvqPcWLAS7PDSZaF6F/fUngXjtT3TiI=;
        b=O2JOTgV5H7zIu4gCkBhLXHfxunwEIz4xrgGzdCEqirMWjA/8uI7IjQnEYPoTl57ZUM
         noXnmrmYpxZzZUEjXD7NVwmennvvPXrj97To6aKGrijjl5m5TELfgwfMhN5ah5Wdqenj
         6Ljli2PQlpcsNT8N+he4v7qclky8Fqhy4gZ5Frr5f7PFZFPRsCk3rlgFZqtO0niQ7Vg7
         RoYLK7Id8FbUj0FATjZoLD8gkJIU6rvAIQSaL/k/yfNcMYCrUd60JzfjEXyOr7w03Fss
         tqSgJW6mXn7R30Ms5xhqNQX9cwcx7EVDMoFGS/XxWe2+/A+6jjkp+Kmr58Vm1S+i7ebg
         uhAg==
X-Forwarded-Encrypted: i=1; AJvYcCWQP6q/Et4tLQADckd5/n5bLJmLmPls3IXABVgo+lTEVeuw2DwIn40PN/OMtbBlU2ColUj5Rd+uXZNXWsY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvcuSgp7G37sl+0kZCTHMHpAIiTAtV1Tpd+ARG8W7z2G72Ve42
	e/EphGjpBLlWijjH5WDRNbil6DzEujrFWRAfP8uEc7g4bU8COZKFlKKk
X-Gm-Gg: ASbGncsSyhrQsMDZ7pPzD1NQtPPKbNcdvrd1YNeWQphFFvBDRPS9PwY/S6nEPIVE9gA
	CsMZcD1XAT0WhV1iNtQrBu+4f4nfGDJc8cTGuFoub1FhikAoFy24eMNK5nkKLzOJMMj/ATbg6rn
	e7eoQDBFL+wK7dKWTkpj/t5gi1tLwSSWasJr6bOv8Yfld6l/Mu1DG3Bu1QcLZQLQ1hyEQLLQquc
	Joy2x5f8ZSx713SDNjdwEqEpx3GE/7E2ld3D4VGxGX9pMFgOmJhW4VHAbyMW7xBK83vWsMNyhnU
	tju2tNJ+IIqQIvEoXuiU2JYUoCyYwDtVMZE63UyIdEKCkFYYjsKlXbMfDA==
X-Google-Smtp-Source: AGHT+IEl+eni07XId/7tV6K+MIphvOzSUsPaMLYZXBDhuP4KJzfFDhEYMuQ0NPaXMwlhpRtAOiXxCw==
X-Received: by 2002:a17:902:e5d0:b0:234:ba37:87b0 with SMTP id d9443c01a7336-237d9727096mr106392295ad.13.1750548501764;
        Sat, 21 Jun 2025 16:28:21 -0700 (PDT)
Received: from zinc ([182.216.63.93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d8393741sm47867805ad.15.2025.06.21.16.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 16:28:21 -0700 (PDT)
Date: Sun, 22 Jun 2025 08:28:16 +0900
From: Kisub Choe <kisub.choe.0x1@gmail.com>
To: gregkh@linuxfoundation.org, philipp.g.hortmann@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	kisub.choe.0x1@gmail.com
Subject: [PATCH] staging: rtl8723bs: replace msleep(1)
Message-ID: <aFdAEM6GnCudvqMV@zinc>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

changed msleep to usleep_range to

Adhere to Linux kernel coding style.
Reported by checkpatch:

WARNING: msleep < 20ms can sleep for up to 20ms;
see function description of msleep().

Signed-off-by: Kisub Choe <kisub.choe.0x1@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index 6a2583d0d3eb..82e77cd8d80c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -7,6 +7,7 @@
 #include <drv_types.h>
 #include <hal_data.h>
 #include <linux/jiffies.h>
+#include <linux/delay.h>
 
 void _ips_enter(struct adapter *padapter)
 {
@@ -424,7 +425,7 @@ s32 LPS_RF_ON_check(struct adapter *padapter, u32 delay_ms)
 			err = -1;
 			break;
 		}
-		msleep(1);
+		usleep_range(900, 1000);
 	}
 
 	return err;
@@ -581,7 +582,7 @@ void LPS_Leave_check(struct adapter *padapter)
 		if (jiffies_to_msecs(jiffies - start_time) > 100)
 			break;
 
-		msleep(1);
+		usleep_range(900, 1000);
 	}
 }
 
-- 
2.34.1

