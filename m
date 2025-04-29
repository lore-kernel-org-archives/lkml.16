Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC34820FAA1
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 13:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745932082; cv=none; b=XUgnCaYfcmMVqLFOa+V9F/dNgmllFcqWbx4FQlTux29NnpZRiDfHMvz9wNi6B3xdKG7dgI58iZm523ODNkuAAs0Hk7xZpzMgXrNoSJ2+SK4RylF6qxzotDFG/9sfU2HcYcqso99706JqQHILk1fPcH1oRqg4Cse6/gWPEbPqu5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745932082; c=relaxed/simple;
	bh=ZOohWAutHYyLaTiVQ57fjkzaDbOE5XJKpPbXcT/tm5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AJ7pAkLS/sAKp8fuPAsGhcH+Ohbo033ecVZAeQuKHJlvLZsRFm4bhx2G47Y4WvYCplE2uUCqWxxtdusm7EVgQwTB5DVdhakpaSGJHsYnL5LzWNrjrc3xOpeRTFPwBqDvwWDOTzktOH32s8fGyXwOTWbbyFQKwphgcE87mKD8V4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IoMznvEv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IoMznvEv"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TA2FAA020034
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 13:08:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3iycI3ZTNsOLa0MGqAVtc71f
	WejZqL8jSxO6Snm5fiY=; b=IoMznvEvvdlStb0Rbk11LLtBu7NMG2nowZ2iwo4B
	fSEf08qftmKZKeH+PHWsH34CVZjWvTGK7iytfGpnB984TB2Kukc1An41CckNTid3
	Jzg2sneWcJCzRuujj+2RNmczljMozW0lvIn9wweC9lytef2jsgUp6UfNSaaiEOux
	60pQeVIFuygGzFVuXwMy+eKzeKmTRy1vHWD+NEXKfxsuy/go2sFHit33kqG8l2bf
	tOaLec4r3VhhVNDl8aGRO2JYpKF6K9YfgGPUq4PbAwOccwrejy40BnFLnnezIE7Y
	1g8ZnCuy0Qu89+QTHu+pMU5XvEHn/GkfQOGkDKk6+0Vzyg==
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468r8huhwr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 13:07:59 +0000 (GMT)
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3d81bc8ebc8so55230875ab.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:07:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745932079; x=1746536879;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3iycI3ZTNsOLa0MGqAVtc71fWejZqL8jSxO6Snm5fiY=;
        b=rP8gO70lOVGEHj8I1X88DkZFd+/ojtZ+fMnpxYjq5/PLUB/aIMfyiVGjZaYGsNVwkO
         9q+lHvqNfi455Nf3cllc9ex4fiUmL18HGo88HUv/czYWntFuKm17TofW2N6pCP+hso4I
         /3oC7V+jq9UxHO84CEoPcK25H/rHNHBy9ihyjbQCbo4i2TagfdBMBDJCm7r3/uRiSTsL
         Q4tFIv4dTqUhlZQqMTfOIXaLTkBkr+8O538jrySkQWgtaJ5wCnSAEca5H6dR70pOsBsS
         4Q6W0LRiA7snrGCVJ3fYATJCiLJlku6lnMvG10FbxJuhBV42+wNFGL7HrSb2kDgSo1Dq
         QOWg==
X-Forwarded-Encrypted: i=1; AJvYcCXcugEnrsKWQ6414u4ZylwyManVNcwwQJAJAe0rr1PBjb0CAsWP7Zh/nWHEzUB/ngyPGMoFP2D53q9JznI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUpJwUp5BmoS8zwnTLk/dqjbqbsuDrWJ8GKM6pmy0a1+CGAMVj
	9q0lCtnLJ9s5FHHNM15rbomrQZhi0e4TNQasIX3B7nFsa1w+7pJbLKHilYlc1HvVlhyxMMfh1YM
	lVSfByZIRbdAE3Oq4yk4+E/FrxzOeuk/W2Ml1Hiqgni2QlDabWkKJQMHZT7y1DlU=
