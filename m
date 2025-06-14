Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F1813AA3E
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 18:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749926167; cv=none; b=InG8iuUL07cYesUnIWP9TtN1fbGnfIEX/1y4l9Ivef7K4Fo1kxXSXeN4POud4ONcJmF16aCRVQqmoP9YTeg+Lx86zpz/W0UyzTB8/AJuQhULdwQEA7bOog0dEgVQLpsfrq2etaAfKXNnjNhSvSIlbXGxAtF10ItZTJe4Bt6M/5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749926167; c=relaxed/simple;
	bh=9zhqtvH20PGTQFl/hJ3B+6N3YFln0ELk3qsUhL0t/JI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jNhigVmOfNwYbQRLpfwE+/+PO4wT4F/leAnNfjrIs3kVMg8THkM/ckClr/qVKyhLv/q5aXXbFQtVFZE/CoUd7y0cVwyqO0YE2KrAVk7jMMEUFdf947SwkJv7kXwmNOqfLkqjiWjQ1E86lCDPGYyj07G3NC3Cgq7n6/xAsnNBzAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LB9SfVIH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LB9SfVIH"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55EFTOY3008789
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 18:36:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fr3V+vnTlTkucnr/sMeFG9g9yGVUJcjlGidQWTV9CK4=; b=LB9SfVIHQjCfUJff
	ZXNcuH+jp9A8oVaghTkr/F7Hf9V11zJG2b/PBlIsKZD9J5W5Q4Cn14uriNm46/G9
	WRaXAUrlwDwLLd4ryuQKpgeC8Uoxq4KYO4WeKlL9ilYSPjYwSQ6wDG1vwS0XfFVD
	vwPlpLYdQgf9u8pGa2wvF9bWI/nuJIwul9OlMGthZbmsDwnFA9gkPprtVJcVjlvy
	0NIPOV+sf2x8Q33zQJ5cXmaWM0hlf0MS++oHKqo3r3eDXS/6dxfx8AsQ6T6LEpj1
	pb2xeZAG++Ofa4Yb0/VD0t8c3RSJoIroJ4/e+97G+ehse2unQsMWNW1XB7+udOET
	nMJ0fA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791en8vyr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 18:36:04 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d0976a24ceso98313985a.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 11:36:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749926163; x=1750530963;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fr3V+vnTlTkucnr/sMeFG9g9yGVUJcjlGidQWTV9CK4=;
        b=fIteTCu16z3ok7AMlIieeYUkoDy0YfiYgGWZnylMKxWSU4weOkzDyz6EL+15ZhP5es
         26ap0ivWvhwiwBqhQ57nfrKPhYcSaYtX1v+TK/w+8EmmG7ge/cmR9s3v0i6gfr1dKo6x
         9Joaif16QxLWAqAOT2xYpZAbFVlt/vn7Vp9ReY7v/OHKWL6l37Qe/hb96b2gVG7PdmVq
         z4TFaKCC7LYRm/2CvcC+kt9+fy9KFv87Q+S2c2jm/Nci1985g/toKBA15Kgi/pNQIwFX
         qj02cnGaOn7tjZwn7t1olhJIKz4KqyfkS7zw5gu2hmEYfYWeetqpoeQUUf9vRm16A8ZK
         noTw==
X-Forwarded-Encrypted: i=1; AJvYcCWmbpmY2BvPOMc9qzDgCwv1zMs+UB7I3ijSHN650dYx78T1bAekiCZlP3+lymdICV9ei5n+HUZYvx2VE2I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZwiIQBPlfhBhzOdaMP1YkjP56vXtDj0w7H8YZq3hG+EZ3VnY2
	Qu1M/iIdewy0JyJC1AtQ6Z7iF9JZC3E7sOz8SHkk9zx1j90eopelTAqh8Bgcedkhwx798v+/qSg
	A98LgK1WWBUjjTTFUMFHc0UdfJlNig9Zn1V7RbxwWlge40AHoT8ggV41DVs9d7L4T/ZU=
X-Gm-Gg: ASbGncsWXBwdPTpOpETwkzhNiGbrLlO8R5CQMHlDYJWkS95nUBzr8WHkRDKca07Q1ec
	Vdi4QotpjvNkEEcNyqlZPhEURHj/y40A3eE4eG4qzyAEJkl+QRzMTaWotSVmRz5DmVjLu2llRIe
	bn2he3dyN3rTwQL70QR/VMNp99OoDg8MRWQM3pW+i13vq5pjbtdrRsrhnZIvuB12MSLZENo5PFh
	OgZW/wY0L52I1XBCH6rVuB1sHVsBGr+PfUXaRTXg4ZM9eIh7ap+MXZp45E4J3ukUZNSg+hsvi+6
	ayhKUxueGwcR3+cb5sPjVbF2ZEWoyecpFEq/p3mjpYoT0oV42n2l0SqQBYC7gYivG0gvf9GnQe4
	6k6E=
