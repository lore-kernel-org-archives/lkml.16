Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE2921ABDD
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 19:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750276256; cv=none; b=g4Av+dLjWhY9vqocmumiC2bjsAeNJW3a58tr2H8MGPX95QBpiymhU3igMIXG0GJO1CcyzrwWKwW1cCFLTEuCBsFoGhgxqo1K4GsV7F1mNttuGjj3PmKJykuiGnhN4ywF/pOMi2K/ej1v7I9uQkvWD4YlC7UbtQzDY7IN5NiTkEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750276256; c=relaxed/simple;
	bh=Abe84Q55V8uLaOGPFRiyP7NZWpfQt9lsxHaIzy2vJKE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HCAtNemGT4nbCcaN/nLIKbkf5sO5noP7vQgh72gt0AAImK0M+W2dQzmrA37UxiyTgH+T1a5TcvPA7L0dhAhEsExUZYJ9pZ6g5X+7OVZS0/MhPsYDgjoJ0NzC6jifecaVSD3ULc+mygQ7dcb6cszc8AnrQYmI1dav98H55I5km7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XnM2iGOb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XnM2iGOb"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55IJ3BE3027539
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 19:50:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FOzsOSYkCLW2ggvd0CZgtgGnw4BaefQGhIvMT/TEkjU=; b=XnM2iGObMqoEo6lf
	g2scR+b50htBei+ddhijz7lFpT6jkC+CUE9B8IXrQbeuRwAphjqxH4gyAzl36zGg
	EAXjXw8FnlhtfQzmXSoWBzc81DDcaiqBVYKs8qMwUCxRrMqxAweXcq+sm50ESf9a
	Su8mBE6j99asU3sNrJfLizPOqrstkfar1EqGiludaRf4yY9d1b4KQunRbfW867qY
	AQi5kkjx4Mo5EXhKRbevfj3jIroX9JknaAQS5bfQnsPadSdegb311jv401rYl1Gj
	XlMvCgq3IV7366lqZy2VYC6qOnWdCem0hX6XMnpoLK3cxzegaOrr/UxxL42IY1C1
	A2QL+g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791hd5jqe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 19:50:53 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d09b74dc4bso985285a.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 12:50:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750276252; x=1750881052;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FOzsOSYkCLW2ggvd0CZgtgGnw4BaefQGhIvMT/TEkjU=;
        b=HzLBPIDJUPlehhQEYRWvIQN7oZk7+iBFOYkBMv0yZTVasHSLIJHBRq6GjYchQAjsYI
         v6+wel6K4CGxbfaPUHTHLt38AJh71+KNbh6AoCJ5gxYWuCepfBXvsKNCnUEauXZFTeQ9
         59GSrQsa+YplYa5CBiMANgqQOtfSTn3HzZ2sEBp1utZUhw1OaBbdAYDahX+qJ7pRr4fY
         UhJWExCWnWLOq0ie9UzJn5qqwZ1Y4adbF1CE4Zylo3HVUNfID3Pe+l5U6J/u11HiVz6k
         2sM0epvkBhkuJ1ZXZy8CANGtJOvTxajE7AbRyS/h0vzAEeBZJ45wQRR7fyiZ43AEN3gJ
         f/+A==
X-Forwarded-Encrypted: i=1; AJvYcCUQ2G9bTTolBOFttqX1BbPu78YbWuIAe2ZWngh6mgFtoKXwV7pIL5uqcRMKgxkjKTchj18cNRBKdK2HE3M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw84TBCK1wc/KQHC7JwFgOOr/3JUlGRtDLh4eRN44oSyEHpVyso
	1WlSlNYCR2/H9jEyCf3e8jkgt+xepihtgQOrl8cntvm8xaRYjCcGR7RPl85TChOMmPPuikJ/vq+
	NsbARqZQuxXrzUFdjeXLyZ0nP8q4JmNAsnHV8y8zUycJt5BgP88n584f726Sc4aZ37lI=
