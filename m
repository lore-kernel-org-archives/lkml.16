Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E660B28E5F9;
	Tue, 13 May 2025 12:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747139698; cv=none; b=DqvlGKNCe7s3knhZpgLB3Bi8GCvTZ7elTkdtN3Iqthzk7iJS4sjoy6OlhwkXqX/9SSHDnqUtib0rn19VCuFFldE0+QL5QAdbgNvoBycyUuZ1ShLbE5Vixzz9vneloNuoyZNEe9DN2dfgeEyuR7/kXSBswtcUdN7Jnnqx604B6s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747139698; c=relaxed/simple;
	bh=OLQSa1A0N97f/i6jL2QjszXk2M9waokHZY4hY5LIrA8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BsNFmQsZhGm6KqVjWkWz9Ggahwrj4LZjvMBCK5MO6k/NN76RtxumWa3+VlYF8nzYEaJz6Uec/AQZoa+xsZ7H7o6+rhiY4Qrkbenzs6r4nIl+MCs46ssXySoGs0eB8w5dCVpin7xRzSX0ivJvbxly3/gofn42EKDdGAuCZ46uEEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C7fluJVi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C7fluJVi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6643EC4CEED;
	Tue, 13 May 2025 12:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747139697;
	bh=OLQSa1A0N97f/i6jL2QjszXk2M9waokHZY4hY5LIrA8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C7fluJViP7Wm1BffCofuNaeH5bNfDb5F9ButmTsxJ8IPBh3xZQratwkbvsRR9CnFj
	 KCu0M654IUJ7pKAWzWCpksjQk8ZzSCnLoDca+4WKN4goWDH2L25uhDs24+JGgjgg/I
	 4iSfq6rVskvN03dE5lmKULyWtYMKSLe4P9+zDE+GcB0jC0pH2h8s+TWuBB9mzP3lu7
	 Gyf5zSpJcpcVtAHRKCyZ6deURkAiElISLhPagCHXgwnznXTi8joHjcEeYOqioGd/Bd
	 5OqozTKjXJUmBPUE6yP0YROjgrW516aASTPypAr2jYX/4MRUL1K/CJUZz/vaH2FYoc
	 nJ0H/JCVBx3gw==
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
Subject: [PATCH 2/3] ALSA: qc_audio_offload: avoid leaking xfer_buf allocation
Date: Tue, 13 May 2025 14:34:41 +0200
Message-Id: <20250513123442.159936-3-arnd@kernel.org>
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

The info->xfer_buf_cpu member is set to a NULL value because the
allocation happens in a different function and is only assigned
to the function argument but never passed back.

Pass it by reference instead to have a handle that can actually be
freed by the final usb_free_coherent() call.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/usb/qcom/qc_audio_offload.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
index d2256a26eaaa..c4dde2fa5a1f 100644
--- a/sound/usb/qcom/qc_audio_offload.c
+++ b/sound/usb/qcom/qc_audio_offload.c
@@ -1014,10 +1014,11 @@ static int enable_audio_stream(struct snd_usb_substream *subs,
  *
  */
 static int uaudio_transfer_buffer_setup(struct snd_usb_substream *subs,
-					u8 *xfer_buf, u32 xfer_buf_len,
+					void **xfer_buf_cpu, u32 xfer_buf_len,
 					struct mem_info_v01 *mem_info)
 {
 	struct sg_table xfer_buf_sgt;
+	void *xfer_buf;
 	phys_addr_t xfer_buf_pa;
 	u32 len = xfer_buf_len;
 	bool dma_coherent;
@@ -1060,6 +1061,7 @@ static int uaudio_transfer_buffer_setup(struct snd_usb_substream *subs,
 	mem_info->dma = xfer_buf_pa;
 	mem_info->size = len;
 	mem_info->iova = PREPEND_SID_TO_IOVA(iova, uaudio_qdev->data->sid);
+	*xfer_buf_cpu = xfer_buf;
 	sg_free_table(&xfer_buf_sgt);
 
 	return 0;
@@ -1340,7 +1342,7 @@ static int prepare_qmi_response(struct snd_usb_substream *subs,
 	struct q6usb_offload *data;
 	int pcm_dev_num;
 	int card_num;
-	u8 *xfer_buf_cpu = NULL;
+	void *xfer_buf_cpu;
 	int ret;
 
 	pcm_dev_num = (req_msg->usb_token & QMI_STREAM_REQ_DEV_NUM_MASK) >> 8;
@@ -1409,7 +1411,7 @@ static int prepare_qmi_response(struct snd_usb_substream *subs,
 
 	resp->speed_info_valid = 1;
 
-	ret = uaudio_transfer_buffer_setup(subs, xfer_buf_cpu, req_msg->xfer_buff_size,
+	ret = uaudio_transfer_buffer_setup(subs, &xfer_buf_cpu, req_msg->xfer_buff_size,
 					   &resp->xhci_mem_info.xfer_buff);
 	if (ret < 0) {
 		ret = -ENOMEM;
-- 
2.39.5

