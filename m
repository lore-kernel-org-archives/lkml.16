Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD362DFA29
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 15:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744731644; cv=none; b=F34C9ZBwIOezlFnVdEurNaeckbc5mXNyetqcoLVhX/BO0cfP876+oK+Kzzd6eNy3a263NTLWwK/OR2BPNjyodU3opUN/5rkZkyg4DQ3pK7aVfZRpS++RN7jUml17cquLjtQX7fwD7uCW4hXCXUK98jX1oFf10xG6kAWQy2EaDSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744731644; c=relaxed/simple;
	bh=sQ4NhkAhrAjekGxDT85Ef4gs5XNJvxq90q3R5AUE6Vw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tS6c3NlqoxdtAR7JV7It7CICzu5OP8jVsrPiMhwxGA6rWckxjrdtdPlS1O4FRdRtVyd/KYJivVVW40JoF8u20Ntj5CUO0PBZF5aUexVXUBhPlztsiM7uxlyqtQOi5BR0HuK7SHQP8Fg6NO+Hf1hPX/hCFcrKOuYC+LXBYybrUpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RF4sg4aC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RF4sg4aC"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tGV8005836
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 15:40:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TvsbKMJBpmWU9Gy3Y0GS4THdo3Ig1PNlDiHgAXD6ysI=; b=RF4sg4aChy3PJxPc
	GfLWHonRsMa9y0dObxrLE8mQk94hQxLdRjxeK0o4hA/zwNkfqJ5osSEsgVFrYfow
	RbMU0boNPn+wsCmU1ZnL3cL6pT3JutEUWkslRXycbCC3shKG+uxV4dK3Z9PzzDR3
	XUemYNSgEb8t2UBD7fXApfZ+ho4AMtrRy5FqBTC3W+IMN19hCEEtxyM2eW8FfTkW
	SZH0x6n5rD9cxmgseGUEbjVrPjOIT/sDp3xUMWecihjdn1QG7EqJFwG8b1w5sZ4v
	NBkgkjMFSbqeN6VEkRkInKmGnhapAWpz/x/ur0Dun/rpBPe+d2fL81rAD5rATbmU
	1A3GiQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ydvj8ry4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 15:40:41 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c0b0cf53f3so887495885a.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 08:40:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744731639; x=1745336439;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TvsbKMJBpmWU9Gy3Y0GS4THdo3Ig1PNlDiHgAXD6ysI=;
        b=OPJst8/L7qHwM1M+j1LsnxxRD8mB1JiHxN8LGR+CNKflmjzcUqqT0A4IKVinnQ3A7L
         I3+zvW+90UyXAbL4kr+fpoxXqnuCVeoYNGMToSWA0A1N9MAQROqJEhlVajtzvqcXeYJt
         Ev6ejXn+5L94boydBii1P3tI7SE3l3PE7DPGSvqCfOT3JTlllZ3XVOkvE+tiDVjvmqxy
         HsZhAP9o8/nUyEt4mRmZCi8apfqO5bpLc4qCyOjmtxJT29W0L/yzVKe9/mZfx/jV9KGw
         HJm1JP0GQ8ihqqRh1Xg5tPKr+n9yLCEsrVMQIKTdVmKUGyipq52wPKCw51GBp6FgpAzp
         35vw==
X-Forwarded-Encrypted: i=1; AJvYcCVBlcBi14K9+c1ESiJ9nCF9hCM2SieLwv00Kwx3XKfT6IqHzPydWAUsQyNSnfKYgdmeCpPZMZJE4JqFgVM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoFzDDS+FZDr1VVilQ2vDmW5h07ueZlayTMML27PexFOxXihqS
	fTBlwgbEIvrlrgnSWSBm7/n0GW7nKuPN6jf+Q5IEaC9C/UFjo9bXA8+8s/IL2R/0zhEL56996sL
	YcU6rSvHFbKiSXzMfF/OD+x23DdOgya37SWsY0T+kX9eVsKuJQwNX1lKY89Lgb64=
