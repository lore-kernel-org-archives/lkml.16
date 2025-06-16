Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A68F29616E
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 11:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750074423; cv=none; b=cBVZad8f/ynDxePk3WmXeOBWjrm21Iblej2YyPpdksPYzpfBpalbftVHkkEkkuQu4N8WJAw+1Eih66zbUBV507oMLrCHqKsG8tnDRmK/J71Fwk/En0X1+pXOd1cMK+iOxEfC4OdlXGUSlExEzKr+zcOHzlkuBHMRLOXWu6FSd0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750074423; c=relaxed/simple;
	bh=xvLchH7ZetSbOXKQWka/fIa87mgHsBeuanRIcEntZKI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L0znAzICSFND0uiZnGy/6S5R3S65++kWzEMHOH2gpH6PNr0tbk2irgWYC22cZva415clGnQ0tEhTwYjGpFf11X8ni1DqFOFo+LomlpUXKH4AB4+ckG2jPMZXuAImvt7C99IgXi/zlSH8uiz7v95jEWn8xq6/jtJeM6CtJoZ854Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZSls4azE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZSls4azE"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55GAPUtr020800
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 11:47:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4+9SjfwuMXgcQnirx7FViLQ3PT3LT50G+ecUzPrY6u8=; b=ZSls4azEotiCruzt
	wxygWg6g3folqNwrjAcwi/leCje0HrwhXKagZzp4fizpOhrBfaCmqyBoqtD+Fz4o
	vxpI42qsVBBa+70L+xBfe/upeSjK7zetvcAKHW7Q8mvWU36js+Tw9ZH6ktYADoDf
	wxqELXZAztffF9nv2qcW9mnOn527aMtUesuj2G/rw/Q4h4lgiKoO3D8P/4hRjib8
	Bf+klAJSix3CkKqssxj6cIT/W9BBYxk8MNZ+q4XasztAsm2ioJtSZI1XffJUsLWb
	F6M6AHiVBGHcDQDvvSn1mxBLn/pI/kdlU7/mJ/6SelJND67IgwAtk5M0DfcPgzoT
	qW2bow==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4792c9v9x5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 11:47:01 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d09a3b806aso97295985a.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 04:47:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750074420; x=1750679220;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4+9SjfwuMXgcQnirx7FViLQ3PT3LT50G+ecUzPrY6u8=;
        b=ZEN6iNyJXwackuM4ByyRD31ICKLSjEIuuaukmqr+mgE4ua2iEov6fh94965tjNVK7i
         cuYYTab/04BE4lk4kiQJpQ3uc+GAVNSnDeDjEQgnmNOwurY6aXTrls5NNOSA2kDLo8EV
         mNOR3JV4P78B9DcoVcF6HZ2YiesAPjhHfJnlLBUj6rLwjHEMCWnO4wdyKE3u7a4c3/rt
         W/L+LpYSWxLMu8uq1qyMMeqbuONZWfdLaTQtpG/ieYjRmMx+ZIWiX7QBhYRlQs7xDI9g
         +ofxw24EKFA7Yr4/1zkMdOHhbgpgFxFP4ptcmyB1YYkenvsEfS2LMI0yhs8bTxqH7vmN
         NRGw==
X-Forwarded-Encrypted: i=1; AJvYcCURMYKQcdO5gMRo+59ggOkchfk1/fGxjtJiqNL3EpGp8q9w2CHS5nPfCtup+p1o4BeArIcfP2J/+WJQPac=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXo4pWOYNnDM3tACDKXfENSvRr79z8uCjrGUZGL2rZzkSb3wAn
	AZikRolhdRGuKw4DPNlK52ou0YZsIeDGz9dT9txtfrsbVQMUfCrCFyUo7Wc6TxnXUlmhTMSTfgT
	B3v+0AuYW4++GMLZLdVvVCrLnNtlRWoloGhBCvDjbytcbdX6zmvQBUVIFtTWki001KaY=
