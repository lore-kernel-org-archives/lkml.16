Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA8617B50A
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 07:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744529570; cv=none; b=BkLHBt7EjGElvFe9iDZbipXU2/PL1eoK4D0T7ASKKS/CsHJG2foUglwKte2MkDvRR7vtwqTtIJbb7ONXJkb4s2lelsHNwv5iuKExaE7v7xxjaREL8b1Rhb7a/NcaNEw+sh07hj5UchJ3HhLIpCzGvUJrt74Uq5qT4MN/ZT2UxD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744529570; c=relaxed/simple;
	bh=noTGHob0U3nCMmX6ggPvoPttAsBMb3SkzDTyGuKAQlE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e87V0eVXV0ahoZUWBq8QOdNiY5EUhb+5wBGevAQi0c/jwle8nW8G3H48WOla4/k7aNpbYzZ3hYmNM9ipykVMcTu2jf2HOJdoueOJmwck7JyWS/7XGLVJTncjZrosgU5Bnix//0Tziqpg6k14M46FyhJlBRVDJJglCANv7ZzEyK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LopsedH3; arc=none smtp.client-ip=209.85.160.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LopsedH3"
Received: by mail-qt1-f194.google.com with SMTP id d75a77b69052e-476a720e806so29568351cf.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 00:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744529565; x=1745134365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M4007EJtTTw4rTvfv0n1SalSLJtmVlRpzu0mtepvnyg=;
        b=LopsedH35a30uyzfXWWygL6FQiEdVQYFEFjOO1tw393URuMYzm5hlp8QyzWeyizydj
         0+STmmsl3y4iPvkoEvBrbpBL76yl5cLvv4RObtQ16qae73ZtFymJAHiJlHod1NailvpK
         0G7XdPoP7lWP6Klv8E+jeyqTEshdC4jrGzm/6X/Iw2lIGATtduIsU0ATKSx5fJVbx16N
         msdCeZUDbmTi1Vqebdx8s1LOnwSCU26iN2IBnwR8QWw37PME3Cb+c2CD+9eZarcX9ZKa
         3irumX0VLzMtpHeSiKt9douaIEJbKiBIUEYpjjafuOVyuzOe0TmpRy7eIp0kQ2bP/V6g
         zvPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744529565; x=1745134365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M4007EJtTTw4rTvfv0n1SalSLJtmVlRpzu0mtepvnyg=;
        b=uRYEZhMxT25hiQKV/re1Lx0POpLMob5AYpG+BLACIgnoAJDtcZzpBGq92Xxh63kJel
         iABisFuRqnLZ0wJie12G4n6o2KnEYqeRRaO/Ma5hVcLbJqY2TmLbhWKx/TQpIkJR+DuN
         hIYJkLBhRCoJGxMTr4TzlLv6DKoEAHeNNmO+TfQJqVC8bQZBbEaqx6Kvbouj/03YK1+S
         Eo2/od8p16QSLMfdJNPmXgsxKNW6evZsG7tEsX380hGXq9cRFMOf59O9W7LTVWpYO7n4
         KSk0wfjr/LP5t/kkKUetJcSXq8Ts/xCOGE2nmeMDCU+AvX7VwA7GZuYGmUqrGCmJUJXt
         yKJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtt4DiUt6bFXgWWQWPpnVUPeO4ceO4cjLNoZf+3a1wrsp4HXG4rUADOJEAVK0gnD++9AL2IGWNAkmLGbA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2tPKet0P6XSK9anwq33ejJN1nhb5UL4VfnF7Ge67iVSAv3+rN
	b3T1R1Af/wXliaqNXiEnfAzRo8PF2AnCcZNZ8oVWnkoq2uKlQlzt
X-Gm-Gg: ASbGnctgcBL7Ylaz/6lFDcJj4UnKCBqiE7tajuELeua4curhFHYmutcne0WCFSxhf68
	wlOMUGILxXumpWV0n5p5I1iSDEjbDGXMvKIFV1tDhGUoCM0x3S286JJNUclaxJYIemaAT2NlFqW
	8S31ttkfG9WXu4wXO2IqXDNFoi6iOhhMG5fvxUHt4yPHDM24HeMAnwKBSnM1BCcNStjxeMUndsa
	r9UVibZnI732JRhp2E77IbrGZiOruUu3Ox0bODIQl18d1UZagYsocqXgnZQbXV2VNMkVU5F2Qfi
	ANIv1z+PKZE5UcmG9oUVz8H9YPN+dekGiEssXW69xjJdPC7MoOM6QmxX3meWmy9Au0oNudbULUy
	A2vjYyS+g8vt7dwG+QJKKyc4amtn2
