Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B068226865;
	Thu,  6 Feb 2025 11:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738840128; cv=none; b=VdAle3Xc9S+nEDZ3IsCIXTwrsWVN0AufsZlaOHZhrWoaem4h5EYqoRrrY6oXb9N2PSvo+s4cKwIUMbhY7LohmhpxtIj1/JRxIJw0hs02EbrizptyMOyKrjGK8KrCgwqXs316PgpIQaEOWNyJSHej5XJevqEvsxokL/5da2e6B+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738840128; c=relaxed/simple;
	bh=B96pNeVP/csttWGc2+txPTceRHARr72NUxlrXzj7tYc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ODgmV8dH4WtTSARso0bEQ85Fi6B6cE36bkltb691mN2ghiIrlkcNWtR6JncjYNQc9dC2i2v9YuyWJuCydDcP31pZJc0yYa0rj/H5Al6dA2OI4Pe4Hfxoxg6kRaOOgGkJnreLdfgYaH07/y8gNeh9KT11MsP5d46tcjsC44sEJOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=hexXYyR6; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="hexXYyR6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1738840124;
	bh=B96pNeVP/csttWGc2+txPTceRHARr72NUxlrXzj7tYc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hexXYyR6Y7wgHWSYswcPQe36UCjRD6P/ph0NJHRow+198GyHWT4328ySIFBRnLTbn
	 KHFnNJXAwfwG8vsnL1pRJtpaRTdv0G39UiBvAN2kglfzf1oQtcYsTiUhJRCdR0hmx8
	 mfFv6RP+icHaW+3ACzhm1GEROHgoWYf4QxDto/r4t7pxv8eUqgars3ovtztCr+JRIy
	 aLbKjX/87xczCfwOUTKjIdYyb9pYbU3S3fwv1LiUis+Dl7I+UOptiFyq5X9dJupu3u
	 qHXGZzNlr9MBopCoJrdmD0Ygot8ZMgLoShUekFEpflN3V8+LJHduNBsIa274AuDWje
	 IXA78/6WZDqvQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2459917E0FC3;
	Thu,  6 Feb 2025 12:08:44 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 kernel test robot <lkp@intel.com>
In-Reply-To: <20250108083424.2732375-1-wenst@chromium.org>
References: <20250108083424.2732375-1-wenst@chromium.org>
Subject: Re: [PATCH 1/3] arm64: dts: mediatek: mt8173-elm: Drop pmic's
 #address-cells and #size-cells
Message-Id: <173884012408.110657.5683585328217308497.b4-ty@collabora.com>
Date: Thu, 06 Feb 2025 12:08:44 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Wed, 08 Jan 2025 16:34:21 +0800, Chen-Yu Tsai wrote:
> The PMIC has child nodes for each of its functions. It is not an actual
> bus and no addressing is involved.
> 
> Dropping the bogus properties fixes a DT validation error:
> 
>     arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: pmic: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
>             from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
> 
> [...]

Applied to v6.14-next/dts64, thanks!

[1/3] arm64: dts: mediatek: mt8173-elm: Drop pmic's #address-cells and #size-cells
      commit: aaa0b40e157c65aaa5e0ad903675f245333381bb
[2/3] arm64: dts: mediatek: mt8173: Fix disp-pwm compatible string
      commit: 46ad36002088eff8fc5cae200aa42ae9f9310ddd
[3/3] arm64: dts: mediatek: mt8173: Fix some node names
      commit: be035e4a26edf8fdcbc4fe95d16c28deade13bb0

Cheers,
Angelo


