Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF9B19CC0E
	for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 11:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748084468; cv=none; b=pnr/EOSBrtsH7W7Uh7AJIXNTkLYNecmIqEmJGxyExydG9YsTx3CSo0No1KUh8rSlwC2i4HwsAgmXU7j0X/x88v3XPPmUxIC0blGwpW6i1beGEyW3ibYEGHnkaWnGZZ/U3Whpht9rp2dIq3Q2glXeIm0rdyM964txJ84seVINOEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748084468; c=relaxed/simple;
	bh=uBT8QXnAoYnSly3TgloEh2i3dSX3runD8Ha/A6cIC/A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BfHRvRWfg+UCMP+nahRarmmS8dw6QczSDHSzSTv8xPrvDbPSCu78pBx/1OBUxEKx3AInV8ZhHOk0mA8zvfTDHzy0SPrRrM6FyUqoZ20qp2lYhtpqlRYdWa8Zvz/roGYl5s+zN6fmIy2HaCuWlKk1+fluI3/xP6gPn8m0Fvf0uyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N/Fcyp/N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N/Fcyp/N"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54O4e05H009887
	for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 11:01:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uBT8QXnAoYnSly3TgloEh2i3dSX3runD8Ha/A6cIC/A=; b=N/Fcyp/NC9GTtEYW
	yK/AFO3BxuesYqSkqbvhSRXAQHcjASZ+zoyYOVp7tHxa34C50CgY6Hdcf2ZjWbBd
	Gfobap/24NjIDUqQx5mPuGK3LTTXaZGqr2B2XhLCJkv4K75ydgUXki92AKmmnmOd
	SZN3ddUrZMwTxQC0O3pwC1OVTQNhDkcHLMGR2N1sGPriALxZuY1mYWnMx/96ZMYr
	Z/DQHuK72Z85lcM4u7osURHktBPnckx9ysb+L8KfqqaURKWyUOy+bvJiPvzYZUN5
	1D4mkEzlJ5phJzkKdetVT1sC+J+jVTOZHpbeZM4OqZNtFODtUjfuBOjbWECP9RQn
	YRLkEA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u79p0fnr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 11:01:06 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7ceec331273so23242685a.3
        for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 04:01:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748084464; x=1748689264;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uBT8QXnAoYnSly3TgloEh2i3dSX3runD8Ha/A6cIC/A=;
        b=XMnE8gU+J3uO/0/5/siffYYp8rjym3XNyH5JLE7ZDQnT7+2DzCsFtHpkN+qBRs1sCW
         593vd5ijaQRCpHWsAP3Ae7uPkLcPozxWIYaxAswqShmo3CC68AGMZwZQ23H/UhCInbbP
         qeIyVWPnq5AFBPh8PUPJCdfL87TKQiTmY/xqT8oCfZ/AD/FAug/BCEBfQEf06yrtTNxb
         SE4+ZcT+e6pVDD2fBUV5JFXowYbWoEl6HiT1U7BxQ+e0cZF3fCuBLEf2GuddSYzizS9v
         3dEe4JFZdS8elazN0HBsOYKu7toPTFoZHouKCKh3kTzg3KdnDKTkJ2FOKWEov348AKom
         dXBA==
X-Forwarded-Encrypted: i=1; AJvYcCUIqHNYcC/R4CAWc5XgNYGhTosQLznUrzkhJ57HGauO5lzny0Ymj/xVenwMlMDUyP3PmYri5VPRO5n9Dao=@vger.kernel.org
X-Gm-Message-State: AOJu0YyE1ZNe0R/7nGGFJqO+ervHg1EsypOkAKKeYUvPQoDxG68scMe+
	RWx2BC0KrVI59qqGi6avyuwotCg65uT50zGVlWuCxmC5/tVj8ZurSHGTCt3eLKHnQwZZaAETX1o
	u2qeyyhRO7OUTKaXGW1Amjdiw0NDDjpnI/5yNT0oXb1FxpJRJ7xzns0GcCYV94DknIHQ=
