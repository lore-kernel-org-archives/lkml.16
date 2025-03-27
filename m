Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB840946F
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 12:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743079919; cv=none; b=CS//83392K5dx91zodXCQgjuuKwDuGdrsXunYaajzPBLqrW3qUlk4T0wQchSKiPt3fHqj8G+EtqMXf0hen6sdLAWDtAH0WDqdrqcq5BIPxzzlQbJYWsNCNnl5ZEHen+GU3ry0ENdtIH53CbqalYJ78wt70uNx+wG2ckEV3NpxRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743079919; c=relaxed/simple;
	bh=pRLWHIKpxAtnCsh/nWytTFegaJTWyktX21VnT7GCvIo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Awd5i1otWMRUusWsq8VJ9na9ZyqRUj/rS9Qouj5gYczhBqPxO5e4FbyPQreGQpGfiEpRfEcbkETV50V4YPjS59WmJdp4y5EsN00Dsq5ia9tAvh2eYEzfRUwkNmm4/2SScPGpirRnqDSOZDkBW6uKvUKWVlpJh0Yv1UHQh3Fl0NE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gAOtRGf5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gAOtRGf5"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52R5jFQC012437
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 12:51:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZBCOV1uS/N7q5vX7EpjTo/9T
	Wfdmz7+2VNj9q/T3SCs=; b=gAOtRGf5Nzmo64jBZiIHDDs3YAc/W3YAzO5z9R/h
	XNhqWje1P/Hs+azhIs2c6Na1UYsaAWm5ovfGaZa1zaqp0VrWMy4+/IWTVNqiLPON
	6mfk74eUNZdx3Ki1YKlvzjuuYfBDm4sVTTHBkvJqhCnBVISB1tULL8rfmQvIZGOW
	JdMLLyL1WYC/FBKGUOs55Biu1tpnK9JBwYlfjDzJPIBR+RTJBOTnJZYIGz7dHadX
	khKxpY8vxhrm+8sXk1BE4DjB090m3rgMHyAO0JY35t2HfxMtU0Hgbp9R0nf7D8rZ
	qpl8C+aiTIMCRvW/IkSxOGLg2HADmj6Ohzj2NVqd/DFR5w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45mmutjynt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 12:51:56 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c3c5e92d41so154843085a.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 05:51:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743079915; x=1743684715;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZBCOV1uS/N7q5vX7EpjTo/9TWfdmz7+2VNj9q/T3SCs=;
        b=EWVFpW5d/WP14QO1g9GizfTYdKmfp9JymplKMN9pNMlqcNdnkF6YrtoH8Al5I2PwAH
         uif0wcj5/QD+s/Ptp3b3N8rysc/bwVO764HLg0NMuaV8dNLOykV1baRAoDTNAUoKAAni
         B21j8D7piHJfv0z1wyJWej9Pz3NPGzRKHUv9J5fzWM9a9Z0uTRTIbuNBftSFxGFTW/IK
         z796CLIi/H+JNIxVENVyNwU3VPID7SBz88HCMmJmrpM2ghxMPUq7ys2zk0xrlnlYxM7i
         kDfySEkefv3hV/HW5KX3HrDgX4ZslvO3BcVTjxFYF7Osygm/HUjU4FUkSjhSpg1m8lXX
         YOZA==
X-Forwarded-Encrypted: i=1; AJvYcCWLLgHprNxk/vHSdAm1EwDzE5DYqm21qm5N+LovzKJ9CS/tpslukHinz+6jQjt8fV3g8nol9F09ll7e8RQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm9gi1fE25mX3gwlm8vb2aebgBKqj+hkGrflFLPXLEbcsx2mPa
	lre0M8a4ZXdt/kQaGDZL7gM/cOQX4GLKD5ukDX8J5dHX9hCqBTQ30A12FF6fRtiSc2zUePW3LWp
	lnxSDC9X+VAg9OXScku4l1NfIZ3nosNjBV6PYkaSrc8R7Csc43t/vMryjuyCiQbg=
X-Gm-Gg: ASbGncvARmXFbHWMi1JZiLyS0rYD1TWNEEiuX2xs+/E7Dx+WIzF0Ok1VYVpLXxmll/U
	qmjQGSDI+xiZbGftjg2IyXj62Q5M4188i/wmJUhf3zunaNNNHvg0RMnbBGaXf83mEYVcxnRw70/
	ekIEERlt9Mci7JlQLDgg6DxM3z/M9wc6hC2EaH8XmkMwC+nWBOuphAyomySTdcVj8+kwVi7biSf
	t4/fwLdA3Vqe8hai3UqObKdI5IcGmC1olEbe0IRc+aFIAHhlBXFqK1Hvd5zDksVSDY0RMpNhPKS
	vPObBtVMKBopFhvRUwYI2N4Dyn80TotFrP3oZ+9qhkv4iudRVFcKZKSORZVQ13Cw5doYm1LUhaM
	OxxA=
X-Received: by 2002:a05:620a:3721:b0:7c0:c3ea:6982 with SMTP id af79cd13be357-7c5ed9f1e39mr435497185a.14.1743079915411;
        Thu, 27 Mar 2025 05:51:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFuF29Y3nfHrrwUHt/LBXhkbdI4Z2Cs7fMFZYNi77Mai7aCOVA5UqjiL7PGwH+dL5lO9sti4g==
X-Received: by 2002:a05:620a:3721:b0:7c0:c3ea:6982 with SMTP id af79cd13be357-7c5ed9f1e39mr435492985a.14.1743079914922;
        Thu, 27 Mar 2025 05:51:54 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad647b468sm2073129e87.59.2025.03.27.05.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 05:51:53 -0700 (PDT)
Date: Thu, 27 Mar 2025 14:51:52 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v3 07/18] clk: qcom: videocc-sm8450: Move PLL & clk
 configuration to really probe
Message-ID: <bqhjxv5rrho2os5tswhl5pjn3s7gbdsuebnadptfaiml2dgnt2@aac5t7c4zvfc>
References: <20250327-videocc-pll-multi-pd-voting-v3-0-895fafd62627@quicinc.com>
 <20250327-videocc-pll-multi-pd-voting-v3-7-895fafd62627@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327-videocc-pll-multi-pd-voting-v3-7-895fafd62627@quicinc.com>
X-Proofpoint-ORIG-GUID: zUDFwaPDE0wlgPKnfgM5SZcAs3JGDn6R
X-Authority-Analysis: v=2.4 cv=MqlS63ae c=1 sm=1 tr=0 ts=67e549ec cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=CXQnK64LRHhqnx0rWp8A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: zUDFwaPDE0wlgPKnfgM5SZcAs3JGDn6R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-27_01,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 mlxlogscore=999 mlxscore=0 bulkscore=0 adultscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503270089

On Thu, Mar 27, 2025 at 03:22:27PM +0530, Jagadeesh Kona wrote:
> Video PLLs on SM8450/SM8475 require both MMCX and MXC rails to be kept ON
> to configure the PLLs properly. Hence move runtime power management, PLL
> configuration and enable critical clocks to qcom_cc_really_probe() which
> ensures all required power domains are in enabled state before configuring
> the PLLs or enabling the clocks.
> 
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---
>  drivers/clk/qcom/videocc-sm8450.c | 54 +++++++++++++++------------------------
>  1 file changed, 21 insertions(+), 33 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
