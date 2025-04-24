Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845A728BAA0
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 16:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745513909; cv=none; b=Px75/4Bnl9WUfUMR4RuuDPCKE63GkMusvxLBgLnrr0KhmGxCzJ9ZkykD6UIlEAz0PF/kSgBeh0YwHco7r61Yqc0iFRKYhUCLUSw+O7d/J+O5kwW5ZICkTZI3W1C9xkXB62QSIlYkmW8aBeet5yKUXriN7KDoqxstvfwJKuOCVHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745513909; c=relaxed/simple;
	bh=lwIVb6Nui00ZfZD89j30bpJzTmw1n5wUZd7dfBimA3U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F4lwjNWp9AJT87FVa+p6R/naY47TQ8VQrp/u9q+sDf2p4+//MJ1P1PXiSgvrC9jsqF+li/3QnF1hcjvPOFnzCa7iaPqbzx8FDx0xu4RgV69rBOCx6o8kK8UBwRwXJCuIE1r4Gf2+IoHhO/DmrQnnlqlK9vpKC4mcwTwOjm8wJhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D5eG3B0W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D5eG3B0W"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OC47BH017928
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 16:58:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/9+kJX3qmRmZ2snfGBmR0Ap3enazyk3U0iCrZ9pj2O0=; b=D5eG3B0W7PYD0ivr
	qKb2yY8BsGuY3MHBXVwGb2Z0wEw47W/X1Y+34no5gp71saWSt3Pe0LUVaQT8oDQL
	UbGeSxee79uaV5oJ4nRnSuU4BO8BKQMCPn/iAtKRHZIPrUibT4UsWyOmQ2/eWPWI
	X8zohplUMo76IddWA6rs6ZTnRe5xBCvt4dPi6s9MEGA+/A/pmyoMFFjPQNafZ07Z
	iAs+d4xko576QraV8Ibsa4sIS6uUYLT6jFgIqEizKJyMLsQ2dxE3YdjUM8M8yidF
	W3PwBq6y3/5KhsjszBknN/H58VKxVVvoBMiOekD2np54JMTfuPgfSmkm1q7qei5u
	9CVxEQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0eexp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 16:58:26 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3087a704c6bso1299515a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:58:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745513905; x=1746118705;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/9+kJX3qmRmZ2snfGBmR0Ap3enazyk3U0iCrZ9pj2O0=;
        b=hGmJrvWvfAAuQuOxG45sIjJWw2lESzPHhtWcXJZnqZBrO+Pdb1HuelUmf+FAisSxuA
         SMVCxArj53QLmCsOXJkBr34QPVmACtBp1Xu65eWWPd/nscy7sZD+GbunycmrNCE0tF+W
         lkIILVjBVFSCMlcYG6VXttjK9EHuv7tSzK03bqm+qDbvGsHfhBGTzh7Hg/AY9qCB2poK
         iikRepCf9kktbj/K8z9JQ5P5TvULGz4dPANj397x1hW8zeNAGc41x+dBX9cfwMUJnJkZ
         MkYSBYrt0pkFOMS8zqhxk18fAxV+8oyM4EL2GCpMc40u75/RMsuScqQWUBVJqjA4RRtc
         wiWQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0hTSB4ASlGIdYzn2M/OEktFChp9PvYnTeSVokJ9JDWSaX4L8bKw54976vUB2Q2YVaF1qe74KFNyEEW+E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmXi93+QAc5NfPpI7WsN+v3n/pXw4UbmkK4TaNBhH/yZckIeml
	hIUrOGx5nBfxxF++KOarTvxrr4l057p0s+nMGd5Qq/f+8k2BcHyAjdQOe4+UwToDO+FTNFNsJHo
	0JIzKH4S5mynqRYg83t2ZviZXa0MALQMbIsZDhdjmB7FCeyTRnSnTk/rF6ZaYgBA=
