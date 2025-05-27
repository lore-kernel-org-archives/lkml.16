Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF55025F975
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 17:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748368747; cv=none; b=JODKrQB3NdKkGrjrbTReRb69E9PqbDZSl8tycOfEEykscgH9s94ibvvDlADIOFxhkzEpvR6HDgFVy+eMlJLtS4beZ0wima0TgNzTZgD8KMB8aIWtmbURIsaIQtQo42i/maYq4SPEKqGho637/K4HrSzuvIcUnSRIi7vSGnXjQUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748368747; c=relaxed/simple;
	bh=UGrqzMlCpoX8Goldm4ROWrpBkVV8AA4n0KqUY/WB7MY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=egCkBrBqls8/0T5zjWSw6DvRbS90vSu37wWS7fbbVVGy/pM0kcLR+VG02WFSzad5P2gROJAXERWfJtgwC02FoiLOj5frZS1OQATeTSFJPE7EcmckI5HL6ftMSt25g5kVR4qpEvs22Y4Sk5sHYAUwSxIzG+T/vijRvVeA71X2diw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OpTVDw1U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OpTVDw1U"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RAZRfY022962
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 17:59:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q2GYwQWvLDehVexEpnKVnL5W3PAsk05c4IXTOLkYRtI=; b=OpTVDw1UnCgyDdC/
	MCI6MRkJCpBTnLgSBupMo9wnC56yI9tSOsKgG163I7u/AWwy77cXFj6gMx1XJQsP
	Zo17Vp1W4Zq1JQvdBpGvzpwqIx8e0J05UwEz5MloZbk+IZMTEdY5wnFI1fs6VmGB
	FgeSzMvRTecU08yaInbUdHvP3EYL7XcY8EU3yJaFM1722b+ylEeHDHLXbnjLOWUl
	7FyRzRq+cAxytrMTCAh1Dx308svyjwHfQiDvP7pD1rI3z6xv3VavtXM/Mj2SZusO
	O6SqGwf1cXZYS+ux3ZPsDLlo7YRCkHe51taX1ef3HUY8JcNTnoF/RawyRp1XnXHs
	WLHc9A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46vmgcv79w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 17:59:04 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c790dc38b4so19351585a.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 10:59:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748368744; x=1748973544;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q2GYwQWvLDehVexEpnKVnL5W3PAsk05c4IXTOLkYRtI=;
        b=Vu1hAA9Wrla8VtlZHbgJSeUH9MufiyFxKlK/CmGBFt7BBZcUjwqMtqYfPkUy9RQpIK
         ftCacwbFNiUAe2nGqSDa6t3hddPkei27kjxgwKoriyz/1q2/9Jsyt2XXcW379ZGNCBjN
         W1jOY8Q7M4attghfnNVrIVlVaDjtAVbxMvjbJ+vfEa7QQPx+Aj0MRUEjFzUlzbjSBL7v
         Idvz7uK5HEN5RCvFWKD0Dcm4hnDG7YVClKblq4i/9zyNC9vyv5shISlIWV1JK3E1P3Vt
         9x4Pg2B3qG4Z3MoGNGXUuFMrqgOKoJuoV2nkYN6BQkkQPT6MHPErRApaPrx2H5+45OLT
         GpwA==
X-Forwarded-Encrypted: i=1; AJvYcCXgowNKeZ93KZqtf24nPSd0ttzkyrPtShF61XIcMderJCvk7gSf1qg6VmXmvFMPtgxnEJiuHS+/9uMcmU8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgfB9UgcOEF/z9XGMsA5bHqYajkfqzm0XMlM7M+mjViEepzSkv
	af67n3Hy+ouKS0B3H+rNELi8UQ5MPbm63dGSOJUd6CjGa9SVvE3NVJ/1JhJpEqdP2ic5v38nIFF
	+2o37o6J8eFwDEcg3jVM6WFRxAwM630gJ7SJbzdyESqMzJP+H8BNBXTNm8QTaCO0XCn8=
