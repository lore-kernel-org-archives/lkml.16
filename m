Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C266B135A53;
	Fri, 16 May 2025 14:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747404817; cv=none; b=bCtu1D/aUdKWfF2nsS7pos91sykbJsR0e0tClReH/K5VBTxzIGfam25kZKtGsSYmd3HmLHWat/g1dYe9EpFhyqoGaSzE6J2Egq06MkQa6KTRY+7cqdgpPjTOW56EnDIqfJ/r7HG3gu6AcfKP/uSfhPAgti8cN7grSYhA17YpF1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747404817; c=relaxed/simple;
	bh=JJHywsLGKeQ6+qJDiDR0w9PjolBNYf3lWBla1tYfd10=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lbvnNJmBwqYEOXKkKa9cLXmY38AkE2PF6lRn8hYO72ISUoKGPrLWmZcVfh/OUDlibW7aki7NwAoxdf8Vj4oL+ywu3pQurwElooJUmD4V5kgYc1H2NvF6EcK7/Q1n4N3RAm+EbDLPQcIy/CgNeXht4qxMHuomBjpJ8KyvzBn+ypM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=HI0gAV5t; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="HI0gAV5t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747404814;
	bh=JJHywsLGKeQ6+qJDiDR0w9PjolBNYf3lWBla1tYfd10=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=HI0gAV5t4Shg/xKBnOEpiVAWxjjBtEm+GZl35d96w2lcpH7Pm2cvkgTm1MzuFV4aD
	 oeOaqQrZ7qU9dpxiv/aKn8A/8rsXILL6zGsHt4EtYSffthEAZnq5MmequuSJt7ySn/
	 9tiVJD1YKW2cnkmfBS1ZTlYBzwcvhkWNHMpguyzS9dRPR+HSMisM4X34DQObodXu4d
	 yq5gLb5jp1nGrB4jGho3Mf3Y01ueMZUkSZ9ODJaSzY4aWZRbyS1U/kGj9DBVPRwBPq
	 7FxC9ChwQCW5Fu09QWuCCJ19mDHoHKnLYW2nzO8/nz92PE6OUHFX/4M0M4gTs/utlr
	 e9n6CaoSwzTCA==
Received: from 2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr (2a01cb0892f2D600C8f85cF092D4af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3CAF617E07E4;
	Fri, 16 May 2025 16:13:33 +0200 (CEST)
Message-ID: <057041d03651f3e6af572f326c128c8aea217143.camel@collabora.com>
Subject: Re: [PATCH 2/3] arm64: dts: mediatek: mt8188: Add missing
 #reset-cells property
From: Julien Massot <julien.massot@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	kernel@collabora.com, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd	 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger	 <matthias.bgg@gmail.com>, Garmin Chang
 <garmin.chang@mediatek.com>, Friday Yang	 <friday.yang@mediatek.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Date: Fri, 16 May 2025 16:13:32 +0200
In-Reply-To: <b693991a-db50-4871-91a4-20d9859a2f43@collabora.com>
References: <20250515-dtb-check-mt8188-v1-0-cda383cbeb4f@collabora.com>
	 <20250515-dtb-check-mt8188-v1-2-cda383cbeb4f@collabora.com>
	 <b693991a-db50-4871-91a4-20d9859a2f43@collabora.com>
Organization: Collabora Ltd.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Angelo,


On Thu, 2025-05-15 at 16:53 +0200, AngeloGioacchino Del Regno wrote:
> Il 15/05/25 15:31, Julien Massot ha scritto:
> > The binding now require the '#reset-cells' property but the
> > devicetree has not been updated which trigger dtb-check errors.
> >=20
> > Fixes: 9a5cd59640ac ("dt-bindings: clock: mediatek: Add SMI LARBs reset=
 for MT8188")
>=20
> That's not really a fix though, so after you drop the Fixes tag.....
>=20
> > Signed-off-by: Julien Massot <julien.massot@collabora.com>
>=20
> ....you can get my:
>=20
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>

Thanks dropped the fix tag in the v2

Regards,
Julien
