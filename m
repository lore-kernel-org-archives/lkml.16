Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AAB6238C20;
	Fri,  9 May 2025 10:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746785570; cv=none; b=Rkf2gA5ATwKT5zdgXkwqbZmQfGgi8gO+yuXLmgxeo3VrUTBwZxW2q8RiF7aC39d9F3ZByQO8wSx3wSqNwB4x9Iz0RhScADmdcP5adI+Q/oJu/XmUURIA9FpAnYze/PuYCotSxZYbeMK6jArIwnwjT97CbKkqF8Kolbxy0Pe0hkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746785570; c=relaxed/simple;
	bh=wS/6KQNzdpBB3FNLT1Rn8yrmiM3nhwYto5SljUvqwsk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z4Tm7w6dYw9N48pc17dyQFZzMC09BRU0qskcwk/ZI2ji6ALMNNKcdL3c9AFJTtEmI2lYhxFZXNc6OnFFmFq46jtaphGgVElKVhJwK4lsA401ZOsatJ0FFEMz6RhBjqWVFBSBH9IIeU7TKknTUvyLxWaOj4Bphl1F1amHXHcQO9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=kOEGaUyy; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="kOEGaUyy"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0355341C3E;
	Fri,  9 May 2025 10:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746785565;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AUqVDApz6yx09CXMIyoA67EfmMyBcs3zzqshkQzl/vY=;
	b=kOEGaUyyQUr9oXnGICGvjTZcSLJJ4Pryd018rL3UeEED5FV6IvFzEubMKpLDeY8O4lJCaV
	JNfvVBfmvwzBygNNw0NUusecj4CN6qiospjlchu7GAtc3CYcTIck3bsTV/XA8ORd6/1jV2
	jpnD4F9/txhXsahqTwfAelSIlTsYoKIsfL6k/CD7FBupw4n2TOaAoAE7qyZsHYupb3JunU
	NHDdVpA5YL2gQgMw4Mp+GsOzbiQtM40HrtFgAK8VjvJjYqnAPJyxEMf9nNwJVW59jrcsF0
	B8XdPv6CBEJf6BQmfbtDiAtjfPFsKrjCqjm2SC8t+DJ9k/tY6YK5LiCvPKFwWw==
Date: Fri, 9 May 2025 12:12:42 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, Shengjiu Wang
 <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam
 <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 2/2] ASoC: fsl: fsl_qmc_audio: Only request completion
 on last channel
Message-ID: <20250509121242.1f660e7f@bootlin.com>
In-Reply-To: <bc561703-bf34-4c99-aaad-1b1aad5ced12@csgroup.eu>
References: <19aa9d8a84c8475c62c42ac886dad0980428c6c0.1746776731.git.christophe.leroy@csgroup.eu>
	<5cffeb220617584a5e4bc03067cc10e6cdcfc25e.1746776731.git.christophe.leroy@csgroup.eu>
	<20250509104544.5c375f05@bootlin.com>
	<bc561703-bf34-4c99-aaad-1b1aad5ced12@csgroup.eu>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvledvfeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtkeertdertdejnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepjefflefhieduteegffeifeeggfffvdeuvdeutddvfeduudeukeffleehheffkeetnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedugedprhgtphhtthhopegthhhrihhsthhophhhvgdrlhgvrhhohiestghsghhrohhuphdrvghupdhrtghpthhtohepqhhirghnghdriihhrghosehngihprdgtohhmpdhrtghpthhtohepshhhvghnghhjihhurdifrghnghesghhmrghilhdrtghomhdprhgtphhtthhopegiihhusghordfnvggvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepfhgvshhtv
 ghvrghmsehgmhgrihhlrdgtohhmpdhrtghpthhtohepnhhitgholhgvohhtshhukhgrsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhgihhrugifohhougesghhmrghilhdrtghomhdprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: herve.codina@bootlin.com

Hi Christophe,

