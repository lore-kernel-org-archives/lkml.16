Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B88825F78A;
	Fri,  2 May 2025 16:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746204209; cv=none; b=no/tU1R7sBTxvbTAkE603TsvaDF+bqsVwIQj/G4aiWoM4n6iykcCkmptvJV/Nx/Cjjglge4HlxM56cN5sZV2qzQkEOb+1DR2a+9weDIuw6Qnk8aKTCO7K1h/NClh9WQZt9SnwkVnysZMmXSoPBqJD8qximvbW3Dmf23bP6pQ4uU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746204209; c=relaxed/simple;
	bh=yw1w5T04gn1gvO0Eacj6I5K1Un/3y0OZ9jtnwYuxfQs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BG9OPWAsX/q311tAWVTK04b2U1lLq2QI7lOGmkgMbNcu71kGJRez1b+ySoYKPSYayE8Asq5vP7OD7M+dtsBgmsn6eiMPsF+BRk61IQWcrLClseEmx4UGYxWkkvBkk330xRtYiSdtt4l+kjtO9DD3cUxyP6K/V6Ffm5aTxEwkvPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ZlhKchsb; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ZlhKchsb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1746204205;
	bh=yw1w5T04gn1gvO0Eacj6I5K1Un/3y0OZ9jtnwYuxfQs=;
	h=From:Subject:Date:To:Cc:From;
	b=ZlhKchsbqYhfIVV4s70fGnYsp+E1osDveIH6MLobr/hdKC9sDWd1sDPYepOJ86Nvr
	 A5zbLtspETWeaG9Rwnk6UGMnZHSrbVDnSZvsiOajp0nFU2y1u5Yv+J8+MI6qI3jcRl
	 zg3+DK5SwEUk4cSVHzyxX/XQDZOgtrBo+YuBIo4WHXhUDduMWsu+VlHGE255GmU6uW
	 HE/N5PgfrWAi6VM5foTbQqnioTobveP2kjZQ3uX1inOKNXZXNzUTjgbwR6Ahe7m/lo
	 I/+vq99PmhPF97LS3r/tEEnCUb6yR53qB62yhaypSEKa3cARlwgyUR8FQSZQ3wc/pD
	 1lnmAZs4SHhxQ==
Received: from [192.168.1.63] (unknown [70.107.117.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 42A1517E0858;
	Fri,  2 May 2025 18:43:23 +0200 (CEST)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Subject: [PATCH 0/2] Correct MT8365's infracfg-nao DT node description as a
 pure syscon
Date: Fri, 02 May 2025 12:43:20 -0400
Message-Id: <20250502-mt8365-infracfg-nao-compatible-v1-0-e40394573f98@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIACj2FGgC/x3NQQqDMBBA0avIrDsQ00SLVykuYjKjAzWRREQQ7
 97g8m3+v6BQFiowNBdkOqRIihXtqwG/uDgTSqgGrbRVVmlc98+7syiRs/M8Y3QJfVo3t8v0IzR
 dMGHq2RruoUa2TCznM/iO9/0HdP/nXXAAAAA=
X-Change-ID: 20250502-mt8365-infracfg-nao-compatible-46d4db7f54f7
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Amjad Ouled-Ameur <aouledameur@baylibre.com>, 
 =?utf-8?q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>, 
 Fabien Parent <fparent@baylibre.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2

Introduce a new compatible to the binding and use it in the infracfg-nao
node in the mt8365.dtsi to correctly describe the node and prevent probe
errors.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
Nícolas F. R. A. Prado (2):
      dt-bindings: mfd: syscon: Add mediatek,mt8365-infracfg-nao
      arm64: dts: mediatek: mt8365: Describe infracfg-nao as a pure syscon

 Documentation/devicetree/bindings/mfd/syscon.yaml | 1 +
 arch/arm64/boot/dts/mediatek/mt8365.dtsi          | 5 ++---
 2 files changed, 3 insertions(+), 3 deletions(-)
---
base-commit: 37ff6e9a2ce321b7932d3987701757fb4d87b0e6
change-id: 20250502-mt8365-infracfg-nao-compatible-46d4db7f54f7

Best regards,
-- 
Nícolas F. R. A. Prado <nfraprado@collabora.com>

