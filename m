Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDDF928BA83
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 13:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747919656; cv=none; b=mAHKuZC7D28ccGBuLyw0AErcqmirDEydvF7YTrUErgnWBVwtcap4wh8wwgvPdnvJonurAE9kwgCuLkTqzUYQNEDTKEi9S10bxX9e00Xvu8G6d/1eYgVb7CBUNE0SGAu63zpHjx+mbSzm0lbe5yX8uH1tVRQshmu6A3wWzI0+oKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747919656; c=relaxed/simple;
	bh=JzT+5qmEbnEDOhkXgbRtevT7dgzQoJoN4mLkw2Za3GU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j35rq2jO7Iun78hcjCYKILA/n5FASgXlDGzw5v7vzv9dJ4bYdgAwJyL5NWfCUTetaDnxhfgFSDEcJCWPOn+l/fc+NzaY9v8DwPTOSPmsCAYgB3FadSnhKiHjIPX00b7NJOHCg8X0pK1nu3sB3SG6ZW1LtKIUxx2tGg5Ho9e+zkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZpIPiPnc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZpIPiPnc"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M7MQZi020585
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 13:14:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cHG/SgxMi3oa6P3Q/bDEut732xB9dlPlOoJPYxKUmKU=; b=ZpIPiPncn57n2+9R
	OlN3Z+S9ZWfWqwrIXqEGCI7K5lYPuXgZaFQTGKGWncTkUV9PuCr2VJTejWZjW6bG
	9srjJY6PqL+DondgPoL0fkxGOG6kglXC7a4zZzUXwFhmiXdgQkZCIinP3n+41aJ+
	RHeMF9WI70mYUmXH4VPrMSsaFWAFcDg0zCNDmTG7ucPQn1TVPu/o98MS12pUHLxv
	5Puw1xMT7kRNGqhTg8ag5LmzQgHldfPbDY4zQz7otFKeIL87zRuGpHp9ZDV3vY4G
	CgebFaINB1lCxS3fwHmaf0d41OGhqWus1jtoxzuZWr5LG4ib1c/B5/IdokYAgsA8
	+RXDwg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s9pb4sbm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 13:14:12 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f8d4461e7bso49720536d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 06:14:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747919651; x=1748524451;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cHG/SgxMi3oa6P3Q/bDEut732xB9dlPlOoJPYxKUmKU=;
        b=nmeomdkDhUw6xIFgO4+stqBk1I0ndHQN1JPyt/s1kC5lwdTXnc3rU4T859QRNbv+tx
         rjyOMVjMOpPRciUqvnoDPep9xNxOaPTVMIlsde3bsRnUctD7CssA0IaJnZhAz/IjkCBj
         QvT9c97k77OY9CicQzcwzGwm6NLB0IZ/guCsahip6DLKObf7QdVZtOFSd79eB5dbVeKj
         1fVLVjH+Fdo5+K3t76+zwYp10GheNcHJ4umHvduUWYFIDC5ZV8YQaCyD6hatjxgbU+DU
         te9gkGptlfQNe9yvLzY9waqydwP7LbKLJVfDGGeZln6ru5rovFADgjeAsOcehikgPgtc
         KJPA==
X-Forwarded-Encrypted: i=1; AJvYcCX9xA+UxrBzBrdDoDBJCEkj0rQGLdfpFk9ElCCOis5pVuUNL+9JWF+I0t5j7RYKssfV8+pWcD8YkXjvQPE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0+rpdE/UpY0u5AMSpIMZgKB7loa3HxQr+pnBxt1FSKFDIQ6S5
	ZEEQsRsHg4xOB63L1x4yqyJuvXwQzTxQ+PsPccMV3iCU1TlFUUpnhDFyhOEC6q8nOobsPzIlRaV
	H1t7fr4x6OpW2NkXVvU2vZhfd0oRNrixRWJUIWdLOPm+lVppeTLJkvVNG7XeZd7DRFtE=
X-Gm-Gg: ASbGncsWJAgmpExmi+prbQnI7r4OdthUbt/asl7jBuJRZ/HUKy6krJAgmluh8gQJhcx
	CbVdSfwYdARE13UoPSSxqxX051Blp43KhSFcPxxayYNCwxO50t5+sVqq/YmGrcBK1zXQ6Fd4POl
	Kj6B1G8SN7bRVwIj7EHr/9GJH1EoYMqHRqxhy30Lm6wlo3ZWsf0akwxHZxhwmSKrTC90juTzC2u
	d29UTPoRo2DkHbfuGAWmGSeDq7bwVMt5H9Y6/xL7RBj3z0i2guMgaCm4ynnqz88NlWWYxdlZ75g
	ytaSbYYIk5+Pi69EVlSth2UzwDTX0sr666CkPG6/HdfLN8nD7HYSeGwl8XX+ChCvwYdyRU6zlCY
	=
