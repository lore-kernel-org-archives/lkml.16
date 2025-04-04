Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB8D1EE7B1;
	Fri,  4 Apr 2025 13:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743774796; cv=none; b=Oky5HGBa3dHaTCt93ygh1f9LB9PtDEWLZ3mruWtHuLS80NMa/QfD7z8EnFWwQ5dRxK2ppaNeLi+y8YCdrJzRDPbtXp8CBUNwYhfnjWCNXlf6gZWtgrCB6EdOWknfl/Qsxjn6Iv5NwDFUtJJq8DbdNWzmfSU+osEK/FfUDGi7H/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743774796; c=relaxed/simple;
	bh=sG0vqdLw3qhfx8d5puG9lNUlzh/5nZPv9uRQEdtxBJc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k28CtPwaikXz/MxKZljIOxjjWFML7RBvLdl5Zy4SFAsOklJpMN/aA5J8scxG6mI/ynMNALMniK0utb2Uj5AX9RhkNYgP7ogKDf6/rZCSLO0jypOejzMcXN1/IvA1awO0GNVrVvfnBZtJttVecSsd5monVMUFKELxsNCag90C5bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=MZo/LraT; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="MZo/LraT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743774792;
	bh=sG0vqdLw3qhfx8d5puG9lNUlzh/5nZPv9uRQEdtxBJc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MZo/LraTabjLqvQVRuKK/N+fXRFk/p1rx2R9KGBWUm+r1NVdKMZf+ceed01Z4gW2l
	 9s0xYIqXEESFAm30xKg1GXhhsXoOQ95L1US7hNm9SKPN45Zf2tbwQJobFPKva0C7JM
	 0dbkI4K00oCDD1nTKuAcQ5/Tr9dUJXvTvUNN4huogWJen3cOx/udDFl7qMdUEgbJMs
	 AlX1UrjsWnWlMnuWgxWlVYNG+ze4P13oXgAQ4vWa+/pbp0lT2wOPaxpjE6QC6lZ6sK
	 38lX880ZOU/3PcgVkZ+65DoNzzrUyAI7ubaipvmwjYQ9hXR6FqIcQbDwqxnxL9noNI
	 nfXOZH27J6dDg==
Received: from apertis-1.home (2a01cb0892F2D600C8f85cF092D4af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A8A6C17E07F2;
	Fri,  4 Apr 2025 15:53:11 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Date: Fri, 04 Apr 2025 15:53:09 +0200
Subject: [PATCH 1/2] arm64: dts: mediatek: mt8395-nio-12l: Add scp
 firmware-name
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250404-mt8395-scp-fw-v1-1-bb8f20cd399d@collabora.com>
References: <20250404-mt8395-scp-fw-v1-0-bb8f20cd399d@collabora.com>
In-Reply-To: <20250404-mt8395-scp-fw-v1-0-bb8f20cd399d@collabora.com>
To: kernel@collabora.com, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Ben Lok <ben.lok@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Julien Massot <julien.massot@collabora.com>
X-Mailer: b4 0.14.2

Set the scp firmware name to the default location.

Fixes: 96564b1e2ea4 ("arm64: dts: mediatek: Introduce the MT8395 Radxa NIO 12L board")

Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
index 1c922e98441a1aadf0aa3cdd76583a70401a1fa3..f2eb1b683eb76f783f5a13f28a78f6e33238b5f0 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
@@ -850,6 +850,7 @@ &pmic {
 
 &scp {
 	memory-region = <&scp_mem>;
+	firmware-name = "mediatek/mt8195/scp.img";
 	status = "okay";
 };
 

-- 
2.49.0

