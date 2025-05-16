Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D06A13FD86;
	Fri, 16 May 2025 14:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747404899; cv=none; b=ZwUEYL/6Rm4kIQ94hS2IspetPBPKay4eHBYrQ+A9hOxkYTNDTxrMHy1NfANiNLTVbbw1oVINfwYQrXwxXUt6L9JNE6bA5fqMIrrt9Mvt6UmZ1pwQU6z+BazYo9MaJqRphLs4l3kkovzsrJ4I/7+eaiIJnF7kSgj7pQc5fdxmVkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747404899; c=relaxed/simple;
	bh=xoNEu7nlqt0Uzf5QdINb8sbgrCfpe8hWPCqdZRSYtDM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=srlZdRpCHg/TstENFAqpcF31CWVEaSNCWMZcXxYehLwYEuqORHS86btzQLIzicJqeaIazAbPPT0QO/grEz+R3wt8shOHk3X567fJqqFukaAYrjF6GsCP0J0OOJTAgwfKoorGym+AYpwMykeFe/qTFjm2wHpgYDpDWLLDIDAaqIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=LfOh5ag5; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="LfOh5ag5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747404895;
	bh=xoNEu7nlqt0Uzf5QdINb8sbgrCfpe8hWPCqdZRSYtDM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=LfOh5ag5Xzifqx/OH6UpSuEIMv+WLdumB0zh3Y8sZcRVu9KUkf2UsHDl56iTm3jrZ
	 xplKT+L8HgbIOmX9NE3nzuuMtsrBpsNJ/SphLX3CvFk6B21YkB0dVDossIQwNGt7oP
	 NEjYSV4NnnzO58Wv7TsBORQTJRZc9EQhMFDvjbtjJ1Jpn8u+JCy/rHAcdck88u4UP4
	 Qi5QzkLa8QiX9GhugT3h+n6jyGGR06EMumjbOmVIZJKOk49M9HD+aK0vCPyL4JR0Rk
	 QxLYu8hEPz/Wgo2cntM/mC2nPIGa8i0YeM2ZBhwxrhaIiXzecmNzlAenL7vF19cHn3
	 bKXnMLbPOo6Yg==
Received: from 2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr (2a01cb0892f2D600C8F85cF092d4af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C921317E07E4;
	Fri, 16 May 2025 16:14:54 +0200 (CEST)
Message-ID: <dcc085b131ec0b8769630bee6ee89ca0b6eacc73.camel@collabora.com>
Subject: Re: [PATCH 1/3] dt-bindings: clock: mediatek: Add #reset-cells
 property for MT8188
From: Julien Massot <julien.massot@collabora.com>
To: Conor Dooley <conor@kernel.org>, AngeloGioacchino Del Regno
	 <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Garmin Chang	
 <garmin.chang@mediatek.com>, Friday Yang <friday.yang@mediatek.com>, Conor
 Dooley <conor.dooley@microchip.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	linux-mediatek@lists.infradead.org
Date: Fri, 16 May 2025 16:14:54 +0200
In-Reply-To: <20250515-deploy-wiring-5829acc3d82e@spud>
References: <20250515-dtb-check-mt8188-v1-0-cda383cbeb4f@collabora.com>
	 <20250515-dtb-check-mt8188-v1-1-cda383cbeb4f@collabora.com>
	 <20250515-playpen-dislodge-80245fb8b7a9@spud>
	 <cbd170a3-cbfe-4b4f-a059-efe33fed0e5d@collabora.com>
	 <20250515-deploy-wiring-5829acc3d82e@spud>
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


Hi Conor, Angelo,
On Thu, 2025-05-15 at 17:17 +0100, Conor Dooley wrote:
> On Thu, May 15, 2025 at 05:11:13PM +0200, AngeloGioacchino Del Regno wrot=
e:
> > Il 15/05/25 17:03, Conor Dooley ha scritto:
> > > On Thu, May 15, 2025 at 03:31:43PM +0200, Julien Massot wrote:
> > > > The '#reset-cells' property is required for some of the MT8188
> > > > clock controllers, but not listed as a valid property.
> > >=20
> > > "required for some" but not marked required on those platforms.
> > > Why not?
> > >=20
> >=20
> > Yeah now that I read that for the third time, the wording is a bit inco=
rrect.
> >=20
> > It's not "required", some clock controllers do have reset controllers, =
but it
> > is facultative to actually use the latter.
>=20
> I don't think I've ever seen this word before.
>=20
> > I'm not sure if the ones that do have reset controllers inside should h=
ave the
> > #reset-cells property as required...
> >=20
> > Conor, what do you think?
>=20
> If "required for some" in the OP was meant as "permitted for some",
> change the wording to that and it is fine.
Changed 'required' by 'permitted' in v2.

Thanks,
Julien
