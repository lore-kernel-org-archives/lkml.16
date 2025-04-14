Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F2E265CA1;
	Mon, 14 Apr 2025 09:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744624395; cv=none; b=Ie25PHvMrNtSp8kxvhAnIMZh0llczyhMRtaTVO9Fase2fow+T/kdF2xG2TRUn8Wh6PKYqMd5oeigMD95+NRI7dn/ZpJCg4Us1AR6m08gRqprpF48J38qwr9lHEX7ZaR+0NTyLQZx9HwZ8uCv4ecbZmSumLbn7+kLHZDrRJImG9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744624395; c=relaxed/simple;
	bh=bKZzCz1CP3LH33ZWeRUb98lubrqCg8Gf2ftBfHQfUf8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NWvcImMvkNPFNMQwBbJYhJJtbNIkfQzIYAKcCIkuX0zJqZfQlUbSpPa+m5nWVSYw6vzDhwUkH2Ek5OmgRNbpJI9gykjCxmTWtVaQ0rjZ3ASiYF0nph3AXl1kVHQoU7qvQ4thpom4lehWIgIP2Hnf7z/G4hab61yPKMm2D+nfg+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=J0Hi9utX; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="J0Hi9utX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744624391;
	bh=bKZzCz1CP3LH33ZWeRUb98lubrqCg8Gf2ftBfHQfUf8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=J0Hi9utXN+SQeCL6FtSw1u0vQ/IJ7bHX3zsvMrbSevV8Bx17zvJIPGpvG4PgOkOxT
	 VUl1Or7hLJxk6YeWxufmDSM4NAO8HI7mGLfqR2nsGaiZguW6cf8ou+uqe83WuvnVmJ
	 eZYINYeNP2FaZs9tO9P5j2wAGWj1fSGb0RtmnQyjRJ0pX7hhDusGfcA9yejD67NOkv
	 lp7uIn7bK0W4FmikU/blQCjisp3cCebP/8/gagdsTllvZJ8hUjET5e5nM3LYj2YZ57
	 TYBM/wzQyKC/KwAkMGVNw/PbXsRaAnoO9clceCsl4FXbBS9MTFgCSnDvym20Iw4WHs
	 KilYVQZID3QOA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 63DAA17E1134;
	Mon, 14 Apr 2025 11:53:11 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 =?utf-8?q?=C5=81ukasz_Majczak?= <lmajczak@google.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20250328121300.2612942-1-lmajczak@google.com>
References: <20250328121300.2612942-1-lmajczak@google.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8186: starmie: Fix external
 display
Message-Id: <174462439133.45420.7264628017920404731.b4-ty@collabora.com>
Date: Mon, 14 Apr 2025 11:53:11 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2

On Fri, 28 Mar 2025 12:13:00 +0000, Łukasz Majczak wrote:
> The dpi-default-pins overwrittes the same called node, defined in
> mt8186-corsola.dtsi with the wrong set of pins, so remove
> it from mt8186-corsola-starmie.dtsi as the first one is correct and
> sufficient.
> In addition, remove dpi-func-pins node from mt8186-corsola-starmie.dtsi,
> as it is not used anywhere and also defines the same set of pins as
> dpi-default-pins node already present in mt8186-corsola.dtsi.
> 
> [...]

Applied to v6.15-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt8186: starmie: Fix external display
      commit: 7d346bf124282d0326dd4f1b104b2d07d902ef23

Cheers,
Angelo