X-Gm-Gg: ASbGncuXE6O/5is21JRTOLTV0T1ZpZU6prHmk9G2BR18HD2bHxaylC/DjYuCYcIX4Kz
	1nvKjGvtu4D72b3CBbrYTnmMIZEQ+zXjQTj9zCOS/qNbWs/gw5td7fwLRRzrGfFq5TAJRS2yXQz
	1zvOKOZtCz76eeN1OhMuPumtRcNvmNO+oKCuvxaMh+qTxJI98QfF3h4dMO8Qf5i3ZcWG4BngH/o
	F9U8OEPXOQksPK1di/yDt9T6zyrKi91NuCXoJHj28Edc25Orl9/BS22hBu3Qnm+TMdXpqWzJkC/
	2b9vtEicGCCNHErzw5XvM2HbOFI+TEuoB3xeQrR/w7jDIs0MCd/CmhSa00Ybs3PdKtj1316VQG8
	=
X-Received: by 2002:a05:6e02:3d84:b0:3d3:db70:b585 with SMTP id e9e14a558f8ab-3d95e037fb5mr29829405ab.21.1745932078938;
        Tue, 29 Apr 2025 06:07:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxYKe64KrJHOVGDGU//vPn33RLxakuwv3sE5bOFok85OIRMr67JhLX/wsIASignHrLnq4UpQ==
X-Received: by 2002:a05:6e02:3d84:b0:3d3:db70:b585 with SMTP id e9e14a558f8ab-3d95e037fb5mr29828975ab.21.1745932078596;
        Tue, 29 Apr 2025 06:07:58 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cca7fbbsm1878954e87.159.2025.04.29.06.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 06:07:56 -0700 (PDT)
Date: Tue, 29 Apr 2025 16:07:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: Johan Hovold <johan@kernel.org>, Abel Vesa <abel.vesa@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        laurentiu.tudor1@dell.com
Subject: Re: drm/msm/dp: Introduce link training per-segment for LTTPRs
Message-ID: <gcy2ka6d57pcyymaqeilwuo224jydudxvfwd47d2ufkoycjydz@7lf2bjbz7kl4>
References: <20250417021349.148911-1-alex.vinarskis@gmail.com>
 <aA8yFI2Bvm-lFJTl@hovoldconsulting.com>
 <CAMcHhXpmii=Rc9YVeKXaB17mYv0piSFs02K=0r8kWe5tQGk7eA@mail.gmail.com>
 <aA94yOjsayZHNDpx@hovoldconsulting.com>
 <aA+N8YHX0DZ6h9Uj@linaro.org>
 <aBB-gl150GVaZPn5@hovoldconsulting.com>
 <aBCE3wSG2g5pp7jg@linaro.org>
 <aBCH4oo7dbG8ajvP@hovoldconsulting.com>
 <CAMcHhXrDEVrM4fEyMwZ9TDgqgY=s_mTcKZMacCoUuZ2fa8FhWg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMcHhXrDEVrM4fEyMwZ9TDgqgY=s_mTcKZMacCoUuZ2fa8FhWg@mail.gmail.com>
X-Proofpoint-ORIG-GUID: BsFMVS1faD5hXAReyD2_gP-b0UXvmvy2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA5OCBTYWx0ZWRfXzlSMJa7V5Vup SPRM3hFCa8yMukNFXGlolKonpu4zb2whcrCdvLBIdNkFvDdUCq0L6AQQw4KWA/N6sgVSMPHlutd yp1oIsP+rDbOpCSdDIZw7D6REFfOp3Av0u0A4gHUOWqiZg4VICNMHnwA3pIKaWBTEOWYkeKIGys
 HOgKRebNlpCk1YSvnxXVgSviEJ47VZaIlBSU0gqHt4k32aU5RsTkVJMy0RH9PNKALOhsuAu2jKm 4bztOicmRB7kpdhVfWlItFw6hTpD9xLeIMHRh4jxPP14YafVb2TnBi8P14HptZp2MENvgT8Cxzj qAg6r2v3284FLDPqzfoPTY1j08bNDNH8rjVfFX8rlWRA8Ip0QCk8ibnsMfLYzFXG/bgPbEH90og
 U1vs+W9kG4Kf8lpi74KbsnfFeJuXJLqXAQhyUNv5BJm8qhqTdEm3vUFsvaY8DeB2I1K2VDtS
