Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7CE91E47DD;
	Wed,  2 Apr 2025 13:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743600888; cv=none; b=fTpIzlg0cEdoOhpyBtK3lHEnnJcI1hgRI6CauWOw3Nj1g5uRgPKL1hf186jfMXjrQIjGdzJZGAddFGsqJPWM/qVdNsP/mMjdBuxCKfz6yC8zyeSVFdgv62YlVSeHGXpZ5BJOKMWjx5GieAPMoYbdcshJJG2aEyhRbxEBPXT/k6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743600888; c=relaxed/simple;
	bh=OuoAqeBuPQ2j/ghqeglyEndvOevSd7UsPrm+9oDmN70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IiWvMJvMJy+wcrrFq14+c8GFO8LxMFTAM9bBlgFNiT5tLcJMhU4T4BuZnL0c68xt6v8IHCihZHQs0vsqFbpoFlGrUUHEzo4rVTGhpMmRHg4g9fb09T/3AZTk8LMg9PFUOjP+foSyKRZZ7v6Lbl8B42ZEP7qnL3uMzmqa5p8SSh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ethancedwards.com; spf=pass smtp.mailfrom=ethancedwards.com; dkim=pass (2048-bit key) header.d=ethancedwards.com header.i=@ethancedwards.com header.b=h4I4vi42; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ethancedwards.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ethancedwards.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ethancedwards.com header.i=@ethancedwards.com header.b="h4I4vi42"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4ZSQp40sg4z9tgG;
	Wed,  2 Apr 2025 15:34:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ethancedwards.com;
	s=MBO0001; t=1743600876;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cbl3CBymeICS1VuZIdcxAIF2SWxl8CbPoMyDAZuk7/Y=;
	b=h4I4vi42Qrd02l6K/oWFPuhBJrfb7+He3RxXPATHj8olCRDkxIl9Ngxy2speBCrNNRTb9R
	om8bCuSiQ4NM/Hdy6q9YQuvvIOGcCtJIOHrCzdxLTB//mKEQxirKojU5u21Z1U3Is2ZNEp
	w5Gu0sQs94fBxPiiAViJRFmA+sg3yLEXHXekUXNgp7TBdTq+0nx6uXVPq1tbeN+xZr7e43
	hMnZsCiL8oonWt8jkgXwyBJ6jMpp5N9VlRNNFzDiJwceNeRhiOBMKzBVzrPB2dkgWf7VSa
	UMx5De7D4FN/mnBOE3J1dg8hCeKtUAA8+bdcYgTdn94YFE4xjiE2L0t/zxM0Qg==
Date: Wed, 2 Apr 2025 09:34:30 -0400
From: Ethan Carter Edwards <ethan@ethancedwards.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Henry Martin <bsdhenrymartin@gmail.com>, linux-sound@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, 
	Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>, Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Cezary Rojewski <cezary.rojewski@intel.com>, Jaroslav Kysela <perex@perex.cz>, 
	Jerome Brunet <jbrunet@baylibre.com>, Julia Lawall <julia.lawall@inria.fr>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Liam Girdwood <liam.r.girdwood@linux.intel.com>, Mark Brown <broonie@kernel.org>, 
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH] ASoC: Intel: avs: Add NULL check in avs_component_probe()
Message-ID: <deahfhubcdeq3hw3qqu7waqdgcet6n5lpkfrao7u66dmroujzk@35gsdx7hb3rv>
References: <20250401143222.30344-1-bsdhenrymartin@gmail.com>
 <ed1be43c-99e0-4afb-8f98-9c7f39611610@web.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ed1be43c-99e0-4afb-8f98-9c7f39611610@web.de>

On 25/04/02 02:00PM, Markus Elfring wrote:
> > devm_kasprintf() returns NULL when memory allocation fails. Currently,
> …
>                 call?                                  failed?
> 
> 
> > Add NULL check after devm_kasprintf() to prevent this issue.
> 
> Do you generally propose here to improve the error handling?
> 
> 
> …
> > +++ b/sound/soc/intel/avs/pcm.c
> > @@ -927,7 +927,8 @@ static int avs_component_probe(struct snd_soc_component *component)
> >  		else
> >  			mach->tplg_filename = devm_kasprintf(adev->dev, GFP_KERNEL,
> >  							     "hda-generic-tplg.bin");
> > -
> > +		if (!mach->tplg_filename)
> > +			return -ENOMEM;
> 
> Can a blank line be desirable after such a statement?
> 
> 
> Would another source code transformation become helpful with an additional update step?
> 
> -		if (((vendor_id >> 16) & 0xFFFF) == 0x8086)
> -			mach->tplg_filename = devm_kasprintf(adev->dev, GFP_KERNEL,
> -							     "hda-8086-generic-tplg.bin");
> -		else
> -			mach->tplg_filename = devm_kasprintf(adev->dev, GFP_KERNEL,
> -							     "hda-generic-tplg.bin");
> +		mach->tplg_filename = devm_kasprintf(adev->dev, GFP_KERNEL,
> +						     (((vendor_id >> 16) & 0xFFFF) == 0x8086)
> +						     ? "hda-8086-generic-tplg.bin"
> +						     : "hda-generic-tplg.bin");
> 
> 
> Regards,
> Markus


Please feel free to ignore Markus. He has a tendency to provide unclear
and nonsense feedback. He has done this several times with my patch
sets. I almost wonder if he is an internet troll.

In any case, this change makes sense to me.

Reviewed-by: Ethan Carter Edwards <ethan@ethancedwards.com>
