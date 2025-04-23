Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4723A1F790F
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 10:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745404943; cv=none; b=tFrEin1vZnbP+XNHwcwbs/DaAMA4eR7ibgNIVieeRXSaHbhDELghxtyXBrhaWV4fNz3nq66H8Il643+bdeEDcH2624WnyBTW6H/rXUq1/fEJxsATmDAFNJI72BxgygjcBeqdEpJavnZqOdsZaf4HLYz5yy6lZXPilaehu5Z6w7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745404943; c=relaxed/simple;
	bh=+qd2CcY6IxK8CQAlvfKvFE8WrtuvDbfJCfTWsUc/asw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cnf3Kp/tipzpdJQN3TbTWuQYTUlbib8NL73UGT+x317ubiIkxl5RiQVMN1bJSJ6n3A5cX7bTdeRDcBDTPrjc9I7aBq+NpBKubWWwAflVkAHN7b03qPPgKkhBLIyRN3mA8+L2ILUysTMjHl9lQSqN4hQBV/wxQ2zO1xbuuk7m658=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IiU+rpCM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IiU+rpCM"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53N0imdU017255
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 10:42:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B/sUVk9OKoRUIb1LnNSnSHgYKaMS9g0fDBib8P+9OBo=; b=IiU+rpCMYxFJiHvO
	+HIoPm450HBMyp2/oWkQm2mY9CR70Z8whPzjZGhAk/IyZRSfWGH0p9EBggmsGTmx
	5SM6b07V62/6+9pY/ewyDAo2NozPqfZ8ilG6Bfgz4BDVnYZeO8lp1gqR3IaHMQ2I
	/SuIXkgnYcpw1aOYL0rK3vwBmoqZScauKBgvZCAnCwlqrQdeFK69SnunOZuoJVMU
	FF3Tp1IE5haUORVjnilSPfPF6ZWClMianHp0rY9n1eIcVUQqqv2/jR6vV8q+k2jP
	0k1PF3fgyMGPEosjFsbyMBqIeISr9nYC5mNHC3HywwPmqhwtqKAcq1pclbFYf9Zg
	u9hFgw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3htvb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 10:42:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5af539464so138890985a.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 03:42:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745404939; x=1746009739;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B/sUVk9OKoRUIb1LnNSnSHgYKaMS9g0fDBib8P+9OBo=;
        b=l/Zhsy8sApmPxWASpNg9Pnf92p2OegV1vpM2uLIGKRt0IGLgs4uDAuRfP0oAMAa0wS
         6iS9jLCMAgDxC0m1nPUHKPPtj7K+qDNNgZRVFKiw/VYiKZh3KzsAXlJzGPXsnkbtqXHT
         R7lxt9n5fdz1w2UYClPpBt1k1nLPb85HW7nJF0+AIMY+WDCZeHcKcSadQHtA2UPUwk1c
         Eb6rnskG/XuXqD2G4+XZs0YUGC9Ir5G+cAHl+1QU9GuDrNmJDF1DCMYYw+E11h5aITH0
         PYeRqGAz5ky93DqpQ1DAlS/mjqv2SXDbxsVOeVBy/Fc+LsI2Xhsx1uDzs9JxV/xD7Kfw
         p2fw==
X-Forwarded-Encrypted: i=1; AJvYcCXWNRwXKlqMwdZCibnT8qAcwCG+LRMKJH5nb9l/htdXjUeEslbWh/EV3VN7W9VZbTN2/iixTQ4EhpLaOVc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ6SQU2zSoEXLBQc0TGWJWadPUslvwN+sUFHIbKkinRhfu7AH5
	SsdQX1qoVhTDdHoNq6dp/mQDP/mwOO93rYt1UKapSRJ9XYk8M6Hofx74aeFoErUkcdL/Myfhivq
	MmtFCJsBgBN0nyti31o9wDrqx++nqPBqofvzMhXdSDflI6onU7ecLM+PQfm7d26I=
X-Gm-Gg: ASbGncubFg2ocKhbyV6DkqSX797r9BrhaTyUQvl65SY/Iy9VQJnWyDHc5DzD8FWWKY/
	kBx7Mi6h5ZYzFZX4wE5e7ieoZgV5hfVw3tQ+Bqv4VXiH5CZdHGPpGxmKTi8qER2QDyyRSPPWMiN
	9BR+unwNL7N8i0h8FyY6I704k7b5niC92XFwbPdkdosY0o4pQ9/yeIk/fu5AnfRadfv2JGm/4mk
	+Jbqsbxhu2ts/UX8gAqMvRblcXOUTPTuXCd4Fo+dQmscUoycqGhFeyw42jbB8jZYanN+N4RUiFO
	tkipUlcSUhJv4CqwCqYDDDx3TNB4Nz1UrNeO9dXHlfdtb58MDnOGrMKBGq5iX4gbVqU=
