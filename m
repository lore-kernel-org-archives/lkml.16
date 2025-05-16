Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79785249EB;
	Fri, 16 May 2025 14:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747404414; cv=none; b=VD9j10hhyFrpwjKfEu7ZANzuKqQUNvo1ri4IPBtCsomZr2VfZk5MBfTIITtZ+ZgZCfUWeKCeGD0Gtk/ImQgXGxycisXatd8zbm3ke6dM//gP+RoRuRIUwmI97V1+RfN2st5APlnqaFHPoWkTRqyYaJ61aON9kMPTr6EEefIT4xM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747404414; c=relaxed/simple;
	bh=uosMdzNKbsqAbGcb+VwdzGGyGC+QOp1QBS3qepjAz/g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=NG1QxrLc+SrngdbXscIhW/6MjUzhkysI7HWJrcZMojqUsHHAnMVKZBKXAJN9L6aPZ1Rg1WZUGfwTm5G7kk+NZtmBeBOmdgm2wOckpVaqaCuXGkbhmwkSDUrxhFVVhQF5mueof2L8LHf8v71YozAIsvuYl0deYb9/IWxrtrSDaJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Cp8Anbs3; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Cp8Anbs3"
Received: by mail.gandi.net (Postfix) with ESMTPSA id CC69E4399F;
	Fri, 16 May 2025 14:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747404403;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7FNaCT4ZQwywoNYi1aikoPuxQeiAAAtXSDPCSbSoQYY=;
	b=Cp8Anbs3tIhc8FvhUb0RNthAJPHEeUjwx9VmSb6FIaINNL81nGtSTJ188OY96x8D3KpVwH
	eM/Vy69l9h8+IzytTJXijZyRXmmNcrexqy4isLI0OWbCzE8ED6/q5/jsX6aqNlJTycUNig
	zJLld6lvyiRe8joEgtGWc2uioTw3gI0ICoojca399xh/ruR4NcfgyNBo07uCBe0q2BJ0nj
	uQ/g+Q3Y/3sy+gdC63lTh6B00vDYFTGzAbuzgTPo+OB0ghdspBOJPByuJqiKGBp3Qhi8K5
	4mRBlYxsqTx3CK1vooo5+H0InweCrOfay/P4VPAUadkU3VY3kJ0/wzqWKAf8Rg==
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
In-Reply-To: <IA0PR12MB7699B60558C5211F8F80C471DC96A@IA0PR12MB7699.namprd12.prod.outlook.com>
	(Amit Kumar Mahapatra's message of "Tue, 13 May 2025 14:45:39 +0000")
References: <20250205133730.273985-1-amit.kumar-mahapatra@amd.com>
	<20250205133730.273985-4-amit.kumar-mahapatra@amd.com>
	<8734fa8hed.fsf@bootlin.com>
	<IA0PR12MB76994BA493127004B569F2AEDC832@IA0PR12MB7699.namprd12.prod.outlook.com>
	<87o6vyjgfl.fsf@bootlin.com>
	<IA0PR12MB7699B60558C5211F8F80C471DC96A@IA0PR12MB7699.namprd12.prod.outlook.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Fri, 16 May 2025 16:06:41 +0200
Message-ID: <87o6vsejke.fsf@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefuddvleegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduvddprhgtphhtthhopegrmhhithdrkhhumhgrrhdqmhgrhhgrphgrthhrrgesrghmugdrtghomhdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvr
 hhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: miquel.raynal@bootlin.com

On 13/05/2025 at 14:45:39 GMT, "Mahapatra, Amit Kumar" <amit.kumar-mahapatr=
a@amd.com> wrote:

> [AMD Official Use Only - AMD Internal Distribution Only]
>
> Hello Miquel,
>
>> >> > +           mtd->dev.parent =3D concat->subdev[0]->dev.parent;
>> >> > +           mtd->dev =3D concat->subdev[0]->dev;
>> >> > +
>> >> > +           /* Register the platform device */
>> >> > +           ret =3D mtd_device_register(mtd, NULL, 0);
>> >> > +           if (ret)
>> >> > +                   goto destroy_concat;
>> >> > +   }
>> >> > +
>> >> > +   return 0;
>> >> > +
>> >> > +destroy_concat:
>> >> > +   mtd_concat_destroy(mtd);
>> >> > +
>> >> > +   return ret;
>> >> > +}
>> >> > +
>> >> > +late_initcall(mtd_virt_concat_create_join);
>> >>
>> >> The current implementation does not support probe deferrals, I
>> >> believe it should be handled.
>> >
>> > I see that the parse_mtd_partitions() API can return -EPROBE_DEFER
>> > during MTD device registration, but this behavior is specific to the
>> > parse_qcomsmem_part parser. None of the other parsers appear to
>> > support probe deferral. As discussed in RFC [1], the virtual concat
>> > feature is purely a fixed-partition capability, and based on my
>> > understanding, the fixed-partition parser does not support probe defer=
ral.
>> > Please let me know if you can think of any other probe deferral
>> > scenarios that might impact the virtual concat driver.
>>
>> That's true, but I kind of dislike the late_initcall, I fear it might br=
eak in creative ways.
>
> I understand, but since we require the partition information to be
> available, late_initcall seems to be the most suitable choice among the
> initcall levels=E2=80=94if we decide to proceed with using an initcall.
> Regarding potential failures, as far as I can tell, the operation would
> fail if, at the time of concatenation, one or more of the MTD devices
> involved in the concat are not yet available. In such a scenario, we can
> issue a kernel warning and exit gracefully. But, However, if you prefer
> to move away from using initcalls and have an alternative
> implementation approach in mind, please let us know.

I am sorry but this does not work with modules, and we cannot ignore this
case I believe. More specifically, if a controller probe is deferred
(with EPROBE_DEFER or just prevented because some dependencies are not
yet satisfied), you'll get incorrectly defined mtd devices.

Thanks,
Miqu=C3=A8l
