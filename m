Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738252DC770
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 08:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746087129; cv=none; b=AFFp2SzzOOfA3g1tAfvWuDsPsci2crygzrhVRV3ks3niI1bgT8CKM0SeyNFkH1RgFGiVXLrcP34w5VSFdVY6G+NdJTeI5QzDylv4hKEAVeBBwRs42NlOmMSPwQ3mn070cuS50T2/sHLsWYi8T3jPGzTlKHSn+lZyCZ/BbgO8F0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746087129; c=relaxed/simple;
	bh=IxS62K99bE/tXZV+pK9TrCIkzaA+cl/dtwsRmmVy2uM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c+bUNCmUyjb03r2SLrMANjvsmV/QyDKDcPb2bNM4CfJW7/zKtLvGGHbWs6+8mfOJIfCp/rEsdfbgKsFkqBXS5xSoKaT9Z/gQHEaJHCNF/kP3+V2HrKhk6niKqbonoszHVLmuv8hGNCp1UKIoKsw32fwVLBNKOgEvkUlBPuvtNdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FZmgV6rS; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FZmgV6rS"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39c1ef4acf2so439492f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 01:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746087125; x=1746691925; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dFcXTX8spCHSXrXH6Pgc6qh5jLURBCENnqr3E6Qi8BA=;
        b=FZmgV6rSHl0WlM0YHdW/cqr5w+rPE2LGvcCMcCEWPRyI0ELjafUem7Xp8neBZwg1Vg
         ns+hrDeNZa4LI8ZcfrxBRSJcvLnEEkZzUb0+dEUJ+fpKdzEY5oFDsg7beCQC5hr1Yv9T
         xFiZZhIT6yiT5ibuBTVB8GYlh0XaQBx/GikFLXEgNiFWwaZM/97zd8Zg9fxCKJIXsFrw
         ImuVbI4qmm1E6g/+OKBNAkPCqvj2HMOWniaw2VOFP7uMHMtP426tIt5/rxg4R39w+5sH
         REn1tDKoKgdDK6OQyJv+9mK6QU0QTDTQyHip1pcRsELAAf1C9Pjg+b5THfFiBi7dA8Oh
         Qnsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746087125; x=1746691925;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dFcXTX8spCHSXrXH6Pgc6qh5jLURBCENnqr3E6Qi8BA=;
        b=ivKQKXAH7bPRgYoFod3QEyEX9ldO3Ce5s9M3SbBqGbIagwyYDpMofFZHHqfiFzqpfH
         OagX2kvxGdOMO/dVtFV9or0URvsYsmXRlNakaKkDRIZHFEaydyK6hoc6nSC3bjLjJ4zv
         X/pW0n3dN78pmecq4W5utoUSnohsIhmMsIEADTYutwv1AR3bV5/YdjmwteOxisPwNdM/
         rkmh7AIC/KvhldZXyleljd34V76gZrD99sE7Fo1ZdMGOvcQvbHPZvFMxDEnG6cwWRMID
         SpcoqtMhv/8tR6zXOPYn+6rpyuGo1spkZSY9nzCynpY86Yn1d00ZtU6BXIHoRKn6w9At
         e0Kg==
X-Forwarded-Encrypted: i=1; AJvYcCWq9uaGiZd6qCEaEE78C3zHI1ZRcKCZ82BR54Q0erQYlWHpxFiBmSEZ6t5amGKzgzLY770lDfC1gN++0vs=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa8BLDp5Gjxr+laUaBYSEpy4ZVmG1cVDUnFEs1OBr/4FQodzb9
	KHTMNmUXqDFyn/LGOnLeQc9RIYHk4BVsGjnIzdObnrvZcGbhXEq1
X-Gm-Gg: ASbGnctD9nZfF2x3s61VLnLP+24GvfBdRNs19unKX/s80zhpVefe1r06f/KyzrBRzgI
	Vy96aHiveDx3ZH6mnv3xXcd0gZ9g12kBzw4GuJQ0fYqEd9MqHfhg3PIuQQW2TkeMZ351rKQsq9Z
	4KjRfFgdqjM3L3nH0f88AtFwpvNzB4EfuEVYUYd6NXl+z3g46yiGvVs9YUCdb0x8xBZ6ZaId0dz
	MDfOYzArjHE5IQmoh/2YvAj51fzO56dX/wJYD69jbQgWOeuwHP3Ptv8UfXmGmQBqeBvzZGL0kiQ
	YUBOj+E/yh8GujVJ0D1qowz9SGTJ4hke2NxBdNwyC+/28opa9BV7gD0BYXBW+WYhgNMSMUV+6g=
	=
X-Google-Smtp-Source: AGHT+IEmZq7EmvWiYmlEHOv6ulsRLrFfVbnN+gN6GVBc96hwKOkN1xpjR8St45L1drCZHHDFEjh/6w==
X-Received: by 2002:a5d:47c5:0:b0:3a0:8acc:1df4 with SMTP id ffacd0b85a97d-3a094044aa7mr1306480f8f.7.1746087124562;
        Thu, 01 May 2025 01:12:04 -0700 (PDT)
