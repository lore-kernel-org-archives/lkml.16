Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD5828C009
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 08:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751876429; cv=none; b=iFKmxXqNOpkfM6entlK8Kp1u4pNSOmkBXUET78D5udSMWI0vRLCWrku8MDX2O/Z+KQWQ7hyL79XF4ytUk9zV9jVWbctl5vfKiVFZOk6P2cFM/X6Hnuoc0QlG5awKULc9nQXMs8Qksnlu8zt29Q8rKyd7/csQzkPGF45wDB+9UpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751876429; c=relaxed/simple;
	bh=YWK5Aly/RFu5zRYWfVMwRUbS9ghHtEzKFrvo7RaTKkM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zes0rUof36V/UvWxFfTkPpU2KB3UvH4abtAd4TWcC40iFqIQg2jWCbRPM0Z8VkaGWrsbzl/DnO9jSeBoVDqMJ+/B4tNSdNiwonCdpI+6/fwFnoMFnO5pcNgSFO2muSLEywrEayDa17zc5MjzDB0UWyqNCYIw26lyscE5CjlQBdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hjvh7/Q7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hjvh7/Q7"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 566MiBsM031483
	for <linux-kernel@vger.kernel.org>; Mon, 7 Jul 2025 08:20:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C4EMkoNbmivFQaZ38vGT0oUjiHc0kOLYnITvaWfz0JI=; b=Hjvh7/Q7eIK2cXzd
	iEpH0RXyeo2qPJ6R/Whb1vxgmucC8U0LEwI6sICWiYnDX/rvBRBOobOluIPAiYLx
	DVr8kqBJw/GIjXhhsCAZCjMstYsDqWfXbW0/B7NQ0i1iaA9hM1DC3uT5nUEk/j+I
	+6XAl+W1phlk9oN97CAl0q2v+U1Pc0B2SeOl+hHiyxWRdjyIzRFARi139yoPCN28
	gKtseI/xa88u+3tEEXBTZBQjzMZpJT9xhKE7iMSjuYbfi2S1we+zmoYvYtlgojIv
	oAWm0NO3uS9k9oBFF4QFMGQMuVFbBbE3tL9OcFH63QBmuTpc2O06FVdi8VLG7dB0
	zbSQOg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pu2aucwt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 08:20:26 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6facde431b2so10972706d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 01:20:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751876426; x=1752481226;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C4EMkoNbmivFQaZ38vGT0oUjiHc0kOLYnITvaWfz0JI=;
        b=ucmnuqYhLHAqEzaGx1690s33VWVZw1xaUXIB3d/ugulESvZO7PgGgT5GUxrxd63dDy
         T0PnG0vyvaThhgZ4z/XN/I1TLUYR/B0K/D5so+kYDto/xPXGpiRsEvAlVgxgB36AAWMF
         rTQoTFAzlqDPhprHkCN0qpvZJe48QYqSfpyQLxsUozP5vXIFpCMs5aWtS61dd+qmu0s1
         EcEtJlF2BxY0taHyIC89c9ZEj6fGXqoqUXDyfKwoYWPKdhjmH+hFnubPqyuxXbAD4Phs
         ZDiNGrH17FEMAWyLYetTl7TEg8UxceS7KwTbwp4GVS4thSM0kLcwd/eZcTAvRXyP7Z7i
         vgyw==
X-Forwarded-Encrypted: i=1; AJvYcCWEUiR4kPDbfpMWObF6IEZ+/Pv7yY8iindQhaHW54PuFzQ9dz5aN7fEJjayQbMbbVwKed+jF89jvnHDKD0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg0fvdlJErEvvpUTOjsIJu19SAzDaY6FD0Z5eUiQCQ9gYhXvks
	5hz2JR++iLuiWdT6T3Upy6zPQY/Xrtpr9uiP2E6j/UHXgyFgitRxJHzGD4tUKgR5QO5cTOZH09Q
	S/Y+qckLsgpmbz6qzNOt1lHEviQUbd6xeL6T5gsVOHDBb3lq3vCcsF5O52WK6qb1wANQx7GEI/g
	8=
