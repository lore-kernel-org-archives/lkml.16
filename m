Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D462040BD
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 14:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743517082; cv=none; b=QqLca64A+kvRZ7bA2cL4lUPYPkwiprkUWj93p6pRMMdy6r0z5c1jVzJZNdv1whPkWC8Wvxh1aKQ5wfzOgAwuQwz+fz7QfZRWxoTRBXFP7aIpm3+vVfDz+2RZgXFmWpxb62QdfBHBZCEa2yBfBRPGjpXiPLUSTYXXv96e5W1ltu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743517082; c=relaxed/simple;
	bh=qBYjcouQW6HReKbjdwqHeD5kVbmPx9ci9r+cFmpKKBM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R273GZYlJRFlo/xEio6qiKBMWTuLQ5g7SKLs46Aas0Z3cYPG6hRIkdDCt0EE3Ztd4eqr72vJe/yTlqwRaV7PsK31zp+HryvRRP+3NrfQGt5KHHlbBJcn2JaCB+29fC91c0W/peFFXIbImvcThRaChFpK4pHjflYv68gsng7FJaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=K6GZ63aE; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="K6GZ63aE"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54954fa61c9so3943401e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 07:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743517079; x=1744121879; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=11E24h0kkMUDJZI1H/PMbxoLXdKMo2wCD3aU6/q3qUU=;
        b=K6GZ63aEYvuM2hcvSiuAQ2AlPgLWrzTA1dP4XCIAitms7cD3EHXQr2kkJ9ezN4EhRR
         eyozYE7R//1LokcqcNSg+XzJXsK+BXMMVBttFKulx74sAwYqxsiNKRIOXOazxKVqCKq9
         gfJqiRouGkGCxVG1heMqmKvleo85Qt9xa4uGE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743517079; x=1744121879;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=11E24h0kkMUDJZI1H/PMbxoLXdKMo2wCD3aU6/q3qUU=;
        b=JU06d7U2dYAdfiO4EgYAK6MvpYYFBESoPypMm+UPBZMiP5eIuV0ZEdrLD9Arp4pIvS
         F6kOcvrCcblSsEjsYyVKE2cQeMYdc9mTwMxSTpfTvGd4yAbk0Q9iYL+TKT2hiFFleA7f
         tM+OpChJbkM1WjEv3LVjlL1002KqV50qZ4bA1i0mnD5jc3WNscFRFwCx8kgMnMxx9RhM
         FXuAnS8kw8NkfJnWw8+DkT7/CcYgb5ybzTKn7OGLwgfZHtObe1N4WH09XO80QhbhKSnL
         Ttewn4ldBRm/GToYwKFNsCzsHI/Doxb0XcCVA4Qy68xoz9OQBLd+VDDjwj/t4+1X7P5r
         ImCQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2L+lOfCVZlVWI3N1C42xPrgeYCIpGxvD/hTscBT48s+7WJXSizS8Bky8KqIqj8CeDmyFjSNMUzncnpzk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2vZvDVPNl0QDYoCcvlR47oibo+8YEQnhtuP2ipqhemWMF9Ze+
	YtbkEUgSJVxz8ApEl5zIpSWD4bVuviEEJ4dB1yOF1o0KeU3badEoodHkUvLBig==
X-Gm-Gg: ASbGncsvhB7k4fR4Jbrnx1xUZDwEz/IyQuAYhmyROWfM+SFM8k6OCpfLMjH7YDPNqLk
	ByCUBJ+t8nnkcPa4PyPMv93Wp6Y/Oa8eMRk2Ccj7iUwiSgyuPrUFLa1ybnbpxQDSerqPSvBOgH4
	XgRqq5TXns3vNt/HGaXqW0B8pvFptzMiYsxvxkFJ960e8N3a+itC9B6SQy43wQy0img90GbqCrU
	K9tqFHlBHT07OZsx3gLgPUc3/SRQUZlkia/ffIfHAlM2vSFxOyqU2gMbN6t6otvqq6Y+G97VB66
	u7LipC1ESZNpH4IQqsjxFt3fgy/oeJJDtx6/NqlOh40izFJ+xqMmWfUAEOdGsKgVt5tNU4a0iaZ
	If5cYeH3szbj9ENnVPcRuuz3b
X-Google-Smtp-Source: AGHT+IHN6U3rH8+fca2aINvuxvaQMLkM1cf4WYnPgGffYBfOrlVLilx3ccY/7R2tGC7KC/dIyogKJA==
X-Received: by 2002:a05:6512:108d:b0:545:2b68:936e with SMTP id 2adb3069b0e04-54b10eca297mr3363397e87.25.1743517078964;
        Tue, 01 Apr 2025 07:17:58 -0700 (PDT)
Received: from ribalda.c.googlers.com (216.148.88.34.bc.googleusercontent.com. [34.88.148.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b094c19a3sm1377789e87.80.2025.04.01.07.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 07:17:58 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 01 Apr 2025 14:17:55 +0000
Subject: [PATCH v2 2/2] media: cec: extron-da-hd-4k-plus: Fix
 Wformat-truncation
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250401-v614-v2-2-53024c4fcdc7@chromium.org>
References: <20250401-v614-v2-0-53024c4fcdc7@chromium.org>
In-Reply-To: <20250401-v614-v2-0-53024c4fcdc7@chromium.org>
To: Hans Verkuil <hverkuil@xs4all.nl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

From: Hans Verkuil <hverkuil@xs4all.nl>

Fix gcc8 warning:

drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c:1014:44: warning: 'DCEC' directive output may be truncated writing 4 bytes into a region of size between 0 and 53 [-Wformat-truncation=]

Resizing the 'buf' and 'cmd' arrays fixed the warning.

Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c b/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
index cfbfc4c1b2e67fec9434aa6852ab465ad8c11225..41d019b01ec09d1d3e72c89155042888b7948463 100644
--- a/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
+++ b/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
@@ -1002,8 +1002,8 @@ static int extron_cec_adap_transmit(struct cec_adapter *adap, u8 attempts,
 				    u32 signal_free_time, struct cec_msg *msg)
 {
 	struct extron_port *port = cec_get_drvdata(adap);
-	char buf[CEC_MAX_MSG_SIZE * 3 + 1];
-	char cmd[CEC_MAX_MSG_SIZE * 3 + 13];
+	char buf[(CEC_MAX_MSG_SIZE - 1) * 3 + 1];
+	char cmd[sizeof(buf) + 14];
 	unsigned int i;
 
 	if (port->disconnected)

-- 
2.49.0.472.ge94155a9ec-goog

