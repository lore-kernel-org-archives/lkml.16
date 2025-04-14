Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7953128F51D
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 19:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744658251; cv=none; b=Zv5TxZouMAVcImUOUgVbZILxyogTL9a0siCcwckWbb8yQ9KWU5AgTaN7P7UiQfFkhrIzgEp8J0f5nqdBkCx2xF9AdUk3rTGefgbPKO4X4wT3AXDcdX3clrT94/uDwP2vnuPY7Nd32LLkHbwsCMIo7DRaJqv3rHffX8Otu8IGd4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744658251; c=relaxed/simple;
	bh=VngyX6/mQNFodLjeygVOszXh7E8fNJcmhtKdA0Y9TqY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hE1aYXtliQ1tGfXRceJ1B4c5kZvHqaYcx2y7ovyiYPGZh0qywWnGNm4016n0JvvfSqQ6n21MmsBcfzLGxpNZzwa44TN7Ah735UXvU3s9lA3o1ohl0WUe90cRUGbFofsJ5/dnRpUwB7vQ6XvkthTC0N9YA+OiPy2kcVQQcv3Ra5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=xdLh4OXv; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="xdLh4OXv"
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3d46ef71b6cso39949355ab.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 12:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744658247; x=1745263047; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gDT0XH54WFDdqavzCUnk8zHnVq9DAgWjCd2zBxfaNdY=;
        b=xdLh4OXv6IuZq8hx0LyYkwRWPToblne6uMxQtC6HHsQb2tzuTfoJvEi+nPWfURVfPU
         AD4fMCE58ioyuCqUYwt5BvQllruqYlAUasJykcIj715u4GdzhXZqvPtUfdxUfyzYOZvC
         nTxKwUc4De+d/NiKB40wJhS87ZImv4qVMQ+JK6qFBC38DjPJow1lDOtP8WB5uWwlEQEM
         seZRqJtSD9zPULK9q8Ac0bqEz8hf5+w+kSjc8S/S7hrs7YC8SIXu//i87qXgCla64R5i
         J2YCTcB3P1K7J2n2/HQmgGrXvjGivJ+g1f8+hXgmyjp4RO9KczECxv/Kk55sqzCJJkdR
         WyOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744658247; x=1745263047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gDT0XH54WFDdqavzCUnk8zHnVq9DAgWjCd2zBxfaNdY=;
        b=tFPIM86efact0DgH8okBZw16zOMghog/6rrL29GmelMOwpFnhpWqC8X59ryX7Mosqo
         tW8fnfb8Ae8GKcBC3DP3/9hx0JvqNdeiAg9KyM5JL95Bq5Vcac8B43F9LuVrUqpDyanE
         I/+3r5MAoeyvNXCoKgWb2ytmech8IKpK1etRmFiPlOSB8dQQwrX/xap97NfpaHQA2MuR
         B3UkIC065KHyc1fcJ100damCxI0X0zZnA04bOiZBhMjJTe33boyXNxFkQQlLsPvNKZrD
         qwB+If3zt/uINASOJgzs5ZtMRtt/eyQ9ghq+XypAbdrDU2DnTBd+QsXqaYqBeMuJGfCv
         gRhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFno/U6T1WF7ugiHo1YCDiNmHbh9OaxixNrFVS1nerfQU0VKvciyDbWsrx18JYuRQLXMOtUh8gh2l3XKQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxduASpfoJGr2PiTUIDkDMZc7QImCkgURm1eAnqL2nuhtrFP7ZM
	pw1gthg/eubXXrkyTjjqhCpuYuiGhdFbDbMiTs9PAkiQnWium/1GbKB2ImC1sC4=
X-Gm-Gg: ASbGncuxOOGFXBU7jwuPQfdURRMS2LzPpgAWrVTfCnUdaIhaxybvYunWRFc/ND4u5oh
	w+dCFsvoqSeE7oIClP7nrsPQo0dcuvEAR92fXYrlw42aUtdQLZoQOOOu+GhU+06rtwqDFl+6sdn
	D8A6CYA+BRz5530tkmNfVg/vCr2A84Gd4/iUPiZzR4YNdWiZpw/siE2OD5MVkypyTzyaHSzdICX
	sV57xKVdKfTXf6xGoev83P0UEoeUovegVSW/GKtS/CfZP/cVimgATzi0vbdeBEe7Mc6UdtFGHCT
	rPJ0lPGWeEMoMmBYbJcAch3k8ekVmPvFcG9ei8kp4j9FT5qXYT12S8DobQMyoFx+0SV5gMZEA11
	BQcMp6JEmPWlbmQ==
X-Google-Smtp-Source: AGHT+IHJnhTbYGz+3fsC47NWjJwKIj8trSko9MC7l40QBwUPgSKgLh4fWO2GzddHNuwBXhAUnso6EQ==
X-Received: by 2002:a05:6e02:1945:b0:3d4:2306:6d6 with SMTP id e9e14a558f8ab-3d7ec27bd0cmr159074725ab.21.1744658247528;
        Mon, 14 Apr 2025 12:17:27 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505e026d1sm2715662173.94.2025.04.14.12.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 12:17:27 -0700 (PDT)
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
Subject: [PATCH v4 5/7] clk: spacemit: make clocks optional
Date: Mon, 14 Apr 2025 14:17:12 -0500
Message-ID: <20250414191715.2264758-6-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250414191715.2264758-1-elder@riscstar.com>
References: <20250414191715.2264758-1-elder@riscstar.com>
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
index 09f101a52b1af..7494c97c3c7ec 100644
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

