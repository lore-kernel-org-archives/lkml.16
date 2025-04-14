Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80194266F19;
	Mon, 14 Apr 2025 09:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744624396; cv=none; b=Ps2Be8MYbyuWUAt88CFl5UQeDJKFpeJ9M/PNDDrMqRZ6YZvyij6KcpFzDq9nYAFnllnY+M67zKnn6jPGhJEKFXlHOzNPKehOYyIUI4azbO8oGiyZevEJ04tiYf7ocqF6DxU9b7vzRkinpa2W9Ahfh6CgMtOU/VToLOjOq6HLAYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744624396; c=relaxed/simple;
	bh=7yiHK60DhprzKhGNIX1fruwTLFwzej2Kyqv50AvzX/A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=d1kfAB1L+Omqx/sEC2110aiaAy/jjNlwOZmcRAhpRKFxhRCKYA6Ejd45u9jJ0E/lPoXac7Fi2HH8sauXhGRepnn86vwQzvbAaO1Azdm4VwXmCtuPO5RQMMya+733kmJ8Z+V4c5q9d1Ir1GKIJyKSQCU/N9hUR8q+q24aB3PZsnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=UHkhIsaJ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="UHkhIsaJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744624392;
	bh=7yiHK60DhprzKhGNIX1fruwTLFwzej2Kyqv50AvzX/A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=UHkhIsaJB6swO6iBEaBg97cIqBfUw5fvjWLH5IqGHi//QVBxpsW6osgfuIUHkMLyL
	 KTkTSJ+prcsD/WgWyCQmzdhQ0wWU+spd5TE24gBHwIhYgflHl2CzGDGJhp/8JtKvJw
	 6NjVQswHTGaAAp+DTQZyUadsZTdr8NNsO20Rtqx6GC3Bp+ewQwnssiVor+iVs5g4c/
	 GHMeuuhXB58VtcBCgAYnAAxfL2Sv7aYB5oM0Wkt/Iqbu7hHAjhp6xQIWL2UIBYKxP9
	 wln6TeLn0Ym0uEbjrp1Q0L8yBSza/otXcJ8pA24BCJAb5jG+W3/+dY5YI/uMs1+dct
	 KVZROnRkw7ugg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 23B9617E14EF;
	Mon, 14 Apr 2025 11:53:12 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20250304-genio700-accdet-dts-v1-1-86d77c5cc745@collabora.com>
References: <20250304-genio700-accdet-dts-v1-1-86d77c5cc745@collabora.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8390-genio-common: Add jack
 detection with accdet
Message-Id: <174462439206.45420.6727023772221653939.b4-ty@collabora.com>
Date: Mon, 14 Apr 2025 11:53:12 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2

On Tue, 04 Mar 2025 18:43:49 -0300, Nícolas F. R. A. Prado wrote:
> Enable audio jack detection for the Genio 700 and 510 EVK boards. This
> is handled by the MT6359 ACCDET block, which on these boards has the
> HP_EINT pin pulled high and connected to a normally open 3.5mm jack.
> 
> Add a phandle to the accdet in the sound card node so the machine sound
> driver can initialize the accdet.
> 
> [...]

Applied to v6.15-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt8390-genio-common: Add jack detection with accdet
      commit: 691712b065d349bde7d5561aa8e1857d38b7c65a

Cheers,
Angelo


