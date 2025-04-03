Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C602459EE
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 10:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743677268; cv=none; b=pV2xTFfo2ksH5dLGL8FzbpH7E2Nvyy2FQ6umfHxDt0ko8DE2T+DmXqBGqaGhUa9+GRT6Qyxvrl6p3EGvp04UMcLk1EPYv5zWHO6KbeDPaG2GqL51R3JktyoyWFUIdpbQKXkDVSJxUYwLktbWsE80E8gH33aal2jKxu2BSpfHHKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743677268; c=relaxed/simple;
	bh=krVSqUMcdIJm0l6D8vCcbNrCt6hb1FXOmk01RVoxGgI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lSJr9iXd7eshNCnoeQeRd+nsOIynMSexXfN042uBCND4/Eiyh0b7ehbth8IESeWXnOh8NbLgi99ZuF4ae9BzpOmFd2W7nqH5yO+ht2yBFF8PE05PpYniegwh1+NkasVGjLG1PTBlLSABOrJY92PLwT3a/JQwuwEDg3A6F3u+OtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=gDiS+LNW; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="gDiS+LNW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743677264;
	bh=krVSqUMcdIJm0l6D8vCcbNrCt6hb1FXOmk01RVoxGgI=;
	h=From:To:Cc:Subject:Date:From;
	b=gDiS+LNWako3Yd4OZmxHJpbbQH24gPo3P7AJpjH5rPQQSYCi/aTFkSG5zooc6fazC
	 2l2sQJ9ByJfzScLHLeHRx48qcuokSKnvopPznQaaoIfx5xewQk+T9spIXHrWeEJkpw
	 bpKuqH4Ckro4vF9Xv2Zk+nRivlZuzDc0HpiTct15XKroXv4iJrPm5oX6oM/qrEs/QU
	 MUTOq+FRkRN1PPc8JI0rZ+POhoxRu+N8AK5p51gbmtubkk2QgXKqbs+unl3oRBpV4J
	 Macve0O4vLxKgaGRsiZILjto1gDlZ2ohY0Fp3n4MzNkKRKfy9ccqmET6shy6f0Pe6P
	 pY5zacfHULYgA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 828FC17E0702;
	Thu,  3 Apr 2025 12:47:43 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	nancy.lin@mediatek.com,
	ck.hu@mediatek.com,
	djkurtz@chromium.org,
	littlecvr@chromium.org,
	bibby.hsieh@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	wenst@chromium.org,
	kernel@collabora.com
Subject: [PATCH v2 0/5] drm/mediatek: Cleanups and sanitization
Date: Thu,  3 Apr 2025 12:47:36 +0200
Message-ID: <20250403104741.71045-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes in v2:
 - Fixed typo in description for commit [2/5]
 - Using IRQF_NO_AUTOEN in devm_request_irq() instead of calling
   irq_set_status_flags() to set flag for the same functionality.

During probe, the mediatek-drm drivers take a bunch of kobject
references for the various component sub-drivers and for the
mmsys/mutex handles.

Unfortunately, the refcount is not correctly decremented in some
cases, and not correctly incremented in some others, leading to
refcount_t overflows *or* underflows depending on where the code
fails during platform driver probe or during component bind.

This means that if mediatek-drm or any component of it returns a
probe deferral, and if this happens "too many times" (where too
many equals to around 3-5 times, and that's happening especially
when outer drivers are compiled as module while mediatek-drm is
built-in), it creates a whole bunch of badnesses.

This series sanitizes the freeing of the acquired kobjects in
mediatek-drm - especially in the multi-mmsys (multi-vdo) case.

While at it, this also moves the ISR enablement and disablement
to the component bind/unbind callbacks respectively, while keeping
the ISR installation to the probe function: this is done to avoid
leaks and to avoid entering ISRs for OVL/RDMA after those are
unbound (as that'd be dangerous, other than useless, because those
could access memory that doesn't belong to those drivers anymore,
as pointers may not have been set to NULL...!).

As an example, this is the reason (if not one of the reasons) for
a boot failure seen on the MT8195 Tomato Chromebook, pointed out
by KernelCI.


AngeloGioacchino Del Regno (5):
  drm/mediatek: mtk_drm_drv: Fix kobject put for mtk_mutex device ptr
  drm/mediatek: Fix kobject put for component sub-drivers
  drm/mediatek: mtk_drm_drv: Unbind secondary mmsys components on err
  drm/mediatek: mtk_disp_ovl: Enable/disable interrupt on bind/unbind
  drm/mediatek: mtk_disp_rdma: Enable/disable interrupt on bind/unbind

 drivers/gpu/drm/mediatek/mtk_disp_ovl.c  | 20 +++++++++-----
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c | 34 ++++++++++++++----------
 drivers/gpu/drm/mediatek/mtk_drm_drv.c   | 31 +++++++++++++++------
 3 files changed, 56 insertions(+), 29 deletions(-)

-- 
2.48.1

