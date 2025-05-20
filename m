Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C29265CB5
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 15:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747754689; cv=none; b=mIo3E15pmLxF7BdvgjjMXf1e96ftzYDB6z+2WXUBaK9i7Rf/JBHC8ZvJiMoVvld76QMukgY0zlQCy0p7MlSKs5RpzIvfe4RWUQt9jeLzETnwlnjrRJ2LNv60ZbICOAE10eeqd2LIcQl82l9cUkyzAiPjnEcusHpou5O2qHl7800=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747754689; c=relaxed/simple;
	bh=UxN93SvSHVTP+m+eEEKFbkfsohK3RhjYDOa6gbczcdk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dP6vRzoMm6PGXNcPVY7lFTKt4Fwo4w8vLbd/w7fnky9b1MgBLAMiAamL3ilwyOTuoNrA+LHSQpJi0QfkHWhglz/TH9QhG54Lr2tetiSSXubgehGvxs41gEANvYx4EAEgT4NBajIFZIVWnrQrZYMy41QgkBJnWqzFaW0rLti6I9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GLT/u2yA; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GLT/u2yA"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-acb39c45b4eso805705366b.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 08:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747754684; x=1748359484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t+mAUVqOxIXjZijXnkHFZmAFDQtFJ4Kh5PO6PLUJhLU=;
        b=GLT/u2yAQTo/Ui8guh77KTHRiumuBadbJgCGyBqpWXbduuTGoOGH/QDB8UmRLOFAj2
         5L1QQQ1yFxZWNJDwDyoaYkbBEQp8tbFrBTtQVxZcHhunYrUIZ+N7DZ0LwBVr5lbtra1a
         gfdC9h9sGF3i1BVXn0KaAvGSkHmnMF4yfIwa8VvGPBPvzCHTkScxuBrIFwa9x+Oq3K+P
         mYbKTmcj++umzLhBtCyLeaBN80m7kf5AmTjft7UXgktOdPwQDqAyJCMjyhuJ9zP395/d
         bAQzM4R0+RvY1JuXb2B32/3UP9Wh6xou/GiwCd2H6pXmv4kYsOJdwMacY8rII3lhhd6f
         lZfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747754684; x=1748359484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t+mAUVqOxIXjZijXnkHFZmAFDQtFJ4Kh5PO6PLUJhLU=;
        b=Gogpk8hr5Hdv1zsiCKJ+/424j8cpKsQm5ZuyvElXNq72I4kthDF7+Jaoq2AsqyyniG
         PYqq9Oet9Ho8UiCmgu2qZJPeWtgzDwVyxyp8Xiynx7QrkBAM5BI93WM1c7XbKdcAKiPv
         oqxMJjxH/7sq/SYJGKbbVbH3vjLjqpgw9LubhHGsr4Yhe0pMeWjUofSGyhpPrHqDPw03
         bVLzryKIdDK9sOM1c5K3XlULsgpUu257fC882gGQe+DGxfQXFpKnizUuOsCKRXEfaNka
         9lbjJf9AzMyeKuSVKCK0GxNSuEL89t/pSvAsvpyZjk/zD41qJdjlPgwkKa9UFkCmGDKz
         vjtA==
X-Gm-Message-State: AOJu0YzfyIXVyWZlCZp1Xl34sw7IOrzNCGc7Ldm9C7N3HI6IPatEsvUl
	0z+JxffD7AxjE6XcAdaxurn2iGL7adRAz7sDbh+aYmsq+laa67+KDz/4YRxrABCWjdClVae3pvk
	UvH24
X-Gm-Gg: ASbGncuz7a/slKkME1/2T9w/jO5R/4sn1k1J6pySMeybeFr0+CMvHQpsrJxHQQWGuKi
	MgyAEoUnNyses+ZGMucbyFz4BRCOGPDCmdokfwl6J+4BzChFF4xFfFdmDdgJGPu4aJK9I8XXmQv
	c2vs6dSwEUS7Yz2UdApRUP857/lFczCyma+kgeKROikvdKvD/4bjGvAc3bBDFmmuW0cDT4wMJH/
	ZmRRwS5MqN9+ep6AKZkwzsb2rEtEEYNpYtyrOxOB17oj6cF6a49OqvGdNVMT9Dgq9yyn2/xOF8m
	cB12OMt09CVDr34mQgHe12onc/+1C6zq0vCGK7xuBFBIk1WpY5wcCFz1LlsAE5+x2me8f8dIHdj
	6CCH9ZNLW49lrc9wxRiXdjFoaIMhG
X-Google-Smtp-Source: AGHT+IHJnNS8PsiFV8EVtrc16G9fq8ki6tRPk/s/IIABC/OTj/P3BcTFh9xpStaXrxgzCYdbyyVt2g==
X-Received: by 2002:a17:906:22d1:b0:ad5:3055:784d with SMTP id a640c23a62f3a-ad53055f81cmr1041003666b.34.1747754684274;
        Tue, 20 May 2025 08:24:44 -0700 (PDT)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d278257sm742608766b.82.2025.05.20.08.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 08:24:43 -0700 (PDT)
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
Subject: [PATCH v9 2/9] dma-buf: dma-heap: export declared functions
Date: Tue, 20 May 2025 17:16:45 +0200
Message-ID: <20250520152436.474778-3-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250520152436.474778-1-jens.wiklander@linaro.org>
References: <20250520152436.474778-1-jens.wiklander@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Export the dma-buf heap functions declared in <linux/dma-heap.h>.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 drivers/dma-buf/dma-heap.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
index 3cbe87d4a464..cdddf0e24dce 100644
--- a/drivers/dma-buf/dma-heap.c
+++ b/drivers/dma-buf/dma-heap.c
@@ -202,6 +202,7 @@ void *dma_heap_get_drvdata(struct dma_heap *heap)
 {
 	return heap->priv;
 }
+EXPORT_SYMBOL(dma_heap_get_drvdata);
 
 /**
  * dma_heap_get_name - get heap name
@@ -214,6 +215,7 @@ const char *dma_heap_get_name(struct dma_heap *heap)
 {
 	return heap->name;
 }
+EXPORT_SYMBOL(dma_heap_get_name);
 
 /**
  * dma_heap_add - adds a heap to dmabuf heaps
@@ -303,6 +305,7 @@ struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
 	kfree(heap);
 	return err_ret;
 }
+EXPORT_SYMBOL(dma_heap_add);
 
 static char *dma_heap_devnode(const struct device *dev, umode_t *mode)
 {
-- 
2.43.0

