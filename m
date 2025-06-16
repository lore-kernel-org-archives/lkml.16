Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD4A288C2B
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 16:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750092515; cv=none; b=U17YMfkYiK1V8y1YZvnkhxHOXnch12fhVk9hZoic98Gh+WoJjmcELdzakgr10wt3z4bXoi89gGesGbNiJXp/YgngZgM0d7GL3jvzzzaQVQ8Luehr/ZJsWDM4T3NXryXqnxaEY2mXnoZ7TwpXlLAxGnCkQOkuxFyCFFqvwEdKRf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750092515; c=relaxed/simple;
	bh=/h+0C0+QWS3aA/QPz3SawkeyoNRtLolokTJ/FYPaC3o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MhuYfUfIua4wYGDGO5+rwOCSoCQaA4WA4jHn5uwq/2zlBmOawOUf8GkfQ3wgNbzM3dJv+T52uc0nHVZIGKeJL5v8+g7spZc6ahF9FIGaXWFgpVKQbU70PZJouGiV5z04jbSlIhTeCINfieFKqTjTC9HQ9qoqp42WDhXtQx4bglI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d5Xd7REY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d5Xd7REY"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55GGSZTE010944
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 16:48:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lxyeOcoLjC3T2xwCWZvRjoeExdTH0SjUCC/Y0ERYeNQ=; b=d5Xd7REYM3S9gnS5
	n7bYGFpFbiw+1+kJ2EqZbnWEMgfB2xuele5T5Pwm9aKsDRA78/EKtOy0F2QNTYzT
	KJvLT7ey6fAz3mjnpAWR432o8QADvN+IEnRwpM9Yj6bc0Ge8sjvzz0ZWiAwbFZTq
	nSepVk6eUNbh2ajDno4AWOc80XhTQlCWJcNa+Xm0CfPGPAoe58ojfQ9t2H2KbETZ
	z7mYYqFgR+aN0ahVuhbD8tNmbaw4ythr6pL1F0kGDSq4MFutDxLYRwjZC/QWS+ot
	Q/wBmVMGl0R5Qzntex2p8lKoFoNZds64/OuZsZjde6FVoaFAvIo75Ja0bP5wgTr2
	Mlo+Yg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 479qp5kvk7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 16:48:33 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b26e33ae9d5so5395790a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 09:48:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750092513; x=1750697313;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lxyeOcoLjC3T2xwCWZvRjoeExdTH0SjUCC/Y0ERYeNQ=;
        b=fN7INorRflye0FaY48Rxdoy5MC3/kyQSfadb6rw5nlMQnOhdur1IV5RFtqqG6xhqCf
         9MYrDIs9oMfzWd5UdvQ554FKBWul8tVSWXnUMWH3Ovct3N2ZuYBp8c4TXpfxlJSHW1Qa
         5pwVQmy8AGKhU9ScfzOThATQz2/9IN9kvPjcOmXZ5AMPCVD98XO6BTjf7Wa0aWYzoUZ2
         Hcbx5mSQ9ALueavTwOlu1KELTbCVJBcgVch3TfbrAKhd8gOJdEZujkL3bj865pMYNWD9
         9C6U4mAypX74J0fHRq76Vlu0luFR0056FRCviuWgjVUaQAjOOH0tNUXyd9/lf3BQ3wl1
         tmTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxaX3aL3KTxsjZlnyJ4McxGNAVlzVaFO/zFUoZab2428466gOn59DhxEuuVqosuirM2Dii6wjbv2cfrvk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxchDICC5mGza8EVFy1p7zQqjxs1efqRsymDV1EBkdK2UvTVYtU
	jlNca9B73LB5EKqUBO2y1sIzQtm98WB0Ypt/HYkjJwXEm5LG3UxnaAwlWQ3HK2PisZ8koFoia7s
	5msOgbPPMM+k8RbAZ5wjTbFa63QTN1pGPDPC14rEzXBlTnwADo8AbWMN+xli4EQiOC6s=
X-Gm-Gg: ASbGnctFO0bH/1TaQk8jQMAfPgknnyV4EGmZKAO+0azG3daVVwxZvpa01+Bg4426mDN
	vPyCgpxnPNAd1OrKACcIGqeoUiNGKnkVGP6fo/wnGWzdskkVjZtjQaSkz97vJNVTEHyDzF7LO3c
	GBG64WSVEA+dukZjuIpte285LW0YtWe3g5jvaSHgVYAODGloBznIC/c/Fzi1TkV1H3HX9MhD6zs
	Zvgm9HM4HWg4uDjo5b3KhOhC8OQuVtogcDebZr3b3Vr3RK1Jrfuw+QtHs5ul2yAFinS0IG8JmIi
	AtFxqtwT0+409SkKNbzo8ESP0GrSZ0XR7l3771IA+A==
