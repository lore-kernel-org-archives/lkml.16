Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B656B2690F4;
	Wed, 11 Jun 2025 10:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749637968; cv=none; b=ALlSG0Ge60/io12VM2jI7VJtFVCG2R/g5LQgyQZM5G1u7RdXPuKK3zmqeVz2fQzdsGCaJybY3hck3vCDHEYnMCPRJkgpgm0Xp2y262wV7cd0hHVDdmFftBh9lE6Ve6+tvPK0aeGUyB0Q1WU+887/bp+7vUpbSJq4cDePTegb+SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749637968; c=relaxed/simple;
	bh=9T/pS302r+YbAj1tL/BAOvp5KEwiMpVKqcVZppRx0oY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jqZBwF0tyDmWsXtnImgxJbvkzVclvkYlSkSp5op7X0oPcimi0KDAznir9fS65HH/NfM3h/CCEHQTsCXPcHCgzgeW1w0oVjiWfAK3Nttcns97++6JeLG8/qGIFj3fLCP7ni4UQMogSCkavkBKLLG9aHnGf5k7IUYtZMnPdIRitCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=AD7ZC+ny; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="AD7ZC+ny"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1749637965;
	bh=9T/pS302r+YbAj1tL/BAOvp5KEwiMpVKqcVZppRx0oY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=AD7ZC+nyuYzuKei+lg7bcBr64bv6QxIUFI7GuPr8USgAixOJxD131Fa88tMfUBSNA
	 w1urdT41Azs1lVojYMoAWRXUCKd0I+7G6PsebqYSH2KWD6gxvCBmS4SNyUHkv4uOvv
	 I4oeM+A5q7Y5b3tke8kg4g4M64W0rp2VUNKRFsRKMedS6w9Tyb1bWAT81IiudSj/wv
	 fbcuKimdA50oOUFC6kqElNvJk4JEExW4+gRU9pC+JQAcvxpEAmXsov/NolRPSTno1s
	 l/q5Y4/uREORGawiT9Rgd0pVX8y+cFzo5EEnly8yNThQiCOtwj1IJGLTVKZ8SVA5pA
	 StVP2p+YsNg5Q==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7BD6D17E02B0;
	Wed, 11 Jun 2025 12:32:44 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20250526-mt8395-genio-1200-evk-sound-v1-1-142fb15292c5@collabora.com>
References: <20250526-mt8395-genio-1200-evk-sound-v1-1-142fb15292c5@collabora.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8395-genio-1200-evk: Enable
 Audio DSP and sound card
Message-Id: <174963796443.449275.9873675313892150049.b4-ty@collabora.com>
Date: Wed, 11 Jun 2025 12:32:44 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Mon, 26 May 2025 12:45:27 +0200, Louis-Alexis Eyraud wrote:
> Add in the mt8395-genio-1200-evk devicetree the memory regions for the
> Audio DSP (ADSP) and Audio Front-End (AFE), and a sound card node
> configured to use the ADSP.
> This enables audio output through the 3.5mm headphone jacks (speaker or
> earphone), available on the board.
> 
> 
> [...]

Applied to v6.16-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt8395-genio-1200-evk: Enable Audio DSP and sound card
      commit: 9acb4d06fcb56edfb9bac0de705b4f295a18e932

Cheers,
Angelo


