Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1AB28C2BE
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 14:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751292794; cv=none; b=VRg74EiJzU7O7LrQimbU7/i4JFAqWAOKkCRL2LvF76A0uT1vzyjaxLmKvZ+8eSgu2mpOqxvZqMwV/z/8NHaNmNEbrFHH8nK1SVlEq1Lqx6eXJdJVhv0qRyBQe9ifE2WCF8uG2VodOGLTbCVaofI1+p/qvxAQVH/N82lWE+AtRTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751292794; c=relaxed/simple;
	bh=Vml+Vlmh/yNyrlNV0OMkYSZVPlVmBlgOUuBzWRBqzfg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZQ6dbNBlikwI8y8LxEln90ObuyAmx94laBBCH7tvbPRznB8e3S3SXJQ/hJ5A3xCSfOcWO5t0dXIvCQCgPzfJlo++fs2wMLbEV6C+ZIa20ByHiX4lplYCBWJosnNh2vWQ0aLEXOfEWyN4A1fvpuJSXm0x0y7Nz40JIjXluNTk5D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nQbDSTCC; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nQbDSTCC"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ae0dd62f2adso799370866b.2
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 07:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751292791; x=1751897591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/8NRsPP90vS0j3nzCWJKBndtcs4Ube9as2Ue2hWIhFU=;
        b=nQbDSTCC3FxgKwEiRz1PSeZOVISZ5LatLPX66rfD6etRhMS3QASWeUW7zKGxbLinig
         vdA76B/6nbXoj3bCxCUCGLjzOl88bDgERTbkpF2cp3F0jh/d60OUj3p1t7XD/oGyV2Il
         YvCCVfLRppreCCw7f0d0AbR9a/FNp0Hy2IDo8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751292791; x=1751897591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/8NRsPP90vS0j3nzCWJKBndtcs4Ube9as2Ue2hWIhFU=;
        b=vUJFE/wmFCDK0fvTVCZK+RsN8CGCMbwEulkk3Y6l9ZOb0C2RswkR0qN+GA4exxVCby
         mugDWBvGyDR9ZizSK+cH3V9v4P2wthlmYer+hQ5FXfV8gLDEcTHlcBtckiJ9euTextvH
         /Lq3i+5hfzlCQNCksU6Dalj0yTfreldqkucTTDAgXzGTB0Dk4LjIL0fv4pocNND49fwE
         7zz5bFH1pgohC7oaB9UxLZv6cAgIPnPy1r5ztMnJ2DYEqQ/duIIuvujlAc2RwxixQr5p
         2aCm44AgZjrUD5a6e9Zr3ShC6yDi65MTiw8uBTTNHWH3U0KTvhjVNkU6jQITa6gt9iru
         mkkA==
X-Forwarded-Encrypted: i=1; AJvYcCVaoyrUmPYU3lp73dhraDoOeF27v2nOq6/dEk+z/9Y0w8tATCMiFp0Nd8XvzXVtzO6gcTGs7EoxhHiYfZI=@vger.kernel.org
X-Gm-Message-State: AOJu0YylUYliOz5HwzFyrO5ic9/uKffSPxs6ueYIR57fuVTXEZz66Lga
	XLmXzgKqdjyzDEmXMA+tGRhDS9j2YtV0/RmVvWABDS437wqZXmBZ4YZp1ikLI5uFCg==
X-Gm-Gg: ASbGncuTYuqNZeN6wSm71dL0H+H1HsQcx95DOa3BXhf3r/anjI5Vkd0hnQi8cB1r8t6
	zMxKXk7jHoqwR6Y9sJDYVhHhqfZQAW/shLIN8nkUyCj0n01lDuoW1sEuuntMKP4fpQQ+X4vRQhe
	bWCWQlFPj6fKDwuNfYRmSFIJGDVXwASUf/7Vl7/X/cPk54eU1ONIpz5m9Nd3KqTxJ9L62/JXFYg
	N9loapFWEEPZSgeE75ZWKBoWeyuYkmzqmAdzZELzSjZqT86bQDA4MjWo4/c8Sg7parn3bfzOp9r
	o3OK2O0xfK+QBKZ7IssSM9OkDaiu27hl8hSQhj/B9njhrd01gJaUeSkofhaEJcIx3SDM/UlWR0/
	C++vnDGpxNBAco3wArgNmpWNLWypaHMjmrFtOCTxstOmDdI6Ebl64
X-Google-Smtp-Source: AGHT+IE29gt8xWBI8pZXeQthKWA11FWxnfDchrHgHB2UzYqRmz/TTQgJ95KCGJWKBD6ofw4Dv8EGrQ==
X-Received: by 2002:a17:907:720f:b0:ae0:c6fa:ef45 with SMTP id a640c23a62f3a-ae35011ed14mr1314176166b.41.1751292791326;
        Mon, 30 Jun 2025 07:13:11 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (72.144.91.34.bc.googleusercontent.com. [34.91.144.72])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b416sm670643866b.28.2025.06.30.07.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 07:13:10 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: Guenter Roeck <groeck@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	"Christian A. Ehrhardt" <lk@c--e.de>,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v2 10/10] platform/chrome: cros_ec_typec: Add default_usb_mode_set support
Date: Mon, 30 Jun 2025 14:12:39 +0000
Message-ID: <20250630141239.3174390-11-akuchynski@chromium.org>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
In-Reply-To: <20250630141239.3174390-1-akuchynski@chromium.org>
References: <20250630141239.3174390-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The `cros_ec_typec` driver currently doesn't directly consume a default
USB mode value. This commit adds the `default_usb_mode_set` function,
enabling the `usb_capability` sysfs attribute to be writable.
This functionality allows users to dynamically activate or deactivate
USB4 mode on a given port.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/platform/chrome/cros_ec_typec.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index c5a7f42ffb5a..3de6b819906e 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -44,6 +44,11 @@ static void cros_typec_role_switch_quirk(struct fwnode_handle *fwnode)
 #endif
 }
 
+static int cros_typec_default_usb_mode_set(struct typec_port *port, enum usb_mode mode)
+{
+	return 0;
+}
+
 static int cros_typec_enter_usb_mode(struct typec_port *tc_port, enum usb_mode mode)
 {
 	struct cros_typec_port *port = typec_get_drvdata(tc_port);
@@ -59,6 +64,7 @@ static int cros_typec_enter_usb_mode(struct typec_port *tc_port, enum usb_mode m
 }
 
 static const struct typec_operations cros_typec_usb_mode_ops = {
+	.default_usb_mode_set = cros_typec_default_usb_mode_set,
 	.enter_usb_mode = cros_typec_enter_usb_mode
 };
 
-- 
2.50.0.727.gbf7dc18ff4-goog