X-Gm-Gg: ASbGncuE4De6BUwvy/mNN1oJqoexv6Jc0w0SGs/U7iKeiBXA8d6euX3wQM7pRk7EkcP
	fUXCEr30SD7Sf21hEpw2KpA628792cHP9kYXRyB1H8GGrTjtAmqgAB4udY7PoQH2Mh7hfdUBwnL
	LWeXttKiH6LSxd5TrTTtzCfbXZGO/IhDbn0vU1hnzqrptWranhrbD0Pun6DDApTmFmTQYBIt+0N
	iF+O6sWPEnUqffK9ksHpC0hit6J2K5TIVekQ6IRnkbK877CRVzEn/rwT5vsysVST6XrAEp7PSvD
	rSJAIazVfVsuqbEgke0mBA8zZiv0ics3oYl0qffWpCgmTEr4vpHa4IczxFHwi84H9wYWuCVu2p0
	=
X-Received: by 2002:a05:620a:bc7:b0:7c5:4eee:5409 with SMTP id af79cd13be357-7c7af20b523mr2963057785a.48.1744731639316;
        Tue, 15 Apr 2025 08:40:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFIlDmfruBGj7pykRXnSYpJRnmmYhMCtl1pbj9EbNevltWmRkwXYeaUZlWLtMO/C94LNdH2jw==
X-Received: by 2002:a05:620a:bc7:b0:7c5:4eee:5409 with SMTP id af79cd13be357-7c7af20b523mr2963050285a.48.1744731638748;
        Tue, 15 Apr 2025 08:40:38 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d52019fsm1461323e87.221.2025.04.15.08.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 08:40:37 -0700 (PDT)
Date: Tue, 15 Apr 2025 18:40:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Doug Anderson <dianders@chromium.org>, Dmitry Baryshkov <lumag@kernel.org>,
        Harikrishna Shenoy <a0512644@ti.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Harikrishna Shenoy <h-shenoy@ti.com>, andrzej.hajda@intel.com,
        neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, simona@ffwll.ch,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, jani.nikula@intel.com, j-choudhary@ti.com,
        sui.jingfeng@linux.dev, viro@zeniv.linux.org.uk, r-ravikumar@ti.com,
        sjakhade@cadence.com, yamonkar@cadence.com,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: drm/bridge: Add no-hpd property
Message-ID: <ymsrdrq3l6ws57gpwyuggc5ohapctxrozbmgs3zn6m7ovffnkm@s5rsp6qirw3t>
References: <20250205115025.3133487-1-h-shenoy@ti.com>
 <20250205115025.3133487-2-h-shenoy@ti.com>
 <efd89cf8-2f83-44fd-8bdf-aa348d4d9659@kernel.org>
 <h24gpx6cxm4s6gzcunjnswubtvqask5dewi3udulmntsuieklm@w3pw4ig3t7gm>
 <de0cb22d-d251-4b0b-8fc7-e8b5a891a527@ti.com>
 <vfg6hlkzmqahbswgyctzuuzcdm2aend6wmo3uci4qs74jasjtc@3hlox276hazj>
 <673e79bc-53c9-4772-ad18-8c00e4036905@ideasonboard.com>
 <CAD=FV=W45V-AZdbo4MBfZ-A9M4vf42Lda82s8iUoW5azVwM0hA@mail.gmail.com>
 <c0b2e2cb-eb31-4b49-a28b-295c0389de89@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c0b2e2cb-eb31-4b49-a28b-295c0389de89@ideasonboard.com>
X-Authority-Analysis: v=2.4 cv=ZIrXmW7b c=1 sm=1 tr=0 ts=67fe7df9 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8 a=P1BnusSwAAAA:8 a=zIdDu-cFAM1O8onSnkAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-GUID: fQht4qzdwS5-21BrbLMlW-bqozsklgC-
X-Proofpoint-ORIG-GUID: fQht4qzdwS5-21BrbLMlW-bqozsklgC-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_06,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0 mlxlogscore=999
 spamscore=0 impostorscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150110

