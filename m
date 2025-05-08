Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5944F1DC988
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 14:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746715393; cv=none; b=SSnUp2XTIMjEqe2PSDWEDdHZxBIi/IPeJziR8NWmeRWFVHnFHNBq4zmS2yCD9g/0b13ThEkvlnnTwU807cd6rRqho8iAQYJJPTpR4wrfRfW+00Mf+BfkkJx6thazvuQ6X8k5N3gKicEvnz/1HZM5xnl2DkwfWIqeRjnjbfNJR14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746715393; c=relaxed/simple;
	bh=f568pbAx7mKUVyVgW6w2g088VmARJllh8QoWO30N0uQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P/pRduIypuKDtLASlOrC9aRaQiPPTa63HILuCtflW4YF11kgeNQc+4Y0mz65Cb77kOD8oxPQQi96LdqdQ9cvYvK77ZrcbJLkgKyoCuRhE0KZs56OmRbfHpIZRTWqg2OswAmwXUJ4Pm+ucV2cNYcJVgdDoCysnROCGQYamZNBUwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nhBz36HB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nhBz36HB"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 548D0Ob8008438
	for <linux-kernel@vger.kernel.org>; Thu, 8 May 2025 14:43:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YTC3vuWt5RQ4AmGS1OJjvC1wx2knq2oIlkpbuOBdIZM=; b=nhBz36HBlwYTsk2s
	wxD1kT7zvzzoiDt6/Bro5WotUE7hI1HQ8GQs6ELapDMkpJP8Jwgc9rXbiglGfO2s
	Hpgi3n5Ea1aBCckZ1LDpg35JoU4dhDKQtK8LrSZc9XFW2WIKML/SIKx8ejSiHlNd
	Q3tWESt1MtqkMd16f8vjXmzRYzUddm/l5xeXEHIcDNyatd1JHx8PGXFCCrsTVYMI
	ouKXKz7QPFVE9/SWTrHiQA0CwIwMB3EyG8nNlRE/ZQEEA1yy0aZkva91DPsDzVAF
	hKBDAqRuOm80ie9xYspAE/K3We+ckvFnODp4xT3P5O8Ky8hN1ZQULzHp39vyH2BW
	K94llQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp59p56-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 14:43:09 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c552802e9fso23399885a.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 07:43:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746715388; x=1747320188;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YTC3vuWt5RQ4AmGS1OJjvC1wx2knq2oIlkpbuOBdIZM=;
        b=TtVX/oFmBUicjJka3iJdMsdk2/wc+rQrm1fNWOX3BIN+XySbF1ZLeyxp04UKSrMMgT
         OzAN5L8HRDC1x4Sg9Cei5MzU+UCiUPQjzIvDe2YO2pJeSPAYNLJM7NO1yLlpTF7+1gBA
         wviyjC+Sz+RQtszLrU2Tp4RQfWzvpdBi3hB0VbTYzdIkZwmGPPGGeb/i8U3aS0HYxvtu
         Ce6t7zSyTDojJ6XyXBP0ty23qv5/B2gpWMqbAkXPb/L7cqH37GZvdIrzukbd4EhQeKeF
         zOzPbNTOv3BJmeXIrnIPFiqS/ig1Q+ffIgtQulpaet2u4WoQlDQjUNGK7mcbXvsevyTm
         6EUA==
X-Forwarded-Encrypted: i=1; AJvYcCUzfWFxANwAN84bMT9AeUCoQRU2HLT8+/tLk+7K4Ux9jIjZYB0wp52Wv3l2xbiPUPxrctqNRKXL8+R8+0w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzru4dmpcGrrBaucRbHAv8Zf0plkc3/tQr6735U1L0qI5N6ECKP
	F5zVJz+jWZfSuPD/R+8mBndVnnbPwCK1ljthaJeIU7gT5JxeQYJ79CEdffEo9itEfzMfPDtns3t
	OwD1UsLzCRCm0xK697B0KD9lc9pdryE32KTZegvoxzlaMcYkYPBaQtqU+s2itb90=
X-Gm-Gg: ASbGncstWydJmuW1Dv7k9/k0cM27CnQ79G7SP6NFCnKMJhoHTXu4ixdXhNruy/91FZv
	z0QN1WWXxb/PPkM6FFT9q4o71bWPDuVeXDVQkF6sEOJNiaCi+m7tI8WrgoNC7w2An4YR53oPkIi
	MaovfjJs98T2WeeteuUUXAuCycj8Lxg7k64sP/Zh9xcj1WXQM8E/UiTUSYMMsf/v/98cROyZ8oV
	SX5KMVKGRPJWorHeeogO4Wh94pNFkwFnERkzpbzHbPdAyChZjALBcCakmJQfbOMvna0zR6LBlBH
	arN8MDTlNlf5HcR/gU9w3PsdC1jhHS/HAGz7AHwoTq3RV+hT48VUCyKnXbHqT8nkmoY=
X-Received: by 2002:a05:620a:3909:b0:7c3:e399:328f with SMTP id af79cd13be357-7caf74079a8mr386378985a.11.1746715388447;
        Thu, 08 May 2025 07:43:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELEl4ogSrPxozRoWetBNvU9LdP3GlTW/6PjQ4l3hnTs4G94EVNqSCkQCz4LpTOz6QR65diDw==
X-Received: by 2002:a05:620a:3909:b0:7c3:e399:328f with SMTP id af79cd13be357-7caf74079a8mr386377285a.11.1746715387927;
        Thu, 08 May 2025 07:43:07 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad189146f74sm1108396666b.17.2025.05.08.07.43.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 07:43:07 -0700 (PDT)
Message-ID: <b0e66369-5f67-4fb4-add4-5b5439ab4f62@oss.qualcomm.com>
Date: Thu, 8 May 2025 16:43:05 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: qcs615: add ADSP and CDSP nodes
To: Lijuan Gao <quic_lijuang@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: kernel@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250507-add_qcs615_remoteproc_support-v2-0-52ac6cb43a39@quicinc.com>
 <20250507-add_qcs615_remoteproc_support-v2-5-52ac6cb43a39@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250507-add_qcs615_remoteproc_support-v2-5-52ac6cb43a39@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Lu2Symdc c=1 sm=1 tr=0 ts=681cc2fd cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=jONUQADHCp84k9KtN9AA:9 a=QEXdDO2ut3YA:10 a=85N7vG7B_AQA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: yoiIxf2JRJcGdmhGM2wwJy0Eq8C_0Gle
X-Proofpoint-ORIG-GUID: yoiIxf2JRJcGdmhGM2wwJy0Eq8C_0Gle
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDEyNiBTYWx0ZWRfXwro6vwA08I1S
 09fNn8Mx1fBHlNzRXyWCbl7yzV8wQ4a7qN34qRnF52Vxa3M2hI50Neq0Pllop2JVUMbxsKRsczi
 +s5TqLqscomQn8z+4Mbla3igsuOVKkXcgXdE9pDwmE2s2aMS37AWnt/hNtcMs0TBgOzldnf1Ej8
 f1AfFHDgEyIwwybOCgb6lmPWbOClkMfu2zZmWWz5iX3CNVD+Unu7xTgjv4ZqOBSSkeeDrFsKaOd
 DJtVNyf/5nJFQkZ+iuK4xNMRThuRhWBTYghQMJMxsz/ny0dovIZbcjOqqYooutfYROmHnSOJcyI
 WtVanK9xp4o/Cwav6iepfuT4mhcT7qzS2QMQP8dMqmzyhxLHl+OnoxUm2ZL7gUZk7wq0a/+xLUk
 EtrCSvWLIXfB2nOq/wcqXGONlcxzywxFvg5ZJsz5Rd1JPFNMyjCjnRdVBHuxiaciocNEbi2z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_05,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=618
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 malwarescore=0
 spamscore=0 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505080126

On 5/7/25 12:26 PM, Lijuan Gao wrote:
> Add nodes for remoteprocs: ADSP and CDSP for QCS615 SoC to enable proper
> remoteproc functionality.
> 
> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
