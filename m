Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A60128ECCE;
	Tue, 13 May 2025 12:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747139700; cv=none; b=VVMdk0ld4oBWBKh3doIQAuWACodvNYdAFiWYk7xHhBzpXhPKHwgx5TPZzAp/UyN6134SJsHDXIvR9+mGa8b6+PH6PdSOhlCosspI/lS9JkYm8wzwG8vVMTtgdGnbrb8GAM+DSzdmbh/w19M/cp75EeLyuiC/M5SnBPKRyrI/hq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747139700; c=relaxed/simple;
	bh=u2hoH0if4XlY924RAc8QSz9rFsWWAX5jfbtK7C9L0z4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=P7/2QGY0WdCkb+IzFgcz5NlXooWbKW95APh8GXfYlXtPx4HpibqekrJKhE2b8m1falV+PsGi6LIO7l2a71YnJ0WUPLocp8YqxXxsmIO9Td9UlVrJO3kmf9MRrWkPAzDiHbDTXZhzt9NIh+zVa7/IC7mSeO9eZm6/X+KPpgyjh7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CWXJF/nd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CWXJF/nd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D304DC4CEF3;
	Tue, 13 May 2025 12:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747139699;
	bh=u2hoH0if4XlY924RAc8QSz9rFsWWAX5jfbtK7C9L0z4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CWXJF/nd1+fVMyET8fNK5vodONP93mwjpYLAQqZ8Qv9bbC7zAUR9sMCp8zfwks0PI
	 TaUD7c2F7zJ2e1gUivbrTBi1E4V7jgjEc8iHl1s6ceaFx+7dfHFpHjPDPVOubKsZU3
	 +fgcmay+TXke23jZgOeGMiMc5G3CJ21GM0RwsP7491Bb2GjvHjUACXIvyPYbkZheMP
	 GSpZF5sQW+hsrUOeTei0HjzMr+F+7e8yVYJByJo1/WIxet9Qxdr62D2am5w6GcEOH8
	 iaX+S+aIQItKPdq9JIOmikCsuWWl7jGkfkAIqzs56gpsDK8Ykxgq6NB5PXZ4JNQN0J
	 wImLnAPfJpyRA==
From: Arnd Bergmann <arnd@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] ALSA: qc_audio_offload: try to reduce address space confusion
Date: Tue, 13 May 2025 14:34:42 +0200
Message-Id: <20250513123442.159936-4-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250513123442.159936-1-arnd@kernel.org>
References: <20250513123442.159936-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

uaudio_transfer_buffer_setup() allocates a buffer for the subs->dev
device, and the returned address for the buffer is a CPU local virtual
address that may or may not be in the linear mapping, as well as a DMA
address token that is accessible by the USB device, and this in turn
may or may not correspond to the physical address.

The use in the driver however assumes that these addresses are the
linear map and the CPU physical address, respectively. Both are
nonportable here, but in the end only the virtual address gets
used by converting it to a physical address that gets mapped into
a second iommu.

Make this more explicit by pulling the conversion out first
and warning if it is not part of the linear map, and using the
actual physical address to map into the iommu in place of the
dma address that may already be iommu-mapped into the usb host.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/usb/qcom/qc_audio_offload.c | 32 ++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
index c4dde2fa5a1f..46379387c9a5 100644
--- a/sound/usb/qcom/qc_audio_offload.c
+++ b/sound/usb/qcom/qc_audio_offload.c
@@ -78,9 +78,9 @@ struct intf_info {
 	size_t data_xfer_ring_size;
 	unsigned long sync_xfer_ring_va;
 	size_t sync_xfer_ring_size;
-	unsigned long xfer_buf_iova;
+	dma_addr_t xfer_buf_iova;
 	size_t xfer_buf_size;
-	phys_addr_t xfer_buf_dma;
+	dma_addr_t xfer_buf_dma;
 	u8 *xfer_buf_cpu;
 
 	/* USB endpoint information */
@@ -1018,11 +1018,12 @@ static int uaudio_transfer_buffer_setup(struct snd_usb_substream *subs,
 					struct mem_info_v01 *mem_info)
 {
 	struct sg_table xfer_buf_sgt;
+	dma_addr_t xfer_buf_dma;
 	void *xfer_buf;
 	phys_addr_t xfer_buf_pa;
 	u32 len = xfer_buf_len;
 	bool dma_coherent;
-	unsigned long iova;
+	dma_addr_t xfer_buf_dma_sysdev;
 	u32 remainder;
 	u32 mult;
 	int ret;
@@ -1045,29 +1046,38 @@ static int uaudio_transfer_buffer_setup(struct snd_usb_substream *subs,
 		len = MAX_XFER_BUFF_LEN;
 	}
 
-	xfer_buf = usb_alloc_coherent(subs->dev, len, GFP_KERNEL, &xfer_buf_pa);
+	/* get buffer mapped into subs->dev */
+	xfer_buf = usb_alloc_coherent(subs->dev, len, GFP_KERNEL, &xfer_buf_dma);
 	if (!xfer_buf)
 		return -ENOMEM;
 
+	/* Remapping is not possible if xfer_buf is outside of linear map */
+	xfer_buf_pa = virt_to_phys(xfer_buf);
+	if (WARN_ON(!page_is_ram(PFN_DOWN(xfer_buf_pa)))) {
+		ret = -ENXIO;
+		goto unmap_sync;
+	}
 	dma_get_sgtable(subs->dev->bus->sysdev, &xfer_buf_sgt, xfer_buf,
-			xfer_buf_pa, len);
-	iova = uaudio_iommu_map(MEM_XFER_BUF, dma_coherent, xfer_buf_pa, len,
-			      &xfer_buf_sgt);
-	if (!iova) {
+			xfer_buf_dma, len);
+
+	/* map the physical buffer into sysdev as well */
+	xfer_buf_dma_sysdev = uaudio_iommu_map(MEM_XFER_BUF, dma_coherent,
+					       xfer_buf_pa, len, &xfer_buf_sgt);
+	if (!xfer_buf_dma_sysdev) {
 		ret = -ENOMEM;
 		goto unmap_sync;
 	}
 
-	mem_info->dma = xfer_buf_pa;
+	mem_info->dma = xfer_buf_dma;
 	mem_info->size = len;
-	mem_info->iova = PREPEND_SID_TO_IOVA(iova, uaudio_qdev->data->sid);
+	mem_info->iova = PREPEND_SID_TO_IOVA(xfer_buf_dma_sysdev, uaudio_qdev->data->sid);
 	*xfer_buf_cpu = xfer_buf;
 	sg_free_table(&xfer_buf_sgt);
 
 	return 0;
 
 unmap_sync:
-	usb_free_coherent(subs->dev, len, xfer_buf, xfer_buf_pa);
+	usb_free_coherent(subs->dev, len, xfer_buf, xfer_buf_dma);
 
 	return ret;
 }
-- 
2.39.5

