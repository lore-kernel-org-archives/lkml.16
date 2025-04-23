Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8524430;
	Wed, 23 Apr 2025 10:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745403571; cv=none; b=lk+lbWilTb+5DvfbHVLaSqzmJuJmM3EN8AlnMTyHsRbNwNWBDpgA9GAdrd4kP7yYpdKxtZeil5DeYnDTtizS+EsorjLdi1goMdgwP+ME/fmUJuIDHY3/NPFg0gy1Bg6psidY2QS7yF3A1R/KnGBPvnkL1dl+KSSR0joJE2OD8Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745403571; c=relaxed/simple;
	bh=EErdEvkJZMomWj346FuTips4HSCS6BxlmBws21IXYso=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nLsPBIjYYfREHJmqWSAcGdbe9zg+tUIr6j6v78cLMqBBUPDdccjpNxps+nfJXjFF48YA63mb1E2rftKWdPUwTPmCETAwMVXwITClkd6rC5+D0Iqi5izChFQOvVKun+6KjQ1kCBfIDaWcoDG1wls8Zp9rNY1bXo6IOYid/mspQbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=SZg4ekLb; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="SZg4ekLb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745403567;
	bh=EErdEvkJZMomWj346FuTips4HSCS6BxlmBws21IXYso=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=SZg4ekLb9WzZnjsZFcLoTYV7rwAq3ALY3FMkS9R1RbijO8AqgtNq7raPnsv+bgkAN
	 GrCSO8Aiqqu52TYlhkzF9Icz5vv98EW0ER4EdXfUiG8gJBFcZFXEXcVeYV41tfRuIV
	 XHZ63x7jm1E5fQO4TdkjSGc1zUpdQHrQDT45Av4juFw2XZRRMMHf1CQujJKx7DQXCl
	 g8Zj+mlB+WUKDCH6y5MtVd/bHm6+ypsczbuFxnn30o3YkYzuSEwvyeYt9DW79+GyQq
	 zzG8SnDUR5olrdoXXf5ERp3PX7ljipA+PKlCUBvJ/GiS4T8nHyOQy9vqKDcalMMXhx
	 Ok+IrPwSoUqFA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C8BD017E0B56;
	Wed, 23 Apr 2025 12:19:26 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: kernel@collabora.com, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Julien Massot <julien.massot@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20250423-mt8395-audio-sof-v2-1-5e6dc7fba0fc@collabora.com>
References: <20250423-mt8395-audio-sof-v2-1-5e6dc7fba0fc@collabora.com>
Subject: Re: [PATCH v2] arm64: dts: mediatek: mt8395-nio-12l: Enable Audio
 DSP and sound card
Message-Id: <174540356673.70458.18087445471288730073.b4-ty@collabora.com>
Date: Wed, 23 Apr 2025 12:19:26 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Wed, 23 Apr 2025 10:53:13 +0200, Julien Massot wrote:
> Add memory regions for the Audio DSP (ADSP) and Audio Front-End (AFE),
> and enable both components in the device tree.
> 
> Also, define the required pin configuration and add a sound card node
> configured to use the ADSP. This enables audio output through the 3.5mm
> headphone jack available on the board.
> 
> [...]

Applied to v6.15-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt8395-nio-12l: Enable Audio DSP and sound card
      commit: 2521f47606eaffb2e477ea0b2985d2d8e31aa563

Cheers,
Angelo


