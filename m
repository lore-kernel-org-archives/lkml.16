Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 218231EB1AF
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 19:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745263297; cv=none; b=DY2KooJzjQt8LDrn5RydtRWQM5XALEwcFFNVdi9TMAh6RU50tJ6wC8TdKV5IKsnPbOTbWcoYIO3XwLKUfIACApjpsOrTazcmXwzmZUYaYZuoCqOxSNOgrqWD0U+U0rPH9pPXoVjY6+OssrIaStKI/nQ2THBhdf8rmZXpVkLzYb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745263297; c=relaxed/simple;
	bh=rk28eIe8cUsJd6JGPxM8wYcVeLlzBfqL2U6EcTaSL6k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P2EW05DdxTqDm3KNPnziFiL7ncxczmrtPrQbHpY1ZlYSivd8K2FPN0mAUsPmSNkVp9BHwJebXS4mhSXZ53iTVytGUcDAwd/kc2Rr/BoLtVRrdumrKOjoc85iQukJKT2ie8Euq9S5FVPLuVbe7iLuwkdBKjOOcUPSnqNHvf4S+G4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KyR8DsOa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KyR8DsOa"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53LIgAXP013828
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 19:21:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GuwNQL7COdR6K7Wu0mEB7jrt
	g9au9uotOWdW3087MZk=; b=KyR8DsOa4kff5NLOokkO561Lhopgr669vN1aPhR7
	7pr7YTCCqkYj/zBzgEIFKPzRptdapbJHATcqJLXdF06N/DD4msmgVatevDSiZYof
	DIXP30+J+69GCmPj4nGoT+FGDX/OBsYWJVCHX5fnBp0lpa5D0YUF0cXlMzPfnE79
	HhgJFNZrjKOUZPMhUuRJyb92JLH+v23SfAp8hbWANs4ZVgoT6K0QiazTnwnKHY3n
	x9goIZs1sZD9DFIJmmhQBgYNinqQaSi3Y5vezPx7cH5aDnU0pShOwWRT+EBNr+GU
	Hj8v7uC3nXEP3+2VXCYT2/CtGnIGcvjmYvH4lgGnULii0Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4643wwn5v1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 19:21:34 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e913e1cf4aso117783386d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 12:21:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745263294; x=1745868094;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GuwNQL7COdR6K7Wu0mEB7jrtg9au9uotOWdW3087MZk=;
        b=me2xFisCJLkruvM4d8SaMz6TgOK2VDAkUEvt13f52D67Y5ym7Otgoz/sldwhcU42P/
         pjp09nDop0pYSa1udZIgyssVoJGRragJYFCGzvx1ZEa3k9p4uItiMkhISlrJbPDbCTe+
         wEwpLg/zZlBALAvtve8e28Hw/7RW7BuxHK21a33ETwiO9hoAPrktPWfJithvA/vZHsKf
         HuAitMY6YrsHirdnywHqjoGNOchxzx8zojQn7zoN9DbIMlQk6B7eGG/QH1pvx5m0QKYi
         UCxaI7yrb1lcdhQC9tmN2lPTNBGEQ6tQktvtZV3D97Oc+Ga/zi3T00IQUtd/vPxofX7F
         sdZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLLV+yqmle5mwDQAasy7D5h4UfO3Fu3jXxmKKSn/77iPVVuf168scT57RUYqirBzUB79AyjXpbrymote8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHb52FNLfNA/acdchS1G9A5YQ+RlQ5gTcnZJ9J5m+wyNM2U3DG
	LovzEjZs8UxqwKzjZNArqvSMfgu8oepSovyyApxb0uz2iYF/1/EVTolvCjGzXa7D1CjNpcSBCS6
	uFfvnywwXs0sqMrVT2DwSXVma1c2vxe3D4P0IVqaf7q4IHrovyHFC+JHtUs8l3Cc=
X-Gm-Gg: ASbGncvzxq1qwV+U4LNsy5vFUM0AJ4BbFLxCp2t9OUUCxAk1fdjPQDSbtFzhUw+4UbE
	vyq40pNBJQFH/EzHgmCsKVUv1ldcSPob4FfdTtvgBCW0xH+35W1wpG/+0BaXbR8p90nfjL3pbGx
	MX2KasWJR2FfuseOFDCfZ6afghwU373Hj6x10bnv0VyxpzJiWp1ZLdvmd3LJ0gwG9NcUxxcK7Dy
	2FwnboanLJ7bF6vPyqBB166gcScz/Jjzkm9hgdyVjKPEqTzE11hZi63sG8FV3VYi8a0LDJzeJW+
	rAZaLRnkBoURcoRZqcZtTh7fdc3Bab6EaITTEfk+DA9PhgeRpRmM9OIdbrXKNVE7W0rU2jFgIgs
	=
X-Received: by 2002:ad4:5d43:0:b0:6eb:2878:e1fa with SMTP id 6a1803df08f44-6f2c4688548mr234091486d6.45.1745263294088;
        Mon, 21 Apr 2025 12:21:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHjCANftnq5MsyzBJlMsyrsIUVpzmaMDTame740xj5QASOSOvM3bIvntY44xJmDpLFkmTi5w==
X-Received: by 2002:ad4:5d43:0:b0:6eb:2878:e1fa with SMTP id 6a1803df08f44-6f2c4688548mr234091156d6.45.1745263293737;
        Mon, 21 Apr 2025 12:21:33 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3109075f28dsm12536521fa.6.2025.04.21.12.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 12:21:32 -0700 (PDT)
Date: Mon, 21 Apr 2025 22:21:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] interconnect: qcom: sm8650: add the MASTER_APSS_NOC
Message-ID: <xtumjcqontja5nuaalh2xqij4g7e3bxhlqxdwkiwqxbaickppu@p33ym2w3qnbm>
References: <20250415-topic-sm8650-upstream-icc-apss-noc-v1-0-9e6bea3943d8@linaro.org>
 <20250415-topic-sm8650-upstream-icc-apss-noc-v1-2-9e6bea3943d8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415-topic-sm8650-upstream-icc-apss-noc-v1-2-9e6bea3943d8@linaro.org>
X-Authority-Analysis: v=2.4 cv=IpEecK/g c=1 sm=1 tr=0 ts=68069abe cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=pi3gJ-yj7RBswzpYwZwA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: brX_aWTRloiEUZvic6RI7NKiy9Hxtijy
X-Proofpoint-ORIG-GUID: brX_aWTRloiEUZvic6RI7NKiy9Hxtijy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_09,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=774
 impostorscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504210151

On Tue, Apr 15, 2025 at 04:03:48PM +0200, Neil Armstrong wrote:
> Add the MASTER_APSS_NOC interconnect node of the system NoC
> and the associated QoS configuration.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/interconnect/qcom/sm8650.c | 19 +++++++++++++++++++
>  drivers/interconnect/qcom/sm8650.h |  1 +
>  2 files changed, 20 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
