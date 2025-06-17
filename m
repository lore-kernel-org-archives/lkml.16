Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22EE62E06D5
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 12:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750164708; cv=none; b=d1pIf4QGnvk8AsF2FCOapqN809rqiYZ34JF98qa4kpTBZayH8w77myjggW4L/9sCnTvZt1ngAB7HiKnmrqi8eZLzYyTstEJpcS2eELbUSQpKQljfUGIHpBqJ6ESg5Rfzi4jOx4xw1rzlt4C6xDPqJsPpQM+dwolQHa0g9qmhHS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750164708; c=relaxed/simple;
	bh=y8+C7iI8r1NplDnN9G0yvYuEi4mGegIOzJfcfmDW34w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GOag2aJzXzNFLaGnj9ZWfWH4qcjzq/SM6+4GgWYkolURKg9HzD32ZPa8gFe03gB5OFv+FhGf0LMtW9fs9O6uJyWitbIQe2y5DZRFxemsF1WT0MnTN4YqhpBqJTRr21lrjDvvVNVIt85JlRIS6+dhPxsVRFVxZbN7EKFcFRkRkh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q6ksRUfO; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q6ksRUfO"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-313bb9b2f5bso6587021a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 05:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750164706; x=1750769506; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hSxo0ZHyfJr1fQpftYFJehkxIFFbw7pyxo/Db9fNjFU=;
        b=Q6ksRUfOsysgThik+T+fXiOfIlhecpIpbh4jpq5HpqPFJ69ODF32MumHUtGfQqjxy7
         FAOYfYY6sne0BUTpF/aAm6SvlM0pQv4AO3mVe98d4ezXgqUCiUf0/Z/9aQMdByPi+ZQ9
         odPFrC9btB4cuSt94yKHDevTuixWpgIbTuW+in6kc98ddD/F9KHgagvjiV33btZB2Gta
         z/vfsQdeFBEHM/gFSc6VROtWa4jDoJ41NTSOx/fR+Gtt56aRXaBC29nvEC76KvGrbjda
         XxQX2HULSCg3aEEc+KI+K85K3qkoIFgNq4HtISbID5wPw+GoIqeD51ZU+xNJ2Axm049c
         4dUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750164706; x=1750769506;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hSxo0ZHyfJr1fQpftYFJehkxIFFbw7pyxo/Db9fNjFU=;
        b=O7LUoi9NevDZ3qoHrjNXrbDOAGk0HHuVzRRZp9yAI67fwbDtLwQiCm4r8rzImFiVE1
         jLZwfU1gFxvPf5Qxtn+fAST/CHJ6GEc6yVHfEavhZwpz/vToi+8nso5MvcIbawq/7lqC
         nGxIHJK1XIlSdvzdiX3YBwSfLwqs5PRQTSF0xl3hv+mM3uocQb3QXQvgaz37dEImg6xL
         CJCPJj1BdirfAnItCU20eyshw+PNRY7X7DHWJf7lqK93J/FuPOAuXsDrNnG9PKrdQHsp
         dvcqAcvOyUbCN97JewGkY3PmXlltOa6jef20l/PDLqzp6f7sgCuPjKs6X5Jnwz+LN4ke
         Zw6A==
X-Forwarded-Encrypted: i=1; AJvYcCVrK8bvD6ChUOzkfSXP35Y5laeUxfiagU/Du5Vh3//892YPOl08q9tzQHK444v1L5yD9KLx34/GdIN9VXc=@vger.kernel.org
X-Gm-Message-State: AOJu0YygVENO3lTVekk/rGAxJ+eFICGGYjr0Rg0mkkdtAVl9y5tK+Cye
	IKBIKblaE2N+aDnVmkuM6FVAmOCRv05hP03XCyHTLsaK/Y7jFoRJmwkG
X-Gm-Gg: ASbGnct/TTiSpsGKTzHwhE2p2O4Ty6OkoxKj26eUt61HZKC5jjrJVzjmMX88MHvmQ67
	t/o9PEyaiFeRGFilxyH8ZiPiMy/NnObA8YAtCvFBmVWOllgy1UY+JxMRRXbX839T4B/GdJqmshp
	wIox8Yxe95mX/ruuLiIfTqbS9ByDBwqsfC+vPoO048Lt2JawpxHbCF3k7bae6kp2c952gDwwNz9
	ZkbmNWF07CZGRhrOeXghpeHFzn8RRUskQbTOpHePMSvihqyr/z51ViaUgnAvCpAtZtBZFo9LG/s
	e7vtzWhO4TRIYCTf6SyN3oSod+gmoGBTS0XfyAil42oPv8Ni1h9K+qn1BP/YcEub+x9IdziOXz1
	I92pANM4B0X1hQCxpYg==
X-Google-Smtp-Source: AGHT+IFDyTmPgMZj/RHIVJLIOL48m69TjdL4fouKx5vArpbDJpyInEok0Mk+dEvaEXL3/xudr7VNHA==
X-Received: by 2002:a17:90a:dfc8:b0:311:f05b:86a5 with SMTP id 98e67ed59e1d1-313f19d2977mr23454941a91.0.1750164706232;
        Tue, 17 Jun 2025 05:51:46 -0700 (PDT)