X-Google-Smtp-Source: AGHT+IFIabePYRIYtpcxXzaSMqqVPGq5rSARcMVUANBjoA+ZM+7MttbdYWxqjnd1rND1XEHRjhJRxQ==
X-Received: by 2002:a05:622a:352:b0:476:8588:cead with SMTP id d75a77b69052e-47977551ea9mr100615211cf.17.1744529565199;
        Sun, 13 Apr 2025 00:32:45 -0700 (PDT)
Received: from UbuntuDev.. (syn-074-067-077-020.res.spectrum.com. [74.67.77.20])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4796eb0b58csm52142401cf.2.2025.04.13.00.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 00:32:44 -0700 (PDT)
From: Ganesh Kumar Pittala <ganeshkpittala@gmail.com>
To: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	hvaibhav.linux@gmail.com,
	vaibhav.sr@gmail.com,
	mgreer@animalcreek.com,
	rmfrfs@gmail.com,
	pure.logic@nexus-software.ie,
	ganeshkpittala@gmail.com
Subject: [PATCH v2 1/4] staging: greybus: replace deprecated strncpy with strscpy in firmware.c
Date: Sun, 13 Apr 2025 07:32:17 +0000
Message-ID: <20250413073220.15931-2-ganeshkpittala@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250413073220.15931-1-ganeshkpittala@gmail.com>
References: <20250413073220.15931-1-ganeshkpittala@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch replaces the use of the deprecated strncpy() function with
strscpy() in drivers/staging/greybus/Documentation/firmware/firmware.c.

The strscpy() API is the recommended safer alternative that guarantees
NUL-termination and avoids potential buffer overflows, making it more
robust for handling string operations in kernel space.

This change improves code safety and aligns the driver with current
kernel coding practices.

Signed-off-by: Ganesh Kumar Pittala <ganeshkpittala@gmail.com>
---
 drivers/staging/greybus/Documentation/firmware/firmware.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/greybus/Documentation/firmware/firmware.c b/drivers/staging/greybus/Documentation/firmware/firmware.c
index 765d69faa9cc..f37904b914d2 100644
--- a/drivers/staging/greybus/Documentation/firmware/firmware.c
+++ b/drivers/staging/greybus/Documentation/firmware/firmware.c
@@ -63,7 +63,7 @@ static int update_intf_firmware(int fd)
 	intf_load.major = 0;
 	intf_load.minor = 0;
 
-	strncpy((char *)&intf_load.firmware_tag, firmware_tag,
+	strscpy((char *)&intf_load.firmware_tag, firmware_tag,
 		GB_FIRMWARE_U_TAG_MAX_SIZE);
 
 	ret = ioctl(fd, FW_MGMT_IOC_INTF_LOAD_AND_VALIDATE, &intf_load);
@@ -101,7 +101,7 @@ static int update_backend_firmware(int fd)
 	/* Get Backend Firmware Version */
 	printf("Getting Backend Firmware Version\n");
 
-	strncpy((char *)&backend_fw_info.firmware_tag, firmware_tag,
+	strscpy((char *)&backend_fw_info.firmware_tag, firmware_tag,
 		GB_FIRMWARE_U_TAG_MAX_SIZE);
 
 retry_fw_version:
@@ -129,7 +129,7 @@ static int update_backend_firmware(int fd)
 	/* Try Backend Firmware Update over Unipro */
 	printf("Updating Backend Firmware\n");
 
-	strncpy((char *)&backend_update.firmware_tag, firmware_tag,
+	strscpy((char *)&backend_update.firmware_tag, firmware_tag,
 		GB_FIRMWARE_U_TAG_MAX_SIZE);
 
 retry_fw_update:
-- 
2.43.0

