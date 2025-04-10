Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B710B1E5206
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 03:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744254274; cv=none; b=scJvCDJukfSO9pOvockmOBb1CttSzZ+7ZTEVsSD6IQXg4v653bM2/naSqXHhzK6G7LiWWSUQiRqzNYVeyMDQo6hNZzMoKeq3ommZ7TFyFkgyBLc4s7ZZhRwV1YV4PJEZaCgb1Et5GctWAa8rdYj3cQ2oqxzjDktx44QZz+PA4/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744254274; c=relaxed/simple;
	bh=n9QosFtSbeNeSbP34lrbIPOZ8CcsdXMCj9ufOqlVKmg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tfKCCsO2bTAwctseJtbieA9geWWN/Zc6ak1aix54J/nqVervx6sHzYp0zbH5VyFsgwzemGgKB76yoO5nKlRtRET8hwlTO/b9owZNtEG5+ujwfc+F1GW4/hWwx8RVm7IK80Oksn28N+5ucOPNDOHyMPezttOtZm6gECzMUYSdPT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=quanta.corp-partner.google.com; spf=pass smtp.mailfrom=quanta.corp-partner.google.com; dkim=pass (2048-bit key) header.d=quanta-corp-partner-google-com.20230601.gappssmtp.com header.i=@quanta-corp-partner-google-com.20230601.gappssmtp.com header.b=sCxS1NZb; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=quanta.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quanta.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quanta-corp-partner-google-com.20230601.gappssmtp.com header.i=@quanta-corp-partner-google-com.20230601.gappssmtp.com header.b="sCxS1NZb"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-736aaeed234so202142b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 20:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quanta-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1744254272; x=1744859072; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9GbPHC4XyIZwMLfb2UD9p5RCkxg4ygXrRY6FVcmk18c=;
        b=sCxS1NZbqkZyKrXVuSbuNd/EjIrNUoJkbUL7XO4ImGLg608WsBrhAD+ln4Si3VoLyb
         oUyquyYZf0heZFpG/ATDEFOAiKqvnSvpRAUeuKysMrxLSiAjAK2/1jL8DkJDUy0xakHy
         RF/eUj3iSDULO9gkFN9hEI5zKCrqvAfvfS+OQOMzpuUNZoepNqNuz2zt7vfXw8UVHs3F
         c/MEhA7qUOFVxUHquSMtMsz3YqVDQSd/w4UgvRrpWNpk+NKh4sChM23SHvPi3YAaNYPm
         gpRoYfNZGrnAlUf3dkHYy09IrTceizDrSaTXYQU+1toAiRG2a2pluFijgZsdwcCR+Ejb
         CubA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744254272; x=1744859072;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9GbPHC4XyIZwMLfb2UD9p5RCkxg4ygXrRY6FVcmk18c=;
        b=rSHYsLAzkusVE0ZcPkJpg2aLVcdqcMkhzmcbDxqQ4LvrN2o35G60ohFyOg0CP88wPX
         Xf7uSpGoJBjDYDRWaVzKaaPI23DXVsTCtTVju9itQKeWJz0xaNpUHXrvDiDEqVRyAzxT
         LzaDWO4nytFvwnZyIB54R8rK2sCGWhHi3pYKp0TRMj+zqxYqizAsD6ccB9GUYswKIVkY
         BHW/Dlt3UG7y5BWkP7Xjds0TA8kCT0CMjaK2KD72YA+2twIv0QBG6HeRDPYi6kzjdf+d
         OFJy4n63S31Ox6hBfROjUXrDLq7BDIuZ+FBFhC6V4kDuHKuBK/qM80b2qNix9N0BvGqY
         nyUQ==
X-Gm-Message-State: AOJu0YwHf6/eN3PbErDF4VSm22Kq6+8+MHZxwxli5fl5nG0U/ldX+fwn
	uHsBfLukBOQmYARr5LPOLTwPiiTLLtj2twfbPz2ox4uUZTONTvSh+XZausVvKzRYPz3cHnJXeGl
	f
X-Gm-Gg: ASbGncuYGzuo4SzZnTH4fLpxloRWnGiaw2dT41eJ3vZ0V1YGvT3qlfDzgy8qI9lU8Z9
	GrSsE4mwrGmae7eEbQXWJXAruH0WwC60nas2anTJ/JPkAJFlYCee7eCK0c3q0HAJV384PYEzdqX
	E8qYslUqvlBtu/WwW6W61P8JYeKGaNjMoip0EWAMeNrRypK+bj94dxs769eQSErjMQleqDRkQ0c
	QLgoo1LKGX2cz5r96VxTo8tCQEhvSLPaMZtFLxS/AZsJg1mgELNMbjmHIhJIOZDr8F1lYkatXco
	S2RtTHsbX8vWepc7KKykhMmz93QT4wz3YdfBK89CIjjvW5nSSO5LbC9RMjTIHE9YmX0P3KYw7Gx
	BvJJqFny1x9jdmsYd2XtTJeLixKEsajxad/116YHaiuf35q6NB/9vsY+HiXzfj2At1rVNPpm1DC
	jj
X-Google-Smtp-Source: AGHT+IFxuMTEWXNHvY+DER3MAoYU6tYLKazUmZTcSJ+oZr5QmtLIkDa2HAYg6JAlPj0IBAYGmH0A5A==
X-Received: by 2002:a05:6a00:4642:b0:736:d297:164 with SMTP id d2e1a72fcca58-73bc0a14eb2mr1091377b3a.1.1744254271685;
        Wed, 09 Apr 2025 20:04:31 -0700 (PDT)
Received: from localhost.localdomain (2001-b400-e356-f6aa-66f7-bbbc-393e-d9a6.emome-ip6.hinet.net. [2001:b400:e356:f6aa:66f7:bbbc:393e:d9a6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1e69700sm2233644b3a.172.2025.04.09.20.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 20:04:31 -0700 (PDT)
From: Ken Lin <kenlin5@quanta.corp-partner.google.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: groeck@chromium.org,
	Benson Leung <bleung@chromium.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	chrome-platform@lists.linux.dev,
	linux-media@vger.kernel.org
Subject: [PATCH] media: platform: cros-ec: Add Moxie to the match table
Date: Thu, 10 Apr 2025 11:03:59 +0800
Message-Id: <20250410110352.1.I78118a7168f9021bb12e150111da31de39455c27@changeid>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Google Moxie device uses the same approach as the Google Brask
which enables the HDMI CEC via the cros-ec-cec driver.

Signed-off-by: Ken Lin <kenlin5@quanta.corp-partner.google.com>
---

 drivers/media/cec/platform/cros-ec/cros-ec-cec.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
index 12b73ea0f31d4..1de5799a05799 100644
--- a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
+++ b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
@@ -329,6 +329,8 @@ static const struct cec_dmi_match cec_dmi_match_table[] = {
 	{ "Google", "Dexi", "0000:00:02.0", port_db_conns },
 	/* Google Dita */
 	{ "Google", "Dita", "0000:00:02.0", port_db_conns },
+	/* Google Moxie */
+	{ "Google", "Moxie", "0000:00:02.0", port_b_conns },
 };
 
 static struct device *cros_ec_cec_find_hdmi_dev(struct device *dev,
-- 
2.25.1

