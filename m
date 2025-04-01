Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355EC1E5B69
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 08:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743495399; cv=none; b=ip4Q5q/A5C6vQREI03/U0NzEI9Po3uP9PLRvlwNyvPJZ8tm6RLcJ3gT3A6IJndq3B4f4iLIHlKCjYPn5i319MZMkslV6G5jCpC9pUaKpWX0H1PHSVsMdxccBr/Cbdpe9PyZ5MdOiVJwP9vh9tf88dWxLrDTMSFK4WaUwdRPsIN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743495399; c=relaxed/simple;
	bh=eofPP7zphowVZVkOlN5trgp55mfN8GY1zjDnh4fRLYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=evUCKY9BS90ZzGpnwnbsO12FVO1T8XmWKblXen+C2MSqPIKmwfzx8fZxNrHesDg6KY19NAkCGeFHsOqREp7seJKX6/OXiPvkwvaX/IPKfzRCedi5MQBNQ2FuXLcYAZvo2gZSTkXHqlxh7Krqnk52nXd9fgsJ49VQ/QaamQGz770=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RhP/zcmu; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RhP/zcmu"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac2bdea5a38so863622066b.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 01:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743495395; x=1744100195; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PrVIKvgnOU4qD+Zbvm9Ig4ON8IklOf3INDhWzvDe65U=;
        b=RhP/zcmuF2oktGZ9djneLZZIv8DrdOmYMf3/9v/fTfCH7S+uZWj9EnvhdKBsULP/Qm
         nUILXTDPXbMbzevmseryy7BN24KkpEI/fRqoJTmd52+43QC3E9Q8aP70xcC+xnCt+OJA
         FzRImPdI7RSFfhrz0i1ugscsLgMtOl/7zZWCCaK+ZAgEOUEvbvUZERnrqc34RuP0sZeG
         cJ2dP1O4+a2xVv7tG0UIdZyPJRKuDJHXNr72Oelmf+x9quujf4dOLk9ZcudasdNmE6mn
         M52YIkQFosR+6ZiaA5KYqpeJ+c63U9/EsXcdSRKRj5+8XZpsUsZZnB1EjYXDaI6exbna
         Aj8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743495395; x=1744100195;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PrVIKvgnOU4qD+Zbvm9Ig4ON8IklOf3INDhWzvDe65U=;
        b=nxazqjExSKkx5zYhm7LVwVzYMz7h19pmkSecj37rBI+WAVuvbfojOUNOUvrS1hqg8/
         EvtxCV43M/DzNAHervHq9V2sB9Ixa/0bgjpXGiB0kyl6cszVb8YF19N7EitN7I1lYkfq
         A2MG1xIiVvir3n7dM8yPJLNA+dIAmdpKXi5otdu72wsmPa4/Iw0MBwoVl3EglJGI94Fw
         4PnccFGkQ8lYTOqdc6z2d5Jh4vvrNHvB1YUsU2sNZgFCH02miJhk6UO4yG4QheZyKHee
         hcRxSdzZb5TpkDsZpGO+Nu0ll14Wwa4uKQFZQmuCvDK9rR5ACAQwYm7woI10d1MhGbXP
         b2yg==
X-Forwarded-Encrypted: i=1; AJvYcCWZdrL3EN9dk6r159Zifu/vCHcg8yDwUMZMhR7u7A2kjuBSNbA4K9ke2PPJHB/TkOUgZtwAoElqLeIe0QQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxiBVA2jUxwvU5pvEomjT4b/UgCDWH6ZyuArQZmg4wZXxaY95XI
	Ym7wTRT6pkNYEHxJ3VMCJZHfQ/qs9O+AbRuH3vWCT7iPLkT4YQjuXjEcyliT9dg=
X-Gm-Gg: ASbGncsL+M8PDZzMMy4VzDSBAkBkkmh1DNZV3jcBE2mj77IZzr8Wnm2FKHXX7IaVcUn
	XruncRZ/n05Fq8EcSp66XgDOJBJV3JQ67xoH/EEMhF7KdlbM2IGoOw8NUfYEQVy1hztc/xviFiJ
	UMT9nMLamiJEEapf3Xb5z5HJ+CMdzTInyQW9jELbLMuwWdEaHw7NPBWyjxj9ey47HhtzTFOl9wR
	IWCuJQSn3wTo00Y7h4dV+KYsmp/+g/1tJZkpSH/7zpdLjRQAU7EYFDVow1Z4Ac7GZVCmqOL2rTJ
	GOL1iz1RyNNN8ApmpC5lWLaZ/V/7SJE3q/68oCPRwTNtTVddj5YzR90=
