Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B0A21764B;
	Tue, 22 Apr 2025 06:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745304076; cv=none; b=eHMrEZYhjBCka42RrOv8xVqVdRoDuT+6jfG2SBmOM8irvIG6+r/zdU1vp7I69SKIOPRYFcDdiP9pRV5ZA+BBENWwEh3D8iJi5bt9QqdEkZrxe5OK7nWAOJomXrUceqFbO5MQUHHTn/vwo/2m49/i7+7F2S2qif/UuxgWPMJ/4z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745304076; c=relaxed/simple;
	bh=OfGeYaHrVhXXWga0ArJUhmZF3idRDOHEU5O41HkHdtw=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=ZKhXfpzAddWP4r88nIMFXnZ+wZ2VUmnjjxDt3m+bs3PAU/yBE6tvL27FI2f+I8SPmg4X4CrnQmv28MxjGVJi9PlAxFTsTRCWm852F6fJsi2jyDm6UceeXvVvA6kMYm3gBNC+UE+GhBi1+VWxLByrZPYevOTJKrqujjtHhM5t8gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=JKqbUULz; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=cw3dfPuX; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="JKqbUULz";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="cw3dfPuX"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 17DCA1140167;
	Tue, 22 Apr 2025 02:41:13 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-05.internal (MEProxy); Tue, 22 Apr 2025 02:41:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1745304072;
	 x=1745390472; bh=KJjeYMmw4d06MV7IdK+vWICO7Di3IWNxGYXSaL2nCRY=; b=
	JKqbUULzw0Gp3cDK9VuC8oHKIQ/0KFMJZUwtYo1yxTzi2NgDSb9X1/17ZsJ84CKO
	q8cTBCc7AG1kjJPuHpVkH9ZeKxMXYVnOiiGDBohLKNMeTrUp/u473JGbvuN8KH+s
	0p+1npRGQqQkKOiz4+jAx4hUNmLCONPj40aDUyPrPs4FndSI9zpem/pEeCALgAKV
	SAAstJsYbluDnT+KGDY4TVY46nQYy8sJi+TxqVG1+FM8Cz7WNdomUjg3tMEc3Vuf
	GUUoJULp/KiQdrcQ0oGmCWZb9apa1iIw+KVADZrf1KO6YPyVnuoSOR628R3mWOaH
	Uq4fh5fxGlQiWwCs8YJ5HA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1745304072; x=
	1745390472; bh=KJjeYMmw4d06MV7IdK+vWICO7Di3IWNxGYXSaL2nCRY=; b=c
	w3dfPuX2DRg/kKszp+VcVKA7/gFyUMVfcaaqH//GR4cTpaSyo3AqW/sTjgPopAf/
	CwE88HuUM3TJimmJN6jwsP94HaSjpdlq+W7RbhqyJPPdRrYv5aiF/ZMhHpG075RW
	kj7TihhaNgr2tazH/1nCpJzLqjODXNCP05pIJg3+dVNcAVz35YqFqtCFX232YeUo
	1lRszwdUp8q7tb1l6yBZE0UHJNdF4eybIPA2cROBBUp4wufVWjsuWDpJaXZcr+BI
	GmSlcdAKsQ+KJv2I/CRYoR8KuUc0wFS126a1fOfyqyfo0hikhtoWmLfW4wQzGwEB
	puj7jPS6fkNHOuksyeyHA==
X-ME-Sender: <xms:BzoHaDfMQJFQzz1ruTZLMNc2nN2f6M8iXFYSMio-DufyAlYTPsTm0g>
    <xme:BzoHaJN5ukyxgdSeU5HhZfWG-ZyyYsykTRuT-LVorXEFDdnYnOVv-ivn6NRDpgbj5
    afvRklH7pV-8kNGDbc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeeftdefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    vdegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehfrhhivgguvghrsehfrhhish
    druggvpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdp
    rhgtphhtthhopehfvghsthgvvhgrmhesghhmrghilhdrtghomhdprhgtphhtthhopegtoh
    hnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgv
    rhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtph
    htthhopehshhgrfihnghhuoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfhhrihgv
    uggvrhdrshgthhhrvghmphhfsehkohhnthhrohhnrdguvgdprhgtphhtthhopehsrhhinh
    hivhgrshdrkhgrnhgurghgrghtlhgrsehlihhnrghrohdrohhrgh
X-ME-Proxy: <xmx:BzoHaMgthLmsNXpyo63_egO3S8DBrggBCT_NFRySoAreRSF8ecZXnw>
    <xmx:BzoHaE-arKdzLjEa361kAgN-jDTQ6GjalEIKVsE3p_6knTVsBfxXQw>
    <xmx:BzoHaPtxOHaPwqsEgoXYX1W8_ExFvV3szrgPJ_4uHFcgKbIJSqdAww>
    <xmx:BzoHaDGmukrU4tB7DOOH6k7akyw1EeGSULwm2Vaq2JBYaRwjFgXdVA>
    <xmx:CDoHaNnPAoGAMKqEiOVv0aa71npJ8PvwCXwSR8C6XIJJyQXD_qsgnkh5>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id B60452220074; Tue, 22 Apr 2025 02:41:11 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Tb1fe2b3b8ab1c58e
Date: Tue, 22 Apr 2025 08:40:51 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Frieder Schrempf" <frieder@fris.de>, "Peng Fan" <peng.fan@nxp.com>,
 "Pankaj Gupta" <pankaj.gupta@nxp.com>, linux-arm-kernel@lists.infradead.org,
 "Conor Dooley" <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 linux-kernel@vger.kernel.org, "Rob Herring" <robh@kernel.org>,
 "Sascha Hauer" <s.hauer@pengutronix.de>, "Shawn Guo" <shawnguo@kernel.org>,
 "Srinivas Kandagatla" <srinivas.kandagatla@linaro.org>
Cc: "Frieder Schrempf" <frieder.schrempf@kontron.de>,
 "Fabio Estevam" <festevam@gmail.com>, "Frank Li" <Frank.Li@nxp.com>,
 "Geert Uytterhoeven" <geert+renesas@glider.be>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>,
 =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>,
 "Shengjiu Wang" <shengjiu.wang@nxp.com>,
 "Shenwei Wang" <shenwei.wang@nxp.com>, "Xu Yang" <xu.yang_2@nxp.com>,
 "Yoshihiro Shimoda" <yoshihiro.shimoda.uh@renesas.com>
Message-Id: <6ee90a9e-cfa0-45f5-8036-bf04cb19db46@app.fastmail.com>
In-Reply-To: <20250416142715.1042363-1-frieder@fris.de>
References: <20250416142715.1042363-1-frieder@fris.de>
Subject: Re: [RFC PATCH 0/5] Add NVMEM driver for i.MX93 OTP access through ELE
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Apr 16, 2025, at 16:26, Frieder Schrempf wrote:

> Therefore I implemented a simple driver that uses the ELE S400 API only, as the
> FSB access (1) doesn't provide any benefits except for that it doesn't depend
> on the ELE firmware being available. This is used by us downstream.
>
> For the upstream solution I would like to have some feedback on how to move
> on:
>
> 1. switch imx-ocotp-ele.c to use ELE API exclusively
>    -> this will create a hard dependency on the ELE firmware/driver 
> being available

Could this cause problems for real-time Linux users? Usually going
through a firmware driver adds more latency than doing the thing
from Linux directly, and the firmware is usually not preemptable.

In particular, programming a one-time fuse is likely a slow
operation in hardware, so it may still be necessary to support
both methods if there are users that need to update the fuses
on real-time systems.

     Arnd