X-Received: by 2002:a05:6a21:318c:b0:215:d611:5d9b with SMTP id adf61e73a8af0-21fbd4bbd5fmr14908424637.12.1750092512626;
        Mon, 16 Jun 2025 09:48:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFiRsfJISsTnkxLW8qZGNZNt7p0Rfn9bVYWR0l8aBesdxG90+o4bb4c6x4zbi0HdUx7zVZcJw==
X-Received: by 2002:a05:6a21:318c:b0:215:d611:5d9b with SMTP id adf61e73a8af0-21fbd4bbd5fmr14908365637.12.1750092512245;
        Mon, 16 Jun 2025 09:48:32 -0700 (PDT)
Received: from [10.206.104.82] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fe1680454sm6019135a12.37.2025.06.16.09.48.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 09:48:31 -0700 (PDT)
Message-ID: <31c50188-986a-44e8-8765-c1fce6ad3c2c@oss.qualcomm.com>
Date: Mon, 16 Jun 2025 22:18:24 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: opp: adreno: Update regex of OPP
 entry
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
        Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20250611-x1p-adreno-v2-0-5074907bebbd@oss.qualcomm.com>
 <20250611-x1p-adreno-v2-1-5074907bebbd@oss.qualcomm.com>
 <492417fe-c086-4980-b108-0487bad08155@kernel.org>
 <d482653e-5c0e-4b03-98d6-2c898b445917@quicinc.com>
 <750da319-d25f-454d-b376-ebbc194e0e41@kernel.org>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <750da319-d25f-454d-b376-ebbc194e0e41@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: yrUJ9_yaN0vqeEa430JBSILtDw2Npmzv
X-Proofpoint-ORIG-GUID: yrUJ9_yaN0vqeEa430JBSILtDw2Npmzv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDExMSBTYWx0ZWRfX/9TpkcMMySuV
 rVxgW0LzcG/i9BW/Tjf658TWAyko6FDTWqjR1OzA6C1AiS50jJGQ0EmMUedmesa9EeCD2KIW834
 PogKmKuU0CFAFQOX7wIx/BuX1NPwYX3+sojjcTD0GTx6EA2OpYVa2iSKG9fNmfdpVkrRsdGHUy8
 1LpNo5VqUwZNC6Pcj5ExWUb6LU2vKyQcD5vw2F82lBoZzkxFC2R0Ou0lQpwVv/B1OhzULhT/dDY
 Oa3g2CjbBz7BncTYraloOobOEa+RtymloNlxbEB3Rj2mps78paKrF+ps1e/LJ1tz0/hz5QfIZP+
 NbL2F6+wqtkGct9YMtiJSGJ+uS4t+Bg22KD+ySkEIQP9guL1s8nxCuAeqjWr0k6lugKOz5px4Su
 eP16LB5ebRnbpeQjeewHfAkKecS9W2xRM9Ia4lG0ogNh815Vc9f19GeNXKEcZn+gck/B9/VG
X-Authority-Analysis: v=2.4 cv=fMc53Yae c=1 sm=1 tr=0 ts=68504ae1 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=DDAlTcr3_WI9VELS8V8A:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_08,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=971 spamscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506160111

On 6/12/2025 4:59 PM, Krzysztof Kozlowski wrote:
> On 11/06/2025 14:24, Akhil P Oommen wrote:
>>>>  
>>>>  patternProperties:
>>>> -  '^opp-[0-9]+$':
>>>> +  '^opp(-?[0-9]+)*$':
>>>
>>> Not correct regex. You allow "opp", "opp1" and all other unusual
>>> variants. Commit does not explain what problem you are solving, so I
>>> have no clue what you want here, but for sure opp1 is wrong.
>>
>> Just to confirm, would this be fine for the requirement I mentioned above?
>>
>> "'^opp(-[0-9]+)*$'"
> 
> No, You did not solve half of the problems - still allows "opp" and
> commit msg does not explain why "opp" is now correct. Describe the
> actual problem and then write the regex solving it in specific way, not
> causing other effects.

Gotcha. If we want to be super strict, the regex should be:
^opp(-[0-9]+){1,2}$

I will send out a new patch.

-Akhil

> 
> Best regards,
> Krzysztof

