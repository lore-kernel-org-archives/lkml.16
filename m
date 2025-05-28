Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3465027C152
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 11:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748430474; cv=none; b=rOYqXWWZs5hXfYiPD3BIg6sirZdgEcSlg1u7g0BLd7ehcVXe3nt6unZZKJoZSz50hu/2SBm00uMRA5hNvRr/w++Pf7eE0ME18BPhc8EWgGcsNu9Zv0M1XzpXU/H8elRWNDsmRNblwmeKdv90LjKmqW3DaAZhi8eh4arkDDgu/mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748430474; c=relaxed/simple;
	bh=ghYy8sqCJqtEDiWnZ0BZ7VPjuKNUTO6bqNXeh8RiM7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p/aU8ZT4AfMsNu0KfXA+tPlCeqM3PqaxxkYji+9/4ZVud+1+KIQ3bkHrMnZSKV4BxWB2A4lx2VKtR0+rsywpoW5+Fdf0QmsahrutXwdS7zNUdxc9Azmq7ylw5wXkuRv2zhnITRBl1ZYhZGHDrU4TxvwG2T5+yJodNKUbzfOfu0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hxok0fwU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hxok0fwU"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54SAjNHI022931
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 11:07:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D8WpuQ4z3pWYP1aGEZ6fexz0zv3QDD0KxPYrrRS0jKY=; b=hxok0fwUKYHyqgaF
	/CxwSi9srpnet+dHeCqfwJYoa44OPXub9pJQnpBF6pH7hemiksssoD1WHOtnampL
	h6tV2uVwbyHxY5MkP7PifAHSNplrN47zqhwUV1zadU54X6I+VrImswkfJzIkL9T2
	YQu5uiWfm1fGKXgAStHTL0nJwXi4rVds4D5TNXLe/T6SbwVO74D32+L5IPxzah6G
	Y/6ecMS7hL3axuhihN3/bgcLcRE7GqMG/2DLedtbapFdvuA59OTzinArawH4ka08
	i5gr3+YPblbBDBWepOQbP0WUaDAUAvQ+qcYftjMp0OghiS3fytoansb/DbIoMUh7
	dwKG6w==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u3fqa64k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 11:07:51 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6faa57b2d99so12045966d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 04:07:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748430471; x=1749035271;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D8WpuQ4z3pWYP1aGEZ6fexz0zv3QDD0KxPYrrRS0jKY=;
        b=lHp6XHK4kXSJ4Ruor0m4B2R2AqpcdP9ADg3nfm0iaonhUbvxoq7ytFQs89tTgvEaXn
         sZhEMf+hU1mdMMCJUb2z0oWbdMcaS2XJ+7K2lwjvk2vP3ZOjy34JdfdRdu1lEhsSTwrj
         GSxqZ2YnJzR3zkpUXog9kD6YeAbSqB3YQOm8yWD2TM0Qi0eiLR8grZrDvYrlm+CI4uYA
         koq7rgujTmC+F+OemphOihacdXDfa4CGFDdmncRq5n+QAADStVebmP+R08AP+5z00GSQ
         4eENpk+w5nfaBOcuxYQLZ+sm01EKK/ScTbNnbO9TTfXbKR7fyGVWrdVaqh6vvGeWuvzo
         GfKA==
X-Forwarded-Encrypted: i=1; AJvYcCVVoc2S18HRF+hUjdu6sCm4Zv5uJ3qsTdYydq8XZFNvOmdqq9yeEgRLfC63cF3QQo2ryky5ZJzIZR7HQyE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/7c+lmGxCEBJmEPs9Ovhixcp6pYql7lWdsNTB/vxQzlzXtl/R
	atr2YV/wQ7kJ0Zw4Cmv797pQ6ii5TNuxLHjqAq/OYsMHZNvK33BWrmqaw1bYloTv1Zk6K81m7i0
	y5D4qmoVhE/SPbcYJZ8wuz3BkCInOnVOdRyi7sOqwTqPBqMLNrJ3560H/H0ZCA/Vcga8=
X-Gm-Gg: ASbGncstIAoEVjHBaj8zRK501Mpj596mfQHeomAKAmM//MmUEiLJkw909MpAskNPZv7
	lFRUV0jU2UTWZsTR62smw81BM7IpjH44dtm4p/Nirsg/LRL537jlt1CUOTVRnfosu+Y7jN5i4jU
	YSzhQofkNjmxOpjCOcmg+7nOtDH/ad/803V+nZK4ILjTXFOOdx6/u8CNj47j9bMIGtPuQ5rDbOy
	g1Uuapmq3NdSZHCfnzQ9FEmXrWY7y2Pi+2bd9bq1EKX3s0JQIm25+v4aIN6rbW73BX6ZCQzEkbE
	Tc4QOCSxUz7uzgnTSHfKcx+K4oGx5ZKZOmr1TPbdXVfRtOovhxmHppvh+paTv5UOoTzaGeZf2kw
	=
