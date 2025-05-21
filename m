Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33FD222D784
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 04:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747803425; cv=none; b=drg6gWUYANnO84wGfWsp1hQ4UyrWGw4PUMMtqdeimMUyuu/voh7XI5LIb7A3EYB/VM59yrOljTkthxzrKYfkTVZvsY/OK4d0ANOD+ZLKC3s9PsYVzT8p1QcoD5ChVmeB3CV3dSDeaihtBciTLOdwtdIfvpr1ZXohDlpXPSYuQGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747803425; c=relaxed/simple;
	bh=vo1ypLzWXPCyz5dAd0yQBRwG/ACUts5O7p9HYNmzh0A=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=cG5Pamjr1aFr2CRwzOxy8eQ1z9RbQJ2Rb+Es64Wct0F5YIgWBopznZDdgnqfssViIltPpQUnyuorfKCBpaEsV06RMBwCOrH/TRycFvuVDmjsHkKCiekdM0THFPHOpTbA/h7tFIiNBjNqF86uKzJhDlf2mNcRkTwOqTO3Mx76p+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XBuou1Fb; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XBuou1Fb"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-70825de932bso76035377b3.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 21:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747803423; x=1748408223; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LmckIIGT8yVblGvyUqQcWyw1PyOoO9FxgQykWbwGVrc=;
        b=XBuou1FbPtC39sWJNwjJ19ZBwLa9Ha18JNczBYkL6C6nI6cjSKsN6OGVNh0fP7E3mz
         jMS1djNkMbosEL/RksbxJYV4kx9f9InK5mdX6nbi65DeaYjaBRW+fHdU83jKp5Nc1IlR
         MuL8UoeVAtH6OWxwgs6wXCW2+Hng0ig7A/ZysANjQ7z0CGsW0AY+/kE9Ngp/K9/eP3hi
         C333tO6rEp6j5Wt1E6PqS1q2tjjtrAbckHYus+bU8pns64WS7eiHSpY730e+5SgZWHuq
         2WCZ+6u76Kdp0dPwGd/7BCdnKQzQ8FdpYMrsC8GHw9bRTtWZ76oMI5waDU1mExa4OSwW
         EX2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747803423; x=1748408223;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LmckIIGT8yVblGvyUqQcWyw1PyOoO9FxgQykWbwGVrc=;
        b=sVJaOvKAfnX0FKD1/A+Qg00tvySKUtJecl7S6JJfBkEystwjrV3cUWEabRug9mlJMN
         4pJjhJe/FDJPOSMKTx7YqMVV6wVmr35TwJ+aM9jpQF2W546T/k8d4+xtNu6hkXeHODm2
         OyoNjDTrbFAMtewmbEmBGgm/Zsr7ANu7TLlInb80OMPlkrfJNUAFm9zkRKscioAZxHIn
         R0es8pfLlmUHWcA/qRPqPu8hovyhs9estoX5JxF6T4ZVbLta/8X2UXLEynSoMfeEUKjP
         fboOYC7bxbhrDi23wPCvs0OlYIy57axs0ECZisidMMmTj3X2kMyXV5OsswymLHr8soNJ
         lcSA==
X-Forwarded-Encrypted: i=1; AJvYcCVB25OdrRsR0StpE9Y4t78Vn8F8X/26qxOkrRxhWQpCsHddJLIPXor2ozdXgklKtov95rdo2TMQrcPilJA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5bRIEk3602UvATKABtLUW0GRFct5VJtEwpaxLLDpj171xH78D
	QlSoKNGQlgagYu10NcsP41XoL+oMxTp5RgxsVTt/2slphW0ZpMu3iQfB6qD9z1SCsneMpl3U6Gb
	LtNVtugKh36rolMfiYQZaX3dYpaXxPlU=
X-Gm-Gg: ASbGnct5enJ882+9QK7K4/xR/honDT34+L3BM+UCSr6k3MONv+eJGikncgrMKxPFSmI
	j0bnjhGTs0jCC58aXiI9S88iWnoup4gaj/iDkH4EHeNvrMqucjqA1lzSlxJVAqgTQgv13hifPH8
	2uczKNcvuIbbcJ9wL4CmTHvHIHG25ERaAWXsx0W9xd345u6WTnAZ2O+qAEnPGNUnc6
X-Google-Smtp-Source: AGHT+IEWACZUbEn/Qvjby0NOVMqGnBxCdnWU21NIdYQPnzISHC6IxPhE6ErXjJ9myeXwvkONTIpEdWeO/LjmyEhrwoM=
X-Received: by 2002:a05:690c:4b8f:b0:6ff:2777:92b7 with SMTP id
 00721157ae682-70ca89425d0mr263705067b3.9.1747803422994; Tue, 20 May 2025
 21:57:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: rujra <braker.noob.kernel@gmail.com>
Date: Wed, 21 May 2025 10:26:52 +0530
X-Gm-Features: AX0GCFvr_1t0VGeoEGMfBmVXMgLUGm9UXK5DksnneiF0m3jEivpuHRiT-6JKn_w
Message-ID: <CAG+54DZYz-4hW33Py9mihHDauWw55=_rP71s1MbCg-5gxw7J7Q@mail.gmail.com>
Subject: [PATCH RESEND] staging : greybus : Documentation : firmware : Replace
 deprecated strncpy() with strscpy()
To: Johan Hovold <johan@kernel.org>, elder@kernel.org, 
	Greg KH <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

To ensure that the firmware tag is properly null-terminated. When
copying firmware tag strings to prevent buffer overflows and ensure
data integrity.


changes has been made in 3 positions:
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
