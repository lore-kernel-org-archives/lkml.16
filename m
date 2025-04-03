Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D681119E7D1
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 08:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743670443; cv=none; b=QnjTpXRWOU+4Chmi/xkVMoISHWREvW6EAe6gteQocFHNIDq+mBqAmhJTBli7/u5EnI4PEjlhONTOCQf5OK0zrGIk9xv3FTS+jRB+u4AOT1BZ++37vdi59gV1aVyuddi0Uscgi4SuZqFcGnbKdl/aWdJ/Iqzv4rdQtWivfAWiDSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743670443; c=relaxed/simple;
	bh=EA9RHBwK/f1GdxBdtnI2Cjac/r8+/qisQMVWLtHUsuk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jmrKYjVLhtdwZ4JeFEm9bQj4y5sqcWycz6ucMI/7DP+VM0fjMNjkJl0HY8yKUG4mgUGcbF8N7wD2afBYiP1Qrqw/d11VrbhIEMfZ3NegH343W/hZVW6O8WJY95tTXRcLXkNzz6MJjoUt35FklUIWiJSsp1Ho/uucVQzizKZDmH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ABIvI39V; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ABIvI39V"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 81DB44420D;
	Thu,  3 Apr 2025 08:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743670432;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EA9RHBwK/f1GdxBdtnI2Cjac/r8+/qisQMVWLtHUsuk=;
	b=ABIvI39VyrC0zNsI+cRa2wsu8Koh5x0Xkuv6CzhDw+SV6N7Hs2YvvMa6EPtitlGXktl5PQ
	Q3Wn9Md5bf5AAVPbSng9wo8t8J6iy3xqn6DJFaPk4BFwZPW6rUrwmkow8YS55m/i+cSa82
	Ijat24UrwbZQzS5PmeneCTaYvygCzjrcpfuyeqlu3SGWHQ5ZY0cMnpV7g/HGtmk7ryh4X/
	PPOGoxHWTWkdOj/9qyK9yWzVV1AYyPp6Rsxb0W7Z2M07QU3ciYkoexuMW+0/tf60pkcYxO
	ipH+f4M7bvUeuyE0hAcs0hK5ypm+O3J/G44hgwTrU6iyoIF5q7Vz5XD2HrpvMw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Santhosh Kumar K <s-k6@ti.com>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <michael@walle.cc>,  Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>,  Steam Lin <stlin2@winbond.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 15/21] mtd: spinand: winbond: Rename DTR variants
In-Reply-To: <5463acad-ee29-45de-9d22-16eb7947002c@linaro.org> (Tudor
	Ambarus's message of "Thu, 3 Apr 2025 07:19:15 +0100")
References: <20250307-winbond-6-14-rc1-octal-v1-0-45c1e074ad74@bootlin.com>
	<20250307-winbond-6-14-rc1-octal-v1-15-45c1e074ad74@bootlin.com>
	<3ebd53ef-c7fd-4c8c-96f3-32e97b355b6b@linaro.org>
	<871puaqz6m.fsf@bootlin.com>
	<5463acad-ee29-45de-9d22-16eb7947002c@linaro.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Thu, 03 Apr 2025 10:53:49 +0200
Message-ID: <87cydty6aq.fsf@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeekudefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledvrddukeegrdduuddtrdduleelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledvrddukeegrdduuddtrdduleelpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedutddprhgtphhtthhopehtuhguohhrrdgrmhgsrghruhhssehlihhnrghrohdrohhrghdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtohepshdqkheisehtihdrtghomhdprhgtphhtthhopehprhgrthihuhhshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhhitghhrggvlhesfigrlhhlvgdrtggtp
 dhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepshhtlhhinhdvseifihhnsghonhgurdgtohhm
X-GND-Sasl: miquel.raynal@bootlin.com

Hello Tudor,

On 03/04/2025 at 07:19:15 +01, Tudor Ambarus <tudor.ambarus@linaro.org> wro=
te:

> On 4/2/25 5:57 PM, Miquel Raynal wrote:
>> Hello Tudor,
>>=20
>> First, thanks a lot for the time spent reviewing, much appreciated.
>>=20
>> On 02/04/2025 at 16:19:00 +01, Tudor Ambarus <tudor.ambarus@linaro.org> =
wrote:
>>=20
>>> Hi, Miquel,
>>>
>>> On 3/7/25 3:08 PM, Miquel Raynal wrote:
>>>> -static SPINAND_OP_VARIANTS(read_cache_dtr_variants,
>>>> +static SPINAND_OP_VARIANTS(read_cache_dual_quad_dtr_variants,
>>>
>>> why not read_cache_single_dual_quad_dtr_variants? I see single dtr too
>>> in the supported ops.
>>=20
>> That's true, but single modes are literally always supported, so it is
>
> literally, meaning from experience I guess, or is it mandatory that
> dual, quad or octal dtr to imply single dtr as well? That's fine either
> way, just curious.

Yes, I do not know any chip not supporting single SDR mode, just because
we need a common ground to perform the discovery? The core would anyway
not be ready for such chips if they were about to come.

> Does quad dtr imply dual dtr? And octal dtr imply quad dtr and dual dtr?
> If so, then maybe name it by the maximum IO dtr supported.

Unfortunately not. Chips supporting quad may also support dual, but not
always. These chips flagged 'dual_quad' indeed support both. However in
this particular case, octal chips do not support dual or quad
opcodes. Hence my idea to name the variants about what is supported,
behind 1S opcodes.

> btw, not strictly related to this patch, but for the overall
> architecture picture, why do the SPI NAND flashes need to define their
> supported ops? SPI NORs for example are capable of discovering their
> supported ops by parsing at runtime some SFDP tables that describe most
> of the flash parameters and setting. I see SFDP standard (jesd216g)
> mentions SPI NAND devices as well. Have you or anybody else played with
> SPI NANDs SFDP?

Not at all! SPI NANDs commonly advertise a parameter page which is way
more succinct, but no SFDP table.

>> not very discriminant, and here my goal is to differentiate the variants
>> supported by the dual/quad chips vs. the variants supported by the octal
>> chips (which are not capable of dual/quad transfers). What do you think?
>
> I find it fine to differentiate between the variants.

Ok, thanks.

Miqu=C3=A8l
