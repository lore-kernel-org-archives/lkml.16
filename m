Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9E7347C7
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 12:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747140190; cv=none; b=gm1o+EqyNJs9GJJwzE7CqpEUMYHGalvTewTIKymIYY3lPmiVapGMIft8BQuDOckWXd4dF5+GvPxVHgWcy31XQ0V+FbWCTTWJasBD+h7qT5kjIK4704u2Io1Ki/z3yD8I3BgACUkF1NyuKejW/JambmVbyXDIueZPMLnWlM4f/rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747140190; c=relaxed/simple;
	bh=8ybJrX2qyZmWRtnV+qzuO6w/hXvBrIbQ91kEJ9FBCHA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FFNpqkGaINo2tLItKwbNPB510D+vhWXEcp3xRHsWmEpb1vE+Qo+ZWoOWLeftGtaCCuTJKqYiFDZMEPtOYUGJGHCHsHDgRsdtM9J57cHWAC1yi8gCdvS5x98hP6NEmIGGtPXIugXneOT26t+y40N+GsDCsa1s4ab/rfZV7Z7EL+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TUHeOrm3; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TUHeOrm3"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5f6fb95f431so12558945a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 05:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747140187; x=1747744987; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3SBXEjjhVC1EuH3UOI0/Jmhx9LET+hs3zHGAFUvLwZE=;
        b=TUHeOrm3Q5LJLcMhm9vQBMiVu7yXbKPOPGOf1emGxmg8aP//hZ0saKMFTtmBurIA9G
         TBAneEzI7xqFoByeAY6c2UdryuSEvnPVB7J6yJgRXsq9cem/IX+oDLtYYDNoiQVbTuTF
         5osEv/QAr28JfCB45+X1AWt7z9gNxfHV3bXNlfa1Pc0oL8Oqjw03LR4lPhAe0HTQgwfd
         p2oJStHSel12STagwf6R/RpwOsYBCufZWGmeE507RKHGStep0EZRd66Y3D2BnEvaqMEE
         rlvMVF1x2NBEB0Ep800HIcq3NvnGrl+18brRZZq+blwaKSAQreOWDx91qYe7j+Na3Nh3
         eVBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747140187; x=1747744987;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3SBXEjjhVC1EuH3UOI0/Jmhx9LET+hs3zHGAFUvLwZE=;
        b=VCyzdrvWdWIzkExqQSiTLqqf008ccdwOFUYFFIiEEOoIau9thaLo/NZxrCRVwQnnoZ
         7YuuORTc85Bos9HGmaYH4h7I1Jg5FEHyfEjak4I0QjHubElhaZq2scP1poeBE9itALf1
         guZ4PRU5CLvNUhCWzPrftBF5dw4r53qlq83gBZM7TgUSMF+5G6YxtwBofROH1jrIklry
         ilgHaW9WzaomR0gdMoBnJNw69k0vYGJYpdLb1+1yhcsAI0dyOjdZetsXzTYNLxw3yHs5
         Aqfic+ZI20t48FoVYGzeGzXkuhlWmLOcPvxUVbiJbkNDcw8PJ5klHmkP2eTa1/8v+fZm
         aWLg==
X-Forwarded-Encrypted: i=1; AJvYcCWVMq/ZGICOTtHeTODaCP5hJQfdZPwYkqe8PokBG9bh2s3pGdWczUf+F0yagoMuNwh0Cp1RhN+6LAF3gUQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMCvczjZN4fSeursL5AnJk7SGCKfQzFpDKCvOdiAkOOTwNdQj8
	GELmHcBAflCjVIXlWby2fC0Uzmy1aUb0NQEdHQYtD74In4nn2c6R
X-Gm-Gg: ASbGncukPB5X94T5NTMQcM3x/GlOUDypLjlzn4WxfnXkJ/K+nqLLxWQQCBqWjw3Ep7m
	5FnLfPa5xSptDhF8pPd/tZhuW8NAOelDf/9lJ7rZSKlsdR1JKUOd757FgTZZyw34stHyDLH9dzl
	5EItJ2OI0jB8Tw/0YDwybog3LIF/tT8MnITNihJEbWQA+2fpZegzhDnq5ax1rrAVGEr0WPjhSYN
	KfAZGoz6BZl0t1huNTUs2Y1xGYDFzC+PJIysSpycXmp65xp+bw7eT+HQB3Usm9RKir0RzxSVSPH
	CPwh5FI5pvZsSbIIQe+pEJbsDHPFpd80lrFqcGNiSOqXg8nVsFbrByxROV7ptmuxW5L+OpsBuIx
	Z7O/bKv5p5+yttN7C5DLTTP52MoVclLuC
X-Google-Smtp-Source: AGHT+IEEJwaGQNEs+ETh8ls4sgLALLfU3bE4rJnfCyJldPf5oRxxddJO1sK4tUJgKQ3fhtsC0sJiuw==
X-Received: by 2002:a17:907:2ce4:b0:ad2:3c4e:2fc2 with SMTP id a640c23a62f3a-ad4d52be8e5mr333035766b.29.1747140186540;
        Tue, 13 May 2025 05:43:06 -0700 (PDT)