Received: from manjaro.domain.name ([2401:4900:1c68:884c:5800:7324:c411:408d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1806282sm10421980a91.0.2025.06.17.05.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 05:51:45 -0700 (PDT)
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
To: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	vireshk@kernel.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	Pranav Tyagi <pranav.tyagi03@gmail.com>
Subject: [PATCH] greybus: firmware: use strscpy, fix tag size
Date: Tue, 17 Jun 2025 18:21:37 +0530
Message-ID: <20250617125137.24503-1-pranav.tyagi03@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Increase the size of firmware_tag arrays in the following structs from
GB_FIRMWARE_U_TAG_MAX_SIZE to GB_FIRMWARE_U_TAG_MAX_SIZE + 1 to
accommodate null termination:
	- fw_mgmt_ioc_intf_load_and_validate
	- fw_mgmt_ioc_get_backend_version
	- fw_mgmt_ioc_backend_fw_update
	- fw_mgmt_ioc_get_intf_version

Replace strncpy() with strscpy() to ensure proper null termination as
firmware_tag is interpreted as a null-terminated string
and printed with %s.

Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
---
 .../greybus/Documentation/firmware/firmware.c        | 12 ++++++------
 drivers/staging/greybus/greybus_firmware.h           |  8 ++++----
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/greybus/Documentation/firmware/firmware.c b/drivers/staging/greybus/Documentation/firmware/firmware.c
index 765d69faa9cc..3b4061f4b34a 100644
--- a/drivers/staging/greybus/Documentation/firmware/firmware.c
+++ b/drivers/staging/greybus/Documentation/firmware/firmware.c
@@ -63,8 +63,8 @@ static int update_intf_firmware(int fd)
 	intf_load.major = 0;
 	intf_load.minor = 0;
 
-	strncpy((char *)&intf_load.firmware_tag, firmware_tag,
-		GB_FIRMWARE_U_TAG_MAX_SIZE);
+	strscpy((char *)&intf_load.firmware_tag, firmware_tag,
+		GB_FIRMWARE_U_TAG_MAX_SIZE + 1);
 
 	ret = ioctl(fd, FW_MGMT_IOC_INTF_LOAD_AND_VALIDATE, &intf_load);
 	if (ret < 0) {
@@ -101,8 +101,8 @@ static int update_backend_firmware(int fd)
 	/* Get Backend Firmware Version */
 	printf("Getting Backend Firmware Version\n");
 
-	strncpy((char *)&backend_fw_info.firmware_tag, firmware_tag,
-		GB_FIRMWARE_U_TAG_MAX_SIZE);
+	strscpy((char *)&backend_fw_info.firmware_tag, firmware_tag,
+		GB_FIRMWARE_U_TAG_MAX_SIZE + 1);
 
 retry_fw_version:
 	ret = ioctl(fd, FW_MGMT_IOC_GET_BACKEND_FW, &backend_fw_info);
@@ -129,8 +129,8 @@ static int update_backend_firmware(int fd)
 	/* Try Backend Firmware Update over Unipro */
 	printf("Updating Backend Firmware\n");
 
-	strncpy((char *)&backend_update.firmware_tag, firmware_tag,
-		GB_FIRMWARE_U_TAG_MAX_SIZE);
+	strscpy((char *)&backend_update.firmware_tag, firmware_tag,
+		GB_FIRMWARE_U_TAG_MAX_SIZE + 1);
 
 retry_fw_update:
 	backend_update.status = 0;
diff --git a/drivers/staging/greybus/greybus_firmware.h b/drivers/staging/greybus/greybus_firmware.h
index b6042a82ada4..ad5b2c8a6461 100644
--- a/drivers/staging/greybus/greybus_firmware.h
+++ b/drivers/staging/greybus/greybus_firmware.h
@@ -38,20 +38,20 @@
 
 /* IOCTL support */
 struct fw_mgmt_ioc_get_intf_version {
-	__u8 firmware_tag[GB_FIRMWARE_U_TAG_MAX_SIZE];
+	__u8 firmware_tag[GB_FIRMWARE_U_TAG_MAX_SIZE + 1];
 	__u16 major;
 	__u16 minor;
 } __packed;
 
 struct fw_mgmt_ioc_get_backend_version {
-	__u8 firmware_tag[GB_FIRMWARE_U_TAG_MAX_SIZE];
+	__u8 firmware_tag[GB_FIRMWARE_U_TAG_MAX_SIZE + 1];
 	__u16 major;
 	__u16 minor;
 	__u8 status;
 } __packed;
 
 struct fw_mgmt_ioc_intf_load_and_validate {
-	__u8 firmware_tag[GB_FIRMWARE_U_TAG_MAX_SIZE];
+	__u8 firmware_tag[GB_FIRMWARE_U_TAG_MAX_SIZE + 1];
 	__u8 load_method;
 	__u8 status;
 	__u16 major;
@@ -59,7 +59,7 @@ struct fw_mgmt_ioc_intf_load_and_validate {
 } __packed;
 
 struct fw_mgmt_ioc_backend_fw_update {
-	__u8 firmware_tag[GB_FIRMWARE_U_TAG_MAX_SIZE];
+	__u8 firmware_tag[GB_FIRMWARE_U_TAG_MAX_SIZE + 1];
 	__u8 status;
 } __packed;
 
-- 
2.49.0

