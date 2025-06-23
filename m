Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD8125E824;
	Mon, 23 Jun 2025 12:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750680115; cv=none; b=LJp/ELbHr9tFAM9OfEwQWIw+/v8lilOoS30sJpj8L5VdVx+651VGrLAD81FemSMGLXSCN0sg/TvqjXm4t48tWGTOG+vWtpOSpelBqUV0rJNqkj825nfKDVIhDPSUw8TBB4spkwx0syj7rqM5O4rha56JE+wu3ad7CAjzysbArFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750680115; c=relaxed/simple;
	bh=x+YaW9SPO5D5OXeX5nvWtC3rkhnAG2cAbAN5a96RWbA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ib5wLb4qir0AmLiDOLXMe8c95B//cSQG36l2Gssw4Fs3aXIcAkRrVdXcvm9x3jR/6oxuz2PIlxO/WGtibZQzlPOWLUHmqY92kMYFryjJRegPdxbogbk6916bRqgglGD8pTSQ7s3O05YvDFwVanOj+jZDYt5rYuGW0E6ZfcNENkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=GAySvZGV; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="GAySvZGV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750680111;
	bh=x+YaW9SPO5D5OXeX5nvWtC3rkhnAG2cAbAN5a96RWbA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GAySvZGV/ARQ3af10jU7z5WFaKqTYWkGtmvmQiJpyMk8pxd77/cVaxzf7LgH3ottM
	 qKXdMwmrJQlRa6OG6NdrQ44yuWfEVgUqA6mwwfYIS+wN03nmm75EHVoz79m/WO2Xz4
	 x+FUu3DeGLEq7QhfDVcVyPvZ9RlkZaznduH/eEHCJqF/4tdRaOthgoV+Qwe87qT5ri
	 TDRVyhTdfL5ERZrTrXQaqYxS1hd7bnkZEV+7tljqG2Thj0lnOB9xUjTrv7rryTDSLJ
	 vUv0Ab+AAMSu1wSBDi0Cjr7IlUIFuX6QbBx4H9O1JBC2GobTexSP9njAv+bDzG2Oue
	 7JjfEmrHgaVXQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4648617E1560;
	Mon, 23 Jun 2025 14:01:51 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: lgirdwood@gmail.com
Cc: broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v1 3/4] dt-bindings: regulator: mediatek-dvfsrc: Add MT8196 support
Date: Mon, 23 Jun 2025 14:01:43 +0200
Message-ID: <20250623120144.109359-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623120144.109359-1-angelogioacchino.delregno@collabora.com>
References: <20250623120144.109359-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a compatible for the MediaTek MT8196 Chromebook SoC's
regulators over DVFSRC.
This SoC has only one regulator "dvfsrc-vcore" and different
values for vsel compared to the others.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/regulator/mediatek,mt6873-dvfsrc-regulator.yaml     | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6873-dvfsrc-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6873-dvfsrc-regulator.yaml
index acac5c869f2c..685ccf9cf4d4 100644
--- a/Documentation/devicetree/bindings/regulator/mediatek,mt6873-dvfsrc-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6873-dvfsrc-regulator.yaml
@@ -21,6 +21,7 @@ properties:
       - mediatek,mt8183-dvfsrc-regulator
       - mediatek,mt8192-dvfsrc-regulator
       - mediatek,mt8195-dvfsrc-regulator
+      - mediatek,mt8196-dvfsrc-regulator
 
   dvfsrc-vcore:
     description: DVFSRC-controlled SoC Vcore regulator
-- 
2.49.0

