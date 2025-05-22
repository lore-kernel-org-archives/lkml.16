Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C69D28C2B6
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 15:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747926326; cv=none; b=SJh3UBXmYx/5tWkKCKhBtwb3xwOWqGKopbRKWyHYStBqTNXblm6VUlsxT26UxJ2sLd1RzaPOrDp8KEPX8HU2cp0WDbWfsotTG7+jjPbpbdIvjppyMo72HOff2E3SKsXu/8UfU3XYcvh1TAxId12xvpi0xiNmu60+DgDAt6fRSKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747926326; c=relaxed/simple;
	bh=h1MN7X84z+I0Z9lmQjsQT6TsWHF9Kda5k56edkB+wTc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cds1GQhavDQkKnBrVBX2AtmcZ8CkEMUvbbFgsoFX0O0oGz7mOU0vwjr6lCzCe5TuIR7lytgfC+ZgdneagH3rkTt+m9OIYeS46d6CiIIEhZisDuazAwQjND3YdFrEQ0fVIvp6uGcyWVcNi4ULNvw7gWIif1ygPkxtA0MrtlgJ1XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cNhPhkN2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cNhPhkN2"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M7SpDs006789
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 15:05:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h0FXMVGYcKvYPtW8IpaaJtCZ0Z+caHLuXoWIxuTjPfU=; b=cNhPhkN28djh6A3s
	hev+vBrs334t5fbREWPLgmtRExWNf1sSkj/TZ2uFx2ERyRla9w40aYzKmkOkpx4H
	LKBJv4Cz4sd6lk3uqZGIWlkav+bP0wny1GdeMe+OIueSLZBgjzxANBnv5pap1Dn+
	ispo85ejqCgJUv781eBkXy8dSwL5qiiJIyifPmEN8gQ/dlBVyU1pe0l3172lcRdt
	wglbwf1/pxRjB4V9nMo80vtxcY+NvT1G4B8URTJrP007TOw9g+2w0p7B81VVJtr9
	36ZLXiqWu+ufyouz2O5wlhOkjzbyZ6AhIutZGK8luAb0GlNEvfRSed9UQJjNm7DG
	h8IoNw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf0pvbp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 15:05:23 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c555d4ad75so58055185a.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 08:05:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747926322; x=1748531122;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h0FXMVGYcKvYPtW8IpaaJtCZ0Z+caHLuXoWIxuTjPfU=;
        b=eh06KBmqGrw/Lq0nzm/QCbJfDL7uBU53/oxuRcDS6VRjJ0PpRVgjt8JntPdZxS+hNa
         qpWSEX/6RTN8NsJ91XlAmXkk7x1u92tx3ZnDYHXKQOnrQb0Rn0AgVxvJPkQYYZXjt96b
         ZHlfMoEPBgL3G0vjuZiDNlQ0AEXSXV1DKoKplb8AoK9l7+OsJqLGDSZGWCfRCArYWY2N
         2qI9k81P4aiRtCMcg75dJOMBVff/HDEv7y0D76rWGxJXUe2vsexg9jCD2WjJGA0uo98+
         cywBODaJzxNLPkRu1qvIBsCE8mR0CJmU7mmDRDTl/iJqBfVfBtr8K0waIHPQiPPBeJ1a
         iZ6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXFXV1RrJaDFspyoDHZS2grdUGU4JFJ01KallgS5tkszq4FTl6TObFM75H7U2rOAO7J5ueFIA1QN9IyUyk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyA2/iUc3xW7xSRzM4EQaj6VjpdAvXTXz2eRN0X+fHopoOyqVTt
	2jx0k6m+82D3K6jrwbjx9QuQYbT4eJ8+n4FrNDZcSTszwdYx3VGtfgfjxSD6Go4XR2qOkXmMNph
	4iw5QTVYLjG+bfdCcQK6dBa1qa/XP7LItG2SKeinltjXRS4Fc9w43vqsp13BDJ2CD+lY=
