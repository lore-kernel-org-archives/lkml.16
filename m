Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C25185920
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 03:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743131420; cv=none; b=H7Otp0gjetqt3XMPWLrNpDi+N8M7DXhOufjanMZlDgkG52xyxZnRnw+dOXXF9DuvczQ25zWb/seXypFeU5uKupZ3knnzQaJUqT/WsGszUs6gRRx1btIUNDAZx0UZBjhGOsKiJilXdnbIhlU+V0+P9S1l+JzUz6b7dy5HVfLLD8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743131420; c=relaxed/simple;
	bh=mZk1/g6K9/xfZWWHQNM53p/aOxDqD8e73imdnMmnNKA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qhsuBhsEvAHekdikvQrkLqjqiiSyRlmDCAmvsKkHP3Xu1FSaXIwB8yQMybPdlwrhqkc2R6bFq7qibvRX+Xyudq03VNvgQ0j1oT7qeVLIkeyuZSj1Pm1YEzI8nTfUrm+NND6c6Jc8RPtxfNa7PaF6ImPE+tGIV4Ci6BZ3d9FCpeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=quanta.corp-partner.google.com; spf=pass smtp.mailfrom=quanta.corp-partner.google.com; dkim=pass (2048-bit key) header.d=quanta-corp-partner-google-com.20230601.gappssmtp.com header.i=@quanta-corp-partner-google-com.20230601.gappssmtp.com header.b=1xTpkqZh; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=quanta.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quanta.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quanta-corp-partner-google-com.20230601.gappssmtp.com header.i=@quanta-corp-partner-google-com.20230601.gappssmtp.com header.b="1xTpkqZh"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-227a8cdd241so39886495ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 20:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quanta-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1743131418; x=1743736218; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L4to77tfN2Uh/XXo3c+lIPR6s2qFb1tp5+3tSOChySQ=;
        b=1xTpkqZh+zD7YHkB+LiSCUIkkYzSq+LSQSeNpn95bevfEYi4S0m5aKn8pEQKuXyH6B
         c/eBimVCr3dGD6jjBVqkanK+WXNG/83cijcvDtfli/TbUmUXLbURmZJ/u29s5lO/dext
         AoULk/Y/nt82R4GYT1CHecwcpPoUlEQmwlhsdMwDjEo9eKSA2RYp74Vzfb0GBPU7tmo3
         CmfRySr6qxCDDy6+K6+luZki6Hfv6dabScDzXg6ET7wbghFrxTtDfuebJ/mR0VBCoHik
         tJv4EUTFM9nS2eiSJ2vu1RFgGIA4rxU0IrXTgc4Iw3UR7SX4YHgVTMewpfOUPmfirvkb
         HpJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743131418; x=1743736218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L4to77tfN2Uh/XXo3c+lIPR6s2qFb1tp5+3tSOChySQ=;
        b=vJyCaEj1TrSstPsDEJ8f0+NnpDmaAd5nT68EccwT0xe9HV4X9aGeApcTFxAKFgWjir
         6CbHgMlRNDfur0bBbJ9KPsJIkqjQCiDMmAy+kRn5cGFgSRMreSL773hfDhaD0DZElXwP
         8KAkSu8bW13Ugf0DIXHLd0QGw0PzLWkaZ6hv75NlQLdTKYE92pO+tjc5mEHdGQcWjzHE
         otc3xnQl8PpbtSsMNg1pyrPdQkHGqp38A3lIhPqVH5G1QoOH8qq189u9ZVZLXHtYfw17
         FAlLv+nrN9Hnd7JZS8sow7LczinfB0sMkPL8VQnwFmBma8xdRRjgl628H9IfpXdt74L2
         Qumg==
