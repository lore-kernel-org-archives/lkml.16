Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830E81FE47C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 16:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751126823; cv=none; b=nUXfKvx8a156MsknXyGODBa5xojNHtuVgLnOZiLCzOloGfK9uE9SVuB783j8ulXaSaK1NTV9jsHYjud39vP4zb29Bzfkeyql2OjtnO4AzJPKkE21rYVLOZvjh9PIU0LiRlLySm6Dk/SqzU9mTUBRdt4I7eUnkXYkc6Y2VitBfck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751126823; c=relaxed/simple;
	bh=5YkhjwjYXOv3b4T3efRRZg957ekWudxaz7fO0qlJqzc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Jp01vMG3yNby/tUVkClxeH4UPfy1lTZuEWxCBzprRsVzcrwndr8ianPmocMRZ0TxanIEv6C9P5Z9+5rPRFuUtHlqkcHfDUgg447Wc6EzNE0zmXGgne1wywkmfNVbyVeJP1GTCfra/nzhB6GIf2Qri1Af3CNg9rg18rnmI12AECI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=t2kWGkr0; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="t2kWGkr0"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-73ac5680bb0so826677a34.3
        for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 09:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751126819; x=1751731619; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kno8dtoTlypFC4/mPEH9JA4/sgEPOQ9aSkubCXq0EoE=;
        b=t2kWGkr0CIrJo81ZO9OZ2gJ1qc6IkWGRwUbZOZFS5jvSKOpUP1Ph8yKnesbRncnd/q
         AphJU59V4VYYtOGeYD0aIJz9fjJQf+7XBUrlyX9/iOqj/2XzshUBQOfuBxtHRxPIHFvO
         ev4rpi3Xa2Xw25j1eMhyxEYgT4yIJjc3ICUc2ft5CkXPZMT2Y/PHy23SRrd2AWN880Fj
         XJk3mohSddQwxW9+L5eWcZp0m5w8onSEkpVwkmCDzVVOzwkUfzP0t0hsaWw49xb3p4mU
         LXr8MI41TQCfLhrbccnltmjT1TAv7AliYkH6XHui3FWYHK5B1RMLYmBxJuqMLfqf0kPE
         HCzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751126819; x=1751731619;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kno8dtoTlypFC4/mPEH9JA4/sgEPOQ9aSkubCXq0EoE=;
        b=EWlRkiA2sPM8Z4809kPCKka5QrNnE+kI/bFd4d8UAo9xvQZTNPN9eelUUUtOaC6zlP
         XImJNT+WmrlKpXc+r57xAlk3JPh13rru8BHeME2Niyy9Q8sE0ahNR3wbpJ63tSiap7xJ
         1p/2Ey8tWDv7H/LM+RRr9L3E4pB8Lk31KdU9PFTdnlZYi0CHHYaNjAVD3uNDqsYABoNY
         5I5RepiPwLvaj0MdC3Yx79b+V/TOpVKC0WL92arpC2LYrzdGnxh6aRT8ElqBYxz4XOKm
         4J7i0yxdv58QpR7U/7dhpJ0Bm5Z+EHMk5JejeGpT5CvEIT+0R3vCycndCfZPMa6Uct0F
         RTnw==
X-Forwarded-Encrypted: i=1; AJvYcCU98ofVNnEIWjx/LxL899U34Lq4NViibvgV/PxUceV6iJaqTeiuQ9ieWEFbXvnTN9I4FfcL/vmjsiApXwo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk1lRuf8rh9XobPzuTmntPVTYsg4TbRkl+N1Qo13kh2D6OC4J/
	XBT6gpxr1tXIPZFRp238o33VGFMlHb9uosgtCEwas4BK0tHNp7oYVfNpG2HyXC7ahAU=
X-Gm-Gg: ASbGncsyaIVvoCPUsDL+k/KDmEy5uuhmnBLY+KxjvcZBo4E1OZDWbkc+2BClYeV58fS
	Z2qTqK7HCw/GxPSNZjYB5GEQxvQj2eurIGfYs3YYBjzZ6vD7Mv5jXKQQqha26o/u4T/Uvy2YJuq
	Og7qbM3h5fuEsVvyYQFtK42vlKp97pCvdFebsf3gPFKXQ2WRDdD4JYnwdcL+K+GQHYt0y0hXAUA
	SbfZrTg0crRv7rbWn07vgk81wuVXBygXELtjm36IwwSAnogwaD98FfgSnyia2GU6AieNs9dagv0
	i8bz/mbBuAbDfNyz/U9h1jUAZgcxhNpMAH1dka1et33fayv6IV1HXrPZkDrj/ByY1sTb