X-Received: by 2002:a05:622a:2d1:b0:474:e213:7482 with SMTP id d75a77b69052e-47aec49d152mr115859661cf.11.1745404939181;
        Wed, 23 Apr 2025 03:42:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGiwe0IYpezKkV2uUZMKDuNbDxC8roBj3sADr4v35lgHslXOIiXv/KaGkpVkodjQUBRrJJZSA==
X-Received: by 2002:a05:622a:2d1:b0:474:e213:7482 with SMTP id d75a77b69052e-47aec49d152mr115859471cf.11.1745404938830;
        Wed, 23 Apr 2025 03:42:18 -0700 (PDT)
Received: from [192.168.65.183] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f625577f3esm7330749a12.21.2025.04.23.03.42.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 03:42:17 -0700 (PDT)
Message-ID: <3735f288-5ba2-4582-afbe-8b3f5d0f280c@oss.qualcomm.com>
Date: Wed, 23 Apr 2025 12:42:14 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 1/9] scsi: ufs: qcom: add a new phy calibrate API call
To: Nitin Rawat <quic_nitirawa@quicinc.com>, vkoul@kernel.org,
        kishon@kernel.org, manivannan.sadhasivam@linaro.org,
        James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
        bvanassche@acm.org, bjorande@quicinc.com, neil.armstrong@linaro.org
Cc: quic_rdwivedi@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org
References: <20250410090102.20781-1-quic_nitirawa@quicinc.com>
 <20250410090102.20781-2-quic_nitirawa@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250410090102.20781-2-quic_nitirawa@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: igFI-olDLlrctKAudtVoHSe8Lg7e517l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA3MyBTYWx0ZWRfX/jjaLZC8WhK6 RNM5rToqTbSXHIk2JLXalqqFCxXj2jkQajNitFv62PWLU6K7XN7x0AHuRRp2uXWiLc2X/lHlS/1 2PkctLg5ggMZGaNIcObRhCmqCGxSUrCPBKQmeXz7TuUYfOHAKDQ086DAOwspujq2JXF66AC2ZXB
 T84RM3yk/0ZYFYOFNXpJne+Ri/6ihXBLwcQSP1Pys/06KF0fwC5ZCFl8QzFMxUXmR3+/gDYM5+y bNBhZERSeIWnQcKQoAjEB4kYuITgVc+0CEnViX9jc5gD1/WMJKQPf6lyEteI77GOBAKxZ1xRfDm sN448agxQBAdXALoa3FViPwL24pCCh5IAZeaJNkAK6keP4+QKAILASHjTwEeGJtzAlvGhtyHDU+
 qFdR40wtRqrt6FUfHq25TRddj+F1EIa/ZMKC6OF8jZ8gec8B186v6jH2uWXqZFF8KM1EoRNk
X-Authority-Analysis: v=2.4 cv=ELgG00ZC c=1 sm=1 tr=0 ts=6808c40b cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=P7VlLZW0XDfqy93HOhEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: igFI-olDLlrctKAudtVoHSe8Lg7e517l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-23_07,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230073

On 4/10/25 11:00 AM, Nitin Rawat wrote:
> Introduce a new phy calibrate API call in the UFS Qualcomm driver to
> separate phy calibration from phy power-on. This change is a precursor
> to the next patchset in this series, which requires these two operations
> to be distinct.
> 
> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> ---
>  drivers/ufs/host/ufs-qcom.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index 1b37449fbffc..4998656e9267 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -473,6 +473,12 @@ static int ufs_qcom_power_up_sequence(struct ufs_hba *hba)
>  		goto out_disable_phy;
>  	}
>  
> +	ret = phy_calibrate(phy);
> +	if (ret) {
> +		dev_err(hba->dev, "%s: Failed to calibrate PHY %d\n",

Please add a colon, so that it becomes "..PHY: %d\n"

> +			__func__, ret);
Avoid __func__, this print is fine without it

Shouldn't we fail the power-on if this can't succeed?

Konrad
