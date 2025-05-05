Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1488141C63;
	Mon,  5 May 2025 12:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746449189; cv=none; b=G9RXJwbx23Gl0DuEi39gpwmb6khRJsa6U0DXyyLxfPACvQ+WcL2aloJrZYTT1c5DjX1ncojUNv4syPx7K3EHSUTk/XkvKMeAZWjAFErxe6WigOFAGzJD4L1zph/BcfGereptZ1B8MYV67N3HeuzH09Jc+7010DrpdKE5VC+2v0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746449189; c=relaxed/simple;
	bh=cjs2jCqJXMQfYbF51ctMl3G4R34SGf9hlFNMrSdrynI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pyBaoyzoyefiPM/AS9bnpcP1qc/EewOc1dggdxOL7p1lcSI6xW8J2qdFmTX3RI2dC6hgacvAsg5MTEiSKeeVsMPTbooEQv4xNP5juGo7n0gPhPUlEuOSSlda5O2V+AtvZTjwQMx8fqc8Xpsym6b2R+mT2t9NCnJtAHkph+X3YMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TJNU5Mbl; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TJNU5Mbl"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-30332dfc820so5052007a91.2;
        Mon, 05 May 2025 05:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746449187; x=1747053987; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ObIhRmKcJw0dtYzY3+cwi3lXYPLNgRL97uUh+PSy5rI=;
        b=TJNU5MblfkjIsZDRTUWM1J6J7meeszHLAAH4yfYBevJwlhS+UbXGieQhnPUIRySBTo
         M+X6Qw8FU7w1mxVBWNA9KfeJuLCz8hZ/lmj+2DEYKIoqMGLrpV9f7e8AIM1Hm/cZKqLZ
         4KDJziJRsteIinGnxwzuiLEF99C3NVLNzoUy9ZFbHGJKh+l6ofhjtj6QdWiaPavpEuNY
         yjuNWbJWLhb9PDZw9JAGjrJXJ/4X7MS+3RpcSv/0S/C4KrRg7a1VpY2n0Atmz6VQ+Ogm
         LMQVcyZ0OtiGrT5nMV7Y9b3/iRhjQkLMkvZHb++vrEQn8JlT+cuGV8wzmc7+EzwSF7iI
         INYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746449187; x=1747053987;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ObIhRmKcJw0dtYzY3+cwi3lXYPLNgRL97uUh+PSy5rI=;
        b=M3knahyztITfmhqCTBdq7GxQ4224UKCTWGNhoieW0XNj+TzDgdzKnWOQ/PO45c3Nnc
         NcUJN76dZV1vWUeCVEHFWzfkueiR6irGDL3hLDuKS7ee96ETBN9gO78xoXHA5qEeCDgA
         bqmDR+0WoPqdI2p4T6DROFtwVuc6YOANNfI9hxlqVNTciL17RCDjA9GDV7YATs/RT0qB
         yvzREpBck+bhze9SGZEUVtztcFFgmq7to5H/K6g4esALXUsOfPEE1284PJj5wxdgvE7o
         msKNZPWcOZ/KtYzJacluhMw2mR1VznKxRidjLsOb+AKOsy+hyGPg/p8JYHZfMpm+URfm
         vfrw==
X-Forwarded-Encrypted: i=1; AJvYcCWZBiaxe+aSoXJ000n+IuUF1536usBoypqFW8y5VUyKiTcGiqyr1/ZCGYi7uRK8ZgNzMuVOL5p5aB74svs=@vger.kernel.org, AJvYcCXGwMATA1ovC2VusOqsTFe+WYa9qusG1ew+1Cz0ud5MZOyzQPl9GI8V3W00lBwdx8B4rj7NIW+uQzu6HrY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmkFrFeHcLoEVnvBWxqkv+xGvzqJC3+GJu+GG8wAA34FhOWHC9
	ndM+p79uixX7oZl/ceoZMVicYTKy4QNuXHZ9yZJ44HeuaCwSkaRI
X-Gm-Gg: ASbGncuVn1Z2eqx1HFJbKXQRyXhmQBQL1QMZpo2nAefaGTTVct/P+IiwXVOWcV/b067
	Jv7Y6k8Hx5VBCarDsgqQx2mubt9SG4QteydseV2iLkIhH/W/XlrUBEJ4abZ+WuJVIcnvlVaJ8gu
	JtyPgEReULLsa0Qq2QeGQU5OwYiNMoHljexeTle7rpNP4wo3mP75V4XNDeWZQ1b1YfgSQsVPVgj
	pQs4GDHC9+dAdx9QhefS57k0zR2Joka894IuhAQbRZlTnaoVKw8m8jKgTxqvlXaEswZeVE2cNUD
	i5uSLM5nN2KaERGTgd14Yktx6dkziqhWPs7lkRJkjnQ0Yz4bGCKCHXEychyQ/4DrmCs=
