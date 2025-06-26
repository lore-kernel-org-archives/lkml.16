Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35FD710E0;
	Thu, 26 Jun 2025 11:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750938314; cv=none; b=Q9YYm9LTsZ2MuFAe0zEaYqMzmuL4Kiq9iTdNbm/zWV7eukOsTdcnWUqQHyt7gloaQlez5GIg2AqpwsAndPb1CWerhpvfvwZc4RBHZtd7E0egl5OT8b2NCTeoA2/RHQvGtHDD3Xg+iAvV5zH6GzDQxpq268la65fjRWvCTTwkNx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750938314; c=relaxed/simple;
	bh=M7XJD38qB59jel+yIqSbGCJJ7ePmHD9eVBvhRl2QTqg=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=lB0Mytk8EEILHUpyKxcOd0Xdc2nnX7vq5WivwyFnA0UlCwSNFXKz2Ef4xKkbugVmH/vj0jg6+Ri3NmD8Ew7RBFdo26YhdY2w7TESHPetuW+uHWZTQ1xC/JNHGu1Z+idsPXLexaAjVSom9/uXrSp8Wwpb5X7L6Bw90xH9rchPJMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=arunraghavan.net; spf=pass smtp.mailfrom=arunraghavan.net; dkim=pass (2048-bit key) header.d=arunraghavan.net header.i=@arunraghavan.net header.b=OMEnUxzX; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=hXNPh2Fa; arc=none smtp.client-ip=202.12.124.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=arunraghavan.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arunraghavan.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arunraghavan.net header.i=@arunraghavan.net header.b="OMEnUxzX";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="hXNPh2Fa"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id EC90C1D002A1;
	Thu, 26 Jun 2025 07:45:10 -0400 (EDT)
Received: from phl-imap-04 ([10.202.2.82])
  by phl-compute-05.internal (MEProxy); Thu, 26 Jun 2025 07:45:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	arunraghavan.net; h=cc:cc:content-transfer-encoding:content-type
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to; s=fm1; t=1750938310; x=1751024710; bh=VByTp1irzef3jI32T68vA
	hXexOmhT8VtQE5X+ojFIqE=; b=OMEnUxzX1G/tJSWD8QXlUXGR3DmA7Q0YMHXnr
	cTY+XtgLtH6s9u729hyPRT0wLhHoOwMs05l3wO3tLUrtAxfPU7i+W8uf99apWVrW
	8pLH63Tn+fZImM8Gu+0QwldT+S00iMyTFVlKcrg4FqKWlQFnBqmI7JrnzKESy6sk
	c/Jlzg7t7a8q/wcAlAG/83YHvRnQwCMLiFVPLBWc5lCtK8rljYH/wkK6jk39NMoL
	eM/0iqC2E5ItzOm1S6zs+eSSXbJeix2ZblnFfn4rJ9Cf5mN9sg4vqWFGr9oujnQD
	NWGyTs+W7clHzYrS6knlOSZOEiUV7QYxKdYybN8IjL+Be71PQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1750938310; x=
	1751024710; bh=VByTp1irzef3jI32T68vAhXexOmhT8VtQE5X+ojFIqE=; b=h
	XNPh2Fab3iNJrp+pLerySAXh4l7hgl48Vo/hNCB6qkPE3mg2SWeQF8C+gJIx+ysu
	k1S3Nd9bJuJ/zkcw0txXDZdi/gQhIJO3Sy8sjHAwGqJMBBwGyaItfGnbtWHvIe5D
	twYqCjgvp09yWRYR3lu8lblI0E0iTxTy15zcx9YHdE8cZ381XwsIKgUxNv1ghTqU
	J3SXfcZbgtHjnbjklGO0yn6Be4yML+MdahzE52KsXb6vn5CQKsQsCQi0BW1p2F8l
	EyBXzhL48j1yy806jkDQlCKZPjD1sC7/QeRjPmsDYeTv65mWeWCy7SaeyBcGJKQG
	CcXmFTc50hzSSZQVovgoQ==
