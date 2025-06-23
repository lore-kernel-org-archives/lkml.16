Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305D3253B68;
	Mon, 23 Jun 2025 12:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750680045; cv=none; b=OQc6ojnbtCwfDibYEagrSu0iBUeXIEp/+r1QbCVtsBmSwt6W7cBRyavVOafkM8qeOB6h9kbZRY3M2MkhFTU0aYHFajPaGwp+nOeQrL44QWSvZIyJKcyb5lfr0+PzpDEmsSieM5uuBTYN7/BQx5LUnRNoSboR7uXWILAGVP9pDCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750680045; c=relaxed/simple;
	bh=L64oS5oGbehf+YNHePJC72/WhERGwszDWnrm0/Z0chc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OkEcSMUCeTGbYRs8Mn9IsoZsWeLAezr318XRVhXRclUnOlGtF8fXydeNDqOeZeClg+CZTGB57tP/xRlLHurl5jipCuDJIFNiZ9Dy/+mM2G57cHYNG+UKVowc1zaubK/RMdkn6QpR3qBfRY1cuoKBxGJgERFlcKAAeu5VnQmnbfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=lTm5xWyn; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="lTm5xWyn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750680042;
	bh=L64oS5oGbehf+YNHePJC72/WhERGwszDWnrm0/Z0chc=;
	h=From:To:Cc:Subject:Date:From;
	b=lTm5xWynSZKYnhz7zmnQU+M7KgR1b+Bc4nXJOS5JE359ichLEZdUmDWIafdtqu8oQ
	 qqGxgkKMBE6iDQXLZ4Y165hzRDpgaEN/n4JpF4zSN5ZBq8m3McMM6HBs32iMVms0R4
	 9Gnyec/KgshslQ7sptRxwdm8B48Lmdhrh4pL/2yIKtQ1c4NAgEM5JNgdhUm6TaHXU8
	 IPSZeeREuLU+g/UxtbGW8Dr4TcP6mgjpF3CcbiZ4/N+77SLTr8tGGbZlTejXTVS+ox
	 azc1dwWgjMIHGvwatEIC01OteKliqKnxRyZWRAqUHB6lJLFSHizYr9Xm88q1hz2ED0
	 fEjdxLgUNUGxA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 196ED17E090E;
	Mon, 23 Jun 2025 14:00:42 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: lee@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v1 0/2] mfd: Add driver for multifunction MediaTek SPMI PMICs
Date: Mon, 23 Jun 2025 14:00:36 +0200
Message-ID: <20250623120038.108891-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some MediaTek SPMI PMICs, like MT6363 and MT6373, are multi-function
devices, as they have and expose multiple sub-devices; moreover, some
of those also contain an interrupt controller, managing internal IPs
interrupts: for those, a chained interrupt handler is registered, which
parent is the SPMI controller itself.

This series adds support for the MT6363, MT6373 SPMI PMICs and their
interrupt controller.

AngeloGioacchino Del Regno (2):
  dt-bindings: mfd: Add binding for MediaTek MT6363 series SPMI PMIC
  drivers: mfd: Add support for MediaTek SPMI PMICs and MT6363/73

 .../bindings/mfd/mediatek,mt6363.yaml         |  98 +++++
 drivers/mfd/Kconfig                           |  17 +
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/mtk-spmi-pmic.c                   | 410 ++++++++++++++++++
 include/linux/mfd/mt6363.h                    |  26 ++
 include/linux/mfd/mt6373.h                    |  21 +
 6 files changed, 573 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/mediatek,mt6363.yaml
 create mode 100644 drivers/mfd/mtk-spmi-pmic.c
 create mode 100644 include/linux/mfd/mt6363.h
 create mode 100644 include/linux/mfd/mt6373.h

-- 
2.49.0

