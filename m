Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DEC71AD3E0;
	Sun,  4 May 2025 10:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746355587; cv=none; b=G8l8ZUpsYyYZBhelQiQoQtPk+/56v5FqWL7ux+QjGPp29gf8/5934hS7fd7wibh6dij/7ICQm/FUDgMy27ssUZ2ON6oW/iTgoWkyvy30+mp/mFnoANNrfBRZS+KgmZ7rJwrwM2OA/iIpgzLuxB49KkIx2vKaZkhWo/5y/CeyldA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746355587; c=relaxed/simple;
	bh=KPHrhHOyAQI630w7PvZZOGe3oBE60celgGMAIXnCCGI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Co1U97Dk6eJfnQc/OCWTHoDB9vNSSWzCecGxCgQv95q2o8LdLtjqPClw7ihILjbNPsk+smcFXQBpSH8YbDKHQmYBvu6nCFXHQ1XdywPDlD5YZjplU6UlCOgdTg5VDGzJ1WYtXcJqv4LM028ca1kJbka8O3/mFPY+OfFOJBqqoDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ngHrqwSK; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ngHrqwSK"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7c5a88b34a6so378663685a.3;
        Sun, 04 May 2025 03:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746355585; x=1746960385; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=luBGFn+jIcsRlGss1jEDVQja+DxK9mYI/muh+oug9tE=;
        b=ngHrqwSKakAE1BkWnZKL40tS4JQUUjURu6/IMCibjwySnlLTISZcI99cYGG9XhIV0S
         Z50xBfvSc8yf3e5wI0g9QMPb3mjowNeYdw7XEA2d3mPMn/TR1shuiTuWBWUweYjMP9A6
         cyeX5OGJh2cK55xW18BLOrXwDnkrdgo8/zoFVyWD96qeIpof/OSPVrR+yE/93SIXGq+Q
         6Y8wEA1bXkSJsXJigRJB5sQuM5vHw2e8a0hGFcqunRTdcxGMrbx1ktHheIxAOZqNSxCd
         QqtnnVi7pCBwXp8rur4cdUr+r3ZxxyG/k3DeRNc0vZ6HHAnqclKGsgLGJvzSNMZeck1e
         0CUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746355585; x=1746960385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=luBGFn+jIcsRlGss1jEDVQja+DxK9mYI/muh+oug9tE=;
        b=Di+kQx2sNBw/gWk+XaNXt+yqtvs7AbW661hmFBRXdo5UeP7NAM5SX1mRPhYOkpcvM/
         va4WB5aL5ij0r1j/yzlaOpqfmgQVxDH1Ch9XLR7Vx2PBlgplPx3bfG3LZRu9N50WEiF1
         Pu6pl7l4Gaub+OrPsvOniEQrRS6vzPNtSf7rErGeKzcmMn4uZ9ktoWGJcWmrm0WcOwex
         t/ZMga+a0Vo76J7gm9oePaqvr9RqPmsRnpldOv9QFbcHL3fvNYSsJhM/ml4UpXU3Tvmu
         pTmzyb08X7Jd0FpXMTldRiht0HRo8pTlDJf6HLuQPrH0N3vMWnZbPZ+6sAy7ZXPck0MX
         d0kA==
X-Forwarded-Encrypted: i=1; AJvYcCUkZcou2F1ye4IWh2wUTizU1JoekXLm7qN/2dQGNnP0xuZkpuR7vxr6aGSD8Iuq/85G/XIZhk92d7OFW5tK@vger.kernel.org, AJvYcCVzO8EDo61mZ4rgmg73I5Ur0v9tVdOvHQTPeMokRs5yww4T7edmO5Q6bFPtlJoAbgpGCMEGt8C1byHt@vger.kernel.org
X-Gm-Message-State: AOJu0YxbinA1f5qTXSwYrZ8sVCzOTUOsjKgUSnvdRN9FTn5XwoPzP5sa
	ApO9pnaQhyMYyfHZOt5CDCcXAnb8074cHusWsRXKuUKoYMLIpkZ6
X-Gm-Gg: ASbGncsP6kRaBRcHzHlu+uyM8fG89CQ1k4D2ShSah40QaSpaCVzus8WQiIOADwDM7/6
	ZbJGskJCAzeReuPcD02mIIFjfc8RRJqYAOdnlRiVxX9pC43rtSS1wCD+XRKW+iQ0Bt2+e5HTKFZ
	CNk46fh9QNcLpoLM5+2LJexpXvQBplZwq3mhPpQsNw6GGs6F3UIRHVXFbUZvz+iGC7y/lwy2dRx
	qjUrRMjicRJb2jxiW1EAEbNrqnPwSaqgCWPscfI+YR+2glUiFjdigMJU2pwScWt08xVz+qvMlyQ
	w9nbM/Hi0ssIN/ZM
X-Google-Smtp-Source: AGHT+IHc6JO110pytp4DT/Eq6cAK4dWSNom4k7fdULVNjvMMCHikTESlyYH63sW1mFS6wQgaea6AJw==
X-Received: by 2002:a05:620a:1aa8:b0:7c5:5670:bd6f with SMTP id af79cd13be357-7cae3b0a352mr510352385a.53.1746355585056;
        Sun, 04 May 2025 03:46:25 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7cad242b587sm429752385a.77.2025.05.04.03.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 03:46:24 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 2/3] clk: sophgo: Add support for newly added precise compatible
Date: Sun,  4 May 2025 18:45:51 +0800
Message-ID: <20250504104553.1447819-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250504104553.1447819-1-inochiama@gmail.com>
References: <20250504104553.1447819-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add of device id definition for newly added precise compatible.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/clk/sophgo/clk-cv1800.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/sophgo/clk-cv1800.c b/drivers/clk/sophgo/clk-cv1800.c
index e0c4dc347579..a4116ac1adcb 100644
--- a/drivers/clk/sophgo/clk-cv1800.c
+++ b/drivers/clk/sophgo/clk-cv1800.c
@@ -1519,7 +1519,9 @@ static int cv1800_clk_probe(struct platform_device *pdev)
 
 static const struct of_device_id cv1800_clk_ids[] = {
 	{ .compatible = "sophgo,cv1800-clk", .data = &cv1800_desc },
+	{ .compatible = "sophgo,cv1800b-clk", .data = &cv1800_desc },
 	{ .compatible = "sophgo,cv1810-clk", .data = &cv1810_desc },
+	{ .compatible = "sophgo,cv1812h-clk", .data = &cv1810_desc },
 	{ .compatible = "sophgo,sg2000-clk", .data = &sg2000_desc },
 	{ }
 };
-- 
2.49.0

