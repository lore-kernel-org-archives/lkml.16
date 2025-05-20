Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1430268C46
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 09:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747734248; cv=none; b=MvKR8MhhtgNQo87rfSLYvudT0ueE+SulgPfmsQRe6bhKULKoH2rGf7RRazKdVo3+0QQkdWsD1o/9apT1AzWHLsdKMxe4+RYKbugU68/hzAD7lMzJHb7n6VMWy5byLBWPd2onIRyPYqGGkjeZ6B9Weo4XuFTcbvbd9HU1o144QcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747734248; c=relaxed/simple;
	bh=WaDOA0nhLVn0g1cG6OcvRA1CfBIZaKfZuXaM3IJmSSg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ZH8Kbz3LD+ZA7ByLW9a95aUHLHZgLqwClkauDx4p6v9uqXMTioRCndpOKllwCPuP6IbLBBBS//EDkUS+D8gwxpmN/VXTpVTOgpKZICoY1PP7cQIAw/Fz+klWCstLyW/uC3wACLdH75FVwFo0uDhwhTqOc7nNUewkUb2M/CbhtQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=RcxKMs/D; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="RcxKMs/D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747734244;
	bh=WaDOA0nhLVn0g1cG6OcvRA1CfBIZaKfZuXaM3IJmSSg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=RcxKMs/DjTuhcwv/Qud8AMpfWEmOOzGLo49z2+n6mJc88iW3vTfZ+KlmoTtlUBNcs
	 43h5nuWQQLmqIhpXxFqipz+NA0PZJyrNR3jL+m80XnC3/4AZ2KBG8MBgDbdbPljq3v
	 NyCEzRaIXHGzZdNyGaxc/l47F5btNls6+WFL91w22LKDT8oeznNK4OCO/0jbp2WLqc
	 kyj7/DpBnYBu7l2sDaZVEhFMjmTDxsnJ0d6KqdEmMADBCmUnU9gipUxKD7mb83Ukfb
	 uc3O0tyJWrwCMs1RYGG1qsZlRyIjTG1HBCDHbDPhkKxuWf3uEjKtemXBvaE94/b686
	 4A7IWsWhC/b4g==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 52E7F17E0FD3;
	Tue, 20 May 2025 11:44:03 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org, 
 Vignesh Raman <vignesh.raman@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, 
 nfraprado@collabora.com, krzk@kernel.org, daniels@collabora.com, 
 airlied@gmail.com, simona.vetter@ffwll.ch, arnd@kernel.org, 
 ck.hu@mediatek.com, laura.nao@collabora.com, matthias.bgg@gmail.com, 
 tzimmermann@suse.de, mripard@kernel.org, lumag@kernel.org, 
 ville.syrjala@linux.intel.com, jani.nikula@intel.com, arnd@arndb.de, 
 geert+renesas@glider.be, wenst@chromium.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250512131933.1247830-1-vignesh.raman@collabora.com>
References: <20250512131933.1247830-1-vignesh.raman@collabora.com>
Subject: Re: [PATCH v4] arm64: defconfig: mediatek: enable PHY drivers
Message-Id: <174773424323.2901578.2896521674718860573.b4-ty@collabora.com>
Date: Tue, 20 May 2025 11:44:03 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Mon, 12 May 2025 18:49:24 +0530, Vignesh Raman wrote:
> The mediatek display driver fails to probe on mt8173-elm-hana and
> mt8183-kukui-jacuzzi-juniper-sku16 in v6.14-rc4 due to missing PHY
> configurations.
> 
> Commit 924d66011f24 ("drm/mediatek: stop selecting foreign drivers")
> stopped selecting the MediaTek PHY drivers, requiring them to be
> explicitly enabled in defconfig.
> 
> [...]

Applied to v6.15-next/dts64, thanks!

[1/1] arm64: defconfig: mediatek: enable PHY drivers
      (no commit info)

Cheers,
Angelo


