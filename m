Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAFE72BE105
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 09:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745918866; cv=none; b=etBrWCAF24/jh71Udl3d2BHP06Jaw/nLKPnNu/SNB5ceNXT5GP+TuK59GGrq6uqgwwKsNIWGzEUPZVDLqn2Zy1EFKAZ1nM8Ht1jb/inwgBpBIt6eoGOpS3CQISakKdbj0sm72ZtwfbYF613g/mfA4pyZQu7LxLWhqUw63g8QW+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745918866; c=relaxed/simple;
	bh=mmfP5S1Ph56wd4WGG9ibr9aTcAVhPlfrwRbaYxmQ6FI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=O+Qz84GjQpfpYlUnE5swZS6Sl2r5DgFlZfX637z//0tlfShMvkiuXy51LJg+8MFFcOIIXmX2bIReZlQSgkLrF/3Y6W6j1kuZJce9lk+Tiz7JjraPVwnILGir7tDePKsmil5pzf1NCFz7m2g+qCHNR8eKc/Ic2lJcLMabBdjBFXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=bdKVEWzH; arc=none smtp.client-ip=217.70.178.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="bdKVEWzH"
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::224])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id 673C7583CF6
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 08:15:33 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F1C05433E9;
	Tue, 29 Apr 2025 08:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745914526;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0jWn/KFVD/PhQGEeRPiIgFZV9yfIp5BQEz26X19uNxE=;
	b=bdKVEWzHLtdV3g3fdHtJap4AYJ1a1U05TI+3nB2J2c6TtDHHUShrhrQ3Vsno/vAbdiitaA
	iXo3tfhRNNVunDzPDxRSBIxWkZELCxpy6/rW6Nd5AidH/UFQ0i6s4MpI/bdG46R5Yok6FS
	4C5VtaUGiu4ZKO0KBaMeHi8QZx7DwpNwoS6zCffudJYeJENdmm/jnfHyxOjmzMJ4RdmLlM
	QmRMKWo35M/8PBLDsvl7ZfhEDm3Llpn8JhH2VbJrwHsArXQsR0X93oIbE6ry7uTgWB/5S2
	WxEfF+4r6xVXzbVdEfctZYhmDMfXALNH8yd/uIxYFVvz5VgA6J7HM6k3iknoDw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Chuanhong Guo <gch981213@gmail.com>
Cc: Sky Huang <SkyLake.Huang@mediatek.com>,  Matthias Brugger
 <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,  Richard Weinberger
 <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,  Daniel Golle
 <daniel@makrotopia.org>,  Chia-Lin Kao <acelan.kao@canonical.com>,  Cheng
 Ming Lin <chengminglin@mxic.com.tw>,  Christophe JAILLET
 <christophe.jaillet@wanadoo.fr>,  Pratyush Yadav <pratyush@kernel.org>,
  linux-kernel@vger.kernel.org,  linux-mtd@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org,
  linux-mediatek@lists.infradead.org,  Steven Liu <Steven.Liu@mediatek.com>
Subject: Re: [PATCH nand/next] mtd: nand: spi: Use write_cache first and
 then update_cache in write operation
In-Reply-To: <c1e2d8ea-1b37-479d-8239-cb9bf0efdcaf@gmail.com> (Chuanhong Guo's
	message of "Tue, 22 Apr 2025 09:38:26 +0800")
References: <20241119093949.3014-1-SkyLake.Huang@mediatek.com>
	<871pymtab3.fsf@bootlin.com>
	<c1e2d8ea-1b37-479d-8239-cb9bf0efdcaf@gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 29 Apr 2025 10:15:22 +0200
Message-ID: <87bjsfv0x1.fsf@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieeffeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledvrddukeegrddutdekrddvheehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledvrddukeegrddutdekrddvheehpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduiedprhgtphhtthhopehgtghhleekuddvudefsehgmhgrihhlrdgtohhmpdhrtghpthhtohepufhkhifnrghkvgdrjfhurghnghesmhgvughirghtvghkrdgtohhmpdhrtghpthhtohepmhgrthhthhhirghsrdgsghhgsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghnghgvlhhoghhiohgrtggthhhinhhordguvghlrhgvghhnohestgholhhlrggsohhrrgdrtghomhdprhgtphhtthhopehri
 hgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtohepuggrnhhivghlsehmrghkrhhothhophhirgdrohhrghdprhgtphhtthhopegrtggvlhgrnhdrkhgrohestggrnhhonhhitggrlhdrtghomh
X-GND-Sasl: miquel.raynal@bootlin.com

Hello,

On 22/04/2025 at 09:38:26 +08, Chuanhong Guo <gch981213@gmail.com> wrote:

