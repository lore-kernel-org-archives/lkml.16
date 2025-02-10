Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4CA1C5499
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 10:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739182064; cv=none; b=FfO+ut0idRiF4cdjaIA018qY9zZPu981+sZEMRtKnl+igjYPM9IXJudJV8em19cHajkeVedYMIccZzS5SijrqTz4mY5ClO4BpY9cVtTy4tKuh+MW2wPuM7e5r9SP3LPKnww+va6+NY/x6awivM+Vk/29HLbyvEXbRiwwiCjyV5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739182064; c=relaxed/simple;
	bh=SEUiI+mXy8d0n8eWtBeeKW/9zHovMzf7m2rbx9YUAME=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=VOb3KJxMnYhHUcE2KWnvHf6anDus2x2FMEQL7t/zfZ96zxIRgFjRqdyIlmRtpuD/kIsnB3fEUE8TazBm+jyx09AIrEKthC7wjOlwXub2cbZ1Tc2ifrOZWs8f36uhXJU4WBmKIrUm2GT3iiawiXdqPKCtsqodqz0ELxsjUwfZDjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=acVPICqu; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="acVPICqu"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 20F4A43310;
	Mon, 10 Feb 2025 10:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739182055;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mnl3ltpqxpmKsu6ADKCDAYoWAzvYAgs424uvMZsRJgU=;
	b=acVPICqu0TBFFs2SvOxoD9jCnQMn6eBRgOjhWyhfADFr/zZlvXTbKYpzTz/GDzGuf+XKay
	j5EnsAX1lqCax9ADUcCgLOEAGpB3jvdZ2RgFINVD3XwZdr7V40acxkShb5M8aYjJLqz3Tz
	gtonrrdTXokKmGFlMhwagGNT+e0dLdYeyI9OXN5SnAdvht42I1RKbz9giR7/GCw5cGXxJ3
	BXW0TrZEQvn3HSCkUUrrtTs63YIiNycAN1wWxwFXmtIE4kwERyatIz5udhI9W2hCMSMIpo
	vCRRFGUrsq9gRhnH1BdEUJkucXmwHdbT8wmZyzeziLOineNJXl42SgH7fObB/w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Cheng Ming Lin <linchengming884@gmail.com>
Cc: vigneshr@ti.com,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  richard@nod.at,  alvinzhou@mxic.com.tw,
  leoyu@mxic.com.tw,  Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: Re: [PATCH v3 1/2] mtd: spi-nand: Add read retry support
In-Reply-To: <CAAyq3SZF9eGKfLLcC3zFHq85-AEb9B=Grjqfap8QqCUKLdLSVw@mail.gmail.com>
	(Cheng Ming Lin's message of "Mon, 10 Feb 2025 10:46:19 +0800")
References: <20250122065605.285145-1-linchengming884@gmail.com>
	<20250122065605.285145-2-linchengming884@gmail.com>
	<878qqj3sju.fsf@bootlin.com>
	<CAAyq3SZF9eGKfLLcC3zFHq85-AEb9B=Grjqfap8QqCUKLdLSVw@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 10 Feb 2025 11:07:33 +0100
Message-ID: <87frkmt8nu.fsf@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefjeejkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffeghfejtdefieeguddukedujeektdeihfelleeuieeuveehkedvleduheeivdefnecukfhppeelvddrudekgedrleekrdekgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeelvddrudekgedrleekrdekgedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepkedprhgtphhtthhopehlihhntghhvghnghhmihhnghekkeegsehgmhgrihhlrdgtohhmpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrt
 ghpthhtoheprghlvhhinhiihhhouhesmhigihgtrdgtohhmrdhtfidprhgtphhtthhopehlvghohihusehmgihitgdrtghomhdrthifpdhrtghpthhtoheptghhvghnghhmihhnghhlihhnsehmgihitgdrtghomhdrthif
X-GND-Sasl: miquel.raynal@bootlin.com

Hello,

>> > +                             ret =3D spinand->set_read_retry(spinand,=
 retry_mode);
>> > +                             if (ret < 0) {
>> > +                                     ecc_failed =3D true;
>> > +                                     return ret;
>>
>> Shall we try to set the read_retry level to 0 upon:
>>
>>       if (ret < 0 && retry_mode > 1)
>>
>> ?
>
> If we set the read_retry level to 0 upon, and set_read_retry fails
> when retry_mode equals to 1, it won't return an error. This could
> potentially mask an underlying issue.

Don't save the return value in this case? But otherwise you would leave
the chip in a retry state, no?

Thanks,
Miqu=C3=A8l
