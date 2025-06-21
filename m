Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF0A61E7C34
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 09:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750499543; cv=none; b=XKzBoMukTPdi8UNv2LXpXip+1JHJqCaLkr1cmeDST9blbs3iUYlNjW8RAqvd16JM0c07xk22uJgTSBtqISTsMj3+kUB48z6xQTcgPgRi2006k3H39hM30wRqMgEAEnpCHlI7IBiloFruCqM+piAFCGRFTAyaXlOwuJv7r2VJWtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750499543; c=relaxed/simple;
	bh=TIOGS5SCJXWCddfJl4KBZfmMAUXC5JfjUaRnfjaBJvQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ChNf6y+y9bw3YrJZBuNqUQ6I/5xNEAzL6Gm/nL3XB1OrTH67FFZWBzmlGFZjctIBfED36ztZJW2s9RJwOqObDWrOTwCMGdEHAj8nOMj9wErF/jXAsjrsaX+CUucW2/uHs56f2oZr11X9ivdq8wD/NuuU6iXP4hdSWVHnYkqsCCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kZ41U0ng; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kZ41U0ng"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55L6iMql012611
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 09:52:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MrVWxOcdaryip895kznrb0Ayb7JA8Nch7LFAlupRSz8=; b=kZ41U0ng980P4AQ9
	F/kx6YTwZUCE5XLx0Iyg0VqMuJPM/q9dRTg/Nv0RTqEui9C6dPqBWF+hC+d/gblQ
	RfTckV/npgfTNKGrbj8EgmDdnbGT4VjzEPzmaAwMGadrO/hTH4L3ximxKlTMtiiA
	BHtl33HcOY5NPf64eAJ9HtMEG3EMEwtGP5UQYSrleNy/SByFz/h0rpmq+hhRM0tp
	0PbTr0ID10lIzmSTJFA1UK9srjHd5dFKZiqzkgOmV4qBo1nHRQq8BPDqTidRV/iv
	RPT1bulkVNM4DcYWgotYxuthWGXEcHzV2T0jvh/bFZrfuwt0+Q0Gh+myjhldCcCo
	xFcw1A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47dm2mggbq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 09:52:20 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d09a3b806aso53725285a.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 02:52:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750499540; x=1751104340;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MrVWxOcdaryip895kznrb0Ayb7JA8Nch7LFAlupRSz8=;
        b=gnOV3J1kFFO7oS9k2ee4vo+NMW9SpZvaJy97yMUppSYtG+z+JKijULhNFavAQ3x5py
         elNJarP6ZH6eVFkzYHQnjUSKmn7jwqh4GyiOHeGGHM/sw7Rkq7itvcbUuKb8VREWNkBz
         g7LhSPJYUu2s2x0daunsI2dXgWWaaciv16BRRnq9bhIQqgE5c++pSujd1abH8W2ixlEx
         Ox64hc2oU9iiSdntkX57hkRajhxFLSy/03eGFW+V1CqjxEn+m0BxCcdUAkbSIKTHeuGj
         X+PfCCD3TvyBSEUHLKP9s3o6UsoTeXAfJqDkVtMExS2HKvcqFypYpSmOC3MlaN8Wp3cf
         j0KQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7/K9ecfF7lUogFotOGXaBC0PKOdnivJNlXTRmw7eJANCuNV52xPqaNLZUk6q8oBMa9Gz1ZbAusTJsnls=@vger.kernel.org
X-Gm-Message-State: AOJu0YygycwD92J6wor1yFSGeFKnwp4FTiiuvK1428zgW1k71TYT0i49
	qKcnJJUOJ9Yi06/eRW+xrmPHt3jy/foSVbeJR417hilzUaQNpI9xa0DyBCS+wIglK9kt6hxwwhg
	+pkswQiGiQv0CHPedcIlBEbLD2VN/Ztr7R9B3wRgn1ZDDSyKFTnTfCiTXloE+rNpwGSg=
X-Gm-Gg: ASbGncscfkll1BXBWkMYIah5Js0ubOtoH7BFgsX8nPtGR4dn1uT0ph0Ks+0pf9wM6mm
	x3/+0yrQS6VwBLFoPTxW2ixnHxzUjB9FHq80/SOJVhqN3sD9AqqvvKRWarXTmkcDv+P6PlbXMer
	rfqwGmInWWMG2aPci91j1Ax4uJqPefkXyu9OfXc2vkeElegeheXepyU6uUFAyoPfnfLU25430Yi
	+Ai4E4nmHKkrJQE3ee+WrGynJRjhFWHqVFwkOEK+WLI/UsudZg/FWvvwvdWPuua6C5VKCOPNiVK
	l+WgGPejlr7rQ5Yzisr7mirY0xU6NFotp65n36h0Ff6B/oS3GKYds+f+ruFIdKp9UUYmhkzDFEF
	lIjk=
