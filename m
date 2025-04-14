Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8B8207A16;
	Mon, 14 Apr 2025 09:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744624394; cv=none; b=Sk3w9tolcBXiGiXUn2QJoFHWuqvXGEEgW8Tt2bySrkUVxh2eHySyhRzt+iCPPcfxGX8dnh6ztXAF29V3E/NFuVhW2ITp/dvJMsUK6mShkFlDlL40AScZCeqpWIwbT3BScSWQuSnL7bN24upHBJfC2RTDGK2tA9G7qlKDZK8E9jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744624394; c=relaxed/simple;
	bh=SkXQJw1SrqmsayStjUHaJnoQ1wHII+j9X5YNhZccMPg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lNF4CTYMI+NbEjhXKBPiL6IKEucZ3V0l6lGk3NrSL/Kyqw6AtvvUXL6sD57Y+yAnSQpWIB02BO3eKGRcqoIygjabBw5IQ1RPx9O1V8zON2TvlFyLnSgIsxGg5bQJ33dfRslUqF+K0+MlcVF7f6PsX3tdcYJ0+oukD/MEXhwhSrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=GWZS2l+7; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="GWZS2l+7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744624390;
	bh=SkXQJw1SrqmsayStjUHaJnoQ1wHII+j9X5YNhZccMPg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=GWZS2l+762xg950+C1/dFK7ba9yejpqumCYBFr76tfglzxm+43hT7TRArJMvfGLJy
	 GyNm61CkAov0MGbl5k9Kc4ml+Sh/cCg5JmboT9ljrvhjT7ZVG8qXut6nhNAbccacFJ
	 9F+tB104Vi4w4/FFLMAH0vdW3VzAjW0QFMgM8bN9jcQesV9KwNYveKrljxuxOcqbgr
	 8PUmS3+PMs5yVSlqEMB2FSVxR4q8ytD9PduopeSSYK/hPxVuSUTJaPVVaQAByNXLZK
	 YgagwLJs9LEZsSGfUJ9q6QsdPNuwm4+gIWe+brpjyFddm0tOygB6+kaVib3LJtI78g
	 NDD/mG7mKT9oQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B410017E0CA7;
	Mon, 14 Apr 2025 11:53:09 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20250403-mt8390-genio-common-fix-pcie-dtbs-check-error-v1-1-70d11fc1482e@collabora.com>
References: <20250403-mt8390-genio-common-fix-pcie-dtbs-check-error-v1-1-70d11fc1482e@collabora.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8390-genio-common: Fix pcie
 pinctrl dtbs_check error
Message-Id: <174462438965.45420.14201836161335259332.b4-ty@collabora.com>
Date: Mon, 14 Apr 2025 11:53:09 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Thu, 03 Apr 2025 10:05:16 +0200, Louis-Alexis Eyraud wrote:
> Rename pcie pinctrl definition to fix the following dtbs_check error
> for mt8370-genio-510-evk and mt8390-genio-700-evk devicetree files:
> ```
> pinctrl@10005000: 'pcie-default' does not match any of the regexes:
>   '-pins$', 'pinctrl-[0-9]+'
> ```
> 
> [...]

Applied to v6.15-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt8390-genio-common: Fix pcie pinctrl dtbs_check error
      commit: ec71844817266c8d301f5745126cdbdafd33edea

Cheers,
Angelo


