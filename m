Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 677D318E02A;
	Fri,  9 May 2025 09:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.236.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746782438; cv=none; b=lrIAN0WXGPOGURlnngY/OQzEZAuzXVm6baw7+mLcjfYNYmITBmBdG25dTZKQga6Z4sC350mzOyigbRfJtFf+G7m2RLUA10/DFfUwOjEdXdl3ziSss1frhV1OaskQvhA9eN5xDqQJPlipXu4qi0IIQ6gRiN/+Zpz1W9S5uijn8v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746782438; c=relaxed/simple;
	bh=HIJLJlaSHblXzW4J68BnNfxMHmJtQylwo1XmckKLjkI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iB8CRdsNVwqf0SWsa5qrNAq5kh+X1MtdVkOV/3Sg204V85cHhBinRvfSN7J7XTqk/UWXHVUhKua0Anlj15odejpyIX9dtJDxxu9V+szIiZ7BSpfQuq7hGMOZzCAi88OT75pWf2IPA9Qj7GvOppdO51OFUnYQZUX68IeCnSJ/hQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.236.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4Zv3FQ06s9z9t7B;
	Fri,  9 May 2025 11:13:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s8onC-g13dbh; Fri,  9 May 2025 11:13:13 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4Zv3FP6VrMz9t2V;
	Fri,  9 May 2025 11:13:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D63998B776;
	Fri,  9 May 2025 11:13:13 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id fVWNjZv3ZZLW; Fri,  9 May 2025 11:13:13 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 21FC18B768;
	Fri,  9 May 2025 11:13:13 +0200 (CEST)
Message-ID: <bc561703-bf34-4c99-aaad-1b1aad5ced12@csgroup.eu>
Date: Fri, 9 May 2025 11:13:12 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ASoC: fsl: fsl_qmc_audio: Only request completion on
 last channel
To: Herve Codina <herve.codina@bootlin.com>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-sound@vger.kernel.org
References: <19aa9d8a84c8475c62c42ac886dad0980428c6c0.1746776731.git.christophe.leroy@csgroup.eu>
 <5cffeb220617584a5e4bc03067cc10e6cdcfc25e.1746776731.git.christophe.leroy@csgroup.eu>
 <20250509104544.5c375f05@bootlin.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250509104544.5c375f05@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Hervé,

Le 09/05/2025 à 10:45, Herve Codina a écrit :
> On Fri,  9 May 2025 09:48:45 +0200
> Christophe Leroy <christophe.leroy@csgroup.eu> wrote:
> 
>> In non-interleaved mode, several QMC channels are used in sync.
>> More details can be found in commit 188d9cae5438 ("ASoC: fsl:
>> fsl_qmc_audio: Add support for non-interleaved mode.")
>> At the time being, an interrupt is requested on each channel to
>> perform capture/playback completion, allthough the completion is
>> really performed only once all channels have completed their work.
>>
>> This leads to a lot more interrupts than really needed. Looking at
>> /proc/interrupts shows ~3800 interrupts per second when using
>> 4 capture and 4 playback devices with 5ms periods while
>> only 1600 (200 x 4 + 200 x 4) periods are processed during one second.
>>
>> The QMC channels work in sync, the one started first is the one
>> finishing first and the one started last is the one finishing last,
> 
> How can we be sure about that?
> 
> The mapping on the TDM bus has to be taken into account.
> 
> chan 0 -> TDM bits 0..8
> chan 1 -> TDM bits 16..23
> chan 2 -> TDM bits 9..15

In interleaved mode, the QMC will not allow that. You can have 
TS0-TS1-TS2 or TS1-TS2-TS0 but you can't have TS0-TS2-TS1.

In non-interleaved mode we mimic the interleaved mode so I don't expect 
it either.

> 
> In that case chan 1 can finish after chan 2.
> 
> qmc_chan_get_ts_info() could be used to get struct qmc_chan_ts_info
> and [rx,tx]_ts_mask field in the struct give the mapping information.
> 
> The channel that ends last is the one with the highest bit set in the
> mask (rx_tx_mask for capture and tx_ts_mask for playback).

That would be right if the channels were starting all at exactely the 
same time. But qmc_audio_pcm_write_submit() and 
qmc_audio_pcm_read_submit() are calling resp. qmc_chan_write_submit() 
and qmc_chan_read_submit() one by one.

Even if that happens it shouldn't be a problem on its own as there are 
only a few microseconds between each Timeslot (a full cycle is 125 µs). 
And also because calling snd_pcm_period_elapsed() doesn't have any 
destructive effect on ongoing processing.

So I wouldn't make it too complicated. Here the benefit is real and 
worth it.

Thanks,
Christophe

> 
> Best regards,
> Hervé
> 
>> so when the last one finishes it is guaranteed that the other ones are
>> finished as well. Therefore, only request completion processing on the
>> last QMC channel.
>>
>> On my board with the above exemple, on a kernel started with
>> 'threadirqs' option, the QMC irq thread uses 16% CPU time with this
>> patch while it uses 26% CPU time without this patch.
>>
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> ---

