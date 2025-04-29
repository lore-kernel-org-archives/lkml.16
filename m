Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5A1295527;
	Tue, 29 Apr 2025 23:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745970714; cv=none; b=IicxJRwzM72ytGiQafz1VIr+09NJigp/riw3QfSSf576s2jKc7nJQnHxzcLhCVw6CAiYQnwkPeMiPEJEpcUYkeiZuzQ5jR0UJMQjHeMRTNR9XKYaNbVsj2CX2grQRnFkXOqh/f/RCFZ4Zh8mBXkV1GDsujT1NSN2q+WVQ3qL9ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745970714; c=relaxed/simple;
	bh=KCLyh9loOGeaxvbc6X8iT+z/3F2iQE19hAh1JFIuN1Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ISyDVJOnnod0LYdXdFpi8hup9cA38pCDlJZbcjaQDtphYTs8/zsqSAuJzs5u+A07JDZ7FHrgl16AmK9t/6SXTFrLG3ogxvM+NHwcTBQc0kiYkPWdkROT5ooA99nyEIc/j6dAjDasfffzzveWQWp1o9+pCBmmOLR5Zuit4aVTGAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mjU5/lDR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mjU5/lDR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7117C4CEEB;
	Tue, 29 Apr 2025 23:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745970713;
	bh=KCLyh9loOGeaxvbc6X8iT+z/3F2iQE19hAh1JFIuN1Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mjU5/lDRXzLkUVKnZHhRm3rrrGaIsiEQttaQkG/1ag+AaJuPdOiSrPgguIL+w/b/4
	 G6UNsAIUo3xnfRTDtN1MCX3kfCvMiEsJJcCu3fSMcbWSu6vDu9ZZM0H9llsMss52Z5
	 HSaBNpzWRpMg/KctOYgV0Bzax1cpVIpgHU40mqlWzbST+gQC/xpDiHTbYyDkHCegUH
	 8Gm32M6XP8Zrdsrbte8UPqqMM4/Owd0hZsOWn7aw6R4OlOeV5U/680t8PQAmHNB+JT
	 9mkftXKPzLbgtIGMkL/UvIrgzCn5zqeZIO/eSIvp/zXHyY2n+2mWCMLdMCgl+MojPK
	 rN/ha00hvOP1g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Hans de Goede <hdegoede@redhat.com>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 6.12 16/37] mei: vsc: Use struct vsc_tp_packet as vsc-tp tx_buf and rx_buf type
Date: Tue, 29 Apr 2025 19:51:01 -0400
Message-Id: <20250429235122.537321-16-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250429235122.537321-1-sashal@kernel.org>
References: <20250429235122.537321-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.25
Content-Transfer-Encoding: 8bit

From: Hans de Goede <hdegoede@redhat.com>

[ Upstream commit f88c0c72ffb014e5eba676ee337c4eb3b1d6a119 ]

vsc_tp.tx_buf and vsc_tp.rx_buf point to a struct vsc_tp_packet, use
the correct type instead of "void *" and use sizeof(*ptr) when allocating
memory for these buffers.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Alexander Usyskin <alexander.usyskin@intel.com>
Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Link: https://lore.kernel.org/r/20250318141203.94342-3-hdegoede@redhat.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/misc/mei/vsc-tp.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/misc/mei/vsc-tp.c b/drivers/misc/mei/vsc-tp.c
index ef0a9f423c8f8..fb2f45829f7bd 100644
--- a/drivers/misc/mei/vsc-tp.c
+++ b/drivers/misc/mei/vsc-tp.c
@@ -67,8 +67,8 @@ struct vsc_tp {
 	u32 seq;
 
 	/* command buffer */
-	void *tx_buf;
-	void *rx_buf;
+	struct vsc_tp_packet *tx_buf;
+	struct vsc_tp_packet *rx_buf;
 
 	atomic_t assert_cnt;
 	wait_queue_head_t xfer_wait;
@@ -160,7 +160,7 @@ static int vsc_tp_xfer_helper(struct vsc_tp *tp, struct vsc_tp_packet *pkt,
 {
 	int ret, offset = 0, cpy_len, src_len, dst_len = sizeof(struct vsc_tp_packet);
 	int next_xfer_len = VSC_TP_PACKET_SIZE(pkt) + VSC_TP_XFER_TIMEOUT_BYTES;
-	u8 *src, *crc_src, *rx_buf = tp->rx_buf;
+	u8 *src, *crc_src, *rx_buf = (u8 *)tp->rx_buf;
 	int count_down = VSC_TP_MAX_XFER_COUNT;
 	u32 recv_crc = 0, crc = ~0;
 	struct vsc_tp_packet ack;
@@ -320,7 +320,7 @@ int vsc_tp_rom_xfer(struct vsc_tp *tp, const void *obuf, void *ibuf, size_t len)
 	guard(mutex)(&tp->mutex);
 
 	/* rom xfer is big endian */
-	cpu_to_be32_array(tp->tx_buf, obuf, words);
+	cpu_to_be32_array((u32 *)tp->tx_buf, obuf, words);
 
 	ret = read_poll_timeout(gpiod_get_value_cansleep, ret,
 				!ret, VSC_TP_ROM_XFER_POLL_DELAY_US,
@@ -336,7 +336,7 @@ int vsc_tp_rom_xfer(struct vsc_tp *tp, const void *obuf, void *ibuf, size_t len)
 		return ret;
 
 	if (ibuf)
-		be32_to_cpu_array(ibuf, tp->rx_buf, words);
+		be32_to_cpu_array(ibuf, (u32 *)tp->rx_buf, words);
 
 	return ret;
 }
@@ -492,11 +492,11 @@ static int vsc_tp_probe(struct spi_device *spi)
 	if (!tp)
 		return -ENOMEM;
 
-	tp->tx_buf = devm_kzalloc(dev, VSC_TP_MAX_XFER_SIZE, GFP_KERNEL);
+	tp->tx_buf = devm_kzalloc(dev, sizeof(*tp->tx_buf), GFP_KERNEL);
 	if (!tp->tx_buf)
 		return -ENOMEM;
 
-	tp->rx_buf = devm_kzalloc(dev, VSC_TP_MAX_XFER_SIZE, GFP_KERNEL);
+	tp->rx_buf = devm_kzalloc(dev, sizeof(*tp->rx_buf), GFP_KERNEL);
 	if (!tp->rx_buf)
 		return -ENOMEM;
 
-- 
2.39.5