X-Authority-Analysis: v=2.4 cv=cfzSrmDM c=1 sm=1 tr=0 ts=6810cf2f cx=c_pps a=vy3nvQW9C2dqy/lMnN3IYg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=x2CRZeuriRqWQSmQ5gwA:9 a=CjuIK1q_8ugA:10 a=mHQ74H5e8mo-RpSg_uaF:22
X-Proofpoint-GUID: BsFMVS1faD5hXAReyD2_gP-b0UXvmvy2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=637 adultscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290098

On Tue, Apr 29, 2025 at 12:57:16PM +0200, Aleksandrs Vinarskis wrote:
> On Tue, 29 Apr 2025 at 10:03, Johan Hovold <johan@kernel.org> wrote:
> >
> > On Tue, Apr 29, 2025 at 10:50:55AM +0300, Abel Vesa wrote:
> > > On 25-04-29 09:23:46, Johan Hovold wrote:
> > > > On Mon, Apr 28, 2025 at 05:17:21PM +0300, Abel Vesa wrote:
> > > > > On 25-04-28 14:47:04, Johan Hovold wrote:
> > > > > > On Mon, Apr 28, 2025 at 11:06:39AM +0200, Aleksandrs Vinarskis wrote:
> > > > > > > On Mon, 28 Apr 2025 at 09:45, Johan Hovold <johan@kernel.org> wrote:
> >
> > > > > > > > Does this mean that the incomplete LTTPR support in 6.15-rc1 broke
> > > > > > > > adapters or docks with retimers in transparent mode?
> >
> > > > Ok, but my concern is if they may have worked in a default transparent
> > > > mode.
> > >
> > > But if they are by default in transparent mode, doing the setup to
> > > transparent mode will not break it in any way.
> >
> > It looks like it will, see below.
> >
> > > > > X13s doesn't have LTTPRs on-board so when reading the caps, LTTPRs count
> > > > > would return 0 and none of the of the transparent/non-transparent setup
> > > > > would happen.
> > > >
> > > > But this is the crux; does any off-board LTTPRs in transparent mode add
> > > > to the count or not? If they don't, how would you ever learn that there
> > > > are any LTTPRs? If they do, it seems we may have a problem here.
> > >
> > > Count gets increased either way. It doesn't matter if they are in
> > > transparent mode or not.
> >
> > Thanks for confirming. So then it seems we do have a problem as since
> > 6.15-rc1 drm_dp_lttpr_init() will switch all LTTPRs to non-transparent
> > mode.
> 
> In this case, let me add Fixes to the entire series. Do you think we
> could land it in 6.15-rcX then? The second option proposed to roll
> back current LTTPR support and wait until 6.16 will completely break
> DP output on all X1E, so it's very undesirable.

It should be possible, if you rebase onto 6.15-rc, add Fixes tags and
send it quickly enough.

> This series was tested quite a bit on at least the X1E/X1P devices,
> both with and without docking stations, as it is also (v2 iirc) part
> of Ubuntu's concept tree since little over a month ago. You have
> confirmed that x13s also works with this change but without a docking
> station. If someone could confirm that x13s with this change does work
> with a docking station as well, it would be safe to merge the entire
> series as fix to 6.15, correct? I could reach out on #aarch64-laptops,
> perhaps someone has both x13s (or another qcom-based non X1(E) device)
> and a docking station.
> 
> Thanks,
> Alex
> 
> >
> > Johan

-- 
With best wishes
Dmitry
