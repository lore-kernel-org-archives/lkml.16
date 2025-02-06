Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF7122DF9F;
	Thu,  6 Feb 2025 11:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738840130; cv=none; b=ZYfRlz3lW9RwjlB5OeG89v11Gw7R1xHMd28HAgmwBwwtJbCHjmRwfNCYhffPy13SMODlFQLTILcPMhJGfrqRhG3Ff2U3mE7Bks+O9YFixZS3yEpp/dCjDhvM58CKzya6XQ+ffEESovAFzBLeM5/acjSvCDeiwCh/EbhSduSMUuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738840130; c=relaxed/simple;
	bh=8lSiNbk0Ww5hds1Fb3dZ9RfxdJ4VHhcD9zA3wffpAzc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=G5xfFlQ0DtAZ6WC54iSk7jMZYna8UxD0ALTiiftQ7SXpc7GJXV1TkUNoaDDvup4mASK+2TvxT6zoiaw82FFQACyjdXyGt2CZkGgq7UZFcIAvdYal7VKpAOTbhq59FmbL/36f8QEx4eguJ2jabTPktdZdSKknL5q1RYvv9vyOrCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=G5EI84RK; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="G5EI84RK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1738840126;
	bh=8lSiNbk0Ww5hds1Fb3dZ9RfxdJ4VHhcD9zA3wffpAzc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=G5EI84RKQU9mWu/p6S/vIjWZmyqLD4Xupzx0ar7iVdROE1VvLMXGGOd0xsIR1LAvv
	 XDbzVoi2Onc7kIRCHPkOuT6d6z8qxdbH/4VK7JuSA/aGmb464xhKAZ/1sPmptuZ01U
	 cCpvBIhFUE+6opryBpXfawlCOrEkJ8BT9yotozS06fcYAmbi9JpMV/9IB4ZfKL4qCt
	 wfEQY1GcGWNLuf0F2EMxS9iRazSQ1/H+g8Q8Cyw1yrcspRKycVJ14qxSimYZBu8var
	 UbjWN+QuH/lxw+cVlHHYYFG/1AmAzb3ymjnayW/vlrKr5HxpZrgm/vPAaC3vtNQtA5
	 TitYAycOsF1rQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0998E17E1411;
	Thu,  6 Feb 2025 12:08:45 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20250206-dts_mt8370-genio-510-v3-0-5ca5c3257a4c@collabora.com>
References: <20250206-dts_mt8370-genio-510-v3-0-5ca5c3257a4c@collabora.com>
Subject: Re: [PATCH v3 0/4] Add support for Mediatek Genio 510 EVK board
Message-Id: <173884012597.110657.15653298981143162594.b4-ty@collabora.com>
Date: Thu, 06 Feb 2025 12:08:45 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Thu, 06 Feb 2025 11:38:07 +0100, Louis-Alexis Eyraud wrote:
> This patchset adds the basic support of the Mediatek Genio 510 EVK
> board, based on the Mediatek MT8370 SoC.
> 
> It adds a device-tree file for the board (mt8370-genio-510-evk.dtb)
> and an include file for the SoC (mt8370.dtsi), in order to be able to
> boot. As the board is very close to the Genio 700 EVK board, an include file
> (mt8390-genio-common.dtsi) is also created to factorize the common
> definitions.
> 
> [...]

Applied to v6.14-next/dts64, thanks!

[1/4] dt-bindings: arm: mediatek: add mt8370-evk board
      commit: a11256de6296fd8e0122ebe067bbaa936b7fef12
[2/4] arm64: dts: mediatek: add support for MT8370 SoC
      commit: 49b07ed22e3707a120c1f4a11be9560d9d712e31
[3/4] arm64: dts: mediatek: mt8390-genio-700-evk: Move common parts to dtsi
      commit: e9a4cfe83fe27a82b92cfd6870ce1e71e414fd6e
[4/4] arm64: dts: mediatek: add device-tree for Genio 510 EVK board
      commit: 3ac908716b8297d3ba6c6010104065517ec341a8

Cheers,
Angelo


