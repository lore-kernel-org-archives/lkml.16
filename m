Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BFF21CC56
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 15:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751209225; cv=none; b=UUInPUTKKa5anL4ZVKLK+SgECm9gvat2a3N67vs8l7Tf3Q0u/m+Q8nZNaQH7/jkWiSAcK3dEqCpgFlxd3+Lpo2QcQyWoWh0Lx5ZOLzYrxLALbsrvAmGNk8xXvlJdjJctokVn0U/FSCHWt70vMEkd1J3ZmaZYI9L1qQeM/e5CVcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751209225; c=relaxed/simple;
	bh=8ThBrHYseNWTgVIENZvM3X7g4bVp9jFWwMWyTq5gbZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l0bqPPhwv8WmEpRh99/Fvtmm6tCV2LfhtVxxOI3dGOqE7+dn2SfE3JgNOnAUp2QZNnp73nf7txAiyHLictbV6HTkODvkaWRqk8zdQ0Kb+cr4fEVdUDO/VHB4HUZjL6nkRu3r/6MTb81XwkRSZoXz0m8UMPEB8dkA1QxM8+1ahC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F0srTDVV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F0srTDVV"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TAVmAJ030350
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 15:00:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=b/pYUHRY/Pf2sWjUsiTjX3SG
	fPJK5GCx6P2lJBvN2kA=; b=F0srTDVVl/a1cs1pvhgj6hW+AtRw+g8Ez0dCBcCZ
	V++pobwYDVwoxjtbI3tEd6XmEsinw7cWZXgfYKwsyfTGJx+le5DcL9pYzXfezhKZ
	G6KUC9smC17fnW9S2l0P823jYX27SD5RtuPFQEhruyqMSxTWvtYvjXOjKvTEiO/g
	Fv33hRGNJooCPPSnHLwO/pLXSCW7kr/DdlMamZcRh1ihLQeHKO4jOTnFSd9mJjPG
	CHMJH7j/qeP4RrNwtIuMfEzcalUWPerwUjoxss+uFUljoyKKhPFWC++cE1T5019a
	5sYJ+wfvULmDMTCgmsr7zlcs0L2NSt0Z9EqBuCuTOShFfg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j95ht8dd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 15:00:23 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6fb1f84a448so13367006d6.0
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 08:00:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751209222; x=1751814022;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b/pYUHRY/Pf2sWjUsiTjX3SGfPJK5GCx6P2lJBvN2kA=;
        b=iwQHA4E13Z327cWSkU57Vm0piMzk9Lfj1BJ2BLaZOjH9B9EI2c/kNvEfvi4j7QcSdC
         bwhYyuQi5eQQ5R/vftD6S5rM4M7aMw7PqbTPMcpOuIkqdTbbXg5860a5FpdmjXFJIlYY
         zOitBhcbMeza5+hZ1CRZLcY/aPiww94/KAMCX4p/SzcsWXgTZpQ0a5PyJpFtw6+jeeM2
         8zuvktpYEuRnY3baJgfQ4PM2ZAkufPjrRordZNbrhKfFcCE4VldB4K/Pjh7nqGtISgJ9
         CNhdZprvBKBllD7hg9J3clEHUFHBvEsDgB+d97Qgn8xmFfSew1Jzjlr8l7Q3yZcIMZRf
         PrKw==
X-Forwarded-Encrypted: i=1; AJvYcCXST/6K1FtNaqQ7TF0HVtW5JXO01QemborTSDPd+hvUik5SiDnXASoxlm73d/if+ceSzytZIUQFMxU/W3k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMNGhFU8ANTKiiiOtOryKd/9wl8xaiXanEUg7f5onRlGANMTsJ
	KYjF9X+ZpellMkPf3SkFlMPl31r6bLJsJnPFeW7XhyCx6HAk5COkwgK8zun6Z5xk3/nTDD5bcgL
	PkQBJtlugwwiuyfqyTHSCw8nw7Tp9/yyu168C1q9MAkBcnRT8UI7A6qySDAs4grhvljs=
