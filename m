Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B827B84D13
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 03:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747453304; cv=none; b=JU42vPwi5Q6KqF2cfmko2JForCwUfx7XuhNlMKgzXapaAqygBkeV6MzDeU+KEa6oGvQpmuQZtC9u7M5lcorKPTRYIKLMhjUjH0NCdiDRSDkeIOmDlN1+gTuOmw9zaqwLIXdMp4UDZR4Nnec6up8pdp5Uya/3E/A6r6myIAMZGWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747453304; c=relaxed/simple;
	bh=nCO3xwkNEaNbjPd4tLMwqNXOHIBtcCufIA8YxkdNPyc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=nJYoc7lIrwP5COKldrsZHOYN2qwol7Z2jmXK5VEKcOilrkvbVk7oOKt1A+aY/JDm5yMkdv6Vm9ij3cFgbJD+pE0ZAS92Q/C8oZW8PaC2LnbPog6aIyJ5X3ul/VK822JiIwIpORVL/9d1YTvEyMdQtnF4AIo3KlEJnR5wQcoiQBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uz7IjyRC; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uz7IjyRC"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-70cb3121db3so8765097b3.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 20:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747453301; x=1748058101; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xBSsz+EZeKdO3LGbXJuLMnrw6SzpUBaMkYbKffSs6Is=;
        b=Uz7IjyRCqAgxnRTSS+le3+lTTBpqWhdGwIZ3/E6tIiLau9+KYif6IiGmmAuaiwIsx7
         /WksTtgmi4CBbWOer5ErmI8JMvDmqiKGsSzzAJgtg8jZaBBEBSLQdN79uo8cw7xjwaH/
         Z9QpWd9qJjO+wLCJzu1FZ9sZCRC8PXD/2Y7BoIkVj2I4ZpLeZT6dKCTj+hR2OJGFV1AL
         OURT2sf21GI5HsmFHBv/PPXzWR0PMFe3SEuEVJTKmXLqv+F0D5f/dVACbIbxv0Sv7Vq2
         pFzaaNWKt6YbfhmHp9ljFSZ4zagc3deuUbvfRXZiAJPupf5gDo50iVh/+WyWTFXPQa13
         bbPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747453301; x=1748058101;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xBSsz+EZeKdO3LGbXJuLMnrw6SzpUBaMkYbKffSs6Is=;
        b=cVG4YlcqLAPuFkgBIQkFz5RFQUll/3857R5R9D+7gemX++nFcu61zls48Y8ANvt630
         e5Y/ehV//c+3cfyAsSXwD/1+dlm9w+JsudGj2MJi097OU3ZNZb1dUQTdZ+kv+xq4Jsym
         TXNVOz/1q03pSUjjs7A+sNRsE1ACrSd2zpbExtnFBnjwfqwGaa1G6DZxFg0NIGGjTaH4
         NJeP9mikX5Q3Hw8UV2ekVjobv9PiVFlSEYnV9Ozi/0CTND4KFwQBy/gZarNrVRQHLySO
         8eKp6VaND3Zqa2bxsADBAuws/MWP1c0wv+sIBcMjjsOLgRfcJ7QWTzWOF7LxtxkcQjgr
         KjVg==
X-Forwarded-Encrypted: i=1; AJvYcCXHq1kXqCirdSdZel4Qllq9K17vHGMd+JN1Lsh+6L3hJGHQZKIFUiU7EduRlUgOtJbE5o/RaTXb7WWd89I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3AZRDtwtyrETrxFCRkuHYEzc2DFo1RZimvwvUNuZgpzTG3vd0
	oUNh/0dFFapRh9+ja7OK7RaztJ/F8OpiI6rbrxTnyuUBA7ianuhoDj/ia25H5VHkrA+H1e5t7Sa
	P2i8Ee5m0jzzfFDQd9NfzxyBgaYZWTC4=
X-Gm-Gg: ASbGnctaDQPsON7lr9HGOmP78QVQ1VG5TGionhx2BaPqxmD2GZ92unXxU6XG5dKSwvu
	YUR5c9RV0J+VlbufpbQYFt9yQn8woQ3pLaVfizc+Oo4uy14zLNwqr+UrcCMeqhoy9REid8Vol2h
	KWgGgUPUA1wMbbuUj+X4XqimaqLAW0xnd7yxAnKrOYrr6jlr0BmXMmmlkb6XII5ac1tCdt2H3qd
	Q4=
X-Google-Smtp-Source: AGHT+IF436gN7/jFCxrpB/MU8XA9XIfXcR+aCYz9gELt5k6Au9AARPhYySBUccJehkcH53YIt5y+OndYonj9VJu76H8=
X-Received: by 2002:a05:690c:490d:b0:6fb:b907:d965 with SMTP id
 00721157ae682-70ca79573f4mr81196987b3.3.1747453301148; Fri, 16 May 2025
 20:41:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: rujra <braker.noob.kernel@gmail.com>
Date: Sat, 17 May 2025 09:11:30 +0530
X-Gm-Features: AX0GCFtIxtvxIu4R3iOqAZjRuHeebVLNc8s_0cuzSyovkxkXONjjqOzHvDSMjPg
Message-ID: <CAG+54DZgF55R2pEtkVBdnwXEyNu9TrSMA9zkmw7RjWrDqX4SsQ@mail.gmail.com>
Subject: [PATCH] staging : greybus : Documentation : firmware : Replace
 deprecated strncpy() with strscpy()
To: Johan Hovold <johan@kernel.org>, elder@kernel.org, 
	Greg KH <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

To ensuring that the firmware_tag is properly null-terminated. When
copying firmware tag strings to prevent buffer overflows and ensure
data integrity.

The maximum size of tag is GB_FIRMWARE_U_TAG_MAX_SIZE = 10 bytes, and it
may or may not be NULL-terminated.
included in "greybus_firmware.h"

changes has been made at 3 positions:
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
