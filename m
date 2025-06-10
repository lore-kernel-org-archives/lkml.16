Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E4E1EE7D5
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 15:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749569949; cv=none; b=DdeVS2XMaVBSO4pPX+yOjRnXYqx+FOcuR5YQRLT5RBiYfc/Qbj5BLWq/0rVBHXM+0U0GfF3Rvw6SrTDkraAlHULWfGxLdxy1z4oCeQcZo7QKmNGHHCGEekBMpZRm+q+U21sIqJzIu29LMQQG0wnGjQzSQWkQ9JWF9lbX9vkTJRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749569949; c=relaxed/simple;
	bh=X3FMNaH+gMkSWc6mxlddlgItT1JWMkGhMkmmBWRVpzU=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=c0J7A8Yd010H1ZOK8C+RmzUCK97bSNkoRP2y3qmP9R/8Sn1+ZZ89+UFUkKm2hASl2arcbPThOd/V8rBdwvuh+LvVe3ble4hGaPaUhcch3JffPnqqliL5e3WCP96PoLgr3mcI/KdYFcrFXs44KtGxO7DSr+jJAGnEdCR6vnGIIZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tmichalec.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=M1mk/JAp; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tmichalec.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="M1mk/JAp"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-60785397a37so3796578a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 08:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749569946; x=1750174746; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=K83VDCEaogYq8o+q4q2QDKkSbCK5mXjp54sio/cApS0=;
        b=M1mk/JApK4uxLjy8/uhORGACo7+CSGZudCpJEXXO5jEx1xGzgjx0WyLkhGjvHUwNf4
         /CFqJvqapImT7evGhX5J1rqq5C5bFYhZ43e+pHu/hgpIskFFjGQj8holVWy2fEp07f08
         I2Cb9zqhL6tBmZAozoLX9/n1ZWkcTlJRcjg/IKkWWf797MW4R5+gnnroqhxqFjuoLcX1
         yDJUL38ZhfLicQQtjPYC3s5I58akE02JuGcqP1lXFST+7tyvqIkMwWiMikKimUd5s3e+
         O7rar/KBNytFTaXxwuHzxDvSbXY6zI+OlriDzz8nItpQ/6fpHf/+rmxAnFS3tpg032iz
         Jm7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749569946; x=1750174746;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K83VDCEaogYq8o+q4q2QDKkSbCK5mXjp54sio/cApS0=;
        b=fKpuIi3rXyXmiLawoWQZJ7Hm2rWERVGlTCIwg6OUxM3xEWnFihiTUyLx3eIdD8rh+D
         ub2MHa76IFn2yl/MXfRneJ6M29TwQzqOG60cbu1/tQHCEtaqGMiv1Um+U/Ls87+OsYfU
         RpgesW93u2RDuecPLkMSgIzgsbcv7GJGIKy20vI97+RblJf0mnPzKXnI3ttlg/VyKwV2
         YcWD2RLeFsfqcTnfLfRL86og7E6N3eFAi1NWgqM8keFQzRJAyr8PDO9PZ1fpO7OiwNkL
         xgeNgawJa0eoqBC24xuyqVFpTOwbIDCu5fpJwvVUFyb+7GcpURMYx2Cn8J0Nf/uue2HD
         yGQw==
X-Forwarded-Encrypted: i=1; AJvYcCWDir/FaBA+tUYx2rOIG5PJmCqHT52mkslVVKQ9VxeN8ka1wz49xtl4MteyExeKzk3xhZL/ZA872p2Iues=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw55oXTh6XyWjNeFYC555PkUrraGoKKm8edLt/2NhnT9LVnzZs9
	oAWlTz/dOixBQkyjnL5th8hnIO0EcvYQaamgYBtgK1shWhapDUo5PQN8H1pqp4n5bFSY4TybIYS
	Xni3qHM0XRNypKjqFhw==
X-Google-Smtp-Source: AGHT+IF0ZTAD1f0oKGQJq37uOuJo1nDnMzixE4HUDx2a7KPwnJbsLI8iBEKebG9jVNmmils6F028/Z0NOTH4V24=
X-Received: from eddn5.prod.google.com ([2002:a05:6402:5145:b0:607:fd2c:1f11])
 (user=tmichalec job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:254b:b0:607:434d:bc2c with SMTP id 4fb4d7f45d1cf-6082dba7954mr2757439a12.23.1749569946760;
 Tue, 10 Jun 2025 08:39:06 -0700 (PDT)
Date: Tue, 10 Jun 2025 17:37:47 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.rc0.604.gd4ff7b7c86-goog
Message-ID: <20250610153748.1858519-1-tmichalec@google.com>
Subject: [PATCH] platform/chrome: cros_ec_typec: Defer probe on missing EC parent
From: Tomasz Michalec <tmichalec@google.com>
To: Benson Leung <bleung@chromium.org>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Jameson Thies <jthies@google.com>, 
	Andrei Kuchynski <akuchynski@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Guenter Roeck <groeck@chromium.org>, Konrad Adamczyk <konrada@google.com>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	chromeos-krk-upstreaming@google.com, Tomasz Michalec <tmichalec@google.com>
Content-Type: text/plain; charset="UTF-8"

If cros_typec_probe is called before EC device is registered,
cros_typec_probe will fail. It may happen when cros-ec-typec.ko is
loaded before EC bus layer module (e.g. cros_ec_lpcs.ko,
cros_ec_spi.ko).

Return -EPROBE_DEFER when cros_typec_probe doesn't get EC device, so
the probe function can be called again after EC device is registered.

Signed-off-by: Tomasz Michalec <tmichalec@google.com>
---
 drivers/platform/chrome/cros_ec_typec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index 7678e3d05fd3..f437b594055c 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -1272,8 +1272,8 @@ static int cros_typec_probe(struct platform_device *pdev)
 
 	typec->ec = dev_get_drvdata(pdev->dev.parent);
 	if (!typec->ec) {
-		dev_err(dev, "couldn't find parent EC device\n");
-		return -ENODEV;
+		dev_warn(dev, "couldn't find parent EC device\n");
+		return -EPROBE_DEFER;
 	}
 
 	platform_set_drvdata(pdev, typec);
-- 
2.50.0.rc0.604.gd4ff7b7c86-goog

