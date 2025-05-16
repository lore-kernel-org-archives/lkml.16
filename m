Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED2822D4C5
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 22:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747433009; cv=none; b=AP4g5RJgTFYlJLM0+QqLDGLejquicuRgxkdh+Ke5gIoYyEYU45ngiLu17TRqeECQNk4ZAdhl/xC9vX5cDJdfH7IAox7IZKznbzAsb4An6q4gyxTjaogr1eHU41mrswh3kttx9hsao1tzAKJwv6Ph46HEiLrVbqPAFajKGTkQ8Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747433009; c=relaxed/simple;
	bh=ztUlQZWvvy4grTUgGp7eFDJUjwxG1eBxQAgPnUQyK1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oAI2L5Uy1nBtIcH/Jnw14sW0GfDWmvlzMcDqRyR1pbvbEO9+ikS0s35N62o0/kfYVt1iscPyzQb2g5j6rXejZRlgtHNRiTJe6d2x4eyBkIbykZOReCP853GLR7F/GHhQEchdI7Oyn+ajFTtws66PMQpiFcf5ut9uoiOYIJ3InII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N+RLfT1R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N+RLfT1R"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54GBLsD8007955
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 22:03:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3S9P+NpYn9J0BlmANLvmQ/cfBBGE+oF56fLZiQbC8ug=; b=N+RLfT1RHhzleWE3
	IhKCFSUyPw0+0spY87oL/NoMQe3hPZJdTT6l/VLehAShpGFenbicg6WubRy8xL8t
	u7sRQmORPpovMHAsg0r/ANDdsQNO81Pby/maVmhcEaKW5yIAvKFrNw/D+sj1b2PE
	zI+i5hJkQfrDBex6hyIvxc25HB6qiVrNhjEc7Cs/rDE6sZ28iIO+3bVuEMaxPHtD
	xzwNdXb/RlZdJR5PyjnGblCCoU12Dz2yUF4SER/3TZ3I3iD/7srZWCjEKFkiAyZN
	Z0S9Br0r5qpONAVu46vuQuPOLYz+q2H2lCzvtrBYV7y7Y8u+UQbLmOi7xjd22lLc
	xoMdpw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcq378s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 22:03:26 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f53913e2b6so38803976d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 15:03:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747433005; x=1748037805;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3S9P+NpYn9J0BlmANLvmQ/cfBBGE+oF56fLZiQbC8ug=;
        b=ZZIVAsM1Vx9HwmbpNxaEeULXoYRfpdSwL0YXp5THz1hBVvITVKW89clLQfU6fMxUYU
         mmnw8QXySQtZI8L887L5yH7i9TRYzRSZ6m5XiqT4DPpiUp1Y0v6QDfkw8wT/fvIlrRLM
         O5/VEZ5PuiBybPCY/Zbc73Q7lGcHG1SXtUl81q88w4e7Ft1DqTRPi8bQgDao0fEMHHOH
         u7gbyqqLCVhauDOMAXc5s7EMTLHvqS/kV6o/LZPoP/u1DYe2Ld9J4+kpX7oM+5PNHEyf
         s4HiBxaSPihVF1zFIB9FI8cbDPQiu0x6yMIq7gp2lJLyiJEDC0/0vPzSEmZoM4afj/4N
         3S+w==
X-Forwarded-Encrypted: i=1; AJvYcCUM9LgTiqT6gf9BiBfqfBdDW0VbrlLMjPiVuD+adfGeu4G4dom5wStN64IuNCi1jyyvGiOiY6Mpkhme7Oo=@vger.kernel.org
X-Gm-Message-State: AOJu0YytJz4g1j6DPU0etB4xUda3FUVG1UCsKg8yaAMK++zkeWnleLwg
	si3a5YIWha8f/2H0E/9i3bEZ4yq2Vl/cHst5ICMeeNxqm3D9hgsmDpPGHAXh/ZUUfRq1Jl13I7C
	a7AkN8IHeHGvIP4xbCoUzs5kTvLJAq4QHnVsNZUsyYXpcZw+9+wupM0REi/IPBnG2CAKywDdHeL
	Q=
X-Gm-Gg: ASbGncusuPmyb30+ytwhUDCxJqdU/y3Cfr+zU0rwdzruCdF+fL6Xy+I6r309rpAtbvC
	saqK/OGJRIAYv8AIxOmAZRUdj+eyyWCk07/s30ryfS03zt40h6exao2SXpfB4hLj5Q7uSfaPhnk
	N4sOIbKoxIBw1qVVTqBL5WK8JWA1brmCSX4znPbLWSnrPNcsfC8Gy/kKJ0XruftzrPR16Dd4wRg
	lqD6xMnfnWPJdsrr2ppyECT49oxOmPlO9ni9+HrokRIcVADUxDB5KX2S0T+KamcAypXO7jgQMNC
	b9MM6uQa4T5A4OfadUBJ4DK9jCfMA22+eRqfuayeIG+Le9llmGLOW0gAEkvHRb6pobgc9uR25is
	=
