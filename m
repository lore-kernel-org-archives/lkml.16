Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A65E239567
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 17:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738861672; cv=none; b=U6AcPwGr+QVtOBiZQvTN1ltUzKNjJdvFsRYxsbxZY2fkUzw6wua7g5vb9ob3yLXG0MGydXBKu8Peo9iZdrB4vY5x4ecoSpAtUi840kgPBdtyj9yKox9r3Wxdf/fRMey+Bx4MpPhLC6m2tGQXOQ6bscfQUTRsCVEohMwu65CDm6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738861672; c=relaxed/simple;
	bh=NFOu8YkYKMLVSMWOlSerZdbn6qxsZhfGpBaw2vec+SM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=uOo8iJDUBoNkK8BqWQveIQ47/crVys126HVerTN7171U2wpdW+4SVkWi1vvpkkDAgPrYS3V1lRm1P4DKJXFNnqq6qO4ktqFR/8spnKYoRasvlSw1n2C8lOcw4YVFMSzJx8qNmbUJdlUR06NZY5wdtFvICPn8HwtouzD80u6aCw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=V5tfF/Go; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="V5tfF/Go"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6B855442BE;
	Thu,  6 Feb 2025 17:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738861668;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2taOfS6UmQKEI7wuUTCU2ak/Qb2Q0kvynZ5wujlAtSc=;
	b=V5tfF/GoO7XLmaaGdKISt5kKntHgBSJf5ZjHNlComoZFQ4/xN5fjvGf4psMk1mDVcPqDWK
	cl5W5kheP7+tDXNzuot35RvTtVCPKlVW0qBhj000Bm/CLuu8Nxw1dGzgh9b45G0O/Hp/Ch
	e0nWUVWpXcApeNbkQXzcRW2XLn9Ak2Sedn2RbUbgCq5h81YBhbAPs/9Klp6SYl0Qa19GpT
	4YgR78mABE65Jb+cpcIVcZ3ZtSl3C/o/FIml5jbVkjyGYvKDGzKEEddOvOq906QEaona1Y
	r7nMH98CCbMvGxR4HRDKJM8Dg0A7tE3E3EV4L8gKAolYWwMnlyg15Es4BhMqew==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Cheng Ming Lin <linchengming884@gmail.com>
Cc: vigneshr@ti.com,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  richard@nod.at,  alvinzhou@mxic.com.tw,
  leoyu@mxic.com.tw,  Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: Re: [PATCH v3 2/2] mtd: spi-nand: macronix: Add support for read retry
In-Reply-To: <20250122065605.285145-3-linchengming884@gmail.com> (Cheng Ming
	Lin's message of "Wed, 22 Jan 2025 14:56:05 +0800")
References: <20250122065605.285145-1-linchengming884@gmail.com>
	<20250122065605.285145-3-linchengming884@gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Thu, 06 Feb 2025 18:07:46 +0100
Message-ID: <87pljv3st9.fsf@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieelgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffeghfejtdefieeguddukedujeektdeihfelleeuieeuveehkedvleduheeivdefnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepkedprhgtphhtthhopehlihhntghhvghnghhmihhnghekkeegsehgmhgrihhlrdgtohhmpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtp
 dhrtghpthhtoheprghlvhhinhiihhhouhesmhigihgtrdgtohhmrdhtfidprhgtphhtthhopehlvghohihusehmgihitgdrtghomhdrthifpdhrtghpthhtoheptghhvghnghhmihhnghhlihhnsehmgihitgdrtghomhdrthif
X-GND-Sasl: miquel.raynal@bootlin.com

Hello,

On 22/01/2025 at 14:56:05 +08, Cheng Ming Lin <linchengming884@gmail.com> w=
rote:

> @@ -377,7 +424,9 @@ static const struct spinand_info macronix_spinand_tab=
le[] =3D {
>  		     SPINAND_HAS_QE_BIT,
>  		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
>  				     macronix_ecc_get_status),
> -		     SPINAND_CONT_READ(macronix_set_cont_read)),
> +		     SPINAND_CONT_READ(macronix_set_cont_read)

I think there is a missing coma here and everywhere else where there is
continuous read support?

> +		     SPINAND_READ_RETRY(MACRONIX_NUM_READ_RETRY_MODES,
> +					macronix_set_read_retry)),
>  	SPINAND_INFO("MX35UF1GE4AC",
>  		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x92, 0x01),
>  		     NAND_MEMORG(1, 2048, 64, 64, 1024, 20, 1, 1, 1),

Thanks,
Miqu=C3=A8l