X-Google-Smtp-Source: AGHT+IE8QQVo1a5ruOgFP5Kfi548ZhP3iY93PJKaBjRluNYFjEIYKwhZ4kFOUNygCy6k+59WsfkCyA==
X-Received: by 2002:a05:6871:36c2:b0:2d9:8578:9478 with SMTP id 586e51a60fabf-2efed4305b8mr4565393fac.4.1751126819554;
        Sat, 28 Jun 2025 09:06:59 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:3092:a48c:b0c6:cbf4])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2efd4ef026esm1562942fac.11.2025.06.28.09.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jun 2025 09:06:58 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Sat, 28 Jun 2025 11:06:48 -0500
Subject: [PATCH] iio: adc: ad7091r5: make ad7091r5_init_info const
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250628-iio-const-data-3-v1-1-13d3f0af5f3f@baylibre.com>
X-B4-Tracking: v=1; b=H4sIABcTYGgC/x3MQQqAIBBA0avErBsoo7KuEi1Ex5qNhhMRiHdPW
 r7F/xmEEpPA2mRI9LBwDBV924A9TTgI2VWD6tTYTUojc0Qbg9zozG1wQE/W9zRPizYWanYl8vz
 +y20v5QNHclTHYgAAAA==
X-Change-ID: 20250628-iio-const-data-3-fecf1e7698ac
To: Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Marcelo Schmitt <marcelo.schmitt@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1061; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=5YkhjwjYXOv3b4T3efRRZg957ekWudxaz7fO0qlJqzc=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoYBMad6FEpTnouWHCMGTdQnBG5kDJoO+Dm2ptR
 CUXjYdFb/SJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaGATGgAKCRDCzCAB/wGP
 wMRNCACID8bvT5+B6FjbEmHyDad/VDD8DYWWWMjPV9CJ/MdR90pp94D74Ww9+I7eeDUMlgvHozz
 32eL4b6R2Oo1xjaEfOuE3URiIkKUonzshTaKKQoYXRXUunEJJnLbk1K12qhzNr2jCflQqeynPOv
 Jbx3L+lPUiu/HDXkvTynCDuYniJgexOjkRtfXCQpJtzTV39fIawT4c9o3ozx/ZYnM/iOr6n4svC
 30pasJYBBI2MB2T+FgZxf9wllKBIKzMuPBEHG+bST6jDLETyFJjgHcYmcgghObkf0JcdxaWPCk+
 ABPDJTICukBDZ7hESlu5IeMAV8JODr6mNRHksDnhfCtuulH1
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Add const qualifier to struct ad7091r_init_info ad7091r5_init_info. This
is read-only data so it can be made const.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/ad7091r5.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/adc/ad7091r5.c b/drivers/iio/adc/ad7091r5.c
index b472b9498fd1307e493579e257769ace233eb073..bd4877268689f048eb67e262ac5ea0c1f5c04a76 100644
--- a/drivers/iio/adc/ad7091r5.c
+++ b/drivers/iio/adc/ad7091r5.c
@@ -92,7 +92,7 @@ static void ad7091r5_regmap_init(struct ad7091r_state *st,
 	st->map = devm_regmap_init_i2c(i2c, regmap_conf);
 }
 
-static struct ad7091r_init_info ad7091r5_init_info = {
+static const struct ad7091r_init_info ad7091r5_init_info = {
 	.info_irq = &ad7091r5_chip_info_irq,
 	.info_no_irq = &ad7091r5_chip_info_noirq,
 	.regmap_config = &ad7091r_regmap_config,

---
base-commit: 14071b9cf2d751ff9bc8b5e43fa94fbf08aceea1
change-id: 20250628-iio-const-data-3-fecf1e7698ac

Best regards,
-- 
David Lechner <dlechner@baylibre.com>

