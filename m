Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67891DE3CA
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 10:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748427428; cv=none; b=ZaHB1jO4JWRWhC/HRHzHmbDh3k4lmNcaJ3TxuivbSSiNQH62Fp5hkKTUYTzHhON9dQrhhIiCnCsUT7j5BzTWcpgPmR7DaVmNF1kr5VKKC2Y+KiyAjxQSgiiOaKfSLbBl2TZqX6O5Dj7D1BMbQoA58Rdlln9OBbKk++nM36c/iUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748427428; c=relaxed/simple;
	bh=PbDzw/ZxaObgLMGXVIHx8zHTWK7BUQcYBIeexMNbRXM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=tc2M9FRRNBktsaL18ZldjrQL7IXy/sfdQ2tJhIhZxfTQ0EMWQBAFNnq5MD1ZG/KWZQzUlxqaajyQ9Zt7Ao1TWbbVsJWkKoYv3hB+ldYaZlKpDxu0MGWN3XMaTj07AZRwpSMbY231y+H86Jr7s4QY21BLKql+CcOtvsgWtKVdBPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kode54.net; spf=pass smtp.mailfrom=kode54.net; dkim=pass (2048-bit key) header.d=kode54.net header.i=@kode54.net header.b=bw0yXxjI; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ah4jn+b3; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kode54.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kode54.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kode54.net header.i=@kode54.net header.b="bw0yXxjI";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ah4jn+b3"
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfout.phl.internal (Postfix) with ESMTP id C15DE1380476;
	Wed, 28 May 2025 06:17:05 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Wed, 28 May 2025 06:17:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kode54.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1748427425;
	 x=1748513825; bh=P8auA2USmEdV18y196k++sC84Brou4F8CImPgumm/YE=; b=
	bw0yXxjIdRpX2JiAU1gW3q3m+Pmc4svAkyeqFwWqy0Mu1t9uns8kjClG25fyZt3I
	52yo8PX64Zpq7R9oZcw8QKZOnxIT2k+ly+M6sz9BsMj3kpGPP4wDKZFldxAVB/CH
	4Jl0eNZc+NUvjaij+3FmjpXyQnnLKzKvwo0xmU/AJHgsdvClS9H7KGd4Z/1pNyOP
	ZpGyIDafkQ7mZ9E+/NDJ25ORJFtM2wQyqqG8ejX2TjJm+B1TUHdXHzjYC8j4mXCm
	dUZDrRMh1ixlcvcqrDMib4NWmmJpgi7y0mH4AnRVmeOLTAy/RIBdQmsBVyqDlFmJ
	wSSSussQy94Golyh6eymng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1748427425; x=
	1748513825; bh=P8auA2USmEdV18y196k++sC84Brou4F8CImPgumm/YE=; b=a
	h4jn+b3bDstgtI9YVEt7q/20vVDEvqcTaj+79ZYBC2d4yb7RoD/YV/8mziMFJrEl
	EVuTzuvmOu37+t7pZLSRdRqQF5x8AP2fIscnD6mY9EHAZl339To4+KHMyMUw6DgW
	DTITG8J3yXFO07ohRUNLhVjY2l3iQoSVscZcDJXmFDQteAtSY1qDUcHLI4VTTC75
	AyawPRw7M3qzBbyjl1fvVyPGYNiqJv9aPnc/f5JS7E888V/k6PwNnPrEzRx7Mpn2
	+OLk58z2+1c7LUORHVwhRoejwMd+bSV8ZITa8/GQA+pggYAh5P9Q9/3P67hTSq4o
	wzf1IzTWC7n9bgthCBv2A==
X-ME-Sender: <xms:oeI2aGUjCBb0kfSLU7OWEAKLyYom2FrZd3p8V70NqfQGnK8eo6dEqg>
    <xme:oeI2aCnsVTCZ4zFOH6CKzaRop5uVxPDcoq4SKDJggP-J4Bdnf6GrajPeTTPJDL4zv
    llqsDcNjzfz9cjtTvA>
X-ME-Received: <xmr:oeI2aKa77gH4agOXiVudrjnsFg1B1wqratG2JDhPpr5zln0ZlYXcuxpo5WYOmKcPpYdl62KRtJF0Jt-m1r9rfgEddBR5qQkCuA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvfedttdculddtuddrgeefvddrtd
    dtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggft
    fghnshhusghstghrihgsvgdpuffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftd
    dtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkvefu
    hffvofhfjgesthhqredtredtjeenucfhrhhomhepfdevhhhrihhsthhophhhvghrucfunh
    hofihhihhllhdfuceotghhrhhisheskhhouggvheegrdhnvghtqeenucggtffrrghtthgv
    rhhnpeeileetudejffegjeegfffhhffhkeefjefgtddujeehheevleevjeejffekieekve
    enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegthhhr
    ihhssehkohguvgehgedrnhgvthdpnhgspghrtghpthhtohepudejpdhmohguvgepshhmth
    hpohhuthdprhgtphhtthhopegrrhhnugesrghrnhgusgdruggvpdhrtghpthhtoheprghn
    ughrihihrdhshhgvvhgthhgvnhhkoheslhhinhhugidrihhnthgvlhdrtghomhdprhgtph
    htthhopehluhgtrghsrdguvghmrghrtghhihesihhnthgvlhdrtghomhdprhgtphhtthho
    pegrrhhnugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhhvghllh
    hsthhrohhmsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheprhhoughrihhg
    ohdrvhhivhhisehinhhtvghlrdgtohhmpdhrtghpthhtoheprghirhhlihgvugesghhmrg
    hilhdrtghomhdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthht
    ohepmhgrthhthhgvfidrsghrohhsthesihhnthgvlhdrtghomh
