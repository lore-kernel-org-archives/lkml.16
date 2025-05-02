Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23ADE246790
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 10:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746180075; cv=none; b=T/Rg/HBpnfsmbENlX1c2x0YcSyjqvuz4aWUv2nrQMICUUxey4zDAK/Df6/YRS4Hjj9tRkYHt6ha7BMrnzfJuh1rsHvZqVVp7Wdwrnet4NL9VvvJ3O/5EnMp5N86iRBxYJs7cJbbS4RkilBf00Kb+GuKSS4pVscmogaxbrerzvvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746180075; c=relaxed/simple;
	bh=JBFJnBv1Vm67I2drd1XhP0qbGY0AFjAC5ZYn7HBNfWg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hMZq3h2oadXQcZ10KXrRum1lOQB/MqXdW2IlP0o9NYxAFZsDIXsPuRqeE3RQLF+vJyAhpqaq2hVQpXnZu1wpi+LhMHKyIyr0VmU2CynVie46fe48DFBGipameNTcMye+nZjQiz0X3hIU//EjS0flGDuo39BjyuK00o+UdB7f4Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VRPd8PK0; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VRPd8PK0"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac339f53df9so391412966b.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 03:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746180072; x=1746784872; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K96TP7RufWR0A5oYw5jAf7HfaOkuZ/rMipxLAIxdi/A=;
        b=VRPd8PK0ERWcTjG48qEpGUPUjpAsLO4CrLTlUAfNpoc2RkOC6HYgVxzJ/1jvtEvgkB
         zaevmFd3QGTx5kWomkX/lIWRxizweqjKxnVx3zB89sU8gRpqLa6OVPRo/TpRMTwxV6OO
         CKJ5XVhLm6kWvNnUkOfMEfKUlJrFoLmNzpzveRwVJVlvDRFvlmVeCweC6AjTCbfha2B6
         GrOS51bMsPpgKBMqBe+eOEFdK4+/x0W30hV+C1CkIsVqOFlPLjgszXVljlvDDbGIvRtV
         bXKcLFaNMsBzArp6f3Qlt0fdIvpAcNhoj1vTuSOxZz5QnEUmYXs+F3pQMiBhpUHndn8A
         Kc/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746180072; x=1746784872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K96TP7RufWR0A5oYw5jAf7HfaOkuZ/rMipxLAIxdi/A=;
        b=fFJycTuzqGwe2ycFYD5G/Ma0z4siPH/7ltdN5NyhUon3L63nUm41UmOcPoz1eV0I1W
         hQGruwLRiUrgryvprMmUakwwNVJWv4l8bC3WMyHPCSwijQxiDRpYHzlQTtGFTIYyv1kl
         dw1tFv0HpoH5CHwi1mUA/7wnemhgt1qTwhkHjimxiGSJbMIxJz9Vyxiyyr4zczJvmT5u
         tZT0tYxa9pjjiktch2BxCA8jN/gZ+pXSWSnodkVB4sQsnB8d9cR2Ka3STIp0NmAQ7F/I
         xI4BrQDrmtXmfC7casf9YPcVQC9ZTBkDatCBQUNa4JcZ7KTbgVm7z7EhQByGwWU0BQUS
         R8uQ==
X-Gm-Message-State: AOJu0YxXGZMvt0s080OSz3SQ26C3151WVEIyManvnKyKAS5sbal3pQTa
	0RK82xQ5T8J9tEn3pBMv43p+RKqN3qGrf7OyUhtQH89EV6D5JCc61NeTGM4ystfYN9Gu+kubd/n
	KBdg=
X-Gm-Gg: ASbGncvPPnYQ2K5ikZDM3vE3xJw33NnvnAeKPQIwE1K5L0u6ENy65FmuHYe4vBGVPW+
	G6+vxGqLsO5+j3YurbaOZeh5xa+zAOrAs9Gv3eFbk8EVav4hfs41bIUO7dFj/UgOAY0YFkRwdBM
	dB5CWftonicEx0gQxINGcW3ObXjv6eeWFpm9nMNRA2xZJFt4S6LHPNYgmdau8iKAyT51x77NjRd
	azFrUiU+x5HxdrChb6Kcxc26+Mapb40YYaOvivZLM2quU/C6Tk1lEKfPWoyK2ew21LTE7z8lN6m
	rdnPaLlYqsRRHb+8j2JBfxbjsv85LejCGQGH99IaQC1TPJdL6r93ajgiU/msKORZ846Bem+nl0O
	pdI2xHZxUFIN+cciHs7T9JPyN+Jyn
X-Google-Smtp-Source: AGHT+IEw/QFZ4Q15wjtCZMc2Ys2EDGftsTen4aFJcOHmrUkANvg/HjzdHRZE7b55C3GGic4/3YhYzw==
X-Received: by 2002:a17:907:74a:b0:acf:15d:2387 with SMTP id a640c23a62f3a-ad17ada7132mr232347066b.19.1746180071962;
        Fri, 02 May 2025 03:01:11 -0700 (PDT)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891473a1sm26030566b.4.2025.05.02.03.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 03:01:11 -0700 (PDT)
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
	Jens Wiklander <jens.wiklander@linaro.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	iommu@lists.linux.dev
Subject: [PATCH v8 10/14] dma-contiguous: export dma_contiguous_default_area
Date: Fri,  2 May 2025 11:59:24 +0200
Message-ID: <20250502100049.1746335-11-jens.wiklander@linaro.org>
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

Export the global variable dma_contiguous_default_area so
dev_get_cma_area() can be called a module.

Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: iommu@lists.linux.dev
Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 kernel/dma/contiguous.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
index 8df0dfaaca18..eb361794a9c5 100644
--- a/kernel/dma/contiguous.c
+++ b/kernel/dma/contiguous.c
@@ -53,6 +53,7 @@
 #endif
 
 struct cma *dma_contiguous_default_area;
+EXPORT_SYMBOL(dma_contiguous_default_area);
 
 /*
  * Default global CMA area size can be defined in kernel's .config.
-- 
2.43.0

