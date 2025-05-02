Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D2420E702
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 10:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746180058; cv=none; b=Pu58fsg5PI73x3HlM+9E+bDTXvRadxICc0R+GG424M1SDY1PRPmxnPRRzRbbhbahyMcrfKjRhzjSfGARfwvd6KxAUgVqiDgS5VIu05pyAK7ZpyqDWNKERiMLjQIYt1ViYfGWQsjSsv7gTBG7tV5+fu7YrXsB5OqK7uVm3LJNlDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746180058; c=relaxed/simple;
	bh=vCWwdAowEJBs6cvWQ7lIUrdUovkUmMtp1i6POol9XM0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YyAzkntVVrOjm/6++vS1fvPWJ/F5ZRL5msRp07Euy+qewC3cQ0peYS0GgRkwG6J3x7VuZMot5q1T+8iC/GZbhomCzWlSqMc4DZkziiIRvSYYtY54ZGKjup2spo9kdtRVTRNjAli2yQdw2wlp9LUt9IVXPKzcLpEZWfhvJyNteKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lILZ+Ba4; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lILZ+Ba4"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac25d2b2354so276800866b.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 03:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746180055; x=1746784855; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ItVLbwXh6klaFZ4DOTZKuJkyifurR/QGuqAr/eTlGU=;
        b=lILZ+Ba4INSx0smZ4cNKOx16Jw5Um9PE2xGKNsOtjqSdd/B97FLiQZzJJcGhMKQq2V
         wrCd6Wfqj0Ekey/4awoq9yqHVi3h4A41BG1C0gchOg5irt3wrz/LoMYGIk07FI8ORbL5
         ZP6mmPwJLamfHRQqw9qY646pQkruAF6txP4OzgNEKdakqMpeQkKSGD5/gVtMNPSQ4J+Y
         7YN/T5dJj6SpykXZtV6ovY6sTndDDEtxdntHOj1KzLyju9BzNTTe2+czhhkV2RmfWECP
         k2nNc/MKa0IUIHa2dQf+N4FQ006+Fgz4ociY1kb+ptf2V9uIjNGSWBVP5ekMTW/JUMen
         Z2kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746180055; x=1746784855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ItVLbwXh6klaFZ4DOTZKuJkyifurR/QGuqAr/eTlGU=;
        b=ExR8YAsG0b9zb1Q/w1YY5LowpCc3XLlWrmUEPDnEk0vFuJN0i+PnLlrnqZV2i3xSBf
         xOaITPzCHRXIZqKsj0g+D8FgZlceT0xLJ3/YyFwK1IgEC8VdWtJs5HkKGACJVqwIQQbm
         2i6+p/A13L2XVi5okzhDNjWbKgSyQqtsJBPRfiju3Kh9mnjbhS7E45dyRm8lpDTY3F38
         hha6x67RQVYp1Anvn0EcYH0VEirQeudr6HbKQXDw8ikFpWLj8KiUYgICfFtqI91grJ3M
         slFS21fqu5SIKrPVP910n0OJton3PCW3Lh0bn4ybjIuvMedPp7ccNtsDkzSoXQBqkS51
         GCeQ==
X-Gm-Message-State: AOJu0YxZmgkk8xnF7FSjdMn6l7m9tpaapAFCVzgd1LJFciAQWbSRFYxI
	omtx4Z6Oq3SBTwMO1qgy+N6o20SqAK8X2Y05BtbOTDNoj702r14HU1S63AgdHDf2+musoBU3aN0
	XKGE=
X-Gm-Gg: ASbGncuZGvEcpNYR+QuS45fNmuhSFuf8RYQJuOE3ef64psEmqBLOD89Ek1ScrjGFhhP
	XN0ufURgZsOy5QVImcjgaIi8A5ZhbD14GB6Jab27C5q18WESZge9BZJLMX6SVSdnN6j5amR2z1b
	zds7nSHDVuqJ4jGGKP8bT6eTA7Jt5ehxZleUN39gisivwmpr3FbFaZahdBUdthFu5UKDqpXJowS
	tF0tnlUnY/bw8Vu8oKhHan/076Jz3+rrKZGWY7o8mqaeWtl0hdvSaEPzB2kwpJVtOZiW4Ohwlzw
	97Am5s8KbHG7QwkbAVV+he60sxvuY7u2pZDt8v3QuKUN1HA8ArmrFzSj32eER7r2lE8oEthpKOY
	SGnb/M/jnLI2ux/2d9w==
X-Google-Smtp-Source: AGHT+IHsIhA3Bp5ORflZ8bo2wewMeJPgYiXyKbBXizljuVxA1br3p39Mij4FHprUjRbWMN7T6ANK8g==
X-Received: by 2002:a17:907:3f0f:b0:ace:9d35:6987 with SMTP id a640c23a62f3a-ad17ad24ac3mr199033566b.3.1746180054591;
        Fri, 02 May 2025 03:00:54 -0700 (PDT)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891473a1sm26030566b.4.2025.05.02.03.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 03:00:53 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	op-tee@lists.trustedfirmware.org,
	linux-arm-kernel@lists.infradead.org
Cc: Olivier Masse <olivier.masse@nxp.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Yong Wu <yong.wu@mediatek.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Sumit Garg <sumit.garg@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	azarrabi@qti.qualcomm.com,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Daniel Stone <daniel@fooishbar.org>,
	Rouven Czerwinski <rouven.czerwinski@linaro.org>,
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v8 01/14] tee: tee_device_alloc(): copy dma_mask from parent device
Date: Fri,  2 May 2025 11:59:15 +0200
Message-ID: <20250502100049.1746335-2-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250502100049.1746335-1-jens.wiklander@linaro.org>
References: <20250502100049.1746335-1-jens.wiklander@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If a parent device is supplied to tee_device_alloc(), copy the dma_mask
field into the new device. This avoids future warnings when mapping a
DMA-buf for the device.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
Reviewed-by: Sumit Garg <sumit.garg@kernel.org>
---
 drivers/tee/tee_core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
index d113679b1e2d..685afcaa3ea1 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -922,6 +922,8 @@ struct tee_device *tee_device_alloc(const struct tee_desc *teedesc,
 	teedev->dev.class = &tee_class;
 	teedev->dev.release = tee_release_device;
 	teedev->dev.parent = dev;
+	if (dev)
+		teedev->dev.dma_mask = dev->dma_mask;
 
 	teedev->dev.devt = MKDEV(MAJOR(tee_devt), teedev->id);
 
-- 
2.43.0

