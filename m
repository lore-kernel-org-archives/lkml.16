Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA3A213E61;
	Tue, 11 Feb 2025 12:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739278539; cv=none; b=SE6zO7rJWWioFsueB/cFT/NX+LECiL5Sfaz2c4YeTxnsOMSmRf7vnKvpRu7sf8NPmlnw6KYQk8MVEJ8GPfmmKiRkh/aEnRC72rIxFmbrmBe+gn0UJ+6J+Z/CtDwdsE4zf0uNg5TyL0FTggimSwucTpi/bjZGu6FnRu5UUhq8mfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739278539; c=relaxed/simple;
	bh=oQTwAhJIFYAJiwGAkvzbxNGxtOe4LVlm+iyhpYarxEo=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=sdPU3e6LBN7+jWMDcYIBB89I7R/q1MD377Nvdcm4dXeJ5/j2Zt/KOIhjA0uhMeohCKS+IFRLwiuUmq7TdayTmpxFkzt+sViciyn1eaoWmjcHsNKzQBX/cO9jAAsd8aVhVYnkJg9scPS9vZZtuW6XflG2c+AEku/9Hx8zJla5+f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=mnHuo3D9; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="mnHuo3D9"
Received: by mail.gandi.net (Postfix) with ESMTPSA id B06C9433E5;
	Tue, 11 Feb 2025 12:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739278535;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3RXfSl7prs9dlKymYiyvEDBNrnmt/hzro4w6GBu5Hzg=;
	b=mnHuo3D9rUdG8LDBamKSLPrQv49SKJu+feypUhxcxZ/jqERSGmbeDHUwKVZQT05amTK7hn
	vHw/2DGWuC9lgjYJl9Vf17Z/z+EzoCl1Y1BUVJZRKcqL3d1iJ4/Ay0WASWcqbwB4CLKihp
	EsGBRZp0C/qObtcUDR+enNJgZlNRve+TEZpk5qfOMRr1g7g55oBuzwx6sHKAQzmnvMI94s
	6ZFJ6IbfY/Yl2sCytOmUN9jJikm3G7T8+uG8lk/lP7Z3ZMTe9bAm40qVX/XWzsbU4xJ1fK
	SlihIFnc04p7sU6AZHxcEw5+LukAbdjruF07J9dyff2ZBcd0v54NKT19Dg9JGA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Christian Marangi <ansuelsmth@gmail.com>
In-Reply-To: <20250209145439.19047-1-ansuelsmth@gmail.com>
References: <20250209145439.19047-1-ansuelsmth@gmail.com>
Subject: Re: [PATCH] mtd: rawnand: qcom: finish converting register to
 FIELD_PREP
Message-Id: <173927853450.127165.16898289318508765683.b4-ty@bootlin.com>
Date: Tue, 11 Feb 2025 13:55:34 +0100
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeguddthecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvjghfuffkffggtgfgofesthekredtredtjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffhfdufefgueeuheeuveduieeijefhjeduveduveeitedvteeftdffhfejieelfeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrdegvddrgeeingdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeejpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnshhuvghlshhmthhhsehgmhgrihhlrdgtohhmp
 dhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehmrghnihhvrghnnhgrnhdrshgrughhrghsihhvrghmsehlihhnrghrohdrohhrgh
X-GND-Sasl: miquel.raynal@bootlin.com

On Sun, 09 Feb 2025 15:54:32 +0100, Christian Marangi wrote:
> With some research in some obscure old QSDK, it was possible to find the
> MASK of the last register there were still set with raw shift and
> convert them to FIELD_PREP API.
> 
> This is only a cleanup and modernize the code a bit and doesn't make
> any behaviour change.
> 
> [...]

Applied to nand/next, thanks!

[1/1] mtd: rawnand: qcom: finish converting register to FIELD_PREP
      commit: 1db50b96b059ca8e5548cb3e0e38a888b325f96b

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl

