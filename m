Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D7723184A
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 10:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746180066; cv=none; b=fETH1fUq+Q6aFiB62WskT22LIqNvnslZU7J1MOinQO06kYO/shCjrKYYaThX4/wYuugl4a25P1vHnuw65SJ9e9PUyNzB5hVFGQQJ4HACirqc638I7EmtC3Yq7QeLn7jkqpu+vD64obxj0uz87aBuY+q2mDIYt7OjoMxD8IQbDBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746180066; c=relaxed/simple;
	bh=UxN93SvSHVTP+m+eEEKFbkfsohK3RhjYDOa6gbczcdk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QwjrG5Od8iafNFHntbdLrMCS+PugNry5fBlyMwgNsKMRonfy3BnA8LkUV32Gue7s9XBxJqrUyuzqVa2n7/FlXGJosKH0Le3pSFLsf2zmjP7an0PFOwslK05huURLds5XXYxRthp5eDhsnyeLSZUj6PVa8ErHxRfLaKE8J55+FtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yjdTQHFm; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yjdTQHFm"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ac345bd8e13so303799166b.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 03:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746180062; x=1746784862; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t+mAUVqOxIXjZijXnkHFZmAFDQtFJ4Kh5PO6PLUJhLU=;
        b=yjdTQHFmHGQrvTur2lR8v1utuu7A+8xYJpLWbDApR+nASaJaaM3aaI4NZcHOiN+J93
         G6AA2e6gaf+EhTbyChOHTqF9Cc8b0c/AFsUZOMkf5g6pvHUFedkGliwAoUUQ5pKrpJAM
         XL4vvABecCyiQKcHOdDl4xbaZ90zK66I3U9W3ATsTohvKpyd6MdNm4mqM0LIwS8AvTCH
         LbEoF4PKuCYy0yU+y5MdDAUv26UxBk63r4EMMFSXngch5WsbUcO6bJvdkVjHFefXbA5L
         7fFrG7PnX807WKF+bfAQ0ayZ/ABwexDQUt72n5UYXOXf+ynj3mu1JvYMqnTKQwZCFtvR
         9KUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746180062; x=1746784862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t+mAUVqOxIXjZijXnkHFZmAFDQtFJ4Kh5PO6PLUJhLU=;
        b=xVAC1PdEykgWaIkRjXUc8EPrR5/sHUs3+KaYuhHKK6eB/YuarAurBqQ0GjFyx2+pYa
         L8Em3mOn8YLkTnLgRc5xdiJp1P4U0cVdlYjoehdh/V2kNpw/WnB3kFcwOkDJDzNA5Jad
         zjIkhjsrJ9SYNurh2oETyZ1xoDwO9V9DU1a/oWBj9Z8lztixTbXoaWvj+lBGHHno7mqF
         zX5k2ERXzHvnCblnXqRLRV2QDrTHPYgL/13JHIixmYfA7Xo9FX6d/nxx97KnSJAHVNpQ
         15rQ1ZJmwfOv0vgt26JbkurslEEY/sCrODhdgs8yOqaY90+AYCVCSjwzwCnc+J3rb1mO
         k91w==
X-Gm-Message-State: AOJu0YwdkLYIPLOhj4KjkAPXzbwl2vba/8QuvsF2PQZcUn4Dh31Rwewx
	kiEPDC5BYlAmhcE9ZwZ2MLFkyjbzxtpRbasHnXCRtIjsfS7QzNGKAEsfLJA/C9+0TLKp2PlysgV
	8an8=
X-Gm-Gg: ASbGncuU7ukx3LejOyQN61tqqIdBpvO3+duXEKTLYsLXbtqGm2A3nG6YUokYK8TQctg
	/NmBoYtqEicPqj7/uq4NQgmBQ9iijCoDpZborlSXadvih/Lxqq0+wF4WQRyGYqByontlFdEchd2
	Kc6tUP9T2Cy0MFHRpBg4cJFA9fATjG0ItY2CyW2mBt6xzAu2QYo3i2kGxgDO/ovNop1IFwGZ21r
	tDDBAKgZj4MhK5cRrIGkQBwaasHdCpYoNeW9ObDxYDYA30exDhR4ExMMAR6hCVI8bXS7Mrpt4n/
	gkjK/ERXBE6ueIvEyFqI8ENWs57tF08afLgxPrdx0/qVw9BnjlIinWOBRa4m4BMLstsej6mm47S
	afIdyQ+F6VJyCehetVg==
X-Google-Smtp-Source: AGHT+IF8JUCWliZjcbeUSHN6uSsFMCJc6NTPRM+5qGy9ZTGCC1yXzVdzLyehffDilJirBntp5oHCOw==
X-Received: by 2002:a17:907:9411:b0:abf:fb78:673a with SMTP id a640c23a62f3a-ad17adaee50mr226144666b.29.1746180062402;
        Fri, 02 May 2025 03:01:02 -0700 (PDT)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891473a1sm26030566b.4.2025.05.02.03.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 03:01:01 -0700 (PDT)
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
Subject: [PATCH v8 05/14] dma-buf: dma-heap: export declared functions
Date: Fri,  2 May 2025 11:59:19 +0200
Message-ID: <20250502100049.1746335-6-jens.wiklander@linaro.org>
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

