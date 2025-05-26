Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54CE14D599;
	Mon, 26 May 2025 08:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748247044; cv=none; b=B/Bpe7Uco0y537fw3W2d0BQKXt3Q4BJ0rJVU4TfF7NBO9uWz/Zu3/RMKHWwtFVPDYSvgu5+MqH9HYgImWcJYAE4ZX3ym0qax/PyPYLsKY+8BaC1tvap8wiWwvU9tTVX8sigCHq4+dFyvONl7gbKL4m6sbqhO/kWsLvzOrIEM7a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748247044; c=relaxed/simple;
	bh=NKtlm0wAjMgQp9P8UItt7YMIPJ6Wz4vKYpgBLkGvLq0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=LEcFAf5717CyBETpP5xjRdxgLbvQhyQrVgOTomTNVJ53YIXVIT/03OAvTg/d84Es39OEvwmzZVRHRODyWbg4/BYhFrAtmCmFSb87nYKmDDDILcocksxpXM3mal1fcgIiQYrdNmuteUIDdMV65zvKzBLeG57dMzAEQ7BKQkU2BYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=V392rnYF; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="V392rnYF"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 09B0F432A2;
	Mon, 26 May 2025 08:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748247040;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GuNkJwVVyWMP6VzsZqlzIYpsiMS21Kc27Fn5oFSy5nU=;
	b=V392rnYF+b8ejLtIgotB6fZYefzXcCM9oIoTrmYQRqcddh8NRp9TXiYPMunSo0ekDYLk4m
	q5hyFi5rDu84Gd4sjlKiyYnebhwdkk+Bx2E9b+Adev/FT/IQsltonASTSAgS8DJXkgCgFr
	WInak7bY9X9wE77y51rn2FVAUhULE08I6G/9d/FIteXVPIcecPSjdh4ZVx+nKQJdjFOpU1
	3WhwjU+BiXiD9wEri6eSEEMcq+qwObwR58uTz4pUDGekjQI81xyniwZNt7hEzhTKp1hTry
	993fFwYdoOw9ypzddb+A8PgmfVYCfoee0fLvOtSJaYmT0mWpVrSjxmAZSePfDQ==
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
In-Reply-To: <IA0PR12MB7699044F76475546F31AAC26DC9EA@IA0PR12MB7699.namprd12.prod.outlook.com>
	(Amit Kumar Mahapatra's message of "Wed, 21 May 2025 06:13:32 +0000")
References: <20250205133730.273985-1-amit.kumar-mahapatra@amd.com>
	<20250205133730.273985-4-amit.kumar-mahapatra@amd.com>
	<8734fa8hed.fsf@bootlin.com>
	<IA0PR12MB76994BA493127004B569F2AEDC832@IA0PR12MB7699.namprd12.prod.outlook.com>
	<87o6vyjgfl.fsf@bootlin.com>
	<IA0PR12MB7699B60558C5211F8F80C471DC96A@IA0PR12MB7699.namprd12.prod.outlook.com>
	<87o6vsejke.fsf@bootlin.com>
	<IA0PR12MB7699044F76475546F31AAC26DC9EA@IA0PR12MB7699.namprd12.prod.outlook.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 26 May 2025 10:10:39 +0200
Message-ID: <87ecwb3i80.fsf@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddujedttdculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffeghfejtdefieeguddukedujeektdeihfelleeuieeuveehkedvleduheeivdefnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddvpdhrtghpthhtoheprghmihhtrdhkuhhmrghrqdhmrghhrghprghtrhgrsegrmhgurdgtohhmpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohept
 ghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: miquel.raynal@bootlin.com

On 21/05/2025 at 06:13:32 GMT, "Mahapatra, Amit Kumar" <amit.kumar-mahapatr=
a@amd.com> wrote:

> [AMD Official Use Only - AMD Internal Distribution Only]
>
>> On 13/05/2025 at 14:45:39 GMT, "Mahapatra, Amit Kumar" <amit.kumar-
>> mahapatra@amd.com> wrote:
>>
>> > [AMD Official Use Only - AMD Internal Distribution Only]
>> >
>> > Hello Miquel,
>> >
>> >> >> > +           mtd->dev.parent =3D concat->subdev[0]->dev.parent;
>> >> >> > +           mtd->dev =3D concat->subdev[0]->dev;
>> >> >> > +
>> >> >> > +           /* Register the platform device */
>> >> >> > +           ret =3D mtd_device_register(mtd, NULL, 0);
>> >> >> > +           if (ret)
>> >> >> > +                   goto destroy_concat;
>> >> >> > +   }
>> >> >> > +
>> >> >> > +   return 0;
>> >> >> > +
>> >> >> > +destroy_concat:
>> >> >> > +   mtd_concat_destroy(mtd);
>> >> >> > +
>> >> >> > +   return ret;
>> >> >> > +}
>> >> >> > +
>> >> >> > +late_initcall(mtd_virt_concat_create_join);
>> >> >>
>> >> >> The current implementation does not support probe deferrals, I
>> >> >> believe it should be handled.
>> >> >
>> >> > I see that the parse_mtd_partitions() API can return -EPROBE_DEFER
>> >> > during MTD device registration, but this behavior is specific to
>> >> > the parse_qcomsmem_part parser. None of the other parsers appear to
>> >> > support probe deferral. As discussed in RFC [1], the virtual concat
>> >> > feature is purely a fixed-partition capability, and based on my
>> >> > understanding, the fixed-partition parser does not support probe de=
ferral.
>> >> > Please let me know if you can think of any other probe deferral
>> >> > scenarios that might impact the virtual concat driver.
>> >>
>> >> That's true, but I kind of dislike the late_initcall, I fear it might=
 break in creative
>> ways.
>> >
>> > I understand, but since we require the partition information to be
>> > available, late_initcall seems to be the most suitable choice among
>> > the initcall levels=E2=80=94if we decide to proceed with using an init=
call.
>> > Regarding potential failures, as far as I can tell, the operation
>> > would fail if, at the time of concatenation, one or more of the MTD
>> > devices involved in the concat are not yet available. In such a
>> > scenario, we can issue a kernel warning and exit gracefully. But,
>> > However, if you prefer to move away from using initcalls and have an
>> > alternative implementation approach in mind, please let us know.
>>
>> I am sorry but this does not work with modules, and we cannot ignore thi=
s case I
>> believe. More specifically, if a controller probe is deferred (with EPRO=
BE_DEFER
>> or just prevented because some dependencies are not yet satisfied), you'=
ll get
>> incorrectly defined mtd devices.
>
> Ok, an alternative solution could be to remove the initcall registration
> and instead invoke mtd_virt_concat_create_join()=E2=80=94which was previo=
usly
> registered as a late_initcall=E2=80=94directly from mtd_device_parse_regi=
ster().
> I believe this approach would address both of your concerns regarding
> module support and probe deferral. Additionally, we could consider
> moving the entire code from mtd_virt_concat.c into mtdconcat.c.
> Please let us know your take on this.

What would this bring?

Maybe we should trigger some kind of notifier after registering an mtd
device and in there attempt to gather all mtd devices required for the
concatenation. Can you please propose something like that?

Thanks,
Miqu=C3=A8l
