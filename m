Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84B3194C86;
	Tue, 15 Apr 2025 07:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744703409; cv=none; b=rGEQXQbqfD6hFGIXy8bXuL+A2Hw+UWTLxK0WO1yx44KpR5rrrN62tC3pC77qZRrPYBIPUGnzgym7zzw5IKnFd+DX9fKAi4Dd6/9NX9AvL4ykM7ylOKEhjkgjvD1BQN/Z/799kMkUJmTLK/nZ8R4Z8TdVG9UlofQlzaBnqCPvLW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744703409; c=relaxed/simple;
	bh=ZSydm9Jlx+I1aH900HrLtzFJRplcxK22NCacX8LxP4s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=YqwU725Au27WtiU7qAS/TufRbCtdfLxq6NnoH94LRo/eTaBBu1NCchnc1wugeF/Ha+9oDigX3k0ojua5S9FxKDIA/bUiqGdyvjIRAmxa/FkJIPZSY0zaVl2q24XxkxKSwHlVVuQxw13V/hGDkrWTta83k7mouNKrECm7cmuG2j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=WWI9D+B9; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="WWI9D+B9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744703405;
	bh=ZSydm9Jlx+I1aH900HrLtzFJRplcxK22NCacX8LxP4s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=WWI9D+B9tLo4kylUCqMTuhqvPIDHD7Qzag0J/WLsfI1ZLdrb2taQv8V5YscJjQK4/
	 MNxKLWcZKjAdFQBV6JuK/pXIrDLr23zsmLp0O2ykMMAlDm1OE6+Fp8TX7l8bpCOLCR
	 AJhEz8Xu74ppF+hz/6NL7FGvSerfwn6j21imTQiMAX/AFLH3N5Z08/BqgkHCSJpGcX
	 Y+ifpIQqN3WrM7ozbTKF5wOowgM9sUr3QVfKW+uOg/mMNbT3hYp5E7kBbfZIIs2cQH
	 zNg5l8ljLiQrLcN2Lh9XxtAaqmwCQyEuBynbVptCmofRiIXp/sNiP7VjoZT0IDpvCu
	 xmjNStevdO9WA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F1F2417E05EA;
	Tue, 15 Apr 2025 09:50:04 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>, 
 Macpaul Lin <macpaul@gmail.com>, Sen Chu <sen.chu@mediatek.com>, 
 Chris-qj chen <chris-qj.chen@mediatek.com>, 
 MediaTek Chromebook Upstream <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
 Chen-Yu Tsai <wenst@chromium.org>, Tommy Chen <tommyyl.chen@mediatek.com>
In-Reply-To: <20240925080515.16377-1-macpaul.lin@mediatek.com>
References: <20240925080515.16377-1-macpaul.lin@mediatek.com>
Subject: Re: [PATCH v3] arm64: dts: mediatek: mt8195: Add power domain for
 dp_intf0
Message-Id: <174470340491.18036.10677308762787483666.b4-ty@collabora.com>
Date: Tue, 15 Apr 2025 09:50:04 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Wed, 25 Sep 2024 16:05:15 +0800, Macpaul Lin wrote:
> During inspecting dtbs_check errors, we found the power domain
> setting of DPI node "dp_intf0" is missing. Add power domain setting
> to "MT8195_POWER_DOMAIN_VDOSYS0" for "dp_intf0"
> 
> 

Applied to v6.15-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt8195: Add power domain for dp_intf0
      commit: c6419e4f2ae22bf1404ac39e88c9bf0de8767874

Cheers,
Angelo