X-ME-Proxy: <xmx:oeI2aNV1KIVFuLFKAGU7Yw5vDO3VbiclarcMsIhpLqKE3qzcqfyyyw>
    <xmx:oeI2aAlOt54hH0akC_bt-N19RitpIX1frmmgBOaK3q52MVnA6UNHqA>
    <xmx:oeI2aCfsWoPmqSl1iRe7uXYdVC4AQFb4AQKrryV2DvBVkb0UmkQNWg>
    <xmx:oeI2aCEoc5ZwzlAGqMLhoUUOhk1J-JoGq586MWHbG0YxERGYY9BDvA>
    <xmx:oeI2aEnBSGh_6jhHSjTF187X_eMD8WMiR0jJi3k6ZlGE-tNowY2soXxp>
Feedback-ID: i9ec6488d:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 May 2025 06:17:04 -0400 (EDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 May 2025 03:17:03 -0700
Message-Id: <DA7PSM1WUKBI.3JA6THJTRF5B7@kode54.net>
Cc: "Arnd Bergmann" <arnd@kernel.org>, =?utf-8?q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, "Rodrigo Vivi"
 <rodrigo.vivi@intel.com>, "Dave Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Matthew Brost" <matthew.brost@intel.com>,
 "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>, "Imre Deak"
 <imre.deak@intel.com>, =?utf-8?q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, "Michael J. Ruhl"
 <michael.j.ruhl@intel.com>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/vsec: fix CONFIG_INTEL_VSEC dependency
From: "Christopher Snowhill" <chris@kode54.net>
To: "Arnd Bergmann" <arnd@arndb.de>, "Andy Shevchenko"
 <andriy.shevchenko@linux.intel.com>, "Lucas De Marchi"
 <lucas.demarchi@intel.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250523121106.2231003-1-arnd@kernel.org>
 <j7yodlrk7wh3ylvb2z622ndlzm4guhahmakdb6l5d6qtv5sabo@w4bfiehtmaab>
 <aDbYs7QZRfr2i80A@smile.fi.intel.com>
 <704fd2b9-04da-4ec8-b854-22bc3ce9058e@app.fastmail.com>
In-Reply-To: <704fd2b9-04da-4ec8-b854-22bc3ce9058e@app.fastmail.com>

On Wed May 28, 2025 at 3:03 AM PDT, Arnd Bergmann wrote:
> On Wed, May 28, 2025, at 11:34, Andy Shevchenko wrote:
>> On Tue, May 27, 2025 at 03:55:46PM -0500, Lucas De Marchi wrote:
>>> On Fri, May 23, 2025 at 02:10:46PM +0200, Arnd Bergmann wrote:
>>
>> ...
>>
>>> > +	depends on INTEL_PLATFORM_DEVICES || !(X86 && ACPI)
>>>=20
>>> 		   ^
>>> Did you mean X86_PLATFORM_DEVICES here?
>
> Yes, my mistake.
>
>> Why do we need to depend on the whole thingy (yes, it will be enabled at=
 the
>> end) if we only talking about Intel?
>
> I don't understand what you mean with 'the whole thing'. My change
> changed the existing 'select X86_PLATFORM_DEVICES if X86 && ACPI'
> into the corresponding dependency, in order to change it the
> least.
>
> The dependency itself is needed because of
>
>        select ACPI_WMI if X86 && ACPI
>
> and this in turn is needed for
>
>        select ACPI_VIDEO if X86 && ACPI
>
>>> With that, Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>>=20
>>> I see several drivers selecting
>>> X86_PLATFORM_DEVICES though. Maybe they should also be translated to
>>> dependencies instead?
>>
>> I think so, selecting that sounds wrong.
>
> Agreed. Overall, what I'd really like to see is to remove
> all those 'select' of drivers from other subsystems. I think
> ACPI_VIDEO is at the center here, and changing all the
> 'select ACPI_VIDEO if ACPI' instances to
> 'depends on ACPI_VIDEO || !ACPI_VIDEO' would solve a lot of

Maybe you meant 'depends on ACPI_VIDEO || !ACPI' ?

> the recurring dependency loop problems in drivers/gpu/.
>
> Actually doing it without regressions is going to be
> nontrivial though, because any change in this area is likely
> to trigger another dependency loop somewhere.
>
>      Arnd