X-Received: by 2002:a05:6214:c68:b0:6ea:d033:2853 with SMTP id 6a1803df08f44-6f8b0893f5emr409115236d6.16.1747919651216;
        Thu, 22 May 2025 06:14:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJaT9vIU6lEC2EHkfSU8H8PngKanzClUBBmQT9BP7n8XjOM+NYyXnmAucTS28a1j1VfaKGBQ==
X-Received: by 2002:a05:6214:c68:b0:6ea:d033:2853 with SMTP id 6a1803df08f44-6f8b0893f5emr409114776d6.16.1747919650722;
        Thu, 22 May 2025 06:14:10 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328085d0dafsm32851611fa.109.2025.05.22.06.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 06:14:09 -0700 (PDT)
Date: Thu, 22 May 2025 16:14:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Doug Anderson <dianders@chromium.org>
Cc: Jayesh Choudhary <j-choudhary@ti.com>, andrzej.hajda@intel.com,
        neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, dri-devel@lists.freedesktop.org,
        tomi.valkeinen@ideasonboard.com, max.krummenacher@toradex.com,
        jonas@kwiboo.se, jernej.skrabec@gmail.com,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
        kieran.bingham+renesas@ideasonboard.com, linux-kernel@vger.kernel.org,
        max.oss.09@gmail.com, devarsht@ti.com
Subject: Re: [PATCH v2] drm/bridge: ti-sn65dsi86: Add HPD for DisplayPort
 connector type
Message-ID: <cr7int6r6lnpgdyvhhqccccuyrh7ltw5qzh7kj5upznhea4pfh@rn6rwlf7ynqt>
References: <20250508115433.449102-1-j-choudhary@ti.com>
 <CAD=FV=V1mNX-WidTAaENH66-2ExN=F_ovuX818uQGfc+Gsym1Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=V1mNX-WidTAaENH66-2ExN=F_ovuX818uQGfc+Gsym1Q@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=WJl/XmsR c=1 sm=1 tr=0 ts=682f2324 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=sozttTNsAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=m8ToADvmAAAA:8 a=PSi6YmJ-gjCoPkDBYnYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=kCrBFHLFDAq2jDEeoMj9:22
X-Proofpoint-ORIG-GUID: OmxaH1rbwwlFDUGRof7JI1mftavKCLqN
X-Proofpoint-GUID: OmxaH1rbwwlFDUGRof7JI1mftavKCLqN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDEzNCBTYWx0ZWRfXybJMwxTQDkdp
 BouFppCwt4bzkO26t7NrGs5ZS3zNQquFPP7m+RVYfIpbm9fWOUYApmYGv0+ZNxy3CVPcLjdTpol
 Ryb2vRbFodHY7Pat6vjR3EfpOVEp6Mi2Y1xQBpaf3/ssKzbKRpwQ5NJPyncwgsg6YLh6sT9+j6x
 hgTkSP9xV74XTgvaStwO3ei9NnOMM/Oi8obDF1Y8r13Iejd2DGWXRi1mbJTzVWghJH5UE8YepMG
 vvsJ9tghjn48LyLcitRrBSZQbBjpOJqLOWnqqfUzsfhYaIzI9B5XWZi78vrPeWYmSIEnbxRIOLl
 p8rK4PXI8pIwd14fsjfRqhg8pUUMZHrpSENNwDa4InfgEOJtTq3fWKE/MHVVln8IJ54jjz+DRoi
 z7uuKGlJJBQ+spYgdMGRGVG3ZQmAQplV+o5Qgsx9wzBdmZnZLIeV+w9fiBQfSJuM2CIWZzcq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 mlxscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220134

