Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267FB202C5A;
	Tue,  1 Apr 2025 13:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743513825; cv=none; b=nxIllqLDjizd9nEvs6tbvMmwNdqhj/s2TVQIBLeA74XtJmo33dEoOPaPP1EMYjjk9Z+Xl/2Yc1OAHuvL8Vb1A3kCJXEnDl5WuXcW+4LsbsA6MExQCH4mlT/xRWBqFXhGM3d8MB4cFLqEP4BVkFKNWhorRI7kzm5RM9ayMvxNGBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743513825; c=relaxed/simple;
	bh=BiuPqRJRr57nRty/a6n8RR+DLkyTMZh3A6tDfFtIG9I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NA1cd2JJ9tV4hnz5iVBfMupyfpXgLttgRWWFNfOoeiU0bhRKpYbsWswWAcXs9OwuCqYLw5rJXwVSUApZXgY+/0Lp6g1HbJSvpfvnbYlMxT9PV13XQyq7MyFsAQryMtTewq+UbPh9o77XT5jEVWZpw246r86SyTwcsutpRESzZhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XJZLZtgM; arc=none smtp.client-ip=209.85.214.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XJZLZtgM"
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-224191d92e4so102513995ad.3;
        Tue, 01 Apr 2025 06:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743513822; x=1744118622; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EyDNMW9IBuY8jRB69DY3fJHCsQyLv/GHW0iXNqQGDTc=;
        b=XJZLZtgMcRE6lp18VzRYlHOVLudn8tNXUjVtSam4lnv+D9/fQcaeqy+298qsPryAxb
         00bhR4t7w/Pg+ch0xyz3noUitgk04+eb9AVpNUe21pzPS/6A7MMC5j2nk93Ebll4/jYd
         4fuR+5YmVnkcqjz8JfS7UVQX+c3kvQCX7Q2Y9aSQh1Y5NWK/7XEFtNQr5JMRp0EuCAFY
         BnlQw9tefPdW/3j5TBGxSk9hL73JEDEgX/uOQNZOdTe+qyUezSeqtEYYkIYdiOejKOsU
         HFO0A+tpMrUygZ80hr0BWjxEgA2m4xo46y6apVUattE5IWrAXGuYtHfBeCr7Oq5RVfsj
         XtNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743513822; x=1744118622;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EyDNMW9IBuY8jRB69DY3fJHCsQyLv/GHW0iXNqQGDTc=;
        b=P9rpHDGRLLeFnvTuLeRXtbFYBlOk3C69Dxq2UGY4LWGCYIhv2T5UhA4b3KeJ7LjvtZ
         GnMIb6oePFHQCbD69T3vVvb+tvym154fJ8m9x92Va9w7Ryc9vFQkgmBCc3uMwagYiP2o
         ewja8dPbm8GmNkImYEy0YSOHj/hmvo5K8xZmErvwRsNJ194k12k/CAchOpB92RSRcxdi
         1knd48/PKXu8VRWigGQ+N0W2e2xBIGElYjSvT/d3Cao5upILixCxchTIU8Jhl7rnIz5m
         eBHSOGNwg6944VVDeWNORDqT1SmXRcr/+ecCcnr8ielItkw7/x+LJ6Y3swr+qxaKOtvD
         UyuA==
X-Forwarded-Encrypted: i=1; AJvYcCUZxJqHzUh3qc4iDcpY4QpH3HBsCuIlCtV1vEnfuvv0hKuaMCxvLH0aYrOM5iNPoDYv4nGVf0a4YZk=@vger.kernel.org, AJvYcCXtAOwKvTlIfgcxUSBpj8lEb8qoh8s4seG9x5rKysH2vp+JuFgOFjiKgoawBZrOa20OUE5Feu31mZf8mb02@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7IqU+wq2yjJbMb3WIBPOBGU+yLbX3OZ8qdqULgFKODZtTBekx
	knRj1EHGJYEHfhICqvba0Fh+7X7Bno3e6islI9KGEI/QPmHp9csp
X-Gm-Gg: ASbGncsZOiETYDvQnFuuD3Gf7bwh3k3lW7wePcP4V16NrEfKzMhPycNSyt++oO29KLK
	dmn408ZvlkA0tksVQCDS9E+YznOmZ8s68be33BtkWMG+VAQb5UvsyX1ey3R2cnKT+XX+Nwxzu/3
	N5CKg786eqJYaIMOqrOWh37Z2YO8U1o7f7FWpJineZ/znQBZ6tYsAK929XI1akJgS9JFekqV+sK
	s8K3M02Pj3AJk+8RzwNUnr+6MQ7tG20muGwKxmH032IfVQjXInBi/KxcAjH1NLnXTHC3D4KnJcF
	hz0KL7tNJYbIpCHuNZylhbpYVNcFLo/SLrQgkLq+ythZTS0zEt1O9fY2G2+bV2zF9BEfYfo=
X-Google-Smtp-Source: AGHT+IEd9GQsC4GBsA6T7gbOkBVQnrLNIkIyEnQBb/RXdcexhSvAxnX9gO7Xk2mjUWmPOHqdw1MCaw==
X-Received: by 2002:a17:902:db01:b0:215:8809:b3b7 with SMTP id d9443c01a7336-2292f946440mr203250275ad.7.1743513822231;
        Tue, 01 Apr 2025 06:23:42 -0700 (PDT)
Received: from henry.localdomain ([111.202.148.167])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eeca1e1sm87901995ad.2.2025.04.01.06.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 06:23:41 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	florian.fainelli@broadcom.com
Cc: bcm-kernel-feedback-list@broadcom.com,
	dave.stevenson@raspberrypi.com,
	popcornmix@gmail.com,
	mripard@kernel.org,
	u.kleine-koenig@baylibre.com,
	nathan@kernel.org,
	linux-clk@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>
Subject: [PATCH v1] clk: bcm: Add NULL check in raspberrypi_clk_register()
Date: Tue,  1 Apr 2025 21:23:24 +0800
Message-Id: <20250401132324.27312-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

devm_kasprintf() returns NULL when memory allocation fails. Currently,
raspberrypi_clk_register() does not check for this case, which results
in a NULL pointer dereference.

Add NULL check after devm_kasprintf() to prevent this issue.

Fixes: 7dad8a613185 ("clk: bcm: rpi: Give firmware clocks a name")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
 drivers/clk/bcm/clk-raspberrypi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index 0e1fe3759530..720acc10f8aa 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -286,6 +286,8 @@ static struct clk_hw *raspberrypi_clk_register(struct raspberrypi_clk *rpi,
 	init.name = devm_kasprintf(rpi->dev, GFP_KERNEL,
 				   "fw-clk-%s",
 				   rpi_firmware_clk_names[id]);
+	if (!init.name)
+		return ERR_PTR(-ENOMEM);
 	init.ops = &raspberrypi_firmware_clk_ops;
 	init.flags = CLK_GET_RATE_NOCACHE;
 
-- 
2.34.1

