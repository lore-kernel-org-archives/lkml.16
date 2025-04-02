Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529E32356B3
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 08:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743582999; cv=none; b=AfVmxuBQWntOFtQEdmXbSfGIHtnytljhdJjANMpVkErjBniaXYD4bw0KHr4T/zb8pR/7tyJgzTzAtiv+ZUhqEemIXZ/d8x6i4qkVsNxCKYnbxB5NjHC5P+zCV4bgHIsk5jq09xMOBdB2Tf+zCzbghOihjjayhIFnhqzdMUsGpy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743582999; c=relaxed/simple;
	bh=xT/UxSd76HQ2h0k8lo/xYt8WEMzA1J2YiDZlg+5uYNA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IpEBoXdRUaLiNwpxC4njrlS80i25ubkSBetEIkKxuDtufc7qa7p/ytDNtI6mJhACg6W+bbe2SacsdLB4JS5PIdwksN75bEH3/g/9yZEsXkkIDfsyzy/FvKxbypjnAuLG13zeRYpAS1XHRA/fgdq/JypE5eNcVY59QJSmnT7t50Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=lpad4w0l; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="lpad4w0l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743582995;
	bh=xT/UxSd76HQ2h0k8lo/xYt8WEMzA1J2YiDZlg+5uYNA=;
	h=From:To:Cc:Subject:Date:From;
	b=lpad4w0lS03luxXOD2mWQdUFBUQ8xaHX9GoZUKkMVmEMn0/pEcKp2bjQi6OQUWOD/
	 MfdLhbzaEX0DY+KepaIxiAenUFA0YiaDhFQjPrlHaEa8njPYMP/LIEl8UTle/KpBOv
	 ZfXj7ioL0TcebSNcfPxfjOo10Fsdq83vjob12+KMpdHEYxbtdElliTSJjrl8ZX49I1
	 1jU3zodSuwCZ6uz+wS4vJRPcunAGPy58ZRwZ8kdZR/QFRBHocJTuQMBKaGP4q7IPco
	 M0/t1PHMBjnrXiNpN8u/f0aK/P4xdzsgw1FW7G2houJLCOlB+4XjdnFZSeTBnuPbwK
	 ZAP3mt+yixbvQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 64C5B17E086B;
	Wed,  2 Apr 2025 10:36:34 +0200 (CEST)
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
Subject: [PATCH v1 0/5] drm/mediatek: Cleanups and sanitization
Date: Wed,  2 Apr 2025 10:36:23 +0200
Message-ID: <20250402083628.20111-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

 drivers/gpu/drm/mediatek/mtk_disp_ovl.c  | 19 +++++++++----
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c | 35 ++++++++++++++----------
 drivers/gpu/drm/mediatek/mtk_drm_drv.c   | 31 +++++++++++++++------
 3 files changed, 57 insertions(+), 28 deletions(-)

-- 
2.48.1