X-Received: by 2002:a05:6214:2422:b0:6fa:a625:be55 with SMTP id 6a1803df08f44-6fab9ecddccmr63222126d6.15.1748430470859;
        Wed, 28 May 2025 04:07:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3N+HVkm9VwvY1zNDHNmVjPeGxDxlTJUsGdeqvp82kG6qhKdBelmIg9XgqUT65qlyM/G2bdg==
X-Received: by 2002:a05:6214:2422:b0:6fa:a625:be55 with SMTP id 6a1803df08f44-6fab9ecddccmr63221786d6.15.1748430470450;
        Wed, 28 May 2025 04:07:50 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532f61c6c3sm237126e87.35.2025.05.28.04.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 04:07:49 -0700 (PDT)
Date: Wed, 28 May 2025 14:07:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kornel =?utf-8?Q?Dul=C4=99ba?= <korneld@google.com>
Cc: Sebastian Reichel <sre@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, chromeos-krk-upstreaming@google.com
Subject: Re: [PATCH] power: supply: qcom_battmgr: Report battery capacity
Message-ID: <yjmzwk27uus36xwtumdgtmdkuyzqupq6enrkio4pa4g3t24cfu@wx5oqb66qryw>
References: <20250527121807.3597061-1-korneld@google.com>
 <oa5okg7i2s6s7pxm5tn6nnanazze5lnnre4vnwrhopn5s5hsil@vhh22j6b5cvq>
 <CACF_fqksF+whYbGEdSvJ=87FQH03EzO+hSSf8eRc8MitR2hzxA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACF_fqksF+whYbGEdSvJ=87FQH03EzO+hSSf8eRc8MitR2hzxA@mail.gmail.com>
X-Proofpoint-GUID: WXA7LPz_DuRMZU2_UL-oUtuQP_v3_9Mj
X-Proofpoint-ORIG-GUID: WXA7LPz_DuRMZU2_UL-oUtuQP_v3_9Mj
X-Authority-Analysis: v=2.4 cv=X8FSKHTe c=1 sm=1 tr=0 ts=6836ee87 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=1XWaLZrsAAAA:8
 a=3Nxteq1g8k0alZfMZ-AA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDA5NyBTYWx0ZWRfX+XjXrDMqGrdU
 XQ2mK7iNBz6j0LbhmkU6k6jsWpbh9BHBN+Qp68vt/PFQm9xj8HoU8Msq4mXNt4Iln+LcrTLteXF
 bIvMfzB36nfIWKt4hUx558wqqXEnDMKJFOzUkVMm+iHrBZ/H6qz6+G35G1R894Ol9XDjKXHwywB
 tknyFLXOTuAOosM3WwiS2d6AQVVIl7NwqZF16QjTWCJQ/xgKuEl1sWS46uZR0oym52nJBhFooR+
 JeXngn2WBDBDgbm7e6n2Zk7TEayEFdrEwcWJVs/qksFEXiG32FE9GdxKlpq3ipPSrEyjl5JE+vL
 T7a1pAnFr6kZu7Zja/VHZxVbSgwLVYmivO0l1kyqRdgGSliSDBwjvfSC4zSLv8xCCew+Tk8jKhj
 bmq4N0j2fH1RifOgD7InklGJohotQsHw3Ln9radgC5JfcQGs2teKrdMkwGrmRVSvqQxNVsyi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_05,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 mlxlogscore=999
 mlxscore=0 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505280097

