Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05058259C89;
	Mon, 14 Apr 2025 09:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744624394; cv=none; b=Irxdxg1cOl797jz74/CYDbbexdwOKIwNHankXcSLyeoveLKeCj04QLzcDsZbDlSYHCw+g1dkQCVQuzRu9KhNqhHyCbCQCq94D++1uuNUbbjKlc2oCmOq/FM2Sc2HfolmvKEZi1vtHbVMBfp59ey1lARHztM0HBDiT/EhQhAM2MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744624394; c=relaxed/simple;
	bh=yvlYf0lgTFOTR2e19nZHR4rkgRdNU9AGWdXDAjN0rnw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=BPsqhyKpJFEU6iGWVL7N+UNualPkVkIgpHZ3WY3Dbd7TkNUHpkweaLLUuZmvKrrevRKvzVx6VADHPbh88qSDyhty7ZPbMDEdCcg5DWRI7tZWJtBhJNxK99Jd8kNYCmyjreThgZcMTW2zOXi20tXU90Fdj0rl68qv3lwHtk6z+2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=GRoGQATZ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="GRoGQATZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744624391;
	bh=yvlYf0lgTFOTR2e19nZHR4rkgRdNU9AGWdXDAjN0rnw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=GRoGQATZhCuJ+tpYk6h069OuC3HLH+dn6ET/9LtFYGAnE95p6TQRTBydXob7CX9Jb
	 cish8Tgwqe0Gjeuxp5+2oXY2PV/0H/F8VWQqSoswPM/5y6sfzDxSAstuK1aMfgGKF2
	 Pp7/NyHfJWrqladE4Kam6dRGoZ5M8qhOISj9ehhA9I0DoaINdwZyDOejQDzHReBUo2
	 W6ItpZAAhC3vQOu7WtyldsINDMFmsPS1kONIkfHiD5GZBPTiJhfk38cy0vjOvu52hk
	 cRcCyZldx/cnr3i6KDp5iE5r/JzztGxVeQamrJ+jywRl04XF3Hd+BBPz8qmohKc5AN
	 apWRWchPznwvQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7EA2517E0FA7;
	Mon, 14 Apr 2025 11:53:10 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 matthias.bgg@gmail.com, weiyi.lu@mediatek.com, tinghan.shen@mediatek.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com
In-Reply-To: <20250402090615.25871-1-angelogioacchino.delregno@collabora.com>
References: <20250402090615.25871-1-angelogioacchino.delregno@collabora.com>
Subject: Re: (subset) [PATCH v1 0/2] arm64: dts: mediatek: mt8195: Power
 domains fixes
Message-Id: <174462439044.45420.1600636248450657277.b4-ty@collabora.com>
Date: Mon, 14 Apr 2025 11:53:10 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Wed, 02 Apr 2025 11:06:13 +0200, AngeloGioacchino Del Regno wrote:
> This series fixes hardware access issues happening on the PCI-Express MAC
> and on the video encoder and decoder IPs embedded in the MT8195 SoCs,
> fixing system suspend functionality.
> 
> AngeloGioacchino Del Regno (2):
>   arm64: dts: mediatek: mt8195: Add subsys clks for PCIe power domains
>   arm64: dts: mediatek: mt8195: Reparent vdec1/2 and venc1 power domains
> 
> [...]

Applied to v6.15-next/dts64, thanks!

[2/2] arm64: dts: mediatek: mt8195: Reparent vdec1/2 and venc1 power domains
      commit: 394f29033324e2317bfd6a7ed99b9a60832b36a2

Cheers,
Angelo


