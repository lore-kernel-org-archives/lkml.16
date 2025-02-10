Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2A622258C
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 14:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739199228; cv=none; b=KK1nvCRfdK9pLU+NF7rZbNOU1fwIopmW69NkxVpbNvlO7cM/OGDP9gEiZ8kSWe9nnMvBRQjAeD4YYdqlLZdu+Ga6Piin+aUOakgQPHDHF7FpC5kjaGqv34mkMeic9PYmegAQam1CQQtZTR8r2bPI8hTUCtu1ADvyPU508B7SS04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739199228; c=relaxed/simple;
	bh=MTQZ2UQFhYS45BOm7uhtKapuMbn7RqUvBjzgy50lZqs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=G9ZoT1rd0OlO4mSAVtnIoFfgBxsq+NNwUiad9Wn8/Roy8Edxf7RVSp1NES5clfHr5fbrA56Tf8X1qkz87aN4N2JtzdV3yjNejRLNoqwOLp116XvZcXwUO1A2tmLJtj6X5dMHlEWMcfNv7ztVXf/LK+9qxj9hXprjk3w6IMfjfjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=UPbiTZCq; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="UPbiTZCq"
Received: by mail.gandi.net (Postfix) with ESMTPSA id A151D43284;
	Mon, 10 Feb 2025 14:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739199216;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6zZrO0KLbSQ2XywzkXBgNHLK/s1K4eKjEMkdaYs4fmA=;
	b=UPbiTZCqI4usBfaAgNZYYsZQ7SuLoCoki0of3T+ZPKKAihVAatwUd2uxPVUiPUCmC69UhC
	u5JxOXnW0X7xF6mYHoP75nj2cOIeUVofUc31A0+5cIoAw04kL1Cn5xUHhgO1eFFECOLK3w
	JRwmJXqRkuud5zew2O0G77H+3XEQLiohuSIqvh0/wthA7VhG9aGH9H+AVtxNakQUsIpvEE
	WjAz0c5Kb3SaFJ6tU4HtFljofbus/3c+3csAV45Twytp5vP99DMPpIiCiFyyuMqGdq7vC6
	SPQqiBXj6exnVOQMU1CNmRPUywV/Spb49809uMfuD+KzMFfwErBNPOuPXV/U2A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Ezra Buehler <ezra.buehler@husqvarnagroup.com>, 
 Cheng Ming Lin <chengminglin@mxic.com.tw>, 
 Pratyush Yadav <pratyush@kernel.org>, Daniel Golle <daniel@makrotopia.org>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>, 
 Alexey Romanov <avromanov@salutedevices.com>, 
 Martin Kurbanov <mmkurbanov@salutedevices.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
 kernel@salutedevices.com
In-Reply-To: <20250210143429.286803-1-mmkurbanov@salutedevices.com>
References: <20250210143429.286803-1-mmkurbanov@salutedevices.com>
Subject: Re: [PATCH v5 0/6] mtd: spinand: add OTP support
Message-Id: <173919920944.55950.11601296425116850330.b4-ty@bootlin.com>
Date: Mon, 10 Feb 2025 15:53:29 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefkeefiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvegjfhfukfffgggtgffosehtkeertdertdejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheeifffhueelgfdtleetgfelvefggfehudelvdehuddulefgheelgfehieevvdegnecukfhppeelvddrudekgedrleekrdekgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeelvddrudekgedrleekrdekgedphhgvlhhopegludelvddrudeikedruddruddtiegnpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddvpdhrtghpthhtohepvgiirhgrrdgsuhgvhhhlvghrsehhuhhsqhhvrghrnhgrghhrohhuphdrtghomhdprhgtphhtthhopegthhgvnhhgmhhinhhglhhinhesmhigihgtrdgtohhmrdhtfidprhgtphhtthhopegurghnihgvlhesmhgrkhhrohhtohhpihgrrdhorhhgpdhrtghpthhtohepmhhmkhhurhgsrghnohhvsehsrghluhhtvgguvghvihgtvghsrdgtohhmpdhrtghpthhtoheplhhin
 hhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheprghvrhhomhgrnhhovhesshgrlhhuthgvuggvvhhitggvshdrtghomh
X-GND-Sasl: miquel.raynal@bootlin.com

On Mon, 10 Feb 2025 17:34:12 +0300, Martin Kurbanov wrote:
> This patchset implements the SPI-NAND OTP functions to allow access to
> the SPI-NAND OTP data.
> Specific support is added for Micron MT29F2G01ABAGD and ESMT F50L1G41LB/
> F50D1G41LB flash chips.
> 
> Changelog:
>   v5 since v4 at [1]:
>     - Rebased to master
> 
> [...]

Applied to nand/next, thanks!

[1/6] mtd: spinand: make spinand_{read,write}_page global
      commit: 07d0aa9393abc8fd64d0a174edfb68c5808187e4
[2/6] mtd: spinand: add OTP support
      commit: c06b1f753bea40a282f29a9383fcf36b12323108
[3/6] mtd: spinand: make spinand_{wait,otp_page_size} global
      commit: e278b8c73b0526f8e3ee22f4827c8fe07c2109ba
[4/6] mtd: spinand: otp: add helpers functions
      commit: 9ad2857c82d56017402256fd3e2ed401cc7f6fb9
[5/6] mtd: spinand: micron: OTP access for MT29F2G01ABAGD
      commit: b741d3fa5d3cf989b7dec76cca832396128dfe48
[6/6] mtd: spinand: esmt: OTP access for F50{L,D}1G41LB
      commit: a3b219e476d3c726e23084cd79649fe978484b28

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl

