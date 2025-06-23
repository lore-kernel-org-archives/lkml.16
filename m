Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49BB2494FE;
	Mon, 23 Jun 2025 12:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750680096; cv=none; b=kBrx/yUz90gPq2il191XpvooMp0SdZtCmfFsKSRy+c3DcRlMiSlA7ui3CnjPMp/zGe5NrySXFOlsLXGlCMBNCgtaR07B68VG646fda7koh5NjUFKhYMz/sXZzNdPW1rXS2dIXKQf/9FDJNndFStYQ/HMROGAKMQJPT8OpdhxN9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750680096; c=relaxed/simple;
	bh=idTHQ9r0uHXKoBT2gS5ef4ZVLvkWzlt1nNUSitiLNnA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LSbWNMAeWjbEyKVhc9vQxXTWi8t2Ak59TA16v+HbNw5fawCxV95pLocK86ZQymUw0YRlSxRqsEj/4+Xk8JS8ozHebFndKiaquMm17fyvgeXK4qhlIef2sVKSPMoKoeQ8FaKWMZkMrvKsvkp9TrK+6E10B2lB+JbocVN0Q3rfUks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=WV76i7Qs; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="WV76i7Qs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750680093;
	bh=idTHQ9r0uHXKoBT2gS5ef4ZVLvkWzlt1nNUSitiLNnA=;
	h=From:To:Cc:Subject:Date:From;
	b=WV76i7QsO9pCUj/sfcs8ZgX4CDIigFMX+qv5Rjay0gUKpAhWXaFjdewtd3TUAxUXS
	 0aPWN3WjlgXOvQZ/wod7fVCPLGZN2sGbOTt8UN701lbtKIf7gRiEwoe1jNWAP/NI6q
	 iGchEboXxjlMbm8O6O6xpoE8iQ3oYNKh9pTe4/Tl8DcLW/LkIBWj8UFZ7c3DNOXvWh
	 H/H5JL+4uwkrc7pEdKv18CHQ6o6WdV0ZN6UC7koOddRAkHgNyWdUxE+QtP8Zf8n9Er
	 XWmAmv1rzZWcOIpHwUbNjnQpo1onm1nOuZ6U6QpJFGNBNa/jmo2lKchFkvM9eGwFAy
	 uD3QG5GVi+ZmA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 92D2D17E090E;
	Mon, 23 Jun 2025 14:01:32 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: jassisinghbrar@gmail.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v1 0/2] mailbox: Add MediaTek TinySYS Mailbox
Date: Mon, 23 Jun 2025 14:01:25 +0200
Message-ID: <20250623120127.109237-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for the MediaTek TinySYS Mailbox, used for
message passing on ARM SCMI and for both the standard 0x10 SCMI and
the MediaTek TinySYS SCMI protocol.

This mailbox is similar to the standard MHU Mailbox, but with some
critical differences that are MediaTek-specific; for more information,
check the description for the commits in this series.

This mailbox is found in the new MT8196 Chromebook SoC and in the
MT6991 Dimensity 9400 SoC, other than slightly older chips like
MT6898 Dimensity 9300, the MT6985 Dimensity 9200 and similar.

Support for all of the mentioned SoCs is present in this series.

AngeloGioacchino Del Regno (2):
  dt-bindings: mailbox: Add MediaTek TinySYS MHU mailbox
  mailbox: Add MediaTek TinySYS MHU-like Mailbox

 .../mediatek,mt6985-tinysys-mhu-mbox.yaml     |  52 +++++
 drivers/mailbox/Kconfig                       |   9 +
 drivers/mailbox/Makefile                      |   2 +
 drivers/mailbox/mtk-tinysys-mailbox.c         | 196 ++++++++++++++++++
 4 files changed, 259 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/mediatek,mt6985-tinysys-mhu-mbox.yaml
 create mode 100644 drivers/mailbox/mtk-tinysys-mailbox.c

-- 
2.49.0