X-Google-Smtp-Source: AGHT+IH1NMpRelTCtWxZmplIIh8jUgx3dBuQ+5KnEzikK+mjlKQVyUDxOdR2qGWxJmqwwa8QNnWrYA==
X-Received: by 2002:a17:907:868e:b0:ac3:5d68:c519 with SMTP id a640c23a62f3a-ac738c13dcbmr1172846266b.53.1743495395257;
        Tue, 01 Apr 2025 01:16:35 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:ce6:8cc5:6e98:d576])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7196f55f9sm738659266b.177.2025.04.01.01.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 01:16:34 -0700 (PDT)
Date: Tue, 1 Apr 2025 10:16:29 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, mathias.nyman@intel.com, perex@perex.cz,
	conor+dt@kernel.org, dmitry.torokhov@gmail.com, corbet@lwn.net,
	broonie@kernel.org, lgirdwood@gmail.com, krzk+dt@kernel.org,
	pierre-louis.bossart@linux.intel.com, Thinh.Nguyen@synopsys.com,
	tiwai@suse.com, robh@kernel.org, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-doc@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
Subject: Re: [PATCH v36 22/31] ASoC: qcom: qdsp6: Introduce USB AFE port to
 q6dsp
Message-ID: <Z-ug3YFwff8hWIRl@linaro.org>
References: <20250319005141.312805-1-quic_wcheng@quicinc.com>
 <20250319005141.312805-23-quic_wcheng@quicinc.com>
 <Z-J2WnrZHP6iMIhT@linaro.org>
 <871827f0-94ba-4565-865f-775cab9501eb@quicinc.com>
 <Z-PPlRD7gcUcNvNv@linaro.org>
 <200c08f7-3637-c2fb-2caa-002604b957ed@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <200c08f7-3637-c2fb-2caa-002604b957ed@quicinc.com>

Hi Wesley,

