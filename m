Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75491EB18E
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 07:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744184309; cv=none; b=Y/PrUGdNBVaXRwb9bVrXIBtXlCFDCU638RtRoPnVob7yBNaXKAFngRjLo4tmVWgt4S0/aB4cJ0JW5FlIki48ZXsdiozAzO9eYnU2bFyVrN0mIy6v2GZnOl6hZgWG1PJVRKNIC6bxSde6l0G9yDtR0VzPncDNfrdlDg9MrOPZy8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744184309; c=relaxed/simple;
	bh=KfpRXUCxzkoQbCGtnWTHiZepgMVHCRh0eaffx0cA0xY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=u8I3JftEAc0/qEEysvGWhTPxeuoSGt+EpwkDigOPb170J4onoBmDe1d47HxdAesmqXa3egHYAQ7aHt6Pedz10xI9VGz5OPMLFSsaIOBJWO8TX58O6V7WCMi9mgCRhgLZsafOlac7SJHJ9IUkLUfYvMv56WJWPwdxgp7uLDP7y98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=C8P4Xhw+; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="C8P4Xhw+"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 980D344443;
	Wed,  9 Apr 2025 07:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744184299;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KfpRXUCxzkoQbCGtnWTHiZepgMVHCRh0eaffx0cA0xY=;
	b=C8P4Xhw+MZU+F89vQSeyNet/H3rSTmbg76soqo8S9hujFZlwC/lMUfamO7+Fan4Fbme0Mg
	w+2VPXwHkUZ12gLJawWZxVU6qUOruJxh8BCpqRkUHUV4LHIAUbQAXT2Fte9p7TLtqEziGu
	unvjrAEpPvQIXoGOl54iLh1rFVdxLZqWfDDEbsL9XzBViIYCykHkGYXHQW3QCMAwdVxchc
	SGI0RQGY8E+IhIKfSwtfWxjKISd10upmdgyG/dm8I4Y1G9Mqi5zrKpQa1YNaxllvmmi3Lm
	FyTz55Aw/UTEUTVU4HGVTUarra6MYDZWft836O8B34UBz83EgHiBO5FcGhCs2A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mikhail Arkhipov <m.arhipov@rosa.ru>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  lvc-project@linuxtesting.org
Subject: Re: [PATCH] mtd: nand: ecc-mxic: Fix use of uninitialized variable ret
In-Reply-To: <20250408213906.23129-1-m.arhipov@rosa.ru> (Mikhail Arkhipov's
	message of "Wed, 9 Apr 2025 00:39:06 +0300")
References: <20250408213906.23129-1-m.arhipov@rosa.ru>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 09 Apr 2025 09:38:17 +0200
Message-ID: <87v7rdhjiu.fsf@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdehgeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepvddttddumeekiedumedvtdgtfeemsggufhdtmegvgehftdemfhejudhfmehfsggrvdemkegufhejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumedvtdgtfeemsggufhdtmegvgehftdemfhejudhfmehfsggrvdemkegufhejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeipdhrtghpthhtohepmhdrrghrhhhiphhovhesrhhoshgrrdhruhdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguv
 ggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlvhgtqdhprhhojhgvtghtsehlihhnuhigthgvshhtihhnghdrohhrgh
X-GND-Sasl: miquel.raynal@bootlin.com

On 09/04/2025 at 00:39:06 +03, Mikhail Arkhipov <m.arhipov@rosa.ru> wrote:

> If ctx->steps is zero, the loop processing ECC steps is skipped,
> and the variable ret remains uninitialized. It is later checked
> and returned, which leads to undefined behavior and may cause
> unpredictable results in user space or kernel crashes.
>
> This scenario can be triggered in edge cases such as misconfigured
> geometry,

Would clearly be a huge bug, nothing else would work in this case, not a
single read, ie. we would stop way before reaching this point.

> ECC engine misuse,

Ditto.

> or if ctx->steps is not validated after initialization.

steps =3D mtd->writesize / 1K
and
we only run on large-page NANDs, ie. chips with mtd->writesize >=3D 1K.
so this case is not plausible.

> Initialize ret to zero before the loop to ensure correct and safe
> behavior regardless of the ctx->steps value.
>
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>
> Fixes: 48e6633a9fa2 ("mtd: nand: mxic-ecc: Add Macronix external ECC
> engine support")

I will apply, but honestly I do not think this fixes anything.

> Signed-off-by: Mikhail Arkhipov <m.arhipov@rosa.ru>

Thanks,
Miqu=C3=A8l