X-Forwarded-Encrypted: i=1; AJvYcCXE387U/4flTKUlOvw+hA1wh5tE6EarEDpaK2doS1odx8vk8/cMHURdeFd/jbNI6wAR6ryLnmyGzIpXN74=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMzpzpWKoV/yTJQWf2qFOj/JYOzA+sEsDXcx4C+Kpyb8CKAaC5
	EXo6RHrYjzc3zDLWGdquu+GgmvWOP9ICTYyTxhy6veT48Y7SWwFoFzPtsecnBPQADxnumISk065
	XRRU=
X-Gm-Gg: ASbGncu96NYIS8Djp0NyqOz5pwtS9zI3W6gY297duL5XNTMflWXIwsczXa3GEQ21LPJ
	zP+ihZgSbblRmarY7WoK2ty6MQXybHdi6iFrExAxrB/Db9tMBz975bjfECyeybjAo2KCdjZtf4a
	ZPfUnOMnSBkSxL397pR5Lemg6Gd2yEwJNOp7PXLigLPkA875uavCRK7ZkwVsU6DMjlQ/6Q61osC
	sh+iEjy1YpZD3Sq7Ie6sbst9KsI/xFCRR8Qy3ZpKUZcT7kbFgKhcFoEChDpX001v+gTD1dAw6/b
	uNYMrX3IOmGpTnBUMRL++BQGMOeQC+mUgRIOwlxz7Sb74x6aLhEUb0w3GcaAUfWU3CmCtwhv5se
	jnMzV14NoasKgGdyS59YtmRkzI0nz9908D6/u7nBL+cOZP9kG6sbk2/MG9Ca0BGw+JeUFXbNPxc
	m5TcPU7mLACfPMqw==
X-Google-Smtp-Source: AGHT+IHobEzkQ2a6/oFoQL+lhbLX1JKOfW8BRICYcfmgFVFtQ+arV1esj4jUfvhTyOflSwK99gUdZA==
X-Received: by 2002:a05:6a00:856:b0:736:4e02:c543 with SMTP id d2e1a72fcca58-73960e2f356mr8117439b3a.9.1743131418365;
        Thu, 27 Mar 2025 20:10:18 -0700 (PDT)
Received: from localhost.localdomain (2001-b400-e33a-bfe3-0ab5-dc96-8a97-3edc.emome-ip6.hinet.net. [2001:b400:e33a:bfe3:ab5:dc96:8a97:3edc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73970e22324sm663315b3a.58.2025.03.27.20.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 20:10:17 -0700 (PDT)
From: Ken Lin <kenlin5@quanta.corp-partner.google.com>
To: kenlin5@quanta.corp-partner.google.com
Cc: bleung@chromium.org,
	chrome-platform@lists.linux.dev,
	groeck@chromium.org,
	hverkuil@xs4all.nl,
	krzysztof.kozlowski@linaro.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	tzungbi@kernel.org,
	u.kleine-koenig@baylibre.com
Subject: [PATCH] [v2] media: platform: cros-ec: Add Moxie to the match table
Date: Fri, 28 Mar 2025 11:09:35 +0800
Message-Id: <20250328104619.1.I04b964661552ce532dbefd1ee5999fb0a0641a07@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250327103918.1.I704cb6f738208386a0d431d355169c6fdf0f51bc@changeid>
References: <20250327103918.1.I704cb6f738208386a0d431d355169c6fdf0f51bc@changeid>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Google Moxie device uses the same approach as the Google Brask
which enables the HDMI CEC via the cros-ec-cec driver.

           Hans Verkuil <hverkuil-cisco@xs4all.nl>,
           Mauro Carvalho Chehab <mchehab@kernel.org>,
           Reka Norman <rekanorman@chromium.org>,
           Stefan Adolfsson <sadolfsson@chromium.org>,

Signed-off-by: Ken Lin <kenlin5@quanta.corp-partner.google.com>
---

Change in v2:
 - modify commit messages
---
 drivers/media/cec/platform/cros-ec/cros-ec-cec.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
index 12b73ea0f31d..1de5799a0579 100644
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

