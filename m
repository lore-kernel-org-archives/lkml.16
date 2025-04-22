Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3BE727815F
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 13:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745329080; cv=none; b=M4ifQO7w1ulBw/OohKKHjIkxC/l5aD3EIzApSDVdZfkQw3gKT6UI8frWUOl9pzQZZvgPjlHThysamZKfpOMUbMS3Ffx8sbe7Ffo2soVWtAo3fnv0Kc7XMKh23oih6eqweP+4qMktk7gNgmKiftRFw/dqhfdDP1WjzmXWpyHnox4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745329080; c=relaxed/simple;
	bh=hs/KULLT3NdIW9FT/4EVSYghokrCjq2zBPZXmtOIrKo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UCiCTMByygyLidNyj0eqHaZ0f/EPEEIXzjS4z0HO8Xazr9+ZOy/BKHXA93+Mv4DmHro8cjVMEyNZGLUlXGn7i3kGL9gSQB1TYoZvM9HZcUk19y3aIUODzf/u2rcHL64iJ2inXWOlC1m5MV5eXtEmemhswTI9Gg025nbRGO2hyMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aeADmndm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aeADmndm"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53MCvmrZ006443
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 13:37:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GM4iFtyzqSsCummFikJQupbCmlSMeouuwE+lB7Uj1zQ=; b=aeADmndm6tJVAhfa
	m9hM9FuJQrSmny9BgTCNxJOzoQ4Aw0p46VZStJpnpYi2iHC6Uf7qzzbtPoeXWns/
	t9+vw/E2i5quOOBUxOH5tDxkVDOnyHBQzrXTL6s32o+o5aW7o+nAMqgDCjtDk0FK
	/6/x4n2i08PSmMc+U80uLETxgAvNB5Ls9QSsMz8AGZOs5FXgJcxp+WL8i1XJL/bu
	c/VfwFe7EMjLn08xeMb0fkm5d5aYi8kiBe1wh7IttwgLvmTQTFGE+GuGoQlQR8RQ
	LDbFA3VGPpC0MfsvUgoiWPCjhVFLNvm1kP6Y270XVq+2eWTuJNfGFsj/boJjDQ9V
	I5VJmQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 464426qj25-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 13:37:57 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e8f9450b19so111155456d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 06:37:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745329076; x=1745933876;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GM4iFtyzqSsCummFikJQupbCmlSMeouuwE+lB7Uj1zQ=;
        b=RCfMYnU8w1lT47qiiXWne0sUEt4lm8tRODbBXgpuarZvBae+Rqe6wKrkVQ3fJFtMXO
         1tHBxnYe27eOHQfwVlwqw97S3ISl3SK5vvJ6WsfyxeH9dxBFXjGtpbZmKOsJcMUVqj0T
         VLmG1p8FXV/4txRhk38MZrWO06Swwb782+OKtWhNpnuT8oQStVAXQfqXDiNuFYhOYn7a
         DMz7J7cavmtMpPBAMp4RtOWxsmQjrP0qFiBRqDlk10Q56+0xoW9yf9PrwdVuzsftWbSR
         yPc3OzL1b81OtQQ8QYiiaO0/iUZZq/QseO5W8ypOb8S9yHb9KrbMbIOHSaYPlGAOfacC
         cm8A==
X-Gm-Message-State: AOJu0Yx82DBcW8raFzLiVfSNOb1Xd9l38T2gSAtCBsqVWZN6O3CHlWZW
	NWRvYGsgWp2IQ0xUrPzeSSzuUDRbwVkdfANaOzMprE8ivIELNmZd7wwi1rNvNiQuqm206M2XWbf
	eKpI1xCWzYxu1owS1VRAB59iuk5+IA/vPWT27gP4mOa2gQjM3A7/5mHWGzr3retI=
X-Gm-Gg: ASbGncsoz2vHWzbOZ8ljmRh9k7zk/BFKejkb+67FL4TWG8lWPRYCe3f9Ibv/r+zAYug
	R7mHgSPWeGHRQ2Hh8iSh8ptEuQTNDoaP0XwgMeO4g3RdejBFt9rns7KNjatfGdwJjIQG7GNtM7W
	Apft5Bh91pGo/p0KTKvDtvPFFf7wF+NG2ugOnFBzmaOefMo0wwLUIm/LEwyVtTETTWnpMJWct8y
	GbW3Vv98LNlvaZCyng851JGZiR3p0d2KcgafOJ7jOIuKDlHuq99dCS9Ai3L766c69kiA5S5rw0Y
	UrIm2UwgfMRbt2ENKfS47dVGfKEOAM21hA2JsRWLscmZOZjzXqdvp6D0J1cXlQggknj4nc82vYC
	oEhiyRwy/XWJSD2nrF4hDcaSu4uHI4DxTN0WcNT51ZLsFZCv6XTy56w3HSQUApwQK
X-Received: by 2002:a05:6214:124e:b0:6e4:4adb:8c29 with SMTP id 6a1803df08f44-6f2c270088fmr272713846d6.12.1745329075738;
        Tue, 22 Apr 2025 06:37:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFs5xmFsFakaRJU+iwqHLQfYpkknb90+sqtIxpjfjRPKBSqlIlI7xF2xKWLEcXvzJJAnoNEDA==
X-Received: by 2002:a05:6214:124e:b0:6e4:4adb:8c29 with SMTP id 6a1803df08f44-6f2c270088fmr272713396d6.12.1745329075396;
        Tue, 22 Apr 2025 06:37:55 -0700 (PDT)
Received: from ?IPV6:2001:14bb:a2:9556:18c8:3d0b:b936:c848? (2001-14bb-a2-9556-18c8-3d0b-b936-c848.rev.dnainternet.fi. [2001:14bb:a2:9556:18c8:3d0b:b936:c848])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3109084d9d0sm14805871fa.97.2025.04.22.06.37.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 06:37:54 -0700 (PDT)
Message-ID: <03cb5084-38ef-4827-9951-f54880ca8a07@oss.qualcomm.com>
Date: Tue, 22 Apr 2025 16:37:53 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] platform/chrome: cros_ec_typec: Allow DP configure to
 work
To: Stephen Boyd <swboyd@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>
Cc: linux-kernel@vger.kernel.org, patches@lists.linux.dev,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Conor Dooley <conor+dt@kernel.org>, Benson Leung <bleung@chromium.org>,
        chrome-platform@lists.linux.dev, Pin-yen Lin <treapking@chromium.org>,
        Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
        =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>,
        Jameson Thies <jthies@google.com>,
        Andrei Kuchynski <akuchynski@chromium.org>
References: <20250416000208.3568635-1-swboyd@chromium.org>
 <20250416000208.3568635-3-swboyd@chromium.org>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250416000208.3568635-3-swboyd@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 0n0e7ftYqI1GNvaCYaYfr9qzqU4ibHVY
X-Proofpoint-GUID: 0n0e7ftYqI1GNvaCYaYfr9qzqU4ibHVY
X-Authority-Analysis: v=2.4 cv=IP8CChvG c=1 sm=1 tr=0 ts=68079bb5 cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=cm27Pg_UAAAA:8 a=VwQbUJbxAAAA:8 a=1XWaLZrsAAAA:8 a=3E2bT0mqOhGjLt7avEEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_06,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 spamscore=0
 mlxscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504220103

On 16/04/2025 03:02, Stephen Boyd wrote:
> The DP altmode driver fails the configure stage because the status VDO
> that is spoofed in cros_typec_enable_dp() is missing a couple flags. Add
> them so that the configure succeeds. This has the nice side effect of
> properly reflecting the pin assignment and configuration of the DP
> altmode in sysfs.


Fixes?

> 
> Cc: Benson Leung <bleung@chromium.org>
> Cc: Tzung-Bi Shih <tzungbi@kernel.org>
> Cc: <chrome-platform@lists.linux.dev>
> Cc: Pin-yen Lin <treapking@chromium.org>
> Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> Cc: Łukasz Bartosik <ukaszb@chromium.org>
> Cc: Jameson Thies <jthies@google.com>
> Cc: Andrei Kuchynski <akuchynski@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>   drivers/platform/chrome/cros_ec_typec.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
> index 6ee182101bc9..2cbe29f08064 100644
> --- a/drivers/platform/chrome/cros_ec_typec.c
> +++ b/drivers/platform/chrome/cros_ec_typec.c
> @@ -531,7 +531,7 @@ static int cros_typec_enable_dp(struct cros_typec_data *typec,
>   	}
>   
>   	/* Status VDO. */
> -	dp_data.status = DP_STATUS_ENABLED;
> +	dp_data.status = DP_STATUS_ENABLED | DP_STATUS_CON_UFP_D | DP_STATUS_PREFER_MULTI_FUNC;
>   	if (port->mux_flags & USB_PD_MUX_HPD_IRQ)
>   		dp_data.status |= DP_STATUS_IRQ_HPD;
>   	if (port->mux_flags & USB_PD_MUX_HPD_LVL)


-- 
With best wishes
Dmitry
