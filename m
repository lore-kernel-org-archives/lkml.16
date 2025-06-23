Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B17E2417F2
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 10:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750675234; cv=none; b=LQKqPhoNMDGUOxfDkxh3Yok2RTlaCoboa4kUhfEqdiPFdhyaCZJssRe8tmIlAKxzloOsDSPl9OPtqyHEyVu732ERFWn2fY0brxUfY7M71M+Aa+2F6JRN1uNt5cJMA1US/S8tOViClN7GNDr2EYD6TEHUfqz2xtXAEnBKmA6GzcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750675234; c=relaxed/simple;
	bh=S1enjDC9x+Nhhk/WYVu0T/B0BKxWkP8SDj/KiC7XoZw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W/Rq2mR+uSBloWqhUnjj6/3xpj6VDnZRrnoiFrbbosYNNI5LJFGVkoSUz+EikegWGVpcUB7y41vKtQehYzirM/n5Z4tJ3gevQ30NTv9CyZxM7bYtRHYNxiOqDXjKN6SYtjv2+48qU1ilsAdMJCZSBN7vcebdi3QIGDN/J8TUYDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Imre8swn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Imre8swn"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N9X8GM015282
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 10:40:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b897uDaIaCreG4v+8lbAuOWs1ae8x9oiX94nWUbXM7E=; b=Imre8swnv/9RNJxf
	LOqQgmz6cjfuXFVVwK7wNsP+IuRXoEcGMcVo8Zun8VbHUH4+LTU3w5WDxJlfpiDX
	T8177RLm0zJyTrkRadJBU1td68p7jXoRRQfLWyXsHNKaq4gujb13tSY9bTiILiPd
	OAErLJV4DkVqB13HY8vn3Nypx15oaPLrHwI6luKKVzgOFzXOg5q0ymUlvrT3mdDd
	3Dx3mPRm22CrQSBHiy9fa+O6MjFOfQmkwj09PVGIc4DoaNs33KEGjhNu6y7MHs2E
	wYnD7l62qIhv43UqynErTdXc+y8X2UW5LmIufHr2vwVqmAcdZZlgpXxrrLS2k/DS
	K8QRtQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47evc5hebg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 10:40:28 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d0a9d20c2eso108721085a.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 03:40:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750675203; x=1751280003;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b897uDaIaCreG4v+8lbAuOWs1ae8x9oiX94nWUbXM7E=;
        b=AlXuXBWS8oRbDIXQMCMlJ9MnIts4h6BMd+IgPpWFfDLAszl89a23MB5T7JdIqm65KQ
         HPWN1uSHqCl9MA3Rb+Sp1QOuJ/gXmBvtQwz9ZmHwH8k91Ut8q7bRvmg0dpKPXqAjM4aE
         nfJPwJJyJfi5hUyjB2GsNxQES+LMcPzM5HB8FeWCAYNQ/Rg8mi7O+Gdpo+gPDis/Dj+m
         xacc0UN9AKzFQQYy5QIDapjnY2jVjnLqCj38OlGOctwC6eRGcnyQTuKq440diuxGrpMl
         hQvZCOYhK/hMltl9zi5GQhpjboZ5zBx17Bu9fePTiLjfHGKTeZn/zFdC9Sw+vEfAwu2Q
         Mxxw==
X-Forwarded-Encrypted: i=1; AJvYcCW+ZWoOHwuW2b8ebdTicUqdRHK6RV4hbhS2rVJSybmoCE57Q0jB5THzam6hYuZZeUQXXpX/kOVgIXYjLfo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9nUafvBEwbJBfr8GfI915B8Aio2TVMMsnaqATZrK2UMZKhLZn
	/OoRWaOaTKpQY0CqJwAuemDeKIxjH5IGbMyXPSrIASW85kx9334ih9pgnO2djWQzukVW5Y8gvma
	6gfBqj/BrKjDJu0UbXYqLagVEGPu5EysG4nXYSF+xyRokH8ZcJdyIXqqcIfnyOLB2e6Q=
