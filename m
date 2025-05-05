Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3CB91F7910
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 09:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746438949; cv=none; b=oUg8D/5ezWYKUoT6jba/wxK9I+tTTWbdu9CxVaUwOXvq7TgHh+YwjQa0KlMb8ZLqG9whGuS7BmYOZmrldThEMFIvUow71nCknuizRVKDi8Mgi7e0asOgmUPQtPixbtVFSEh2lv8EcUsW+9Jk/OYpy9xaL+aI/uQUosiy2vK+PIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746438949; c=relaxed/simple;
	bh=4fXXGQzfUtKtkKuKQhES1f00tVzlysT3cxFwz6vRIHo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DFTcBJf3uGoq81T2FZyy9EKWNwGzyZA3Bv4R6UNiKfPyZve0KNUUYQo/aJxZeYExCsmvrdSAI5e0nCNR2JnJ/lvE/e022AmyVhfwpgfqKAKNBCHnjCe20qCE0KOnjY/topZ4s2G4wZChox6tZ3UCH60qeTHO/0Mmz3T8D+0ap5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gEBvWWkD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gEBvWWkD"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544MZLfW017719
	for <linux-kernel@vger.kernel.org>; Mon, 5 May 2025 09:55:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2/mHzBkdkIdu/XMlXL1MKLhp
	gnZzaTuY/YtYOHlKf3k=; b=gEBvWWkDAkH2mH/o/AVZkrUpWTD4uiNsgHtK99c8
	AvUfzmTcVjreuEAaeGXJ/02eEIQVkGXFDalkYM/5GLCSAn99rML7YNX/pC50nIsS
	ARbmezpJL6NLNvoI3xhEWcqOXRB44X8Q8sidxWpM8ISrkmYsS9k+rRN9UuHyU3jP
	A0G+3psf8E207D7s+ToOAFiLPZ63rTuWfnr6jTdTV37lmBzKyhOSU+mogdFjQU0r
	JWA8PEzy62ISv8yXGXeBuGteAJsCyKuFcoMvKC9GMlth9GJOmbaJ86zYnIXXRJdB
	ZlY3rRmqSodzYAYI6sr0mGzsxaT7lWLHiiD3/YwD8mPf2g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dce9bmf5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 09:55:46 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4768488f4d7so66759591cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 02:55:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746438945; x=1747043745;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2/mHzBkdkIdu/XMlXL1MKLhpgnZzaTuY/YtYOHlKf3k=;
        b=oX3bEXyR7ZUa9pXea4FmwvfWh/p8lhwWEDClA75cjtV26baxnautVymhiSc8WEY8I/
         p2X2aiKs6G4lCwU1nGMF1/qpCgIhq2weZ9KapaUM+yomymArbx36XFTpCxZJ+scqTX0d
         4e0GIdbXuFrH5neMgzna5Y18/T+u6IOqXmlv6KVTtPZWfoWl5NJvaInSh1AnJve1xtop
         CahnqE6GoE9IqflipTOXSN2Oa8ihpwR47+Hvn2vghv0BQVz4UigkZvmyYrSFOpox/kQu
         25KBZ0cxgkKIOC4vjFSu6THbBYj0wcNuUwI2AJ2LjvNyAMwSoe81Dn9M1SAg4TsBcFTh
         4L8g==
X-Forwarded-Encrypted: i=1; AJvYcCWvxEjx9uPMP0xM7XSlvGLNC4Yam5jfXb0V+OfTbSwTmbHda0+g7TrpAFncdJquVL/YO1s5Eow4X9bJXW8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZog2Kt05kZIc47bgyiyomvbU1ygSK0Duvyp4w+9zE801wwOjo
	yWwHlJaEPgC0wdsdHVVsQO87493AVE36vQHLePZK1V2blP4H4AmS0F7Mm7EQLZIhaBuR4TOd0g1
	TAl6W4WZgyULpibuO5xIwmBesqPS828H4/KQ5zXjxEVVZ1rXHAl8ffJMVS9EL0kYSF6gad0s=