On Tue, Apr 15, 2025 at 03:50:46PM +0300, Tomi Valkeinen wrote:
> Hi,
> 
> On 18/03/2025 21:51, Doug Anderson wrote:
> > Hi,
> > 
> > On Tue, Mar 18, 2025 at 8:50 AM Tomi Valkeinen
> > <tomi.valkeinen@ideasonboard.com> wrote:
> > > 
> > > Hi,
> > > 
> > > On 12/03/2025 14:52, Dmitry Baryshkov wrote:
> > > > On Wed, Mar 12, 2025 at 11:56:41AM +0530, Harikrishna Shenoy wrote:
> > > > > 
> > > > > 
> > > > > On 05/02/25 19:03, Dmitry Baryshkov wrote:
> > > > > > On Wed, Feb 05, 2025 at 12:52:52PM +0100, Krzysztof Kozlowski wrote:
> > > > > > > On 05/02/2025 12:50, Harikrishna Shenoy wrote:
> > > > > > > > From: Rahul T R <r-ravikumar@ti.com>
> > > > > > > > 
> > > > > > > > The mhdp bridge can work without its HPD pin hooked up to the connector,
> > > > > > > > but the current bridge driver throws an error when hpd line is not
> > > > > > > > connected to the connector. For such cases, we need an indication for
> > > > > > > > no-hpd, using which we can bypass the hpd detection and instead use the
> > > > > > > > auxiliary channels connected to the DP connector to confirm the
> > > > > > > > connection.
> > > > > > > > So add no-hpd property to the bindings, to disable hpd when not
> > > > > > > > connected or unusable due to DP0-HPD not connected to correct HPD
> > > > > > > > pin on SOC like in case of J721S2.
> > > > > > > > 
> > > > > > > > Signed-off-by: Rahul T R <r-ravikumar@ti.com>
> > > > > > > 
> > > > > > > Why are you sending over and over the same? You already got feedback.
> > > > > > > Then you send v2. You got the same feedback.
> > > > > > > 
> > > > > > > Now you send v3?
> > > > > > > 
> > > > > > > So the same feedback, but this time: NAK
> > 
> > I only spent a few minutes on it, but I couldn't find a v2. If there's
> > a link I'm happy to read it, but otherwise all my comments below are
> > without any context from prior verisons...
> 
> There was a link in the intro letter, although it seems to point to a reply
> to the v2 thread... Here's v2 intro letter:
> 
> https://lore.kernel.org/all/20230405142440.191939-1-j-choudhary@ti.com/
> 
> > > > > > Krzysztof's email forced me to take a look at the actual boards that you
> > > > > > are trying to enable. I couldn't stop by notice that the HPD signal
> > > > > > _is_ connected to a GPIO pin. Please stop hacking the bridge driver and
> > > > > > use the tools that are already provided to you: add the HPD pin to the
> > > > > > dp-controller device node. And then fix any possible issues coming from
> > > > > > the bridge driver not being able to handle HPD signals being delivered
> > > > > > by the DRM framework via the .hpd_notify() callback.
> > > > > > 
> > > > > > TL;DR: also a NAK from my side, add HPD gpio to dp-controller.
> > > > > > 
> > > > > We tried implementing a interrupt based HPD functionality as HPD signal is
> > > > > connected to GPIO0_18 pin, we were able to get interrupt based HPD working
> > > > > however to route this signal to SoC we are loosing audio capability due to
> > > > > MUX conflict. Due to board level limitations to
> > > > > route the signal to SoC, we will not be able to support interrupt
> > > > > based HPD and polling seems a possible way without loosing on audio
> > > > > capability.
> > > > 
> > > > Still NAK for the no-hpd property. HPD pin is a requirement for
> > > > DisplayPort to work, as it is used e.g. for the 'attention' IRQs being
> > > > sent by the DP sink. I'm not sure what kind of idea you HW engineers had
> > > > in mind.
> > > 
> > > It's true that for normal DP functionality the HPD is required, but
> > > afaik DP works "fine" without HPD too. This is not the first board that
> > > has DP connector, but doesn't have HPD, that I have seen or worked on.
> > > Polling can be used for the IRQs too.
> > 
> > I have less familiarity with DP than with eDP, but from what I know
> > I'd agree with Tomi here that it would probably work "fine" by some
> > definition of "fine". As Dmitry says, the "attention" IRQ wouldn't
> > work, but as I understand it that's not really part of the normal flow
> > of using DP. As evidence, some people have made "ti-sn65dsi86" (which
> > is supposed to be for eDP only) work with DP. While the ti-sn65dsi86
> > hardware _does_ support HPD, because of the forced (slow) debouncing
> > it turned out not to be terribly useful for eDP and we designed our
> > boards to route HPD to a GPIO. ...and because of that nobody ever
> > wrote the code to handle the "attention" IRQ. Apparently people are
> > still using this bridge w/ some success on DP monitors.
> > 
> > 
> > > For eDP HPD is optional, and some of the cases I've worked with involved
> > > a chip intended for eDP, but used with a full DP connector, and no HPD.
> > 
> > I definitely agree. The eDP spec explicitly states that HPD is
> > optional even though it's also documented to be an "attention" IRQ
> > there. We've hooked up large numbers of eDP panels and the lack of the
> > attention IRQ wasn't a problem.
> > 
> > 
> > > However, in this particular case the DP chip supports full DP, so it's
> > > just a board design error.
> > > 
> > > My question is, is J721s2 EVM something that's used widely? Or is it a
> > > rare board? If it's a rare one, maybe there's no point in solving this
> > > in upstream? But if it's widely used, I don't see why we wouldn't
> > > support it in upstream. The HW is broken, but we need to live with it.
> > > 
> > > Another question is, if eDP support is added to the cdns-mhdp driver,
> > > and used with a panel that doesn't have an HPD, how would that code look
> > > like? If that would be solved with a "no-hpd" property, identical to the
> > > one proposed in this series, then... There's even less reason to not
> > > support this.
> > > 
> > > Disclaimer: I didn't study the schematics, and I haven't thought or
> > > looked at how eDP is implemented in other drm drivers.
> > 
> > I spent lots of time working through this on ti-sn65dsi86. How it
> > works today (and how it's documented in the bindings) is that it's
> > possible to specify "no-hpd" on both the eDP panel node and on the
> > bridge chip. They mean different things.
> 
> As this text covers only eDP with Panel, I'll fill in some lines here about
> DP and HDMI connectors. I think we need to consider all the cases.
> 
> > The HPD-related properties that can be specified on the panel are
> > a) <nothing> - HPD hooked up to the bridge
> > b) no-hpd - HPD isn't hooked up at all
> > c) hpd-gpios - HPD is hooked up to a GPIO
> 
> For DP and HDMI connectors (dp-connector.yaml, hdmi-connector.yaml) we have
> only 'hpd-gpios'. There hasn't been need for no-hpd.
> 
> > The HPD-related properties that can be specified on ti-sn65dsi86 are:
> > a) <nothing> - HPD is hooked up to the bridge
> > b) no-hpd - HPD is not hooked up to the bridge
> 
> More generally speaking (also with HDMI), I think this is device specific.
> E.g. TFP410 doesn't have any kind of HPD support, so 'no-hpd' flag doesn't
> make sense. That said, probably most of the chips do have HPD support, and
> no-hpd is needed.

