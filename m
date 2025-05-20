Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB95258CFD;
	Tue, 20 May 2025 10:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747736754; cv=none; b=nsG7VHGu+4L8VJPRpUzL7ovBVnaZSYqtys3TxPje1cor1Z5SPaz15fhCCECIvGf/MSUKxA3Yees0VB4DraoLh1xagUKViXodExqw6pNuUTxOiBEpC4g0qxV2eeMiK5l2FClvbexKGW7PvER48t4ojQYoQWrtDJK2gqsd55Uq3Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747736754; c=relaxed/simple;
	bh=TAEOQvbzZejm7YyxqI096TZatZJmHDMuFPXOIy2uu7E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gAxYRo02ah12or0nHkdlMTkSlRXv90wVtJnPHcbSo5nF7T69Qlty3T5l6QQkvhe46Mz4QaqOjWeDOLm5aEsZj18SURyG0CwKDXHPT7bi45iBUmYWV69PvolyBUt70AJhVuQGiJ++UP7ETB0sZtiN4MBQzRUBf/F9+AEc7cysGAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=LlUv5ZTH; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="LlUv5ZTH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747736745;
	bh=TAEOQvbzZejm7YyxqI096TZatZJmHDMuFPXOIy2uu7E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=LlUv5ZTHvfYzBYBf20gv/d92kW3WgpupVE/JmMtpXqlLOkigEN1zGg8FNEo9nwdYr
	 qJUjALBEajB59/Pz2rvRAUSow6S7gZKN/rePyJ8FcVLaomg8uVPz8ZguJqdXU8FuuY
	 Hhl6YPXR4WePrjxjpJl3Dq06Hys2s9uoLgXbqBbcaoqIL1RfEh4KuqyJoT/L+0huet
	 1aHcgOb/FGOWiJhIYAmCtrS85/V9/E3/4Z20QxIUMkLozmpb4ctJPEVshNnJr3Nl3A
	 LPODYBtpEG0DAFKwbSfoSP1Dl9gVG4uk9c3dqGYuz55VObYT7LrOj5N+k4Q5gpcdT1
	 AdDrFpWvv7feQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EB81517E0256;
	Tue, 20 May 2025 12:25:44 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20250515-mt8365-evk-enable-touchscreen-v1-1-7ba3c87b2a71@collabora.com>
References: <20250515-mt8365-evk-enable-touchscreen-v1-1-7ba3c87b2a71@collabora.com>
Subject: Re: [PATCH] arm64: dts: mt8365-evk: Add goodix touchscreen support
Message-Id: <174773674488.3414755.9299343068235578994.b4-ty@collabora.com>
Date: Tue, 20 May 2025 12:25:44 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Thu, 15 May 2025 12:04:11 +0200, Louis-Alexis Eyraud wrote:
> The Mediatek Genio 350-EVK board has on the DSI0 connector a StarTek
> KD070FHFID015 display panel that uses a Goodix GT9271 I2C capacitive
> touch controller.
> 
> The mt8365-evk devicetree already have the display panel support but
> lacks the touchscreen support, so add it.
> 
> [...]

Applied to v6.15-next/dts64, thanks!

[1/1] arm64: dts: mt8365-evk: Add goodix touchscreen support
      commit: a11e6951396613cddac3d7c9119de1a9ed3feaac

Cheers,
Angelo


