Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0FFE78F2F
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 17:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750958918; cv=none; b=OyRYhHeHPXBr6Fc9cD2ycDRPzbFaLIWcKhs3kMiehLgGuGqAMVHCLsDD0o6heRgL/J5oxKHUHLBwyTYvvaysnIOtuNH9UpicrdAP6V5lkwqA/p8yreJBqzB16XQb45zOb9vst5W2Y9xIRVH7jWfUVcxE/icDFiYb3dEN1pZwTHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750958918; c=relaxed/simple;
	bh=Dw55nTGrdSb6zQJwt6tKEjDRNKdPGjt0CyJwyUjkD/g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bbyCMlASzJHE7GEemS2l9PfvnWLSH4PrjTqkhx9JR+j2iqi/rrWMdicvZXA5hedcehyu8l1s1jO4Z4acKiBjfkHRw6GyhNh1ZAAW3vO1x3VeFpLLYGbhIsf161abFqdvLI+12CEYOWsI/USt+ssa225pGgoVfzfRxo8OY1dQhXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kpj4jjSj; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kpj4jjSj"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-748e378ba4fso1753114b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 10:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750958916; x=1751563716; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+FCpvo0yHlUbB9hjq+FKLkw4QegdtBsjGvkX+waKDyw=;
        b=Kpj4jjSjR7PuU1k2UOHn0sN+opv096ALzO0SReHL1rXqCFUbUge5YZu1CcbS4l+mX4
         qkhX+xoc9nOYO2OOOMCME0C5G+dpR0bq66zITdJr69XCl9742FEbn3sAL/NISUV5u69x
         eowiIv5rbtKfS91LZYhGc+Ta7iW6iLpDan1Ck57xay9iuHbtRnNjFLleoNfwAvGTkZTG
         25RaL4UcjA8fQRwu1u/gDkKbIlyiX5hcuRHWNX/rHlVNVWNfEHIVN2tidES+RQFoOU28
         gdIRmGOAtvavhlu5yqq64zxbXJJmfKEV6Zr6/3K5pgWKgIlaueVNJPBAB3CRzNsT3GzJ
         +aLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750958916; x=1751563716;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+FCpvo0yHlUbB9hjq+FKLkw4QegdtBsjGvkX+waKDyw=;
        b=uGp/ld1mbKttxeAX+AnezG4RodNSdDGr/66EZNqP6OjKjpLlU7/NZwPnpB6jx9kn9g
         uXKsPuNEjPsPlzFT9DlcndiK1tsR39G6KucQkdcYcEcEq7AjigcboUqdcZY2wMLdmCu4
         tY0UvHZ63NoOuHJpfO/X5pNq5tL5gLIXh92nkWBuFAthERIkBeDbr/vdsXRKjyJtKwvR
         oMlFyZkiNC7TA2YVZp29AANdVe+mMjJe/exH3ddPfNcYT44bXMvpXSbFDFehwC1W+a18
         mCcYPPIF2W8NCxEVUbnn4mbk5iqkVG7ZVF7y2d0cChDSnlIvcoXNqTFIqMlKfSYXISDy
         2nbA==
X-Forwarded-Encrypted: i=1; AJvYcCVC43AXFRuty6ulF+DGTHU0YnIFhGF//kM4Oa9WudMQ6zRWfdECeAc1BkpaZbO9X8Tc51U66VaqZRrAnic=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxr/4hQExvfjgGc4jm4hReoOCkvRIjUUnX2SzhYubB4Yc87jxp0
	LFS9JfMBdX5PrPhQxpwe+tKJNEluOcQuiQRTQPK+F9CSoVu+RvxKdNsx
X-Gm-Gg: ASbGncv+3x+20nCexRnMRL9TP3mEu5Y3g3IRrDOwSbGTjF3w7Gb0RqJonOHW6xdUAFj
	TY6R2ftUzJii/RhZlupaw9teYovyCC06jDOLoWcIOVEkHQUBU4LhWUM1Pej86TcMbnSLd9zui5M
	3oyPoKleRsn938sl1nJGwHTzfMBxdedel9MTEW8CV/tTsbNbFAh9d85UhARu4+RsXPSonssGIhB
	SbuusCZoZYENJltM+75ohC9JY4mEv2dHApN6shwghnCE/rr83KXkzad3YmAznz1pNULv6f/zSCz
	kY2fnN0eP0IecSbkeZivR5VmaG7TU5SDwlYYWBfnTNRw7Q48B69fuuGF64x5ILLC/N4VkZoI6JT
	TmHl02lmthfHr
X-Google-Smtp-Source: AGHT+IExLLxI0PNX371vhzktoNpB3CmiY3qbJrlzRBmEWFFYvIqt6hTJBEfiWRa5c9m79isIAweYYw==
X-Received: by 2002:a05:6a00:1302:b0:736:43d6:f008 with SMTP id d2e1a72fcca58-74af6f40a01mr50912b3a.12.1750958916146;
        Thu, 26 Jun 2025 10:28:36 -0700 (PDT)
Received: from localhost.localdomain ([49.37.221.186])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-74af5802d46sm203269b3a.180.2025.06.26.10.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 10:28:35 -0700 (PDT)
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: broonie@kernel.org
Cc: Abdun Nihaal <abdun.nihaal@gmail.com>,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	tanureal@opensource.cirrus.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH] regmap: fix potential memory leak of regmap_bus
Date: Thu, 26 Jun 2025 22:58:21 +0530
Message-ID: <20250626172823.18725-1-abdun.nihaal@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When __regmap_init() is called from __regmap_init_i2c() and
__regmap_init_spi() (and their devm versions), the bus argument
obtained from regmap_get_i2c_bus() and regmap_get_spi_bus(), may be
allocated using kmemdup() to support quirks. In those cases, the
bus->free_on_exit field is set to true.

However, inside __regmap_init(), buf is not freed on any error path.
This could lead to a memory leak of regmap_bus when __regmap_init()
fails. Fix that by freeing bus on error path when free_on_exit is set.

Fixes: ea030ca68819 ("regmap-i2c: Set regmap max raw r/w from quirks")
Signed-off-by: Abdun Nihaal <abdun.nihaal@gmail.com>
---
This patch is compile tested only. Not tested on real hardware.
Bug was found using our prototype static analysis tool.

 drivers/base/regmap/regmap.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
index f2843f814675..1f3f782a04ba 100644
--- a/drivers/base/regmap/regmap.c
+++ b/drivers/base/regmap/regmap.c
@@ -1173,6 +1173,8 @@ struct regmap *__regmap_init(struct device *dev,
 err_map:
 	kfree(map);
 err:
+	if (bus && bus->free_on_exit)
+		kfree(bus);
 	return ERR_PTR(ret);
 }
 EXPORT_SYMBOL_GPL(__regmap_init);
-- 
2.43.0