X-Gm-Gg: ASbGncsVM1otn0BQ9mMX2ylHfLAu8NOzp0yxTTOTf1J0BM8jvnXLAGWTT+N7l2khANW
	O3cdCe5BiYlJdhk9+HNXAlVOF0uK9wIKqJLlGNsnvLWqp/34J410GxOttVsMe1lbnc70zTah58a
	WfI+weyaFjj5k1eU4iHnHuniwrz28LgG8uyVouCK8gYGgp72e4oD6q41XRzFMHAEp8XXxAVs7sm
	UdEJQntIzkn+RcescLOqGSU/bBMi2lWuXg1Aid80xQGy9hJf3vWCtaad2CvU/xPc/nLZrpzwuac
	NA/rcDmvmYcu97TEEuJMY+DKb+NODmmJSrjcJnz0Rj7hmc10xXBkECnoHx3RrV7a9vH/xwrk3la
	zW30=
X-Received: by 2002:a05:620a:4307:b0:7c0:c024:d5 with SMTP id af79cd13be357-7d3f1b5439cmr37309185a.8.1750276252372;
        Wed, 18 Jun 2025 12:50:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKmaXk+Vmkvjg46kiwK/r2FLExfJoQV8V595azEx4ecLa7oANL+iNpPolnQOfeL6VLJxOtmQ==
X-Received: by 2002:a05:620a:4307:b0:7c0:c024:d5 with SMTP id af79cd13be357-7d3f1b5439cmr37308185a.8.1750276251956;
        Wed, 18 Jun 2025 12:50:51 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adf8b393ea8sm966523166b.159.2025.06.18.12.50.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 12:50:51 -0700 (PDT)
Message-ID: <f4ee6c98-3071-4121-bd6b-a41959f7f5ef@oss.qualcomm.com>
Date: Wed, 18 Jun 2025 21:50:49 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sar2130p: use defines for DSI PHY
 clocks
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250618-sar2130p-fix-mdss-v1-0-78c2fb9e9fba@oss.qualcomm.com>
 <20250618-sar2130p-fix-mdss-v1-3-78c2fb9e9fba@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250618-sar2130p-fix-mdss-v1-3-78c2fb9e9fba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDE2OCBTYWx0ZWRfX2yObj9VNYxHp
 jJFq9yA9eDxQyxzpGmhMY5uDVRpmhS0ZhxYGC0/xeYKb9mNY9/J7ded+FylkyiP4Sx+rLFHODo9
 vAiSZ5RlTdp76bIrKpNU3hiT47nQQRGavBmzu6q+FiiOIMeZlqC7HgoZa0lm/mXP313LB+I1kIj
 cdBH77SJNGGWnNymlxhUnzBIZ1JV/JjtPpBRlq9cS+Dh6Pe8A9PAicMruHDARbjWJauD7Td7EqI
 lHn9i00VkVX/5tCHoQEu3Xn7cSLqXjGF1cIEdv+bpdgXU7UI6SdUsLR/iblcxVLXPgxnjtNAHV6
 eTSjWqCDGlB+eWmnOurUGdj5Qcrh1dlnaBaYvCUkvMHEonYRwLW+wkIXrMnBcF16hX/jADVF6FU
 tpp4UUOFwfkCCuT5pYIcFXLx+9r5jBGIHfEeeULadS9vMuW78EfqNJlgubUKaBdKlybvGIpI
X-Authority-Analysis: v=2.4 cv=PtaTbxM3 c=1 sm=1 tr=0 ts=6853189d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=FoSyCDDHJe3iGoLm4rcA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: rZhI-l058t6Ft8uKymFdwlii7PQZ3KjE
X-Proofpoint-GUID: rZhI-l058t6Ft8uKymFdwlii7PQZ3KjE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_05,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 mlxlogscore=487 suspectscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506180168

On 6/18/25 7:49 PM, Dmitry Baryshkov wrote:
> Use defined IDs to reference DSI PHY clocks instead of using raw
> numbers.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
