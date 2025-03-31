Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D231C84AA
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 09:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743413242; cv=none; b=eWxByPUYdnkwnUO/Ev8/nfb2tVZHy0QH2EPCSX4ggwNGwST4JcBg7yFG5/9y21HNVCd5Ztin3mw0E97odC6ItawEdwz02pcmk1Z7HOdbz4vw0S76fhMY+gGs20Pyz+Z+s0ZnVG069DPx4K/FqwifAgsN2Gvq6I6LszOGNseJLMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743413242; c=relaxed/simple;
	bh=EljE4+siz7wRnryvAHj3Ttnk9GA/xxsBJoNqJJfLMlo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=L8kjHRsQYC0/7bk/he8HEY6my1vF3+unygRZDz5SQT/CUyquDca5BAuTOeU6pDz+Fp5z3Kuz7NIAQz7fdj2YcPEL7wM0eEA1NFvnehLMrDus2XBApAkxBSGc8TBbUGWrK7gyH15iIqyHBTtHjTkJrwK3IjrWEhiHcDHtuyC+M78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SnumFeyH; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SnumFeyH"
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-2264aefc45dso108538525ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 02:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743413240; x=1744018040; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mTJvGzIGMuULN2adPZjm/U1LArMT/vmHj5AlaPuCUw8=;
        b=SnumFeyHxZqgAkHi4zqzOdZ0zNoKvLrLFrZvIUZkSNQJH20nvCRnAdalI189peVC4w
         6upKmGU68XnvB9TRit1NBugJs39ujHzFnO5v58cGxC82s7Lpi7LU8HApuLtAtjryRwRt
         PnrBqR0G1QnxuGbvtd/Xd2HZr21jDb07tM83eGwmW2rSj/VSfE385Evgzi6AX9+3D45z
         J2qohhrOXtJtSD4pHqqv8zV8lrFdp3nxT+ogyzGaWZXuH3iWg7JxT0L82cPfZFG9IMBa
         dKD9jKj2TTE23DW1wxoWyNHBTJ/CXNIGdUiYVEhiFZzLWaFiJ8tBP/WEbEADe+Gdz6fl
         bQyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743413240; x=1744018040;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mTJvGzIGMuULN2adPZjm/U1LArMT/vmHj5AlaPuCUw8=;
        b=Cggt4WkuD8ecAcfGOWV43zJoKIpZSS9EjhVSZvO3a0sWHhf0KLGU/WrschQ+Ef2zw9
         JknWCs+DUD6r/kZwhqMO5zl4INEVZSX2RLPvTAh+lps9BCRgC09m+FDEAq3hvu/hNdmd
         895AVCkmwsufCJYNvzqNYcxGnhCGEx84yqxRJoKSnfCHUixZ3hmIB1Mj0uJ7mAk1WvRa
         8mDLbjPyN9B9RAFJM20nxgKHtCkIYx665dr0rQ6QdEom/eUNsjT6u9zy81OVOQdYuguL
         To2wrGFBt5R5an9+UaOz5invXbN25w1BEcS33uUOhLXTfw+MnYIBpAUoLF/IG2fcRdd0
         Ej6w==
X-Gm-Message-State: AOJu0YyVWmvef72PHfxFz59YN2GBoIAn8qXudYO1Imu2JI31d9zdF7WI
	cfPkuiNdNSXbhA+MDox4QHNZPq+39Q0tDoeIZS2OuzilYe2mt2eOU1l1I60CT2c3Qc6N
X-Gm-Gg: ASbGnctQPz8HBrXOTfWtNg7tw0zM7my4SOWffPRbFHZxpDl2GrZryoRHTkGYnZO+ku4
	rJkVySA5v/zVLJzHrFgHY9E+EFiwtn/fskGoqGoP+kPJW1V00QNr0i2SCqIeuv6WPxAO4PuflPW
	oytwT/08GExExbrrz8VuurDc6S7p7vyXWMasHUqost++/AvXBxMNmAGQh2vs50bPNruah0YG23w
	ongI+6VvTnG0GXpU1iEBh2jxcdbgGPpO0wxJUMOEq8v4JzFcSlUm1Prr9f2LlJnsC/no3zN5xxp
	MGiBVGIP9tTvdLSHnOVI/eRlsGy9sZm1i2TgUikXk65c83g/NQMkF8sd3qO0qptcIBpWFBg=
X-Google-Smtp-Source: AGHT+IFwLPKjCdn9Q4/jE8PYPwdO/5MfEDHFgLlt8ZydrEEXEp/DNEDaFo4OXBF/xEcT6yOiA0lv9w==
X-Received: by 2002:a17:903:2f85:b0:224:76f:9e45 with SMTP id d9443c01a7336-2292f963a1dmr103628575ad.21.1743413239756;
        Mon, 31 Mar 2025 02:27:19 -0700 (PDT)
Received: from henry.localdomain ([111.202.148.167])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039dff072fsm9160138a91.14.2025.03.31.02.27.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 02:27:19 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>
Subject: [PATCH] uio: uio_fsl_elbc_gpcm: Add NULL check in the uio_fsl_elbc_gpcm_probe
Date: Mon, 31 Mar 2025 17:27:12 +0800
Message-Id: <20250331092712.7227-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When devm_kasprintf() fails, it returns a NULL pointer. However, this return value is not properly checked in the function uio_fsl_elbc_gpcm_probe.

A NULL check should be added after the devm_kasprintf() to prevent potential NULL pointer dereference error.

Fixes: d57801c45f53e ("uio: uio_fsl_elbc_gpcm: use device-managed allocators")

Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
 drivers/uio/uio_fsl_elbc_gpcm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/uio/uio_fsl_elbc_gpcm.c b/drivers/uio/uio_fsl_elbc_gpcm.c
index 81454c3e2484..59ba1a2dcfe3 100644
--- a/drivers/uio/uio_fsl_elbc_gpcm.c
+++ b/drivers/uio/uio_fsl_elbc_gpcm.c
@@ -384,6 +384,10 @@ static int uio_fsl_elbc_gpcm_probe(struct platform_device *pdev)
 
 	/* set all UIO data */
 	info->mem[0].name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%pOFn", node);
+	if (!info->mem[0].name) {
+		dev_err(priv->dev, "devm_kasprintf failed for region name\n");
+		return -ENOMEM;
+	}
 	info->mem[0].addr = res.start;
 	info->mem[0].size = resource_size(&res);
 	info->mem[0].memtype = UIO_MEM_PHYS;
-- 
2.34.1