X-ME-Sender: <xms:xjJdaGTt2pxDjy23LtxD9qgQs9_bJQwhI4hfWHzgTw0DA7A0dfGGUg>
    <xme:xjJdaLwHpVLWDepK9kfwAWlTm8kYPNimBXALgMushnIUP2aO-KIk7a_hN_NNXe1XE
    zh3y2vjrjAaKIdFog>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddtlecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegrihhl
    ohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpe
    foggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdetrhhunhcutfgr
    ghhhrghvrghnfdcuoegrrhhunhesrghruhhnrhgrghhhrghvrghnrdhnvghtqeenucggtf
    frrghtthgvrhhnpeevkeehvdetudfhlefhkeffvdeihfegffdvffdtheekvefhuddugfei
    gedtiefgleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpegrrhhunhesrghruhhnrhgrghhhrghvrghnrdhnvghtpdhnsggprhgtphhtthhopedu
    fedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghruhhnsegrshihmhhpthhoth
    hitgdrihhopdhrtghpthhtohepgihiuhgsohdrlhgvvgesghhmrghilhdrtghomhdprhgt
    phhtthhopehfvghsthgvvhgrmhesghhmrghilhdrtghomhdprhgtphhtthhopehlghhirh
    gufihoohgusehgmhgrihhlrdgtohhmpdhrtghpthhtohepnhhitgholhgvohhtshhukhgr
    sehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhhvghnghhjihhurdifrghnghesghhmrg
    hilhdrtghomhdprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehlihhnuhigphhptgdquggvvheslhhishhtshdrohiilhgrsghsrdhorhhgpd
    hrtghpthhtohepphgvrhgvgiesphgvrhgvgidrtgii
X-ME-Proxy: <xmx:xjJdaD2L55Uwspt-3d0NxdQX12EvRJxls5ZMAF7Fhvb-1n9DtsuEiw>
    <xmx:xjJdaCCDzmHUpyz5JJPAiunxsMAMVIx-Rr3S-ONjfJXB-SwQO1AjOQ>
    <xmx:xjJdaPhYgAy0W9rHeF-xXJBJpvZK9RwQsIbDSVPQ20FJdydhfK-wyg>
    <xmx:xjJdaOpNGzj4X2j9eyE3hiC9skuFrsOHGeQ3izgkcKkVkWNfr2cbgQ>
    <xmx:xjJdaNwhQ0oi2tDExWOrdMeHF87XOyC4wMYYoD6gB9BPQmNGnBpOAqON>
Feedback-ID: i42c0435e:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 362A3B6006B; Thu, 26 Jun 2025 07:45:10 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Tbce6b10f0faf42d7
Date: Thu, 26 Jun 2025 07:44:48 -0400
From: "Arun Raghavan" <arun@arunraghavan.net>
To: "Shengjiu Wang" <shengjiu.wang@gmail.com>
Cc: "Xiubo Li" <Xiubo.Lee@gmail.com>, "Fabio Estevam" <festevam@gmail.com>,
 "Nicolin Chen" <nicoleotsuka@gmail.com>,
 "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>,
 "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>,
 "Pieterjan Camerlynck" <p.camerlynck@televic.com>,
 linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, "Arun Raghavan" <arun@asymptotic.io>
Message-Id: <a189942a-39e8-4241-9301-844fb39a0f14@app.fastmail.com>
In-Reply-To: 
 <CAA+D8AN=K_ERUtc+mOW9Lm_B4wZT_qS5xg6RA2fDwrm9MTaCbw@mail.gmail.com>