X-Received: by 2002:a05:6214:246a:b0:6f5:e2b:98a3 with SMTP id 6a1803df08f44-6f8b0887f70mr87908146d6.25.1747433004951;
        Fri, 16 May 2025 15:03:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWB45tewJlV5uXCDbTSp9IwILzgTOKAHZJHMtCm1r+ufsAFmrPW8gFZ/teJR4n3mhhNkaHGQ==
X-Received: by 2002:a05:6214:246a:b0:6f5:e2b:98a3 with SMTP id 6a1803df08f44-6f8b0887f70mr87907466d6.25.1747433004512;
        Fri, 16 May 2025 15:03:24 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e7017f8asm604298e87.110.2025.05.16.15.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 15:03:23 -0700 (PDT)
Date: Sat, 17 May 2025 01:03:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, krishna.chundru@oss.qualcomm.com,
        quic_vbadigan@quicinc.com, quic_nayiluri@quicinc.com,
        quic_ramkri@quicinc.com, quic_nitegupt@quicinc.com,
        Mrinmay Sarkar <quic_msarkar@quicinc.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sa8775p: Remove max link speed
 property for PCIe EP
Message-ID: <bpc4tsp4kghqohoxm42qls7gzd5me7xrpodmazyhpvjjlkkay2@paoq5zygczdd>
References: <20250514-update_phy-v2-0-d4f319221474@quicinc.com>
 <20250514-update_phy-v2-2-d4f319221474@quicinc.com>
 <8ba99df8-012b-4883-af6a-970dd9f877f6@linaro.org>
 <f5e1510f-3496-4f5e-b093-623d3b4be428@oss.qualcomm.com>
 <CAMyL0qPH2r8oXOrNp3jF-nBJCRCZzJr8rYrHn+Yp0MHR0Wy-vw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMyL0qPH2r8oXOrNp3jF-nBJCRCZzJr8rYrHn+Yp0MHR0Wy-vw@mail.gmail.com>
X-Proofpoint-GUID: 8PFEsgUaeIqUA4dexJyje0s8Hn2WHaEI
X-Proofpoint-ORIG-GUID: 8PFEsgUaeIqUA4dexJyje0s8Hn2WHaEI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDIxNiBTYWx0ZWRfX5EjAetAjcz92
 oaxhZGhdQfOQizGWyA//IRQlgXrVABY0T9qJOPBZQWkARGzDzDRMgWL9lAWtGI1cFJONhQNp6cq
 kpxt5vZSpOBHyia/HCdV6HRXXjH582aRQZrJX+UKhYNjzOiQNC1Hgkn77CwdyvsFZl1/Aly9THP
 Yeb1qVQyU3NcducoOy/IDQmUdL9EytCGlSD2BOLutSYdtQReCEp3vbomD5T5HnEC8KLxZHGgH1u
 np49+tXeFgGf6wiQy6MbzHgDNiKedIcaoRTgsOjvRftzLPxZDmg94UPUP4WzY579JuwVfGHQQdC
 ih72CGVe6gZr+l4omRnxyHHdvGFv0eVHEe1A4Rde6tW7xZ5TusWzI4LN68QotJ52KJJdEr0D211
 w3B5rG9siBKMIe7ZCYt+d/3tNMooIunfFsK3rCFIz5k8zZpwd3Z+uHF/l8Vn+e921YghCDE/
X-Authority-Analysis: v=2.4 cv=KcvSsRYD c=1 sm=1 tr=0 ts=6827b62e cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=bd9M3xGx0OlNIZ6swnUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_07,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=998 spamscore=0 malwarescore=0 impostorscore=0
 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505160216

On Fri, May 16, 2025 at 03:59:02PM +0530, Mrinmay Sarkar wrote:
> On Fri, May 16, 2025 at 2:30 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
> >
> > On 5/14/25 6:38 PM, neil.armstrong@linaro.org wrote:
> > > On 14/05/2025 13:37, Mrinmay Sarkar wrote:
> > >> From: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
> > >>
> > >> The maximum link speed was previously restricted to Gen3 due to the
> > >> absence of Gen4 equalization support in the driver.
> > >>
> > >> Add change to remove max link speed property, Since Gen4 equalization
> > >> support has already been added into the driver.
> > >
> > > Which driver, PHY or Controller ?
> >
> > Controller, see
> >
> > 09483959e34d ("PCI: dwc: Add support for configuring lane equalization presets")
> 
> Yes, this patch is helping to solve gen4 stability issue.
> >
> > and commits around it
> >
> > does this change depends on the patch 1 PHY settings update ?
> >
> > That I'm curious about too, but I would guesstimate no
> >
> this change doesn't depends on the patch 1 PHY settings update

Then what has changed, as previously it was documented to have stability
issues.

-- 
With best wishes
Dmitry
