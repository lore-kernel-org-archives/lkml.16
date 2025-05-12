Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F8AB19E97C;
	Mon, 12 May 2025 10:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747044115; cv=none; b=QDDk/89ibKsKwnKfaM9bdz7P8tqeDOuSzZEOKVDPpHO8S7mM07iMdR4Q1V3fJfUTGY+IBSGXEId99WDQAhHxmLySg+cqwW6uWalR8kO9F4hdOYdD7A/Z1foR520c1Z454IWuAtkTrHarBs21sJmTnCAIUMJL688DstJM95WTIyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747044115; c=relaxed/simple;
	bh=Lvpug9FEpAMKnwLUgy1E94q5V5F3Hp/cYHFhJlR7iIo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bZcs7jv7GBmvsa1zPyNPhZe4eI3iNGxjbFVDYAMQ9OcKN7INALDdUBNCbBB44amvBXoIWyYNyavBdCCvRjrPsX0/Mw6h8lgm9eTp0K9Qf7+XJeNwdkbyZPofPYwbZdE4eM277uQf7bsA5+w7YVzGuRicU46qtN6ycQXJ9pnCU8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=S2t2lVKC; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="S2t2lVKC"
Received: by mail.gandi.net (Postfix) with ESMTPSA id E5419433E9;
	Mon, 12 May 2025 10:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747044111;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=23/KllP1Vs2xVFOmNRG8GlctBkDoHOk55ezgK8BXOUY=;
	b=S2t2lVKCHSX+Pvb0Cy6ezCRITtuaBvgqqxJxHdHge7MRpTtFm6Fc74aZuRFzNCExVU7uej
	JsvO2Q/6gxMMV5CeOML88qNGwLBKAfjcy5x81fhr3FFIZ752NFvgXQi17jtQQl1rIVJPgR
	Fdi13vV00/fYO6CU7anq4ynM8HI6vIxq6XyTee6haGxsIp5kXSBRQNqD+yl7Yp/V3jggC2
	d3NusWAq0bgwsW8TtJs1PFjC4pOYD+374mBBoaU1Jm8jhUOTVDz9TKeMAzsZP/JEQZXVtK
	iOVk0II5ppF0936fAYEsrm29BU/vN/JDQD9nU8mFFJKKyrYe20oBzqlEvMLxLQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Mahapatra, Amit Kumar" <amit.kumar-mahapatra@amd.com>
Cc: "richard@nod.at" <richard@nod.at>,  "vigneshr@ti.com" <vigneshr@ti.com>,
  "robh@kernel.org" <robh@kernel.org>,  "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>,  "conor+dt@kernel.org" <conor+dt@kernel.org>,
  "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
  "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
  "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,  "git
 (AMD-Xilinx)" <git@amd.com>,  "amitrkcian2002@gmail.com"
 <amitrkcian2002@gmail.com>,  Bernhard Frauendienst
 <kernel@nospam.obeliks.de>
Subject: Re: [PATCH v12 3/3] mtd: Add driver for concatenating devices
In-Reply-To: <IA0PR12MB76994BA493127004B569F2AEDC832@IA0PR12MB7699.namprd12.prod.outlook.com>
	(Amit Kumar Mahapatra's message of "Wed, 30 Apr 2025 14:18:34 +0000")
References: <20250205133730.273985-1-amit.kumar-mahapatra@amd.com>
	<20250205133730.273985-4-amit.kumar-mahapatra@amd.com>
	<8734fa8hed.fsf@bootlin.com>
	<IA0PR12MB76994BA493127004B569F2AEDC832@IA0PR12MB7699.namprd12.prod.outlook.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 12 May 2025 12:01:50 +0200
Message-ID: <87o6vyjgfl.fsf@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftddtleejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduvddprhgtphhtthhopegrmhhithdrkhhumhgrrhdqmhgrhhgrphgrthhrrgesrghmugdrtghomhdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvr
 hhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: miquel.raynal@bootlin.com


>> > +           mtd->dev.parent =3D concat->subdev[0]->dev.parent;
>> > +           mtd->dev =3D concat->subdev[0]->dev;
>> > +
>> > +           /* Register the platform device */
>> > +           ret =3D mtd_device_register(mtd, NULL, 0);
>> > +           if (ret)
>> > +                   goto destroy_concat;
>> > +   }
>> > +
>> > +   return 0;
>> > +
>> > +destroy_concat:
>> > +   mtd_concat_destroy(mtd);
>> > +
>> > +   return ret;
>> > +}
>> > +
>> > +late_initcall(mtd_virt_concat_create_join);
>>
>> The current implementation does not support probe deferrals, I believe i=
t should be
>> handled.
>
> I see that the parse_mtd_partitions() API can return -EPROBE_DEFER during
> MTD device registration, but this behavior is specific to the
> parse_qcomsmem_part parser. None of the other parsers appear to support
> probe deferral. As discussed in RFC [1], the virtual concat feature is
> purely a fixed-partition capability, and based on my understanding, the
> fixed-partition parser does not support probe deferral.
> Please let me know if you can think of any other probe deferral scenarios
> that might impact the virtual concat driver.

That's true, but I kind of dislike the late_initcall, I fear it might
break in creative ways.

Thanks,
Miqu=C3=A8l
