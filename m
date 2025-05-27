Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722852475E3
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 10:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748342480; cv=none; b=qx/F2y/KRNBuZ5lbsc2sVu9ciHb5ZiAUgOsZFsoqb0bNUIMSeIM8quaSodFStKgPgCWtSR4XX5KFxph1OmaxHrOzyN6Tys0UAIbkNs02Mj0JhzPMQs6fDSBNuSwSHVg1seFOpHv0wtsaehcbqifjS+XErTIOCuyQxe3v2rgdY7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748342480; c=relaxed/simple;
	bh=KnXhIRyJ/2uqiCfiU+IePoK2w+gLCO+RzIIb2h23UaE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ojr5FBHuLEAdYfBSE1udCTDPcHg0Be8qBzfTH+LcRx1I69gTGLAzjYtJeLFBBmD5QfhHaBF0jpUdyQ5JmqZf18P4ZyMygBFZb0Nvh8noQOLp5Y4EYxqEPRTCQfEZamKUYye9C81ZFwZAZV8OgHuVWjyj7+kLf41rKy11xwWlGQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AXpRh3/4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AXpRh3/4"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54R9Ym40002117
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 10:41:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IbMfH1NRfto0PmBDvRua48GNHdAcU7IFtOBh4J0uTQU=; b=AXpRh3/4HbZS2A9T
	a5HCKQ8rwcxHtjz5OqC2Ym/+l7bsC2HoSv7FWivR6URK86PVbu3B81T7eCC87TNx
	Y0O2igJGr7TTW/iTsMEL8ZZ2S+ikC2iMnWlP969SbfBIT76hbFDLoBTyo3I5xild
	X41Sc1D9cFw78tgaVfH4bQzYk+/mOyGTIHRNgctvT1gLbai/JOekKtec77MfLEbv
	0GLbkrLGrqp45tdvqmF4MbdUOm4ItxG8155P9XwlLZS5dlXTlf5ukeDCmsX9W9Yr
	hdImQIj66wXHgy+mcaFNA1J7qHLfljRgCzPx6q51ggV9RIcdO59bMV6jBff77O9N
	2P7VrA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46wavkr6bq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 10:41:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5466ca3e9so43833185a.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 03:41:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748342477; x=1748947277;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IbMfH1NRfto0PmBDvRua48GNHdAcU7IFtOBh4J0uTQU=;
        b=YeFDN4kq673LUfmeQHRUUTHibHF+IgrD59NIdjewTxNtGN5N4Oq3YRlRSaHoa0VWQ9
         QjFGvTjgD6SMGjElXPytOd5LdryIxlnkb+Fwfi3vS//c1WTgo/helRABV8Xx+9zyrgig
         gbUISLM6OMlX4XQhxzp48xWXwCcEP/3GUxtfILpyn8wXvpeGmQXoea30sidw/zvxMluj
         yllMOq4+LSPHoFClKjr5ND26jV1cA7toUpXrTOYH18qVBVeDp0nKZjLD0gY7aUKjfFqv
         iqfwwWWlV8IrQpoELF5LlfbNK/X9e+tCs4l4f9fIDrgVUAhoG8uwjv0hbAFjqDiRMq8t
         0jxA==
X-Forwarded-Encrypted: i=1; AJvYcCV/czbzS8CGDTIMdDNXHu5DdhBZjc2rj0sQiwreig4o5BEo90i/Uo8PMFFV2fZ9BuDm/+fXyUSoVbt/FrA=@vger.kernel.org
X-Gm-Message-State: AOJu0YywfN3eMfq8XNWiiPt8wvtL95ud5rozxTYCqQbkzepL1P1RoWR+
	5+fCEmbejONOTUX/ULePg91cN4a/JFYbtO1KR8taU1ukRcjp6BNyoT0mhGnmgRwiZBE7yLoA3ir
	CZEyg48PuOfxpcH6lzKCwaIxwjJKVNgIXXX1QUJ6eg3g71nntEzDol+PET1Js1lQScK0=
X-Gm-Gg: ASbGncvJD1mf1bbSDh50035XLk6NuWVJ4rvetquiHM+bbx8JzCgprn5850ESrM5eJ7A
	Ix7y0RbSGsaWHuMnd8YJhc984X9N4GWUABGWc+2sZRVL++xzs9ZU1sgJ2n6SoMmmGtaeQ/NLWRr
	WQPBkCrVrYxv/RSS7jrHGlitik0K1+91B/K7xkDXF+7ZGiD6zJwcoCBtD3j+AwufN6LBsl31ue2
	rEblMXdlBbIYrAxoqF/uHXke6RMh2PwDXLn98QLZbbff4n1wqNurwFDSSNUJqZ3SyCYXQeTFFwT
	jOELRT5aiA5X2j2RWDhZswhwXr1gCRF9txwe5B0xXx6EHje8/lqicu2pPXsr1mJJkQ==
