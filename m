Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837312737E6
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 11:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751370960; cv=none; b=Xt+Z7nCSyd77BAnXVU19xMpSJ8Uh7QBFWx1bRXote1phQQ4KVuKCWh/MBrScNBBgOpyNrHIrmtTQ/ASWo3RBiPjDihBLqry0FkbjPuCX4clc/zUkQ3C2gbowCqtKpCmYIX85NfR4FssdfjDYRGJQ6FNHMjR9sIc6XnhwcRQJ/qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751370960; c=relaxed/simple;
	bh=HBuZpLBJ5RSg88Met8XG64QvYfQiGI2Vzk4PuKhQxr8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AGXnXbLgvfQ/ibokAjcj4ygzRJ1HmRUAcSRstKcvm+8y98aHTB6u1+RODqH9YTYXzRo8XIULFnHd35dVfMi8AXaz2DwX1PVSw9PaZNwnicBvSFx+ZqFoCW3MLJyNJw4fBXgAbtABO00zY3ablSudT9BsyXU3pC6jjvEITfiJoq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rp7CN8Kk; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rp7CN8Kk"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a524caf77eso827605f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 04:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751370957; x=1751975757; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0crR4urJGV/Fg0thNgQt+VQTmzooZUpBcqRvRqhXIEU=;
        b=Rp7CN8KkEcwkUOF1nD4HpUhp7qlA4b4G7Cr1UnZGeXqtIILnD6WXw/34SD/ZMChWnL
         1VJ/MJFjQ+8UP2mriIUmLuuJBkFUlhBXd8KwiNBPCfB9F9qZUljkL8aWR6LoSU8vw6Fa
         KnfScSjhvV5CMr0tHn+JDzw0nOSCfGiY+L+fttmtUYFpWXFWDaF83+ymjmOoNLg+ybQu
         kLZaIPXkJeadH2s9hqXCSLsTFf/xSu8/YU5ajPXZUU2mTlfeZnTFjcVWAyuR/xxB7Dew
         ox9k6NnH066YOrJPsOvzJJisjJ2q9mr3CqZfE6qSTxt4RNCDW5CPNQQu6R6IE1X4KqjG
         tpRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751370957; x=1751975757;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0crR4urJGV/Fg0thNgQt+VQTmzooZUpBcqRvRqhXIEU=;
        b=p5tH4lryEf37GhCazWxT77UBXxAagsyfn4OXWnsf4ATHTraTBfz3b74uK7UFL7DLVB
         1Q0xC6p3g0Zvl+MgHuSiIHu7/JfvNQMlyLngMgtwSOcpYA+KNHYkh2o/Zor9NASqIpyG
         TG1XFntGdc09Cc8JYla/n4cjHx3TOwPKNXqV32FCLp0WpAfzaKcpQ+19hAvm4fAksyeD
         qIPZxux3GusjVDBHqf86vobj3/2WFR9c6jTWirWxUzILCzkaYw+DTAerc9QfQeSqSNG2
         YA7+6FqbWPQDISQCRbgm+F+o0ZojoUCnsESo5wOBSERFHc5nZ/r4Pgnt4BO6pW7lCJOy
         xrNg==
X-Forwarded-Encrypted: i=1; AJvYcCWvbBZnVCp2dS3MPXXq2PAqUpcxAH4QouyRpbtavmYe88oIzUR9lqTSvzjompapL7/B0GKkD4TNJcjWqBo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXGcQlGvULQMk5q3bLNlK44n+GqZkq9FjAtU8/Yd9i7QzCY/VH
	7QB7ahR0ws50O0Wkg83kN+FmOXP4FdTSlqC3yPa3ob5EnfXIKTwyjruDyVRByyZO
X-Gm-Gg: ASbGnctLGFSQnJRkPRzrIZ5gFrAwFM9NYfe1hb7aUZKkmwLMmuq752O0Dw3wiDwZowr
	Uz0gmdXovfTkhmN4Rm6jjVk38ZqekOrYHFTG3sqFOp2YTLmIaWoIik3CTjTGiOIvqPST2jU5hsO
	dwoVlqMK3Gn7tbyclcnv8pQNGRBUU8uzQCTEwrolpM4cA5e4IZ8h3yDgtdcn+QuSSXhPw7tmBLQ
	A/QKmT013ol266S5U2YdBVTnPFzSVT+Mg3N7OKHuLCHHHEMxf2xa6jwyq2nXM2NvsRpRqMsr6QH
	5lCQCt7A83Yhel+E2g9DiF4ACCR0CFjwOOZJ+tn+WCR9PdEkeGKUkvIBl68iVE9S6qMomqkDt8S
	JWpDsDdr4h7piOVc=
X-Google-Smtp-Source: AGHT+IFUgOwN6HRPQ2oh9QIMJWDgV2scfdtq+n58TvAbFdfbar7HSe8AWWiZ661Tf2jpQCOod0aXag==
X-Received: by 2002:a05:600c:1c20:b0:442:fff5:5185 with SMTP id 5b1f17b1804b1-453a8151482mr10474815e9.6.1751370956326;
        Tue, 01 Jul 2025 04:55:56 -0700 (PDT)
Received: from thomas-precision3591.imag.fr ([2001:660:5301:24:a723:4386:e2f6:bd22])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-453823b6d50sm196398295e9.30.2025.07.01.04.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 04:55:55 -0700 (PDT)
From: Thomas Fourier <fourier.thomas@gmail.com>
To: 
Cc: Thomas Fourier <fourier.thomas@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	David Woodhouse <David.Woodhouse@intel.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
	Vipin Kumar <vipin.kumar@st.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: nand/fsmc:  Add missing check after DMA map
Date: Tue,  1 Jul 2025 13:55:15 +0200
Message-ID: <20250701115519.30772-2-fourier.thomas@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DMA map functions can fail and should be tested for errors.

Fixes: 4774fb0a48aa ("mtd: nand/fsmc: Add DMA support")
Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
---
 drivers/mtd/nand/raw/fsmc_nand.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/nand/raw/fsmc_nand.c b/drivers/mtd/nand/raw/fsmc_nand.c
index d579d5dd60d6..df61db8ce466 100644
--- a/drivers/mtd/nand/raw/fsmc_nand.c
+++ b/drivers/mtd/nand/raw/fsmc_nand.c
@@ -503,6 +503,8 @@ static int dma_xfer(struct fsmc_nand_data *host, void *buffer, int len,
 
 	dma_dev = chan->device;
 	dma_addr = dma_map_single(dma_dev->dev, buffer, len, direction);
+	if (dma_mapping_error(dma_dev->dev, dma_addr))
+		return -EINVAL;
 
 	if (direction == DMA_TO_DEVICE) {
 		dma_src = dma_addr;
-- 
2.43.0