Received: from toolbox (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a095a4c1basm187938f8f.59.2025.05.01.01.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 01:12:04 -0700 (PDT)
Date: Thu, 1 May 2025 10:12:02 +0200
From: Max Krummenacher <max.oss.09@gmail.com>
To: Doug Anderson <dianders@chromium.org>
Cc: "Kumar, Udit" <u-kumar1@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>,
	andrzej.hajda@intel.com, neil.armstrong@linaro.org,
	rfoss@kernel.org, Laurent.pinchart@ideasonboard.com,
	dri-devel@lists.freedesktop.org, tomi.valkeinen@ideasonboard.com,
	jonas@kwiboo.se, jernej.skrabec@gmail.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] drm/bridge: ti-sn65dsi86: Enable HPD functionality
Message-ID: <aBMs0ubSip7MAtMQ@toolbox>
References: <20250424105432.255309-1-j-choudhary@ti.com>
 <3f44ec0b-216c-4534-a6de-7b17929cb9e1@ti.com>
 <CAD=FV=WytPZCF-jcWFgXoAOoXOV61bw2_ftJbdbWZviHQqap5w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=WytPZCF-jcWFgXoAOoXOV61bw2_ftJbdbWZviHQqap5w@mail.gmail.com>

On Mon, Apr 28, 2025 at 02:15:12PM -0700, Doug Anderson wrote:
Hello Jayesh,

> Hi,
> 
> On Thu, Apr 24, 2025 at 6:32 PM Kumar, Udit <u-kumar1@ti.com> wrote:
> >
> > Hello Jayesh,
> >
> > On 4/24/2025 4:24 PM, Jayesh Choudhary wrote:
> > > For TI SoC J784S4, the display pipeline looks like:
> > > TIDSS -> CDNS-DSI -> SN65DSI86 -> DisplayConnector -> DisplaySink
> > > This requires HPD to detect connection form the connector.
> > > By default, the HPD is disabled for eDP. So enable it conditionally
> > > based on a new flag 'keep-hpd' as mentioned in the comments in the
> > > driver.
> > >
> > > Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> > > ---
> > >
> > > Hello All,
> > >
> > > Sending this RFC patch to get some thoughts on hpd for sn65dsi86.
> > >
> > > Now that we have a usecase for hpd in sn65dsi86, I wanted to get
> > > some comments on this approach to "NOT DISABLE" hpd in the bridge.
> > > As the driver considers the eDP case, it disables hpd by default.
> > > So I have added another property in the binding for keeping hpd
> > > functionality (the name used is still debatable) and used it in
> > > the driver.
> > >
> > > Is this approach okay?
> > > Also should this have a "Fixes" tag?
> >
> > >
> > >   .../bindings/display/bridge/ti,sn65dsi86.yaml      |  6 ++++++
> > >   drivers/gpu/drm/bridge/ti-sn65dsi86.c              | 14 +++++++++-----
> > >   2 files changed, 15 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> > > index c93878b6d718..5948be612849 100644
> > > --- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> > > +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> > > @@ -34,6 +34,12 @@ properties:
> > >         Set if the HPD line on the bridge isn't hooked up to anything or is
> > >         otherwise unusable.
> > >
> > > +  keep-hpd:
> > > +    type: boolean
> > > +    description:
> > > +      HPD is disabled in the bridge by default. Set it if HPD line makes
> > > +      sense and is used.
> > > +
> >
> > Here are my suggestions
> >
> > 1) use interrupt in binding as optional instead of keep-hpd
> >
> > 2) use interrupt field (if present to enable of disable HPD functions in
> > driver)
> 
> Officially we've already got a "no-hpd" specified in the device tree.
> You're supposed to be specifying this if HPD isn't hooked up. It would
> be best if we could use that property if possible. If we think that
> using the lack of "no-hpd" will break someone then we should be
> explicit about that.
> 
> I'd also note that unless you've figured out a way to turn off the
> awful debouncing that ti-sn65dsi86 does on HPD that using HPD (at
> least for initial panel power on) only really makes sense for when
> we're using ti-sn65dsi86 in "DP" mode. For initial eDP panel poweron
> it was almost always faster to just wait the maximum delay of the
> panel than to wait for ti-sn65dsi86 to finally report that HPD was
> asserted.
> 
> I could also note that it's possible to use the ti-sn65dsi86's "HPD"
> detection even if the interrupt isn't hooked up, so I don't totally
> agree with Udit's suggestion.
> 
> I guess the summary of my thoughts then: If you want to enable HPD for
> eDP, please explain why in the commit message. Are you using this to
> detect "panel interrupt"? Somehow using it for PSR? Using it during
> panel power on? If using it for panel power on, have you confirmed
> that this has a benefit compared to using the panel's maximum delay?
> 
> -Doug

I'm working on a similar issue where the bridge is used to provide a
connector to a display port monitor and hot pluging would be needed.

Related, but not the issue here: We have two display outputs and the
reported connected display without an actual monitor to report a
video mode then confuses the system to also not use the second display.

As I already have a solution which fixes my issue, hopefully not
affecting the eDP use case a proposed that here:

https://lore.kernel.org/all/20250501074805.3069311-1-max.oss.09@gmail.com/

Regards,
Max