X-Received: by 2002:a05:622a:316:b0:47a:ecc3:296c with SMTP id d75a77b69052e-4a73c394653mr23248811cf.0.1749926163467;
        Sat, 14 Jun 2025 11:36:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGB04Fgqt4Kek4mgzb5bvMAWqJLI+/i0iRXx7obd5FsMMu74P3dH5pzCOJqmQmFoouzm+D9ug==
X-Received: by 2002:a05:622a:316:b0:47a:ecc3:296c with SMTP id d75a77b69052e-4a73c394653mr23248681cf.0.1749926163112;
        Sat, 14 Jun 2025 11:36:03 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec88fe531sm346355766b.108.2025.06.14.11.36.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Jun 2025 11:36:02 -0700 (PDT)
Message-ID: <f1284637-7650-498a-b850-b5140c47e4e0@oss.qualcomm.com>
Date: Sat, 14 Jun 2025 20:36:00 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] ARM: dts: qcom: add device tree for Sony Xperia SP
To: Antony Kurniawan Soemardi <linux@smankusors.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Max Shevchenko <wctrl@proton.me>,
        Rudraksha Gupta <guptarud@gmail.com>
References: <20250614-msm8960-sdcard-v1-0-ccce629428b6@smankusors.com>
 <20250614-msm8960-sdcard-v1-5-ccce629428b6@smankusors.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250614-msm8960-sdcard-v1-5-ccce629428b6@smankusors.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: bM1xugpEyzkPBwFVtcmZvo1T7v1f3Ukg
X-Authority-Analysis: v=2.4 cv=D6RHKuRj c=1 sm=1 tr=0 ts=684dc114 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=wxLWbCv9AAAA:8 a=BdDXOLcz4J6SvvgUVR8A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-GUID: bM1xugpEyzkPBwFVtcmZvo1T7v1f3Ukg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE0MDE1NiBTYWx0ZWRfXyhQyy4/zOEKQ
 S8zRyOiC9CIO3jr/TSCUMIXoKrFIQDcMRo8SdU5plGKhJJ7nzpoEzr9By6rVvRI+MyB77K4oCkB
 qIHDBnBCS2CVsThqcsXcT/9wnGlI57IStIMILkp2p0cqzE75wBQpxtPr9l+nEfS+woDLfyB8kld
 IuJRlo4doBbKJHVBLy5bezS01QnNWo6VNbrAtP701yzbVBHOmZPuAslWEh/yAtjvReJ6NWm4eXG
 zAq1CVo0JOvTEFgy4f60IsTias0K6dduOjoITZDoeY7NaFMgAuTJByEiEJoGDDo7DwrZX1sW29v
 YYntIUluwUbT4of+m27lCJ1Iq3miZaHL5ASABSRgob/d6vzOG7bSehx1SKDwBZJynaI06Z32nIW
 mAaQAPw/wEzCyhHNl6pXSe6KinIMP/p7v3KX+dozMbdbnt+Lrt1KkrTgRnU4eRjGYh4ploAM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-14_07,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 suspectscore=0 mlxlogscore=999 clxscore=1015 mlxscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506140156

On 6/13/25 7:51 PM, Antony Kurniawan Soemardi wrote:
> Add initial device tree support for the Sony Xperia SP (codename:
> sony-huashan), a smartphone based on the Qualcomm MSM8960T SoC.
> 
> There are two variants of the Xperia SP, one without LTE and one with
> LTE. This device tree should work for both variants, though it has only
> been tested on the non-LTE variant.

IIUC (and that's a 10yo range memory), SP had some eyebrow-rising boot
flow (some partitions were non-standard?) - could you please add a
paragraph about it in the commit message if that's the case, and maybe
include a short how-to on booting the thing?

> 
> The following are currently supported:
> - Serial console support via gsbi8
> - GPIO keys for volume up/down buttons
> - PM8921 keypad with camera focus/capture keys
> - eMMC (sdcc1) and micro SD card (sdcc3) support
> - USB OTG support
> 
> Other hardware features are not yet implemented.
> 
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---

As for the code.. I don't really have comments other than please
keep a \n before 'status', other things seem rather in order.. If
the dt checker doesn't complain, I don't see any logical wrongs

Konrad