X-Gm-Gg: ASbGncthBr9lWfjkaUkvw7qk7Db5tGAxJIhilxjMLptzgToqDA2grLqy/rsLlp5rK/B
	FrpOqDYixKF6o6EgEKdsFy2q5tJOxNp7a3jH4YstRjLU5Cd2e9qrkPYdIZ3O+tBzmVhQu4jxTv8
	28wncGt+1lYqA+Ev5zqTh2g860Vog/O8q52+/AaSf9uwEMzQjD1qNXItlzWjk7hsbGrOAQhB2th
	Pff8sUhlVWpa0/3tD7sgiZnzwSLFqXllPVrY/b61YDROn0ekzaCAKs1qo86dwTKKPFPgFcUi4dc
	dobKXcS9lM9SsguxtP+swIU3PSX6WQcvvxcOcDCAT1LlmafTnqx7kPnKZF4LIAy27fM=
X-Received: by 2002:a17:90b:2d0e:b0:305:5f25:59a5 with SMTP id 98e67ed59e1d1-309f56d8124mr558474a91.35.1745513905709;
        Thu, 24 Apr 2025 09:58:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGh1h0ZlmpzYkSjNOUZGfK3vhdOgJu5HDMU6J41zqG3DYFF1qB5+gZ+Sugq+6qPpgpDKZSMxw==
X-Received: by 2002:a17:90b:2d0e:b0:305:5f25:59a5 with SMTP id 98e67ed59e1d1-309f56d8124mr558444a91.35.1745513905372;
        Thu, 24 Apr 2025 09:58:25 -0700 (PDT)
Received: from [10.71.109.146] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef09689fsm1644276a91.22.2025.04.24.09.58.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 09:58:24 -0700 (PDT)
Message-ID: <3d583880-5e94-4f12-aa50-96d133276e4e@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 09:58:21 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: qcom: Fix PINGROUP defination for sm8750
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250424-pinctrl_sm8750-v1-1-b070790ccbce@oss.qualcomm.com>
Content-Language: en-US
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
In-Reply-To: <20250424-pinctrl_sm8750-v1-1-b070790ccbce@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 274GAxArGJylLTHpmXt2jZugbJUFrTYL
X-Proofpoint-ORIG-GUID: 274GAxArGJylLTHpmXt2jZugbJUFrTYL
X-Authority-Analysis: v=2.4 cv=Fv0F/3rq c=1 sm=1 tr=0 ts=680a6db2 cx=c_pps a=0uOsjrqzRL749jD1oC5vDA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=8B2AFzsc9gyHPfch_-wA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDExNiBTYWx0ZWRfX28bs7M4lDOWo EQ5YNbDDr2eLkOo4M/9y7Dtwnf4zgfnRMqRi6hv/B9NKCkUSxdjWTYqQuDT3IPc+qiErbWi7ObD kHO+adTmwqZnjiArZiUqzP49DQRc5KwNtBsQYJy4d74zQtj2L+mqy15P6fJNQbK/TpEV3ahCAik
 L/Cl11QtkG1zHsz+Tx+0oKN9dqQcg0k/Bf1pT+971zHaSz84RyXAqcWGgcpFy1uM2b3KV/Is4Dw OuanD+2KbOKGip829Wocmqs0pb8jjC2SWhIy2ew9B/eXaEzApZ7APK2ieNvJXxocFT3tZiLU9ev lSHsSmcKFp9m/TmFTuI34YX+RP4ewxu2kX1pEIHTuHwyg8/qs4ehBQSc6cQrY0G/jyXJSr1rpSS
 /cquvVYXo23qSRZ1yrE8JfkQDGadYycsgQ/5DT3mwW5QqvtvW5+wD/PLgIVCM9KdLdym/EFt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-24_07,2025-04-24_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=657 priorityscore=1501 suspectscore=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240116



On 4/23/2025 9:47 PM, Maulik Shah wrote:
> On newer SoCs intr_target_bit position is at 8 instead of 5. Fix it.
>
> Also add missing intr_wakeup_present_bit and intr_wakeup_enable_bit which
> enables forwarding of GPIO interrupts to parent PDC interrupt controller.
>
> Fixes: afe9803e3b82 ("pinctrl: qcom: Add sm8750 pinctrl driver")
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---
>   drivers/pinctrl/qcom/pinctrl-sm8750.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
Reviewed-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
