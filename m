Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740CC258CFA;
	Mon, 14 Apr 2025 09:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744624393; cv=none; b=Y2B7uD8OljMl4tw2tdzepK/tWdquXFLHQQGlXq17g9J5990d3ppRCnxOOiVVGqn+y+FkTUU+v6HytqWnq7iP2qMfBlMdvzQBqsBaqKnjLtGj+/q1+InHACLwgpN5YuWVfojt1t6scH6ZT+ZlqLr8Iq/Aug0ShAUxKr3bO+dd7co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744624393; c=relaxed/simple;
	bh=IyUJULX3S9F86yY+MBzb6IpODO+Fjku0dWLZ+d6MTyo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jbsFJiGNKZ4abzb8IJ3YSMuPUg7NtSfptaMcO93agoPisw57gdmrEuKJQg9po55tw6l8e6Xd6wrLh+mENO05HlhtdAXclvVYvl8+JYne6X3atph197MHIJZH7wQkiXuNTriEvBTZQDmylMn4iLHBJor0QXcWLsW/BxuLMP7FoFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=pgVghn2r; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="pgVghn2r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744624389;
	bh=IyUJULX3S9F86yY+MBzb6IpODO+Fjku0dWLZ+d6MTyo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=pgVghn2rFLDSz2CyLBQwjFhctJJpfsFLpIirK4jpP+AeGPiymdfEL2iP4Fk2PPeba
	 pY5I28DN+kiAsRD+Pnmft8ijLjrca0VJJvUjB2iVZKJjbWT0Q4ja9rerpYZAJo9ihX
	 WyUXbJbaRJts2NtDbS9md9M0NpgW51e4eK23bWeeHu6EENQwqTKvpWpgn3dl9O5kP3
	 Qzng0GCgce85ccJSbayvmnKH86ZiDTn5/dEhmS6EOwnsOq7qKcfAr4yJ35ehWyqsj2
	 ss6ZJfDuYkL+oYKQfiVkCHVDDHXaNv2WVmcK3gsYq73UY+rV4MUu+2WGbWwNIW1tsD
	 y7filbTK6suPA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CF0F717E0B2D;
	Mon, 14 Apr 2025 11:53:08 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: kernel@collabora.com, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Ben Lok <ben.lok@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, 
 Julien Massot <julien.massot@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20250404-mt8395-scp-fw-v1-0-bb8f20cd399d@collabora.com>
References: <20250404-mt8395-scp-fw-v1-0-bb8f20cd399d@collabora.com>
Subject: Re: [PATCH 0/2] mt8395 evk/radxa-nio-12l Add scp firmware name
Message-Id: <174462438876.45420.17746859867789680611.b4-ty@collabora.com>
Date: Mon, 14 Apr 2025 11:53:08 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Fri, 04 Apr 2025 15:53:08 +0200, Julien Massot wrote:
> Add missing firmware-name property for mt8395 genio-1200-evk and
> radxa-nio-12l.
> 
> To: kernel@collabora.com
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Matthias Brugger <matthias.bgg@gmail.com>
> To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> To: Macpaul Lin <macpaul.lin@mediatek.com>
> To: Ben Lok <ben.lok@mediatek.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-mediatek@lists.infradead.org
> Cc: kernel@collabora.com
> 
> [...]

Applied to v6.15-next/dts64, thanks!

[1/2] arm64: dts: mediatek: mt8395-nio-12l: Add scp firmware-name
      commit: 898b289ac89bcd0c793bb5b894d29599ab447fd5
[2/2] arm64: dts: mediatek: mt8395-genio-1200-evk: Add scp firmware-name
      commit: f19d67bbe6cbe375dce9976ad1e9690aaeaa33e1

Cheers,
Angelo


