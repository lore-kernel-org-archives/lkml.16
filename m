Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51680289E17
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 08:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751876673; cv=none; b=NSshm5y32xKmqN+QUd5UwIt4JF/Q0KT3xlwAJ7Gj3PusSLL48CeAnRZiIeauGzJdKZOMIWNqME7uAVWpBMIvqCnYtzNoO5W8dgsO2ljxSeYZiWRZfT5tdNLIN8BpmVRFcETPQh5GV++VYfW6IhLQktBvp5GUwRiolJlZvHb927M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751876673; c=relaxed/simple;
	bh=08f1MgkJS/MdrAG/JH0e1/2zkyJyP2K7GUuU9LnySrc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YvkKso7HK8PbNEdRQiMbgcruWCbq+hBZjeza1DWzYGe8PwsaMPy8UdI4XG4H9CJ3rIqtuiLhzeyayI/5KswUvWa3hMk5+5xAoIXX68rkBCaNUB2yWmcRZs7a/MBxyUNBQoCThTbpc0nn9AVoQoo7Pyl6/6AO3AlBDD7QGVDph2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i4QqyX4Z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i4QqyX4Z"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5670kJ0w030762
	for <linux-kernel@vger.kernel.org>; Mon, 7 Jul 2025 08:24:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MbM0Na9BGNYEY76leSiVEoIRTJwjEgEbW28UaU8pTrc=; b=i4QqyX4ZhQI6uWob
	/5qiPClMeuKoOkZlPichiL69OnNlj8hk6lULpnkN1J1VZo1mjErOEnbqc2wFahFt
	iNUSOt/kxErcAiLvl4mgN5oKSfJX90zPTo9Zip6pBuQw3WIkMPVFl//ZiksqlZNB
	/uT/Cs77uHam+gIKPG1kHUJNsG8knQoteP1R1iI6tCQYzqgxMICwn1jjvdt0BSb6
	OTUuuu7l4/uW1/SZz1zIFAIRDs/XY+HERQgR/F2aySgwXUdIChbHCwiXtP9msLUM
	3jDEWjhEIrf6hA8nXLQO7IuMBeUe2plDJRrw7nuSyrAKUtBWjBgLAqi0nv/9NvOU
	8MtIjg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pw7qax85-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 08:24:30 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d0a9d20c2eso24460585a.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 01:24:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751876669; x=1752481469;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MbM0Na9BGNYEY76leSiVEoIRTJwjEgEbW28UaU8pTrc=;
        b=gliIUJ0HOJLlii6BqA+rnKa7a1xVUBUrdQ3Pn9DonpsEl03+HoRs/Gi5B+w0WZVLtj
         6D2axTUKQC9OG1/TIvV04YfN9zfKrHoiUNM3HpdjEUpLrs5BTGOkSDPeA6GC8jfk0Xrp
         7dD9WrYj3cPy396aEDQI5PZobPWxqEP4+n4EP31VZjVuuscrF84Pt/x57c/gwK1LqueI
         skgt6BdCV1igLSGAwlbDAUvVbwaL007cKPsXEjZH2YzKUkNkKOQD3XEgq5uwQAjKcstZ
         zXC8oSuV6TXI7Xwtrr6KUxbI0k5eNGq7cu1besyoMdlGqIFNornsAFqhPv7t/Wh3vNpk
         FMOg==
X-Forwarded-Encrypted: i=1; AJvYcCVma79c9Q1cx/ZNTmzxXYF5V4RIC1aPIvTKvdZfb8EjnsiWrcFgji4Qh8ec4C8gVa/T5DqZA4ld4YHk1xY=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywjh76mSxC07zZrlZXr7qKvT/DmBn4qZo7cvztnPU1OH7UOY6t1
	y0A4W4ovEUJozFlnZT+7rgTesjsh9/AH5pFoYiawCqCSVwvVHUVWgkImwiRjdwQiO+gOYa3CKjo
	XF7Oyq6hWeBwsznsNZCp41pv0tgNP9Y3chA6GMmPTVamc0ltD7es//bezrS0Zyej1G0k=