X-Gm-Gg: ASbGncsO/O5l3C7CdGQDee3QtUOxOPgHvFhiIWfUzWbYKpV7Agy5JkRpVfakZg/VGCY
	3O7oSk5wMSlMy4oN5ln9tSthD1Jnxnws+RqFZaiw2XQaqC9kBYGCi6gtxavfUdy83PlYTCa2VeR
	yPkKP5toDC/RzMjZOfhqTm3iHktt/dNw/tABxSRgSg/x3Jp4pPHfCnnYbgtgCtgEuu/4nk+B7zu
	A317j03OM6ngDeuw6atssvDD9careBlP0EgJW2/Vy0Aqmo8ZumnW1yKYYrcnAy0vFr9lJ+kqyvG
	+tale/Pt4Xm74U79FggGd/+fGotMKyyl3Ya6yb1bs9ih6J7h3EsD67FrttvaMypmtQ==
X-Received: by 2002:a05:620a:2b99:b0:7cc:13f:fa30 with SMTP id af79cd13be357-7cf06dae508mr200609885a.27.1748368743757;
        Tue, 27 May 2025 10:59:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEV42QuI+o0ObvOlA9nelVctqH0EcLGjZmTZYrszeNqEsSUQnYPR7mAD6Ra+fFCXIFAPsslmw==
X-Received: by 2002:a05:620a:2b99:b0:7cc:13f:fa30 with SMTP id af79cd13be357-7cf06dae508mr200606885a.27.1748368743424;
        Tue, 27 May 2025 10:59:03 -0700 (PDT)
Received: from [10.172.99.180] (37-33-128-129.bb.dnainternet.fi. [37.33.128.129])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532d666ae0sm92728e87.225.2025.05.27.10.59.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 10:59:02 -0700 (PDT)
Message-ID: <9563595c-7b02-48f5-9f62-eeb35547981f@oss.qualcomm.com>
Date: Tue, 27 May 2025 20:59:01 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/connector: only call HDMI audio helper plugged cb if
 non-null
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20250527-hdmi-audio-helper-remove-fix-v1-1-6cf77de364d8@collabora.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250527-hdmi-audio-helper-remove-fix-v1-1-6cf77de364d8@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: f-EBvobEV3v9cwmTsG5vwLrWTnDFY_Yo
X-Proofpoint-GUID: f-EBvobEV3v9cwmTsG5vwLrWTnDFY_Yo
X-Authority-Analysis: v=2.4 cv=Ws4rMcfv c=1 sm=1 tr=0 ts=6835fd68 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=6k2OflH5rXnsPsZLZHiYtw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8
 a=3R2PNEn0RuH7tX0IixoA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDE0OCBTYWx0ZWRfX3jm8I8BmrJOd
 Rrw9mfbi2zu5224Auk14LI8PyieeByyae2CB/Q16wWBdebmq/IRiYZ0AcJoMAXEO7MStp/kc/NP
 8DRS88Pcy5vfUt9c558A25+VRhP1VQoBq2e3vSb/XHERgWMZcx+7fNF4Of4q0pUplkh+yBnmoff
 DOtYG14XSGmcSuS0ScfBRB2RjAcr9Dn5HD1qH7cJ1UHr7bCTfuhiu1p+cPVLspUOPIEQFt/v0ff
 ol9aBMWVfrOpY8lGW4vSkcm+v0qA28KzaXAhHUVz0OexvaYRiEtDL1pJFmgYOLGxsVeQqHgbyys
 PYh988zUaKlbb3x3p0j2CfYHYIXd2RbQ05J/BlNQ/j7cjx91h+JIk9SDS7X3qLGNyC/Ozq7J93L
 WuRkYlHDOauPUw178IcyrYucp63Z9T7nc6x43Gznr4C+mYvghKlkUy6Gy9vfnmLkRACqhrf1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_08,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 mlxlogscore=987 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 bulkscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505270148

On 27/05/2025 20:57, Nicolas Frattaroli wrote:
> On driver remove, sound/soc/codecs/hdmi-codec.c calls the plugged_cb
> with NULL as the callback function and codec_dev, as seen in its
> hdmi_remove function.
> 
> The HDMI audio helper then happily tries calling said null function
> pointer, and produces an Oops as a result.
> 
> Fix this by only executing the callback if fn is non-null. This means
> the .plugged_cb and .plugged_cb_dev members still get appropriately
> cleared.
> 
> Fixes: baf616647fe6 ("drm/connector: implement generic HDMI audio helpers")
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>   drivers/gpu/drm/display/drm_hdmi_audio_helper.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