X-Gm-Gg: ASbGnct5dOgqhVOgJ48esxgBDlZ2Hff/EVvSi7xAec//ZcuKbqh5Y8cZOUgW0Na4VJZ
	JIHicj38bbK6vUPM5qQthURy27/GnFCdD/t5nrUQvc1tHik/zraiMhJiVLHXXW0mPfv/XAiUMrk
	e2GotnowvAzt04n1H2ZldfN1STovG46p54gGZK/RZO/R7v2pnnIVP9uZeX/81xo+bOIu5icdlvb
	7QYjBo9Q5WqSVeN6FxFsJTERCYP2szd6PXFtZ0ZyCD+GnZ1EgeLxHPOMzQPzYvlBu0UMvlC20Gf
	G5AE1WnOvLswZ2lbcVY4ZBQRlNXC7FTpxkVWQdKy924opdCBr/YiLHkouUAyoU/ZJDAYsWyA36S
	xTiU=
X-Received: by 2002:ac8:7d84:0:b0:48a:80e5:72be with SMTP id d75a77b69052e-4a99760e68fmr67128671cf.2.1751876425647;
        Mon, 07 Jul 2025 01:20:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPGxVHMXi+GqI4wQKS4e4w813HXxLKWhB28EavSoGs1CWC9w2RB9JctfqOOsv4gyMoFzYKXw==
X-Received: by 2002:ac8:7d84:0:b0:48a:80e5:72be with SMTP id d75a77b69052e-4a99760e68fmr67128551cf.2.1751876425100;
        Mon, 07 Jul 2025 01:20:25 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6b5e7c2sm665160066b.148.2025.07.07.01.20.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 01:20:24 -0700 (PDT)
Message-ID: <6f3af18f-6c39-4d48-ac87-abbdc905b896@oss.qualcomm.com>
Date: Mon, 7 Jul 2025 10:20:22 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: ubwc: provide no-UBWC configuration
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250706-ubwc-no-ubwc-v1-1-e39552aa04df@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250706-ubwc-no-ubwc-v1-1-e39552aa04df@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDA0NyBTYWx0ZWRfX7q7sEfyQoN1E
 QbpZhhwchal9np7upESC2OkKBLtfmLrC3v7ggNpmoDE+wAgkz6zn9E5SJFS/0+JAk0rbrEeV535
 EFWJdFGpVt8hkxS5iuyuaE/Gz4BOGKxWNoP26cI7Lr5Axp343Gz1PqLuJviqXVccITPC2a+XZuG
 sxSZNDg03bJ6gpveaeqIimiq8wYcjPP8oRf1pHwDKsDeaJpmmcQmronPZZxYD9zM/aSeNKEyASi
 NKGEWNSi3wbVDQUb07VMtSQjnlnOhQU+EtzQARt2zQJIHe/YLNCERdw/ULpd51fZuXIwVr3g9d8
 /QAWjJRggWd7sDyPUrbnxdQ6GUzINeopv0xC2AQ9njWVC9hLcRId2PQM+m5EfLgyP/k5tQJqYdV
 z1cArYD3te+e44HBshbitwiBVtc6YuaWI5R5pPgDXQdMfITHgfRHKPehqdGKvDiAgnghy14b
X-Proofpoint-ORIG-GUID: N3uhdR6Eupw7Z36EEqz9UTFzL3_gQMyE
X-Proofpoint-GUID: N3uhdR6Eupw7Z36EEqz9UTFzL3_gQMyE
X-Authority-Analysis: v=2.4 cv=erTfzppX c=1 sm=1 tr=0 ts=686b834a cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=5JVmSJ65WXatj3hz380A:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_01,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=734 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507070047

On 7/6/25 1:01 PM, Dmitry Baryshkov wrote:
> After the commit 45a2974157d2 ("drm/msm: Use the central UBWC config
> database") the MDSS driver errors out if UBWC database didn't provide it
> with the UBWC configuration. Make UBWC database return zero data for
> MSM8916 / APQ8016, MSM8974 / APQ8074, MSM8226 and MSM8939.
> 
> Fixes: 1924272b9ce1 ("soc: qcom: Add UBWC config provider")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