On Wed, May 21, 2025 at 06:10:59PM -0700, Doug Anderson wrote:
> Hi,
> 
> On Thu, May 8, 2025 at 4:54 AM Jayesh Choudhary <j-choudhary@ti.com> wrote:
> >
> > By default, HPD was disabled on SN65DSI86 bridge. When the driver was
> > added (commit "a095f15c00e27"), the HPD_DISABLE bit was set in pre-enable
> > call which was moved to other function calls subsequently.
> > Later on, commit "c312b0df3b13" added detect utility for DP mode. But with
> > HPD_DISABLE bit set, all the HPD events are disabled[0] and the debounced
> > state always return 1 (always connected state)
> >
> > Also, with the suspend and resume calls before every register access, the
> > bridge starts with disconnected state and the HPD state is reflected
> > correctly only after debounce time (400ms). However, adding this delay
> > in the detect function causes frame drop and visible glitch in display.
> >
> > So to get the detect utility working properly for DP mode without any
> > performance issues in display, instead of reading HPD state from the
> > register, rely on aux communication. Use 'drm_dp_dpcd_read_link_status'
> > to find if we have something connected at the sink.
> >
> > [0]: <https://www.ti.com/lit/gpn/SN65DSI86> (Pg. 32)
> >
> > Fixes: c312b0df3b13 ("drm/bridge: ti-sn65dsi86: Implement bridge connector operations for DP")
> > Cc: Max Krummenacher <max.krummenacher@toradex.com>
> > Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> > ---
> >
> > v1 patch link which was sent as RFC:
> > <https://patchwork.kernel.org/project/dri-devel/patch/20250424105432.255309-1-j-choudhary@ti.com/>
> >
> > Changelog v1->v2:
> > - Drop additional property in bindings and use conditional.
> > - Instead of register read for HPD state, use dpcd read which returns 0
> >   for success and error codes for no connection
> > - Add relevant history for the required change in commit message
> > - Drop RFC subject-prefix in v2 as v2 is in better state after discussion
> >   in v1 and Max's mail thread
> > - Add "Cc:" tag
> >
> > This approach does not make suspend/resume no-op and no additional
> > delay needs to be added in the detect hook which causes frame drops.
> >
> > Here, I am adding conditional to HPD_DISABLE bit even when we are
> > not using the register read to get HPD state. This is to prevent
> > unnecessary register updates in every resume call.
> > (It was adding to latency and leading to ~2-3 frame drop every 10 sec)
> >
> > Tested and verified on TI's J784S4-EVM platform:
> > - Display comes up
> > - Detect utility works with a couple of seconds latency.
> >   But I guess without interrupt support, this is acceptable.
> > - No frame-drop observed
> >
> > Discussion thread for Max's patch:
> > <https://patchwork.kernel.org/project/dri-devel/patch/20250501074805.3069311-1-max.oss.09@gmail.com/>
> >
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 17 ++++++++++-------
> >  1 file changed, 10 insertions(+), 7 deletions(-)
> 
> Sorry for the delay in responding. Things got a little crazy over the
> last few weeks.
> 
> 
> > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > index 60224f476e1d..9489e78b6da3 100644
> > --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > @@ -352,8 +352,10 @@ static void ti_sn65dsi86_enable_comms(struct ti_sn65dsi86 *pdata,
> >          * change this to be conditional on someone specifying that HPD should
> >          * be used.
> >          */
> > -       regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG, HPD_DISABLE,
> > -                          HPD_DISABLE);
> > +
> > +       if (pdata->bridge.type == DRM_MODE_CONNECTOR_eDP)
> > +               regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG, HPD_DISABLE,
> > +                                  HPD_DISABLE);
> 
> Given your an Max's testing, I'm totally on-board with the above.
> 
> >
> >         pdata->comms_enabled = true;
> >
> > @@ -1194,13 +1196,14 @@ static enum drm_connector_status ti_sn_bridge_detect(struct drm_bridge *bridge)
> >  {
> >         struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
> >         int val = 0;
> > +       u8 link_status[DP_LINK_STATUS_SIZE];
> >
> > -       pm_runtime_get_sync(pdata->dev);
> > -       regmap_read(pdata->regmap, SN_HPD_DISABLE_REG, &val);
> > -       pm_runtime_put_autosuspend(pdata->dev);
> > +       val = drm_dp_dpcd_read_link_status(&pdata->aux, link_status);
> >
> > -       return val & HPD_DEBOUNCED_STATE ? connector_status_connected
> > -                                        : connector_status_disconnected;
> > +       if (val < 0)
> > +               return connector_status_disconnected;
> > +       else
> > +               return connector_status_connected;
> 
> I'd really rather not do this. It took me a little while to realize
> why this was working and also not being slow like your 400ms delay
> was. I believe that each time you do the AUX transfer it grabs a
> pm_runtime reference and then puts it with "autosuspend". Then you're
> relying on the fact that detect is called often enough so that the
> autosuspend doesn't actually hit so the next time your function runs
> then it's fast. Is that accurate?
> 
> I'd rather see something like this in the bridge's probe (untested)
> 
>   if (pdata->bridge.type == DRM_MODE_CONNECTOR_DisplayPort) {
>     pdata->bridge.ops = DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_DETECT;
> 
>     /*
>      * In order for DRM_BRIDGE_OP_DETECT to work in a reasonable
>      * way we need to keep the bridge powered on all the time.
>      * The bridge takes hundreds of milliseconds to debounce HPD
>      * and we simply can't wait that amount of time in every call
>      * to detect.
>      */
>     pm_runtime_get_sync(pdata->dev);
>   }
> 
> ...obviously you'd also need to find the right times to undo this in
> error handling and in remove.

What about:
- keeping pm_runtime_get()/put_autosuspend() in detect, but..
- also adding .hpd_enable() / .hpd_disable() callbacks which would also
  get and put the runtime PM, making sure that there is no additional
  delay in .detect()?

> 
> Nicely, this would be the same type of solution needed for if we ever
> enabled interrupts.

-- 
With best wishes
Dmitry
