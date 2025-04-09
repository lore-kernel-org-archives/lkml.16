Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A821D63E8
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 06:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744181436; cv=none; b=ba2aWDfWd3d2ZwqLFd6UIHtMud04d3G2T0Ngai+9xCmNeC59L0zrtWaJO+eXW4Jo/aAgkN8x/yABxYx97AXq/d9sNKBzapG5nYms08PjABbP750e+hS/YajIdSa41fKu5Id0VvY+QsNYkKBaOoNXBvE6EGkdTmIs855W3E84j6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744181436; c=relaxed/simple;
	bh=lzJPNu/ho7QoswrV6WnWRkvoPRlvvYAh73zB3hxTIVw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=VDepYV2/phTg7VU6rvcnvF0YE323ixy0Q8ewuAbU/cCZFxgHN3pmZGdHJjBbs5uEjg/hGxuZ2SMJL8d3ekVskynuoO+JFz0Jf419pdxZFQOs3TpNdKAHJciXsjOStIkjQOA2YQaDjm8Tj7yGqUM9HQmPuGKPIiRaVsLHtQj26b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=quanta.corp-partner.google.com; spf=pass smtp.mailfrom=quanta.corp-partner.google.com; dkim=pass (2048-bit key) header.d=quanta-corp-partner-google-com.20230601.gappssmtp.com header.i=@quanta-corp-partner-google-com.20230601.gappssmtp.com header.b=N77eozij; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=quanta.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quanta.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quanta-corp-partner-google-com.20230601.gappssmtp.com header.i=@quanta-corp-partner-google-com.20230601.gappssmtp.com header.b="N77eozij"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-22403cbb47fso68861495ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 23:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quanta-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1744181433; x=1744786233; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5118vdKYBhBBOKePz4luIaPeX9QCXZzRMgQUdbYU/AI=;
        b=N77eozijhrZQTOs9CLw0m47VS0cMTERBUBs+8Ln2Aw2rY6mYaIkq38StZbqbAHYdYp
         ATdh+riKw+rdzCEbI1BuQJFLoAtCiceOamO5utfPZBu5HYno6k8JypHzpecPFI73uiU2
         xDuHMq/qjvoBhkco2TxJ8t3a2X8AbY9PJjFtMHP68s/aLS2diiTWgZwEW+CJocLqAgNI
         srChXtQEg3ph6XsZz/+6h4gHQD2DB2fMqXaRIeippY1YSalLje/x0p3bRRQQxsXhqmcU
         PjtE/FSTT88WL0UHMNhPbXUyC5/5oQ2YVKWvVHsXb3QSPH6XSuUXsu4Kq2+QSWDpER4q
         7hUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744181433; x=1744786233;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5118vdKYBhBBOKePz4luIaPeX9QCXZzRMgQUdbYU/AI=;
        b=I6K6nrOI0g2U7GsKqQXvfz58mOZmBvx8vHKmkziRWVKhBBfujiMUSlmM8xnc4LuaBq
         G5m9dszvleSB8cKyGwVORLALd4+0GHjsBkE7z2fvi9AgmFtkvqPN2+K3rAV06deDpmGJ
         +8ttekeVWTB90T80QWnIumorhiMNO19Ohizhfn8VC7nH4Tt4krv4pfqx5mwMuXxOnpUt
         OknaVcrh72EqazCfqmNKEYNUfBpKrDnFBQm1QJGecvwAna1ifOTyVpXuWWKxyQ2D0M1v
         gcTmaQMY0ZtpmnPCjJ1rdX3DhvYl3rvA+IWVlfb2LMiCQ++f1jFxQTEy8cpzhIvlc0OP
         C4dQ==
X-Gm-Message-State: AOJu0YyW7y2DAuhvdd4Dee994RmwwY8Y5slRnWM83DJzeCjUh/bbtL37
	zY5Gif6p8zKwx4muSje0gC7y7iH7bBeU+bfYk3m09NXKz5aZJ7VHDkUZ7lA1FZYSIG7OhT3DyRc
	xp0s=
X-Gm-Gg: ASbGncuebFjCwJ1j1IPMw25XXE4N3uyYLTQgToiTRql6ZAmNEEbS4mHqRt2oBPiZhAl
	Dv3d6PQ+WCS5yq8S02HvM/lHkL8EWTfxacncVGo+YM49foCKNjfh4W1JuoDLUbkdudomXuL8+AZ
	1+33k88rUHH16coR+5LgbabIeVkZZBvac0e6GY4IBzwjzNy9OOFpo3w1AykZVevrsheqVJKd0ND
	191vyyclREEktxRJ8uiwQoUYI+gYXuxu2lO6nCSZc3BPrTbRXLMirzLHsm6w8i0U9oS0Rwv6coa
	iw0xZEEDwpv3u8IzmPshUJnffSng9SDqlFTebayYRFk92vh+Kk3SJmEaWufcjJNUSkVWRVzLeqm
	/Y2xPbzE4CuSq/O6EgBivPUJLAD9PKi7ZsEo01cSNRBtkbwSAsgW+4jtan+66hX1GzlTAzDaAQL
	M=
X-Google-Smtp-Source: AGHT+IHD/fcSTYcWjVLug8eNiUB0tiAbpo7VA3eJHkJExJWi+Ls8UggqC88792E4rbXW3ZUyHbHK6g==
X-Received: by 2002:a17:903:2f86:b0:224:10a2:cae1 with SMTP id d9443c01a7336-22ac2a25780mr28913545ad.37.1744181433539;
        Tue, 08 Apr 2025 23:50:33 -0700 (PDT)
Received: from localhost.localdomain (2001-b400-e356-f6aa-64bc-0a4d-57de-afb7.emome-ip6.hinet.net. [2001:b400:e356:f6aa:64bc:a4d:57de:afb7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c97a1bsm4308235ad.148.2025.04.08.23.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 23:50:33 -0700 (PDT)
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
Date: Wed,  9 Apr 2025 14:50:12 +0800
Message-Id: <20250409145007.1.I78118a7168f9021bb12e150111da31de39455c27@changeid>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The Google Moxie device uses the same approach as the Google Brask
which enables the HDMI CEC via the cros-ec-cec driver.

           "Benson Leung" <bleung@chromium.org>,
           "Hans Verkuil" <hverkuil@xs4all.nl>,
           "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
           "Mauro Carvalho Chehab" <mchehab@kernel.org>,
           "Tzung-Bi Shih" <tzungbi@kernel.org>,
           "Uwe Kleine-König" <u.kleine-koenig@baylibre.com>,
           chrome-platform@lists.linux.dev, linux-media@vger.kernel.org

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

