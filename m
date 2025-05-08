Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D255227EB2
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 08:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746692553; cv=none; b=hy3tmTnW6l9Vz0x/6r/6U96hPcHMExHCET4q/GO4cZ9QqgRoRoqrxuBN8xQVC17KoRmEY/Urrfa48ySg6syBTem8KyYDCfNYLyjbX0JpdfD6SG0D7Wjh6G3Z0wkygMIfeZg0X3ya2BhwLPG9FGFOLIbnIn46HP+c9coJCZMKGPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746692553; c=relaxed/simple;
	bh=b3KQHbcle90b43aec774WIneNV4nZ170I27rWBYWVls=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OFLolG38DYQuu7loWzbs395CmfMBK8ip/Am4DVu98/eRt2475b1h7F4dDDjKSZUpenhmT9kRVR/CmEN/UKS3yATo0lE/7tj7SWlmftTL4JWn1NEXkyKWd8rKkp6VHReU09vnKtFt6sEzg+DBPrjSeDMnIHIY5tbeyCdEulpv8g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=quanta.corp-partner.google.com; spf=pass smtp.mailfrom=quanta.corp-partner.google.com; dkim=pass (2048-bit key) header.d=quanta-corp-partner-google-com.20230601.gappssmtp.com header.i=@quanta-corp-partner-google-com.20230601.gappssmtp.com header.b=No3iuEuJ; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=quanta.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quanta.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quanta-corp-partner-google-com.20230601.gappssmtp.com header.i=@quanta-corp-partner-google-com.20230601.gappssmtp.com header.b="No3iuEuJ"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-736a7e126c7so723033b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 01:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quanta-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1746692550; x=1747297350; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mimeEgxpLLLBSpau4R5LqHxy90HrqVEPJpvVRXqSVB0=;
        b=No3iuEuJ+JE6ijNT7wGW/xIEobi2Y75jiXsksP0KPuRTskKFOsvI4MyCfZ0zNRekps
         GZ2IJEKPVOjLaoh0HckkubCO3sGQEnUPgmYbEtHFYQn/8RUFD8ZBIaWFo+z1QW1IBjol
         tixxm8VqnzdEtkoy1WX9QUDEC6BTXJz8xjywRlBu3B4Kn8R0p3DCwzhQ+bfPS5qXr5US
         xnA5WuDhQFvUlv8y5EwOBtwfk0Uog2ard1/ZZny4pRnGc221YTIJVmsAlYxYn4tn+eHR
         GYBYiJfx7W7po+3QWCqZp4c2Y/ecjQQ7XGL9q38S2QIw2DZhT1Vt6WSEfqTCBbmH/aUr
         Eh0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746692550; x=1747297350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mimeEgxpLLLBSpau4R5LqHxy90HrqVEPJpvVRXqSVB0=;
        b=SWKq59ppvg76qZKhPPl5EY3KX+FhrdViCygQUzyWm+stTnPtgkAOVwG7USi4OK/2zJ
         MRNSpl5DI5f/GzNqZnYYMEqHbIme4EEbu28uuXPPijZip7mebkgza53p/WLKs/ED7V4X
         qwIJuuQoD3qpuiwyVWzBi6Pbwbvwm5xB7ixDhLS0X+G0BkhllWaN5MxrLXff1IowrNqS
         xKZIDuoPIkEwtF+54SnK0jBDtULyk6qBq0PYBJxPWrRyoqzO/kemjOOk2PyWiCNO6e6x
         3573HErgSepY/he+bv/sYiAYyv4HFytHoZ95oYZgdvkqNxXDxVJcjub2o1Xhx7R0OiAR
         PMrw==
X-Gm-Message-State: AOJu0YwJhieiiEvADq8Z6/Ixf+vZh6uTdX4jzlnjKoh3O9w/WHKVxUPE
	61Hg+DCt6YEBJKdGXYpuPn6QwiANeBaY0uVZY9aXHIIbjNCkR6/YBiWOQclCN3Qeyvlbjhd8/mj
	/