X-Gm-Gg: ASbGnctq48H9AHKM8koHUoi8ieeycLKJQsAAmrOZzIgChCjZvuipa4JSZfu0pp96yfx
	3nzVrBf3DVW5nVRfIuPeDj27J1GwkOufYv/B2W2VWvo1xUNEOoyifK8WVn3ltuCYJOktByi2hx7
	hwfMlUaQCLtfKTI9tW55NCKPNLsfS+tMslgxgH4UUFhwrv/ipz28iEbgts1Nso+Gt6UtTE6Y921
	672SfkARt/vEufKK527rzXn10Dpxls6v9xd0ExMOowBTzYXmM9gwVnvF0vmdXfwdJswYs32yFkT
	wF2YuzBQ+vb23DVg0yzTXCqE54Bo1klNNv1gWxRmrmanXsl5nVlNz3BO7kfjtE7vnFCl13o91lz
	Dh8M=
X-Received: by 2002:a05:622a:8356:b0:4a9:a2d2:5cd6 with SMTP id d75a77b69052e-4a9a2d2634cmr41323361cf.6.1751876669221;
        Mon, 07 Jul 2025 01:24:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAhUSYigL5oM1altpor3qk4P5f5OHAvNg9UYt6fOM60gyonRu+BrBPx55Xo/pckv1Ovocl8w==
X-Received: by 2002:a05:622a:8356:b0:4a9:a2d2:5cd6 with SMTP id d75a77b69052e-4a9a2d2634cmr41323171cf.6.1751876668843;
        Mon, 07 Jul 2025 01:24:28 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66e8c31sm668150966b.18.2025.07.07.01.24.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 01:24:28 -0700 (PDT)
Message-ID: <17aa8f1f-f293-4ba8-a947-08d9b3618f5b@oss.qualcomm.com>
Date: Mon, 7 Jul 2025 10:24:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sc8180x: modernize MDSS device
 definition
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250704-mdss-schema-v1-0-e978e4e73e14@oss.qualcomm.com>
 <20250704-mdss-schema-v1-4-e978e4e73e14@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250704-mdss-schema-v1-4-e978e4e73e14@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDA0NyBTYWx0ZWRfX75B6+Znjkc0Z
 tzqJIJ8VgnxzxNUJZRDaWXBzokEvigFHNmZRwdo/261OUl2SQzMIOt+MeWdiiL7t1LeVJigFcQn
 iainWGNyhzIk3IKeBGnweCl712oW1zM6lr5YvyqhMr+YkKJLlGO1hX966l+XmxcJVpcwp6QqM/S
 mIApF5TtD//D4oEcxkZ3wrfgQ0Z8m3VhJN21mQ+NxcnAg8poIhydFo44i9r4CvbzsQoQjT4TXRS
 mW/cdYZokdeTFWE6GRugAK5NKUqr/ZlSKIxAChaoZfKRpTisV5BFWSdhMyQGoEUY674KRIyeAHa
 zGu/NXu8ElCdntsjtBypxmohiOGWcPGJ9xAiAon7i2Y7TTVPipj98oWz2Q9NsUnVyOigNoSf7Xj
 r6cbylFDPGrm3uULny35GZvXx8iJ38fRnUcz3eeVSYkXQqRkKB7VjDbPK5Y976JV78ZnyNSv
X-Proofpoint-GUID: RZcwJGK9hMWFKIDWnpJVIXTgz6C8VRMo
X-Proofpoint-ORIG-GUID: RZcwJGK9hMWFKIDWnpJVIXTgz6C8VRMo
X-Authority-Analysis: v=2.4 cv=SOBCVPvH c=1 sm=1 tr=0 ts=686b843e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=UvoLlU4ym182rRgf1HoA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_01,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 mlxlogscore=910 mlxscore=0 phishscore=0 malwarescore=0
 adultscore=0 suspectscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507070047

On 7/4/25 6:31 PM, Dmitry Baryshkov wrote:
> Follow the lead of other platforms and update DT description of the MDSS
> device:
> 
> - Use generic node names (dislpay-subsystem, display-controller, phy)
>   instead of the platform-specific ones (mdss, mdp, dsi-phy)
> - Add platform-specific compatible string to DSI controllers.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
