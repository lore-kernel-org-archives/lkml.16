Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4AD72E3AFD;
	Thu,  3 Jul 2025 11:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751543929; cv=none; b=TGYxs+4/q1JU7ElTQy3muLt1Og3MOmPgU97F0v43244Q7QLcHNEsjgY6oPXU+8xG/6htl4cgY+1LCWxsElXfu9p5mmj6l1OfJKd1TiNgG4YjyX2HQTeYxYqg3JKrGIUmBzRJ+UZoGkG+BzqG6sXQq4s27dxAfOuzk3zZN92lJEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751543929; c=relaxed/simple;
	bh=dx1glT6Vu/pVjckglIR4Zn3O8xpjDZblhDOnXlLKFVg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pFWQmIjN+r5pcu5/EwSYtpbxANOmNiYxY81i8N+t5UyDKzNxwGxtIPR7CXSkAKALjvS66ASxyV261SOG5bdOlNFqiY/UhQu0Vz3csrSaFN7S4SIeptlZb/8hbIoEWy2kh5XrJPOdcShrpjhye7a5B7HUsAzEWr4m5qtRSsNW9HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=NiRJQmuB; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="NiRJQmuB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751543926;
	bh=dx1glT6Vu/pVjckglIR4Zn3O8xpjDZblhDOnXlLKFVg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NiRJQmuBmuHelEDNzzPj4DHkzEi2wxnlw2Hcyc5Oh2awsVKuIEZOocs/dv9aSPNRt
	 54am/71O0iNDMkOqt3psfzcMHcbHmqkCHhxGFmvewRp3khBzGwnFqBGuO6HerPQCvY
	 S7gboUn5Q8u9TGDZOUagNgBOoy5v8z8t8+gMEwJ4Lt5uYz/qzKfXMkhoMCV/lr+QbF
	 qkKvmXvTMsAoI89W41enBaFjyvSonDbmIcYKj6eDKFzTjyRShZqs+AeWcZJGUeTK0R
	 oDXuP1jlduk6OM/2uoWzK2WFAiN4FvDdcQv/AGwNdLswS3l7W8OMIvlOTH0Ae+HMpt
	 diThZqF3UnPWA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5A81317E0636;
	Thu,  3 Jul 2025 13:58:45 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: sboyd@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	hsin-hsiung.wang@mediatek.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
Subject: [PATCH v2 3/5] spmi: mtk-pmif: Keep spinlock until read is fully done
Date: Thu,  3 Jul 2025 13:58:26 +0200
Message-ID: <20250703115828.118425-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703115828.118425-1-angelogioacchino.delregno@collabora.com>
References: <20250703115828.118425-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Move the spin unlocking to after reading the contents of the
PMIF_SWINF_(x)_RDATA_31_0 register in pmif_spmi_read_cmd():
since this is the only register that we can read to get the
data from all of the arbitered busses, a concurrent request
for reading (especially on a busy arbiter) will show a race
condition and a unexpected or corrupted value may be read.

Doing the entire read sequence while spin locked guarantees
that concurrent access to the arbiter doesn't happen.

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/spmi/spmi-mtk-pmif.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/spmi/spmi-mtk-pmif.c b/drivers/spmi/spmi-mtk-pmif.c
index 68f458587c67..9f416b231ab8 100644
--- a/drivers/spmi/spmi-mtk-pmif.c
+++ b/drivers/spmi/spmi-mtk-pmif.c
@@ -22,7 +22,7 @@
 #define PMIF_CMD_EXT_REG	2
 #define PMIF_CMD_EXT_REG_LONG	3
 
-#define PMIF_DELAY_US   10
+#define PMIF_DELAY_US   2
 #define PMIF_TIMEOUT_US (10 * 1000)
 
 #define PMIF_CHAN_OFFSET 0x5
@@ -372,7 +372,6 @@ static int pmif_spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 	/* Send the command. */
 	cmd = (opc << 30) | (sid << 24) | ((len - 1) << 16) | addr;
 	pmif_writel(arb, pbus, cmd, inf_reg->ch_send);
-	raw_spin_unlock_irqrestore(&pbus->lock, flags);
 
 	/*
 	 * Wait for Software Interface FSM state to be WFVLDCLR,
@@ -382,13 +381,16 @@ static int pmif_spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 					data, GET_SWINF(data) == SWINF_WFVLDCLR,
 					PMIF_DELAY_US, PMIF_TIMEOUT_US);
 	if (ret < 0) {
+		raw_spin_unlock_irqrestore(&pbus->lock, flags);
 		dev_err(&ctrl->dev, "failed to wait for SWINF_WFVLDCLR\n");
 		return ret;
 	}
 
 	data = pmif_readl(arb, pbus, inf_reg->rdata);
-	memcpy(buf, &data, len);
 	pmif_writel(arb, pbus, 1, inf_reg->ch_rdy);
+	raw_spin_unlock_irqrestore(&pbus->lock, flags);
+
+	memcpy(buf, &data, len);
 
 	return 0;
 }
-- 
2.49.0

