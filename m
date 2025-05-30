Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3428C1F875C;
	Fri, 30 May 2025 06:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748586586; cv=none; b=ZjC/LVRZJvCMWljgKS3MmbfRZnLyNbPGilJBt7c4IkNI8tnYp0mPBW/u3MBTeGxgTFcMVl6mzHAGwIzCdvJ3iS1RHH78ZUEdsMCqHHWuHorh9h+ColPKTJy5e6yRDHdr2QGAY1xoPghOsJXP3x8/7vnFa/V3flPPuWbSNfwnAmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748586586; c=relaxed/simple;
	bh=qhgHA/bJ8v/PS2R6f2L3oGVJ9+DXpMZEvteZ1yfDueE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OgVvHmHzUuomzBeSFA5PjrKeytIfKJ5/vXIB284sWlNSlsms6DxpiLrIHpTDYUCmW+FTNtX7KOo3dCw1TcSWSuwwbUAGZHd5O8NsE/pUOzavE/MJayibz7LrWjui9g8UDPmfVJ8XhuF8W8ez/GauxyrcobIjx8Kg6N8eeAS97YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=TCVm8yWe; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=XY8jWu8j reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="TCVm8yWe";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="XY8jWu8j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1748586583; x=1780122583;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xKYfvQUJsCe5Fu3IbEtXJ4DySVzCIAQxIRD4sH/yzi8=;
  b=TCVm8yWe1jp1sSiaauO/CG5GxiQ5QzgIp2ywtcYUH7mzsfUNxNGmh6NU
   qVuGqKjMTXiyLxDrf8ROTqlZ/obAdxMDzZ2kTVkGTTX5ppqWX2Fe1vbb5
   SiTgKX8/42tUYh50bEuBcuhi6jkRc+SPd7rQGCj5CxjNPighOBFwC20lH
   BS/Je0AGoOp4S2JEGIOqs7qpc1sUbQvUpGzKDrUasaL4uh8wPBLhyFkMu
   jshHe6pdL0JnWs5+0Q+5q025yV/CNd6ti1cRNJwnzHRZVe/hSbmJipTN+
   k2pRONKK9RSw3TfdhhpU+XYXKuU2cihnGoEn8YxJR45Z0x/Wg6fuzbt3g
   Q==;
X-CSE-ConnectionGUID: qQZGS3Y/Tla+y7MpA+X7nA==
X-CSE-MsgGUID: OnaFfOnkSiWO/+xrExhjsg==
X-IronPort-AV: E=Sophos;i="6.16,195,1744063200"; 
   d="scan'208";a="44364193"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 30 May 2025 08:29:34 +0200
X-CheckPoint: {6839504E-C-8CF597AF-F8BD95DC}
X-MAIL-CPID: 5E8F613866FB26B0A053F72B1F8FAD48_3
X-Control-Analysis: str=0001.0A006396.68395054.0069,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4D027163483;
	Fri, 30 May 2025 08:29:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1748586569;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xKYfvQUJsCe5Fu3IbEtXJ4DySVzCIAQxIRD4sH/yzi8=;
	b=XY8jWu8ju4n5JEtBc/cmVFE2Z7uWTpCnd6BhdtlaNX6JwcXtWr6btn1mOz197fc/ggVz79
	i93PNjpDqIfOjPbeHVSFlYeYpSHSjqJGLfkfWnlzBj4RTrnWRT+xrTyJ6Kg9T28De7YfI/
	J86SH8jJau2i6X6hmorZLq3cfyplTzwWc77IUDLcFVOJh0B9aYaSZJ1F5tACswlH2QHRha
	4HfchkwTlHYX6zXPGpEnmAUGIGd8FXJhika7BJEDSRI/ObZeiLAHkvET/JLG6HHkeAW0D9
	hS7/8bbOipBRRN+yHH1AKeD1SBIBD0utqVO6DDEXr1/4B1IEDQ7U9/bYam2Akg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Gregor Herburger <gregor.herburger@tq-group.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
Subject:
 Re: [PATCH 2/2] arm64: dts: ls1028a: Add mbls1028a and mbls1028a-ind
 devicetrees
Date: Fri, 30 May 2025 08:29:27 +0200
Message-ID: <7298658.31r3eYUQgx@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <aDctWKIvBKwF29lP@lizhi-Precision-Tower-5810>
References:
 <20250527060400.1005757-1-alexander.stein@ew.tq-group.com>
 <20250527060400.1005757-2-alexander.stein@ew.tq-group.com>
 <aDctWKIvBKwF29lP@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Hi Frank,

Am Mittwoch, 28. Mai 2025, 17:35:52 CEST schrieb Frank Li:
> On Tue, May 27, 2025 at 08:03:55AM +0200, Alexander Stein wrote:
> > From: Gregor Herburger <gregor.herburger@tq-group.com>
> >
> > Add device trees for the MBLS1028A and the MBLS1028A-IND and the SoM
> > TQMLS1028A.
> >
> > Signed-off-by: Gregor Herburger <gregor.herburger@tq-group.com>
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> >  arch/arm64/boot/dts/freescale/Makefile        |   2 +
> >  .../fsl-ls1028a-tqmls1028a-mbls1028a-ind.dts  |  68 ++++
> >  .../fsl-ls1028a-tqmls1028a-mbls1028a.dts      | 118 +++++++
> >  .../fsl-ls1028a-tqmls1028a-mbls1028a.dtsi     | 291 ++++++++++++++++++
> >  .../dts/freescale/fsl-ls1028a-tqmls1028a.dtsi | 117 +++++++
>=20
> New dts file, suggest run https://github.com/lznuaa/dt-format to nice ord=
er

Thanks for the suggestions. It does some improvements, but I also disagree
with a lot of proposed changes:
* Wrong indent of SPDX tag
* model property should come first IMHO
* {gpio,interrupt}-controller should come before #{gpio,interrupt}-cells
* gpio-hog property should come first in a hog node
* sorting gpio-hog nodes by name instead of line number seems wrong

There are some more bogus changes, so I'll skip this tool for now.

Thanks & best regards
Alexander

> Frank
> [...]
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


