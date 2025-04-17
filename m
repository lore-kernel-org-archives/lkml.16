Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866C7225A47
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 09:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744881068; cv=none; b=VmsG0l1KlixWNvcUoYkqqumUb213Z838bClSOZPWxt59lT/pw2BYMsF/HiUMQ4xQlM+gbXKJOyfd9wypzan6vJSFvoJOn+X0/Z2ERmEmh3zuSv6+0/CcC1PDuBsM9NFVplhyajJ3ws9IFDKoKiPOBVW67yDWyzUGZUqYfYg8dZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744881068; c=relaxed/simple;
	bh=6qEf6tknothqnZPYROJE0lwlLRqhlJZGju5uXaeHv3s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FJoo+Lh2vZR3sG00IVSYbcn60dq+qIC/sewKty2eqKASZoa5poJvB4emS1RuIMiisSVDEb5s+e0WN/xlSPifAyMry5tP11j2QIy8fxneCiyKZShCRpA+APmfrCEkHeyiVSAJcJpAH/fPASOyqje5rVJ0MRpacyKLLHyJKWyiq3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mk9YljVP; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mk9YljVP"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b061a775ac3so443914a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 02:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744881065; x=1745485865; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FrdRs2Eh7ktuYmlRKgxrpPSv2pa5H5A5RLvNhTrGAUw=;
        b=mk9YljVPp7/VFybMWJKQ+ccGDVrNow3J6oaKEwBDAnWlvr4yvW3n0olRgcIqHxhNeC
         XPDvVKNLke+BO2n5vGOf7XmfiB0VbKI/E/Z2SAvnHEYrNmOvRkL9YN+kV7OGg+U/ehxh
         U93qet8vIYE1trh14qoAp48vokunPg6rZi5PYCzSF5txa77rJltyvZFQpFmBymFYaFkh
         ySemubGj0UVAtsuieBu9UploDy/TzFo7jf0rxqqBYBq9R0UdUBeH/G+nLwon3bEuN1nL
         sMR65JNj1eaysokNDA+oL/Rxal6hY735UtjUoLkKmvRlNPdAokmXKM3/wdP0ujVRFlS9
         I9wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744881065; x=1745485865;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FrdRs2Eh7ktuYmlRKgxrpPSv2pa5H5A5RLvNhTrGAUw=;
        b=gD2eSl639IjpEQwl4G7b+/pVHoXCoX2TNR+5JIi5mWqSUQDhPmAfNHXMi2j5b5BDnM
         pDad1wKBjw+LtrIInt2El/yJjjWxwv9klYluhOGY48conbvucwIWfcAqVF1U/GoO1whK
         T75b4o/KzeOAzkeWYH/729fyRRGoXPVjVPmRERKOBbxWuRwgTrcGPeOxvAsxQ29eST7o
         f4raQGatBTFCwO+jPtmXtdiPgBtOHybvhEbjIwC1ejtF9odduU2YAPWKwQe5P74a6yZC
         Q2IOVNnIgo5yw6h3USFAY63/abTFGL84qt1eyQWN1serIcCtUoAdShYLRGwp/eIhOmCH
         aM8Q==
X-Gm-Message-State: AOJu0YxIsJJc51I647hYw/T0jve69MxDwlnFrpPAavLsPZeh+ckmPP6x
	LQoewXL2uJwAM6MVEHujfF+t/ZX75yA3izc0GAWtlcRBfdNdkbK4
X-Gm-Gg: ASbGncvzS9WRosiF+Ar/MT1w+vU3vTGIFRZY30DH0u9zWlEeUtfirOMtnTIo/1BEbrE
	k8RrrEjFVQDh7A1/ca1PHHISerljfsGKGp119+A7Q7cYlYS+MGHrN5q2f6KEn0IB6+E9XyfvvRB
	R15ReWKq2iriul72fzJ1UtujZ0gLW3nvzVgN7CYkmvCBZ1psyCSuLu6enDpiIkHMb2MEXJm9n0k
	/M6HJ81pMTDFWZbpx+A9qWT+medO8F3kRyGo55zafyQs0cIVTY1Wb3I/wd/tbS7wkAmsVDzHueD
	M3jSXpBjxDvUZiYKKA2zbzLa7izz9BGHWmaqrO76YTiC45Gmi/6+94N5dU7fyA3OV2Vif1s=
