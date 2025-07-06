Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C418314A62B
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 16:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751819924; cv=none; b=tqzFzuP2JO0yEUl5hemvbPo1D+Jl6LLMTlpbLw2hW2HRZz5J1bXrnTL6pFlx7lLGxKah6r8pmlQitYPSxpD942xqeUwG9xxKkDGUtizWCofK1ZITzvOsHDUW2tu9XuhsXFaODaI6/5HIbLro/3HfraHiexzyGXolszI7FgUF28w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751819924; c=relaxed/simple;
	bh=5M99j1ZrT8ju3g69LfK3KPx2hm0gURCFbjsdGasMAjc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jDg+YwPLvAd8A1UZ7euyRusf2xILsi2EDvE8cXM6+T78iDWqz/8gxwi/yE8Lp6Jss/3w1s3ckmnUoSVoyVMY6OzEy8Bk7B3ophZ9QKNyHyCDoAWRFahwC0/+bbvpXlNhduQEBqHc/flL1Gxl84pP1YmubAnyxJMmRjmPz3q+qpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f2y7YQ7w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f2y7YQ7w"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5669DsWn017170
	for <linux-kernel@vger.kernel.org>; Sun, 6 Jul 2025 16:38:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PNLqJKBidzQzs9Q3iB6rllX0zuzSzHASza6JjvzvcsU=; b=f2y7YQ7wST77nR9Y
	0dmZbqLsSojWomiKoPXDQm2Tx9yMe08UhqI1/UIC2HPcGjHQoDxMDEhbvYI2qvln
	9MKieWjP3cZzzEr2miqgvXN6xRrTwirjyMZeYKNZ1svvNUid0/VDysoNAYKHYiLv
	1JuJq9oxD+aFwelx/57fc7xkyZSg0CtIUe0kr9B65Rh663Mnbw9P4gaM0cWjvDzW
	naAhqyGUAVML1nVGziN8aLrHKbriiMH5Wu6pi7PddR6ocYpEWlvUrjCoeGIWSwXm
	Qx9Zw074VG+jgyYOh6/J+M4mGV5TdxZnhsOfFmP+1aRAaUy/ud/aGmd9k+fd/3Hy
	M4aMOw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47psrk59sn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 06 Jul 2025 16:38:41 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3138c50d2a0so3660216a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Jul 2025 09:38:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751819921; x=1752424721;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PNLqJKBidzQzs9Q3iB6rllX0zuzSzHASza6JjvzvcsU=;
        b=NHnSjjq99mDmqdbxXId0MAPYvOedFN8Lkg4mcNOghnqGBYOvMhbyOx6xFQG7l/ebTI
         R9JybEzzyBfSIhKFc6UNldCqG8n+scep2KGPu14vyPZ0mXSrxr3jyi5Aw2n9F+Pl8/hk
         dRD7Ljv3BUpSYBMiLtheodSCA8GmCMgjwyX1E85MyFW/fg2/TgQ4bDGhwmof7DtkZaIk
         tPvUMmBflqTJ9tTQT4fgEZQesf0Jbw3DaEZWDUsg8+NirkfblZSy8aqJVv+whxRclDxG
         fszynCL63KWPHoDSHncldttB7wyqdaOfz+2kV981uM0RFT8XX47zbyfY1KJk85jaZpNf
         6rtg==
X-Forwarded-Encrypted: i=1; AJvYcCWDxHt08DVv0EwtLzZGEIAJ2C4GWu5v6pr+TV5nvcQUB/JxjpQ0X4tnjC8AmgOaUh9kpRpUa/nY6werBWU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUfxusm+TAHcEtCErb1sq2Waq/V7eUXKEbhh7J51NVeX0NFF9s
	eJWrfQG96kFYiItecak1NFDB/JYXnvuueuHr2akp31VqmqHykcttqWrWwMxh2oqo1Bm+k8pQRoh
	Bsn9rXE6WMP4DrbUIQ2SyLunENawmOGJ6U2wbef1QR1biMU4jB/CsDROLV1nhDBcb95EJLad+d2
	xeO8AS/SMs4hkUYP482LhZZrxdZDCHyn/DSwKDfSdK+g==
X-Gm-Gg: ASbGncsu26SPp5OKwF2JK3gQpAfyen1mAbfZRvDWRLKzLCBG1BmdfQT68NVKAzpwIRg
	wucQC91dhjXB/WFl151VIlXL2dDRPUxVW737sE2SqgBcPWXD7pFRMYIpA7d/8ij/zQ6P1rePo2w
	xcA0z64xV1YKo+ReJ3hQ==
