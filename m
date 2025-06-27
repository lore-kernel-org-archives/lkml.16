Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A29F1DFE1
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 12:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751026670; cv=none; b=PoWyUGPFk5fnSfni4Ym5+47h/B55YxtT+iioV80F26UdN5tYJ0LYyhOlKeq0aWUal0r10Zm2bagvNcl7E312mlBqeiloQLyRdxtkurS5hgmvbm5UbSC1MRNZlZu/Lm/KQ8gDj0XlaaxKUSmiOI2CKYybRpW7ZHQ4kdQdiVRJSjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751026670; c=relaxed/simple;
	bh=lccNhp6FqIRSa/Q9kLRCcCT7NqJsIU00/JLCxD8q/oQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pmFpNNfO251VFWTrdgH55v3xfANeVGTIGHFgfX4bNLLy1FDTQauNY58qE5vmXbyBbF+AmWRRj/efGk8q5q1xqtkl0iZ/rOhgq1Iw0XR0Rmo6/ZPBe9tPt/j6kigHDMvuZE7HnBFGlpvux1hYDIq7AnFxwfU8ZKq+JsRS9a0ZpOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j2mYc7i4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j2mYc7i4"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55R4DDmp009550
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 12:17:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QJ19J1LIBwAi1TN0tW2T4j6V8Ae2MTfdTDqckVMIpqg=; b=j2mYc7i4EvQ/nNkj
	aRo4PcxFrCba/VMkMsNwtWEc1u7WDv2paXrJLHlMPWOXmKt5lkU69Ll8yhYF9mu+
	R50p/AC9BRl6XeBaPLJ6WB2jehuJ3OiWdg6bI8E91DhsXP/i6WMB4b78856mlfb1
	WhtGCij4FlPhdCMz3VyzukA0zdp2RD7RH2s1xjulgPjyMJeAsuC4hhCFKNVVfV7Q
	xX90rvmVEzdrqoPKz4IGD3Qfo2VvYsVXW2azychnvYX7LxGalFPnmiqAuoE4nZwT
	AHZLAhVABcIrepqEhQPrBWMWkvWzyNtNXuot46uAzccaF7banUZ4dJVR8l+GyWHx
	IsOIjw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f4b46pwc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 12:17:48 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4a5a9791fa9so7098351cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 05:17:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751026667; x=1751631467;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QJ19J1LIBwAi1TN0tW2T4j6V8Ae2MTfdTDqckVMIpqg=;
        b=lQEd/v+Lw0DRkvPcKU0d8459d2DA/otgLuhc6/J8eLRpbxb839SoncreM6zjNz32a+
         JnpipWQA5KQE19N/44rTtUO+FcvlfceYOmxg0tZFdgxp6F+Csou1kouHSEv+qSmwD0FB
         6hGGGgjTRoMhbcrjT8E3OTmyoDZhvOvtr4yE0rb9lKwM5/hJMhui2xCRJ3r5iAJvKrs/
         GYeHx7aCWsNhQVTHh/gEQjCSuBCE+SeJo36uV4QNsLqc0ZJKEa43WgLvNdqZBdj/Fq9z
         kWqsb0GFeiiP3zsuSC9JhlE/xsIfIUAtK/gswtuHm0LlDgTHWqvUwSvo9gbWNlQtzknO
         ALiw==
X-Forwarded-Encrypted: i=1; AJvYcCUQw06STIr3i+2+siXLzVTAX/rjYCFplg/dgl/HkGI0nPA40ru2s2FXFXv+VsWWR9TGn1WDd4oXOTH72O8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnbVAwBmOrCbCwWoU6FGMZCN4tiF/GznTRYjhAbkFTtLXzSTqd
	FmlO4IbvlEXnjkDPcEANXXhEwC1wWzkVua6JYwo9LJyTvwprmqT7vXuemXgeiNciTMi1qqqSEur
	c1yHh4rKdEQpgfqNbVrdg7BmHQWXtK2szbG/uXoSo92NefyZVN1RluQOx1kCO4eKViLs=