TFP410 has the EDGE/HTPLG pin, which should be used to monitor DVI /
HDMI hot plugging pin.

> 
> > NOTE: The "ti-sn65dsi86" controller needs to be programmed to ignore
> > its HPD line if HPD isn't hooked up. IIRC the hardware itself will not
> > transfer things over the AUX bus unless you either tell the controller
> > to ignore HPD or HPD is asserted.
> > 
> > 
> > Here are the combinations:
> > 
> > 1. Panel has no HPD-related properties, ti-sn65dsi86 has no
> > HPD-related properties
> > 
> > HPD is assumed to be hooked up to the dedicated HPD pin on the bridge.
> > Panel driver queries the bridge driver to know the status of HPD. In
> > Linux today ti-sn65dsi86 doesn't really implement this and the bridge
> > chip just has a big, fixed, non-optimized delay that tries to account
> > for the max delay any panel could need.
> 
> For the connector case, I don't think there's any assumption about HPD in
> this scenario. The connector does not handle the HPD, and it's up to the
> bridge to decide if it does something about it or not.

Hmm? display-connector definitely supports HPD for DVI, HDMI and DP
connectors.

> 
> > 2. Panel has "hpd-gpios", ti-sn65dsi86 has no HPD-related properties
> > 
> > In theory, I guess this would say that HPD goes _both_ to a GPIO and
> > to the HPD of the bridge. Maybe handy if the bridge doesn't provide a
> > "debounced" signal but still wants HPD hooked up to get the
> > "attention" IRQ?
> 
> Both the bridge and the panel handling HPD doesn't sound good to me...
> For the connector case, this case would mean that the connector driver
> handles the HPD, and the bridge doesn't. If the bridge has HPD support, I
> think it would make sense to disable it with 'no-hpd' property (i.e. this
> would then be case 5).

