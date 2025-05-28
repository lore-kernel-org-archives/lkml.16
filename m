Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C3B17BA1;
	Wed, 28 May 2025 09:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748426327; cv=none; b=bKdKoWj2BiLi9u2IEKHKRm1nsF3ul3Q7HmCIP4pqz3bdYGA9GG9d5Erq9DEcx2Mx+kz69RbQizRdTIApmwmI1iDA5izBLRNtK7mNp0opdW4fRNuVCe5zge34Le5/weO3aALLnlA9RvgyQRDpr8Hp7xCNr6641Uc+4rouQQqBqOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748426327; c=relaxed/simple;
	bh=JxenMXhCnG0Q6qqgAUfz4aOOWk3ARNy9mbGaMdiGkI8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TmfC2auke1nzhEGJw1yvRpsfxJQthYIS24nq2mv7VWIUAHFBMdC6AzcTygHBfDBnGg5xu3M6WTzXcPvlppguQNuzsFVDplg1IbBYFsQ7BPT+JXat47dPV20YNVQ+6eYCUMB9OZ8eScj/djLSNKI8k1p/UjDdlH9FJBDMBj6QP8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=Bk3+5v7w; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Bk3+5v7w"
X-UUID: 52de6f5a3baa11f082f7f7ac98dee637-20250528
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=UIPzmvmserW3V83wIIJ6pIfzB+Tlkfw7bJvzEN1FiIM=;
	b=Bk3+5v7wLwVtuBV2aEcFIEkwHUEWfmWdHR5dOIpGmGwpMjyRAevgqwY+P2AOLqsewMbGW3iaAp/bF3++Dm46ap3W2IgquIzc9YePLZzLPNdfkCTtEJS2fJAqjvvSI2aTMB9BXXl8ORX0uSb1Kp8T3VaYqatnjHdDOHyd8aRBgVQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:239131d9-fa69-4f35-9024-29e69b06a429,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:0ef645f,CLOUDID:2e4fd247-ee4f-4716-aedb-66601021a588,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 52de6f5a3baa11f082f7f7ac98dee637-20250528
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <jianhua.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1050912838; Wed, 28 May 2025 17:58:36 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 28 May 2025 17:58:34 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 28 May 2025 17:58:34 +0800
From: Jianhua Lin <jianhua.lin@mediatek.com>
To: <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Jianhua Lin
	<jianhua.lin@mediatek.com>
Subject: [PATCH 0/2] Add MT8189 jpeg encoder and decoder compatible
Date: Wed, 28 May 2025 17:57:46 +0800
Message-ID: <20250528095748.17485-1-jianhua.lin@mediatek.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This series is based on tag: next-20250528, linux-next/master

jianhua.lin (2):
  dt-bindings: media: mediatek-jpeg-encoder: Add MT8189 compatible
    string
  dt-bindings: media: mediatek-jpeg-decoder: Add MT8189 compatible
    string

 .../devicetree/bindings/media/mediatek-jpeg-decoder.yaml         | 1 +
 .../devicetree/bindings/media/mediatek-jpeg-encoder.yaml         | 1 +
 2 files changed, 2 insertions(+)

-- 
2.46.0

