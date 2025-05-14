Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E56E221F0E
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 21:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747257821; cv=none; b=VizzhiQxqyw9ufJrhJP6xZ9tyCELvLkZQjavQMA+2gtUGa0iqUidBURNym4/2bcatZrXbBc945Z03X87ez9R45aTU6Z1DZHMQTjUXqxCP4ZNrIcHp65flK8xozmn2cScc4WnADjVAE3N8EveKRJTxo+GwzMQ452iEhdKzTLKWXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747257821; c=relaxed/simple;
	bh=BUTPCdxYE0KBSr9Fr+4DkW6Crfw+tCtmVXfSMC+Z33I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bSnlBn84bmwVNW2mg0C/34GgAi1su+IAF6XFoyNimqaVcQeZTafgb3j9ivxUJQ+xDZchDcFSCH02TMajtLrQnO9Lta2Zoi9+bX8JVhw7mYJwXVNY9GLJhVWtoduWUqCFawn+z/6y7xRfBINT2OXiYUzWRJ9Hg9tUB9EyqNsVf+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CLebyzUa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CLebyzUa"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EK86eX014273
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 21:23:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vaaYWPBvIHzxnTRnla3Zb3Vn
	Q4iu9qj3qxbcJAJI5CQ=; b=CLebyzUaTFAHK5pzea73BO1Vs7S5P39S5JrVgMVh
	EzzBrre5Of5EEAn2Tb/IfbwknI8g6Ar00GRkEA2JLSMWDpgbpeJP0kO1R2R37C4X
	ghfyat5MNDmBNlN5G3VdRqdf8rVU8WL6mgZ7Ax8SicF8yMwxPn7DQ+9/j+917sb+
	hN1Oa4FHKGdYE6+wMLvKFwtWdiLJtulROtQraGZA5X/Or1Ddi+K0+LLpJ/whj0Qn
	NEpvuhexLuWU10OyFxbJ1W1YLdZlwIRfZw3SCVRzw6wrQAgYqXtlHeYKfjOVGQZi
	7yDJdMUz4xI5fRFFHrI8Dy+fScc4Lhp/BJ9YAH5sA6ZXpg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcmm5ft-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 21:23:39 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5b9333642so23240585a.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 14:23:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747257818; x=1747862618;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vaaYWPBvIHzxnTRnla3Zb3VnQ4iu9qj3qxbcJAJI5CQ=;
        b=CCuWdoaP8erqqlsSjQHW6MuzofNu1GdqDIo2/+HQeUiYKEoPAQ+9OWv5h92z925QHw
         VXUGMvg0+C5FLkJmQWEL9ul7zidOWj/vILJPfgFSeym6hpE6QopKLpmHK0TNFsXulq8m
         fFJl2AN+2cW9DQSY3Jckb/1R3teJSDPedNkee1r5+EIEdoKcNZ16p6QKhqJXRwHT60bm
         EGZ5uVNvtnCmGjCjxXRopSyoEvsgVigEMFzEUa/aN/2UuhlU4aNgXRcQLBwTDGcVG5FO
         3etOEJiui0VIuOGEvcAZNEXZ0cthx0yeWYen4f3AahoG5MmvLka2V9rT2RdAWlxVKiD2
         5JIA==
X-Forwarded-Encrypted: i=1; AJvYcCUC2vlNlJ1CWWRwv51VJFwPM7VKKu/uwoB+UqOOWa9AALaB8Dan3HwwETRpq7pB5mDrHbTT8jHzAaawxUw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVGLdTWJYw7iHHH0tjCjUuPXcUDAJMTN086FdwFng60W/1vLLN
	qqansZBQVs6g/Kj+IWuhnzrenaFXicYwMJ5D5odwbhQ/o/LU9M0xrEMpBRHQynta8bspx2yQhXP
	Nog4DCu+4v2dPo1NQbJi35VYLO1wltiwirMbJZyI6q9iCISUDox0Vy1rvO3c/qi4=
