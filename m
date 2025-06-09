Received: from lithops.sigma-star.at (mailout.nod.at [116.203.167.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 140F5222589
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 21:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.167.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749504443; cv=none; b=KcA5vEHYaJQahPTfmYSpnTazFiZWjgpJb20AASb3kcNKenngQ4wyAUfUy9Bgml/9jfAkBXJVdvILdozFFoMjkTRepLyC5rVcoubv8+hYEMd5L0Qg44d84cvR/ZC/zYIxaSz3/nqWcXEr0TN+pZKabo/0CN6ax+qElgv/c2oZj28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749504443; c=relaxed/simple;
	bh=mzj9yWf3aYsh17alXlGhCQ70cTY5fc2SzSkPsbjcQmI=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=buebWLlrQ5KvEWkN4AoooSlL9xzfX7mvy4o8V8mvKDufhfHG6vrjLEdAC08Lnu0V260/bLs+ZqUg7xWLTRjeZh4QWyzo4a3+/P6JvQv+UEXsdvLb6pnFdFjl7B1hDh26o88Ax1+wSXlS6gLAYFeHJXdVzdUyFsQze6MelV8RyF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at; spf=fail smtp.mailfrom=nod.at; arc=none smtp.client-ip=116.203.167.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nod.at
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 9BB70298562;
	Mon,  9 Jun 2025 23:27:11 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id ET2xpdSYUI12; Mon,  9 Jun 2025 23:27:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 32565298566;
	Mon,  9 Jun 2025 23:27:10 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id VSRsIT4TuOoV; Mon,  9 Jun 2025 23:27:10 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id E3468298562;
	Mon,  9 Jun 2025 23:27:09 +0200 (CEST)
Date: Mon, 9 Jun 2025 23:27:09 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Guenter Roeck <linux@roeck-us.net>, 
	Alexander Usyskin <alexander.usyskin@intel.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	Lucas De Marchi <lucas.demarchi@intel.com>, 
	Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, 
	Karthik Poosa <karthik.poosa@intel.com>, 
	Reuven Abliyev <reuven.abliyev@intel.com>, 
	Oren Weil <oren.jer.weil@intel.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	DRI mailing list <dri-devel@lists.freedesktop.org>, 
	intel-gfx <intel-gfx@lists.freedesktop.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <1176847729.134356549.1749504429656.JavaMail.zimbra@nod.at>
In-Reply-To: <2e5ebbdd-2a57-4f1f-85c6-7c2dff127b50@roeck-us.net>
References: <20250302140921.504304-1-alexander.usyskin@intel.com> <87bjqyja7o.fsf@bootlin.com> <2f3d3ff9-e483-42cc-aaed-f376d46a6701@roeck-us.net> <87ikl5xnbc.fsf@bootlin.com> <CY5PR11MB63660CFA966BCA1B44528BB1ED6BA@CY5PR11MB6366.namprd11.prod.outlook.com> <4d55ac06-c357-4d78-b8b8-5b26486ce529@roeck-us.net> <CY5PR11MB63662D21B2C7B1A1C2E6BC4BED6BA@CY5PR11MB6366.namprd11.prod.outlook.com> <2e5ebbdd-2a57-4f1f-85c6-7c2dff127b50@roeck-us.net>
Subject: Re: [PATCH v6 01/11] mtd: core: always create master device
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF139 (Linux)/8.8.12_GA_3809)
Thread-Topic: core: always create master device
Thread-Index: THmojBJHtC1GOaAOJStu5UV1FSAWmA==

----- Urspr=C3=BCngliche Mail -----
> Von: "Guenter Roeck" <linux@roeck-us.net>
>>> I am trying to boot from "pnor". It looks like the partition data (from
>>> devicetree)
>>> is now ignored. mtdblock6 used to be the second flash.
>>>
>>> Guenter
>>=20
>> Is this with CONFIG_MTD_PARTITIONED_MASTER?
>>=20
>=20
> Yes
>=20
>> I think that mtd_is_partition is ambiguous now.
>> We always have master partition when CONFIG_MTD_PARTITIONED_MASTER
>> is enabled and parent check is useless.
>> We must check grandparent in this case.
>> Miquel, am I right?
>>=20
>> We can return to older patch version that have created partition
>> instead of the master device.
>> Or try to fix mtd_is_partition, like below.
>> Guenter, is below patch helps?
>>=20
> No, it does not make a difference. Partitions are still not created.

Looks like all partition parsing is broken when CONFIG_MTD_PARTITIONED_MAST=
ER=3Dy is set.
Alexander, I was able to reproduce with MTDRAM and the mtdparts=3D kernel p=
arameter.
Build with CONFIG_MTD_MTDRAM=3Dy and CONFIG_MTD_PARTITIONED_MASTER=3Dy,
pass mtdparts=3D\"mtdram test device:256k(foo)ro,-(bar)\" to the kernel com=
mand line.

Before your change:
$ cat /proc/mtd=20
dev:    size   erasesize  name
mtd0: 00400000 00020000 "mtdram test device"
mtd1: 00040000 00020000 "foo"
mtd2: 003c0000 00020000 "bar"

After:
$ cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00400000 00020000 "mtdram test device"

Hope this helps!

Thanks,
//richard
