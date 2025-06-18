Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF63280022
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 09:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750238240; cv=none; b=GI9fN1spkqpLzmjdHuSRn7+czN7nB3sfgIKQHGNat2eIEwPF3tsKfT55ItFUafy15VAfwpUVxAXkN1mnuJ7IjNkLbYwThBigSMuMvRYRqDOw300cIUUx4CwOxJ+IfmzTZAz9cmL1sOFtjh5T6owViqyZleSznNiqdS3p2SLUbhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750238240; c=relaxed/simple;
	bh=CKvgWWtYdM68kRla5YrEj/zQaAlpfznzpj7r4uuHmHQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dfRL46wkrvRLS0g0Ta6zN7xz2NWPPtVIBv70QxC4wZCk3SZJKJEiv0Z/cDFB3cCqCnzmmoibnxYd/HOb1BuOPcsc4TxuwlqQBXNDSF7xq9qkOeZFhfLnSVzxWUwBOQXDW/g8DTr5GDYlRJV61PsDePIPaZfs7UK7k7ayq+GghSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=BRTgA/pQ; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="BRTgA/pQ"
Received: by mail.gandi.net (Postfix) with ESMTPSA id F08604444B;
	Wed, 18 Jun 2025 09:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750238231;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jaCiWk1uCV6f32Pf9vYpmKTKHSEQ9o15TWK0/frA/pQ=;
	b=BRTgA/pQhK39kpr6tYdoZLw+2CYzmAk7AVPdXv1Y6k4OO45Wu9w5MK4xR67uwXWtzjMMn6
	J8draniOZCheJ/PZROitctZfpPeUUDx4sE4o/DSRBSXI58Xx1xupUw5NG0zflULoKopZcU
	gm0GXMqvO+1j4JjcrhYCarBBXyn/AyWDPWXyjQWQarwXUzAMkpYqIJva6Dxb2RhRu9OE24
	KjgVu8Gp/9Grm0lnlcv9KAkC9bvU8IV2jL8mJQfdDb65VgBc7RTKhxXgu5JL2xIGTsFgDN
	xSI3QFGWnY1KCKzNXU86eFOqK8K9SSuxrvydmx0w0YiA+mKo5iguwxEEGRcVUw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250610092526.2640870-1-arnd@kernel.org>
References: <20250610092526.2640870-1-arnd@kernel.org>
Subject: Re: [PATCH] mtd: nftl: reduce stack usage in NFTL_movebuf()
Message-Id: <175023823094.1656646.8809228432720307763.b4-ty@bootlin.com>
Date: Wed, 18 Jun 2025 11:17:10 +0200
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvvdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevjghfuffkffggtgfgofesthekredtredtjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehieffhfeulefgtdeltefgleevgffgheduledvheduudelgfehlefgheeivedvgeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrdegvddrgeeingdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeipdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheprghrnhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtt
 hhopegrrhhnugesrghrnhgusgdruggv
X-GND-Sasl: miquel.raynal@bootlin.com

On Tue, 10 Jun 2025 11:25:22 +0200, Arnd Bergmann wrote:
> The code in the ntfl write function is rather complex, and it contains
> a 512 byte on-stack buffer. The combination of these two leads to using
> more than the per-function stack warning limit in some configurations,
> especially with KASAN enabled:
> 
> drivers/mtd/nftlcore.c:673:12: error: stack frame size (1328) exceeds limit (1280) in 'nftl_writeblock' [-Werror,-Wframe-larger-than]
> 
> [...]

Applied to mtd/next, thanks!

[1/1] mtd: nftl: reduce stack usage in NFTL_movebuf()
      commit: d22d5f47ecb2c4e140c0ee52204f4dd8fd0e85eb

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl

