Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5525F27EC9A
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744712798; cv=none; b=YrGpqejDZtY2sV0+CIl/eacXHI0TQ2RYVqoATh0UvuXrwqNmeIBzbUkMVS/2YYWmGC6R8l0nUCKzW21Veftg3gw0HktCIRWU2sIQUmTGFjaS6O6MF5fOcZL1jrUhYzq7bg9isiEvYHEMRSMekhZiQoNZi/xjFZGsH81tnKWNmIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744712798; c=relaxed/simple;
	bh=8Wk68rfSswMYXy4roNkEMzhagEBd/xVnpM63L5n14j8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=otypikW/lA8HC+GM8f7eMU8ulBoIQhQ+jq5i+O28z49dcrvPUuG+YugymbTR090wn7LbdEldZLixRAHrSVyVq368uQxPTs926s9COnr1em/PYTSmY8EsWMAufE1BmdPS16mDnA15Ro7LYCQJ10fX8GRbS07s0h8/ZEVdXfPxyHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lwPR7RV0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lwPR7RV0"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tHd5013136
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:26:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8KNMl+h+dY8TN+P2t92AbEQx
	GBdTUq047ce2xAkYaWs=; b=lwPR7RV0H9w31lCgPQHCfO/3zAqgwzJ7FdTwzR3v
	4Il6bqLaGqihXyXpEvf0aSrybbLT7DexWI63wE7NgP/Cb+59VY+9aJiqpEC+rVa7
	Ho6k8xU5DS7m7jxOG1bQYMHlwi1wPtu/xKGK+EIWGiD7+EgvyS1AvyWaUGoY8Vzq
	IBB/4qG2MZUckTGzJsmhMaUwNxTQGTGFivb0fahp1kWrM/jQreraGUAm0ndR4fdI
	ITvf2Ij/H9Xsi/EYHs6FuXUCN4T3NMcH1u5LDXHL849C9kMWJl1sgYLJ98gDTAjh
	5o5UlLrirTNLh9wHg2QtV+BWtPLUzEyEmE4ma87/gfNUgg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygd6fnft-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:26:36 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5f876bfe0so858549285a.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 03:26:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744712795; x=1745317595;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8KNMl+h+dY8TN+P2t92AbEQxGBdTUq047ce2xAkYaWs=;
        b=g3VpZ35rB73XTvZwIapIhgWuWTKLCyDgCg2F8pTXEsIv1MXRntpygTvcFN0K2oj8TU
         SKwHZ1j67gD4V8U1ImcIvYDVubfV9yUmZsIkwbl7o/XKl7cFgAK86AoBT3mRVkvkCgps
         57vWbbrqP9t9V2Sth3Rzh0IySmbUH9gsQw3VIrjWEjnJTEjTPKVyho14+nqw6Q/yJNsH
         GaUuen/R0mU+2PVFcmdOL9YmVipOBp4MdySu0zaaDbD12CJvESmzB1NTcGcKwjQRH46a
         O90p9iX1Ecjcn513thZ2K8ZSCUzBO2maR3RWGMFE37Ixzy4vebK7Sm/fgRd2oHOkmuUA
         so8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVC8fXnwgua3tFbrkCveqUglAvWliigNrw4ooMVQHl8fQ3inJyksAfNEi1NzisORHgGxjq68DEfqzi5gIQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzyaPS6SDWjU1jPHtF1QyTJx6kYidD62qalx4bNAzDkyUBuj3W
	JiYQr98+ZY7GYWDukoGXd+Mv0CNh4yb0UceOE2sevlap9r796XWPXin9jiqHOdFTlMyiLQV2LFQ
	U+UF2q7i4PdeXuHObMw7xIsiZrGhpcp1yU6y+2Ty6NYhePtoLtwz0Au0l+O2CLvo=
X-Gm-Gg: ASbGncuAOZL3lX5hLsG902A24mkSEYZkfX4cyysBqXN1yxwh38vEafzARDy85MDFiav
	QV9VqKeHLa+60kFa5BHItXJiYcnLAnWMsf6YodA24l6+YeO6Y1FVXsykS7aABk7Lxnahw7YSmpe
	VD9unAl25zZ6uJWAqlKvgQYKrlNpcwtsFpu8p7xTGvfBrBzBSTYXNdUECKAyWTVmL6juAcqKw5P
	V2QSWJ0mBjjl30rZbO3LwCSHKUwi9nr5dMUf0LkG6g511vqiZ+zXMhskIaC7ULc/DYexoOGQWFa
	JX4lmPh9+MMCZ8A7vzkiTXrZewqJkqRXFovEKNt1Gr7zNmMnM3cd0t2CzICusLC4EaHWWondqfY
	=
X-Received: by 2002:a05:620a:28d5:b0:7c0:a3bd:a78a with SMTP id af79cd13be357-7c7af1f3d4emr2124438185a.41.1744712795100;
        Tue, 15 Apr 2025 03:26:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPAUNy95g+BxEoF3m9T+D1BmAcO0ZWmAE4FI2u67ljC8uUUpC++8Ix1n9dNmZZNjqqGE/GOw==
X-Received: by 2002:a05:620a:28d5:b0:7c0:a3bd:a78a with SMTP id af79cd13be357-7c7af1f3d4emr2124435285a.41.1744712794773;
        Tue, 15 Apr 2025 03:26:34 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d123137sm1387306e87.40.2025.04.15.03.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 03:26:33 -0700 (PDT)
Date: Tue, 15 Apr 2025 13:26:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Chenyuan Yang <chenyuan0y@gmail.com>
Cc: vkoul@kernel.org, kishon@kernel.org, lumag@kernel.org,
        quic_kriskura@quicinc.com, manivannan.sadhasivam@linaro.org,
        konrad.dybcio@oss.qualcomm.com, quic_varada@quicinc.com,
        quic_kbajaj@quicinc.com, johan+linaro@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2] phy: qcom-qmp-usb: Fix an NULL vs IS_ERR() bug
Message-ID: <x2hqk3yabe3ntp4b452tseyuuen76mtttievka7zgjajxxxobb@srrgiu7k6eyp>
References: <20250414125050.2118619-1-chenyuan0y@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414125050.2118619-1-chenyuan0y@gmail.com>
X-Proofpoint-ORIG-GUID: 99SiUAQOEh4S2SbarfX3Bx5_IiHm9rfS
X-Proofpoint-GUID: 99SiUAQOEh4S2SbarfX3Bx5_IiHm9rfS
X-Authority-Analysis: v=2.4 cv=ANaQCy7k c=1 sm=1 tr=0 ts=67fe345c cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vPHRA5kXY3h_Fp5QcTsA:9 a=CjuIK1q_8ugA:10
 a=zgiPjhLxNE0A:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 mlxlogscore=901 suspectscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150073

On Mon, Apr 14, 2025 at 07:50:50AM -0500, Chenyuan Yang wrote:
> The qmp_usb_iomap() helper function currently returns the raw result of
> devm_ioremap() for non-exclusive mappings. Since devm_ioremap() may return
> a NULL pointer and the caller only checks error pointers with IS_ERR(),
> NULL could bypass the check and lead to an invalid dereference.
> 
> Fix the issue by checking if devm_ioremap() returns NULL. When it does,
> qmp_usb_iomap() now returns an error pointer via IOMEM_ERR_PTR(-ENOMEM),
> ensuring safe and consistent error handling.
> 
> Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
> Fixes: a5d6b1ac56cb ("phy: qcom-qmp-usb: fix memleak on probe deferral")
> CC: Johan Hovold <johan@kernel.org>
> CC: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
