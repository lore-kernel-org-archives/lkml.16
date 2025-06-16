Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238A02DBF4E
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 13:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750078804; cv=none; b=iGlFyXp6XWF+4mKJ2pe7TCJOhwZyw4MMJF1dJVcBnh7w3iUOuNHNTq9ajAMXL+J6jEVZJC5Mp+9vaIssKZUar53m1HWSSvwzhGifNBcEqUfXPKdw7C39CZTCED8+qOhOjpVXhsjY2gC17Tb7jPluRMUIs2M/l3vPDHoFUqUAW2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750078804; c=relaxed/simple;
	bh=auZ0yWuSuNTN90Mbhfz0CZ6nReOk3BmOLC4d3+rrjQk=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F5NEW9DzuRut+vSRkpHwoOkFIq0d+ASxvjYe8IKXWT10atxoUnqBgUuankvc+V8C43SPdwZ+t32yVHWmSzLrj5RQRhB5BkaEmdbt8dmf+u0l0bFzjzIURE3EA+924k453I2rsy5ArPcknyeOUwaUdhaBN/9gO8ihNOt3Mjks/qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PJ8s8/G7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PJ8s8/G7"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G8Sqj4021521
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 13:00:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7Zpam38ASYSr7xQnoqo9VopR
	RvFRhEcoJAeLiKpm4U8=; b=PJ8s8/G7vuPYt/KKRBVtIMKfxA71IsdLGshcegsM
	/oBtRUcDi43m4HOJzcAtpvXvFP6qo7ebwaxc2ayZiPQ85I/sBGtrIDaE4NcVVnmi
	YuLmSFMzwIsgJeWH8f8d8CLTUa3mhYZGvJbv/1KcVkGCvjK2AxetiOFzBlw6uzwB
	7HpCDVKytPFZngwQOzK0Ut5ttHiCKMPIZBfne+TosxHsisHsCjX5co9zjvrSFOsT
	AVmRrOzPsQZNBKJLk1OlSMhizIvAnmNJ0iTs+UZwJO3g2J4SE6dHGI0BcvsvIjK9
	JAZTpyCLAwyUfaWbRxplBmUzVFsHHxayuQ5Pxp9UV1KWCQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791f74hkd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 13:00:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5f876bfe0so824210185a.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 06:00:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750078801; x=1750683601;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Zpam38ASYSr7xQnoqo9VopRRvFRhEcoJAeLiKpm4U8=;
        b=bH35U3T8S3J20lVDN4q1f4wHlLsqfKyNNN0KZ0o7WUX0iP2R745ndh4Iz6JBgZPRyq
         OgVTAfOSD4R4dzS6r1CUD1Lxa5eeuTwny0u6TOMAMrKDJuaUKOvA4Csu03jWJArrHBsj
         wWgddw8xdSgYx67vFe4ljYH67mtd0i952wYoPhQD0H5mDgOQQ7+Lymb7g4hgNOwxz1S/
         jDKR2p3U0rT3Jss1aEjyKXjZzY/FcQF4Fiq6oKIeCsDLjVPsioZuNgL+syjYG0kpEQaA
         0PiGy4zgpplYfve/QOee3nZOnmBHkkKM0iT17LRx1Uwn3I3TldBoYuh7lV5qJmCHXCN1
         gVlA==
X-Forwarded-Encrypted: i=1; AJvYcCW4DBGFXkM6KdKn3BSwwbAu8+SDQqo7RYgzeSfaP61tKEfv5jROo4B0P9YHNfSuNG/VgHvMuMTsSilf5sg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz26BAnYm79xiQ6KDFnhFl/tI5Gi3UnQmsIHwMlxUtdpNqHwu7a
	bCz5ik/n9f0BETVs0oSXkkgb1egUfQUao2rocLEqxSk7zkUR4hBSP+JdWhtZlXfK+/bL+SXelOS
	IwjUDYgoH2JwQqnBeJl6XwXr1i46YXoG89gTJU+WJkzok+aITByZ1ult+G1Vk5eAwhqY=
X-Gm-Gg: ASbGnctCg0DdEf5pBXjdl2Y7Qxm/7VX4bdAPotV6LKjYthovkbAce7uQ/CdL9ZB5JEf
	ZvPwAq1usBJv38NvNUULX5wYWKZZ29JcENa5MEXvpThVf6Yapdm1SoD2x9nLlESSBHpJzfm0KbL
	H0TNoVh3/3gOce9jg/uIX1iJgehQx3sl380webGsdAZP4iO+oaNlxqZqOe1MH8lbXy0cuXyyYu/
	n+Mr08NWU45oCzTrFrm0s17h8v5JUoVPVY0g2II9ehE5z9M2axBgYTCkHnMGfJaXT2A0LNYzU0l
	G9+vSmUDchRzCjtrTL/tbHxQFfUSGVzbPMov12bvi0e/FW+tYWULv91gZQ==