X-Gm-Gg: ASbGnctvHe3+ugk5sU8HRQvuBXCNRvvzHzq7qFcL96Q6z6ylFZDN3YClIQ7DG17nugc
	w3RgVp1yEzusOLHg9EvhR+77P3UotEU/jRJlGw0p5SSsx+AiAU/ER+74JwSZtqwmh4I0Pb+Zhcl
	tcExrPQN0JnzkJ1KmX8b4QiNEy5/6N2GsEwOGXmbgAkFlkP9BKfbhUnAfQirGUqY+kV5Yh5Z32F
	kSxaIPi+qFE24T5jIiOhLqH8X/s5ljlUUGQ3/K1+K1pRCsAwxUg3u4UWmlRvgckNV2ZTycaTvbB
	ZPw2rP8+IUrC/ENNeHkIYsKbtNjgeMiLPlGnkUyDYgjvVEz95c4ZH20wAXn5JUiAVnMqB1zqR1s
	pGto=
X-Received: by 2002:a05:620a:6015:b0:7c0:b43c:b36c with SMTP id af79cd13be357-7d3c6c1aad2mr512720685a.6.1750074420337;
        Mon, 16 Jun 2025 04:47:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhRDv3gJWoivgwjrGSlbD6D+Z6A4Ncme2M1YfZQGjp7xs3qbRnm8+STTXh6nGwR0vLHAZjiw==
X-Received: by 2002:a05:620a:6015:b0:7c0:b43c:b36c with SMTP id af79cd13be357-7d3c6c1aad2mr512718485a.6.1750074419855;
        Mon, 16 Jun 2025 04:46:59 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adf9ad8a155sm503073566b.84.2025.06.16.04.46.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 04:46:59 -0700 (PDT)
Message-ID: <90be390b-d69f-4862-8f24-b692f41f9bf5@oss.qualcomm.com>
Date: Mon, 16 Jun 2025 13:46:57 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] arm64: dts: qcom: msm8976-longcheer-l9360: Add
 initial device tree
To: git@apitzsch.eu, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250615-bqx5plus-v2-0-72b45c84237d@apitzsch.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250615-bqx5plus-v2-0-72b45c84237d@apitzsch.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: GzpO-EpBy721dJzfsFS51Udq8VnBVJ5X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDA3MiBTYWx0ZWRfXyKeulFHo9cVD
 80uIaL1IcwoUsXmyvrZ8IPX/i5mdLECq7r/A+QjMOByjFNc7k8fy0u07KiTOHO6hqaKzO+NcIXi
 tUzjJ0LfZaVxYiSyM9uJ72o7ukWOHTHSOCaRKWGCPCPoYozo4PibTfmSByK0mo8uiMCatW2mXGJ
 CTpHVosjUUv/sLa4Vej/kYsHXpc1xNVdgKKxjuXoFJoP/S5zY1UegH+Nr8nDbJuDWzF8Vo41qU3
 IoLL/URQn9hvHGAuLKsFYN6L0zhp7JDFutwejpbiNnmS04u8tzEPT5FgzbFaiCw1F3Q+LWOXI9k
 KSsMp6NKSYwGForV0de7YxSJ0zb6ZgYfNzsBfoIWwgv8itmXuCU1nEYiZTWEWK7dWt2XWqfgJj9
 ujYRUIqipFaawN09dQ9jE5+u1XEDMlwMgMxsZ+BVWvF5wL55IG51E/6KDQcVJhLiR6fWXkIx
X-Proofpoint-ORIG-GUID: GzpO-EpBy721dJzfsFS51Udq8VnBVJ5X
X-Authority-Analysis: v=2.4 cv=etffzppX c=1 sm=1 tr=0 ts=68500435 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=HDjIzE35AAAA:8 a=3LVZaTluhho0w2aZh4UA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=y3C0EFpLlIT0voqNzzLR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_05,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506160072

On 6/15/25 10:35 PM, André Apitzsch via B4 Relay wrote:
> This dts adds support for BQ Aquaris X5 Plus (Longcheer L9360) released
> in 2016.
> 
> Add a device tree with initial support for:
> 
> - GPIO keys
> - NFC
> - SDHCI
> - Status LED
> - Touchscreen
> 
> Signed-off-by: André Apitzsch <git@apitzsch.eu>
> ---
> Changes in v2:
> - Add Fixes and R-b tag
> - Move sdc2 GPIO definitions into msm8976.dtsi (new patch)
> - Remove comments from rmi4 nodes
> - Don't touch tz-app memory region. Currently, the bigger size seems
>   not necessary.

You may want to run the kernel memtest, which accesses all non-reserved
regions. If the device doesn't kaboom, we're likely gtg

To do so, enable CONFIG_MEMTEST and boot with "memtest=1" in cmdline,
boot may take noticeably longer than usual.

Konrad
