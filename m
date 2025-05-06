Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561F21C5D59;
	Tue,  6 May 2025 08:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746520976; cv=none; b=Ot+/Y4kVG+Q8I6c39lqoBUxmVkcuepJmqZT2z9/IbtH67HYK7ZNzO1iLOOMqvsPZWsOfR73k11QmisH8ae+J0qpsQ2pRf0DZNIcDyqw6d4qUqUd89iiyb7fqNOG7oU8KKqVvLCCk0L5WxhdBAdzGgD0HLChYRq8n6YUWxYi189w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746520976; c=relaxed/simple;
	bh=xXrV5sJy2YN03zB6YMQd1Drv9Vecw4PQ52fv42Y+onU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jhXzJKKkfr4yrOqra8FtdNJoEzVvanbWEgnPK9jiTpl9A1NdDBSkkRoos0p8Uyl9vhxnGRwoImVSoZRe/devDuDMhRSqr+kzVdzjAdmUGAj7i9J5h4TLf8blzMwid2q0/Plg+YigdCbQcvpMxeqON3HpQqSS1ij4Au0lHekIGBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=eazbjYt0; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="eazbjYt0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1746520972;
	bh=xXrV5sJy2YN03zB6YMQd1Drv9Vecw4PQ52fv42Y+onU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=eazbjYt01MAGEISOlrnbDj5/vpoxS7MNfuRkBvTSeX89FzSK+5j0hFPlZ2niF5Sqv
	 H+i3O9fWpgEUDovXky/9V/6Eurm6aVf5WJmw32ux9KJr265QEdtBmlhPTInetnJipq
	 Oyn7rqoDLuNHzQM8qeKETx2oTexxGIjH4jgkBj6O1eJuhFKz12Pz3WEcAQbdRw9MCd
	 Km39RBJHjw1wt4HycVbvqRIHktEzoUWfgcYA9dpaVIgcjXUsMFlo2lFafxdjiNL/ni
	 zYn9P8nVSn7u02L7pObFIo655f3vu/e7ruoqhbTvkvSzrye/6qs02bP+7NvoLUaXmY
	 czXQt3FS7CXOQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DAF9517E10D8;
	Tue,  6 May 2025 10:42:51 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20250502-genio-1200-disable-backlight-lcd1-v1-1-c021d2c9e48e@collabora.com>
References: <20250502-genio-1200-disable-backlight-lcd1-v1-1-c021d2c9e48e@collabora.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8395-genio-1200-evk: Disable
 unused backlight
Message-Id: <174652097181.119919.737275230947353640.b4-ty@collabora.com>
Date: Tue, 06 May 2025 10:42:51 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2

On Fri, 02 May 2025 08:42:56 -0400, Nícolas F. R. A. Prado wrote:
> The builtin panel on the Genio 1200 EVK board uses the backlight_lcm0
> node for its backlight. Though the backlight_lcd1 is currently left
> enabled, it is unused, and its pwm input, disp_pwm1, is disabled, so it
> fails probe. Disable this unused node.
> 
> 

Applied to v6.15-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt8395-genio-1200-evk: Disable unused backlight
      commit: 0eae9cee0d74c09f5ee7ccc0dcc6b7fbb669f68b

Cheers,
Angelo