X-Received: by 2002:ad4:5c65:0:b0:6fa:b954:2c35 with SMTP id 6a1803df08f44-6fab9542d12mr1902626d6.10.1748342477267;
        Tue, 27 May 2025 03:41:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUyu7qIzk1cV+C4eIOT70R61sE1Mb2oEqRCMc7Lanra/6DIQ72qJaNM4f6++9e/iPl8v+geA==
X-Received: by 2002:ad4:5c65:0:b0:6fa:b954:2c35 with SMTP id 6a1803df08f44-6fab9542d12mr1902496d6.10.1748342476910;
        Tue, 27 May 2025 03:41:16 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d04af1esm1813993666b.20.2025.05.27.03.41.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 03:41:16 -0700 (PDT)
Message-ID: <1fef810c-47fe-4f6d-95bc-0d72dbd63bf0@oss.qualcomm.com>
Date: Tue, 27 May 2025 12:41:14 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcs615: disable the CTI device of the
 camera block
To: Jie Gan <quic_jiegan@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao <quic_jinlmao@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250527015224.7343-1-jie.gan@oss.qualcomm.com>
 <5fbb515a-c3d0-4bbe-a689-41e730ecd952@oss.qualcomm.com>
 <9a156925-cf7b-4d2e-88a8-fdfed5528553@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <9a156925-cf7b-4d2e-88a8-fdfed5528553@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: dHhqpnV_pFzqvYzK6AgT7-LCMekQWCHY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDA4NyBTYWx0ZWRfX/FZ8Gm1DHGp7
 //vKeeh5fc8P8dBveAYC3yTm/p0lY0E/vvP8+wOBb+SYVyJVT+dU9lIn+4jtnnT9/cgiUYYQGpn
 3obxzePtvfc3Cs5QHs3Ya8nWczecw9IgYAyyqghG87rKeXZZWJb5Nj4+7j6tQyn5vjSMoLqChT1
 xdgnrnFBM2vjMvpewbB+037J6yWiMxmb6/FJpz4HQLBL0f4KfhpywoLmxcKManzDmgDviYr+ixx
 j/bJJPV9PYy3yjuj47AYfDPyhsobokhzqO3nNPBHHvgH82+tVg/c8nC0vvlUU29r8kJrCatFrlY
 qxNMsm5T5QxEoC1/hpgwbkuYZFdKzOsQSJG2sKdFC3g5F1Zx0YLTjGn/nESSsFdgTslGrNw2FgP
 zXCXDvExo+DMpL/cfm7LpfdnZFjCQnl+0L8yygCh3tqC+3AvIBiknzdujuOn8AoWseCkpL16
X-Authority-Analysis: v=2.4 cv=fMk53Yae c=1 sm=1 tr=0 ts=683596ce cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=P-IC7800AAAA:8 a=shqGv10mcsBHR8c22w8A:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: dHhqpnV_pFzqvYzK6AgT7-LCMekQWCHY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_05,2025-05-26_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=748 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270087

On 5/27/25 12:32 PM, Jie Gan wrote:
> 
> 
> On 5/27/2025 6:23 PM, Konrad Dybcio wrote:
>> On 5/27/25 3:52 AM, Jie Gan wrote:
>>> Disable the CTI device of the camera block to prevent potential NoC errors
>>> during AMBA bus device matching.
>>>
>>> The clocks for the Qualcomm Debug Subsystem (QDSS) are managed by aoss_qmp
>>> through a mailbox. However, the camera block resides outside the AP domain,
>>> meaning its QDSS clock cannot be controlled via aoss_qmp.
>>
>> Which clock drives it then?
> 
> It's qcom,aoss-qmp.
> 
> clk_prepare->qmp_qdss_clk_prepare
> https://elixir.bootlin.com/linux/v6.15-rc7/source/drivers/soc/qcom/qcom_aoss.c#L280

I'm confused about this part:

> However, the camera block resides outside the AP domain,
> meaning its QDSS clock cannot be controlled via aoss_qmp.

Do we need to poke the QMP of another DRV?

Konrad