On Fri, 9 May 2025 11:13:12 +0200
Christophe Leroy <christophe.leroy@csgroup.eu> wrote:

> Hi Hervé,
> 
> Le 09/05/2025 à 10:45, Herve Codina a écrit :
> > On Fri,  9 May 2025 09:48:45 +0200
> > Christophe Leroy <christophe.leroy@csgroup.eu> wrote:
> >   
> >> In non-interleaved mode, several QMC channels are used in sync.
> >> More details can be found in commit 188d9cae5438 ("ASoC: fsl:
> >> fsl_qmc_audio: Add support for non-interleaved mode.")
> >> At the time being, an interrupt is requested on each channel to
> >> perform capture/playback completion, allthough the completion is
> >> really performed only once all channels have completed their work.
> >>
> >> This leads to a lot more interrupts than really needed. Looking at
> >> /proc/interrupts shows ~3800 interrupts per second when using
> >> 4 capture and 4 playback devices with 5ms periods while
> >> only 1600 (200 x 4 + 200 x 4) periods are processed during one second.
> >>
> >> The QMC channels work in sync, the one started first is the one
> >> finishing first and the one started last is the one finishing last,  
> > 
> > How can we be sure about that?
> > 
> > The mapping on the TDM bus has to be taken into account.
> > 
> > chan 0 -> TDM bits 0..8
> > chan 1 -> TDM bits 16..23
> > chan 2 -> TDM bits 9..15  
> 
> In interleaved mode, the QMC will not allow that. You can have 
> TS0-TS1-TS2 or TS1-TS2-TS0 but you can't have TS0-TS2-TS1.
> 
> In non-interleaved mode we mimic the interleaved mode so I don't expect 
> it either.

I am not so sure that the case shouldn't be handled by QMC.
Even if it is not possible at QMC level, you can have it at qmc_audio
level.

The qmc_audio driver depends on the DT binding:
	dai@18 {
            reg = <18>;
            /* Non-interleaved mode */
            fsl,qmc-chan = <&qmc 18>, <&qmc 19>;
        };

but you can have
	dai@18 {
            reg = <18>;
            /* Non-interleaved mode */
            fsl,qmc-chan = <&qmc 19>, <&qmc 18>;
        };

> 
> > 
> > In that case chan 1 can finish after chan 2.
> > 
> > qmc_chan_get_ts_info() could be used to get struct qmc_chan_ts_info
> > and [rx,tx]_ts_mask field in the struct give the mapping information.
> > 
> > The channel that ends last is the one with the highest bit set in the
> > mask (rx_tx_mask for capture and tx_ts_mask for playback).  
> 
> That would be right if the channels were starting all at exactely the 
> same time. But qmc_audio_pcm_write_submit() and 
> qmc_audio_pcm_read_submit() are calling resp. qmc_chan_write_submit() 
> and qmc_chan_read_submit() one by one.
> 
> Even if that happens it shouldn't be a problem on its own as there are 
> only a few microseconds between each Timeslot (a full cycle is 125 µs). 
> And also because calling snd_pcm_period_elapsed() doesn't have any 
> destructive effect on ongoing processing.
> 
> So I wouldn't make it too complicated. Here the benefit is real and 
> worth it.

I fully understand the benefit and I am not against the feature.
Also, I fully agree that it has to be kept as simple as possible.

My point is to avoid some possible regressions.

Maybe during probe, when the channels are parsed [0], the code should take
of the channel location on TDM to have them in the better order in its
table.

We can imagine that after filling the array, the driver sorts the array
using sort() or sort_r() [1] to ensure that the last item in the array
is the last on the TDM bus.

[0] https://elixir.bootlin.com/linux/v6.15-rc5/source/sound/soc/fsl/fsl_qmc_audio.c#L833
[1] https://elixir.bootlin.com/linux/v6.15-rc5/source/include/linux/sort.h

-- 
Hervé Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
