Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9301E21A459;
	Tue, 20 May 2025 10:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747736260; cv=none; b=qcAomZ0BJEZKmjWVRn/xpJZ2PolU/9e4A9Gu+ZCPRlaOy/cLThH6vb+i4IzGUucxZA6XmOMSSHtGh7IUXZHgCzUQXmsIZ7Z01DQsVtxG4eQ8AjQWKK1+yblVFkt7E398nVvOPr6Jdl1xlpChYHP7wwkLuHb/5DXk48wu4EkeBSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747736260; c=relaxed/simple;
	bh=Ifwq+4sQrPiwiHLidB9FD+7sK9d0P0YTyMR7NR3l9L0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NgtOqQWL7EFCCaMGI/9bJ8yFjGugZ+oEMqfPc5RoS0uMxY1HAwCUr43SXlthReTSNOhpIi68Bml+ddWT4KBt1MHUlA/mbmBQjRKghPx64TvHVG9Erumf2FSXQw3xDtMefcuESmhuBMjMNDP7bdZMZvoplx5hsRb7D5PZlbIJWJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=QEIxwI6W; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="QEIxwI6W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747736256;
	bh=Ifwq+4sQrPiwiHLidB9FD+7sK9d0P0YTyMR7NR3l9L0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=QEIxwI6W2EzhkcTOHpbPe0Q+P7crjPgfpYomAfcDNes4uRnZEZpxCv4RmLb9BL764
	 SjEoPfnbA7MDLRZC4i/XwcrjLQQJwRz7b0pGKZ4YVh+KI9qC7s8vBbL8xByps61Fs5
	 Yz5yNM6QngFMLYkaG3VnH7dX1Ry7+1ny/tfb84aFv9OSAJguwQmlPL4+YV6u69uObE
	 vd11YhAu3lXV7Z+TorhNHuSzQLzsmnddmBaqhiqVUyEj778dB+FgpcxFWfyLgmjdom
	 s2bC/uBs8hsnvTlCOFcFLCzs4C5hP6HlfmmJYiQCh+Er7ZyevccYT/VIMqJSwOJfy/
	 2436xmwYTY78g==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 01FE417E1047;
	Tue, 20 May 2025 12:17:35 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: kernel@collabora.com, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Garmin Chang <garmin.chang@mediatek.com>, 
 Friday Yang <friday.yang@mediatek.com>, 
 Julien Massot <julien.massot@collabora.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20250516-dtb-check-mt8188-v2-0-fb60bef1b8e1@collabora.com>
References: <20250516-dtb-check-mt8188-v2-0-fb60bef1b8e1@collabora.com>
Subject: Re: (subset) [PATCH v2 0/2] mt8188: Fix missing reset DT property
Message-Id: <174773625593.3349397.17577929635364837450.b4-ty@collabora.com>
Date: Tue, 20 May 2025 12:17:35 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Fri, 16 May 2025 16:12:12 +0200, Julien Massot wrote:
> This patch series addresses some issues found in the MediaTek MT8188 device tree
> and its corresponding bindings:
> 
> The #reset-cells property was missing in the MT8188 clock controller binding and
> device tree nodes. This causes DT validation errors.
> 
> Patch 1 updates the binding to declare #reset-cells as a valid property.
> Patch 2 adds #reset-cells to all affected nodes in mt8188.dtsi.
> 
> [...]

Applied to v6.15-next/dts64, thanks!

[2/2] arm64: dts: mediatek: mt8188: Add missing #reset-cells property
      commit: fb77e7878bea92e7329b262e728eb6b4ac2d8768

Cheers,
Angelo


