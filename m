Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638D21F4C9D;
	Fri,  9 May 2025 09:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746782160; cv=none; b=E4D7v4nbVAq5ZWAG/UkCWY6XHK+tK1Pf82Vnn4YJ4NBDHAJDACBgahtzQ67VHkC3SS0YWeiRAjPsmBXMWwnn+ESW7QXFPO427SnkMvfMAs33oy7q2CYUS3XVWgKr9p6igNgqJwQqgckky9QkvEIvm8gbGqE4kDGhjGnXlngvCd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746782160; c=relaxed/simple;
	bh=aPdJ0egps+Pd3GyaV5txJ6SoXup6IGGorXKAqGmMelQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F0q3Yd5vKcNZvwiYNvV5m8AhzWZMXjB6fGTWHR8wMBwc8jr5lFERrlZP97SGC3DTxhjwB68/SSWxrO7f7MicbBp1hrcBAuyS5L+Py1Fpci50FtFF0Q1QSc3Rk0FGViS1V0oVsm38pcHFYuWeq84y85/Dtf1PziCdATUUTHrlc9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=A49+jEYE; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="A49+jEYE"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 07CAE1FD43;
	Fri,  9 May 2025 09:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746782155;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uOMW9BGxskbhad6mlU+Himy6oHmyXjwahxXAzW3WdCk=;
	b=A49+jEYE7WBREA5b6YXFMHfgJgHIHEfZyMK/RNX+suNhPAOLzF5+ZiOY9VjEJNSMYeaD2Y
	MrnyIbfXfo5AU1P/osyUWAzpu3oBNbTlJjbZ/T4DNgoboLXfJnwYLb94aKzyQcE92u7PwO
	MxY7uBU7wLo9mKHJ7ykciVIv9HjzTHlMpHoPSOS+J61W/2Bng8ecZy4/tEJavqMtWveEFm
	pVhdjm1YJzBBVR7R2MpYwhF4mh+Vp7E7Yn9maafTTpzVxqA7CFWvg6+45chPVUEGbF0rfK
	ATf0366ofRqxq3v87RGphfqb8PJX9dkrxtXdpD7U2pbjx/3P5Kp0+w4cAJqQUA==
Date: Fri, 9 May 2025 11:15:54 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, Shengjiu Wang
 <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam
 <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 1/2] soc: fsl: qmc: Only set completion interrupt when
 needed
Message-ID: <20250509111554.770263b7@bootlin.com>
In-Reply-To: <19aa9d8a84c8475c62c42ac886dad0980428c6c0.1746776731.git.christophe.leroy@csgroup.eu>
References: <19aa9d8a84c8475c62c42ac886dad0980428c6c0.1746776731.git.christophe.leroy@csgroup.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvledvvdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtkeertdertdejnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepjefflefhieduteegffeifeeggfffvdeuvdeutddvfeduudeukeffleehheffkeetnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedugedprhgtphhtthhopegthhhrihhsthhophhhvgdrlhgvrhhohiestghsghhrohhuphdrvghupdhrtghpthhtohepqhhirghnghdriihhrghosehngihprdgtohhmpdhrtghpthhtohepshhhvghnghhjihhurdifrghnghesghhmrghilhdrtghomhdprhgtphhtthhopegiihhusghordfnvggvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepfhgvshhtv
 ghvrghmsehgmhgrihhlrdgtohhmpdhrtghpthhtohepnhhitgholhgvohhtshhukhgrsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhgihhrugifohhougesghhmrghilhdrtghomhdprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: herve.codina@bootlin.com

Hi Christophe,

On Fri,  9 May 2025 09:48:44 +0200
Christophe Leroy <christophe.leroy@csgroup.eu> wrote:

> When no post-completion processing is expected, don't waste time
> handling useless interrupts.
> 
> Only set QMC_BD_[R/T]X_I and QMC_BD_[R/T]X_UB when a completion
> function is passed in.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  drivers/soc/fsl/qe/qmc.c | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
> index 36c0ccc06151..0a704fd0b1a0 100644
> --- a/drivers/soc/fsl/qe/qmc.c
> +++ b/drivers/soc/fsl/qe/qmc.c
> @@ -474,7 +474,9 @@ int qmc_chan_write_submit(struct qmc_chan *chan, dma_addr_t addr, size_t length,
>  	xfer_desc->context = context;
>  
>  	/* Activate the descriptor */
> -	ctrl |= (QMC_BD_TX_R | QMC_BD_TX_UB);
> +	ctrl |= QMC_BD_TX_R;
> +	if (complete)
> +		ctrl |= QMC_BD_TX_I | QMC_BD_TX_UB;

Be careful, you don't set the UB bit for all descriptor anymore.
Your goal, is to have interrupts only on some descriptors (those where I
bit is set).

This can lead to issue in the function handling the interrupt.
This function, qmc_chan_write_done(), do the processing according to the
following:
        /*
	 * R bit  UB bit
	 *   0       0  : The BD is free
	 *   1       1  : The BD is in used, waiting for transfer
	 *   0       1  : The BD is in used, waiting for completion
	 *   1       0  : Should not append
	 */
https://elixir.bootlin.com/linux/v6.15-rc5/source/drivers/soc/fsl/qe/qmc.c#L507

It considers R=0 / UB=0 as a free BD and R=1 / UB=0 as a case that should
not happen.

Both cases are no more correct with your modification.

Have the feeling that UB bit still has to be set even if I bit is not set
in order to have qmc_chan_write_done() looking at all descriptors.

Suppose:
 desc 0, no interrupt
 desc 1, no interrupt
 desc 2, interrupt

When the interrupt for desc 2 is handled, desc 0 and desc 1 are seen with
R=0 and UB=0. As desc 0 is considered as free by qmc_chan_write_done(), it
will never look at desc 2.

>  	wmb(); /* Be sure to flush the descriptor before control update */
>  	qmc_write16(&bd->cbd_sc, ctrl);
>  
> @@ -586,7 +588,9 @@ int qmc_chan_read_submit(struct qmc_chan *chan, dma_addr_t addr, size_t length,
>  		  QMC_BD_RX_AB | QMC_BD_RX_CR);
>  
>  	/* Activate the descriptor */
> -	ctrl |= (QMC_BD_RX_E | QMC_BD_RX_UB);
> +	ctrl |= QMC_BD_RX_E;
> +	if (complete)
> +		ctrl |= QMC_BD_RX_I | QMC_BD_RX_UB;

Exact same comment.


Best regards,
Hervé