X-Received: by 2002:a05:620a:28d1:b0:7c5:95e6:ce1d with SMTP id af79cd13be357-7d3c6b813f9mr1342353985a.0.1750078800984;
        Mon, 16 Jun 2025 06:00:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFg4SDTgRhUH5YlbN1cKQ4MXmBOOryw7h3rYCkgqVUR9Af7Zp8Rwpz3qnCpmkW6bIWwziiMuw==
X-Received: by 2002:a05:620a:28d1:b0:7c5:95e6:ce1d with SMTP id af79cd13be357-7d3c6b813f9mr1342349885a.0.1750078800532;
        Mon, 16 Jun 2025 06:00:00 -0700 (PDT)
Received: from trex (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e2618f0sm142656695e9.37.2025.06.16.05.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 06:00:00 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Mon, 16 Jun 2025 14:59:58 +0200
To: Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        loic.poulain@oss.qualcomm.com, mchehab@kernel.org,
        hans.verkuil@cisco.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: venus: hfi: explicitly release IRQ during teardown
Message-ID: <aFAVTvsDc8xvwBme@trex>
References: <20250612082943.2753676-1-jorge.ramirez@oss.qualcomm.com>
 <54157ce5-8a6b-75ae-0a21-a8df59242c40@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54157ce5-8a6b-75ae-0a21-a8df59242c40@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDA4MCBTYWx0ZWRfX8NTP5J+lbuVB
 /cbFj7kwD+bIrrWM7ToAtkuWsTq8OrPa/X1antdoDzZp7udu0IIwcDc7LOoORtf/8gtKTjSOWlh
 wmEJ8GUcUiWFSQDBV5/+UWnBboIZiQDHBDURzG257vI2IW6Di09Se2XbyxV6zFLV9XiJoa1ClBw
 4CZhHR+BCXQgTxSfSd/NheJJR3bX8SwNoGLHDmfk1TmUrN0/LIoKkNZKJ2xcKWXp6rqxhoqteRL
 SLCbZ9V3IZ1AcuFjhz1g9SMXLB3yYtAFgZb2HPhaz3GUVh+jqcYxvYtqnVVVBV9QLeNfTffv4Pw
 Rpfompgg2iaaiN7mTX7WhK51x8ZOl8htvc3xzRzZha0SLMF4PCshvTXP66JYJ9v4rcn2zsvglBK
 9oXOZLV4Yvoq+079/tpAErLdPi/9jTTAnd6KN28TZ9Z97kyr+ycXlMc1LjSQqFozKf2AdwCs
X-Proofpoint-GUID: ZbxIRbES-DqsZJrFY3hMPRxod_Otb-_V
X-Proofpoint-ORIG-GUID: ZbxIRbES-DqsZJrFY3hMPRxod_Otb-_V
X-Authority-Analysis: v=2.4 cv=FrIF/3rq c=1 sm=1 tr=0 ts=68501551 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8
 a=5yDEq8l6dJnGzMHSUIgA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_05,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 mlxlogscore=949 bulkscore=0 impostorscore=0
 malwarescore=0 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506160080

On 16/06/25 17:26:24, Vikash Garodia wrote:
> 
> On 6/12/2025 1:59 PM, Jorge Ramirez-Ortiz wrote:
> > Ensure the IRQ is released before dismantling the ISR handler and
> > clearing related pointers.
> > 
> > This prevents any possibility of the interrupt triggering after the
> > handler context has been invalidated.
> > 
> > Fixes: d96d3f30c0f2 ("[media] media: venus: hfi: add Venus HFI files")
> > Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> > ---
> >  drivers/media/platform/qcom/venus/hfi_venus.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
> > index b5f2ea879950..d9d62d965bcf 100644
> > --- a/drivers/media/platform/qcom/venus/hfi_venus.c
> > +++ b/drivers/media/platform/qcom/venus/hfi_venus.c
> > @@ -1678,6 +1678,7 @@ void venus_hfi_destroy(struct venus_core *core)
> >  	venus_interface_queues_release(hdev);
> >  	mutex_destroy(&hdev->lock);
> >  	kfree(hdev);
> > +	devm_free_irq(core->dev, core->irq, core);
> Could you please check and add the handling here [1] as well ?
> 
> [1]
> https://elixir.bootlin.com/linux/v6.16-rc1/source/drivers/media/platform/qcom/venus/core.c#L427

hi Vikash, sorry I dont get your point - what do you mean?

> 
> Regards,
> Vikash
> >  	core->ops = NULL;
> >  }
> >  
