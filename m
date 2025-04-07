Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6ED35968
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 08:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744012823; cv=none; b=NB2/b7tmE81UMJBP8raACOy+3OMtLzjBIz8oyFzzREbw4SiPhSaHdcA0xgDeyoJMH7fowktYsr8bfRqtOtHF0sCC+VSyfnIaKKFCvqZCllLL/XL+Xks9G9SBzfE1VFT9DPu5OPn0Lr+fD6Cm6ZAtu9itXZ2HLz7jmGAlPu1rJPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744012823; c=relaxed/simple;
	bh=3MSWCyW5uI5Z9ZGyZVx2/95ay1GhUkLkvBEaHMuEqJU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Hn+jRktH28uO/FZyFhebWiMz4QBjRfjtf+kb0EYrjQIeEdPxoDk/JB8qZ4ELGeNwFSygh23sZYdAPJ3woHwnaxzKE3WNWNcZFtqOZQaCLjbQPaxAUp+xQza9VKVeeqd+9v4OrdYKmxPdgleJDDs1CZheD6AXANJpBGbuM7igy6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=eVFwLXdX; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="eVFwLXdX"
Received: by mail.gandi.net (Postfix) with ESMTPSA id E61B244371;
	Mon,  7 Apr 2025 08:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744012818;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3MSWCyW5uI5Z9ZGyZVx2/95ay1GhUkLkvBEaHMuEqJU=;
	b=eVFwLXdXTJXwPIFhA7cVn/m2T20j4rpfa2ue6EFts15Kbbhw7S/fhPvB8CeQGjHsQo5M89
	W8FnhtVKz+GkrA4Xa30uH7+aI//BmWK+BVBbp//WK+VewDCqMls9z7xyNINscH9fU4h3bU
	kYCkdaMYFA1F5+B8HOsuDHRmVRybyP9Flzjjpdto5D7WhK2wF5mN11a7CeFoSSaFpKaq7i
	COjlGUHB9QEKMXbaN4bX9Ue8pw/1w6FRlJEay8s8g+BjxxNu6uzY3l6RvAtOqKty/n7HAW
	YNpMdm2HQhj+FjQzqPNPHA+qG4uDtnnYzzxvUhKHyfc/tsHL3EevLvKlm879dg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Md Sadre Alam <quic_mdalam@quicinc.com>,  Mark Brown
 <broonie@kernel.org>,  Varadarajan Narayanan <quic_varada@quicinc.com>,
  Sricharan Ramabadhran <quic_srichara@quicinc.com>,  Arnd Bergmann
 <arnd@arndb.de>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] spi: spi-qpic: fix common module build
In-Reply-To: <20250407072745.186831-1-arnd@kernel.org> (Arnd Bergmann's
	message of "Mon, 7 Apr 2025 09:27:14 +0200")
References: <20250407072745.186831-1-arnd@kernel.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 07 Apr 2025 10:00:16 +0200
Message-ID: <875xjgflkf.fsf@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduleelieegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeejgeeftdefledvieegvdejlefgleegjefhgfeuleevgfdtjeehudffhedvheegueenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeelvddrudekgedruddtkedrfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeelvddrudekgedruddtkedrfedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtoheprghrnhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtohepqhhuihgtpghmuggrlhgrmhesqhhuihgtihhntgdrtghomhdprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdrohhrghdprhgtphhtthhop
 ehquhhitggpvhgrrhgruggrsehquhhitghinhgtrdgtohhmpdhrtghpthhtohepqhhuihgtpghsrhhitghhrghrrgesqhhuihgtihhntgdrtghomhdprhgtphhtthhopegrrhhnugesrghrnhgusgdruggv
X-GND-Sasl: miquel.raynal@bootlin.com

Hi Arnd,

On 07/04/2025 at 09:27:14 +02, Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> When the NAND driver is a loadable module, and the SPI driver is
> turned off, the common part is not built:
>
> ERROR: modpost: "qcom_nandc_unalloc" [drivers/spi/spi-qpic-snand.ko] unde=
fined!
> ERROR: modpost: "qcom_write_reg_dma" [drivers/spi/spi-qpic-snand.ko] unde=
fined!
> ERROR: modpost: "qcom_read_reg_dma" [drivers/spi/spi-qpic-snand.ko] undef=
ined!
> ERROR: modpost: "qcom_nandc_dev_to_mem" [drivers/spi/spi-qpic-snand.ko] u=
ndefined!
> ERROR: modpost: "qcom_nandc_alloc" [drivers/spi/spi-qpic-snand.ko] undefi=
ned!
> ERROR: modpost: "qcom_submit_descs" [drivers/spi/spi-qpic-snand.ko] undef=
ined!
> ERROR: modpost: "qcom_clear_read_regs" [drivers/spi/spi-qpic-snand.ko] un=
defined!
> ERROR: modpost: "qcom_clear_bam_transaction" [drivers/spi/spi-qpic-snand.=
ko] undefined!
> ERROR: modpost: "qcom_read_data_dma" [drivers/spi/spi-qpic-snand.ko] unde=
fined!
> ERROR: modpost: "qcom_write_data_dma" [drivers/spi/spi-qpic-snand.ko] und=
efined!
>
> Simplify the Makefile to just build the common bits for either of the two,
> so it will be built-in whenever one of them is, or otherwise a loadable
> module if needed.
>
> Fixes: 7304d1909080 ("spi: spi-qpic: add driver for QCOM SPI NAND flash I=
nterface")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks for the fix, I just applied Geert's identical patch this morning,
I was waiting for -rc1 to synchronize everything again:
https://lore.kernel.org/linux-mtd/174401012746.998658.11206994348683987630.=
b4-ty@bootlin.com/T/#t

Sorry for the delay.

Thanks,
Miqu=C3=A8l