X-Received: by 2002:a05:620a:8392:b0:7d2:2019:c14b with SMTP id af79cd13be357-7d3f991e6ddmr314325185a.10.1750499539920;
        Sat, 21 Jun 2025 02:52:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEq734alkVNfmP2y8YBUA+DkY0abDKaREh8B4fbmcqxx1pQveG+x3JgzRBjRxMOuxlvhFuZAw==
X-Received: by 2002:a05:620a:8392:b0:7d2:2019:c14b with SMTP id af79cd13be357-7d3f991e6ddmr314323985a.10.1750499539490;
        Sat, 21 Jun 2025 02:52:19 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae053ee4e32sm339696066b.57.2025.06.21.02.52.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Jun 2025 02:52:19 -0700 (PDT)
Message-ID: <8555840a-5cbe-4650-9499-f3876528891b@oss.qualcomm.com>
Date: Sat, 21 Jun 2025 11:52:16 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/5] thermal: qcom-spmi-temp-alarm: add support for
 GEN2 rev 2 PMIC peripherals
To: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>, amitk@kernel.org,
        thara.gopinath@gmail.com, rafael@kernel.org, daniel.lezcano@linaro.org
Cc: rui.zhang@intel.com, lukasz.luba@arm.com, david.collins@oss.qualcomm.com,
        stefan.schmidt@linaro.org, quic_tsoni@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmitry.baryshkov@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com
References: <20250620001918.4090853-1-anjelique.melendez@oss.qualcomm.com>
 <20250620001918.4090853-5-anjelique.melendez@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250620001918.4090853-5-anjelique.melendez@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: YDNqDkjdSD9ahUA5M3J2MfM_4RFQhXVt
X-Proofpoint-ORIG-GUID: YDNqDkjdSD9ahUA5M3J2MfM_4RFQhXVt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIxMDA1NyBTYWx0ZWRfX4g/l3x1SeKSn
 KQX/wm/Y3i7COxdzjHv7KWo+fbW61cbhtFbcj53hfQy9Xojy9nrPsAHCHE9zGH2wCMRZMC9ULYM
 VTtvexLdneHarEUnlEtdClyCQKdi0ZT6ECfpjexFr//Pd9X2iqepfuSWtzzcnAVkdQa2lSub5Ez
 ODE6uH5a/CmPXHELrmtAlFiKVh7TVH41/jc40QR3010BwGeQh5MVQgZovI0OPqes05FP+hnYVCY
 5MCcAPD6UQ+dhuh6NI9Q7FsLzMC+zESz8EzlmJL4ODGBCbsfN3lBl+gJEtodEn6cNPQktqhfmux
 P7Ogv9BVmLE4EprsO5fdydN8rEJwBslSvhg55S8vwjuTHKjG3SQNPZaR+4piDn9u7UofYMFWNnH
 Hj5RmcB88R4v5G2n32eI/qRWllDxwabH4cmGJLFUyV57OFee3HhB3bhycHHXZKBgsqtChsVq
X-Authority-Analysis: v=2.4 cv=Q93S452a c=1 sm=1 tr=0 ts=685680d4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=iJ2Ah6jtJjwnyIaW4igA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-21_02,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 mlxscore=0 suspectscore=0
 clxscore=1015 lowpriorityscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506210057

On 6/20/25 2:19 AM, Anjelique Melendez wrote:
> Add support for TEMP_ALARM GEN2 PMIC peripherals with digital major
> revision 2.  This revision utilizes individual temp DAC registers
> to set the threshold temperature for over-temperature stages 1 (warning),
> 2 (system shutdown), and 3 (emergency shutdown) instead of a single
> register to specify a set of thresholds.
> 
> Signed-off-by: David Collins <david.collins@oss.qualcomm.com>

A lone s-o-b from a non-author, without a c-d-b or similar is
ambiguous

[...]

>  /*
>   * This function intializes the internal temp value based on only the
>   * current thermal stage and threshold.
> @@ -486,6 +620,8 @@ static int qpnp_tm_probe(struct platform_device *pdev)
>  	chip->subtype = subtype;
>  	if (subtype == QPNP_TM_SUBTYPE_GEN1)
>  		chip->data = &spmi_temp_alarm_data;
> +	else if (subtype == QPNP_TM_SUBTYPE_GEN2 && dig_major >= 2)
> +		chip->data = &spmi_temp_alarm_gen2_rev2_data;
>  	else if (subtype == QPNP_TM_SUBTYPE_GEN2 && dig_major >= 1)
>  		chip->data = &spmi_temp_alarm_gen2_rev1_data;

how about:

if (subtype == ..GEN1)
	...
else if (subtype == GEN2 && dig_major == 0)
	...
else if (subtype == GEN2 && dig_major == 1)
	...
else if (subtype == GEN2 && dig_major == (>=?) 2)
	...
else
	ENODEV

Konrad
