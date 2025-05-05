Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0B8256C9C
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 14:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746454495; cv=none; b=FbyPD/0Xb7HxT2GcR2qxkzyC/zs5jhfeDp8llWn25v8Yulnaq6OZl6AJYa7Jq5DM+g37uEnb7STC4fpUcbP3GnxI+v/vuhIruEocYIjlp1piKwlTRe9qdNHNZ3EzpJoDvXLXC/aPclJBxOmMeIH2p8En/QtSY5MQ7oz75RmuWq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746454495; c=relaxed/simple;
	bh=g0rIMfPYox6tTNqVeb0ZnxMcXS3eJl9r0KihR8f0GYs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HCrFAEj/n01vkJvpPx5XHE6HMMx7wUMOUoLt0fO6N6wXi6YK8bWAMRD1QPfYlK9OcGv/zPnJ1ck8noWr5Cu6tMOYBAtDInTFwsbdjPdAS4ok5QmI3buL1y/XRxTKivyLXDS0C3PbtinwjjLki4fH5Q5+Zf0UlDhyKvMieJFL9Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ND390zxj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ND390zxj"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 545C0giv016159
	for <linux-kernel@vger.kernel.org>; Mon, 5 May 2025 14:14:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N4sMPDgul+5aEBpACagOkB2ejQOvDaMfk9F++ofP/og=; b=ND390zxjLditdSh9
	kiFSZFnTqnxOxxGjuzKTkdXrBLm7fTfzneNq/E3ltm5M6SYwWueTLPTMBKFhtATE
	dKwrB0vksp4iEuvR7wG+pQ1Z+hT5ZFw/bAsy36tAIad2JLVUPSaj52ElDhKq88G8
	8JvwImFXBm+Ex2hGLjcyNvStD5SFg0qzBYn9X8i3V/id0XYcH+LBgFIE/ebVsPI8
	d7JL5hVjMt+Gg/7gxfV/v3CLfnnhJCo2+pQWobOYtDAwMxqw4OzTWN4MTine0DcA
	nBEVRWI9fOldTEbcyPEYwDlm3rQOvNiISPfvdXviaT/id2xQgdwFaD10wOOSkGiZ
	L9du1w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dafg4acy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 14:14:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c790dc38b4so790438285a.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 07:14:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746454491; x=1747059291;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N4sMPDgul+5aEBpACagOkB2ejQOvDaMfk9F++ofP/og=;
        b=boX2jv/Lgp/iaZgucujZnypNZlX3n2Z7D8pBtXbDK3bPCo/uRf1ckblsHXyzJz0Xvz
         soDM8E5H509DzD0FGLARcg37PxDq/xypkJ+QUziF/D/VstDqcAP6Wj/nQ4mlbni2oqjK
         /zdYiayYkluLFAH/2rhQk19lPUEQBc/zk/prjIv6zH15Z8JNl+TUcLzW9aRSrmQjfzsR
         0QqrR3FAl5PEXTn131eydMZO52swdsbxoDK03DkGZQlpSlwbhrTWXUzjd/mrOMlqr4T0
         jWv6ngnAJslz4VmrvqodkV6YM4EbRF3Uxf03SMxy2BdSCac/kUU+sFP5lZsKkY4fNQin
         9sNA==
X-Forwarded-Encrypted: i=1; AJvYcCV/TsPMMrIxPKB3Fqc3EykP5fy1tRrizd31qq+jNm9bW2sWpmqF4EFsjenyNTztlQmhMrh+fRlSO6MWW4E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzRN/npJqsFr8qmsvJa4eag/8lDmfkcJIhI06hS6ZbKkH8zXzj
	pfEn6427ViQw9EtTcVBOjd5jrlJu5Tcutp6y88roG9H9PoSsrJPKAfst0cwd9mcyWBuTJ6zTm0p
	BlFTBcxp+1UdfD6OQ3wxB9/p6V+zL+OHxL6I9ZBBuHjpTC79FTsM/S9/e18IXAI4=
X-Gm-Gg: ASbGncuSfm0qfylM5Jmk8WUnD+N9x9CfM8McwoJ4QHi/jO6hLF+iEGSQrOtU0n8pT9t
	JgiWrKFsee5+qxAHEj20ZHA1TYI91VgTv4uGt06OlrfouiNEAyYMOhUHra9mqLivSDasMozGwB3
	Yv72ZhCsFA/X8qTuGGs9ZpXWYvJpcraTXMGm92abT2JLkc7ihpzC1NmeIKzvN1WxgRDrWpbMte8
	dNpdUEuRX70c3G1cB0bXtcvLCU0VzdOAZM+5YEKwyKGP+JI93cxCBI+sOCZ/Q0AJNoOmzCEjpCJ
	Q+BpN1Jvjdu+E0CPdbfKq8OgxKA2+qAU55V81tir6xGmY3ObFwdwLxGPzYalfXhW7d83czgDBdG
	PezSfi02PDc92fu8bIdiF6V1EfGs4W8i7p4hlYe+pDk69jONMzlYIyusWwslbnSGLjlX9