> Hello!
> =E5=9C=A8 2024/12/5 23:32, Miquel Raynal =E5=86=99=E9=81=93:
>> Hello,
>> On 19/11/2024 at 17:39:49 +08, Sky Huang <SkyLake.Huang@mediatek.com>
>> wrote:
>>=20
>>> From: Sky Huang <skylake.huang@mediatek.com>
>>>
>>> According to discussion with Miquel Raynal <miquel.raynal@bootlin.com>
>>> and Chuanhong Guo <gch981213@gmail.com> on FORESEE F35SQA002G patch,
>>> Chuanhong recommmends that we can use the following sequence in
>>> spinand_write_to_cache_op():
>>>
>>> x1 mode:
>>> 02H(program data load) -> 84H(random program data load) -> 84H ...
>>>
>>> x4 mode:
>>> 32H(program data load x4) -> 34H(random program data load x4) -> 34H ...
>>>
>>> 02H or 32H commands will clear cache buffer on SPI-NAND and load
>>> data to it. For those SPI controllers which can't finish transmission
>>> in single step, 84H or 34H will be triggered for the rest data.
>>>
>>> We observe that some current SPI-NANDs, including FORESEE F35SQA001G and
>>> F35SQA002G, must use 02H or 32H to reset cache buffer in flash before
>>> using 84H or 34H. Or users may encounter program failure issue. This is=
sue
>>> is not always reproducible, but it may occur and cause system instabili=
ty.
>>>
>>> This sequence should work on all SPI-NANDs nowadays. I also check with
>>> Foresee that the sequence can solve the above program failure issue.
>>>
>>> On my test platform (MT7988), SPI driver is drivers/spi/spi-mt65xx.c.
>>> And I limit MTK_SPI_IPM_PACKET_SIZE to SZ_1K to simulate lightweight SPI
>>> controller which can only transmit 1024 bytes.
>>>
>>> The test step is the following:
>>> - mtd erase /dev/mtd2
>>> - dd if=3D/dev/zero bs=3D2048 count=3D1 | tr '\0' '\xA5' > output.bin
>>> - mtd write output.bin /dev/mtd2
>>>
>>> Before applying this patch, write operation uses only 34H(update_cache):
>>> [78.937720] OP code: 0x34, addr val: 0x0, data nbytes: 1020, data 1st b=
yte: 0xa5
>>> [78.945297] OP code: 0x34, addr val: 0x3fc, data nbytes: 1020, data 1st=
 byte: 0xa5
>>> [78.954251] OP code: 0x34, addr val: 0x7f8, data nbytes: 72, data 1st b=
yte: 0xa5
>>> [78.962966] OP code: 0x10, addr val: 0x300
>>> [78.968816] OP code: 0x34, addr val: 0x0, data nbytes: 1020, data 1st b=
yte: 0xff
>>> [78.977233] OP code: 0x34, addr val: 0x3fc, data nbytes: 1020, data 1st=
 byte: 0xff
>>> [78.985124] OP code: 0x34, addr val: 0x7f8, data nbytes: 72, data 1st b=
yte: 0xff
>>> [78.992527] OP code: 0x10, addr val: 0x301
>>> [78.996981] OP code: 0x34, addr val: 0x0, data nbytes: 1020, data 1st b=
yte: 0xff
>>> [79.004416] OP code: 0x34, addr val: 0x3fc, data nbytes: 1020, data 1st=
 byte: 0xff
>>> [79.012031] OP code: 0x34, addr val: 0x7f8, data nbytes: 72, data 1st b=
yte: 0xff
>>> [79.019435] OP code: 0x10, addr val: 0x302
>> I am sorry but above you said that we should not perform:
>>      0x32, 0x32, 0x32...
>> because the second time it would clear the cache again. And here
>> you tell us that actually the core already handles that by performing
>> instead:
>>      0x34, 0x34, 0x34...
>> So what is the problem?
>> Or maybe I misunderstood the issue, but I think Chuanhong raised an
>> issue that is already solved? Isn't it?
>>=20
>
> The issue is that the FORESEE NANDs require the first cache writing
> instruction to be WRITE_CACHE instead of UPDATE_CACHE. i.e. it needs a
> command sequence of:
>     0x32, 0x34, 0x34, 0x34...

So Foresee NANDs do not support update_cache, why are they advertised in
the first place? Could you we have a less impacting solution for the
other NANDs?

> This patch does exactly that, making the first instruction issued 0x32.
> It should be applied to fix the issue above.

My understanding is that this is very specific to FORESEE NANDs and you
are changing this for all NANDs. I have fears that it will break
everywhere else.

Overall I understand the problem, but I disagree with the fix. Could you
propose something less impacting as hinted above?

Thanks and sorry for the delay.
Miqu=C3=A8l
