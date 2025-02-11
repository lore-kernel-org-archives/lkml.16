Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445701FBEA2
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 10:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739270455; cv=none; b=IdJSxpZylgkJgtlWSIJPdeYO1Eg+3HyzfpzwZzJwcSlFy4gnhOe9toT5tCTt2Zcx/hqWWZSulV+r3JtDoe9LMqPEvEnrC3nPlqmcZub0xAHsUHaf4wa6er7yekX0wTkeLESK2ngvYkA5aFThqtmOIQDTSp5mSJ5jqvEKUiUsXZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739270455; c=relaxed/simple;
	bh=Av81zEnDMXHMG2hpQwL4iz27nQQdi9PfBWim0B0xR8U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=U+mf2Th3Ypd51dAFE4fU5pAOJVdQtqDpScpKq33uzXKL5Q1ZgASDOB8tcFjoAjpZGXgoI+RROKJwuh77FHRa/K8cuxRkZsBYDiTNgh+fQNKyjI3nRd8hBf7Hxbh43NbSZnuO8cr4OG9Shx1ibMsOq4bNvmXYeKVel65VzeFlRjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=GtU/QNNx; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="GtU/QNNx"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8E6E3432BE;
	Tue, 11 Feb 2025 10:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739270450;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sMQ0jzTZxhuaiCez4BJlsuXZfBmNiwzAvhjtjvOeNuI=;
	b=GtU/QNNxzr8HbgdV4Y9TcN/xZNIsZtMulnYTOwBwfXMUSdeYmGAO2XASTY5V4wxx1ZLebE
	uSI4ZTRnMueHos54xnKrFgQKkV9I7JTFVo9iyUGg2m1Rp/I16PoCKefQQUFBTFXiahiYnR
	8G+/oYPHL9LmzlCmJ8juiznZ3E/UEywQ7cZZRz5TVgJ8hnEXjBf/C5xKqccMeU0uh1qaC9
	e1sNfxTT3d0KxSrMrJkmw4E1DKEwzANNpiEx0uxsDbk/LBuo/ik3hMRC2zLfyh2rYCny+C
	HVoMePq2wXW2vCSGnd7/B/NOhYxtuvXTR10gH/2GWDby/wkuDPTDkf3PiSJImA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Cheng Ming Lin <linchengming884@gmail.com>
Cc: vigneshr@ti.com,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  richard@nod.at,  alvinzhou@mxic.com.tw,
  leoyu@mxic.com.tw,  Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: Re: [PATCH v3 1/2] mtd: spi-nand: Add read retry support
In-Reply-To: <CAAyq3Sa9+FZGiGnBV=KbwVnQhWX-vc21CK75OXSnDDsE89mx1Q@mail.gmail.com>
	(Cheng Ming Lin's message of "Tue, 11 Feb 2025 16:13:32 +0800")
References: <20250122065605.285145-1-linchengming884@gmail.com>
	<20250122065605.285145-2-linchengming884@gmail.com>
	<878qqj3sju.fsf@bootlin.com>
	<CAAyq3SZF9eGKfLLcC3zFHq85-AEb9B=Grjqfap8QqCUKLdLSVw@mail.gmail.com>
	<87frkmt8nu.fsf@bootlin.com>
	<CAAyq3Sa9+FZGiGnBV=KbwVnQhWX-vc21CK75OXSnDDsE89mx1Q@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 11 Feb 2025 11:40:49 +0100
Message-ID: <87msessr0u.fsf@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegtdejlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffeghfejtdefieeguddukedujeektdeihfelleeuieeuveehkedvleduheeivdefnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepkedprhgtphhtthhopehlihhntghhvghnghhmihhnghekkeegsehgmhgrihhlrdgtohhmpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtp
 dhrtghpthhtoheprghlvhhinhiihhhouhesmhigihgtrdgtohhmrdhtfidprhgtphhtthhopehlvghohihusehmgihitgdrtghomhdrthifpdhrtghpthhtoheptghhvghnghhmihhnghhlihhnsehmgihitgdrtghomhdrthif
X-GND-Sasl: miquel.raynal@bootlin.com

On 11/02/2025 at 16:13:32 +08, Cheng Ming Lin <linchengming884@gmail.com> w=
rote:

> Hi Miquel,
>
> Miquel Raynal <miquel.raynal@bootlin.com> =E6=96=BC 2025=E5=B9=B42=E6=9C=
=8810=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=886:07=E5=AF=AB=E9=81=93=
=EF=BC=9A
>>
>> Hello,
>>
>> >> > +                             ret =3D spinand->set_read_retry(spina=
nd, retry_mode);
>> >> > +                             if (ret < 0) {
>> >> > +                                     ecc_failed =3D true;
>> >> > +                                     return ret;
>> >>
>> >> Shall we try to set the read_retry level to 0 upon:
>> >>
>> >>       if (ret < 0 && retry_mode > 1)
>> >>
>> >> ?
>> >
>> > If we set the read_retry level to 0 upon, and set_read_retry fails
>> > when retry_mode equals to 1, it won't return an error. This could
>> > potentially mask an underlying issue.
>>
>> Don't save the return value in this case? But otherwise you would leave
>> the chip in a retry state, no?
>
> However, if we set the read_retry level to 0 upon, the chip would still
> remain in the retry state if set_read_retry fails.

Well, if even this fails, you have bigger troubles than read_retry being
enabled.

>
> I come up with a solution: setting the read_retry level to 0 right before
> the read_retry label. This ensures that subsequent reads always start
> from level 0, and it eliminates the need to reset the read_retry level at
> the end.

I don't see the difference with the previous solution. If it fails, it's
exactly the same.

Please do not add a function call to *every* read regardless of the fact
that we enabled read_retry (which I think is what you are suggesting).

Thanks,
Miqu=C3=A8l