X-Received: by 2002:a05:620a:2697:b0:7c3:ca29:c87e with SMTP id af79cd13be357-7cacea24688mr2331709885a.21.1746454491523;
        Mon, 05 May 2025 07:14:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/vBvLz2xsMDmp49gK5gm96O/Tw7T3JFctVTVSeo6t9VZN8IC+KDCL2/JJC8O+HXJyk28oEw==
X-Received: by 2002:a05:620a:2697:b0:7c3:ca29:c87e with SMTP id af79cd13be357-7cacea24688mr2331704185a.21.1746454491141;
        Mon, 05 May 2025 07:14:51 -0700 (PDT)
Received: from ?IPV6:2001:14bb:671:42db:147e:6740:cd7c:7688? (2001-14bb-671-42db-147e-6740-cd7c-7688.rev.dnainternet.fi. [2001:14bb:671:42db:147e:6740:cd7c:7688])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94f6613sm1721233e87.217.2025.05.05.07.14.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 07:14:50 -0700 (PDT)
Message-ID: <f56c19a0-18d7-438d-8d05-98ae7a842959@oss.qualcomm.com>
Date: Mon, 5 May 2025 17:14:48 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 15/24] drm/msm/dsi/phy: Define PHY_CMN_CTRL_0 bitfields
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Clark <robdclark@chromium.org>, linux-clk@vger.kernel.org,
        Srinivas Kandagatla <srini@kernel.org>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
 <20250430-b4-sm8750-display-v5-15-8cab30c3e4df@linaro.org>
 <j47udhqq3ldsza3cr6a6rd5dq7uxjgpolbmdhmpzvzt7glpuva@v5tgkydlywag>
 <97e49dc5-9cca-4c85-b0b0-18c472d0ec0d@linaro.org>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <97e49dc5-9cca-4c85-b0b0-18c472d0ec0d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: cNbB1MI-x7wItSjvtMKO85iRtP5Wp38w
X-Proofpoint-ORIG-GUID: cNbB1MI-x7wItSjvtMKO85iRtP5Wp38w
X-Authority-Analysis: v=2.4 cv=atqyCTZV c=1 sm=1 tr=0 ts=6818c7dc cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=F9VSnBJ7OdIsbtMwzSAA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDEzNyBTYWx0ZWRfXyUzTV1k4Rfhr
 NfWktji994RSjojafoP7NTP3Nu3Olbyp+oeNPhAkl5YnTSaB0ZUCXvsjC1/fC4tha4pQpvUGdZS
 qxF2oH6TD3Exi82C28m7LoRV+EySiODsCkbha4WE1Ez+M2UnqqoDLlkX5ftyUO3NBUg/6zKHoek
 pc2K0xc6BGyEvP/GxmQ9iDO6GzzyMy/BH8gzsz2m9UdNgSix32Bf+0GIwofbfiGMxNqWhRgFI4d
 GgI0lhnLU7aHQohZ2adr4VmyNI2P36bxoCFQIwj+iBvcJv9nb7LD7h0iUeMVxVyCSsyhv6zadbL
 kbKpApbXW6Qqps62zcJy1ibM4u+ye6qAZRc/tvfTs9eWH1wwWl9LcETDnHt/u4yKH7vsa3xW7t2
 BNkF9BqXjPS7bO5MsSGrfUR+j0aRd3oKrL9cV7idoY2GaJAoDUJIJxzjGNIhs2IiuMpGozcf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_06,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 mlxlogscore=984 mlxscore=0 impostorscore=0 adultscore=0
 clxscore=1015 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050137

On 05/05/2025 09:17, Krzysztof Kozlowski wrote:
> On 03/05/2025 00:44, Dmitry Baryshkov wrote:
>> On Wed, Apr 30, 2025 at 03:00:45PM +0200, Krzysztof Kozlowski wrote:
>>> Add bitfields for PHY_CMN_CTRL_0 registers to avoid hard-coding bit
>>> masks and shifts and make the code a bit more readable.
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>
>>> ---
>>>
>>> Changes in v5:
>>> 1. New patch
>>> ---
>>>   drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c             |  9 ++++++---
>>>   drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml | 11 ++++++++++-
>>>   2 files changed, 16 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>>> index ca1a120f630a3650bf6d9f9d426cccea88c22e7f..7ef0aa7ff41b7d10d2630405c3d2f541957f19ea 100644
>>> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>>> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>>> @@ -362,17 +362,19 @@ static int dsi_pll_7nm_lock_status(struct dsi_pll_7nm *pll)
>>>   static void dsi_pll_disable_pll_bias(struct dsi_pll_7nm *pll)
>>>   {
>>>   	u32 data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
>>
>> This (and several following functions) should be triggering a warning
>> regarding empty line after variable declaration block.
> 
> You mean --strict or what? It is common to have the &= immediately after
> assignment, so that's why I chosen that syntax. It is just more
> readable, but I understand your comment that you want --strict
> compliancen even if it hurts readability, so I'll change it.

I'd probably prefer to split variable declaration and readl invocation. 
Then the code will be logical with &= comining on the line adjacent to 
readl().

> 
> 
> 
> Best regards,
> Krzysztof


-- 
With best wishes
Dmitry
