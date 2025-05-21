Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE6325F970
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 10:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747824172; cv=none; b=OlCnzCVWGf2OdR7bTZYqIqGCdKv3TijZXfhmDOGCD0p8RUjskNLBsQr1SDMWxTSKSKEmaDZPHZjnmwK5ZOdaxlipz/D72w7pME/OrljDpHvWyRBXGqvHY195WvWPP7+B3vp6hDhvYZqNLpCDLplEa7VpPeytIjgaWIYWeNtD9+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747824172; c=relaxed/simple;
	bh=wGyIUm+P3GZiMLXsE/m58bNrfKOx2BMNS++wJhUhIX8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k4ezSSdbvVY/fKtqk2tKJjwdImUYbhIn7mvn2lbkPphKJSigElJeAQP5awaLhyyRL8r2GhwgXZjtOVl9jbVQpITHZCPrcrIrpZDuf0tkUKAEmF89tfk0CSIjtbyyUurXVNFtvjV0CuCYnKXrtt5K1fS7TdxbTfGQlPP0ts4/ieQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PFkYFlRu; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PFkYFlRu"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-70ccf9a4ab3so34684097b3.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 03:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747824170; x=1748428970; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GMDMg0oZJHBeEHyo9DXsYD1Zb05NAR0JOCkGcjty1VE=;
        b=PFkYFlRutskDV+a9Mr5+4NGt4y6OzFvYM0NGmIKILDwaDB6oeATbKTzSo9bsHwCaCU
         tSXg1HrLfaFACujbN4hMDdLnzPdIq9HKYvz7TWLWsRWIwM0fd1M4CWfjfBDYjt6/RmrC
         Ptzg6Sp5qT52GWakkwv/wg3ZCt6GT2KLYLX3O1TP8hA4MLq3ks4jxZqOZiZJDL+UWxhb
         /fXWmpMSnGUXnzEc0erWp03bBIzZmqt8pbOPSJJY7AfMXdpKH+BJq8T7S972nGh8QR+3
         fVv93aYZln1EDaQkGV/hSo4JkW9+ho5fp+kPcts4lnhEg2ScEYUT8SrIdIFZ9Vrk3dhz
         oWaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747824170; x=1748428970;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GMDMg0oZJHBeEHyo9DXsYD1Zb05NAR0JOCkGcjty1VE=;
        b=YPLqEuSg3JVJaJIRKujWmYwLCtn6oz7olU8VQ9DHbEk4BwuAlT6vpSXZwnD1PM+4Gv
         Dg54ku51O0O7EmU5+st4BMEtAKppIwRrhbBr+Djun8S+iDWyl9vJsZTw5z5NLoFiIzu9
         LL8DswfwLmEByUDtRc1sD/1HSlGsSr97YO6UmcMVSs3BmU2FUEVTSwqghSrPCrJHmoRe
         +gdTBJGHRxJYkjc5PusnI7CRYpTi0Sv+ZLGq+dgtlvG9qHPdGuUV6CmNaprLGUT08dvx
         LmDlz4eu9lSWq8fqrE+J0GY/r9hPtgvX31W1oi0PaAHjWK37nc5Okmagi57R3vCAavrv
         sOPw==
X-Forwarded-Encrypted: i=1; AJvYcCW6O9dXNjR6CBkkoPSumAuIGlvNidTZvZnP7tT/ZU2Umtrhp9fdvMHGCnVEmzyrVNgDg4L/4Bjz0cKwbOo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw7g/gx+lUNL1EW4s2QsR294/IzB41qlB///qNVICsjUVPjrs7
	IYsgmeiTOXyHdPf9yT8tz1uPsCTpqbsqHiAsgGu4OFYCT7J5r3ZvjQ6tPt8+JTYn1SHzacqByTE
	cTLHrw8xE5JqRWSZBJOWqXH2z9TogQD0=
