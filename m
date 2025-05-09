Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5126E1FDE19
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 11:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746790633; cv=none; b=FH4widbFueoYpN1NgStTGzt55MJHbk9r6Yezok7WAuOpP8JNeU+juMS923azGSBnTm+vf/ulP2XRmbuUnzMgNRAPVPOsb2uSRpV2vv9WmijQZfV1U62vt/PfY8UJx5KorzsTeJVm2IlSGgViSzCt+6Qkchw3fdXjqO+m6KEEX0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746790633; c=relaxed/simple;
	bh=v3/X/EsQXza5RfDWmNFY/6SXCtBK2b8m4VMT4qW9eLw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qydonvTy7LP5S7Sllpm5HVQMU0n+O0eJFzfxifz4ZXoZEbXWwblSy6UtHo9xKrWr7Fv3U/bXq5CmIOz98o1i0jJ3TPDoMVMNmdlxERgVjtxFJJN0hOPqizlsgJt0GLCEncLmCAVkHIwo4tA+CtwNFzEAPnaSZhqcJG+/p89Y44I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gpxGwwOd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gpxGwwOd"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 549Ba4Y1024935
	for <linux-kernel@vger.kernel.org>; Fri, 9 May 2025 11:37:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jQYvA039xQOq1EAfq66VEyDGldlR86EFFJPP/2sBrOU=; b=gpxGwwOdLcT4VVU6
	mlpdKrnZHRbfbF1FwcU+0c8Lxzudb93lf33vs/czLEBQrYLhS/492C6UjHCR6uXm
	itHS37wugjgvMTSXsRxvoF2ib7+sPhEHzXsiqSHsvU9ntny7AQJHZvwWQdtZevfB
	4djbuBxMpJ8+PL3R6QSwCo3TpqIM4CIBb5u+eI3nZ4ad9ENHMZXYfupTWo3j5Ndu
	BrPHxFPi9+0dagym6txfQVFh6zdwBdkxbChjMK0zPeSwhc8yHya972+K+CUSq8dl
	TdOpJIK7K3/qNw66g3oGhuQXJojEVyiP0rp9mkbbR7UucHE8DsBfwVHTys9tQIMA
	ErQq3g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp14js7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 11:37:10 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f6e697a894so1234106d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 04:37:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746790629; x=1747395429;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jQYvA039xQOq1EAfq66VEyDGldlR86EFFJPP/2sBrOU=;
        b=TiaXtZtwphIK+7TRdzWOs4KsMm8pRnlaWKNsE6ZFSWF2OrrdUoNecwO35DoFJBAjVi
         fGlyG5W/fxom10f0mRvnJ6kN7VbaoovtIPqzg01PJtY+30QUd82MRNCM+QCEjNI0oDAc
         tCTRJoCCGaYPD+2UsYH9tkeBqCnXqDAikV6qTTWTGeM0JH2n+HQlmTsJIiAcdl+w94xL
         qmOKKJ/gxUTYNO04mR+QdWIFJs2Q3ZiGGWwr9/xl0xd94DZEeAYAEJAMQGQr06IpYXEs
         osSPzWjc3W/CQ4zkcjqthY+HMsHgOfsjK38Cnmo437ThMZCzwqLsfUj5x/GfTk0DGfSU
         qd8A==
X-Forwarded-Encrypted: i=1; AJvYcCWOSoLEf8Kw/NEn0Y5hFxF89oofLFiRkdQrYZoYUk5zSwSUS/bIXWRlGtb/ZQmm3jY1TpEHQ4WuMiOK3lo=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc3IFvbl1f63blVmM9pYlXCpYxJL4BnlTIesqVtnnjX8ZuzK4r
	de6EScXpPT4WCUKlda1SMERZBU8PGABHBdHcTTj7VQJHkOwOm+rxV6JxZGB1HfwaGHVLf9KHSBn
	tDnF4mQnnlLtfVmLc0ZgXrqljflDPjOHMksIGbcghDzone8H6JP08sck579cUDD0=