I'm not so sure. eDP / DP link has special meaning for HPD pin, so it
might be worth handling it on both sides. I can imaging the bridge
handling HPD pin to report attention IRQs, while GPIO is used for main
plug / unplug detection.

> 
> > 3. Panel has "no-hpd", ti-sn65dsi86 has no HPD-related properties
> > 
> > Doesn't really make sense. Says that panel should delay the max amount
> > but there's no good reason to do this if HPD is hooked up on
> > ti-sn65dsi86.
> 
> The connectors don't have no-hpd, so this doesn't apply there.

Connectors can simply skip the hpd-gpios property which should have the
same effect.

> 
> > 4. Panel has no HPD-related properties, ti-sn65dsi86 has "no-hpd"
> > 
> > Doesn't really make sense. Says that the panel should assume the
> > bridge has HPD hooked up but then the bridge doesn't.
> 
> For connectors, this would just mean no HPD at all connected (i.e. the case
> discussed in this series).

Same as above. Connectors don't require special handling for no HPD
case.

> 
> > 5. Panel has "hpd-gpios", ti-sn65dsi86 has "no-hpd"
> > 
> > This is the sc7180-trogdor config. Says the panel should use the GPIO
> > to read HPD for power sequencing purposes. Tells us that HPD is not
> > hooked up to the bridge chip so we should program the bridge chip to
> > ignore HPD.
> 
> For the connector case, this would be the same as 2, except the bridge
> requires disabling the HPD support via a property.

see above

> 
> > 6. Panel has "no-hpd", ti-sn65dsi86 has "no-hpd"
> > 
> > Says HPD is just not hooked up at all. panel-edp will delay for
> > "hpd-absent-delay-ms". Bridge chip should be programmed to tell the
> > hardware to ignore the HPD signal.
> 
> For connectors, this would be the same as 4.
> 
> > How we got there was fairly organic and quite a long time ago, but it
> > all sorta makes sense even if it is a bit convoluted.
> 
> I think it makes sense, and is quite similar for connectors.
> 
> Going back to this series, I think the no-hpd property makes sense to solve
> the TI issue.
> 
> However, my question about "is this needed in upstream" is still unanswered.
> If these boards are widely available, let's add this. If there are just a
> few boards here and there, with customers who anyway use TI BSP kernel, and
> the next revision of the board has the issue fixed, maybe it's not worth it?
> This change doesn't exactly make the driver cleaner or easier to maintain
> =).

I'd say, the driver needs some cleanup, if we are to land this patch.
I'd suggest to rework HPD enablement / disablement to use hpd_enable /
disable functions. Make no-hpd disable OP_HPD. Make actual detect / plug
handling tied to the hpd_notify callback, etc.

> 
>  Tomi
> 

-- 
With best wishes
Dmitry