X-Gm-Gg: ASbGncssrBPsLpRw2dnTbPwvaia4d5lipBhWVfantxtaYWk5ZONyH8lQSdlXR5hAuTy
	25TEEn5rU9X26KJEoNK9uQRYD9q7yfJmUD462GnaGVqBe50H1Untw8l5RuiU6GdY3wsUxEsDAGS
	7fcDt+isCTVkiCD5+Zc4eNhVVQs6pqng+m7cAb3ovvHUrVkQZG7brz9Cl75KA8LrSm6ME=
X-Google-Smtp-Source: AGHT+IGCEa6kyM+UnftuFUzah/9Z4wSrRBAisibwNFh6VGxUeQAiBYOU1NwOn7d/SKAB67K4LUagn1THRgns4aXCGHE=
X-Received: by 2002:a05:690c:4b8a:b0:703:b278:db3b with SMTP id
 00721157ae682-70cab0b8d50mr279505107b3.30.1747824169667; Wed, 21 May 2025
 03:42:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aC2dO1QKTVMOJQ8K@brak3r-Ubuntu>
In-Reply-To: <aC2dO1QKTVMOJQ8K@brak3r-Ubuntu>
From: Rujra Bhatt <braker.noob.kernel@gmail.com>
Date: Wed, 21 May 2025 16:12:38 +0530
X-Gm-Features: AX0GCFupvQaAcKzkZjV_NSmznrI_u7c1AU4u8-h7t66D4WJTaKE4h_CycWF4fN8
Message-ID: <CAG+54DYR0CyAKWcgU=mV9ooeyGVrouxrKOv7kzCKTYaf3+9Yyw@mail.gmail.com>
Subject: Fwd: [PATCH V1] staging : greybus : Documentation : firmware :
 Replace deprecated strncpy() with strscpy()
To: Johan Hovold <johan@kernel.org>, elder@kernel.org, 
	Greg KH <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

This is the new Patch for the earlier Patch hence made V1.

[Note: there will be no significant changes.]

Changes:

To ensure that the firmware tag is properly null-terminated. When
copying firmware tag strings to prevent buffer overflows and ensure
data integrity.


Changes has been made in 3 positions:
1: update firmware tag
2: backend update firmware tag
3: backend update firmware tag with unipro

Signed-off-by: Rujra Bhatt <braker.noob.kernel@gmail.com>
---
 drivers/staging/greybus/Documentation/firmware/firmware.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/greybus/Documentation/firmware/firmware.c
b/drivers/staging/greybus/Documentation/firmware/firmware.c
index 765d69faa..f37904b91 100644
--- a/drivers/staging/greybus/Documentation/firmware/firmware.c
+++ b/drivers/staging/greybus/Documentation/firmware/firmware.c
@@ -63,7 +63,7 @@ static int update_intf_firmware(int fd)
        intf_load.major = 0;
        intf_load.minor = 0;

-       strncpy((char *)&intf_load.firmware_tag, firmware_tag,
+       strscpy((char *)&intf_load.firmware_tag, firmware_tag,
                GB_FIRMWARE_U_TAG_MAX_SIZE);

        ret = ioctl(fd, FW_MGMT_IOC_INTF_LOAD_AND_VALIDATE, &intf_load);
@@ -101,7 +101,7 @@ static int update_backend_firmware(int fd)
        /* Get Backend Firmware Version */
        printf("Getting Backend Firmware Version\n");

-       strncpy((char *)&backend_fw_info.firmware_tag, firmware_tag,
+       strscpy((char *)&backend_fw_info.firmware_tag, firmware_tag,
                GB_FIRMWARE_U_TAG_MAX_SIZE);

 retry_fw_version:
@@ -129,7 +129,7 @@ static int update_backend_firmware(int fd)
        /* Try Backend Firmware Update over Unipro */
        printf("Updating Backend Firmware\n");

-       strncpy((char *)&backend_update.firmware_tag, firmware_tag,
+       strscpy((char *)&backend_update.firmware_tag, firmware_tag,
                GB_FIRMWARE_U_TAG_MAX_SIZE);

 retry_fw_update:
--
2.43.0




Addressed the "The canonical patch format" .

thank you,
regards,
Rujra Bhatt
