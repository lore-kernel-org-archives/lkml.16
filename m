Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A10F23FC7D
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 12:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744805646; cv=none; b=Kg2gZ4VaVCQEyFHM5Iv+aOyTTJ51BA9+Sz58JbQDCGtzhTRkcZyXQ4FvzYsf77iQtLS2E8PLK1x4Y2d7/5827ae0SGkRMKWo34jFoiBiJFAwxyLHXmgkzVIzN6v0TngZiAky80x2X77vMQazbi/XyYTApRW1/4K52OgaSo7U1uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744805646; c=relaxed/simple;
	bh=8ZR2LD+reQ/Dz1RzU5SYkbXhaZByyYvQbKVpzYuVc1M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qXPsPfQPIsOYFewI+K3O0oa1Cx0pZpRuwJkpmM73UWeaLfCTO2oQZqXQR5PBGoDHP/Q94mWA/PsXA6pdAvl2TPchCx8/W5o0TC2ovQg2lsWyoJ4yP5yuKGi876W4FQq0bi1D7RM0RJo/yqF5okw22ZBeyahW69ek3ryaYRYn6XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XvuYr27O; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XvuYr27O"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53G9mcgu000537
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 12:14:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hoicvJayGfRbnVNr+kDnUFXz
	fuMtcH6jdsL2r7v/8DQ=; b=XvuYr27OqXZK4noaP6C9iJspNwv7GtnmKDByE1+k
	lCem9xCUKbOJPxbBHJMGuQfqUEtCH7cuNUFlGk7PvXertbejzlTdW+cZKNMdZ2HD
	z0PrUKrB2GFUOqF25conwqWsHMxQpQdLsJkzUBTtlRr0iZVV0V9eNWvOGfcNtcEa
	EW9yDN+qLyawJjjQcgamwDXjqq28hzpJ6ivWHXk3NyNEkYqfh5EjotxZZ+xHeM0a
	/LPYDjGRlu/wc6KCmpIC/WYhgnvxVUiyEyUuqxYhQvbgmbrgk5+7Q22Fpfq9Ao14
	g9g8llaHSbon3/WiW5+L7xhsYDiifiq/Una4P8IuNtaj9Q==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yf4vkj54-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 12:14:04 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-af8e645a1d1so4577677a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 05:14:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744805643; x=1745410443;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hoicvJayGfRbnVNr+kDnUFXzfuMtcH6jdsL2r7v/8DQ=;
        b=qEtKbIoiZOovjn79EuTGrCd00nfrGaG8kwaimFkmi0oj4oyYzFyyaECj8ffOYD9jOk
         9OJcau1CBvrUKgz1DkYSb9SPkDdlTEXXXDSCy2zH9Ud41Q2yX9aMJRpjqEWW0wkowsPm
         FLN/ecXMhWcMOZS5Joq94sLWtZQ9vmWt/ZFUB1lrA8SDz3YYYBJasmlPPJtKP/tap8ed
         dCs3FifTFz1BpnuxA0Nhv4dkxFjugsauFJZaE7yCiqmiA1R1YdD6zBu8eO6OBOQavySP
         2rJwPjPStw014P5levWYYmEkIMj6w9Q3GESkp2ar08O5Ti+fzjgmFcsoMc+CqrsspGiD
         IDug==
X-Forwarded-Encrypted: i=1; AJvYcCWQo4FJqOJyE/QqrLoXzoKTOyjJBkIFNto53r0kblX6uNrRxVrBVOaVdC6HV2myzLkLwLGxKTs13Q3tijA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlVVJFNtDypgiPxdUo+YGw3xwJb5LCq8+PDlt2ra21Oeqaj7wv
	1PJRz6Nuy+5i5NBAepY2TvzdintCTOWITFIv0MNDOYuDCRUvfmGivy+tbhZ9anyXqBqSSbxZILv
	SDueA8h14qGN9/vmNkqjcyVQwi//56aPe9TOIz+SFhiQuG0LD1mmcAI3/Lv43JsagB6+Nzp5A+d
	+4z4vtdokiWieecpT5NJXxb2l8aJ1AkThqKAmLEg==
X-Gm-Gg: ASbGncuuRgvoENWUcH7tBvN1saUiUSA/jl4VgeB/OnJ4/Lp90T5gXrbIZI+KMpl/K5Y
	Aq/mk7YSm3tUpgwI1jIIJqbkYmuuPb8ijlHzd+FKdXlRSKi3F4hYqytj8n4zjIcrBQu9RSMYXbJ
	HfZBSMahTR06k0HA8/6N2Pj1Gj
X-Received: by 2002:a17:90b:498b:b0:2fe:a336:fe63 with SMTP id 98e67ed59e1d1-3086415ea28mr2431955a91.24.1744805643291;
        Wed, 16 Apr 2025 05:14:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBAO/IXJsIRD6bGBDFHb/vhg2Pt0r5xCrzct5z2vNsXzqxMqL9va5fjULmWQG3bJv/Ec3+IT1w+RLtSRXwQS4=
