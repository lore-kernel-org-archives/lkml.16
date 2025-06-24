Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804652D661F;
	Tue, 24 Jun 2025 15:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750777930; cv=pass; b=W4P8nQfGGHrmjmUJE8xkhIBgp4TV1kfQChHbLvYfJp3WpX/S2cnjcUjbVDTL3vK6VkItJJXQncgNKt1X2LiMlFbLYnEwj+5sI4zsKXsvV0OD9OsbPzj2o9a4tjf1/Jyam/rzwPDFLk/NLiKbub0YkbsP1MRLT0clSsLgIByAsgI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750777930; c=relaxed/simple;
	bh=kwBZPzxn17JvK+V65zGyJFMJb6zC4Pj40uxCg1alNFo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hYa1qyWNIC8OQ96x79UTWUpHXcRetILiGg98S+dMwldF+VU5ftdy5dUGWc6Xjl/oPs9cxXlivjz5GD1+rD9Mt9xaYseVGAoIdyiJzqn5lCh3ASCSHDQpaRxIjDK8uAIJpUbqfR/FtoF7GQXHbqJoZdtKzMJa/4zSm8pUJyA2ZhQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nfraprado@collabora.com header.b=Bf9YSS1G; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nfraprado@collabora.com header.b="Bf9YSS1G"
ARC-Seal: i=1; a=rsa-sha256; t=1750777912; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PbWcPMPdsiBjI5yUuATEXqR6754nuRTTSI93To7cx/Jc83GNnq9oB8Na81keGobkNvVJuGleN5AU6u83eLxxNciNYRfFSI95L6Vc5fN1QrUU5xTmzImF7QmzlVnZdhdZH+f1nC2G4PUdwQscV333ufz/5znCuOLOLqrusgw7Fdc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1750777912; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=kwBZPzxn17JvK+V65zGyJFMJb6zC4Pj40uxCg1alNFo=; 
	b=jPeyuZU/ylhALvNgHeFNYAuq4cjuEyvRf7BaqGil6SWCK4Q1Q8fRQyhGaaSH0GIvxaxuPWfhM2LhJtmgxRcn47bCoouuP1Ep01GcYHh+QJQSry2pqKQMuU3SSAHlJX1QPC0zsX4cj8k7e9LG1e4BGp/xiycrROC5fSpumcAybQw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nfraprado@collabora.com;
	dmarc=pass header.from=<nfraprado@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750777912;
	s=zohomail; d=collabora.com; i=nfraprado@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=kwBZPzxn17JvK+V65zGyJFMJb6zC4Pj40uxCg1alNFo=;
	b=Bf9YSS1Ga0DU0J+XC2yEcnc1NKTcDJnu0rTxNkBIt6iga3H6/8JOtOI7Qk3mRziO
	kA8ENF4z2QoaRaCkUJ5RKq8tn+sZwwBDEJ4WNJqXadd6JZGUTC+bHrlFDVsDCYzzYwj
	ZQnhcFsLz2Q8w8B3LpuJsyt0rmOlis+U8f9PH7fs=
Received: by mx.zohomail.com with SMTPS id 1750777910578164.21030726920253;
	Tue, 24 Jun 2025 08:11:50 -0700 (PDT)
Message-ID: <44767efb5f7eac1e5605dffdf531e805bc06b920.camel@collabora.com>
Subject: Re: [PATCH v1 0/6] regulator: Add support for MediaTek
 MT6316/6363/6373 PMICs
From: =?ISO-8859-1?Q?N=EDcolas?= "F. R. A. Prado" <nfraprado@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	broonie@kernel.org
Cc: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org,  matthias.bgg@gmail.com, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,  kernel@collabora.com
Date: Tue, 24 Jun 2025 11:11:48 -0400
In-Reply-To: <20250623120016.108732-1-angelogioacchino.delregno@collabora.com>
References: 
	<20250623120016.108732-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ZohoMailClient: External

On Mon, 2025-06-23 at 14:00 +0200, AngeloGioacchino Del Regno wrote:
> This series adds support for three new MediaTek PMICs: MT6316, MT6363
> and MT6373 and their variants - used in board designs featuring the
> MediaTek MT8196 Chromebook SoC, or the MT6991 Dimensity 9400
> Smartphone
> SoC.
>=20
> AngeloGioacchino Del Regno (6):
> =C2=A0 dt-bindings: regulator: Document MediaTek MT6316 PMIC Regulators
> =C2=A0 regulator: Add support for MediaTek MT6316 SPMI PMIC Regulators
> =C2=A0 dt-bindings: regulator: Document MediaTek MT6363 PMIC Regulators
> =C2=A0 regulator: Add support for MediaTek MT6363 SPMI PMIC Regulators
> =C2=A0 dt-bindings: regulator: Document MediaTek MT6373 PMIC Regulators
> =C2=A0 regulator: Add support for MediaTek MT6373 SPMI PMIC Regulators

For the whole series:

Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>

(as I internally reviewed it before submission)

--=20
Thanks,

N=C3=ADcolas