X-Gm-Gg: ASbGncuES0yLHlzpEXZsMEH0Y3zQGKEf6KPO8t23KcRbFNStm0gg1oAASZU0a6FQgz7
	V10bQ6Ucy0nlAt3HkjT7J49e0DRl89fEJF+t2DwVQP85T9u7xrN19oKxnlsjbbklMaOXtbtI90H
	tmIBzvrFTAFHOs1l4181ZkiKQybE7+G8wpLQIRlZLc1gb8oGiZs9pfCSW3N18L7TuuNBUVFNuSo
	zU8tBa7FT+OtV3LQ4R62VvgFAY0q1XaWm/7fkt+W9Cp1ZCjp9sv1ZMKqBQRbw6ag6GhZPGbUAlO
	57ZqTxjE0cZNTUNCruCCiAZOXI6snGaSip9SgPanxLuR3/XxiQ2nqzU/kOj98niUqhBXST8hcDL
	tri/DlVWfLzxom6R1Ep4hSA5/OAxh6P1Zg4aTcaPHqUoq/CcH
X-Google-Smtp-Source: AGHT+IHcA7QydHX9WQFfVC7ZtjQ8Be9/mnnHoybztapFsLeeWUiuanwzBOsdq80SzYVfbDhXjL5n1g==
X-Received: by 2002:a05:6a20:d80a:b0:1f5:591b:4f7a with SMTP id adf61e73a8af0-2148d88b926mr9160923637.38.1746692550391;
        Thu, 08 May 2025 01:22:30 -0700 (PDT)
Received: from kells-Predator-PTX17-71.lan (211-75-10-161.hinet-ip.hinet.net. [211.75.10.161])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3c3d6bcsm10879881a12.61.2025.05.08.01.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 01:22:30 -0700 (PDT)
From: Kells Ping <kells.ping@quanta.corp-partner.google.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: groeck@chromium.org,
	Kells Ping <kells.ping@quanta.corp-partner.google.com>,
	Benson Leung <bleung@chromium.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	chrome-platform@lists.linux.dev,
	linux-media@vger.kernel.org
Subject: [PATCH 2/2] [v3] media: platform: cros-ec: Add Dirks to the match table
Date: Thu,  8 May 2025 16:19:04 +0800
Message-Id: <20250508161334.2.I4b139dfca0cbb20f0c9096a40b47f097f40ec235@changeid>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250508081904.632442-1-kells.ping@quanta.corp-partner.google.com>
References: <20250508081904.632442-1-kells.ping@quanta.corp-partner.google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Google Dirks device uses the same approach as the Google Brask
which enables the HDMI CEC via the cros-ec-cec driver.

Signed-off-by: Kells Ping <kells.ping@quanta.corp-partner.google.com>
---

Changes in v3: update ports
native driver cec is port 0.
bitbang driver cec is port 1.

---
 drivers/media/cec/platform/cros-ec/cros-ec-cec.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
index a8d31c3126f8..81b4524c69f4 100644
--- a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
+++ b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
@@ -298,6 +298,7 @@ struct cec_dmi_match {
 static const char *const port_b_conns[] = { "Port B", NULL };
 static const char *const port_db_conns[] = { "Port D", "Port B", NULL };
 static const char *const port_ba_conns[] = { "Port B", "Port A", NULL };
+static const char *const port_ab_conns[] = { "Port A", "Port B", NULL };
 static const char *const port_d_conns[] = { "Port D", NULL };
 
 static const struct cec_dmi_match cec_dmi_match_table[] = {
@@ -330,7 +331,7 @@ static const struct cec_dmi_match cec_dmi_match_table[] = {
 	/* Google Dita */
 	{ "Google", "Dita", "0000:00:02.0", port_db_conns },
 	/* Google Dirks */
-	{ "Google", "Dirks", "0000:00:02.0", port_db_conns },
+	{ "Google", "Dirks", "0000:00:02.0", port_ab_conns },
 };
 
 static struct device *cros_ec_cec_find_hdmi_dev(struct device *dev,
-- 
2.34.1