Received: from toolbox (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad21937b329sm773797466b.78.2025.05.13.05.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 05:43:06 -0700 (PDT)
Date: Tue, 13 May 2025 14:43:04 +0200
From: Max Krummenacher <max.oss.09@gmail.com>
To: Jayesh Choudhary <j-choudhary@ti.com>
Cc: Doug Anderson <dianders@chromium.org>, max.krummenacher@toradex.com,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	David Airlie <airlied@gmail.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] drm/bridge: ti-sn65dsi86: Use HPD in a DP use case
Message-ID: <aCM-WPobRYwUP7RC@toolbox>
References: <20250501074805.3069311-1-max.oss.09@gmail.com>
 <CAD=FV=W=NjbM9ZXLw7gH-_4CnpU7QU=sKCVQVxgmgP-Qpt-3hg@mail.gmail.com>
 <aBo8elFPYgPleK5n@toolbox>
 <68f0c5ef-ac51-4652-b829-2bc56c5a75c8@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <68f0c5ef-ac51-4652-b829-2bc56c5a75c8@ti.com>

On Wed, May 07, 2025 at 03:45:52PM +0530, Jayesh Choudhary wrote:
> Hello Max,
> 
> On 06/05/25 22:14, Max Krummenacher wrote:
> > On Thu, May 01, 2025 at 08:38:15PM -0700, Doug Anderson wrote:
> > > Hi,
> > > 
> > > On Thu, May 1, 2025 at 12:48 AM <max.oss.09@gmail.com> wrote:
> > > > 
> > > > From: Max Krummenacher <max.krummenacher@toradex.com>
> > > > 
> > > > The bridge driver currently disables handling the hot plug input and
> > > > relies on a always connected eDP panel with fixed delays when the
> > > > panel is ready.
> > > 
> > > Not entirely correct. In some cases we don't have fixed delays and
> > > instead use a GPIO for HPD. That GPIO gets routed to the eDP panel
> > > code.
> > 
> > Will reword in a v2
> > 
> > > 
> > > 
> > > > If one uses the bridge for a regular display port monitor this
> > > > assumption is no longer true.
> > > > If used with a display port monitor change to keep the hot plug
> > > > detection functionality enabled and change to have the bridge working
> > > > during runtime suspend to be able to detect the connection state.
> > > > 
> > > > Note that if HPD_DISABLE is set the HPD bit always returns connected
> > > > independent of the actual state of the hot plug pin. Thus
> > > > currently bridge->detect() always returns connected.
> > > 
> > > If that's true, it feels like this needs:
> > > 
> > > Fixes: c312b0df3b13 ("drm/bridge: ti-sn65dsi86: Implement bridge
> > > connector operations for DP")
> > > 
> > > ...and it would be nice to get Laurent to confirm. Seems weird that he
> > > wouldn't have noticed that.
> > 
> > I retested by adding a print in ti_sn_bridge_detect().
> > With the HPD_DISABLE bit set the HPD_DEBOUNCED_STATE is always true
> > resulting in reporting always connected.
> > 
> > When one does not set the HPD_DISABLE bit and is in runtime suspend
> > (i.e. detect() enables the bridge with its call to
> > pm_runtime_get_sync() ) then the HPD_DEBOUNCED_STATE is only set
> > after the debounce time. As it is immediately read here detect()
> > always reports disconnected.
> > 
> 
> I have same observations on my end.
> 
> > > 
> > > 
> > > > Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> > > > 
> > > > ---
> > > > 
> > > >   drivers/gpu/drm/bridge/ti-sn65dsi86.c | 13 +++++++++++--
> > > >   1 file changed, 11 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > > > index 01d456b955ab..c7496bf142d1 100644
> > > > --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > > > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > > > @@ -333,9 +333,11 @@ static void ti_sn65dsi86_enable_comms(struct ti_sn65dsi86 *pdata)
> > > >           * If HPD somehow makes sense on some future panel we'll have to
> > > >           * change this to be conditional on someone specifying that HPD should
> > > >           * be used.
> > > > +        * Only disable HDP if used for eDP.
> > > >           */
> > > > -       regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG, HPD_DISABLE,
> > > > -                          HPD_DISABLE);
> > > > +       if (pdata->bridge.type == DRM_MODE_CONNECTOR_eDP)
> > > > +               regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG,
> > > > +                                  HPD_DISABLE, HPD_DISABLE);
> > > > 
> > > >          pdata->comms_enabled = true;
> > > > 
> > > > @@ -357,6 +359,10 @@ static int __maybe_unused ti_sn65dsi86_resume(struct device *dev)
> > > >          struct ti_sn65dsi86 *pdata = dev_get_drvdata(dev);
> > > >          int ret;
> > > > 
> > > > +       if (pdata->bridge.type == DRM_MODE_CONNECTOR_DisplayPort &&
> > > > +           pdata->comms_enabled)
> > > > +               return 0;
> > > > +
> > > 
> > > I don't understand this part of the patch. You're basically making
> > > suspend/resume a no-op for the DP case? I don't think that's right...
> > 
> > That is what I wanted to do as nothing else worked ...
> > Probably there are better solutions.
> > 
> > > 
> > > First, I don't _think_ you need it, right? ...since "detect" is
> > > already grabbing the pm_runtime reference this shouldn't be needed
> > > from a correctness point of view.
> > 
> > Correct, it shouldn't. However if the bridge is coming out of
> > powerup/reset then we have to wait the debounce time time to get the
> > current state of HPD. The bridge starts with disconnected and only
> > sets connected after it seen has the HPD pin at '1' for the debounce
> > time.
> > 
> > Adding a 400ms sleep would fix that.
> > 
> 
> 
> While adding this delay fixes the detect issue, it could lead to other
> problems.
> Detect hook is called every 10 sec and considering that, 400ms is a
> considerable amount of time. And it could cause performance issues like
> frame drops and glitches in display.
> 
> For 1920x1080@60fps resolution, when I run weston application, I see
> around ~24 frames being dropped every 10 sec with visual glitch in
> display. This seems consistent with 400ms delay for 60fps or 16.67ms per
> frame (24*16.67ms).
> 
> root@j784s4-evm:~# weston-simple-egl
> libEGL warning: MESA-LOADER: failed to open tidss:
> /usr/lib/dri/tidss_dri.so: cannot open shared object file: No such file or
> directory (search paths /usr/lib/dri, suffix _dri)
> 
> 276 frames in 5 seconds: 55.200001 fps
> 301 frames in 5 seconds: 60.200001 fps
> 277 frames in 5 seconds: 55.400002 fps
> 301 frames in 5 seconds: 60.200001 fps
> 277 frames in 5 seconds: 55.400002 fps
> 301 frames in 5 seconds: 60.200001 fps
> 277 frames in 5 seconds: 55.400002 fps
> 301 frames in 5 seconds: 60.200001 fps
> 277 frames in 5 seconds: 55.400002 fps
> 301 frames in 5 seconds: 60.200001 fps
> 277 frames in 5 seconds: 55.400002 fps
> 301 frames in 5 seconds: 60.200001 fps
> 278 frames in 5 seconds: 55.599998 fps
> ^Csimple-egl exiting
> root@j784s4-evm:~#
> 
> > > 
> > > Second, if you're looking to eventually make the interrupt work, I
> > > don't think this is the right first step. I think in previous
> > > discussions about this it was agreed that if we wanted the interrupt
> > > to work then we should just do a "pm_runtime_get_sync()" before
> > > enabling the interrupt and then a "pm_runtime_put()" after disabling
> > > it. That'll keep things from suspending.
> > 
> > The HW I use doesn't has the interrupt pin connected. So for me that is
> > out of scope but should of course work.
> > 
> > > 
> > > Does that sound correct, or did I goof up on anything?
> > 
> > If I remove disabling suspend/resume and fix detect() to report the
> > 'correct' HPD state in both runtime pm states I now get another issue
> > after disconnecting and then reconnecting the monitor:
> > 
> > [   50.035964] ti_sn65dsi86 3-002c: [drm:ti_sn_bridge_atomic_enable [ti_sn65dsi86]] *ERROR* Can't read lane count (-110); assuming 4
> > [   50.212976] ti_sn65dsi86 3-002c: [drm:ti_sn_bridge_atomic_enable [ti_sn65dsi86]] *ERROR* Can't read eDP rev (-110), assuming 1.1
> > [   50.389802] ti_sn65dsi86 3-002c: [drm:ti_sn_bridge_atomic_enable [ti_sn65dsi86]] *ERROR* Can't read max rate (-110); assuming 5.4 GHz
> > [   50.686572] ti_sn65dsi86 3-002c: [drm:ti_sn_bridge_atomic_enable [ti_sn65dsi86]] *ERROR* Link training failed, link is off (-5)
> > 
> > monitor stays black without signals.
> > 
> > So it seems the bridges internal state is not completely restored by
> > the current code. Looking into that now.
> > 
> 
> I have seen such link training failures occasionally when the
> display connector is not connected but the state is not reflected
> correctly.
> Maybe it could be attributed to long polling duration???
> Are you observing it even on re-runs?

I think it is caused by the used hardware allowing to control the enable
signal but not controlling the power supplies.
If that is really true I have yet to find out.

> 
> 
> > > -Doug
> > 
> > Regards
> > Max
> 
> 
> Warm Regards,
> Jayesh

In my opinion we should drop this patch in favour of Jayesh's V2 [1].
I will comment there.

Regards
Max

[1] https://lore.kernel.org/all/20250508115433.449102-1-j-choudhary@ti.com/
