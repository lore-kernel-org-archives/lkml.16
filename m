Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D150A28EB;
	Mon, 26 May 2025 14:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748270346; cv=none; b=PcskwOA3N7oHjniG1em/0/5kh7suSGeZAXkBTby4UYWLXUklipV7HRn6SkwBXXqhkoLCGV3C8oWOhkTWXYJkiJS68q7tIAbVffmPqdboZuqrVQymfHL6nvPApJhPxLRr5SaLq1F2ilJQoSBYQ6KeLCyBZR81GZsKfezMmF/OKls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748270346; c=relaxed/simple;
	bh=VWciSDZUuB5qMRfkwP1Gckbf/o3WDCHynGvwAs+Km/w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=n1CixRc93mY/Xw7AkwBCqBiOMpJvN4ur79MuS6XhizcuFOIu3wRIGDv4G/My8Rk1/QX2XikDAoKxE18jdfAnQPKRu5vhLf62+Q+FbRqNmUR8f/KnlCw9X9oh5zfLcaLdbPyoJ1oOfGek6MsTGxK4CpbaWVGFaDn1tfn4WuwuKaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=KgP3tfqB; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="KgP3tfqB"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 54382442B3;
	Mon, 26 May 2025 14:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748270342;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Urg+sqezh7vF8gKr14xmsaMNiNghGrMmO41OBVt6LD8=;
	b=KgP3tfqBZ/iWYbHdKEFt7kVeOdg6D/q2LaBqD6vDZ61oy1GLoR+FiP2swbMSfGyMhzcliZ
	7YyQiR6lpJ63NFRbqqgj9vNPsCzi5ko80V1R3mAbWChsVG7T70JW4/sqVkEArWop11Xzti
	Jj+DoYhFR4Jv8pkzpuwjxx07y/NR9EbRI6dkmN+Lxe6t3t9zloCbeHQGfKrhM0MKNySb9F
	NG+SgHTHuH4SaRX3UakT1E9SLbIbROWsyAofoDZ/F8W0XALXduTMyw46+QqdHotD3s6oOK
	VMszTyabVYTf/fsLsFBjBIjMpa6F6QZohdR3sMO+fb5XUZAM1TeeeQ91f2FVWA==
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
In-Reply-To: <IA0PR12MB76996538D556ABC8E9C29624DC65A@IA0PR12MB7699.namprd12.prod.outlook.com>
	(Amit Kumar Mahapatra's message of "Mon, 26 May 2025 14:27:37 +0000")
References: <20250205133730.273985-1-amit.kumar-mahapatra@amd.com>
	<20250205133730.273985-4-amit.kumar-mahapatra@amd.com>
	<8734fa8hed.fsf@bootlin.com>
	<IA0PR12MB76994BA493127004B569F2AEDC832@IA0PR12MB7699.namprd12.prod.outlook.com>
	<87o6vyjgfl.fsf@bootlin.com>
	<IA0PR12MB7699B60558C5211F8F80C471DC96A@IA0PR12MB7699.namprd12.prod.outlook.com>
	<87o6vsejke.fsf@bootlin.com>
	<IA0PR12MB7699044F76475546F31AAC26DC9EA@IA0PR12MB7699.namprd12.prod.outlook.com>
	<87ecwb3i80.fsf@bootlin.com>
	<IA0PR12MB76996538D556ABC8E9C29624DC65A@IA0PR12MB7699.namprd12.prod.outlook.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 26 May 2025 16:39:00 +0200
Message-ID: <87msazv3ln.fsf@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddujeejkeculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffeghfejtdefieeguddukedujeektdeihfelleeuieeuveehkedvleduheeivdefnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddvpdhrtghpthhtoheprghmihhtrdhkuhhmrghrqdhmrghhrghprghtrhgrsegrmhgurdgtohhmpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohept
 ghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: miquel.raynal@bootlin.com

On 26/05/2025 at 14:27:37 GMT, "Mahapatra, Amit Kumar" <amit.kumar-mahapatr=
a@amd.com> wrote:

> [AMD Official Use Only - AMD Internal Distribution Only]
>
>> > [AMD Official Use Only - AMD Internal Distribution Only]
>> >
>> >> On 13/05/2025 at 14:45:39 GMT, "Mahapatra, Amit Kumar" <amit.kumar-
>> >> mahapatra@amd.com> wrote:
>> >>
>> >> > [AMD Official Use Only - AMD Internal Distribution Only]
>> >> >
>> >> > Hello Miquel,
>> >> >
>> >> >> >> > +           mtd->dev.parent =3D concat->subdev[0]->dev.parent;
>> >> >> >> > +           mtd->dev =3D concat->subdev[0]->dev;
>> >> >> >> > +
>> >> >> >> > +           /* Register the platform device */
>> >> >> >> > +           ret =3D mtd_device_register(mtd, NULL, 0);
>> >> >> >> > +           if (ret)
>> >> >> >> > +                   goto destroy_concat;
>> >> >> >> > +   }
>> >> >> >> > +
>> >> >> >> > +   return 0;
>> >> >> >> > +
>> >> >> >> > +destroy_concat:
>> >> >> >> > +   mtd_concat_destroy(mtd);
>> >> >> >> > +
>> >> >> >> > +   return ret;
>> >> >> >> > +}
>> >> >> >> > +
>> >> >> >> > +late_initcall(mtd_virt_concat_create_join);
>> >> >> >>
>> >> >> >> The current implementation does not support probe deferrals, I
>> >> >> >> believe it should be handled.
>> >> >> >
>> >> >> > I see that the parse_mtd_partitions() API can return
>> >> >> > -EPROBE_DEFER during MTD device registration, but this behavior
>> >> >> > is specific to the parse_qcomsmem_part parser. None of the other
>> >> >> > parsers appear to support probe deferral. As discussed in RFC
>> >> >> > [1], the virtual concat feature is purely a fixed-partition
>> >> >> > capability, and based on my understanding, the fixed-partition p=
arser does
>> not support probe deferral.
>> >> >> > Please let me know if you can think of any other probe deferral
>> >> >> > scenarios that might impact the virtual concat driver.
>> >> >>
>> >> >> That's true, but I kind of dislike the late_initcall, I fear it
>> >> >> might break in creative
>> >> ways.
>> >> >
>> >> > I understand, but since we require the partition information to be
>> >> > available, late_initcall seems to be the most suitable choice among
>> >> > the initcall levels=E2=80=94if we decide to proceed with using an i=
nitcall.
>> >> > Regarding potential failures, as far as I can tell, the operation
>> >> > would fail if, at the time of concatenation, one or more of the MTD
>> >> > devices involved in the concat are not yet available. In such a
>> >> > scenario, we can issue a kernel warning and exit gracefully. But,
>> >> > However, if you prefer to move away from using initcalls and have
>> >> > an alternative implementation approach in mind, please let us know.
>> >>
>> >> I am sorry but this does not work with modules, and we cannot ignore
>> >> this case I believe. More specifically, if a controller probe is
>> >> deferred (with EPROBE_DEFER or just prevented because some
>> >> dependencies are not yet satisfied), you'll get incorrectly defined m=
td devices.
>> >
>> > Ok, an alternative solution could be to remove the initcall
>> > registration and instead invoke mtd_virt_concat_create_join()=E2=80=94=
which
>> > was previously registered as a late_initcall=E2=80=94directly from
>> mtd_device_parse_register().
>> > I believe this approach would address both of your concerns regarding
>> > module support and probe deferral. Additionally, we could consider
>> > moving the entire code from mtd_virt_concat.c into mtdconcat.c.
>> > Please let us know your take on this.
>>
>> What would this bring?
>>
>> Maybe we should trigger some kind of notifier after registering an mtd d=
evice and in
>> there attempt to gather all mtd devices required for the concatenation. =
Can you
>> please propose something like that?
>
> In the current patch, during MTD registration, if a device is
> part of a concatenated (concat) device, it is not registered individually.
> Instead, its information is stored in a concat-specific data structure, as
> it is not meant to be exposed as a standalone MTD device. As per my
> earlier proposal, once all individual MTD devices are registered,
> mtd_virt_concat_create_join() is called from
> mtd_device_parse_register() to scan this data structure and create the
> corresponding concat devices. Just to confirm, are you suggesting that
> mtd_virt_concat_create_join() should be triggered through a notifier
> instead? At the point when all individual MTD devices are registered,
> we already have the complete information required for concatenation.
> So, rather than relying on a listener notification, we cac directly call =
the
> API. Please let me know if I am missing anything here.

This approach does not stand because, afair, it relies on a single
late_initcall() which is too early. We want concatenation to work
regardless of the Kconfig selection =3Dy or =3Dm.

Thanks,
Miqu=C3=A8l
