Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51B935958;
	Sun,  2 Feb 2025 22:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738535036; cv=none; b=SXLc4V+gJj95x9GIP9cLPEyfpHLjDlXBpcoInkQzaRvGsgWLN5M4oPpHJbS1owDAsYpTTb5GRh4FvyD0SHP/Aav+yXU5J20i2ixyq0FsEhzKZwVIUlLD2F9L/369xXJ5L1i9nZa93GrvSf7RoKbZ7In1RL810rM3SOsgDU9tZug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738535036; c=relaxed/simple;
	bh=UoYB/trv8Iol0MuUUKBG5qPWot2+WIDQonMIAwMDczI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eAHTqbXpGvVwsleiAVBFC1/8JbDiCRM6Y0ujiBbv2sfd9MGsxdqH9hMf1enuGO+laIC6fRJalfcQxiWTqu8lraAymBF3MXEmZqF0y9a68Bv8ybsI7DIEk5MoNQvUcbSfzXx2A8aChK6wSXidBGOG+AU+WitmgQeH/gAEtySTPOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jH3YrXw/; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jH3YrXw/"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-38be3bfb045so3209394f8f.0;
        Sun, 02 Feb 2025 14:23:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738535033; x=1739139833; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sPge7hJBFTAy8hBIjP18QmIC3VRabllYYNmaNi1fIfE=;
        b=jH3YrXw/d4K/5wG9XYEOtIpZN5Xiniz7sqqRr6Lor0JESvfDSGh8rY4AYRrGllMQPq
         3g11QvsTg1HsHPa0g4JeFGZzkq0iyIcoasaiW0ZLPDcoMjK8ov549uZu2Tcgx4ICHSR7
         5VGm6ITHaAHFCDe0o9NUkzOs99WID9vNJVSfWn07J+mQvFPfZ5fgWYdg6TCJOtzjljRc
         reqnAKjiIyyjQd9f5spTNm8wvyhctv/NTM1sc19cWQWdv+/xd7lklmZMnTV/Vw0AeSSZ
         tHQejwRgoQeeSjC9LXr16q4H5j6eVqawrDjnjJT/0l8eMYQF3Fxn3DNB2FPCGF3k0wnw
         KS8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738535033; x=1739139833;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sPge7hJBFTAy8hBIjP18QmIC3VRabllYYNmaNi1fIfE=;
        b=PahbjMssquQ1rkz4sP9q+C6pFNnNFarihJH+HYgbqGla2aXrG9lP69UCgqgT77txao
         AT8OzX99TwpU9uLnN8HnQB49IwafWuE7tgzBrFO3aCbGuzPtp1kiUjcCoSDo2PRreOnd
         hYn7/lgUO55IttmuXGVWahIX5zM/KI7uj4evDNXfpxV7yGcC5CHMVMtZGDnTTUuaK03m
         1lb/+0hwC6Gsorye+CnbD/Gm9CS1VVtikzhiXMry631aMetnnnpUwh7VSM4kWy3lnm5k
         2/SRtvb2uMg7q3hYb6T7PSiEHviVS7cnFXV/bYfyVIhOy8LmEn//vNSt5LjTniP+WZdB
         vvQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWB3pSuR/lRQhHM5Wl6P7dCs90DG0KCxTCATpO6UqprbCB+wZqSrQG3CUaa9rNbU6Kc+wLEYXOT91Qhis0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlCpdRrejfNy6/HR7SsrfhL30oBKSHaNObmn8rQjL8PZSVaCYO
	n2IFyFEt4KG2z95mwvvkZzZqFi3ZPL/gp72aw4PaW8we46qV9KBa
X-Gm-Gg: ASbGncsEqPA8qLHLMiqyQKezitc0PbfMUDdFnANLzSC9tA+ug4BdLBtx0ExFD5l14az
	A9LeQcQ4CV/XvmKIHNlVinwexTnkywsOoeqUcrPmE7fv6L5AEeK7sLdxPgDAmuwe5uUdDzV/Lno
	Wk42nDz9fu5fwz+xLhZTG6N2NbMN46xhm1Wnjof3u8HHZ79HnY8n0RNpBW0IX0PSjzw/Lt53hSI
	Jx+kohH3fDyKZQdEwXjeK968yzn9OkRYGzRZkQXPOxjeMnWCwpgxQp832f2IrtzSLPSQaSRDeaz
	D91v5DcAwzjofojC
X-Google-Smtp-Source: AGHT+IH/tpk9RnrIW9+0s11YBZYVvfLmwimUPLX81tuS00v0OW448Pt4vmuq4BTCKHLaa/cIy31fOQ==
X-Received: by 2002:a5d:648c:0:b0:38c:24f0:fc28 with SMTP id ffacd0b85a97d-38c60f027ecmr8109970f8f.3.1738535032819;
        Sun, 02 Feb 2025 14:23:52 -0800 (PST)
Received: from localhost ([194.120.133.72])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-38c5c125f77sm11119999f8f.56.2025.02.02.14.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 14:23:52 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Huisong Li <lihuisong@huawei.com>
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] soc: hisilicon: kunpeng_hccs: Fix spelling mistake "decrese" -> "decrease"
Date: Sun,  2 Feb 2025 22:23:27 +0000
Message-ID: <20250202222327.201958-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in a dev_err message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/soc/hisilicon/kunpeng_hccs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/hisilicon/kunpeng_hccs.c b/drivers/soc/hisilicon/kunpeng_hccs.c
index 8aa8dec14911..828ec8fec5d7 100644
--- a/drivers/soc/hisilicon/kunpeng_hccs.c
+++ b/drivers/soc/hisilicon/kunpeng_hccs.c
@@ -1476,7 +1476,7 @@ static ssize_t dec_lane_of_type_store(struct kobject *kobj, struct kobj_attribut
 		goto out;
 	if (!all_in_idle) {
 		ret = -EBUSY;
-		dev_err(hdev->dev, "please don't decrese lanes on high load with %s, ret = %d.\n",
+		dev_err(hdev->dev, "please don't decrease lanes on high load with %s, ret = %d.\n",
 			hccs_port_type_to_name(hdev, port_type), ret);
 		goto out;
 	}
-- 
2.47.2

