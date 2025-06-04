Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E43A28B7F1;
	Wed,  4 Jun 2025 08:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749025322; cv=none; b=FmaKhV9Jt7w/LvYLwxFhgagITmpCoMc/xYLvKIDx5LFDiiEuwC6ZQnhaMDlG6ofADv/2xF5HJdmUWp5d3wk5H14SRhgCL3rns5Jt9TZdKZsLg7NiZoZJPrNUWOXIM0zyNMNhLe1rsYmPdIFrAr94kUZZ62emCSQZ8R2ErfqCh1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749025322; c=relaxed/simple;
	bh=2MbOYAGfsJiwHmN9D7mlKgKUXPWhJh2aDzHwQlwXU+0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=kVkx/BNtnXA+yKW4ZytLhzchifTjrLwmihtzpXEWilv8qgj5mrtaWRgCaLW0yz5DClapQsEUSJDQU5Y0oLqcdRANimxYLx38WD8lxXFnG7feW65YcoyuBqxCdCdr9n90K6qUcwoL+1KvTJ8juWM7E5b/lSPQOTo5ET4QsDdkWxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=RJ8zO+l8; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="RJ8zO+l8"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 132B741DF4;
	Wed,  4 Jun 2025 08:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749025312;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ARK4ijAucPeE4qCV1xVX4pQHEcXz2x/7N4iFgPfnZ0M=;
	b=RJ8zO+l82jyuNiy2HFZ7/KyFcElAhMahVKs7JPWxjfv0P8EoptkLA+RBG7PwDYmBxNJJ3t
	mCUQ4x6/k1fI9mrIh9b+pujdCMlqpvSbNL06qzvDw7Q92ISgbKWIbK0HtLFCs29SrWMWHH
	duJPQWtQZ5FsY92KUbQ7UIF5IddFhxCLF7J++jLIuHezzZ+LBZH/1/zUSBY/9WtgtijB2x
	lkXR0HW4wUxOQrVSuXBaKSX4bIC1Oa8RrfZln5NG738CMANzzrxbfKt9FWUGaDaoebFLy4
	58M90GxOxQGNNsDiPzt/YkqetPwlbvQwRcsfVX6guYPnXl7LqFeEsYF6to8kkA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: <richard@nod.at>,  <vigneshr@ti.com>,  <robh@kernel.org>,
  <krzk+dt@kernel.org>,  <conor+dt@kernel.org>,
  <linux-mtd@lists.infradead.org>,  <devicetree@vger.kernel.org>,
  <linux-kernel@vger.kernel.org>,  <git@amd.com>,
  <amitrkcian2002@gmail.com>,  Bernhard Frauendienst
 <kernel@nospam.obeliks.de>
Subject: Re: [PATCH v13 3/3] mtd: Add driver for concatenating devices
In-Reply-To: <20250603194209.1341374-4-amit.kumar-mahapatra@amd.com> (Amit
	Kumar Mahapatra's message of "Wed, 4 Jun 2025 01:12:09 +0530")
References: <20250603194209.1341374-1-amit.kumar-mahapatra@amd.com>
	<20250603194209.1341374-4-amit.kumar-mahapatra@amd.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 04 Jun 2025 10:21:50 +0200
Message-ID: <87sekfkjc1.fsf@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddukedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepvdduvddruddthedrudehtddrvdehvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvuddvrddutdehrdduhedtrddvhedvpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduvddprhgtphhtthhopegrmhhithdrkhhumhgrrhdqmhgrhhgrphgrthhrrgesrghmugdrtghomhdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodguthesk
 hgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: miquel.raynal@bootlin.com

Hi Amit,

> --- a/include/linux/mtd/concat.h
> +++ b/include/linux/mtd/concat.h
> @@ -28,5 +28,37 @@ struct mtd_info *mtd_concat_create(
>=20=20
>  void mtd_concat_destroy(struct mtd_info *mtd);
>=20=20
> +/**
> + * mtd_virt_concat_node_create - Create a component for concatenation
> + *
> + * Returns a positive number representing the no. of devices found for
> + * concatenation, or a negative error code.
> + *
> + * List all the devices for concatenations found in DT and create a
> + * component for concatenation.
> + */
> +int mtd_virt_concat_node_create(void);
> +
> +/**
> + * mtd_virt_concat_add - add mtd_info object to the list of subdevices f=
or concatenation
> + * @mtd: pointer to new MTD device info structure
> + *
> + * Returns true if the mtd_info object is added successfully else return=
s false.
> + *
> + * The mtd_info object is added to the list of subdevices for concatenat=
ion.
> + * It returns true if a match is found, and false if all subdevices have
> + * already been added or if the mtd_info object does not match any of the
> + * intended MTD devices.
> + */
> +bool mtd_virt_concat_add(struct mtd_info *mtd);
> +
> +/**
> + * mtd_virt_concat_create_join - Create and register the concatenated MT=
D device
> + *
> + * Returns on succes, or a negative error code.
> + *
> + * Creates and registers the concatenated MTD device
> + */
> +int mtd_virt_concat_create_join(void);
>  #endif

Don't we miss some destructors? It seems that removing the mtd device or
the concat module might lead to an unstable state. Can you please test
these two situations?

Thanks,
Miqu=C3=A8l
