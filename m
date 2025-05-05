Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A27243968;
	Mon,  5 May 2025 12:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746447410; cv=none; b=k6e9snNO6r9wgAbuTLs7W+C78A8nkAkZ82HihYr/31UDlJ9XUUTnWP8NweyumBm87FNSVQzJyMljZpRxS8oqYvQC0lyRYrqAjv0Wr541jX90SIa5L6hhSOebAQku51tbtz7aEoXuZ4R8uaOYmk18i1ziqAWNBySrLCEcHFjHBzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746447410; c=relaxed/simple;
	bh=LH5lzqhn0XVPlG2tjftzOFQkvXI+EFqjBSKAvNxSXbI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=H0U+Mg46AdegjDt/M85D6611mKoDyJJbzFrytftJNiXd/fnD3lw4qmByPjMjsTtRgxLEOEdfPwyeqeZUAtc+GuQKSWvEvQ+1NyzAYOE49k9yVcRk/Zmy/n48pIK6Ji3elVvbwDB6vMiKKPn4KWLhJQ4xMLxbI+g/7bb7Akq9Xfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=NrLbJX3N; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="NrLbJX3N"
X-UUID: cdcd905429aa11f0813e4fe1310efc19-20250505
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=eL43ZRVkWexsT4kpS9dOgpQeOnjph5zzqnvNig+2Iqg=;
	b=NrLbJX3NihPi3eNkb8ClfkrtWWJm3R5WTIk0mZ8rSb3362mJeP7xeR0x+Mjk3uDC8jue07gcRzj2EVr2HuhRLyRvxghJcssfmA12jZ5iWmTokID4GxH9sQDhHqAZ3XEqLvrldmh8+ocI1p66Vtr8oJqVGy1KtJsZwPLdUNoxNUg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:843a5f4c-772a-44bd-9d8d-dd05f2312a92,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:6112ec7f-99e0-42db-8543-075f2c30d73f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: cdcd905429aa11f0813e4fe1310efc19-20250505
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <sirius.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1932931428; Mon, 05 May 2025 20:16:42 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 5 May 2025 20:16:40 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 5 May 2025 20:16:40 +0800
From: Sirius Wang <sirius.wang@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@mediatek.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<wenst@chromium.org>, Sirius Wang <sirius.wang@mediatek.com>
Subject: [PATCH 0/2] Add mt8189 dts evaluation board and Mafefile
Date: Mon, 5 May 2025 20:15:44 +0800
Message-ID: <20250505121627.3944728-1-sirius.wang@mediatek.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

MT8189 is a SoC based on 64bit ARMv8 architecture. It contains 6 CA55
and 2 CA78 cores. MT8189 share many HW IP with MT8188 series.

We add basic chip support for MediaTek MT8189 on evaluation board.

In this series, we also add dt-bindings document definition for MT8189.

Sirius Wang (2):
  WIP: dt-bindings: arm: Add compatible for MediaTek MT8189
  WIP: arm64: dts: mt8189: Add mt8189 dts evaluation board and Mafefile

 .../devicetree/bindings/arm/mediatek.yaml     |   4 +
 arch/arm64/boot/dts/mediatek/Makefile         |   1 +
 arch/arm64/boot/dts/mediatek/mt8189-evb.dts   |  20 +
 arch/arm64/boot/dts/mediatek/mt8189.dtsi      | 441 ++++++++++++++++++
 4 files changed, 466 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8189-evb.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8189.dtsi

-- 
2.45.2

