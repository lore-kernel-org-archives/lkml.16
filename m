Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0C320E33A
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 21:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747173237; cv=none; b=bsTupHGGnf+6umnMpw9rcZmm88vxJubXJU9I5OnX2dcOfFvIICUS3ikiO86gjtzydCQyssaQXMYLQUgX23eYfNBENTnw9e71IWEaA3GcTM4KCRBrHFJFlq0L2NzOLwcLBjbLeRGvu8EFDcvy2xE12UqZZBeinJgXkLm6Fld+7NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747173237; c=relaxed/simple;
	bh=xdzDwczN4n97NqtrDQa5z0IlAhOrsZ/pz/wXFFvPRjw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W25nUo+ek40gQG0jaLL7IarbSu5rxpjcfA3eMkYzIXspaXXizMOoRk2c7zFoD6M2EJl2IRwWsbzrRw0VOp50OQheipAiRVgjYT037kZP6frnOFcQYRentVrvWuV1ZI0JXBU51fXV2cr8mOhgf2tP3ongNBArHGkY6LfZmU2htS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=Tvlao9d7; arc=none smtp.client-ip=209.85.166.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="Tvlao9d7"
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-85b3f92c8dfso187187739f.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 14:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1747173235; x=1747778035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MVooGR26bxqbC5iLeacMbQ0G9vLAHRMKZeClAxN+yvg=;
        b=Tvlao9d72prqsHamRCxi3eQhmHzCZSFpAVh3CIa2QS1L9W0WkaiFep9AOvIkvB2cWM
         AWkrGSihHQWREXnXTUVd/SfZBVUawXs+Veq/posY9biajhkl8MuxFnnNFwlty+T4iGWX
         JXJKcLnu0L3ROm+FfKLpm+xRjDYI621Mk7UYCrCHB7tn6GZBYwbF7701ORRvD5wbqp3u
         zwqJxRdz8bQhpzwMpSWnOA0lmAZn5RJr6cOH5hIs21/wqCmxeC0Mc6FgHZ2/kTN+3EtV
         KpR2Kpkjz51PaJmFxefYYrt7tCu72PLAzAoHOlnaSzfU1GWoAnZ4LM0hWv1GinN0k2XX
         nmGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747173235; x=1747778035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MVooGR26bxqbC5iLeacMbQ0G9vLAHRMKZeClAxN+yvg=;
        b=IHu3DYV2Xx7SsWmvigbw7oABjukN0KlX/EVzvq5lDudM3RsJiEKrey971yCaCaIKbP
         jb2oCg3w3qNxJpef8l5ZO7drjAw0tbtqtBtOU9HegVCHdL3WMIU9vwqXSTmHRFRYziuv
         mOviWeNtFQyAUXStwu+fzrK/O2dOVz+Lud2UI3vXoycmcbfIYE384W3zKd+nImqRgI6g
         NMUb/68JEUwpHLAau0QuRVRRBNDfxW8f4RpDNkI4hF9Yex0XZFV272k7tbRl7RMbKC2N
         YRwdIONEYAs95TEP/OvyT3GPdQUwFiSuTNsQvXiIllL8njJg2LFkMfu8k8VVdgE591p9
         mh6w==
X-Forwarded-Encrypted: i=1; AJvYcCUrbE5HEzqkZuYR39pqGZoUAx5XQQ+K9PJdAgOOeC6xNKLSSPXOfemVEnIXXlusKSA6JgCmppxKkshkyi0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywuu76qk+8B+BRMogRe1SEDFQCmDC2SM7PUXclI22oUytHUWjle
	EdlDSnZCeJdiRqdJjFcBCfXCQAC0wdnXcKhc8ArJqR4XQpWkLWftfoSm87Qz1ucN9e2L1okaPv+
	K
X-Gm-Gg: ASbGncuy08Ri2pEfbS9MupuiFCdUZoFFU6rwY4eaA4TzH+q10Cws6M0e8OIqRCXJ5VC
	KPaPNVlMYROkl6nX0LL/x8Biqm1usi37S9yk9R0EARY/lDVHefivwfxPTnUThT1xKfiNs+QAEu4
	OrSmR5wtd6FQGyNXXXI8Juf/7d5jXMm41B3P9waCSTqD1UTqv70c1HWm48UGrNTVU0lMhmUsSOV
	hRaUU/wSxiaj3bSo8o+CW0NhI8EeEKVtJUaWb29CDJS4ozgT3+rSp/H4YklR37MDKNXydlY7eFU
	xw2XEeEiQAMyWYWIkvasSSzhAwqNN2p86n+fRRbTWEz/TNsZhbIbyjC/9jEKq4HiL/iogYBaCYb
	9gLO6nRfcp0hU3OKdiAKIJt0t
X-Google-Smtp-Source: AGHT+IFgAAov0WDbucAa2d2uLkEZNpDggOUKIJvl7ysoc5mJk7YSXRkmxd0htIHYmS45AM68y0mEAg==
X-Received: by 2002:a05:6602:368e:b0:86a:870:67b with SMTP id ca18e2360f4ac-86a08dd24e2mr166204639f.4.1747173235161;
        Tue, 13 May 2025 14:53:55 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-867636e0dedsm239622539f.32.2025.05.13.14.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 14:53:54 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dlan@gentoo.org
Cc: heylenay@4d2.org,
	inochiama@outlook.com,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v10 4/6] clk: spacemit: define three reset-only CCUs
Date: Tue, 13 May 2025 16:53:42 -0500
Message-ID: <20250513215345.3631593-5-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250513215345.3631593-1-elder@riscstar.com>
References: <20250513215345.3631593-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Three CCUs on the SpacemiT K1 SoC implement only resets, not clocks.
Define the CCU data for these resets so their auxiliary devices get
created.

Signed-off-by: Alex Elder <elder@riscstar.com>
Reviewed-by: Yixun Lan <dlan@gentoo.org>
---
v10: New patch, same code (extracted clock parts of patch 5 in v9)

 drivers/clk/spacemit/ccu-k1.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index 1c9ed434ae93e..f9e2200d1fd04 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -943,6 +943,18 @@ static const struct spacemit_ccu_data k1_ccu_apmu_data = {
 	.num		= ARRAY_SIZE(k1_ccu_apmu_hws),
 };
 
+static const struct spacemit_ccu_data k1_ccu_rcpu_data = {
+	.reset_name	= "rcpu-reset",
+};
+
+static const struct spacemit_ccu_data k1_ccu_rcpu2_data = {
+	.reset_name	= "rcpu2-reset",
+};
+
+static const struct spacemit_ccu_data k1_ccu_apbc2_data = {
+	.reset_name	= "apbc2-reset",
+};
+
 static int spacemit_ccu_register(struct device *dev,
 				 struct regmap *regmap,
 				 struct regmap *lock_regmap,
@@ -1121,6 +1133,18 @@ static const struct of_device_id of_k1_ccu_match[] = {
 		.compatible	= "spacemit,k1-syscon-apmu",
 		.data		= &k1_ccu_apmu_data,
 	},
+	{
+		.compatible	= "spacemit,k1-syscon-rcpu",
+		.data		= &k1_ccu_rcpu_data,
+	},
+	{
+		.compatible	= "spacemit,k1-syscon-rcpu2",
+		.data		= &k1_ccu_rcpu2_data,
+	},
+	{
+		.compatible	= "spacemit,k1-syscon-apbc2",
+		.data		= &k1_ccu_apbc2_data,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, of_k1_ccu_match);
-- 
2.45.2

