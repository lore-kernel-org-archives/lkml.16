Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6EDA2557A;
	Wed, 16 Apr 2025 07:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744788006; cv=none; b=Ht+1BLto3+Fsgl8AwPd1RZHKcPe5L4C1fATbxo8ejLwOJSwQAGec7LPJiMgqUwaPGxuvfOXdgs2GjK0kwbpF7go1KPo3dsspI7pQKbAh4fW0c9j5ycy8QZNOfO53bPx1tBQdWxJOcCCJ+3YHPl36xwXo+CgtAAfBjc5OelgB02U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744788006; c=relaxed/simple;
	bh=N9Nd+GFvguMrgBicYAWRNtu9jn5oYNS4Uo+vZ1eBTDM=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=MoDRiv1WRt3gEd0g7jUN8fRrqnpiYheznhHyktSF26a92YacyczgynAWMbuihkxGqCc6RHd66xYUGvo6MSP1Mh9bHyrlarinkwzPBIEhklej5SQcVRyUjU3m5oeFOMV6bKxv35oPtAaGHKuF9+VCmX7bwA8QK3s5bnHM85KzgUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=uQgcndVZ; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="uQgcndVZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1744787964; x=1745392764; i=markus.elfring@web.de;
	bh=G7abM6WGvM4BCa0hkaj/Cdaz0xJIEIaob2oMh7L6/CU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=uQgcndVZEkAxNr/H9sxVaaxAYIHKqdIinwN8Rti6t9ceMy4xtaWO1B6Q734XwUfS
	 93XYaojmAlF8GpiBmpjzHHRk/bqfp+9WKyxKfzSN2l6oAffqrw1MLqxc2BseWOYzM
	 +rlV2teXHlcyNf3AKpys7mkmEKscjnYNDsn0l0BPDclacc0/JEGjbtknYtFHxPjO7
	 3NwcOFk7cygO9jHZ0GR44K2e+rrtPhRlc38tK8pBszvQd8X6Y5zmX1iOhSeUQQWkS
	 LhMGpsjN8IkMCZVHbZ6wyurvcvCWFG+FhiaKdUdHQInLgyDFWC9evp/Q/J8Xmnjrn
	 VMmwwZKZxpNw2vaofQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.13]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N9cHJ-1szfXF0Stp-00vCN1; Wed, 16
 Apr 2025 09:19:24 +0200
Message-ID: <e1890bbe-183c-43ee-b866-936f9a7e4801@web.de>
Date: Wed, 16 Apr 2025 09:19:12 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chenyuan Yang <chenyuan0y@gmail.com>, linux-sound@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Chao Song <chao.song@linux.intel.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Takashi Iwai <tiwai@suse.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
References: <20250415194134.292830-1-chenyuan0y@gmail.com>
Subject: Re: [PATCH] ASoC: Intel: sof_sdw: Add NULL check in
 asoc_sdw_rt_dmic_rtd_init()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250415194134.292830-1-chenyuan0y@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:gxVTFOrhrX3qc2WWImINgsAFQFASupj8BvEZ2rDqYVSsNehzAaF
 OPu0rhXR7o9txOylKvgCTD+HAlMpt7qa57bnO2ikfaxv9RAca091jwm4EmVoPR/ZYCr7GJG
 y3wIHWX/VYUi+bhTN89Y5H4wCB61w1WHp4Zs4CvM5MFJDtInNx6m1Ij87+4fPlACPV5Il2B
 TlVFIeWVlErt03vmLOv0g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:XnOhZVtlwcU=;afTtJYoc5cHF7mestVa2reZBD8X
 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

> mic_name returned by devm_kasprintf() could be NULL.
> Add a check for it.

Was this patch also supported by the source code analysis tool =E2=80=9CKN=
ighter=E2=80=9D?


=E2=80=A6
> +++ b/sound/soc/sdw_utils/soc_sdw_rt_dmic.c
> @@ -29,6 +29,8 @@ int asoc_sdw_rt_dmic_rtd_init(struct snd_soc_pcm_runti=
me *rtd, struct snd_soc_da
>  		mic_name =3D devm_kasprintf(card->dev, GFP_KERNEL, "rt715-sdca");
>  	else
>  		mic_name =3D devm_kasprintf(card->dev, GFP_KERNEL, "%s", component->n=
ame_prefix);
=E2=80=A6

How do you think about to use the function =E2=80=9Cdevm_kstrdup=E2=80=9D =
in one if branch instead
(by another update step)?
https://elixir.bootlin.com/linux/v6.14-rc6/source/drivers/base/devres.c#L9=
58-L965

Regards,
Markus