On Wed, May 28, 2025 at 11:57:32AM +0200, Kornel Dulęba wrote:
> On Tue, May 27, 2025 at 9:34 PM 'Dmitry Baryshkov' via
> chromeos-krk-upstreaming <chromeos-krk-upstreaming@google.com> wrote:
> >
> > On Tue, May 27, 2025 at 12:18:07PM +0000, Kornel Dulęba wrote:
> > > Battery charge can be reported in several different ways. One of them is
> > > is charge percentage referred to as POWER_SUPPLY_PROP_CAPACITY in the
> > > power supply API. Currently the driver reports the capacity in this way
> > > on SM8350, but not on the newer variants referred to as SC8280XP in the
> > > driver. Although this is not a bug in itself, not reporting the
> > > percentage can confuse some userspace consumers.
> > > Mimic what is done in the ACPI driver (drivers/acpi/battery.c) and
> > > calculate the percentage capacity by dividing the current charge value
> > > by the full charge. Both values are expressed in either uWh, or
> > > in uAh.
> > >
> > > Signed-off-by: Kornel Dulęba <korneld@google.com>
> > > ---
> > >  drivers/power/supply/qcom_battmgr.c | 18 ++++++++++++++++++
> > >  1 file changed, 18 insertions(+)
> > >
> > > diff --git a/drivers/power/supply/qcom_battmgr.c b/drivers/power/supply/qcom_battmgr.c
> > > index fe27676fbc7c..5ed5452ab51c 100644
> > > --- a/drivers/power/supply/qcom_battmgr.c
> > > +++ b/drivers/power/supply/qcom_battmgr.c
> > > @@ -577,6 +577,8 @@ static int qcom_battmgr_bat_get_property(struct power_supply *psy,
> > >               val->intval = battmgr->status.capacity;
> > >               break;
> > >       case POWER_SUPPLY_PROP_CAPACITY:
> > > +             if (battmgr->status.percent == (unsigned int)-1)
> > > +                     return -ENODATA;
> > >               val->intval = battmgr->status.percent;
> > >               break;
> > >       case POWER_SUPPLY_PROP_TEMP:
> > > @@ -617,6 +619,7 @@ static const enum power_supply_property sc8280xp_bat_props[] = {
> > >       POWER_SUPPLY_PROP_STATUS,
> > >       POWER_SUPPLY_PROP_PRESENT,
> > >       POWER_SUPPLY_PROP_TECHNOLOGY,
> > > +     POWER_SUPPLY_PROP_CAPACITY,
> > >       POWER_SUPPLY_PROP_CYCLE_COUNT,
> > >       POWER_SUPPLY_PROP_VOLTAGE_MAX_DESIGN,
> > >       POWER_SUPPLY_PROP_VOLTAGE_NOW,
> > > @@ -1063,6 +1066,21 @@ static void qcom_battmgr_sc8280xp_callback(struct qcom_battmgr *battmgr,
> > >               battmgr->ac.online = source == BATTMGR_CHARGING_SOURCE_AC;
> > >               battmgr->usb.online = source == BATTMGR_CHARGING_SOURCE_USB;
> > >               battmgr->wireless.online = source == BATTMGR_CHARGING_SOURCE_WIRELESS;
> > > +             if (battmgr->info.last_full_capacity != 0) {
> > > +                     /*
> > > +                      * 100 * battmgr->status.capacity can overflow a 32bit
> > > +                      * unsigned integer. Do a temporary cast to avoid that.
> > > +                      */
> > > +                     battmgr->status.percent =
> > > +                             (uint64_t)100 * battmgr->status.capacity /
> > > +                             battmgr->info.last_full_capacity;
> >
> > Can you use mult_frac(), preventing the overflow?
> 
> Good idea, but I don't think mult_frac() helps in cases where the
> dividend is smaller than the divider. Let's look at the sources:
> #define mult_frac(x, n, d)      \
> (...)
>         typeof(x_) q = x_ / d_; \
>         typeof(x_) r = x_ % d_; \
>         q * n_ + r * n_ / d_;   \
> 
> Since in our case x_ < d_, q = 0 and r = x_ then r * n_ will still
> result in an overflow.
> 
> Unfortunately, the cast-and-divide approach won't work either. I
> received an email from a kernel test robot saying that this patch
> breaks a 32-bit only build. (">> ERROR: modpost: "__udivdi3"
> [drivers/power/supply/qcom_battmgr.ko] undefined!") See
> https://lore.kernel.org/oe-kbuild-all/202505280344.GjzOItSS-lkp@intel.com/
> for details.
> 
> I suppose I could just use a do_div with a temporary variable to work
> around that. I noticed that all data read from FW is multiplied by
> 1000, so I leveraged that instead:
> battmgr->status.percent =
>     (100 * le32_to_cpu(resp->status.capacity)) /
>       (battmgr->info.last_full_capacity / 1000);
> 
> Any thoughts?

LGTM.

> 
> >
> > > +             } else {
> > > +                     /*
> > > +                      * Let the sysfs handler know no data is available at
> > > +                      * this time.
> > > +                      */
> > > +                     battmgr->status.percent = (unsigned int)-1;
> > > +             }
> > >               break;
> > >       case BATTMGR_BAT_DISCHARGE_TIME:
> > >               battmgr->status.discharge_time = le32_to_cpu(resp->time);
> > > --
> > > 2.49.0.1151.ga128411c76-goog
> > >
> >
> > --
> > With best wishes
> > Dmitry
> >
> > --
> > You received this message because you are subscribed to the Google Groups "chromeos-krk-upstreaming" group.
> > To unsubscribe from this group and stop receiving emails from it, send an email to chromeos-krk-upstreaming+unsubscribe@google.com.
> > To view this discussion visit https://groups.google.com/a/google.com/d/msgid/chromeos-krk-upstreaming/oa5okg7i2s6s7pxm5tn6nnanazze5lnnre4vnwrhopn5s5hsil%40vhh22j6b5cvq.
> > For more options, visit https://groups.google.com/a/google.com/d/optout.

-- 
With best wishes
Dmitry
