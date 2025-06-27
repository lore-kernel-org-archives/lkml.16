Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83CC71DB356
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 05:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751000874; cv=none; b=V33wNDFWXAOEaMuz7c/nak4ufFJJIqW7SheXk9PioGCNINRAhFqs9JFYnrxvm9B73FUgaMSHaTS1PREWxdxSU65xqlHI88w955dymFL9E1W8QmC1bLB0QWfnAYRrAf2dDDQ9yCJ5wtbnWQoRCU2U2ErqMtGLkoFKpwE80Yuqpfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751000874; c=relaxed/simple;
	bh=lfx4w5PLHzZtl7g7tKnMoL691KQ07239Cuv6LeDipmA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tnLjJB9DcSPA3JnmIuFVubFlPQjDM7HFYXVWm2Tu/qUE2xEj2U16+VnylevX7ytwjLh5rBnmU75IxelP5q7+38tspuo1DA5PBOGqAcyUQ/9ZHkpSuHCNNpCHIuboZ+VzU71tklkIpnb5YOqyrKmi8nyZLekMQruiMQEqo+6GdzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N8RdC4uU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N8RdC4uU"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55R4DBG8007184
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 05:07:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FgNJiyaML1WffY5YxWh2k0JTtZoKYshdhU1UyOu/WNk=; b=N8RdC4uUoPcQYbEH
	RJ68G/R/v9vvefr/8tzEZueF4Y/33jrudWfm47/MnKeohnUCe7mG1xq1Wk01kydp
	wBYzZSYLJLKAuEro+dSotPR+zpsJV8cvQNFFRzmdrAyiSaErYw5KfPEWFcubzSuW
	2520ueZPaBRzOBY9ot8sT0yBuonp+DDPBseCjs1iBfsQwKvyaKG/ILr10QyboaCV
	mEhvbOnyzeSDtNdP7YoyNy7Ai5iO62K7D3OXL9WIUnOUUkZTv96WUKwKNIDcn+fg
	45R5b09nK3WokgEAGuerdrTXxO0FNMVCueBbv3WvSEtltQOnTE9Y6lGmRb4RfcTd
	ikmGeQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47evc5xnqg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 05:07:51 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2363bb41664so14341585ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 22:07:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751000870; x=1751605670;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FgNJiyaML1WffY5YxWh2k0JTtZoKYshdhU1UyOu/WNk=;
        b=OQUamzRzyBzntddw+mRqCcvaSc9hSjAUr3+hId2LUVn4iXYfrgBwsJeJwhsOI2vVMM
         ILtGwkLIx5+MToxNMgxLGpOg7/nwO1Cis+M+quS6FM8B2Q0lqL7/yOSwAnS9TRjUPtGx
         KqU8f/ZRn1v7WWcwFob63hwqP5XBvGIFLp+gIhaKwGAUIl8lkncZnGLWbLhZLLfKhHKE
         Th0zeHk0Nuk87QpDKZcjERgv0uWbAqUdwBJ2+1egQxFfwV/vBMJuFlZ4k5ROHgigmHd/
         +Yqs6T8Uk8bE3aJHy98nE5uepW2+VLtlRJIQmtKGkwDaPNdJvY4ye5BOVvZRL1uscGqs
         yw3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUp3uB2xRDiCdmwi5SDA6l4zThvhD09cwvJryPY/FKsLr2wFUmxYM+5QdDl7gr0pJJ8A+GvV4sSiQm0Fxk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFkjplfL0Gve7VNJGHgpfKGm4VizEx9VC5rj/a1dI1ZFjlwAOk
	e04N1JsGc7spweJkbo/gCdz1RieuRbzVbewXQXWO8wrtMwTT0XsPjbXnheviRKoY7Qv3QLN8VVW
	/lsR8//dA5dE6l+vKrFtP6xX5zrAcEh/VFvtAcVsrj9hjvtl4XTBo5RSKaAjYpv7r4X4=