X-Received: by 2002:a17:90b:3a48:b0:315:7ddc:4c2a with SMTP id 98e67ed59e1d1-31aba84339cmr11006881a91.12.1751819920715;
        Sun, 06 Jul 2025 09:38:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcKhJtg3uXFrqq3g0A/eUGQshjmCzCt96AqXzmSmxuXG5dupDH/wUPqNaPHIQ1Cdxc4V32m2fmkfrBgi4TMS4=
X-Received: by 2002:a17:90b:3a48:b0:315:7ddc:4c2a with SMTP id
 98e67ed59e1d1-31aba84339cmr11006847a91.12.1751819920320; Sun, 06 Jul 2025
 09:38:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250705-iommu-fix-prr-v2-1-406fecc37cf8@oss.qualcomm.com>
 <c20a9713-6f8d-4c20-a031-dc448404d073@oss.qualcomm.com> <CACSVV02ioJfDyYLj6ASeQwH91n5CGcz+GW0wsupWJaUkJyFmqQ@mail.gmail.com>
In-Reply-To: <CACSVV02ioJfDyYLj6ASeQwH91n5CGcz+GW0wsupWJaUkJyFmqQ@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 6 Jul 2025 19:38:29 +0300
X-Gm-Features: Ac12FXzV1gqekfRsne3MkAr_DHFG5FtNyFV-IwP8Z86RpeoBmSFTV-zGCH7MKto
Message-ID: <CAO9ioeX0ffO8-v-mZaefFbyjOcCqGyu++gFjaMkpHPMyVOwE_Q@mail.gmail.com>
Subject: Re: [PATCH v2] iommu/arm-smmu: disable PRR on SM8250
To: rob.clark@oss.qualcomm.com
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Bibek Kumar Patro <quic_bibekkum@quicinc.com>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Connor Abbott <cwabbott0@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: -2UIWEAe2Q-EGpfNiwOtNDCxiLnKcNTd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA2MDEwNiBTYWx0ZWRfX0dCpSkFbXpRV
 j6O4j92Q68knr3AVClpWahCZuo0w7PctI6rSAX7RhdAgN0AmGnk9wGLlkXfuUQMl0eWUdZHGc28
 vHFrt3Lgcq7FChauU8YbBTWt8owMtZfxc0jyuT9C/fzh+Ll/jDjDp6xPLudD330brRBhJ/nY9vU
 kyRQhMQUqQHR882QfqzEqnNp3iXgxLg5GZKSzLZ5q4Ewjl1lap+79aKkVTKRuDNfMwCI8Hp/X0F
 SLpyj4pb67YUr//IwTgJ7VXunfxBlDuCnRl/KrIoA6vZGCIypg3Lyo55nHcZ2cs1Nl1HonLSm9g
 d4zEFPBaJmEeCcFOMIibSMtgb3EUQywJ2HClnYCSCx8oAq4uEU7vszPuVxgWdZLidstJnHqm97u
 lC/m+Wkk8nRtDpIcSd1y/QNP8xG2ATZCGekMuJ2ARWQ8Jbw8xQQL6/tgsF4MHd8m1zZhoN5i
X-Proofpoint-GUID: -2UIWEAe2Q-EGpfNiwOtNDCxiLnKcNTd
X-Authority-Analysis: v=2.4 cv=GtBC+l1C c=1 sm=1 tr=0 ts=686aa691 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=K0SaaKOuJfFG6UXcetgA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 spamscore=0 adultscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0
 impostorscore=0 mlxlogscore=469 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507060106

On Sun, 6 Jul 2025 at 18:20, Rob Clark <rob.clark@oss.qualcomm.com> wrote:
>
> On Sun, Jul 6, 2025 at 7:22=E2=80=AFAM Akhil P Oommen <akhilpo@oss.qualco=
mm.com> wrote:
> >
> > On 7/5/2025 9:38 PM, Dmitry Baryshkov wrote:
> > > On SM8250 / QRB5165-RB5 using PRR bits resets the device, most likely
> > > because of the hyp limitations. Disable PRR support on that platform.
> > >
> > > Fixes: 7f2ef1bfc758 ("iommu/arm-smmu: Add support for PRR bit setup")
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >
> > Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> >
> > Unfortunately, there is no way to detect firmware support for PRR safel=
y
> > from KMD.
>
> I still am a bit curious about whether it is the ACLTR write that
> trips the fw out (doubtful, since we write other bits in that reg
> AFAICT) or the PRR_CFG_LADDR/UADDR write that does it.

Indeed, write to ACTLR seems to go through, writes (or reads) to
PRR_CFG_[LU]ADDR cause a reset.

> In the latter
> case we could potentially use a reserved-region for the PRR page,
> instead of dynamically allocating it (if we knew what values are in
> LADDR/UADDR.. I guess 0x0?) to avoid reduced vk functionality on these
> devices.  AFAIU the vk extensions that depend on PRR are required for
> vkd3d.


--=20
With best wishes
Dmitry
