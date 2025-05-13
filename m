Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A48C2BDC09;
	Tue, 13 May 2025 15:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747150669; cv=none; b=sjprl1n5pPn00pLQutwU0Qz45p54TnEheeoKrUUVygOcLRTtKz7HEXjS7a1BOch54qlAc2Nx3aFR+2uSJ6S6gcrPl9YRVcQkt+UNUSqhYaGKNKgaE02S4WvqL+ldRgILQOF8Cj9nSUb+gffcDCzKfsFfY32lZhAIxnlhf/tqsy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747150669; c=relaxed/simple;
	bh=KJS9CxnNPpheLNaZ7imhBbfapJj0YpC6MwYgWpp3x9s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BczZtaPmdNoOIuEwWHX/xfCzMdZFVSk6GsKi+tQdB+YTbnSZcxkDZw/aVJBs0kOOjeJGE16Rt6aTE/pCKVnCkgRD5qFyMDEmi2RnZv+Edu8R1OB3XDhheDozuvvTMJzgwDjMEXs7v0sclf+2GrvKPz/Dm//vSdN6ltTUlS2/O9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=KIkS7YAC; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=HFuFRpRT reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="KIkS7YAC";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="HFuFRpRT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1747150666; x=1778686666;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KJS9CxnNPpheLNaZ7imhBbfapJj0YpC6MwYgWpp3x9s=;
  b=KIkS7YACYh2ZQWoE10sEKRuXGQCgPvT7YL2V4+XFRjHm7fT8OPxermad
   eIOgajaldjj4eGdf/+TrNAmIauvE8Z0/FEzpU+OqOseMGTNDUFc20jeOd
   jc39SAGajrwUDjz5rceE1MBJQ2S1vM2xbeXuRFf6p9P7fxjNizD5jZENt
   cXos+YYu7Y3yx+uogSxeGBWikTPD2DCr6Nq5iTNBrpNrMW8F4NNom8Zrv
   e28+vTomGrY1vXJo/xI0A1L+OtRbcZVgyjX+O/tf8q8n9tAZC99k3BGvc
   pFRlDMjUsDm3IaX0KI0v5hyJkzLqhz38OKFU2DJz2QkioXf9JMeP2jhWh
   Q==;
X-CSE-ConnectionGUID: irKwGYMGTE2318TjCJsHnQ==
X-CSE-MsgGUID: BXWXh5dpQIGK8etu1WtVMg==
X-IronPort-AV: E=Sophos;i="6.15,285,1739833200"; 
   d="scan'208";a="44052047"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 13 May 2025 17:37:42 +0200
X-CheckPoint: {68236746-13-BF62DDF1-CB8BF55F}
X-MAIL-CPID: 5B6CDACB2F8209EED8054BD55E19D0AC_1
X-Control-Analysis: str=0001.0A006375.68236749.006B,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 46BD4160AF7;
	Tue, 13 May 2025 17:37:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1747150658;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KJS9CxnNPpheLNaZ7imhBbfapJj0YpC6MwYgWpp3x9s=;
	b=HFuFRpRT09roncsuKn6WsddpIpCTW8yJlMynj4Wdev+hKN2OyOYgWCbAFjw2h3Ip/1h6I+
	BksszSj8dEdQfTpeHKOl2yQANX2EH2M9zGZUb06HDc6qVwL5kSNXLqIZpovZJUgDhafjMF
	ZCAXh9MuJl3Hhn3ODi3lJCTdO65eQu+S+blHfaSlG1bhfdyx/GHcn/j/sdtbjzqhuOsa+T
	f7Jd5IuqFsw1ZiofwSl237aeBKcYcL341MXH/MBsHQ15PsVa81VdAoaQ1jzUDfSZVGiWnw
	wL7lYzb+62ZZ0j1E1PGnN5+Ctvplw8TJedZ2+129YaR0P9o7fp3nNWSjsLsUvQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Peng Fan <peng.fan@oss.nxp.com>,
 Cristian Marussi <cristian.marussi@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] dt-bindings: firmware: imx95-scmi: Allow linux,
 code for protocol@81
Date: Tue, 13 May 2025 17:37:36 +0200
Message-ID: <2804473.mvXUDI8C0e@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250409160029.GE27988@nxa18884-linux>
References:
 <20241104085622.177781-1-alexander.stein@ew.tq-group.com>
 <20250409-heavenly-sceptical-ara-bceeb9@sudeepholla>
 <20250409160029.GE27988@nxa18884-linux>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Hi Sudeep,

Am Mittwoch, 9. April 2025, 18:00:29 CEST schrieb Peng Fan:
> Hi Sudeep,
>=20
> On Wed, Apr 09, 2025 at 01:31:58PM +0100, Sudeep Holla wrote:
> >On Wed, Apr 09, 2025 at 08:18:29PM +0800, Peng Fan wrote:
> >> + SCMI maintainer, Sudeep and Cristian
> >>=20
> >> On Wed, Apr 09, 2025 at 12:59:50PM +0200, Alexander Stein wrote:
> >> >Hi,
> >> >
> >> >Am Montag, 4. November 2024, 09:56:21 CEST schrieb Alexander Stein:
> >> >> BBM protocol supports a single power button, supported by driver
> >> >> imx-sm-bbm-key.c. By default this is KEY_POWER, but can also be ove=
rwritten
> >> >> using linux,code. Add a reference to this schema and add linux,code=
 as a
> >> >> supported property.
> >> >>=20
> >> >> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> >> >
> >> >Is there any other feedback or things to do here?
> >>=20
> >> I see Rob already gave R-b.
> >>=20
> >> Not sure this should go through Shawn's or Sudeep's tree.
> >>=20
> >
> >I am fine either way. Peng, just let me know if you want to pick this up.
>=20
> Not my patch :)
>=20
> Since scmi driver changes go through your tree, the binding changes
> should follow same.
>=20
> It would be good that if you could pick it up.=20

A gentle ping.

Best regards
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