X-Gm-Gg: ASbGnct8Py7WoF9obWpKFrNoTPh/r9tHAuOFqqaUwMggJgSxp7yj5W3ZRdkMTGOCxJW
	Q/PHS8CJ/P0NKo6M3PhREAGvjHd5JLMcAw6Zmvl87JcizPL0E3n7kWqIt2UJvCaqjcDKuh4p5Lq
	dQ4wHbKJqBcu0V8j4w4wWIH/upnYKoE/+fkyPPSDI0PowymWOqrTc+siIUcXmk19wPWpYffSMcB
	nOA3dYKbSITaeaxYf2kSoyoMcS7znSgYUB8outP4GODqa7e5vaWUxEquLhsbtjZW/s0goKBqCiH
	R6rrcqhmEw/y5LHIhUzsxh70dEjopvdutovsji0K3tHxwgojvNZBUWqwjFzOAqIm2OKzcmReM8n
	iLbI=
X-Received: by 2002:a05:620a:198a:b0:7d3:c69e:267 with SMTP id af79cd13be357-7d44394f337mr156189985a.12.1751026666688;
        Fri, 27 Jun 2025 05:17:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIK9htb9TjdDdSp1TC694025TRJoUgCOt8XrvN3XdaNpk29pDfLu1EUHUVl+ULYjW5QjCFLw==
X-Received: by 2002:a05:620a:198a:b0:7d3:c69e:267 with SMTP id af79cd13be357-7d44394f337mr156188785a.12.1751026666346;
        Fri, 27 Jun 2025 05:17:46 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353ca205dsm113371766b.160.2025.06.27.05.17.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 05:17:45 -0700 (PDT)
Message-ID: <3f2279ce-7d4c-4ea7-8d3d-ba98208e212f@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 14:17:43 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] arm64: dts: qcom: sa8775p: add GDSP
 fastrpc-compute-cb nodes
To: Ling Xu <quic_lxu5@quicinc.com>, srini@kernel.org,
        amahesh@qti.qualcomm.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        arnd@arndb.de, gregkh@linuxfoundation.org
Cc: quic_kuiw@quicinc.com, ekansh.gupta@oss.qualcomm.com,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250627103319.2883613-1-quic_lxu5@quicinc.com>
 <20250627103319.2883613-3-quic_lxu5@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250627103319.2883613-3-quic_lxu5@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEwMSBTYWx0ZWRfXzRiEznLP8esB
 U6FLvKnUJBYt8PU7Qd14vIJ+SnEQSRTF3C8wmEn0JYUCIxvVhl0VRnUMApYzBf9+KGHd6f5ZIMl
 Iif49CjrO2l4gMiG2aRkSpB64QUAdZIbZ6OLYSnUBnf7xpAlvMovzuG7IbDKIeH6EJ5VcC1c0qB
 9Mq4Zv60BA+Yw1rElySOK6P6FpR+6WsembcLp3WrVvnu3EIBrYbrXJJyo2Nb7JcJO/fkSGJqKFe
 iVUG5owuyy5faS+lUO4MV4h/sdyqN1s3sutUCvFmp7hV1JJ4+diHtrYf1rUVXKBYVlSvloD+FAq
 5RXUy7/3Wf6tW3zRfnRGfpK6/+rGScMXcd+AYmrfS3pM+2hwPTu+QlsWSxTLg4D5F5Oi2uSJ81k
 n1AUk219ZaamgRfJkmQ3U3ZEJ2LuzND/Vaz6NPT2pLoCopJ03URl1VoMMRmQdqzXChSvghFv
X-Proofpoint-ORIG-GUID: 1amkCZY0lMujfIp41XpOQKXTT1yfDsZV
X-Proofpoint-GUID: 1amkCZY0lMujfIp41XpOQKXTT1yfDsZV
X-Authority-Analysis: v=2.4 cv=A8BsP7WG c=1 sm=1 tr=0 ts=685e8bec cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=iYJyFzv8ufejENf4NzsA:9 a=QEXdDO2ut3YA:10 a=pMdvUiCErLUA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxlogscore=786 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270101

On 6/27/25 12:33 PM, Ling Xu wrote:
> Add GDSP0 and GDSP1 fastrpc compute-cb nodes for sa8775p SoC.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
