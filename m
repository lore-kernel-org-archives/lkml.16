Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165D12206A0
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 14:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738939317; cv=none; b=rB4MittTFH3XqL1aeoE1viLN8WYF4jODoiP2AzD9qy7guzO6xZj15DB6CkmOQvJcr3cTouaOwpXxJenASnLN62qvFcm9yi/6+4Lr6u3oQPzb10SAOsQtsmc8cFrTSeO/mjzRYka8jWLsCcONOI7VnsrFU7mvZqMoF8byQUfXrE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738939317; c=relaxed/simple;
	bh=Xw5LjzfhjaQii1Qy1nV7yusM+UcRAZ3+6y3iLh6xEkQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=H5xZhse8qLzXS60m7o3TSK7MDjy699qWw64LkrbDMp+KG1pXnUYtaO8iNYPP6SryC7DH/qRK7Nmzw8rmwJ3iFGM+orOFBG4EFfLOWuL62JyDt0tqHG9THszyuRMBBhgZfiZIg0/FN5hi5VpyBccbQG+1KmV666zOZ7HzU3kytLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=l7Ah+102; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="l7Ah+102"
Received: by mail.gandi.net (Postfix) with ESMTPSA id F287B4432C;
	Fri,  7 Feb 2025 14:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738939313;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xw5LjzfhjaQii1Qy1nV7yusM+UcRAZ3+6y3iLh6xEkQ=;
	b=l7Ah+102SX+DPU9iK6kWo9mBvTrHy9XlCzlq9tTyLw51+akOb82lPcKYnJ5SgC1xqBaje1
	itxODv10n/X/cfCDi5OcShipqQAbQhBykOwFF1QrPcjk5DSMLfG1a+dfPnKd7Fglp9heZz
	WRrhlm5zmmJAZHFVD+RGOdsuvGOZfhr51S3qB2DHJXlnI75yoInx+RG4av2Usc5CYd95kI
	2JrmVO11J655bBRJuskQL2NNXwzun/cWqDCtlu///GHlcZX9pJ+wuq1VvEqaZhxxA+IOx2
	Q5SJ6BZnStrq27db8wWIkyJyBttncchUwtRmcNmg4vFb1VMIm27/hxGylu7bXw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Martin Kurbanov <mmkurbanov@salutedevices.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Ezra Buehler <ezra.buehler@husqvarnagroup.com>,  Cheng
 Ming Lin <chengminglin@mxic.com.tw>,  Pratyush Yadav
 <pratyush@kernel.org>,  Daniel Golle <daniel@makrotopia.org>,  Frieder
 Schrempf <frieder.schrempf@kontron.de>,  Alexey Romanov
 <avromanov@salutedevices.com>,  <linux-kernel@vger.kernel.org>,
  <linux-mtd@lists.infradead.org>,  <kernel@salutedevices.com>
Subject: Re: [PATCH v4 0/6] mtd: spinand: add OTP support
In-Reply-To: <20250127153848.199526-1-mmkurbanov@salutedevices.com> (Martin
	Kurbanov's message of "Mon, 27 Jan 2025 18:38:18 +0300")
References: <20250127153848.199526-1-mmkurbanov@salutedevices.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Fri, 07 Feb 2025 15:41:51 +0100
Message-ID: <87jza124wg.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvleehgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffeghfejtdefieeguddukedujeektdeihfelleeuieeuveehkedvleduheeivdefnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddvpdhrtghpthhtohepmhhmkhhurhgsrghnohhvsehsrghluhhtvgguvghvihgtvghsrdgtohhmpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopegviihrrgdrsghuvghhlhgvrheshhhushhqvhgrrhhnrghgrhhouhhprdgtohhmpdhrtghpthhtoheptghhvghnghhmihhnghhlihhnsehmgihitgdrtghomhdrt
 hifpdhrtghpthhtohepphhrrghthihushhhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghnihgvlhesmhgrkhhrohhtohhpihgrrdhorhhgpdhrtghpthhtohepfhhrihgvuggvrhdrshgthhhrvghmphhfsehkohhnthhrohhnrdguvg
X-GND-Sasl: miquel.raynal@bootlin.com

Hello Martin,

On 27/01/2025 at 18:38:18 +03, Martin Kurbanov <mmkurbanov@salutedevices.co=
m> wrote:

> This patchset implements the SPI-NAND OTP functions to allow access to
> the SPI-NAND OTP data.
> Specific support is added for Micron MT29F2G01ABAGD and ESMT F50L1G41LB/
> F50D1G41LB flash chips.

The series is ready for me, but it looks like you aren't based on the
latest -rc1 which produces conflicts while applying. Can you please send
a rebased version? (conflicts should be easy to handle).

Thanks,
Miqu=C3=A8l
