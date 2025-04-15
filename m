Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343271DF994
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 09:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744710837; cv=none; b=WsimwjgUWxrIr5DWxnSigPdBvEdXFroLnV7ZF3m56kpMdVg8b/Kv5CzqFpWRRDN7/rUjphSw/eExM5PXSkDwMmmClI2JOGrp6x1PxpZTo2B0QfqS7XeiefD6da41162rUcLYClKiv8M6//SMxTBxKNfZ/7DP0l+d0wetDTDubco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744710837; c=relaxed/simple;
	bh=nfB4gqLyqc0cGgmDvW8mT61CF98kw+LFnPgIxUoqozQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BHSGNeT6vMXAtkLxOanLm1QhIGpx+0Rggj7yvLVBOKWIarvLxn7GUCO703S62f6fMREA7GBI05suCFsVW/5DrRD4eNxuzZ1IN9v2fp0VgnTaIiskRD/iOfeSWDfokCqS5QxEGWc+SXmR/+I5tS+mkJR5+HRcxq3262gGroX1sUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o7Rsj/zA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o7Rsj/zA"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tB8d025046
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 09:53:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qxeuE2eVL5Eoo29xjyLgJecbYqVi8+nNdiHJPQLgII4=; b=o7Rsj/zAPhupkj9v
	IGCH94/ff7yFpwjI2gpAfE8QGpx3kwHZDwAS5MXs/SXf0DpFAxaTjzM0oLBVgMq2
	ptXqv4ku56/vrPfk0xRA1LH/NSdEA7Un30R1sBs1dHdLBAcIPE2zP9faNY+7zvG7
	lFOsezFz5NG7J6fXs9lrLhtTpDRcArRxfPfekByzCw9k1md2DlkA0DL76H2E7Qhz
	YAkZLxDWldSx0HdYEYp9GP+upHc14UTKK+DpX5BrEHqddo4NpTJckqO938Dv4CSl
	gB0ussQi7u3O9XF6NJJpEytyWt4U42J/btVyx3tXhGY1I/EmdnZVDmIInlqa3uS9
	G/MLCw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yg8wfjwm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 09:53:55 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6eeb8a269a7so16614756d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 02:53:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744710834; x=1745315634;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qxeuE2eVL5Eoo29xjyLgJecbYqVi8+nNdiHJPQLgII4=;
        b=HMRKy2C7axBXkWFUDFkk+OijdKcwpVGQ2yIJcntcKmSxzgCYK1iUmekOPpqd86dJoP
         Rg1L7QEg9Q63Ia4MM+QGG90ePDSMPisUh5gGKrWBaMg8h/1SF20Q7an9E1Xt4AcbczjF
         Olc3CeRzNzJdZOynUuwnxgMPlLtI8omocWWGKdrgLg5JMCdO6S3mTyjgomFvI5928e+L
         9/93SlhW0JRTEvKVolzqYbA8eCc1AgZfb2gEONSWd6isL+ASsnE+WQxk7EP8/QajH8aV
         8mJaz4WgIdUgnRDkS89tH/UuIatP8IAQVYpMrTn9S1cNlgk7GssEHiKIzSZBFZz8V9VL
         8fRw==
X-Forwarded-Encrypted: i=1; AJvYcCUVqw3ocpKrWDHKAOHiBw/xy8tG0sbegdntZsGWIcsyk4nA9SCuSNJbvsUP8aeeYbd6bffQXSQ18HGrYt0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDhJO6JKnhxYCECw0yPng/0/bn6I1aJNzYrSbyIxuMBrg2H0kN
	7k0dssRqb+C7KngcB1oHIzcymP9ENA2eG0WMnfnqgV1dZdlP7oWxXtZxt5WyeKNdcqFGY88hOuz
	MolNl1Vd0FdHpSDC/QWvwgTrJKgx+52vnZr790qAw0S8SlKj4VqCvs722EKyhFHc=
X-Gm-Gg: ASbGncuq5g5W0+OotiwK6LDUzQlgHbSdn5HWkZJZjpVunyKJMfPKtBN/W27p9X0qx4B
	aAvhjPXal47yznPZCjVq5sUr6Z4MZBBzaDZNFXXt9Yl/eyxgVB/kvcC2dD8gU4EvBV0XOj+6QUv
	w20TN0dzABVyiBSoRQFhd6xeuZhE7AbJ8TyByWNZVzM7IKyp6wD1rxa5YxYnlvI/Vd01SDcGHaa
	Ie1hI+ZmlwWy0mkemh3fkpfSGQs+rGuos8mtHdpR8iR13OSFzLyVv+ZnvHwmtacuF0V69lJVwFf
	72XO8T61j00+QI+Jk71XgGoiMjXW7eMegd9r8y1xtaOWyUqT+Tw5czi2ZfkgFVu8Ps0=
X-Received: by 2002:a05:6214:20cc:b0:6e8:f019:af59 with SMTP id 6a1803df08f44-6f230cb9754mr96287846d6.1.1744710834373;
        Tue, 15 Apr 2025 02:53:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGgaJX2J+7JlHuueBHmISXlo1aK9U92F4gsipjLZi1j7TSnpCxzm7LQz4Rmzpb9J06CEF1Qug==
X-Received: by 2002:a05:6214:20cc:b0:6e8:f019:af59 with SMTP id 6a1803df08f44-6f230cb9754mr96287716d6.1.1744710834041;
        Tue, 15 Apr 2025 02:53:54 -0700 (PDT)
Received: from [192.168.65.246] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1bb3120sm1049550566b.1.2025.04.15.02.53.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 02:53:53 -0700 (PDT)
Message-ID: <4c57a98f-045f-4487-8354-807b647b2040@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 11:53:51 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] arm64: dts: qcom: sdx75: Add QPIC NAND support
To: Kaushal Kumar <quic_kaushalk@quicinc.com>, vkoul@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        manivannan.sadhasivam@linaro.org, miquel.raynal@bootlin.com,
        richard@nod.at, vigneshr@ti.com, andersson@kernel.org,
        konradybcio@kernel.org, agross@kernel.org
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mtd@lists.infradead.org
References: <20250415072756.20046-1-quic_kaushalk@quicinc.com>
 <20250415072756.20046-5-quic_kaushalk@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250415072756.20046-5-quic_kaushalk@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=E9TNpbdl c=1 sm=1 tr=0 ts=67fe2cb3 cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=HfTDXfZYWx141HAPJAYA:9 a=QEXdDO2ut3YA:10
 a=-9l76b1btMQA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: sheAA_-WcBGrESxhs6f9CRuzfn_-9izo
X-Proofpoint-GUID: sheAA_-WcBGrESxhs6f9CRuzfn_-9izo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 mlxscore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=763 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150069

On 4/15/25 9:27 AM, Kaushal Kumar wrote:
> Add devicetree node to enable support for QPIC NAND controller on Qualcomm
> SDX75 platform.
> 
> Signed-off-by: Kaushal Kumar <quic_kaushalk@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