X-Gm-Gg: ASbGncvII8CIayKIsB35CGY4kujbr1puWKercM+QLiG8C5ifS5SVqNtcyRnFBTG59Zg
	g2Z4e3x6AKHhcE6nkoVOtGQ4YZPapDs4WJ8d6yQa2/ugwU6TG4Ocysx1MaO04cBmtn61g2zuK9J
	yqLfVyZIfxia9M3FNmyNpKv5VATvF0nYMtSOmWqxyNbTv03dvBTQiQfmZhTrkEMeV+ymgbpwgx7
	l4aNnzr/CaLLN4GSu2CQAdaHwZpQQ55zPYYPuRpreakSSxxEVsfbaDAgt2xUjOX/gcmeJEjUXZo
	YYUZbW4T1C3N9IVq3/oqUq1ydWYV7dTZ+WArXp4m7oYoSzRyf1OM116YNmrOAaiR1JMhlm+wHxA
	=
X-Received: by 2002:a05:6214:1c0e:b0:6f5:117c:76cf with SMTP id 6a1803df08f44-6f51580c00fmr168424606d6.40.1746438945414;
        Mon, 05 May 2025 02:55:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGknyWbznndebKntrV92c9APdUuAC3oqeLq7ISMW2xppAZupC/c68JL1jEz5Pc9uS8Y/NJ8Dg==
X-Received: by 2002:a05:6214:1c0e:b0:6f5:117c:76cf with SMTP id 6a1803df08f44-6f51580c00fmr168424416d6.40.1746438945126;
        Mon, 05 May 2025 02:55:45 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94f6a9fsm1658248e87.234.2025.05.05.02.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 02:55:44 -0700 (PDT)
Date: Mon, 5 May 2025 12:55:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 0/3] SC8280XP SLPI
Message-ID: <xwuxekxqqt76xi5vitfwp4juwm7vowkdn7zjniymup6pmcwwef@rkr366xgetxz>
References: <20250503-topic-8280_slpi-v1-0-9400a35574f7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250503-topic-8280_slpi-v1-0-9400a35574f7@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDA5NCBTYWx0ZWRfX4X2cvjAyLO90
 JO+rkpYsAiluc9Y6rw4VOQ46M6NOIeJm5K4A4kFdEk9CqYvdoRCh+IkxnlaxryaLNQlda+e45cG
 NOtBg7z1IQNmIV0bRxpxOGlkcXvwM7G00BHzA1nMzNMy5Re6r/hLE4bbgmyYtMUeZd/rcgSJyw1
 3kE5aPMcCswXRo43TxeAAzE22RX28aqQAK2i1/+U3l9+9TM20w5AQavIRep4ExupSPWJko7xLJl
 vZLmAdcnn0bnNjnCawigMVblTtSV7jk6Iht5b63JxjEFT/fWtWx7epf3PcyDcha6FX2+qXQzMbC
 kUbEZ41nrgeKW9Q2lNKwCcXywyWDTLzW/9i6S6xYHfHmlbxB7Mb8hMFoQ7G1sqvMJbYzInKfbri
 +DIUaJ1ubGC9jKSbndeaE5ll/QqzPufYbUnmZtU9YhOJw3i9I+5Vy7JZMvkpmG1uTk94U8mL
X-Proofpoint-ORIG-GUID: f755uNwqyNLi-glwPsJs72DUoOxm3q1v
X-Authority-Analysis: v=2.4 cv=Qope3Uyd c=1 sm=1 tr=0 ts=68188b22 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=x_-MvMI86miFrt3VAdAA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: f755uNwqyNLi-glwPsJs72DUoOxm3q1v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_04,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 adultscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0
 mlxlogscore=611 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050094

On Sat, May 03, 2025 at 12:37:58AM +0200, Konrad Dybcio wrote:
> SC8280XP features a SLPI, much like its distant relative, SM8350.
> 
> This series adds the bindings and dt node for it (also cleaning up the
> DTSI in meantime)
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
> Konrad Dybcio (3):
>       dt-bindings: remoteproc: qcom,sm8350-pas: Add SC8280XP
>       arm64: dts: qcom: sc8280xp: Fix node order
>       arm64: dts: qcom: sc8280xp: Add SLPI
> 

Tested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> # Lenovo X13s

-- 
With best wishes
Dmitry