X-Gm-Gg: ASbGncsnywj19zOXeJ1Eat3hf60wWzN6n93KRm2tdta6jEW3wku1leOIPE2sz1uNTUm
	PNNXP8DIvMk4+dwhTEni5N/kseuaWk9iNVbfIodNuU15J7O958qt9/JVu+RVDMDP2APiRSdlwaD
	ZwJ/WceoQKlXLcPMUpnUx33iM+vwGe/NRI25R/693hjkCsJWHFHwzwYJeT0wnHfLq4PfPKtVfo8
	WKg5KVed+joxBpk6LWliLRDUgjhHdpc9uzzsdglzzxLB1Gx01KtjIrLkPPZE6KLS0377iVRndXp
	FgTmrIAR+T1UCewoQl4NB1HUkPWqY7Gj9MN3o1pjPjMdyZFNSnNqkrC6a318j/ZdrYStyvPpug1
	NqLs=
X-Received: by 2002:a05:620a:192a:b0:7c0:add8:1736 with SMTP id af79cd13be357-7d3f9952489mr622002585a.13.1750675203233;
        Mon, 23 Jun 2025 03:40:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtQAJnnfKFDS6GPSBOdzMDOqFNoCOeLhMyFw5pPwCYvVfetkYScS3ixGZVRWzJvTvaV87slw==
X-Received: by 2002:a05:620a:192a:b0:7c0:add8:1736 with SMTP id af79cd13be357-7d3f9952489mr622000685a.13.1750675202761;
        Mon, 23 Jun 2025 03:40:02 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0541bcec5sm694809466b.143.2025.06.23.03.40.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 03:40:02 -0700 (PDT)
Message-ID: <595e2c2c-8c85-45d7-bba1-5d7765e60e5a@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 12:39:59 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] ARM: dts: qcom: msm8960: add gsbi8 and its serial
 configuration
To: Antony Kurniawan Soemardi <linux@smankusors.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Max Shevchenko <wctrl@proton.me>,
        Rudraksha Gupta <guptarud@gmail.com>
References: <20250623-msm8960-sdcard-v2-0-340a5e8f7df0@smankusors.com>
 <20250623-msm8960-sdcard-v2-2-340a5e8f7df0@smankusors.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250623-msm8960-sdcard-v2-2-340a5e8f7df0@smankusors.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6ZijEhaBMPKgJyH9Y9h5tTTuoSruXbVk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA2NCBTYWx0ZWRfXw/Mi+IkjxqF2
 5Jv95iXWTSa41PxOSCGMefAk77EurrpiAON7JERsTH8O28C/v1rF1xqAAgjMMia/vqEaDjNt196
 KfB6DwikSWihNlS0db/MBjnAbNvmIx0wD1fAzInf8aotD4NT4r3ottI5IluqzhKcaSJf/Fxdwgo
 bYt4OEAlakpSP5kOVNQzn2DZ/6HXm1VSoEWNhOgPW2lRynBFiT5NiZbGPV3yDZ9YCP/DoqsgCRp
 Al4UwuPScieZZax27LFl0ZiD48EruCKge4l8G1mw5ckM1jjdzVNtQHEO7pG/b0mDkX91eRmCss6
 6DXNyiH6nJOE7VQh+v3aIGxx0vX43pCQ6IwMkoOZfNZsf/SG4vCt71TsppuenHiBgNYu9XmZEar
 9TvzvUXb590BQs8jga2eXFQWWkn3Iqp1TiKzBEaddLOttDF9JnNTt6rkrzutXBkSPuenYbUn
X-Authority-Analysis: v=2.4 cv=caHSrmDM c=1 sm=1 tr=0 ts=68592f1c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=wxLWbCv9AAAA:8 a=EUspDBNiAAAA:8
 a=v7w6ZsX0F0Nrasn4spMA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-ORIG-GUID: 6ZijEhaBMPKgJyH9Y9h5tTTuoSruXbVk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_03,2025-06-23_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=999 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506230064

On 6/22/25 8:26 PM, Antony Kurniawan Soemardi wrote:
> The LTE variant of the MSM8960 SoC has a gsbi8 node used for the
> serial console.
> 
> That's if the downstream kernel is to be believed, as Xperia SP has
> a serial console on gsbi8 even on the non-LTE variant.
> 
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