X-Gm-Gg: ASbGncuNDt4wEI8BgZl8LWgXlA3a6ZmuylH/5bAgMNjvH7PaekmMDbBYCPlQgeBic64
	DxMJRgNCEOlmqjjGRsQnb37Oehob25DVm12xNaVHSMeGH6TIAoRvM5p9sniFu+wFR9R+b3yVd9z
	F/5b0Py0DFUr35ucOPiuQXAsiU/G2cYBbDId/q2fKmxH8i7OEZBrMHvF6CIWeyi+m1JMdkh8WQ2
	WYJM+fCjlxj1E5jLsqkOLgwxhL/kiPsVvkX+SNrWxCC9HOE2B+CihspwJLRBhznEkLx2k+pepYX
	+wj1uU8+2MeFz7FvPXhonAFM6jbRbNY9emaQ3x1D+9Ga7xWwKGCwk3AfOI+1HMjJ2w==
X-Received: by 2002:a05:6214:2a4e:b0:6e6:9c39:ae44 with SMTP id 6a1803df08f44-6fa9d396e18mr13300366d6.10.1748084464351;
        Sat, 24 May 2025 04:01:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFt3zT9ObE4H3laeqssPI6a1m8vVV+uGCihBhTUhjMgPqOlKiS/ZHkjAau8uvxRtp/e5FS/WQ==
X-Received: by 2002:a05:6214:2a4e:b0:6e6:9c39:ae44 with SMTP id 6a1803df08f44-6fa9d396e18mr13300066d6.10.1748084463739;
        Sat, 24 May 2025 04:01:03 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d438086sm1369934466b.89.2025.05.24.04.01.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 May 2025 04:01:03 -0700 (PDT)
Message-ID: <bbfc2598-6820-4d0f-ac09-406933771365@oss.qualcomm.com>
Date: Sat, 24 May 2025 13:00:58 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] arm64: dts: qcom: x1p42100: Add Lenovo ThinkBook
 16 G7 QOY
To: Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20250524-tb16-dt-v3-0-17e26d935e73@oldschoolsolutions.biz>
 <20250524-tb16-dt-v3-5-17e26d935e73@oldschoolsolutions.biz>
 <6iuro54yed6tqfej6l2l2ky7dletbs73nwjnfufbuulkw3kl46@okoj2v3wvck3>
 <342fadba-978a-4aa6-a393-22221715a5cf@oldschoolsolutions.biz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <342fadba-978a-4aa6-a393-22221715a5cf@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: RD8Am58tmavcd4EMgo51jpoCb854OAfA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI0MDEwMCBTYWx0ZWRfX7BCkIki4YUzl
 3/enNlQ4NGuWcne979Md6aYhZbvM0GTyK2XGwGlFtyzRB2rhYzRTxa3zRGoqvK28w0lnH8SDb6r
 QPf4u9UO6z78TqxHerznjMJTZY1SK3aQ73tyfndBcSloWGMX0Hh0LJumjHMFMYRSBBwcyc3iesc
 PD6ZNOqA6svs2SuqTYJ6f8LYdcyj2+11wK5eXK03VnVreHmMCkvA2y31HAmoldFEvJYM9wPcTzc
 DRVrl1UWaCUbCX80ISuo1igDpGWQE6AB6/8aYjwranbEpUGApOXWiIc3dTY1GiP1SeUkv/eYcdu
 kBC0RTRVFmJCsZ+Cqm+avw5gJA+5J5WQ/6USGvocdM9UZ+k2qyWRY3VxyUf+syJbDI2fdNvigf2
 H6UWUEgEw+usCLVyqZqbjQnPuz1kAbIzGVtIUAw74KKIIJysWRq/o3CnGHxSoAfPNccKrGZK
X-Authority-Analysis: v=2.4 cv=HNnDFptv c=1 sm=1 tr=0 ts=6831a6f2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=Rz0-UGbwDQDUX_AfhhUA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: RD8Am58tmavcd4EMgo51jpoCb854OAfA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-24_05,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=816 phishscore=0 mlxscore=0 spamscore=0
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505240100

On 5/24/25 12:36 PM, Jens Glathe wrote:
> Am 24.05.25 um 12:11 schrieb Dmitry Baryshkov:
>> This will break without the next patch. They need to be squashet into a
>> single patch.
>>
> Changing the order wouldn't suffice?

It would, but that would then mean you're introducing dead (i.e. not
compiled) code in one of the patches

Konrad