X-Received: by 2002:a17:90b:498b:b0:2fe:a336:fe63 with SMTP id
 98e67ed59e1d1-3086415ea28mr2431917a91.24.1744805642822; Wed, 16 Apr 2025
 05:14:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250410090102.20781-1-quic_nitirawa@quicinc.com>
 <20250410090102.20781-5-quic_nitirawa@quicinc.com> <pur4y63xhfmqlyymg4pehk37ry4gg22h24zceoqjbsxp3hj4yf@4kptase3c4qp>
 <317faeaa-3130-4e28-8c5d-441a76aa79b4@quicinc.com> <CAO9ioeXnnbNzriVOYPUeBiWdrPfYUcMk+pVWYv0vZpJbFeByoQ@mail.gmail.com>
 <2820908b-4548-4e0a-94b2-6065cb5ff1f3@quicinc.com> <c2ec6b7c-421d-43c3-8c0a-de4f7bdd867c@oss.qualcomm.com>
 <a24ff510-2afd-4aa7-a026-199fb6d87287@quicinc.com>
In-Reply-To: <a24ff510-2afd-4aa7-a026-199fb6d87287@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 16 Apr 2025 15:13:51 +0300
X-Gm-Features: ATxdqUGiC1BHfSn5Eklp7gKFpyWYSjnAPEw8Fg9jZzGqaxHriewAs1J3z4zxcto
Message-ID: <CAO9ioeUDzYLMvqmsOQ-VfgLQLavHqn=QVYxyHzetjSfmhjKFjw@mail.gmail.com>
Subject: Re: [PATCH V3 4/9] phy: qcom-qmp-ufs: Refactor UFS PHY reset
To: Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, manivannan.sadhasivam@linaro.org,
        James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com,
        bvanassche@acm.org, bjorande@quicinc.com, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com, quic_rdwivedi@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: Di3ukkizCLv10pPokexeOgzCUBPLv-Zc
X-Authority-Analysis: v=2.4 cv=IZ6HWXqa c=1 sm=1 tr=0 ts=67ff9f0c cx=c_pps a=rz3CxIlbcmazkYymdCej/Q==:117 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=E4AxlzQU9QZxWW8QZIgA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Di3ukkizCLv10pPokexeOgzCUBPLv-Zc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_04,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160100

On Wed, 16 Apr 2025 at 12:08, Nitin Rawat <quic_nitirawa@quicinc.com> wrote:
>
>
>
> On 4/15/2025 2:59 PM, Dmitry Baryshkov wrote:
> > On 14/04/2025 23:34, Nitin Rawat wrote:
> >>
> >>
> >> On 4/11/2025 4:38 PM, Dmitry Baryshkov wrote:
> >>> On Fri, 11 Apr 2025 at 13:50, Nitin Rawat <quic_nitirawa@quicinc.com>
> >>> wrote:
> >>>>
> >>>>
> >>>>
> >>>> On 4/11/2025 1:38 AM, Dmitry Baryshkov wrote:
> >>>>> On Thu, Apr 10, 2025 at 02:30:57PM +0530, Nitin Rawat wrote:
> >>>>>> Refactor the UFS PHY reset handling to parse the reset logic only
> >>>>>> once
> >>>>>> during probe, instead of every resume.
> >>>>>>
> >>>>>> Move the UFS PHY reset parsing logic from qmp_phy_power_on to
> >>>>>> qmp_ufs_probe to avoid unnecessary parsing during resume.
> >>>>>
> >>>>> How did you solve the circular dependency issue being noted below?
> >>>>
> >>>> Hi Dmitry,
> >>>> As part of my patch, I moved the parsing logic from qmp_phy_power_on to
> >>>> qmp_ufs_probe to avoid unnecessary parsing during resume. I'm uncertain
> >>>> about the circular dependency issue and whether if it still exists.
> >>>
> >>> It surely does. The reset controller is registered in the beginning of
> >>> ufs_qcom_init() and the PHY is acquired only a few lines below. It
> >>> creates a very small window for PHY driver to probe.
> >>> Which means, NAK, this patch doesn't look acceptable.
> >>
> >> Hi Dmitry,
> >>
> >> Thanks for pointing this out. I agree that it leaves very little time
> >> for the PHY to probe, which may cause issues with targets where
> >> no_pcs_sw_reset is set to true.
> >>
> >> As an experiment, I kept no_pcs_sw_reset set to true for the SM8750,
> >> and it caused bootup probe issues in some of the iterations I ran.
> >>
> >> To address this, I propose updating the patch to move the
> >> qmp_ufs_get_phy_reset call to phy_calibrate, just before the
> >> reset_control_assert call.
> >
> > Will it cause an issue if we move it to phy_init() instead of
> > phy_calibrate()?
>
> Hi Dmitry,
>
> Thanks for suggestion.
> Phy_init is invoked before phy_set_mode_ext and ufs_qcom_phy_power_on,
> whereas calibrate is called after ufs_qcom_phy_power_on. Keeping the UFS
> PHY reset in phy_calibrate introduces relatively more delay, providing
> more buffer time for the PHY driver probe, ensuring the UFS PHY reset is
> handled correctly the first time.

We are requesting the PHY anyway, so the PHY driver should have probed
well before phy_init() call. I don't get this comment.

>
> Moving the calibration to phy_init shouldn't cause any issues. However,
> since we currently don't have an initialization operations registered
> for init, we would need to add a new PHY initialization ops if we decide
> to move it to phy_init.

Yes. I don't see it as a problem. Is there any kind of an issue there?

>
> Please let me know if this looks fine to you, or if you have any
> suggestions. I am open to your suggestions.

phy_init() callback

-- 
With best wishes
Dmitry
