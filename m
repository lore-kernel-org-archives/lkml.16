Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAEE22571D6
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 22:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744150857; cv=none; b=J+K3WemfFKwPZjtP9NFA1cN/asBI+wN8EXf8/7ZCQfmmw7Y/E3MnLh9rPP6cwgIJbCAZ57iGRvPFmy5pistiZGMCXazr+XzjCYFMy7UhtUHdDwlVDVQKBpfS5INNTzw9XupJKv9Cpg8k/xAQ6iyoX1FqjJqldlZTZ3Bb2PHmg2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744150857; c=relaxed/simple;
	bh=SiVbOWZe/96Umw9JJTP6IhACNDyTr4xaMMduXTYLSCE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RnmEDJUApq8AB8dtdmJA6hA0X5yAk+hafltnJnDGfY4MMKd9R06QxrLHz1ibgzY014DqjZC5nQBn10ZnLzSIs+0oaVpO6Oggr2+81ZtCYhFUB/BI4vF4uWTGAs4xq6g1SkzCUTXCex/k/MeZ4/l6+I8yPCqlxKJEEFikLxGOumQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=DmEdCdhn; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="DmEdCdhn"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-af5a4cd980dso4357336a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 15:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744150855; x=1744755655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ERsZ7LaPH9EF0px3KCn5mDa4zdfj5RpKAWp42LkC4Dk=;
        b=DmEdCdhnQ0ZRTRoi1n9NA9KfdvU+FsKzmqr2YB+TxVOU6bE8SaVMfted8HR9wIFHqd
         Km6Yv8ltrwn/YUq+E23gitgH+Yd7S28jna3YRZtFqn17oRtN1FXiOBgH3Dl7AlEWb2rz
         KB1OYsqk01imqFj0RZmmkuv1CUxvoN8qQnoZd4dUVOJRJv9rD+ZWnj6mrMxMMqeu9bP0
         r4gFwM2582mEpGY8woBg8+QeKuteGG2FjBXt6rrW9NfYGMGtKJJKLaaN+T3nD5UkbT1e
         sYJlyl3IZO/pFk4P6XFJtTnujjcFSzVlx22dLpEVwGF/7dhhsbyw3QvJCBZd0gBrqbbs
         UUyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744150855; x=1744755655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ERsZ7LaPH9EF0px3KCn5mDa4zdfj5RpKAWp42LkC4Dk=;
        b=nmM2Ef8SG7nWTotgKgpIqkqWoalQfgy5UEMY8uS59b9M8gZ6dZjeLHCrNRWEXi4Lm2
         QqIj/5titTQ5yLyteH7JBUCzLoQH1nqqf1tgVG9YvvGFjrwh5L4GmypoIG+pmlaGNIB7
         lLDHpFVHxTEprcs3rLW1mpcAgUTfBEEYUm3d+LL7dIaXjIbfpFJElQMdD7C1n1F7NPCP
         1+ce8cBVyetRYLU99VKwBSIfXp84PbRk16jVyHLUsD9CA0BgcproRe21yIsw+K4ORNfv
         VSxfaQLR6MaJryrVha1UksaXtSlu1MYHZKUcZjFifrhJ/iz1WcmdUKFCMFO+9S3FKkD3
         g+FQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAMaEdhTmh9foSDqhTloZDLBtKBdwIYM9MYNduhm8tZfJBp8MsUHMYmhFBVTsp3CLTHO6i9L3qykdD6J0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDo52/dy/Xvd1p1aM9hE3cknZdfuKVWDcE5fjLYlK1rFy9YjHo
	4PB+ZxXIC/QHs9Fa92ptLXhXr3+7PmOa3CMBXhYBMV8bz+8oQNVX1/EyItqlOw==
X-Gm-Gg: ASbGnctcEY1c30Gc4wiAM7kojeKr3dN690HRj1uMPjZqrLBE4BFIkvWO5uyvyi2PVii
	9ZDl9ylDMkmrTANfVP5yrhW0nyKZ1K0HEulsbXM3PR77C1cGyrszWPC2xhRF08LZPgTRlKvyUwl
	EdM0vlX+8sh0igwIQZHcnRTgPT87slXAo9z3Ipzw7G6kmTk76+xrDlMIEONcVA/HWo2Jypzj9Mx
	w19XHBGVN6wMeIQAxNFdCq01KrdlFHsIFEZVWV9zsRC5t58ERGtzVKbJZ61Li1gXDn1CFijskeF
	CfwRlPHzDZfDAfScoMhnjutxpdt2V4RKM2bxNGGw0ZAU5gASLKOG2KIsMGayUp6aRnmOkfLN812
	fP/F5NrsE9kqNknbwzZs1
X-Google-Smtp-Source: AGHT+IENWxG8nUy5YKs94+WWP546/fjQ0DvxUsIJil5vbvQG4ajvr61NBzhqFV0rmLwmouYIT48Y9w==
X-Received: by 2002:a17:902:f644:b0:224:c46:d167 with SMTP id d9443c01a7336-22ac29a7d25mr12909955ad.16.1744150855114;
        Tue, 08 Apr 2025 15:20:55 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785ad7fcsm106309705ad.4.2025.04.08.15.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:20:54 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 09/14] staging: gpib: tnt4882: lines exceeded 100 columns
Date: Tue,  8 Apr 2025 22:20:35 +0000
Message-ID: <20250408222040.186881-10-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408222040.186881-1-matchstick@neverthere.org>
References: <20250408222040.186881-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adhere to Linux kernel coding style.

CHECK: line length exceeds 100 columns

Reported by checkpatch

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/tnt4882/tnt4882_gpib.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/gpib/tnt4882/tnt4882_gpib.c b/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
index caf53f8ded2e..3b29f541fd49 100644
--- a/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
+++ b/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
@@ -539,8 +539,8 @@ static int generic_write(struct gpib_board *board, uint8_t *buffer, size_t lengt
 	return retval;
 }
 
-static int tnt4882_accel_write(struct gpib_board *board, uint8_t *buffer, size_t length, int send_eoi,
-			       size_t *bytes_written)
+static int tnt4882_accel_write(struct gpib_board *board, uint8_t *buffer,
+			       size_t length, int send_eoi, size_t *bytes_written)
 {
 	return generic_write(board, buffer, length, send_eoi, 0, bytes_written);
 }
-- 
2.43.0

