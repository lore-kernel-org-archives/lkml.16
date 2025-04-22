Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66AF1EE014;
	Tue, 22 Apr 2025 07:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745308451; cv=none; b=Ls7BlFBw7jwOZrr0gmtvCvp0Xj5jq2nU8J6NxG1IDATbBxX17QEapMKkLopjGqPc/b5dUOsywVi3VqTvksJl/EQihw3j7RoedlmypQje+pBDApHXg3slX/74VokZPdKdYcNrRB6SpsXxGw2yVUnbijezYoJcRRZaRMQmjCYLYro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745308451; c=relaxed/simple;
	bh=s4Yu/0eedyirCVG2wNYEo4XaHlcrDummMxSyiwWhFHQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lPsEDHQ0pyt3r/5mgTtdEFLDY/rjlZV0zqfg1VFl/ZjrtnvMgelK+p/TBWz1yI+K5YmoqSi+PSn5ET+vMhWNp9QPnKRuesLCqnag9L+vcbyXnjDzJOxEMp7Sp7598wlNjnUqto1a5X0wtlhhHmih3feIw3s1T1bt8qtXH9qNq68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ODXopuCI; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ODXopuCI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745308447;
	bh=s4Yu/0eedyirCVG2wNYEo4XaHlcrDummMxSyiwWhFHQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=ODXopuCIQWF5J/3tiGk80rrxR73WRS0SHN2K9NjeAcfVlyCJsmSxNxC5iyfX1iYCj
	 JdhgZI7dLSuc+ZrTBJRA4SZub65pc1V2k6PWyItWbXj1G9kPzITt0mVs4tt5P4RUtc
	 ZEDEqxB7QsaeIlOUQFPz02eIkQsZU739jeuXF4UjVjpX4EVcTw/tDYl22wzHie0D+l
	 4chO/6uzAiM9Kd510GFxpOm/0hw7sVoEWq3sl63it9qEZP7X8LgIjqOVOMamjERpul
	 G/CarlWfJFUCgoYrYd8EenVq0ZehmV6nolBtYL8m4725vVx1JXHZpuRKQ14vExDpvf
	 dwfmSW77ufowA==
Received: from apertis-1.home (2a01cb0892f2D600C8F85Cf092d4aF51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F1ED917E087F;
	Tue, 22 Apr 2025 09:54:06 +0200 (CEST)
Message-ID: <f0ff95074b74eb3e7fb5832ce83568a07974b67d.camel@collabora.com>
Subject: Re: [PATCH 4/6] ASoC: dt-bindings: mt8195: add compatible
 mt8195_mt6359
From: Julien Massot <julien.massot@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	kernel@collabora.com, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	 <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	 <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	 <conor+dt@kernel.org>, Trevor Wu <trevor.wu@mediatek.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org
Date: Tue, 22 Apr 2025 09:54:06 +0200
In-Reply-To: <8ffa4ba2-6d22-4ca8-b5c9-04f91d45456b@collabora.com>
References: <20250417-mt8395-audio-sof-v1-0-30587426e5dd@collabora.com>
	 <20250417-mt8395-audio-sof-v1-4-30587426e5dd@collabora.com>
	 <8ffa4ba2-6d22-4ca8-b5c9-04f91d45456b@collabora.com>
Organization: Collabora Ltd.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi AngeloGioacchino,

Thanks for the review.
On Thu, 2025-04-17 at 12:20 +0200, AngeloGioacchino Del Regno wrote:
> Il 17/04/25 10:44, Julien Massot ha scritto:
> > Make it also compatible for platform without external
> > codecs.
> >=20
> > Signed-off-by: Julien Massot <julien.massot@collabora.com>
>=20
> For the next time - please remember that bindings commits should come bef=
ore
> driver changes :-)

Since I'm about to send a V2 I will reorder the patches the correct way :)

Regards,
--=20
Julien
