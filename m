Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030F922C328;
	Tue,  6 May 2025 08:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746520976; cv=none; b=EIwqYSxh4ApXZn6ZJeRVV9eo6EM9Aut3toU4X/tI5Nzd4KoDpuekLTZ6LElkOBoho+xSTNxoAfzCjKjk5fHlPY2kYQjE6V/JFELwgXQGV6gombvW80iAdnRQkZTuNJn77HwbI5tApdFAjwUGYbjyzImNATCcHTNfENBiAgHePgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746520976; c=relaxed/simple;
	bh=HVSA/f8ngYKv2PGABAW8NreyMXgo8DAkmUqwnuGJrdo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=sScHLxpe1DOZuHISr1d9GeYp4g8gLaEBvrGCJRDNPbQVgo9PjrR9G1uVzOd0lgiYCPj/ye0yZ6ICCy7ekOcT5H7Xt2O2POR+rAMAMEV+pHKMxBJdrkdh7RffkBxHXGUeLyVpUSdWuMutICzK+/EZeV62Ypoo353HSuxDqnjiR7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=kRXBSD6B; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="kRXBSD6B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1746520973;
	bh=HVSA/f8ngYKv2PGABAW8NreyMXgo8DAkmUqwnuGJrdo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=kRXBSD6BUCQpEaVubdqqssc+hVFKNSOZ0y/3crIK1bXqEB0WBTM4ccJwRlyhoEAFH
	 bj8e+Xlkx+nssA5+QVPwajqJgq7HO7olKoclX4qkPHkk97PpCM0KulGhTwSTjSHr6v
	 wHKQ0AGKd2aURwfQWqwJNSqCIy+LlbB1PC4wkZ66Tp5G61y61jYryBP7eULVdy1+g9
	 1TM3D4+uKXHOt6/GUOjp6xWEp36RvmLA3SnLrTB5PZDf4TWUL++9ony48/kIylRjmk
	 iizUHOLtG2WtXImGOOb0d9WD5XRj6Hs9yStZgQhGn0wjsHRkglCvVyY1V4Z/YBBOyd
	 W7yJe2bY2KhNA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A85A817E153A;
	Tue,  6 May 2025 10:42:52 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20250502-mtk-genio-510-700-fix-bt-detection-v2-1-870aa2145480@collabora.com>
References: <20250502-mtk-genio-510-700-fix-bt-detection-v2-1-870aa2145480@collabora.com>
Subject: Re: [PATCH v2] arm64: dts: mediatek: mt8390-genio-common: Set
 ssusb2 default dual role mode to host
Message-Id: <174652097261.119919.932042428704090741.b4-ty@collabora.com>
Date: Tue, 06 May 2025 10:42:52 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Fri, 02 May 2025 15:17:19 +0200, Louis-Alexis Eyraud wrote:
> On the Mediatek Genio 510-EVK and 700-EVK boards, ssusb2 controller is
> one but has two ports: one is routed to the M.2 slot, the other is on
> the RPi header who does support full OTG.
> Since Mediatek Genio 700-EVK USB support was added, dual role mode
> property is set to otg for ssusb2. This config prevents the M.2
> Wifi/Bluetooth module, present on those boards and exposing Bluetooth
> as an USB device to be properly detected at startup as the default role
> is device.
> To keep the OTG functionality and make the M.2 module be detected at
> the same time, add role-switch-default-mode property set to host and
> also fix the polarity of GPIO associated to the USB connector, so the
> ssusb2 controller role is properly set to host when the other port is
> unused.
> 
> [...]

Applied to v6.15-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt8390-genio-common: Set ssusb2 default dual role mode to host
      commit: f9167f15dd4e70b124023a2f7ba2b09401b3b6ff

Cheers,
Angelo


