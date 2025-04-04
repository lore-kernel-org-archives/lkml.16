Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14AC0E56F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 14:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743777150; cv=none; b=CCCEOKoa6iWs5OpqouBGdJ7zWjN6JRyPnjnNBNrx/Odkih9Frao2AOF4dY/th0AOUT9HuvUuU9ZhYnKPYQdau4kr+3ShT+CDFjyIv9o4sqihTR2sVSOpaOMU2RAi4Os0mqX3QHEPypnNq2P4Zd9B/OJlf5b+uAokTeZjuhtEt74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743777150; c=relaxed/simple;
	bh=vCWwdAowEJBs6cvWQ7lIUrdUovkUmMtp1i6POol9XM0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JAVbVQ4Ui+ErJEDrgb1bpsy3lUMkQg8NjSHWYDiSRK2eHKbzshChkPOCppPh9G70xhyE4ua7wKt1sDK4yGI53NPvsi/TKph1XYG9FZbQ7Dm91ssnIUeYkD/vzdEiH85hOGhyO5P3j9xm+A2lrcPoRbwBiL7Q5Uu0aa6wGZ9Jf58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TANzxv2G; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TANzxv2G"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5e5e22e6ed2so3068659a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 07:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743777146; x=1744381946; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ItVLbwXh6klaFZ4DOTZKuJkyifurR/QGuqAr/eTlGU=;
        b=TANzxv2GpPZdEhyiGGh5EWl/HyKKguDIWKIdX2iwWSvO2Ym4qqksdaIrYC6zLd0iKq
         P5Y17KooDw72t/1B7eJtYFtosX558iA1zYX46ZV87r4ccylThz54uisq6gxG22vLlq9l
         Kxrqg5Ljt95fF7xS6I0ZKLGs+td2IOYoNF7xBW2WrLdft0fQssekmsBB0dCbuLHCRLcO
         l3DYcwS07HcEnpHHJtyceryLrKwGItTCIIyap7wFcOQMyc9ZzNGHeI5Kkg49y8azTs3J
         aiuDhAWeWR0MVUZUdPKcaJOHGTCVK0LcJTTCwBujhwQbBh4m35OxMko9gZfUYH8DJUF2
         CrLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743777146; x=1744381946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ItVLbwXh6klaFZ4DOTZKuJkyifurR/QGuqAr/eTlGU=;
        b=F88QOqhGMb2OQgYJ5o6iPB7cWhI9UpdwbQ7ixgNhPhF/m6AjPAyZsKxl13meo8iFtS
         HESpeXTgBB9fBHXO3elmx6ggo12MZzcQ+vCw5k+d63OH78v06IObHafOdmoEwC11+qBS
         04CommbybI24bFYYX/gx6JF3m/CjHXD7W9U4M7ThOI25k8Z/Mythxi8G3fKgkTtoqdT6
         IhHMAGpX4Wkp5a8PcWoySE+qsCpv5iyfPNt+gxeTPKd4K3aVursI+Ss1O1yy6vGMXzjm
         al8iKciUun+DGpZ59KH+O6T6y8QiPigQmV2R71LTStayTEYanp9bcZjOlTLeZ/DsjCbo
         zozA==
X-Gm-Message-State: AOJu0YzI/B3ulX5QLNzuLrzZErne2QdTjIBYDfAoiECAgMMpwrH8KMQc
	4+fqJdNKoYHjKgZncIHbkkuF1U7er3hfnI58PUWMQTo0zfh4s7y/FicCAV6ZkDIswDgICi6hIMk
	3pp0=
X-Gm-Gg: ASbGnctgq37ASstWL9e0qATfg7zHvE+j41UzUqC7hkGyHFB+OIW8qAZXuq1LgmX1ued
	uPdgOzOVlIdepxKGQZUz+CWGK87q/2aS8oFt1Qie7R+4m0Ex4N70DWC9Y34gc6sQjK8roytH4Aa
	r+7vsaFIgrB9iOa1npqF0OXSayvH/bpNi2qZDkR9cnJqyZupCV6uN5GcVavjOJkGoRKXY129d4A
	bep3f4QS9KNXSXmhKO1cxuxbIJh97fU28ys/m3f116YUL8mhFOVIKboy40SWcUXFMve5B5DyB1f
	TG/bvLcpUNXLE20bgJrnDBSiykI2dQAcxMWsr7phVhoNG7XjKFJFmQlIv2BBuizRJ5YW3oPCPAA
	QDJNOuP8XC8HguO+qlg+F7g==
X-Google-Smtp-Source: AGHT+IHJ/1I/ptH3pCVDAQfcdNx5KHUGy5Tb2VN4inalxBPszr0OVkQ817HOYwXzW+KxBXdP3/CVtg==
X-Received: by 2002:a05:6402:234e:b0:5e7:b081:aa7c with SMTP id 4fb4d7f45d1cf-5f0b5ebbc4emr2568089a12.12.1743777145883;
        Fri, 04 Apr 2025 07:32:25 -0700 (PDT)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f087f0a0f3sm2567450a12.43.2025.04.04.07.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 07:32:25 -0700 (PDT)
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
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v7 01/11] tee: tee_device_alloc(): copy dma_mask from parent device
Date: Fri,  4 Apr 2025 16:31:24 +0200
Message-ID: <20250404143215.2281034-2-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250404143215.2281034-1-jens.wiklander@linaro.org>
References: <20250404143215.2281034-1-jens.wiklander@linaro.org>
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