X-Gm-Gg: ASbGnctFfPCGOEBZg4MTJO+DdHNQ5pT0AvU0poy2g2WUpukpUwyEzqBaMySpvn8k4HM
	CoPpdyJf7YTOJv786BLBJ4go1Wn/JjKazZ5YsNIcDrr9wHcQ4Lh+YsrZ3FG7uylZbTso8sQIxOL
	AZpRH0BmEHa+xEksMiISNehhHiJ9yFjwfH792177abmUTleO9tDobjNmIxPOSdK3Quwh3tA4Hs1
	zTQgHub9+lR4EHZihjzhHFlhqy9vptCHyp7TbZM/rApuoF+523y3BCtyTm42sVKVPwHLRRx471G
	v424XyUyZRJN0IyQoM6mRPGw6Q9a/VHsXmuNGMVq01xuItO/l0uu4oXIqf8CIczu58Y=
X-Received: by 2002:ad4:5f8c:0:b0:6f2:c10b:db04 with SMTP id 6a1803df08f44-6f6e479b1a0mr17500916d6.1.1746790629009;
        Fri, 09 May 2025 04:37:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGEM61nHn0Kr2ns9tneLJwOSpfCca4k81zAOLbsRmIWWWiH1KtlKtWvlBuAwRRqu3Bq9s2A6g==
X-Received: by 2002:ad4:5f8c:0:b0:6f2:c10b:db04 with SMTP id 6a1803df08f44-6f6e479b1a0mr17500686d6.1.1746790628543;
        Fri, 09 May 2025 04:37:08 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fc9cbe516asm1260658a12.15.2025.05.09.04.37.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 04:37:08 -0700 (PDT)
Message-ID: <58d913b8-0715-41b0-883a-423f29cb5a8c@oss.qualcomm.com>
Date: Fri, 9 May 2025 13:37:05 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 10/11] scsi: ufs: qcom : Introduce phy_power_on/off
 wrapper function
To: Nitin Rawat <quic_nitirawa@quicinc.com>, vkoul@kernel.org,
        kishon@kernel.org, manivannan.sadhasivam@linaro.org,
        James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
        bvanassche@acm.org, andersson@kernel.org, neil.armstrong@linaro.org
Cc: quic_rdwivedi@quicinc.com, quic_cang@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org
References: <20250503162440.2954-1-quic_nitirawa@quicinc.com>
 <20250503162440.2954-11-quic_nitirawa@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250503162440.2954-11-quic_nitirawa@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDExMyBTYWx0ZWRfX11uWud/eHKwq
 BgVtjO/JSKccJEcUB3FKrFzkUXXQb+Yj1snGqKDNteLWbj5LofRwebJfRyZ5Yh/r4ue3vlWNHf3
 Hj3A+7JLumRhkTSom23GKRwQbtnn0e+FlNAkHvdVTywgVBfQM4F4umP04D2YG4T024lUbM6YpC/
 3mgsJpIaFkkjFOT7VEPeo/U8p2uAs+klMxtjS0KyLB6cPkZBxj2A2qcRz6KI+f0jv80s/jjVIgm
 dIdPlx+IiJ+fk5OHYn1fKuQE5axPB43qwdco4C39tFj0lIHSs0u0WCx9ZcwIMu8pLfWWQVVO379
 7P2DHlz/Iq0F/+sEAbr5L9Elov8QsmdsYuCOXLeA3Sp+FdVO2e+5QmpP+kkPydEbJVb99OOKRIK
 OeCbWqPF/JV1Qbu6njYXTu5W9eZQ7mTTHWjR65paJ0zOqeqdnpDKdvTPQOfsBxrMVlLnbbW0
X-Proofpoint-GUID: K6xBA3iwGnkNKkVp9UEp95boOwC9oTGm
X-Proofpoint-ORIG-GUID: K6xBA3iwGnkNKkVp9UEp95boOwC9oTGm
X-Authority-Analysis: v=2.4 cv=W4o4VQWk c=1 sm=1 tr=0 ts=681de8e6 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=Wi1UdT8OlrGSyUgSRKsA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_04,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=687 suspectscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 mlxscore=0 adultscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505090113

On 5/3/25 6:24 PM, Nitin Rawat wrote:
> Introduce ufs_qcom_phy_power_on and ufs_qcom_phy_power_off wrapper
> functions with mutex protection to ensure safe usage of is_phy_pwr_on
> and prevent possible race conditions.
> 
> Co-developed-by: Can Guo <quic_cang@quicinc.com>
> Signed-off-by: Can Guo <quic_cang@quicinc.com>
> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> ---

The PHY framework does the same thing internally already, this seems
unnecessary

Konrad
