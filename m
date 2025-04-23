Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8F919ABDE
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 07:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745392669; cv=none; b=AIERc7A3XQZMEj5ElMr3HFmJUedqG1iB8P8VpiR6P+N+L//o2jIKS7E4YN5Aog2sQ5pvwd/KvClnlbrto5uT/RN+RiKfUMrrSMsCXMdgCFSz6YLb1M5RxVejM4+LoKUyOfNUSvO2vq+bOSrKlr5m/uVUezHXdcI56O235oVK/gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745392669; c=relaxed/simple;
	bh=zslbJmOwj/G2+s26AD05QtmzAmPXXglQsAgcql6+rw8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=nzmpDCNEwpmrY2BiKCtp4GcCTuuSPz843CDS/eXdXCpEfzLT/boT4NGGaRVVtiH0Z4ZbhzQEKP4gOz6M0DXVBii9BXoDluyoFeXZNo9PxrHyIsZnPX/aCXpPezQB083T2H9z8GfK+N2+kDo5URwerua4YG2078mwiENW+M0t2hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Zt0ZrwG/; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Zt0ZrwG/"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6D31C4399E;
	Wed, 23 Apr 2025 07:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745392664;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kcc49l+P/H3FfeCDK9jNtCAy/Wuc7OuX4OOHQl1RG28=;
	b=Zt0ZrwG/B2RL983vw/zSRM65rkBTKV3gfAsCPqH18mqqZ4aArlwVwSLQd7gaq6qKZFaqOg
	AC8CWl/5Grxx8Xe0z9ilOdqXl76+ga9knQVgrbrW9rMW/lNNC1ZnYuevPJoEOFVsOkLBrB
	4reNSoj57PpS2w3yUGkaUnnOB3LKuIm1SWLcs4jWiYtuas6ZIedBrBdwrlHhyy7ckzBM49
	RfcbvAqR+9qWQ6Hb4FHoz4pnsVdq6ubscB9Qojql/EUkbZEVlVMwi77wsovWkA0PLWF32c
	8q5Rz+doSj4Be7qLRSQ1qna8lqN5UD8uDZRneL+FpAa0dISt8yFKvf7NtS3Zhg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
  linux-i3c@lists.infradead.org (moderated list:SILVACO I3C DUAL-ROLE
 MASTER),  imx@lists.linux.dev (open list:SILVACO I3C DUAL-ROLE MASTER),
  linux-kernel@vger.kernel.org (open list)
Subject: Re: [PATCH 1/1] i3c: master: svc: skip address resend on repeat START
In-Reply-To: <20250416164751.3437085-1-Frank.Li@nxp.com> (Frank Li's message
	of "Wed, 16 Apr 2025 12:47:50 -0400")
References: <20250416164751.3437085-1-Frank.Li@nxp.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 23 Apr 2025 09:17:43 +0200
Message-ID: <87zfg75otk.fsf@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeehleekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledvrddukeegrddutdekrdehudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeelvddrudekgedruddtkedrhedupdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtohephfhrrghnkhdrnfhisehngihprdgtohhmpdhrtghpthhtoheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehlihhnuhigqdhifegtsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepihhmgieslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrr
 dhkvghrnhgvlhdrohhrgh
X-GND-Sasl: miquel.raynal@bootlin.com

On 16/04/2025 at 12:47:50 -04, Frank Li <Frank.Li@nxp.com> wrote:

> According to the I3C specification, address arbitration only happens duri=
ng
> the START. Repeated START do not initiate arbitration, and In-Band
> Interrupts (IBIs) cannot occur at this stage.
>
> Resending the address upon a NACK in a repeat START is therefore redundant
> and unnecessary. Avoid redundant retries, improving efficiency and ensuri=
ng
> protocol compliance.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/i3c/master/svc-i3c-master.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc=
-i3c-master.c
> index 85e16de208d3b..5212c2cc6855f 100644
> --- a/drivers/i3c/master/svc-i3c-master.c
> +++ b/drivers/i3c/master/svc-i3c-master.c
> @@ -1281,9 +1281,9 @@ static int svc_i3c_master_write(struct svc_i3c_mast=
er *master,
>  static int svc_i3c_master_xfer(struct svc_i3c_master *master,
>  			       bool rnw, unsigned int xfer_type, u8 addr,
>  			       u8 *in, const u8 *out, unsigned int xfer_len,
> -			       unsigned int *actual_len, bool continued)
> +			       unsigned int *actual_len, bool continued, bool repeat_start)
>  {
> -	int retry =3D 2;
> +	int retry =3D repeat_start ? 1 : 2;
>  	u32 reg;
>  	int ret;
>=20=20
> @@ -1468,7 +1468,7 @@ static void svc_i3c_master_start_xfer_locked(struct=
 svc_i3c_master *master)
>  		ret =3D svc_i3c_master_xfer(master, cmd->rnw, xfer->type,
>  					  cmd->addr, cmd->in, cmd->out,
>  					  cmd->len, &cmd->actual_len,
> -					  cmd->continued);
> +					  cmd->continued, !!i);

Could we just pass 'i' here? Or maybe 'i > 0' which might be even clearer.

>  		/* cmd->xfer is NULL if I2C or CCC transfer */
>  		if (cmd->xfer)
>  			cmd->xfer->actual_len =3D cmd->actual_len;

Thanks,
Miqu=C3=A8l
