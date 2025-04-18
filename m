Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563A51D6DC5
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 14:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744988060; cv=none; b=C90gLVAlcL7h8A2tnju8vkOk39ePj8VWg/qeAXVmRSQvO2IMPzMGdfY8oEzgIKXTigRw1rdzGXvpb2QhNBfFe17qwtTwIp76r9Obs4/VJXC5bkl50NzH3G80+91FVGO5h8v2dveSbI6iOz4JxRL57Ng7As1PSMiNAExPVfJupx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744988060; c=relaxed/simple;
	bh=WK+79Sgay1nnVSQ9s+Gs0FXqatmC3OKXtMgoy/+gdS4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LPGDPiiHvyAzIrRJCwrh692YL4jFESyYNgkNHJLaVpdNc7UvNXbPnTXhfp4w2KqkTjjq5/cPmQ+OCMzznkErhO8zvt8c9JCB3zKo3xA4u2vgS1jLr6IB9wOA8VVIRIkjAgWQ5uJuxcRUP9hKQfy2embcIFBJAjd001W1XRB67Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=STm7cRqg; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="STm7cRqg"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-47663aeff1bso19327781cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 07:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744988053; x=1745592853; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q0cRJZr/QLbnC//i+6RCLRRi6tJxaoAhZJAaalWswhg=;
        b=STm7cRqgbzXsEmmCdHD0H2UWql1TmtLnFvK//+vMkrOEuOBECtQ5lD0jN2FiNVVsa3
         Ey0y6CygPY1CWrRJtlpUY1TWoYt9izoatFX8pIxMRlw1AvqsJNAaZF0J4aqf5kam+fGP
         sxuj/wkhtaRS6fmYKwd+cnnc2FenvrMKr+RiY48C17MO9TVzvkQVnGdXhoS/thiA9oiR
         wf5lQB6tNHX3IK50AbRFP+0p6AFvSOaZqHz3/79CmO1x5jldfyr5H8cXmyeBWx7uB+mU
         0RE5+z/oRj0lCJap3cCKvIQq3DnUSvMcTu/1RghOoY6bWj3+qNmtvVU/jBQbqUTJYbpT
         vZjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744988053; x=1745592853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q0cRJZr/QLbnC//i+6RCLRRi6tJxaoAhZJAaalWswhg=;
        b=gNDyxbnDp4UGL1yk6FEi5zBgykt3aVz/b0O3NJlA1kRfX4CDA2jsUXUnBqHfWKMBzE
         XOyFFam4H5C15gF0wCoK4NsdbN9b98GAig6wpaqeHSZgofr2JAJbj9+ZcZWJC1vtgveB
         r4gUYGU2Ijjzv9nE4EzUCVXfVTBVhXoxD3DRF5iCdRc4pL2FuRN54YlIcJnWj5mlTxWz
         idIVavZ5vqYKiwlMU5ZlH4d3sScEuKnaTE3dRt0WI5DGNJEeYg0qkiJhhZC6jraIg6NU
         vREfBg5CESMvpU9oUjr9zPDLaw7W1PLvLBUEhf3UIkcxZHoaEo4h/JgAQ4Hbllgf51Po
         Dvhw==
X-Forwarded-Encrypted: i=1; AJvYcCUwd/Ea+ahW7dNapPbrnVf8EOHYnZEUn9P45wFgImS1isDhfFTWQMQ6JJbGBmrMSsY6tKl/HqtLuyH35UY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzY2Kv3G8QpUHqjmuJWmkfoFiDiIxEhA/dK8kMmfvd3ghLOdQJr
	6Fb+Fs1RvwwKIi7kia/kP+5vWvB5aZJ81FkHErKesRU+jEDk8uHMMVo82jFUma0=
X-Gm-Gg: ASbGncvUMmRy9xVwAn01HrKkCozNORKUTXkYBOLu4DKfc4wxi89pzLBBRW1JvWKh3Pm
	tsY9IHoPjE0UtLjf9wmGdY6xsncRzORXje+0Zj76doB9/C3yIF3N6PzF4WCydwoYbY+udAghyC9
	26aNf2DNpnDAKwneU79txbjvmsReyFSUNtWLke4MDbclc7vPQBOQteLPuq46lzEE79ax4RvtpK2
	dmB60JZhzSfm7yBIQpWD6ZcVHRHeyih9Ey5aoQEEMKJ0LnS7RPVWu7kht67wpN2X+ZwYpXVSRcf
	SCXxVntMIX+e9M7p4agLiDWxiKN1MITb4QbZGHQ0tgAACUomnaZ48pR2jySyPJ+9FwDIWqP/YJF
	KTIhUZmVv1GRVVQ==
X-Google-Smtp-Source: AGHT+IFZ0pFYNx2snWn3YpkMMZYSR9nF5fcb5GLtk7fhZ50PwkaLo1+AOy6UlMO++lE568O7vJ+T8g==
X-Received: by 2002:ac8:5f89:0:b0:477:4224:9607 with SMTP id d75a77b69052e-47aec3a6358mr42212621cf.12.1744988053257;
        Fri, 18 Apr 2025 07:54:13 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47ae9c16ddesm11329201cf.3.2025.04.18.07.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 07:54:12 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: p.zabel@pengutronix.de,
	dlan@gentoo.org,
	heylenay@4d2.org,
	guodong@riscstar.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	spacemit@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 5/7] clk: spacemit: make clocks optional
Date: Fri, 18 Apr 2025 09:53:57 -0500
Message-ID: <20250418145401.2603648-6-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250418145401.2603648-1-elder@riscstar.com>
References: <20250418145401.2603648-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are some syscon devices that support both clocks and resets,
but for now only their reset functionality is required.  Make
defining clocks optional for a SpacemiT CCU, though at least one
clock or at least one reset controller must be defined.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/clk/spacemit/ccu-k1.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index ad5f41695f8db..dfc8aa60d4345 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -1218,6 +1218,10 @@ static int spacemit_ccu_register(struct device *dev,
 	struct clk_hw_onecell_data *clk_data;
 	int i, ret;
 
+	/* Clocks are optional */
+	if (!data->clk_hws)
+		return 0;
+
 	clk_data = devm_kzalloc(dev, struct_size(clk_data, hws, data->clk_num),
 				GFP_KERNEL);
 	if (!clk_data)
@@ -1329,6 +1333,7 @@ static int k1_ccu_probe(struct platform_device *pdev)
 	return 0;
 }
 
+/* Match data is required; its clk_hws or reset_data field must be non-null */
 static const struct of_device_id of_k1_ccu_match[] = {
 	{
 		.compatible	= "spacemit,k1-pll",
-- 
2.45.2