References: <20250625130648.201331-1-arun@arunraghavan.net>
 <20250625235757.68058-3-arun@arunraghavan.net>
 <CAA+D8AN=K_ERUtc+mOW9Lm_B4wZT_qS5xg6RA2fDwrm9MTaCbw@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: fsl_sai: Force a software reset when starting in consumer
 mode
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, 26 Jun 2025, at 2:55 AM, Shengjiu Wang wrote:
> On Thu, Jun 26, 2025 at 7:58=E2=80=AFAM Arun Raghavan <arun@arunraghav=
an.net> wrote:
>>
>> From: Arun Raghavan <arun@asymptotic.io>
>>
>> In a setup with an external clock provider, when running the receiver
>> (arecord) and triggering an xrun with xrun_injection, we see a channel
>> swap/offset. This happens sometimes when running only the receiver, b=
ut
>> occurs reliably if a transmitter (aplay) is also concurrently running.
>>
>> The theory is that SAI seems to lose track of frame sync during the
>> trigger stop -> trigger start cycle that occurs during an xrun. Doing
>> just a FIFO reset in this case does not suffice, and only a software
>> reset seems to get it back on track.
>>
>> Signed-off-by: Arun Raghavan <arun@asymptotic.io>
>> Reported-by: Pieterjan Camerlynck <p.camerlynck@televic.com>
>> ---
>>
>> v2:
>> - Address build warning from kernel test robot
>>
>>  sound/soc/fsl/fsl_sai.c | 12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>>
>> diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
>> index af1a168d35e3..d158352c7640 100644
>> --- a/sound/soc/fsl/fsl_sai.c
>> +++ b/sound/soc/fsl/fsl_sai.c
>> @@ -841,6 +841,18 @@ static int fsl_sai_trigger(struct snd_pcm_substr=
eam *substream, int cmd,
>>         case SNDRV_PCM_TRIGGER_START:
>>         case SNDRV_PCM_TRIGGER_RESUME:
>>         case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
>> +               /*
>> +                * Force a software reset if we are not the clock pro=
vider, as we
>> +                * might have lost frame sync during xrun recovery.
>> +                */
>> +               if (sai->is_consumer_mode[tx]) {
>> +                       regmap_update_bits(sai->regmap,
>> +                                       FSL_SAI_xCSR(tx, ofs), FSL_SA=
I_CSR_SR,
>> +                                       FSL_SAI_CSR_SR);
>> +                       regmap_update_bits(sai->regmap,
>> +                                       FSL_SAI_xCSR(tx, ofs), FSL_SA=
I_CSR_SR,
>> +                                       0);
>> +               }
>
> Which platform are you using?  and please add chip info in your commit
> message.

It's an imx8mm. I'll add that to the commit message.

> This change can be moved to fsl_sai_config_disable(). that is:
>
> --- a/sound/soc/fsl/fsl_sai.c
> +++ b/sound/soc/fsl/fsl_sai.c
> @@ -798,18 +798,16 @@ static void fsl_sai_config_disable(struct
> fsl_sai *sai, int dir)
>                            FSL_SAI_CSR_FR, FSL_SAI_CSR_FR);
>
>         /*
> -        * For sai master mode, after several open/close sai,
> +        * For sai master/slave mode, after several open/close sai,
>          * there will be no frame clock, and can't recover
>          * anymore. Add software reset to fix this issue.
>          * This is a hardware bug, and will be fix in the
>          * next sai version.
>          */
> -       if (!sai->is_consumer_mode[tx]) {
> -               /* Software Reset */
> -               regmap_write(sai->regmap, FSL_SAI_xCSR(tx, ofs),
> FSL_SAI_CSR_SR);
> -               /* Clear SR bit to finish the reset */
> -               regmap_write(sai->regmap, FSL_SAI_xCSR(tx, ofs), 0);
> -       }
> +       /* Software Reset */
> +       regmap_write(sai->regmap, FSL_SAI_xCSR(tx, ofs), FSL_SAI_CSR_S=
R);
> +       /* Clear SR bit to finish the reset */
> +       regmap_write(sai->regmap, FSL_SAI_xCSR(tx, ofs), 0);
>  }
>
> Could you please try the above change to also work for your case?

Ah, I should've spotted that! Yes, doing it this way works just fine. Up=
dated patch incoming.

Thank you,
Arun
