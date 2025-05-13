Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238A2201278;
	Tue, 13 May 2025 09:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747129735; cv=none; b=avXweAheWlqa3v52kVqCKiYgORrKAj8/paaQXRC7kulT1hR/ay9Z4B0kJMiHyY2bwpyjBFSsoRUHuQuElo8m6ZVHasZiJAG3DIfv7iOhuP7hGGeUAFebasUl+PK2n4qFYy9/2Pp5M793fhVyTdOkXQoOxKdhl0h1ukg2HgQOMls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747129735; c=relaxed/simple;
	bh=gbVfdS0/+BxgEuIBvwOkx71HWIkUx+Hx9hoqvnXwFPA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=o4LwOcFnNjknhTce5R4X55Fmj79ms3YymXfl/dgKelK+ruQbvG/pRI9hA4+EDaADLSlNOAqnRe9hqxtY63rl4CkLlC8TPbgnzy1DpXWjaFpZm6WrttD/4SuuQquTA08ThUyxT3rEaEOF3VxcsFJXbSWRSurc5Wuq8mCXgS5WEcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S/+I40Fk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S/+I40Fk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C84CBC4CEE4;
	Tue, 13 May 2025 09:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747129734;
	bh=gbVfdS0/+BxgEuIBvwOkx71HWIkUx+Hx9hoqvnXwFPA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=S/+I40Fk05pgWnOzsmYFqbsnS/EniPyQGsyIbpgbfd/Ae9mWx14ugARZOBDKLNZ0s
	 d4O0KfAZcuwWoxOYpHRWzNBh+Amp5LNzvuSr/RToFgQyz2uqFs2eJoaHuZTpx+nHFc
	 eP7sJz2NYuLVj1ZOzKAX1OF5FG2HVIpDvZJxh9yfYBkAJEC6Y5cjpKvSEdzJCQgXMH
	 cG8vLh234IqS1VwKI29GL8Bo4nmWiwDpyMCE4YX8HdBsHx52dvJtRuqIhOmPte2adK
	 /GXUnHuZuVMWGztFxhd6CCRWWV5Qf5AYxshexI3k23cUpHmgabjCbxALUCBHYXOVlE
	 iulsnetrPEAtg==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Amjad Ouled-Ameur <aouledameur@baylibre.com>, 
 =?utf-8?q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>, 
 Fabien Parent <fparent@baylibre.com>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20250502-mt8365-infracfg-nao-compatible-v1-1-e40394573f98@collabora.com>
References: <20250502-mt8365-infracfg-nao-compatible-v1-0-e40394573f98@collabora.com>
 <20250502-mt8365-infracfg-nao-compatible-v1-1-e40394573f98@collabora.com>
Subject: Re: (subset) [PATCH 1/2] dt-bindings: mfd: syscon: Add
 mediatek,mt8365-infracfg-nao
Message-Id: <174712973156.4137268.14056292856907058087.b4-ty@kernel.org>
Date: Tue, 13 May 2025 10:48:51 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-b75d9

On Fri, 02 May 2025 12:43:21 -0400, Nícolas F. R. A. Prado wrote:
> The register space described by DT node of compatible
> mediatek,mt8365-infracfg-nao exposes a variety of unrelated registers,
> including registers for controlling bus protection on the MT8365 SoC,
> which is used by the power domain controller through a syscon.
> 
> Add this compatible to the syscon binding.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: mfd: syscon: Add mediatek,mt8365-infracfg-nao
      commit: cbb005b91726ea1024b6261bc1062bac19f6d059

--
Lee Jones [李琼斯]