On Mon, Mar 31, 2025 at 12:52:19PM -0700, Wesley Cheng wrote:
> On 3/26/2025 2:57 AM, Stephan Gerhold wrote:
> > On Tue, Mar 25, 2025 at 04:18:03PM -0700, Wesley Cheng wrote:
> > > On 3/25/2025 2:24 AM, Stephan Gerhold wrote:
> > > > On Tue, Mar 18, 2025 at 05:51:32PM -0700, Wesley Cheng wrote:
> > > > > The QC ADSP is able to support USB playback endpoints, so that the main
> > > > > application processor can be placed into lower CPU power modes.  This adds
> > > > > the required AFE port configurations and port start command to start an
> > > > > audio session.
> > > > > 
> > > > > Specifically, the QC ADSP can support all potential endpoints that are
> > > > > exposed by the audio data interface.  This includes isochronous data
> > > > > endpoints, in either synchronous mode or asynchronous mode. In the latter
> > > > > case both implicit or explicit feedback endpoints are supported.  The size
> > > > > of audio samples sent per USB frame (microframe) will be adjusted based on
> > > > > information received on the feedback endpoint.
> > > > > 
> > > > > Some pre-requisites are needed before issuing the AFE port start command,
> > > > > such as setting the USB AFE dev_token.  This carries information about the
> > > > > available USB SND cards and PCM devices that have been discovered on the
> > > > > USB bus.  The dev_token field is used by the audio DSP to notify the USB
> > > > > offload driver of which card and PCM index to enable playback on.
> > > > > 
> > > > > Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> > > > > ---
> > > > >  sound/soc/qcom/qdsp6/q6afe-dai.c         |  60 +++++++
> > > > >  sound/soc/qcom/qdsp6/q6afe.c             | 192 ++++++++++++++++++++++-
> > > > >  sound/soc/qcom/qdsp6/q6afe.h             |  36 ++++-
> > > > >  sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c |  23 +++
> > > > >  sound/soc/qcom/qdsp6/q6dsp-lpass-ports.h |   1 +
> > > > >  sound/soc/qcom/qdsp6/q6routing.c         |  32 +++-
> > > > >  6 files changed, 341 insertions(+), 3 deletions(-)
> > > > > 
> > > [...]
> > > > > diff --git a/sound/soc/qcom/qdsp6/q6routing.c b/sound/soc/qcom/qdsp6/q6routing.c
> > > > > index 90228699ba7d..b7439420b425 100644
> > > > > --- a/sound/soc/qcom/qdsp6/q6routing.c
> > > > > +++ b/sound/soc/qcom/qdsp6/q6routing.c
> > > > > @@ -435,6 +435,26 @@ static struct session_data *get_session_from_id(struct msm_routing_data *data,
> > > > >  	return NULL;
> > > > >  }
> > > > > +
> > > > > +static bool is_usb_routing_enabled(struct msm_routing_data *data)
> > > > > +{
> > > > > +	int i;
> > > > > +
> > > > > +	/*
> > > > > +	 * Loop through current sessions to see if there are active routes
> > > > > +	 * to the USB_RX backend DAI.  The USB offload routing is designed
> > > > > +	 * similarly to the non offload path.  If there are multiple PCM
> > > > > +	 * devices associated with the ASoC platform card, only one active
> > > > > +	 * path can be routed to the USB offloaded endpoint.
> > > > > +	 */
> > > > > +	for (i = 0; i < MAX_SESSIONS; i++) {
> > > > > +		if (data->sessions[i].port_id == USB_RX)
> > > > > +			return true;
> > > > > +	}
> > > > > +
> > > > > +	return false;
> > > > > +}
> > > > 
> > > > What is different about USB_RX compared to other output ports we have in
> > > > Q6AFE? Obviously, we can only play one stream on an output port. But
> > > > doesn't the ADSP mix streams together when you have multiple routes?
> > > > 
> > > 
> > > This patch will limit the USB_RX from being able to be mixed to multiple
> > > q6adm paths.
> > > 
> > > > Also, this doesn't actually check for *active* routes only. It just
> > > > looks if any other MultiMedia DAI is configured to output to USB_RX.
> > > > That doesn't mean they will ever be active at the same time.
> > > > 
> > > 
> > > Yes, the main reason being that that is the mechanism we use to populate
> > > the active offload path within the USB SND card mixer.
> > > 
> > > > I might for example want to have MultiMedia1 and MultiMedia2 both
> > > > configured to output to USB_RX. Let's assume MultiMedia1 is a normal PCM
> > > > DAI, MultiMedia2 is a compress offload DAI. When I want to playback
> > > > normal audio, I go through MultiMedia1, when I want to play compressed
> > > > audio, I go through MultiMedia2. Only one of them active at a time.
> > > > Why can't I set this up statically in the mixers?
> > > > 
> > > > If you confirm that it is really impossible to have multiple streams
> > > > mixed together to the USB_RX output in the ADSP, then this should be a
> > > > runtime check instead when starting the stream IMO.
> > > > 
> > > 
> > > We can have multiple streams being mixed together, but it will get
> > > confusing because it changes the definition that we had discussed about in
> > > the past about the overall design for the interaction w/ userspace.
> > > Although we (QC) only support a single USB audio device for offloading,
> > > there could be other situations where the audio DSP can support multiple
> > > devices.  The assumption is that each MM path is assigned to a USB device.
> > > 
> > 
> > Are you referring to the "USB Offload Playback Route PCM#*" mixers here?
> > They could just refer to first of the configured MM paths, if someone
> > decides to route multiple paths to the USB backend. Looking at
> > q6usb_update_offload_route(), I think the implementation does that
> > already.
> > 
> > I think it's fine that the userspace API for automatically "probing" the
> > PCM device supports only a single path to the USB backend. But if
> > someone wants to bypass the automatic probing and configure a more
> > advanced setup, do we need to forbid that?
> > 
> > Asked differently: what would happen if we remove this check here and
> > handle USB_RX like any other Q6AFE output port? Would anything break for
> > the userspace interface?
> > 
> 
> So I took a look at seeing how the Q6ADM/ASM interactions would work for
> the situation where if user tried to start both MM1/2 streams at the same
> time over the USB offload path.  In this scenario, we see that the Q6USB BE
> DAI operations, ie startup, hw_params, etc... gets called one time for the
> initial stream.  For example, if I start playback on MM1, then that
> triggers the USB BE DAI to be brought up.
> 
> When I start playback on MM2, since MM1 already called
> dpcm_be_dai_startup(), then be->dpcm[stream].users will be greater than
> zero.  This would cause the __soc_pcm_open() to be skipped for the USB BE
> DAI, so I wouldn't be able to check the runtime status at the Q6USB backend
> DAI.  However, we do track current streaming sessions done over Q6 ADM and
> it does save the AFE port associated to each COPP allocation, so I think its
> reasonable to see if there is already a COPP entry for the USB AFE port, to
> fail the open() call associated to the FE DAI.
> 

This sounds like a reasonable approach *if* we have to prevent multiple
MM DAIs from streaming to the USB AFE port at the same time.

It's still unclear to me why we have to introduce this limitation in the
first place. I think the questions from my previous email are still
open. Can you check them again?

Thanks,
Stephan