X-Gm-Gg: ASbGncs31ko52+0R3LEUpfnGTMK7f03WF+ngXWu9yn3FoSSlxz/rPw5Z/GqnydPNQSX
	gvWAhYSHqcgYhwU+3CCMs1zsJJJRC24OfgpAcs/GRHJ9JF31j/CGTPnspEis8Gyhj7YPNfApIrm
	2iqEgJxp9I4jearCqhz8naS6K2XVXMDnL/6KJuIbbI3oCb1/RmewDlHqGfBSgSERIQMSUD44U9q
	y9E+G4LfDNBWdtrumTxuh4MhKFfx/290Y26wGlUtRaO/lR/VJmQf/AO/z73nQI5xotSXP+tUHKh
	iLWVcSLcrdhINsRVcH+LP2QLS1Q48qnSSzdQAhuwfd7DqRe4Y41VJWtnGvtrI48rDjQuOg3qeqg
	=
X-Received: by 2002:a05:620a:f0e:b0:7ca:f41a:4844 with SMTP id af79cd13be357-7cd2888fad9mr834862085a.53.1747257818095;
        Wed, 14 May 2025 14:23:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKk/aEqt1gPJl+u51T5UjY95/XJdn9iYDGEHP11yzCdYiBQxpQ5KUK8fADScjUo9PVc62aHg==
X-Received: by 2002:a05:620a:f0e:b0:7ca:f41a:4844 with SMTP id af79cd13be357-7cd2888fad9mr834857285a.53.1747257817673;
        Wed, 14 May 2025 14:23:37 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc64bf8ecsm2380641e87.187.2025.05.14.14.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 14:23:35 -0700 (PDT)
Date: Thu, 15 May 2025 00:23:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v4 17/18] arm64: dts: qcom: sm8550: Additionally manage
 MXC power domain in camcc
Message-ID: <7csmi64osxghv3mkcxwfhxlwodzwvpbull36htrkmcjzngbgk4@go4wmvfvhqst>
References: <20250515-videocc-pll-multi-pd-voting-v4-0-571c63297d01@quicinc.com>
 <20250515-videocc-pll-multi-pd-voting-v4-17-571c63297d01@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515-videocc-pll-multi-pd-voting-v4-17-571c63297d01@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE5OCBTYWx0ZWRfXzWJn4gKIi4qu
 26umY8Zr/0e5MvTBOvtgavDGMLiu3nED7E6J2jUooImuq480EVpoaCYBrg73ozmJ+Qa/5cqw7y1
 U6aGaZSOzS3+OTFdH5eFR6nHsrat7kU4INQJJQ5kX9K87WNgomLFzb9JD+A+kvJxhNODw7o4wLH
 TCjmzzvIPiQoKkIcdCVDeJMd41io5jXRElyKyX/nACl7sJcOaOMZ5O8IW4VssZDQ9+W+YCfRcdx
 ivec5dH4aXUYcrn5wvjpNbTT5V1zYo7IbAij2yNmxnI+8LROUOAhnGV6cOjKrfFb5ZgCEgvZSOH
 JBomNLKgdEU5wAsV2aMOOTmZ32Z5VMkNdkv9zxy633ZC3lko9UoE127qLorJut6sVB1rRVbIhq0
 um3W5y4qXIfuWcXFR3XFrv9M78ut1uyUT7MmQZrOuF6CEXLOWnoAhAQhaCznWcK+lC3DJgk0
X-Authority-Analysis: v=2.4 cv=G5scE8k5 c=1 sm=1 tr=0 ts=682509db cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=9YvV8F1douotiZniFPIA:9 a=NqO74GWdXPXpGKcKHaDJD/ajO6k=:19 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 26ZdRVB4gxt6hpj4GxxL6N_juAKmvJ0o
X-Proofpoint-ORIG-GUID: 26ZdRVB4gxt6hpj4GxxL6N_juAKmvJ0o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxlogscore=546 clxscore=1015 phishscore=0 bulkscore=0
 suspectscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0
 malwarescore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140198

On Thu, May 15, 2025 at 12:39:02AM +0530, Jagadeesh Kona wrote:
> From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> 
> Camcc requires both MMCX and MXC rails to be powered ON to configure
> the camera PLLs on SM8550 platform. Hence add MXC power domain to
> camcc node on SM8550. While at it, update SM8550_MMCX macro to RPMHPD_MMCX
> to align towards common macros.
> 
> Fixes: e271b59e39a6f ("arm64: dts: qcom: sm8550: Add camera clock controller")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> Reviewed-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8550.dtsi | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
-- 
With best wishes
Dmitry
