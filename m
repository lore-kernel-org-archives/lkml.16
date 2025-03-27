Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35C91C700B
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 06:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743058796; cv=none; b=L2l5b/yoBTeQyIcccOb52xOX/Io+98Ds7AZFcKAiiLR4/iL4wo7LoFYxVlykr5zXULz2d7Y1iLiLwI3TF/25PQh0z3cOO6z1CjWnjOn4FyYHrrOK+AzASLt98CCJr4UbTrwSgS8zI5VB/X3XebjVWL2NK0IjojS4J29YDJNJspE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743058796; c=relaxed/simple;
	bh=mZk1/g6K9/xfZWWHQNM53p/aOxDqD8e73imdnMmnNKA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mYTur1qRIwKs/loSLx6sbd9aUIHIduL1PTNV3pciK7wprBlpaHMKhRc92yDarM6FvWG/vRgM35hNK9N4TfOF+9PmZ5nWX4EO9GZjURpWkSnJgF7NKQfSmq3+3IISlnmcorfsP852tiA8slGNcaHutS8SwKH2QFGWa5qjJnEZTkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=quanta.corp-partner.google.com; spf=pass smtp.mailfrom=quanta.corp-partner.google.com; dkim=pass (2048-bit key) header.d=quanta-corp-partner-google-com.20230601.gappssmtp.com header.i=@quanta-corp-partner-google-com.20230601.gappssmtp.com header.b=VnXUtEUl; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=quanta.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quanta.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quanta-corp-partner-google-com.20230601.gappssmtp.com header.i=@quanta-corp-partner-google-com.20230601.gappssmtp.com header.b="VnXUtEUl"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2ff85fec403so3572045a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Mar 2025 23:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quanta-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1743058793; x=1743663593; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L4to77tfN2Uh/XXo3c+lIPR6s2qFb1tp5+3tSOChySQ=;
        b=VnXUtEUlnYuZngItHJzLd29wQYqVA++VmxZQ9jp6kUwqM4aH5hOOuEUfBVpVgZLBXv
         Vu9Coi2+QDT14EXvOJON6YozB6X+CX3/OQSiAQINcQP9FA/kuMmb6WbKTtDiwwWnKc5x
         tL6YrVe6Zj9SPcDwDsxw6qPczRaOpHJrpjl9rrc5uYOSKDA5tedZDM3k3FErjvEJHrJ2
         xVTlsfPJpAUuCrKH0+phS5oS0CLGJRnquUFB0bh472/VOhmCSQ6EGvEXvkrcSwXHwBty
         gp8ECYpP7J/+5i16BRI4d5Dy5mo9Bato5TfVDp65nU4nXvRQNqN3jhZ8oLZvRsuRsZ5Y
         ZllA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743058793; x=1743663593;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L4to77tfN2Uh/XXo3c+lIPR6s2qFb1tp5+3tSOChySQ=;
        b=LPHWQrNAf6+uVpKbSBMs/73EsMbs0qEY94joAQ72Z9iO5opVH2DiVWrcuPUx6KLbNu
         aEznZwW5rAPEFdCkY0RM+UUzupFKTxufdw+9rwdkN9GA9IoC8CkNzYwSBJQ65+zaeDnV
         ZoGuzQBrOBWG1GCedWy5oS30IsxfijAXksSJsKYs6Pwbgb8T4ZyMJT6jxwUXwOlzv4Kv
         0obccrAgCXaTtwFXh+Z8K4/zK0xP/hEDKkJ0aH47NcU8c8tMnWgEpCNa7qb6Xm6qE+CP
         LkbKBno5/oDGucT5vf7L8e3e3ZE64t3vXVxfzcF4Iw3VlCge65YhKcOdKhgfH1ilw558
         hn7A==
X-Gm-Message-State: AOJu0Ywpv4wfV7hkGWlxW3w35ySgaPcxI+9eJPzbTeWVbYpWcs0aSUft
	PSYQ8mQ9kz1CgkAFQSbaEBxG+Ddwq+W9flt7j/dwvFpBlOsJOS6ypRXgflhXnZv+2sUVcVYcA23
	GHgE=
X-Gm-Gg: ASbGnct9iOp8xbuRVJvHNp5N12XxnTx1MqobmY6bUfi3mRzG2djztBs3a2tuUDgmeVk
	ms3vhS9gOacvBNIzITZX1cnoGae4rLPRAXxc4MWzQNbuuLzBI852IA4dU5BbUCQo9VpUm9SErQV
	YIWSJSX/IwB2dRWJrtQX5JDqmpMcz0HXs0fiXM7ZgWJY2aNO001G6TvW0VlWsOAC1Chbq8tssqM
	vl5pjHnqEzeX9uYHBfpxBdG/R7eGLUN95OX3OQfEiQnrO49RlfF5XPwPRD69Af8KlcIYylk7DNC
	uoCHHfxsb2CQIn6LXd5XkeJfRSCpSnM4AaTmn2it8nHwtfA8xRvlPV4FcLzNF++ZMBgFf3Gcdlw
	6laA9TY7ZosXzMAZwLkwVs5EmC9IZW7BtDNAn1D3NxxmBghw643a6ujo28mz99ugkFHaCohtp9s
	OGehMBuC/xlKxqLQ==
X-Google-Smtp-Source: AGHT+IHnETWyyanBiU2twDZ1VaieT35/Fur+NGUXFQac0h6cHFF/+Ft9G2H9gQIlqjGEPWZaiJQG1A==
X-Received: by 2002:a05:6a00:35c3:b0:736:aea8:c9b7 with SMTP id d2e1a72fcca58-739514c4fc8mr11981390b3a.2.1743058793466;
        Wed, 26 Mar 2025 23:59:53 -0700 (PDT)
Received: from localhost.localdomain (2001-b400-e33a-bfe3-6468-2896-023a-3689.emome-ip6.hinet.net. [2001:b400:e33a:bfe3:6468:2896:23a:3689])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73905fe33d0sm13513053b3a.70.2025.03.26.23.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 23:59:53 -0700 (PDT)
From: Ken Lin <kenlin5@quanta.corp-partner.google.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: groeck@chromium.org,
	Benson Leung <bleung@chromium.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	chrome-platform@lists.linux.dev,
	linux-media@vger.kernel.org
Subject: [PATCH] [v2] media: platform: cros-ec: Add Moxie to the match table
Date: Thu, 27 Mar 2025 14:59:00 +0800
Message-Id: <20250327145729.1.I04b964661552ce532dbefd1ee5999fb0a0641a07@changeid>
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

