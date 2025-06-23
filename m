Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FEFD246781
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 12:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750680201; cv=none; b=jUG4IKjRJ/0ZgWfwFMG0rpR42rO9a3fwcsoKu6MjQ59ttIZSw05d8rQV/TGntVm7UCzm6R3AoRjCLeIa4LlJRZzZyUN3oRRsajizDaz6yxX+fIR5B1ElOWBd2DPqmATS8X826FxfR9Y5tYmhh7yUSOpQx5FwKj6lH1jcX4UNg2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750680201; c=relaxed/simple;
	bh=3nnjzdKDL/XFZioXMgbkMzk/XvnybYXfQac1elnYKk0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=liPSFMxhYw/wu0pK/5GkJsFQ+cTRmRQdJOp4ZlnNv+3BODamap9son6e5xns7+fTr5olmGjbNmRTxaNoCliESDUQiDgOrjxenjuHFECALKoXCpivv2LLJUp0yRy234duDac2pKasZIzcKMnby7ER83eYWotIaLeBqxaS/HKuRJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=k6RSQSAO; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="k6RSQSAO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750680198;
	bh=3nnjzdKDL/XFZioXMgbkMzk/XvnybYXfQac1elnYKk0=;
	h=From:To:Cc:Subject:Date:From;
	b=k6RSQSAOKKvHMpOXyLsoGT1dnJCjdRQDwxSGY61BzZUTS3VjCE9JIOoTBFekGL6yc
	 ++vTE/zycKImJfVDxqPfw5ryZW6DihXBZz1oW+mu1EIZWwWlSOJWM0ZgUzTAssA2yo
	 KnlkSFu9hrXjLSIYOIDxwLxfNNuU8dlzcV5ZyJJxBf6OTrUAI/VfqdEGLxSiDLV74v
	 Da/0QpbaaUlsfVjDRq52ei26DLRVx/+AMQ1Wn8s0Qbk5JP0joqszyp2GuAYy1WszFe
	 qJgdZ41doiknFjDhDbe565XiGgN4b5VfbyOsTIJbOOALl5jY1cbcrf2Bnwx7PrODJw
	 wCKNzizFDh2NQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EE7BB17E090E;
	Mon, 23 Jun 2025 14:03:17 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunfeng.yun@mediatek.com
Cc: vkoul@kernel.org,
	kishon@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH v1 0/2] MediaTek TPHY Cleanups
Date: Mon, 23 Jun 2025 14:03:13 +0200
Message-ID: <20250623120315.109881-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While doing my usual round of cleanups, I've found some room for
improvement in the MediaTek T-PHY driver. This series performs some
cleanups on that.

AngeloGioacchino Del Regno (2):
  phy: mediatek: tphy: Clarify and add kerneldoc to mtk_phy_pdata
  phy: mediatek: tphy: Cleanup and document slew calibration

 drivers/phy/mediatek/phy-mtk-tphy.c | 65 ++++++++++++++++-------------
 1 file changed, 37 insertions(+), 28 deletions(-)

-- 
2.49.0