X-Gm-Gg: ASbGncvRkBBnJkKefIIi1C25zK9q8ZE7rGXqdEFENyV37udC1w/Sb6WzM1xcNUAKsji
	E+xpe9CcGxDtApQ3PMhPSNdm35C/QoqO9Q/exj/dd1noa6XCD+LL69fHBjDJJoWxj5780fADtzj
	Al1cZLZIekR0CVRGFwCWaZbjDvuqm/SK8nArUnq6xeutgoZQKfNTag/0OI3TAftTauTa3jeXmcx
	B5L5LvvwI6qgm03cNVviYJig+CDZEwOx2Iky6LQYD4YYXqQ/0752rl0w8Dy2RyVX+amGZ1Frmlx
	vBTAFjuIGYj5KqYFZ25HHV5Yb4VHzMtd8LW3JRHrJvWcVE5LsS2DZ10Gjyd04MwcHw/XhVG9VQW
	2kiGaPRy+YMIJukUizH/rCZ08z51B1UC5Kns=
X-Received: by 2002:a05:6214:cac:b0:6fa:cc39:9f with SMTP id 6a1803df08f44-7000233d01cmr161995666d6.32.1751209221835;
        Sun, 29 Jun 2025 08:00:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHA5FIdyh/Au6WeKGTSUip3heR3p8gw5t0Q5mmyuMzcIuDDNsAdJQNEGpW6Ol5VHhlRtmZq8g==
X-Received: by 2002:a05:6214:cac:b0:6fa:cc39:9f with SMTP id 6a1803df08f44-7000233d01cmr161994646d6.32.1751209221184;
        Sun, 29 Jun 2025 08:00:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32cd2e30e3fsm11049641fa.49.2025.06.29.08.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 08:00:20 -0700 (PDT)
Date: Sun, 29 Jun 2025 18:00:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Lee Jones <lee@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH 2/3] dt-bindings: mfd: qcom,spmi-pmic: add pm4125 audio
 codec
Message-ID: <mj3jhm6yr3bv5vbyyxxdo4x5niw5quxcal34wdg4vtplipycl6@kjhxtrqvqejo>
References: <20250626-pm4125_audio_codec_v1-v1-0-e52933c429a0@linaro.org>
 <20250626-pm4125_audio_codec_v1-v1-2-e52933c429a0@linaro.org>
 <eb5cdcb6-7e40-4ed2-9cc6-6eff43da353d@kernel.org>
 <DAYBEWESVDJY.1ZDYI58M9OEWX@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DAYBEWESVDJY.1ZDYI58M9OEWX@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDEyNiBTYWx0ZWRfXxvji2uGYyqyG
 AAbg7ThIahi/EmslwZYiOM8JdDkydYgwjH9I3RSrnZkC8WUrtloS2G5XB1lTnIEUAoIlF+SdwwK
 1zviaZuOt6Bxy8vbvaf2i1sLPCMbkDLMY6kdYC0jCt4Odu02VesVW33+1KYmo61+TJ6T2iEFVAk
 2FqfRE3SjbTyo3no/laEUQeljjHygd0L7/OWemrolPOQmCZiUCzPkS33GXOSHLWz91C30gzZlMa
 Zc/YcKc10Qk87dbAe0GzAqcBXbEV+pZJEpxV4fNj64ThMwfCqTaDm7bjkMyPoPRrbOli0iSMFuD
 hBmQpxbSGAIhbmDaVkiX2cBHPwUEafuDs111O8KMyn0jWKvcsoHKR/L9DjPcxUoJCse4Y1C7xxa
 OqUb8aTWiSWUIAqnTlw93+uAEJCpaIlW6RSBn34R+hGBzPnX4NfMsqEzVk6tw/qqhBFG5Fzv
X-Proofpoint-ORIG-GUID: tjxsdZAAQfI7olbGY_fuwm_lt-xrNXqn
X-Authority-Analysis: v=2.4 cv=EuHSrTcA c=1 sm=1 tr=0 ts=68615507 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=PcvD3jq4JvdaTR1-S7QA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: tjxsdZAAQfI7olbGY_fuwm_lt-xrNXqn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=521 malwarescore=0 mlxscore=0 phishscore=0
 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506290126

On Sat, Jun 28, 2025 at 05:42:52PM +0100, Alexey Klimov wrote:
> On Thu Jun 26, 2025 at 9:48 AM BST, Krzysztof Kozlowski wrote:
> > On 26/06/2025 01:50, Alexey Klimov wrote:
> >> PM4125 has audio codec hardware block. Add pattern for respecive node
> >> so the devicetree for those blocks can be validated properly.
> >> 
> >> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> >
> > Remember to ALWAYS explain the dependencies between patches (merging
> > strategy), because this now creates impression is independent patch. It
> > is not and should be squashed into previous.
> 
> What's the proper way to describe such dependency?

Text in the cover letter.

-- 
With best wishes
Dmitry