X-Gm-Gg: ASbGnct4oeYSR1hm8sFjQJh83xbfHk25xeNAdcvSJc3B5LcgcurdxmxGBGennYMc4U2
	WeqmwEHfQFtVY9Ao0H9y7iIP/099+QYrJU/ZySTdgaFWA9XABapJJshwPMl/ijVJE/BIPD13SiJ
	IUErhxOnsKfME6Dj8lg3zKIwpxQG0JXgnSx8+G+gr/A8jbs0c6F2KWp4+2diohYm3H1QDnprFek
	9b7GyY2fLv463Qzq8FDatMtD73wUTdvMiDSe6TTX+1EtO7R6YecI62DkZKzXnoIGnHReW+VQ36b
	UN3xpNUI2nrBmLXiFnlfxsRIzcS7t6ZHDrjp7UC4E6N61sXeQQ1GwzM=
X-Received: by 2002:a17:903:3503:b0:232:609:86c9 with SMTP id d9443c01a7336-238e9e1cbd9mr82900035ad.9.1751000870560;
        Thu, 26 Jun 2025 22:07:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmFFD1sc3TnhJFATkK52HnmEtQ7bQJi41dupwVvYX6GFgmLB8KypB/A+WO5bcGBxSpG+UStw==
X-Received: by 2002:a17:903:3503:b0:232:609:86c9 with SMTP id d9443c01a7336-238e9e1cbd9mr82899635ad.9.1751000870063;
        Thu, 26 Jun 2025 22:07:50 -0700 (PDT)
Received: from [192.168.0.105] ([49.205.254.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb2e21a7sm7230315ad.4.2025.06.26.22.07.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 22:07:49 -0700 (PDT)
Message-ID: <595e5d07-67d4-4352-81fb-0e5cc9ed0bc5@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 10:37:45 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] arm64: dts: qcom: qcs615: add missing dt property in
 QUP SEs
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_msavaliy@quicinc.com, quic_anupkulk@quicinc.com
References: <20250626102826.3422984-1-viken.dadhaniya@oss.qualcomm.com>
 <x3cmdir4lotf3yekbu3tsmts6idsvwygrp35opszmgabhpvdda@nlwrs5qojcml>
Content-Language: en-US
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
In-Reply-To: <x3cmdir4lotf3yekbu3tsmts6idsvwygrp35opszmgabhpvdda@nlwrs5qojcml>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: F_yLwTtVsPy4Xc_M4mv-yO3sI1qwyTVk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDAzOCBTYWx0ZWRfX4B9eElvOOZJq
 G08alH9HAI3ar55dLdn3aTDEnf7kQvc6YYHbqiXftq4YB6KmGCQ4248ACM8gF3tjD7pk1qE9aHS
 uojzNyy/1NhKZ+jQvTnjohph5elH4CA2mA82/i2/MKaJ30u4HXrAI9iqP5filT8xFCy3N785k6e
 zp6oRKAHLEiywfjB0rowoxQrTd/c3CvJFH4bXVjZjvSVWvWrEwmZ+iptJAcobD9bO1A9YacEJLL
 kS5JsrndKn81X3O+Zi3MJSNXL20K+wbzXuwJK8WzsBvt/eRn/IV94cW8QE/qgQqFGTth9b3WW7M
 0saYweTiHiLffyPvlYUTZ7nMgsz/XS/bs9lWNSi8sdntsT9Xm8DK3hbzEbZCL+cXitS11Qu8vcc
 hh4z8LVhelBtP3/Yxaxm8vscY/h5xVMwB0Hh3k0nVhh4/acLnkzUyggLpKd6+Sr3FFkHmfaw
X-Authority-Analysis: v=2.4 cv=caHSrmDM c=1 sm=1 tr=0 ts=685e2727 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=gik7yjij9jROcwxpePOrKg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=uL1e5Wp_dwoLeR8WhnsA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: F_yLwTtVsPy4Xc_M4mv-yO3sI1qwyTVk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_01,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=640 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270038


On 6/26/2025 4:32 PM, Dmitry Baryshkov wrote:
> On Thu, Jun 26, 2025 at 03:58:26PM +0530, Viken Dadhaniya wrote:
>> Add the missing required-opps and operating-points-v2 properties to
>> several I2C, SPI, and UART nodes in the QUP SEs.
>>
>> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/qcs615.dtsi | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
> Missing Fixes tag(s)
Sure, will add in next patch.
