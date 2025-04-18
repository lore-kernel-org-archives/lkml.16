Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56142472A1
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 23:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745019454; cv=none; b=YJnBGdqNvUyiFgt5meXFtjnAoW/GSyIbQvLambocC+OhFkBvExl+ZTqcQdxMwSu+BWgqFUr7ovNRtgmdbrtDIanD7Wu+H6h58n6jETBhyc1lqZPsUtzuU5l8ah03uqVuzHzUvCielguXfs0vtYShcz9xJLtCm8teO/WDrhGUTmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745019454; c=relaxed/simple;
	bh=ANmOQK44ikGowZWvDLPDAtsBlWAQRjP2uX3Tmv4yg/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cDG3QMoixacJ3hL5kUxyLj2eEDjoLZJ4TRmi+HYNS0SclUxR4Eb/Xj/WSt6ZluVaWfc5tNMi+j0PZr+hnh30iCYttzVXKCEE9p6A9z9PnYSK1SThIx+vqnITqVp5kL4MF6MjJV4zlji9UJSxFrERloYESewtJ1nO4bZ6bcipn8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o6WQwBj2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o6WQwBj2"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53ILlqK3018274
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 23:37:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eKUA3bj8EeSG2nYcgbu3ywuH
	9VSFY2PDx0okj4dv5ZE=; b=o6WQwBj2OW4RvwBxJ6XuGJtVbtwHDQD0U7r6EXQj
	gjtv28QpyFBHU2oGavA+D8r0KLVVDg6nKry9llAZDAWxMfGLS9uRGaI8+Y4kWSM0
	2uxCGwb2Sth5IknOLn2T1Wc0kujKx3NQi8EmM+yHu6lJbTVwnOUtcsDFbGy86nTx
	2O/be/BbA7oqsXn+amyuHZ70x59n1ApJiwwSYW8hYCX5IzsJZOvv++7gTueViZZ1
	jDuvgokt/nPm/EdA3LPaxJog1PlnL352QwbEbMKR9A39RZG5KyQ/rmsi4QLTcYe7
	4ktIRz2EFNEbjT/ksOjXMDRPhlvavByHvQ584JhzbP3bgw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ydvjkd4s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 23:37:31 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e900f6dcadso47800446d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 16:37:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745019450; x=1745624250;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eKUA3bj8EeSG2nYcgbu3ywuH9VSFY2PDx0okj4dv5ZE=;
        b=O5vWEPjwNrb6EIJA5k/dgCmcBMAQ5O1TptqvbjFeAIcnaggrA5mKPY/SpQxCzyan2p
         vhiRizbK1n8orBgLcFVGnRRdXC4gexr89gszqEynh6541n2Jhx/kTq915km10HTRXbf4
         fH+8TFM2jw9sc8Bt+9Oeq7maL7YiiROci5e+cVl9eYp2T5N72Y1LVFQv40ujMo0kGq0Q
         fye9FipNNCiPpZ1k7O+q7oqGO3NzvLhAvgv7bv9PszMr9v2EHBQZWv5RHCXCLVoAXrYa
         ke1rsJfwyMc0emweCLcMQLlqCoFNgCYGEftP9KaTfojRGJWfQBH6Tzvx6w6jm1u6BJ+c
         JFsA==
X-Forwarded-Encrypted: i=1; AJvYcCUOklVJkwtUOPz6rYzWO7kiold4zQwJntX+Hqwj6hhJgi+hF98VWZf4929UOq/7CraH6PGa1laXpNyx/8U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVotXE+ZLUYWG4QEfl0DJXZWQmj/8TQvUb+ocwFUqnNx7FG70o
	Vqu+Tlu1q9xLvetXgic5i4hjNEYF1xGDO9ZR8RfGxm+OxlXVbzFF4Uex0nNYfYc7BstEWx4zNoD
	9QmidCf/RQe50zkQVhh9EdDLowhoD7L/cMzynJeKwcXRdG9toQfzPQTFxgS7hw3w=
X-Gm-Gg: ASbGnctqLZ9M/T/somszu62lI/Y8T7uo73QYG47rgZVDBGPvAHZ/usLu42/AcDW+YYq
	2bzHxkPy3qkaxbE7RspevQQN+CRZq9caWIA824ZnLS2cJ7Pm/Q2uVvpIv+QrKEzWlLaCR4CqwWp
	ZYhCPQzZZnqha5kKgMVTxjf44ppES7ODqmtTf/2B+qA8+5+WU6JRI6yy0FY061dKHbuQ4Xo57rb
	MQpgxW1wRoCuEkgMhz05WpJrsoHGPQ2N3Re/iERm0jmxR2uGxmuhhq8RZ9gVLZQSABP45KgCbth
	v6yPQ+AL1qTraWNV45xY1booq190l/LlOsGWV0Arbuj5RdQzhg/Z0/hl2dCUxSW6MGUeam1FO6I
	=
X-Received: by 2002:a05:6214:5005:b0:6f2:b551:a63 with SMTP id 6a1803df08f44-6f2c450b587mr75957976d6.3.1745019450703;
        Fri, 18 Apr 2025 16:37:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrnZTHVGZqFXPA5Puw+FySMHQJHQ46VuEitEwFPJTF/qNvZ1Q9C6NJS/pbT3++86Ymlzp+LA==
X-Received: by 2002:a05:6214:5005:b0:6f2:b551:a63 with SMTP id 6a1803df08f44-6f2c450b587mr75957586d6.3.1745019450379;
        Fri, 18 Apr 2025 16:37:30 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e5f5fe8sm292796e87.232.2025.04.18.16.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 16:37:29 -0700 (PDT)
Date: Sat, 19 Apr 2025 02:37:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] ASoC: qcom: sm8250: set card driver name from
 match data
Message-ID: <zo2oc37adjjryesewvsnlk5gw25bol46zqqkshfi7yzwbr2rot@jocwv3ff4afj>
References: <20250418-fp5-dp-sound-v2-0-05d65f084b05@fairphone.com>
 <20250418-fp5-dp-sound-v2-2-05d65f084b05@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418-fp5-dp-sound-v2-2-05d65f084b05@fairphone.com>
X-Authority-Analysis: v=2.4 cv=ZIrXmW7b c=1 sm=1 tr=0 ts=6802e23c cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=jUvTS9cEMoV-Kbj9yZgA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: 2ShHUh3jnqKOSd-sSDG3E9EgfVq8zZoc
X-Proofpoint-ORIG-GUID: 2ShHUh3jnqKOSd-sSDG3E9EgfVq8zZoc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_09,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0 mlxlogscore=975
 spamscore=0 impostorscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504180180

On Fri, Apr 18, 2025 at 03:13:43PM +0200, Luca Weiss wrote:
> Sound machine drivers for Qualcomm SoCs can be reused across multiple
> SoCs. But user space ALSA UCM files depend on the card driver name which
> should be set per board/SoC.
> 
> Allow such customization by using driver match data as sound card driver
> name.
> 
> Also while we're already touching these lines, sort the compatibles
> alphabetically.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  sound/soc/qcom/sm8250.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
