Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4722156228;
	Fri, 16 May 2025 14:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747404977; cv=none; b=gofCOLaDZptENmRLmqjQqDX4QV0RgLHhXvYZTWyFMBCKmH15PARoAscaoM3/l1Wygi0rFkJGjRu1xgPBVVA4tLe0dnGAvvD5TW2WEdk8G+X4iDB2wlTKjefnP8LT2hSU6c74kfHaT7/PJs+vW8yIJ2TnuhWTuLHvTaZeWmiwWBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747404977; c=relaxed/simple;
	bh=gQpoNRZoT4Laj13U4Bh1ZV0ArWEfGdTmj1r3KozSV5s=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hEJoSJSC4y6y0cDV4MP/gx95Nq6VHZc+qXJx1f88Np/hi1fkFDqMis4gKxXvWVp/F/bI1qYMIBSMwXveGG5dysGd8F475PuZmjYyleeq0wm6uDxbK9ugrObbS2vNRFkBP9FPar2LT06Fkf+n7zrB5h/78ZMlkPJyrVqBhbjZA4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=F0BCeZxc; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="F0BCeZxc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747404974;
	bh=gQpoNRZoT4Laj13U4Bh1ZV0ArWEfGdTmj1r3KozSV5s=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=F0BCeZxc4Hvnn4U+tm1M/aTPl9AHHvTScCJEu/gnm2urOCaLEOUE2y0/igK4q7LSM
	 MW+wZL/O5Ubu3aZY0H4YZdQNJY6YlB8G+KhTYcESqkFEytEts7epDBmT6v/DOFjeWF
	 Vsrnkji1TDN++N4z3v3+3paftPLWSO/i8obJDqEvnOqRb5fBAGpoGmY2qM/JHDrvCR
	 BOmJkUhlRKGIu98iRLxQIPBnlmsP3VVLDSGnd/8yUCMYax9elMoa7BmwltFIlkC1fg
	 oNoWJ9W3E3NJ28mmwcyZ37SaQMPe7cEKCuDy70kE09R2zmH0VTbT5dli95nVv9El9H
	 wFN+8mzxihe9Q==
Received: from 2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr (2a01cb0892F2D600c8f85CF092d4aF51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 91A1617E07E4;
	Fri, 16 May 2025 16:16:13 +0200 (CEST)
Message-ID: <2646b1358d1d141cbb5988a3bb2bbf4177f4ce4f.camel@collabora.com>
Subject: Re: [PATCH 3/3] arm64: dts: mediatek: mt8188: gce: add missing
 'clock-names'
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
Date: Fri, 16 May 2025 16:16:12 +0200
In-Reply-To: <89234201-9315-41f5-ab13-68272f62c53d@collabora.com>
References: <20250515-dtb-check-mt8188-v1-0-cda383cbeb4f@collabora.com>
	 <20250515-dtb-check-mt8188-v1-3-cda383cbeb4f@collabora.com>
	 <89234201-9315-41f5-ab13-68272f62c53d@collabora.com>
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

On Thu, 2025-05-15 at 16:52 +0200, AngeloGioacchino Del Regno wrote:
> Il 15/05/25 15:31, Julien Massot ha scritto:
> > The 'clock-names' property is required by the dt binding.
> >=20
>=20
> I just remembered something....
>=20
>=20
> ...care to respin this patch instead?
> https://lore.kernel.org/all/20240911104327.123602-1-angelogioacchino.delr=
egno@collabora.com/
>=20

Ok, we will resend this patch instead, I dropped the patch 3/3 in the v2.

Regards,
Julien
