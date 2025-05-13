Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5D728E57A;
	Tue, 13 May 2025 12:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747139695; cv=none; b=RK0rel+u5S3K+wrGiqO0dFfH8lMHNOifjwYZk+UeRnYbsng3KEv0FaXTyoTCGW8mCORYKJMwmOHIYMab6XO+VnfrJMM7qDR2dJbQR+JiA0WxnAGrv9m0Z9x9vDYfunHFjhn6E6mqSd4OTTV/5T1NeRkLRdurD8vOQt0ErONAp2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747139695; c=relaxed/simple;
	bh=pNFI8b6ltMIQqO6PpCE9uBYN8V8VrzLhyS+r+QrNFqU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tZSPKrlj5bB53GUBoaazWNbG7iP3xoOpNcsjFXvI37LyxZzHVHwDCngMCE0IooqWCQIzmoOFJUwb3ICsuqPEP0yUld9XZo+8LZ+dhz9m/E20HSdrhp/6npCAsFaHlKDjGEjbdbrwiwfHh6YlK0oK9W0zj2+zCHAz4aDKONdernU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bcMba6hB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bcMba6hB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF252C4CEED;
	Tue, 13 May 2025 12:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747139694;
	bh=pNFI8b6ltMIQqO6PpCE9uBYN8V8VrzLhyS+r+QrNFqU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bcMba6hBSRjlWRF5l6W6MTYFYaPfQnt4U7Uf9U+PL65HbreUVg5dSEjEeOm4vPRg4
	 meYpMedqdes+UIori8n89lgH2iF/56rTpQYpu5dQuNQEzsEB08Cv/ujOjD9YgNDC6s
	 ubJlnX8bD22D32v5R0tQ6F264wHgCrS3/leTLkdzdNsjHY7eYi61CyhlyAg+XnbpPD
	 XXRQRjd2qeGfjrNwpAq2jFezuTdmvcoRrPQTJXnAV2g3tyVcbSA5hwWkRj4calLBoT
	 vXQ6CNS/qoE/TTIG+E7p5D0DSx2aEIJ9cs/5A0M6Dyrwh9r2+5Wkc6FL5/LEoyOYsH
	 JrvTjQcs8V5LQ==
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
Subject: [PATCH 1/3] ALSA: qc_audio_offload: rename dma/iova/va/cpu/phys variables
Date: Tue, 13 May 2025 14:34:40 +0200
Message-Id: <20250513123442.159936-2-arnd@kernel.org>
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

While trying to understand a bug in the audio offload code, I had
to spend extra time due to unfortunate nameing of local variables
and struct members.

Change these to more conventional names that reflect the actual
usage:

 - pointers to the CPU virtual addresses of a dma buffer get a
   _cpu suffix to disambiguate them for MMIO virtual addresses

 - MMIO virtual addresses that are mapped explicitly through
   the IOMMU get a _iova suffix consistently, rather than a
   mix of iova and va.

 - DMA addresses (dma_addr_t) that are in a device address
   space (linear or IOMMU) get a _dma suffix in place of the
   _pa suffix.

 - CPU physical (phys_addr_t) addresses get a _pa suffix.
   There is still a mixup with dma addresses here that I address
   in another patch.

No functional changes are intended here.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/usb/qcom/qc_audio_offload.c  | 136 ++++++++++++++---------------
 sound/usb/qcom/usb_audio_qmi_v01.c |   4 +-
 sound/usb/qcom/usb_audio_qmi_v01.h |   4 +-
 3 files changed, 72 insertions(+), 72 deletions(-)

diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
index 8b096f37ad4c..d2256a26eaaa 100644
--- a/sound/usb/qcom/qc_audio_offload.c
+++ b/sound/usb/qcom/qc_audio_offload.c
@@ -78,10 +78,10 @@ struct intf_info {
 	size_t data_xfer_ring_size;
 	unsigned long sync_xfer_ring_va;
 	size_t sync_xfer_ring_size;
-	unsigned long xfer_buf_va;
+	unsigned long xfer_buf_iova;
 	size_t xfer_buf_size;
-	phys_addr_t xfer_buf_pa;
-	u8 *xfer_buf;
+	phys_addr_t xfer_buf_dma;
+	u8 *xfer_buf_cpu;
 
 	/* USB endpoint information */
 	unsigned int data_ep_pipe;
@@ -396,7 +396,7 @@ static unsigned long uaudio_get_iova(unsigned long *curr_iova,
 	struct iova_info *info, *new_info = NULL;
 	struct list_head *curr_head;
 	size_t tmp_size = size;
-	unsigned long va = 0;
+	unsigned long iova = 0;
 
 	if (size % PAGE_SIZE)
 		goto done;
@@ -411,7 +411,7 @@ static unsigned long uaudio_get_iova(unsigned long *curr_iova,
 		/* exact size iova_info */
 		if (!info->in_use && info->size == size) {
 			info->in_use = true;
-			va = info->start_iova;
+			iova = info->start_iova;
 			*curr_iova_size -= size;
 			goto done;
 		} else if (!info->in_use && tmp_size >= info->size) {
@@ -421,7 +421,7 @@ static unsigned long uaudio_get_iova(unsigned long *curr_iova,
 			if (tmp_size)
 				continue;
 
-			va = new_info->start_iova;
+			iova = new_info->start_iova;
 			for (curr_head = &new_info->list; curr_head !=
 			&info->list; curr_head = curr_head->next) {
 				new_info = list_entry(curr_head, struct
@@ -440,11 +440,11 @@ static unsigned long uaudio_get_iova(unsigned long *curr_iova,
 
 	info = kzalloc(sizeof(*info), GFP_KERNEL);
 	if (!info) {
-		va = 0;
+		iova = 0;
 		goto done;
 	}
 
-	va = *curr_iova;
+	iova = *curr_iova;
 	info->start_iova = *curr_iova;
 	info->size = size;
 	info->in_use = true;
@@ -453,10 +453,10 @@ static unsigned long uaudio_get_iova(unsigned long *curr_iova,
 	list_add_tail(&info->list, head);
 
 done:
-	return va;
+	return iova;
 }
 
-static void uaudio_put_iova(unsigned long va, size_t size, struct list_head
+static void uaudio_put_iova(unsigned long iova, size_t size, struct list_head
 	*head, size_t *curr_iova_size)
 {
 	struct iova_info *info;
@@ -464,7 +464,7 @@ static void uaudio_put_iova(unsigned long va, size_t size, struct list_head
 	bool found = false;
 
 	list_for_each_entry(info, head, list) {
-		if (info->start_iova == va) {
+		if (info->start_iova == iova) {
 			if (!info->in_use)
 				return;
 
@@ -492,20 +492,20 @@ static void uaudio_put_iova(unsigned long va, size_t size, struct list_head
 /**
  * uaudio_iommu_unmap() - unmaps iommu memory for adsp
  * @mtype: ring type
- * @va: virtual address to unmap
+ * @iova: virtual address to unmap
  * @iova_size: region size
  * @mapped_iova_size: mapped region size
  *
  * Unmaps the memory region that was previously assigned to the adsp.
  *
  */
-static void uaudio_iommu_unmap(enum mem_type mtype, unsigned long va,
+static void uaudio_iommu_unmap(enum mem_type mtype, unsigned long iova,
 			       size_t iova_size, size_t mapped_iova_size)
 {
 	size_t umap_size;
 	bool unmap = true;
 
-	if (!va || !iova_size)
+	if (!iova || !iova_size)
 		return;
 
 	switch (mtype) {
@@ -517,11 +517,11 @@ static void uaudio_iommu_unmap(enum mem_type mtype, unsigned long va,
 		break;
 
 	case MEM_XFER_RING:
-		uaudio_put_iova(va, iova_size, &uaudio_qdev->xfer_ring_list,
+		uaudio_put_iova(iova, iova_size, &uaudio_qdev->xfer_ring_list,
 				&uaudio_qdev->xfer_ring_iova_size);
 		break;
 	case MEM_XFER_BUF:
-		uaudio_put_iova(va, iova_size, &uaudio_qdev->xfer_buf_list,
+		uaudio_put_iova(iova, iova_size, &uaudio_qdev->xfer_buf_list,
 				&uaudio_qdev->xfer_buf_iova_size);
 		break;
 	default:
@@ -531,11 +531,11 @@ static void uaudio_iommu_unmap(enum mem_type mtype, unsigned long va,
 	if (!unmap || !mapped_iova_size)
 		return;
 
-	umap_size = iommu_unmap(uaudio_qdev->data->domain, va, mapped_iova_size);
+	umap_size = iommu_unmap(uaudio_qdev->data->domain, iova, mapped_iova_size);
 	if (umap_size != mapped_iova_size)
 		dev_err(uaudio_qdev->data->dev,
 			"unmapped size %zu for iova 0x%08lx of mapped size %zu\n",
-			umap_size, va, mapped_iova_size);
+			umap_size, iova, mapped_iova_size);
 }
 
 /**
@@ -556,9 +556,9 @@ static unsigned long uaudio_iommu_map(enum mem_type mtype, bool dma_coherent,
 				      struct sg_table *sgt)
 {
 	struct scatterlist *sg;
-	unsigned long va = 0;
+	unsigned long iova = 0;
 	size_t total_len = 0;
-	unsigned long va_sg;
+	unsigned long iova_sg;
 	phys_addr_t pa_sg;
 	bool map = true;
 	size_t sg_len;
@@ -573,18 +573,18 @@ static unsigned long uaudio_iommu_map(enum mem_type mtype, bool dma_coherent,
 
 	switch (mtype) {
 	case MEM_EVENT_RING:
-		va = IOVA_BASE;
+		iova = IOVA_BASE;
 		/* er already mapped */
 		if (uaudio_qdev->er_mapped)
 			map = false;
 		break;
 	case MEM_XFER_RING:
-		va = uaudio_get_iova(&uaudio_qdev->curr_xfer_ring_iova,
+		iova = uaudio_get_iova(&uaudio_qdev->curr_xfer_ring_iova,
 				     &uaudio_qdev->xfer_ring_iova_size,
 				     &uaudio_qdev->xfer_ring_list, size);
 		break;
 	case MEM_XFER_BUF:
-		va = uaudio_get_iova(&uaudio_qdev->curr_xfer_buf_iova,
+		iova = uaudio_get_iova(&uaudio_qdev->curr_xfer_buf_iova,
 				     &uaudio_qdev->xfer_buf_iova_size,
 				     &uaudio_qdev->xfer_buf_list, size);
 		break;
@@ -592,39 +592,39 @@ static unsigned long uaudio_iommu_map(enum mem_type mtype, bool dma_coherent,
 		dev_err(uaudio_qdev->data->dev, "unknown mem type %d\n", mtype);
 	}
 
-	if (!va || !map)
+	if (!iova || !map)
 		goto done;
 
 	if (!sgt)
 		goto skip_sgt_map;
 
-	va_sg = va;
+	iova_sg = iova;
 	for_each_sg(sgt->sgl, sg, sgt->nents, i) {
 		sg_len = PAGE_ALIGN(sg->offset + sg->length);
 		pa_sg = page_to_phys(sg_page(sg));
-		ret = iommu_map(uaudio_qdev->data->domain, va_sg, pa_sg, sg_len,
+		ret = iommu_map(uaudio_qdev->data->domain, iova_sg, pa_sg, sg_len,
 				prot, GFP_KERNEL);
 		if (ret) {
-			uaudio_iommu_unmap(MEM_XFER_BUF, va, size, total_len);
-			va = 0;
+			uaudio_iommu_unmap(MEM_XFER_BUF, iova, size, total_len);
+			iova = 0;
 			goto done;
 		}
 
-		va_sg += sg_len;
+		iova_sg += sg_len;
 		total_len += sg_len;
 	}
 
 	if (size != total_len) {
-		uaudio_iommu_unmap(MEM_XFER_BUF, va, size, total_len);
-		va = 0;
+		uaudio_iommu_unmap(MEM_XFER_BUF, iova, size, total_len);
+		iova = 0;
 	}
-	return va;
+	return iova;
 
 skip_sgt_map:
-	iommu_map(uaudio_qdev->data->domain, va, pa, size, prot, GFP_KERNEL);
+	iommu_map(uaudio_qdev->data->domain, iova, pa, size, prot, GFP_KERNEL);
 
 done:
-	return va;
+	return iova;
 }
 
 /* looks up alias, if any, for controller DT node and returns the index */
@@ -658,15 +658,15 @@ static void uaudio_dev_intf_cleanup(struct usb_device *udev, struct intf_info *i
 	info->sync_xfer_ring_va = 0;
 	info->sync_xfer_ring_size = 0;
 
-	uaudio_iommu_unmap(MEM_XFER_BUF, info->xfer_buf_va, info->xfer_buf_size,
+	uaudio_iommu_unmap(MEM_XFER_BUF, info->xfer_buf_iova, info->xfer_buf_size,
 			   info->xfer_buf_size);
-	info->xfer_buf_va = 0;
+	info->xfer_buf_iova = 0;
 
-	usb_free_coherent(udev, info->xfer_buf_size, info->xfer_buf,
-			  info->xfer_buf_pa);
+	usb_free_coherent(udev, info->xfer_buf_size, info->xfer_buf_cpu,
+			  info->xfer_buf_dma);
 	info->xfer_buf_size = 0;
-	info->xfer_buf = NULL;
-	info->xfer_buf_pa = 0;
+	info->xfer_buf_cpu = NULL;
+	info->xfer_buf_dma = 0;
 
 	info->in_use = false;
 }
@@ -1021,7 +1021,7 @@ static int uaudio_transfer_buffer_setup(struct snd_usb_substream *subs,
 	phys_addr_t xfer_buf_pa;
 	u32 len = xfer_buf_len;
 	bool dma_coherent;
-	unsigned long va;
+	unsigned long iova;
 	u32 remainder;
 	u32 mult;
 	int ret;
@@ -1050,16 +1050,16 @@ static int uaudio_transfer_buffer_setup(struct snd_usb_substream *subs,
 
 	dma_get_sgtable(subs->dev->bus->sysdev, &xfer_buf_sgt, xfer_buf,
 			xfer_buf_pa, len);
-	va = uaudio_iommu_map(MEM_XFER_BUF, dma_coherent, xfer_buf_pa, len,
+	iova = uaudio_iommu_map(MEM_XFER_BUF, dma_coherent, xfer_buf_pa, len,
 			      &xfer_buf_sgt);
-	if (!va) {
+	if (!iova) {
 		ret = -ENOMEM;
 		goto unmap_sync;
 	}
 
-	mem_info->pa = xfer_buf_pa;
+	mem_info->dma = xfer_buf_pa;
 	mem_info->size = len;
-	mem_info->va = PREPEND_SID_TO_IOVA(va, uaudio_qdev->data->sid);
+	mem_info->iova = PREPEND_SID_TO_IOVA(iova, uaudio_qdev->data->sid);
 	sg_free_table(&xfer_buf_sgt);
 
 	return 0;
@@ -1094,7 +1094,7 @@ uaudio_endpoint_setup(struct snd_usb_substream *subs,
 	phys_addr_t tr_pa = 0;
 	struct sg_table *sgt;
 	bool dma_coherent;
-	unsigned long va;
+	unsigned long iova;
 	struct page *pg;
 	int ret = -ENODEV;
 
@@ -1127,24 +1127,24 @@ uaudio_endpoint_setup(struct snd_usb_substream *subs,
 
 	pg = sg_page(sgt->sgl);
 	tr_pa = page_to_phys(pg);
-	mem_info->pa = sg_dma_address(sgt->sgl);
+	mem_info->dma = sg_dma_address(sgt->sgl);
 	sg_free_table(sgt);
 
 	/* data transfer ring */
-	va = uaudio_iommu_map(MEM_XFER_RING, dma_coherent, tr_pa,
+	iova = uaudio_iommu_map(MEM_XFER_RING, dma_coherent, tr_pa,
 			      PAGE_SIZE, NULL);
-	if (!va) {
+	if (!iova) {
 		ret = -ENOMEM;
 		goto clear_pa;
 	}
 
-	mem_info->va = PREPEND_SID_TO_IOVA(va, uaudio_qdev->data->sid);
+	mem_info->iova = PREPEND_SID_TO_IOVA(iova, uaudio_qdev->data->sid);
 	mem_info->size = PAGE_SIZE;
 
 	return 0;
 
 clear_pa:
-	mem_info->pa = 0;
+	mem_info->dma = 0;
 remove_ep:
 	xhci_sideband_remove_endpoint(uadev[card_num].sb, ep);
 exit:
@@ -1167,7 +1167,7 @@ static int uaudio_event_ring_setup(struct snd_usb_substream *subs,
 	struct sg_table *sgt;
 	phys_addr_t er_pa;
 	bool dma_coherent;
-	unsigned long va;
+	unsigned long iova;
 	struct page *pg;
 	int ret;
 
@@ -1192,23 +1192,23 @@ static int uaudio_event_ring_setup(struct snd_usb_substream *subs,
 
 	pg = sg_page(sgt->sgl);
 	er_pa = page_to_phys(pg);
-	mem_info->pa = sg_dma_address(sgt->sgl);
+	mem_info->dma = sg_dma_address(sgt->sgl);
 	sg_free_table(sgt);
 
-	va = uaudio_iommu_map(MEM_EVENT_RING, dma_coherent, er_pa,
+	iova = uaudio_iommu_map(MEM_EVENT_RING, dma_coherent, er_pa,
 			      PAGE_SIZE, NULL);
-	if (!va) {
+	if (!iova) {
 		ret = -ENOMEM;
 		goto clear_pa;
 	}
 
-	mem_info->va = PREPEND_SID_TO_IOVA(va, uaudio_qdev->data->sid);
+	mem_info->iova = PREPEND_SID_TO_IOVA(iova, uaudio_qdev->data->sid);
 	mem_info->size = PAGE_SIZE;
 
 	return 0;
 
 clear_pa:
-	mem_info->pa = 0;
+	mem_info->dma = 0;
 remove_interrupter:
 	xhci_sideband_remove_interrupter(uadev[card_num].sb);
 exit:
@@ -1340,7 +1340,7 @@ static int prepare_qmi_response(struct snd_usb_substream *subs,
 	struct q6usb_offload *data;
 	int pcm_dev_num;
 	int card_num;
-	u8 *xfer_buf = NULL;
+	u8 *xfer_buf_cpu = NULL;
 	int ret;
 
 	pcm_dev_num = (req_msg->usb_token & QMI_STREAM_REQ_DEV_NUM_MASK) >> 8;
@@ -1409,7 +1409,7 @@ static int prepare_qmi_response(struct snd_usb_substream *subs,
 
 	resp->speed_info_valid = 1;
 
-	ret = uaudio_transfer_buffer_setup(subs, xfer_buf, req_msg->xfer_buff_size,
+	ret = uaudio_transfer_buffer_setup(subs, xfer_buf_cpu, req_msg->xfer_buff_size,
 					   &resp->xhci_mem_info.xfer_buff);
 	if (ret < 0) {
 		ret = -ENOMEM;
@@ -1440,15 +1440,15 @@ static int prepare_qmi_response(struct snd_usb_substream *subs,
 
 	/* cache intf specific info to use it for unmap and free xfer buf */
 	uadev[card_num].info[info_idx].data_xfer_ring_va =
-					IOVA_MASK(resp->xhci_mem_info.tr_data.va);
+					IOVA_MASK(resp->xhci_mem_info.tr_data.iova);
 	uadev[card_num].info[info_idx].data_xfer_ring_size = PAGE_SIZE;
 	uadev[card_num].info[info_idx].sync_xfer_ring_va =
-					IOVA_MASK(resp->xhci_mem_info.tr_sync.va);
+					IOVA_MASK(resp->xhci_mem_info.tr_sync.iova);
 	uadev[card_num].info[info_idx].sync_xfer_ring_size = PAGE_SIZE;
-	uadev[card_num].info[info_idx].xfer_buf_va =
-					IOVA_MASK(resp->xhci_mem_info.xfer_buff.va);
-	uadev[card_num].info[info_idx].xfer_buf_pa =
-					resp->xhci_mem_info.xfer_buff.pa;
+	uadev[card_num].info[info_idx].xfer_buf_iova =
+					IOVA_MASK(resp->xhci_mem_info.xfer_buff.iova);
+	uadev[card_num].info[info_idx].xfer_buf_dma =
+					resp->xhci_mem_info.xfer_buff.dma;
 	uadev[card_num].info[info_idx].xfer_buf_size =
 					resp->xhci_mem_info.xfer_buff.size;
 	uadev[card_num].info[info_idx].data_ep_pipe = subs->data_endpoint ?
@@ -1459,7 +1459,7 @@ static int prepare_qmi_response(struct snd_usb_substream *subs,
 						subs->data_endpoint->ep_num : 0;
 	uadev[card_num].info[info_idx].sync_ep_idx = subs->sync_endpoint ?
 						subs->sync_endpoint->ep_num : 0;
-	uadev[card_num].info[info_idx].xfer_buf = xfer_buf;
+	uadev[card_num].info[info_idx].xfer_buf_cpu = xfer_buf_cpu;
 	uadev[card_num].info[info_idx].pcm_card_num = card_num;
 	uadev[card_num].info[info_idx].pcm_dev_num = pcm_dev_num;
 	uadev[card_num].info[info_idx].direction = subs->direction;
@@ -1477,13 +1477,13 @@ static int prepare_qmi_response(struct snd_usb_substream *subs,
 drop_sync_ep:
 	if (subs->sync_endpoint) {
 		uaudio_iommu_unmap(MEM_XFER_RING,
-				   IOVA_MASK(resp->xhci_mem_info.tr_sync.va),
+				   IOVA_MASK(resp->xhci_mem_info.tr_sync.iova),
 				   PAGE_SIZE, PAGE_SIZE);
 		xhci_sideband_remove_endpoint(uadev[card_num].sb,
 			usb_pipe_endpoint(subs->dev, subs->sync_endpoint->pipe));
 	}
 drop_data_ep:
-	uaudio_iommu_unmap(MEM_XFER_RING, IOVA_MASK(resp->xhci_mem_info.tr_data.va),
+	uaudio_iommu_unmap(MEM_XFER_RING, IOVA_MASK(resp->xhci_mem_info.tr_data.iova),
 			   PAGE_SIZE, PAGE_SIZE);
 	xhci_sideband_remove_endpoint(uadev[card_num].sb,
 			usb_pipe_endpoint(subs->dev, subs->data_endpoint->pipe));
diff --git a/sound/usb/qcom/usb_audio_qmi_v01.c b/sound/usb/qcom/usb_audio_qmi_v01.c
index 151ae7b591de..502857612277 100644
--- a/sound/usb/qcom/usb_audio_qmi_v01.c
+++ b/sound/usb/qcom/usb_audio_qmi_v01.c
@@ -14,7 +14,7 @@ static const struct qmi_elem_info mem_info_v01_ei[] = {
 		.elem_size	= sizeof(u64),
 		.array_type	= NO_ARRAY,
 		.tlv_type	= 0,
-		.offset		= offsetof(struct mem_info_v01, va),
+		.offset		= offsetof(struct mem_info_v01, iova),
 	},
 	{
 		.data_type	= QMI_UNSIGNED_8_BYTE,
@@ -22,7 +22,7 @@ static const struct qmi_elem_info mem_info_v01_ei[] = {
 		.elem_size	= sizeof(u64),
 		.array_type	= NO_ARRAY,
 		.tlv_type	= 0,
-		.offset		= offsetof(struct mem_info_v01, pa),
+		.offset		= offsetof(struct mem_info_v01, dma),
 	},
 	{
 		.data_type	= QMI_UNSIGNED_4_BYTE,
diff --git a/sound/usb/qcom/usb_audio_qmi_v01.h b/sound/usb/qcom/usb_audio_qmi_v01.h
index f2563537ed40..a1298d75d9f8 100644
--- a/sound/usb/qcom/usb_audio_qmi_v01.h
+++ b/sound/usb/qcom/usb_audio_qmi_v01.h
@@ -14,8 +14,8 @@
 #define QMI_UAUDIO_STREAM_IND_V01 0x0001
 
 struct mem_info_v01 {
-	u64 va;
-	u64 pa;
+	u64 iova;	/* mapped into sysdev */
+	u64 dma;	/* mapped into usb host */
 	u32 size;
 };
 
-- 
2.39.5