X-Google-Smtp-Source: AGHT+IG5eS9uYvfmaM+p8MiDaKbdVNNX9evxXDH5dXvK+7En0/2gb54c8hs7hbHHJ5/VfXabTYoeIA==
X-Received: by 2002:a17:90b:1cc4:b0:2ff:6a5f:9b39 with SMTP id 98e67ed59e1d1-30863f2f777mr8488935a91.18.1744881064670;
        Thu, 17 Apr 2025 02:11:04 -0700 (PDT)
Received: from purva-IdeaPad-Gaming-3-15IHU6.. ([14.139.108.62])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3086122a8absm3131134a91.35.2025.04.17.02.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 02:11:04 -0700 (PDT)
From: Purva Yeshi <purvayeshi550@gmail.com>
To: arnd@arndb.de,
	gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	Purva Yeshi <purvayeshi550@gmail.com>
Subject: [PATCH v2] char: mwave: smapi: Fix signedness of SmapiOK variable
Date: Thu, 17 Apr 2025 14:40:18 +0530
Message-Id: <20250417091018.29767-1-purvayeshi550@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Smatch warning:
drivers/char/mwave/smapi.c:69 smapi_request() warn:
assigning (-5) to unsigned variable 'usSmapiOK'

Fix Smatch warning caused by assigning -EIO to an unsigned short.

Smatch detected a warning due to assigning -EIO (a negative value) to an
unsigned short variable, causing a type mismatch and potential issues.

In v1, the type was changed to short, which resolved the warning, but
retained the misleading "us" prefix in the variable name.

In v2, update the type to s16 and rename the variable to SmapiOK,
removing the "us" (unsigned short) prefix as per Greg KH suggestion.

This change ensures type correctness, avoids confusion, and improves
overall code readability.

Signed-off-by: Purva Yeshi <purvayeshi550@gmail.com>
---
V1 - https://lore.kernel.org/all/20250409211929.213360-1-purvayeshi550@gmail.com/
V2 - Use s16 type and rename variable to remove misleading "us" prefix.

 drivers/char/mwave/smapi.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/char/mwave/smapi.c b/drivers/char/mwave/smapi.c
index f8d79d393b69..65bc7e1ea6cf 100644
--- a/drivers/char/mwave/smapi.c
+++ b/drivers/char/mwave/smapi.c
@@ -66,7 +66,7 @@ static int smapi_request(unsigned short inBX, unsigned short inCX,
 	unsigned short myoutDX = 5, *pmyoutDX = &myoutDX;
 	unsigned short myoutDI = 6, *pmyoutDI = &myoutDI;
 	unsigned short myoutSI = 7, *pmyoutSI = &myoutSI;
-	unsigned short usSmapiOK = -EIO, *pusSmapiOK = &usSmapiOK;
+	s16 SmapiOK = -EIO, *pSmapiOK = &SmapiOK;
 	unsigned int inBXCX = (inBX << 16) | inCX;
 	unsigned int inDISI = (inDI << 16) | inSI;
 	int retval = 0;
@@ -102,15 +102,15 @@ static int smapi_request(unsigned short inBX, unsigned short inCX,
 			    "=m"(*(unsigned short *) pmyoutDX),
 			    "=m"(*(unsigned short *) pmyoutDI),
 			    "=m"(*(unsigned short *) pmyoutSI),
-			    "=m"(*(unsigned short *) pusSmapiOK)
+			    "=m"(*(unsigned short *) pSmapiOK)
 			    :"m"(inBXCX), "m"(inDISI), "m"(g_usSmapiPort)
 			    :"%eax", "%ebx", "%ecx", "%edx", "%edi",
 			    "%esi");
 
 	PRINTK_8(TRACE_SMAPI,
-		"myoutAX %x myoutBX %x myoutCX %x myoutDX %x myoutDI %x myoutSI %x usSmapiOK %x\n",
+		"myoutAX %x myoutBX %x myoutCX %x myoutDX %x myoutDI %x myoutSI %x SmapiOK %x\n",
 		myoutAX, myoutBX, myoutCX, myoutDX, myoutDI, myoutSI,
-		usSmapiOK);
+		SmapiOK);
 	*outAX = myoutAX;
 	*outBX = myoutBX;
 	*outCX = myoutCX;
@@ -118,7 +118,7 @@ static int smapi_request(unsigned short inBX, unsigned short inCX,
 	*outDI = myoutDI;
 	*outSI = myoutSI;
 
-	retval = (usSmapiOK == 1) ? 0 : -EIO;
+	retval = (SmapiOK == 1) ? 0 : -EIO;
 	PRINTK_2(TRACE_SMAPI, "smapi::smapi_request exit retval %x\n", retval);
 	return retval;
 }
-- 
2.34.1