X-Gm-Gg: ASbGnctp7bRDXq3FH1aEbbVzv5ESA0/RO6wlNPSskLMc+JN2EdFkxJPZSvoV70/YVbQ
	gjvVuetw9V8WwpDKZ2t2vPidVqymi0tGhXurVZZ6aM52yx1B6gl19tQDyq5VRhMA/aMhn6ZPggf
	AzWT6oKmPnXUAdjXLSBMVhL0ad0HxgWPsnEYfDFoFtZV19DXxyO9kDbVQ7umRi8wxx92QEguyo0
	t8+HWxxxkfsNdAN+TFy7imqliYsIqI2nbSMnd+rCsxwNZ/yug3zEsy6R32J0eVFBneSIIDgj3+l
	CNAhnzUDqo4QFPauSnSuDvfYVMfnf5NJe0X25zc20nxTmlCYXlj0akI/OFM1D265lA==
X-Received: by 2002:a05:620a:6011:b0:7c7:a574:c0ac with SMTP id af79cd13be357-7cd467068d8mr1686219385a.3.1747926322076;
        Thu, 22 May 2025 08:05:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3db3rmTOKk1hXtFyyRXL3VA6Tyc42dGPU3KuPwTslgSfcNhG3bQxN2FLIoLZavERqIUis6w==
X-Received: by 2002:a05:620a:6011:b0:7c7:a574:c0ac with SMTP id af79cd13be357-7cd467068d8mr1686217385a.3.1747926321731;
        Thu, 22 May 2025 08:05:21 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad5b29fc7d0sm296353766b.94.2025.05.22.08.05.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 08:05:21 -0700 (PDT)
Message-ID: <53e1127d-77fb-4bb7-a125-18d7afc0d843@oss.qualcomm.com>
Date: Thu, 22 May 2025 17:05:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8650: Add support for Oneplus Pad
 Pro (caihong)
To: Pengyu Luo <mitltlatltl@gmail.com>, konrad.dybcio@oss.qualcomm.com
Cc: andersson@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
        konradybcio@kernel.org, krzk+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh@kernel.org
References: <e4d65994-89dd-4068-a8db-050e698f9bb3@oss.qualcomm.com>
 <20250521083746.666228-1-mitltlatltl@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250521083746.666228-1-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: sH2f-139YA5sDf683BJLXL-cfiV1Bf-f
X-Authority-Analysis: v=2.4 cv=J/Sq7BnS c=1 sm=1 tr=0 ts=682f3d33 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=vD8jgx0PVHbVM3FOW20A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: sH2f-139YA5sDf683BJLXL-cfiV1Bf-f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE1MyBTYWx0ZWRfX8YsfQbcZVia7
 IYrkzASntdHaIRfmhDSLk1qQhLFVVWr1aLoV9YHpFpTblPoXmFUJ+Nq/i/pjsqgzwNdZJ4y+gco
 Q2d3MaULrhn8F7dhcphCZNXJGk4SqXA5VLLzhGZzjXZhIFfJRWm2WXN9I9w7pKfM99cqUFUmIXL
 3FQ6D9XDcC3u3NUoIKjo5kMAQ64jSCV9NOYxP4ksOxUoy65bMjGlGAE8MN23syz0Rl4v9E1G0NW
 MHwGMEbzf9Dov2gHCl7uNzhutaDL9WwSZ0eoCZGtgatrZW8Skz6Ef9XY9LT3DC/aSS+kDBNbofM
 xyqevZk9LUo8s+8aA5tCWZVWO5h/K0YRjmSYkSsaxVVp9iZkLZGYFfLXRrfqFZSZG4BmY/9+qAX
 OTPlV1TvGkvunkUA5toJH7YxT40lAhJZWE6f3s2O6PiaYBaH14wveuJfbSc8sZ7w8NDoAfij
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_07,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 mlxlogscore=999 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220153

On 5/21/25 10:37 AM, Pengyu Luo wrote:
> On Wed, May 21, 2025 at 5:54 AM Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
>> On 5/20/25 6:42 PM, Pengyu Luo wrote:
>>> The OnePlus Pad Pro is an Android tablet based on the Qualcomm SM8650
>>> platform. Its device codename is "caihong". This patch adds an initial
>>> devicetree for basic functionality.

[...]

>>> +&i2c2 {
>>> +     status = "okay";
>>> +
>>> +     /* secondary kinetic,ktz8866@11 */
>>
>> You can describe it, the driver sets some nonzero default brightness
>>
> 
> But the backlight framework won't index them, which causes sysfs
> collision when the second instance is registering.

Have you talked to the backlight maintainers? This shouldn't be too
complex to figure out

Konrad
