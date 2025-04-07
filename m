Received: from mg.richtek.com (mg.richtek.com [220.130.44.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62717A50;
	Mon,  7 Apr 2025 00:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.130.44.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743986609; cv=none; b=GzOnO8usdug7QyX/g4RI1gu8hsDDuS67wvc+WblwwQIwc8IzRouJB6eZQeXpKel64bhWmzh9aZMHFebWA2Xcn5pZVJYR6+EDzcJJYNiKt+1VSCpApnJmM+ZTOKVfEFMbl5bsvXJHI1yrQ5FF+9cKluGCrqb+E++jVYQOjNzc7Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743986609; c=relaxed/simple;
	bh=p9NytWO0mULRdNCJ00IB6qyxeTZJcG7uIqZsDWxCJ2c=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nRNHEQ6TaKCnBtS69TI0BR5Aluq6w8zxFvrrcqTOIKCtlbSIrrLmx0zyEvOPASwxDYrSiCAXzvzV58E3dlPJAIiqAcTiAy0gkCqfiwe/iVT/8EMq0jRGNMZrxkbPcHALh7GlpOI/AbV/3IMspwBqjVxN1lo4/zZwKlqGS4TAAWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=richtek.com; spf=pass smtp.mailfrom=richtek.com; dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b=gW6vBpVX; arc=none smtp.client-ip=220.130.44.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=richtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=richtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b="gW6vBpVX"
X-MailGates: (SIP:2,PASS,NONE)(compute_score:DELIVER,40,3)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=richtek.com;
	s=richtek; t=1743986597;
	bh=ctQ5BeWFduCso2EqpSK1oiHVVvZyXOtZqETIq5/So0k=; l=2212;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=gW6vBpVXUF08awMY3zxXLSuq+2Fud0fidgroc+fovMTXFQQF93jA4EZsBp1SpN0+K
	 CbRUjo58IuTPcq/0k2+A5xG7p6zSJttWncv1aouLxVI8f9kw/rAe8b2vdsi13T4sjr
	 l77iFuljj3tWgPtZJ+tdYrl2yhfITQjs1R2d/7TwiTWIkJK48SOkn6VedeYDJ5YCHU
	 ye8OFVZgLPMGRvWH/scL21XeJRwLwphxzaPjkeSF9v6wAq3JdXZSKeQMTGQG1CE63A
	 7nDr0CVKcmgXUQXgp5a009QpgcHUKMlrfpQOfyKlxC/Ixh3cJUNDTGqisoBcJFB8vv
	 Bp4GPspxyWlmw==
Received: from 192.168.10.46
	by mg.richtek.com with MailGates ESMTPS Server V6.0(1629322:0:AUTH_RELAY)
	(envelope-from <cy_huang@richtek.com>)
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256/256); Mon, 07 Apr 2025 08:42:45 +0800 (CST)
Received: from ex3.rt.l (192.168.10.46) by ex3.rt.l (192.168.10.46) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 7 Apr
 2025 08:42:44 +0800
Received: from git-send.richtek.com (192.168.10.154) by ex3.rt.l
 (192.168.10.45) with Microsoft SMTP Server id 15.2.1544.11 via Frontend
 Transport; Mon, 7 Apr 2025 08:42:44 +0800
Date: Mon, 7 Apr 2025 08:44:05 +0800
From: ChiYuan Huang <cy_huang@richtek.com>
To: Mark Brown <broonie@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Rob Herring <robh@kernel.org>, Liam Girdwood
	<lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, Otto lin <otto_lin@richtek.com>, Allen Lin
	<allen_lin@richtek.com>, <devicetree@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/4] ASoC: codecs: Add support for Richtek rt9123
Message-ID: <Z/Mf1VQ1Ay/Fw3kh@git-send.richtek.com>
References: <cover.1743774849.git.cy_huang@richtek.com>
 <cff65757c4665a81397ef5f559b277f96d4236c3.1743774849.git.cy_huang@richtek.com>
 <4e966f68-527e-4e2c-9043-0795ff094031@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <4e966f68-527e-4e2c-9043-0795ff094031@sirena.org.uk>

On Fri, Apr 04, 2025 at 04:03:57PM +0100, Mark Brown wrote:
> On Fri, Apr 04, 2025 at 10:22:12PM +0800, cy_huang@richtek.com wrote:
> 
> > +static int rt9123_enable_event(struct snd_soc_dapm_widget *w, struct snd_kcontrol *kcontrol,
> > +			       int event)
> > +{
> 
> > +	ret = pm_runtime_resume_and_get(dev);
> > +	if (ret)
> > +		return ret;
> > +
> > +	snd_soc_component_write_field(comp, RT9123_REG_AMPCTRL, RT9123_MASK_AMPON, enable);
> > +
> > +	pm_runtime_mark_last_busy(dev);
> > +	pm_runtime_put_autosuspend(dev);
> 
> What's going on with the runtime PM stuff here?  Especially for the DAPM
> widget usually the ASoC core will be able to keep devices runtime PM
> enabled so long as they are in use so I'd expect this not to have any
> impact.  Why not just use a normal DAPM widget?
> 
That's because The RG 0x01 'RT9123_REG_AMPCTRL' is mixed with other volatile
status bitfield like as 'SW_RST', 'SYS_STATE'. That's why I use pm_runtime to
make sure the RG can really be accessed at that time. Actually, the
mixed RG bitfield  for 'RW' and 'RO' is a bad design.
> > +static int rt9123_xhandler_get(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol)
> > +{
> > +	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
> > +	struct device *dev = comp->dev;
> > +	int ret;
> > +
> > +	ret = pm_runtime_resume_and_get(dev);
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (rt9123_kcontrol_name_comp(kcontrol, "SPK Gain Volume") == 0)
> > +		ret = snd_soc_get_volsw(kcontrol, ucontrol);
> > +	else
> > +		ret = snd_soc_get_enum_double(kcontrol, ucontrol);
> 
> This is even more unusual - it'll runtime PM enable the device every
> time we write to a control, even if the device is idle.  The driver does
> implement a register cache so it's especially confusing, we'll power up
> the device, resync the cache, write to the hardware then power the
> device off again.  Usually you'd just use the standard operations and
> then let the register writes get synced to the cache whenever it gets
> enabled for actual use.  Again, why not just use standard controls?
> 
Same as the last one.

........

Others will be modified in v2.

Thanks.
