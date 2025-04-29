Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3773729290D
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 09:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745918799; cv=none; b=Bm7mvopDe4EfSdXYk3UX4vIaALg3Esli15XnlXKdMacYLiol/N7Pqiq9/VYqRdqx4aYR27tVLnZie4WkI3mkj3TMc+Y+blAoPd/Djk54q66gXnUPJ2frP6EuUM0YiPl+xPbckN+j80D/yMsEiB09Qunm13a5Q4TjqCpldgJ4Ozk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745918799; c=relaxed/simple;
	bh=YLfYS5ABeKHGhaDv1mbTfzYSLJDsPMjydLwS0/qNyck=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=AqBZHSDK+kFkpVjsMYMl+sG/B4H3sKtxTeVbQdfKfAPBs27NxjqPsnfQfNPfQ+jOCIwpq8EbBIW56EAGyCMzBkzQ5MjZ2BGqRqDogW/uJoF1Aycw3t1jOVCOC5PUenWKJjycllEtcKhpMz82d6qLkbRt/ise3Y71kT/bHtL0dcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=S3+PEoYn; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="S3+PEoYn"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9E94C43AD5;
	Tue, 29 Apr 2025 09:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745918795;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3zBSOJ8PZCIJkVI0RwB72XCG1uSclea039h0mEzj+SA=;
	b=S3+PEoYnUm9uzhdF5bN5wK/Kw45LUnE7GFYWD1oKTIhFFByEx6DaR6QT0FI6l25fIcxrrr
	wpv5Wv6NK8KYo4yOqY5inXyzR2qREvhjN8smC/1Sf6ntqMD1mtEM+LjYuXRUf1KP5Kw2FC
	LjfNk8i80tGmb2NDM0EHj7m7+zjWuBy4UF65Up7+3kVXAmvIjvpbV5+raOCQ9WvB33stVH
	c/2rq6rqsUDh2LvtgCybFBrF87BpMY3m8MNkMurGV7VcrgKOI9y9hry2KsxYG9+Om5hUEh
	WU6yTnCEdFXvIS6YxiAzF6UXIBKeLijPU7QGRzAAwQOz1V1EAtu7oAcxF2OHBA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mikhail Arkhipov <m.arhipov@rosa.ru>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
In-Reply-To: <20250408213906.23129-1-m.arhipov@rosa.ru>
References: <20250408213906.23129-1-m.arhipov@rosa.ru>
Subject: Re: [PATCH] mtd: nand: ecc-mxic: Fix use of uninitialized variable
 ret
Message-Id: <174591879451.993707.7630596131927470519.b4-ty@bootlin.com>
Date: Tue, 29 Apr 2025 11:26:34 +0200
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieefgeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevjghfuffkffggtgfgofesthekredtredtjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehieffhfeulefgtdeltefgleevgffgheduledvheduudelgfehlefgheeivedvgeenucfkphepledvrddukeegrddutdekrddvheehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledvrddukeegrddutdekrddvheehpdhhvghloheplgduledvrdduieekrddurddutdeingdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeipdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehlvhgtqdhprhhojhgvtghtsehlihhnuhigthgvshhtihhnghdrohhrghdprhgtphhtthhopehmrdgrrhhhihhpohhvsehrohhsrgdrrhhup
 dhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-GND-Sasl: miquel.raynal@bootlin.com

On Wed, 09 Apr 2025 00:39:06 +0300, Mikhail Arkhipov wrote:
> If ctx->steps is zero, the loop processing ECC steps is skipped,
> and the variable ret remains uninitialized. It is later checked
> and returned, which leads to undefined behavior and may cause
> unpredictable results in user space or kernel crashes.
> 
> This scenario can be triggered in edge cases such as misconfigured
> geometry, ECC engine misuse, or if ctx->steps is not validated
> after initialization.
> 
> [...]

Applied to nand/next, thanks!

[1/1] mtd: nand: ecc-mxic: Fix use of uninitialized variable ret
      commit: d95846350aac72303036a70c4cdc69ae314aa26d

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl

