Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2CB62356C9
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 17:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746810356; cv=none; b=DRFpLrL1Mvs/xPeZfTGBi6xWxIwItK7m7IHwUswQyxozbLOtZRZI0b83z4bUvIcArqAyFQp61vFhMEegZE4AFJWSijkBqsizEKAtmXWaHTWqvt9h5upp9dCzyt6Zy3Tr0MHil+g+kFsatup9bBs1zDkRsaBcH5NO6NSWJpPjXC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746810356; c=relaxed/simple;
	bh=r0m0UW+PEU5BgL2NqVdok8cHtVoDL41wqAjRR1VyHgQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EzN4di8043SQKAQaebhWNTT2Blo2NF+wSQ6u0NO/514Qdh9Z2hJLJt2s4v1Fq6NnUWkQNxwmEYudDTm2jviruyEqRcIdoH8YbL+LBmKVgiYTSrGQalH6YdZ3R3JJdW4IAZy4MG/buyfXRp/Mcn+thdiXAG0hYoBKy+SML1ECHQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fa8OpSNk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fa8OpSNk"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 549C63KG016175
	for <linux-kernel@vger.kernel.org>; Fri, 9 May 2025 17:05:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bYZFtTpQ2K5+1pV5SB83yilhOw8IrH8U9j0WoHmd6qg=; b=fa8OpSNk2ZXlXsKe
	XASyk+9t77O0nPWWfpPX3oIH7QD4tWzx26SShdjm5jDHdirNDGKgzJqmfEr3Isiy
	Vo87v3AxkR2wmD1BbYTEuiktxnDvYUgWXgBRV1PwvKAQPyxHm4hypCLiVYqkHJb6
	fQnt/jEAwyp4+RFheRMt1ILP/TMGXv3MADpwe+pPYtmMpmBHc0pzNmu4S7FkZeiY
	vv971hbuON/33iCIixZ4nFFrfomtPm8nHtfYdP+hftVFWELlHR4d9H2knvSCF3zb
	akgC3CkRgqn49bAEh2RRmujymXT3k1iHaDrLR6eMyOCBxFCSxL1WaG9JFGMjrXP6
	fy61Mg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp8w9dw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 17:05:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5af539464so60516985a.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 10:05:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746810353; x=1747415153;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bYZFtTpQ2K5+1pV5SB83yilhOw8IrH8U9j0WoHmd6qg=;
        b=YpFsH9NcJ5IR5vQuCCcPo1r3zJBbJvjtWlg1HUE6KUrqOXVGBs/A/DZLi73aJjQXbR
         eTckPs9obkF1xzQWXD4GBEwvDKQUwX0xGr/9a+CVqtKmG42rrIqV9+huofYLT/luVH5E
         /g9N6oaqNvggoAeK5WNCGiJIMI5TJ8Rr8xlwvbsT/Jp2BjNVGvaYU9p2az9RlC9BvNBM
         Wfl5J3MSq+/9V5fD8uOon03DdE5zlxA0RSoG7R+IWtLn3rGlVwZXQn+qOPq5xk63Mf0P
         UIo4VfnITCXcUpBB3oLReV8JPh0dx3/QzmpIaioMuk53bk/XR2lWgUPyagDwH3Se5wx2
         uNMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVO6czHubERWv9bd0e7rslepNodCEHs5SaAfMsKYBphESV7xVaE1y42hJSArqznxpld77NQzzG6jQJ3tQA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhEF4geXPyJBMSNTK4poN8xdlNsc++516llDC5fOqonLkCDxyh
	dbBnYBQmGNLXOShzCdu7+Sm+ZYDS2tgafnXGFnSQnC2IYW40iXNj0Z6Z2V82+sx+ZnXIab7sNiA
	vGmFtiMK99plB7OtHnHnoyQo0GjfPElbAz9Vy9erA+bkXaJun9nOyhln8ZGUiIW0=
X-Gm-Gg: ASbGncvyLow9wfdEwqiA9/z5tWUJYQdUzwn9wxcBdncbBZcaJoVVi9Y0JHsIb4hogPL
	SFEE5d9vcCG8n3uRgdBxijP5kNZpaX4cCPljNmKM08ZbsuwpANP9XW/pryQeSzk+zzoxCo7LdKv
	++5E0Tl23XCJW5s0eKrlWUs6vtU7A3Ftixty9FmnzYVDOHrlrwEWa9/B6JBg/W8ZgYlDXcAEyED
	HwmIYJ1wFeGjLBS1sSo/XFCwBDzERRrFRSrcc/M2DjDIgqnXJJKsLsMdedrz5zSyinytxDgjEDE
	k/P2lmAzenajm3JBtTs6PzDi411rALCyKesHOnAkOs48A5G55sZqFhBIfBp4Wb0jTqA=
X-Received: by 2002:a05:620a:318e:b0:7c0:9dc9:754b with SMTP id af79cd13be357-7cd01138c43mr237841285a.0.1746810352564;
        Fri, 09 May 2025 10:05:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbRp4cqQeIx22c94yzN7HcBSLTFgM40PIl1UVIm+gxSUeSDFOZOAzyxFmgxbh2fxCrwm5SDQ==
X-Received: by 2002:a05:620a:318e:b0:7c0:9dc9:754b with SMTP id af79cd13be357-7cd01138c43mr237836785a.0.1746810351945;
        Fri, 09 May 2025 10:05:51 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2192c8ac2sm176736566b.27.2025.05.09.10.05.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 10:05:50 -0700 (PDT)
Message-ID: <249fa3ea-4b0d-475d-8851-5a31795f3b11@oss.qualcomm.com>
Date: Fri, 9 May 2025 19:05:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/7] drm/msm/a6xx: Increase HFI response timeout
To: Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Maya Matuszczyk <maccraft123mc@gmail.com>,
        Anthony Ruhier <aruhier@mailbox.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org
References: <20250503-gpu-acd-v6-0-ab1b52866c64@quicinc.com>
 <20250503-gpu-acd-v6-2-ab1b52866c64@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250503-gpu-acd-v6-2-ab1b52866c64@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: IaMUN7pai4Q7cTr4f2sZQNn-4aB-8gcu
X-Proofpoint-ORIG-GUID: IaMUN7pai4Q7cTr4f2sZQNn-4aB-8gcu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDE2OSBTYWx0ZWRfXy6/ZmUCwX+wd
 krMangV5BhaOLqJIQqO6pNjan5Kks4rVfgZq7lm5RXat/ZC86w/bl8ELbrjEkgkEWZk/SpUYdKk
 XUJSreOBDAD5zC7dKpuIgpeeuLeZMQDfRCfOcf+Q4+qEiHkVMm/xkoqKRqWqGFWAKSIiqpGuSNH
 iMCfVWOQ7e/GN0tpFytlMsNVRi41oPVxvUIx5msfLT13EcV3bPwz6kBpxvB8ZavfZFFZNzLMohS
 Plx9jsdXA2gI1J+5ABqQuvSH6m1R+Vyld6Okn7eq8f817VF9ErQyJQzsDPmaHNpXS/zW3yw7R1q
 NJtGb94kkcIl2sxmywtDnU/j60Ta1VtuDCb9I6YE5bu9K6q2yTWb0LgbTnQ8baIBG6SoKfXAX2G
 PyhPpvQat/D/N8N3ST+KUXhJ+2/36lHSoUMp93e7VBXJDQGLs3C9J14ElnYd1EjrT37Z8jTg
X-Authority-Analysis: v=2.4 cv=e/4GSbp/ c=1 sm=1 tr=0 ts=681e35f1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=pGLkceISAAAA:8 a=b3CbU_ItAAAA:8
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=qaMJGrL2tkxVvb42h3kA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=Rv2g8BkzVjQTVhhssdqe:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_06,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 clxscore=1015
 mlxlogscore=976 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 mlxscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505090169

On 5/3/25 9:03 AM, Akhil P Oommen wrote:
> When ACD feature is enabled, it triggers some internal calibrations
> which result in a pretty long delay during the first HFI perf vote.
> So, increase the HFI response timeout to match the downstream driver.
> 
> Tested-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> Tested-by: Anthony Ruhier <aruhier@mailbox.org>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