X-Google-Smtp-Source: AGHT+IHOAnEtcmN2lOZxiOYPzW/hfac6lnQDVXkZ8+2ZPV6Olv0JjDd+Pl9EQiy3aPKob3SoII9o2A==
X-Received: by 2002:a17:90b:57e8:b0:309:fd87:821d with SMTP id 98e67ed59e1d1-30a5aed5520mr14312472a91.29.1746449187115;
        Mon, 05 May 2025 05:46:27 -0700 (PDT)
Received: from vaxr-BM6660-BM6360 ([2001:288:7001:2703:bd19:74c5:b39c:cda])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a34748983sm11450755a91.17.2025.05.05.05.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 05:46:26 -0700 (PDT)
Date: Mon, 5 May 2025 20:46:22 +0800
From: I Hsin Cheng <richard120310@gmail.com>
To: "Liao, Bard" <yung-chuan.liao@linux.intel.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
	pierre-louis.bossart@linux.dev, Vijendar.Mukunda@amd.com,
	peter.ujfalusi@linux.intel.com, peterz@infradead.org,
	christophe.jaillet@wanadoo.fr, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org
Subject: Re: [RFC PATCH] ASoC: intel/sdw_utils: Assign initial value in
 asoc_sdw_rt_amp_spk_rtd_init()
Message-ID: <aBizHlY-UxnBsNDs@vaxr-BM6660-BM6360>
References: <20250505074142.615408-1-richard120310@gmail.com>
 <2933e4c7-fc4c-4161-afee-cd6abcd79ef5@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2933e4c7-fc4c-4161-afee-cd6abcd79ef5@linux.intel.com>

On Mon, May 05, 2025 at 04:27:04PM +0800, Liao, Bard wrote:
> 
> 
> On 5/5/2025 3:41 PM, I Hsin Cheng wrote:
> > If strstr() for codec_dai->component->name_prefix doesn't find "-1" nor
> > "-2", the value of ret will remain uninitialized. Initialized it with
> > "-EINVAL" representing the component name prefix inside "rtd" is
> > invalid.
> 
> Indeed. Thanks for pointing it out.
> 
> > 
> > If "->name_prefix" is guaranteed to have either "-1" or "-2", we can
> > remove the second strstr() because we know if "-1" is not in
> > "->name_prefix", then "-2" is in there. It'll be a waste to do one more
> > strstr() in that case.
> 
> The existing name_prefix is with either "-1" or "-2". But we can't make
> the assumption in the asoc_sdw_rt_amp_spk_rtd_init() helper. We might
> have "-3", "-4" etc in the future.
>

Hi,

Thanks for your kindly review!

> The existing name_prefix is with either "-1" or "-2". But we can't make
> the assumption in the asoc_sdw_rt_amp_spk_rtd_init() helper. We might
> have "-3", "-4" etc in the future.
>
I get it, so in that case we should stick with current implementation
then. For "ret"'s initial value, do you think "-EINVAL" is ok or do you
prefer other value to be used ?
I'll refine commit message and send a formal v2 patch with your
preference.

Best regards,
I Hsin Cheng

> > 
> > Link: https://scan5.scan.coverity.com/#/project-view/36179/10063?selectedIssue=1627120
> > Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
> > ---
> >  sound/soc/sdw_utils/soc_sdw_rt_amp.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/sound/soc/sdw_utils/soc_sdw_rt_amp.c b/sound/soc/sdw_utils/soc_sdw_rt_amp.c
> > index 0538c252ba69..83c2368170cb 100644
> > --- a/sound/soc/sdw_utils/soc_sdw_rt_amp.c
> > +++ b/sound/soc/sdw_utils/soc_sdw_rt_amp.c
> > @@ -190,7 +190,7 @@ int asoc_sdw_rt_amp_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc
> >  	const struct snd_soc_dapm_route *rt_amp_map;
> >  	char codec_name[CODEC_NAME_SIZE];
> >  	struct snd_soc_dai *codec_dai;
> > -	int ret;
> > +	int ret = -EINVAL;
> >  	int i;
> >  
> >  	rt_amp_map = get_codec_name_and_route(dai, codec_name);
> 
