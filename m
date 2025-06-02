Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BAF6221D94
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 13:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748869599; cv=none; b=JO4xDWC92af1wHGJVaIYP22DodHZzDoW0hfEh4iiehWBG5p2+Ume58eJ8Fss2FZN5PhPWJlq7SM65xhBZuYoZp8ZjhCcedWEO/otR1plOp2gp33N1+fosemEC99Kp2W7cmN34nJFDyLhxVs4AolmtCvUod/pAKrOzVm+o2dGRqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748869599; c=relaxed/simple;
	bh=f8DLJRlfWk3JbMbPVn9HOqED6ZsFtjWYBvOs/iqXSX8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XiRTXx2NrWorIGG81vYaFngRL88TU3RaDKvaVrf3kJK+tvpCrQRV1K8VyNEgJI4a4e5g9ejadU1kRSUR3/dp/kCQIR56iq9cPkGLV65L44P/B6GKYKifbnYzjBFgxMzTweSThv2p8aXc4ajIJ1LvGvJgEAElmW1tXrYoPOPpdDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=i1FTJ476; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="i1FTJ476"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5533a86a134so3842589e87.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 06:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1748869595; x=1749474395; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qCzJrisjpk+CFUwffyPuVe/ToQ4yyR1pmcjuE70Cqq8=;
        b=i1FTJ476yX5TTQAHlbB/36hu+yKAl/An+K2kVCKDuMle4k2YCMAkLQAqYrEm9fQFYz
         c28qsbQyhIR+UQBKKiPtAk059gXF3fgSZldL2v05b0DGL5uKZ6xV8DkAfo0Dk2+bwqEg
         JjjLUJi3CSOcty1Kduuv0gMkjpB97NiXBK4/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748869595; x=1749474395;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qCzJrisjpk+CFUwffyPuVe/ToQ4yyR1pmcjuE70Cqq8=;
        b=GgZf2ZtEIp9uGUmlcAAoDjB8Rz8h+P06+Regr7UKQ2zOlhsJdk+cGdvXb1J26aQzfE
         3dMNRVAXzLhJdwR6+0H2eKTwyZ3gHjRUlq3eGs4DEY6u2vZGjyJ6dF7tQsEe3jQ2H7RC
         H7+XZn0lR376LyuIoFsRsFMd1QVDHjA9vm6z8rezBLmZHJV/htxE+mPem714tpHPKbuP
         WkZbEcSjBCGOzCAyJT0hURtb4dLg4IVLncynfgSL70/u8RKRZ6ar1HcqkV5Y7oH2IRGn
         YZkLunROU9jF0a3/94rT2kEZAfsIWgcZhsVzqG57mYeOKm1/+G/Nwdn3RLJubjop/+X0
         SF4Q==
X-Forwarded-Encrypted: i=1; AJvYcCX+LcIfl+1clkQCDXHKJFenhIttyIWFgmoLJfyz/DDv2PAxPwhkei6AteJVKT1TxPVYRr/o6B8sLNg9rGs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/IoZvTSLvHq8laiuueeEXiuwsh4cFrnD6VbuAolNSW2E8Enz+
	BJgObenkGq8+LpmgFgUkRoaWMxzkXCq5iTpjq7Vo1n8LQEHrCnGRyF2VDOK57o0yyg==
X-Gm-Gg: ASbGncvFUnE41sxs0OozlFyFbKsCwUaTSPqssgL19KLCzaeck9M8SmBv0BW0rV/Ky6b
	P0I6fOfXU+uWG+hzZJ1UR4q7pmEiXsBGHbLa5kVaRn5e2iUrHPhNxNsbUU43Ld5SU6E+M+5PfMt
	x/sawPbBLMMMbkDtIld4Vi3rOjbzQXbLdSF0JVe78gAyxmOzGHyKEfYqs3mBNJhtuZhPIYvh1Bn
	ZCcXAD1IoCWnvWP016YqDNHqyLKegHiuojl8c+vJPp5MmBlzGVq/fTJE9xTjOh6iZSk6erUueae
	9e34HzEvnZzie1sLQKm7Hx/o0jlceZsMcDFRrstlow8k/8vhiFDVeKKqLb1B2PzWXxjnZ8a3Ej8
	4CLE2UnJjRUnR9AhO5fcWXT3XZrv6FVmaMdNI
X-Google-Smtp-Source: AGHT+IH0NosGo5ALPzrWCPZ3VJBx3Lh/ZXu9d1HFFdcNMNRnaVj/eitBGu6FAAYNgPu1yP6pmJLffA==
X-Received: by 2002:a05:6512:68f:b0:553:2882:d78a with SMTP id 2adb3069b0e04-5533d13e791mr3173981e87.1.1748869595433;
        Mon, 02 Jun 2025 06:06:35 -0700 (PDT)
Received: from ribalda.c.googlers.com (90.52.88.34.bc.googleusercontent.com. [34.88.52.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5533787d26esm1590160e87.41.2025.06.02.06.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 06:06:33 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 02 Jun 2025 13:06:20 +0000
Subject: [PATCH v2 8/9] media: core: export v4l2_compat_translate_cmd()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250602-uvc-grannular-invert-v2-8-c871934ad880@chromium.org>
References: <20250602-uvc-grannular-invert-v2-0-c871934ad880@chromium.org>
In-Reply-To: <20250602-uvc-grannular-invert-v2-0-c871934ad880@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

v4l2_compat_translate_cmd() can be useful for drivers to convert between
the VIDIOC_*32 and VIDIOC_ defines.

The VIDIOC_*32 defines are not accessible by the drivers, they live in
v4l2-compat-ioctl32.c.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/v4l2-core/v4l2-compat-ioctl32.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
index 8c07400bd280dea5d2e66e2759658c423bcd3866..ced4892b42597d605887b7c6a14373e3922f7bc6 100644
--- a/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
+++ b/drivers/media/v4l2-core/v4l2-compat-ioctl32.c
@@ -929,6 +929,7 @@ unsigned int v4l2_compat_translate_cmd(unsigned int cmd)
 	}
 	return cmd;
 }
+EXPORT_SYMBOL_GPL(v4l2_compat_translate_cmd);
 
 int v4l2_compat_get_user(void __user *arg, void *parg, unsigned int cmd)
 {

-- 
2.49.0.1266.g31b7d2e469-goog

