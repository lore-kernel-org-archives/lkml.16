Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF3920B7EC
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 17:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747502469; cv=none; b=WJ2Sm+NakQYBC7NwFQJij+a+75diId0E6gtAJV7dPpEZbcOV8UktRHazVPCq6U7yPUdTlVGrEU3qUnMnTzbXvR0rdoyAMeOIm2KpLE9Y3/Op8DNyLcXE478DqTO7uQ4TM9d+yiVyn8a8KKmmOtX42mydKHu0WdIV2BT+BjBFVTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747502469; c=relaxed/simple;
	bh=kM6b80Bkv1XCI9nr1OXIWLdlXNLC1th4jgNd+WyRqLI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qiQNNfMF0FauJVoYR8LcKI7HTZ4LbSuRGfayKPt7BY08JKCX+6mjNuyazRsm+oPSPmZlSG+cWwIA0DghpJ7f8Ly0YFbQouowW6M7PYCb5PL22STz6AHRZIPed4c1pUvBcIuFJPKOSsFs92VQwvTj/bxYrL+2z3W7WMy5wi1Aw9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JyTlT0+V; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JyTlT0+V"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54HDrjeU028906
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 17:21:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LD3N/dB9dxL0NuGVYuOpUsqBzwJF+cAwfrUr6EDS96w=; b=JyTlT0+V41ZCgI4Y
	Zo4c/pHRZVE2qs3/EIcW3tJni/qVANZfA3kghmEQfuo9pJDeqWFy+Zkpu5jjB3DP
	2psrc/Uut6+0YnIcfOIyBMLV6p3EVgcZXOfXRinfs/88EpiyrUBnUtEXpTRtfsPe
	3CGQ2Nu3dn4nXK6BOaavaGviyPPMXAMhl8zbwepeN07HjuPElXny+myzvzVBZAJa
	apopSYbFQIe0N5m2Oh52bIRLTS+yH8BIxpRlFjKq5tUi/chS2y6vmfE2HlIgL2S8
	9HAgvcjaS0uyEPvK0BTJYCl4MUrd+ogUG+XdEdMPStlHsAwVoBn7R811GTrM8Yt5
	NX9A0g==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjm4rx27-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 17:21:06 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f8911b0fb0so4212626d6.3
        for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 10:21:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747502465; x=1748107265;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LD3N/dB9dxL0NuGVYuOpUsqBzwJF+cAwfrUr6EDS96w=;
        b=DVqzFCt06YUyH+3RYdH9cX0eyY7ul47QkNXLXiWYazjBoh3eyUT33ORqXStNEO4vcD
         5+8yI37J6ZFXWJnJzmmnmfhKcV9NrRpU6/NoMRLnOkMSYz7+AFcWrYNG1d54Oo5VAzuE
         7uXAp2h9WoggJlCFP40+RaRnlg28BetwRLW+anFjzBxHzWY2CzQbyoXYi/7y/unipJv9
         Dgq4VehptFh+S2inAO1C28ekp70TlYC2TFfj5oL4YT84Z9Q4up/a02l92TV5rMMIVOOc
         UgSMQ3M1nWPDZE2qVWR+UF9Bexq6QmPgix27CslpHFy+MF08+P4j48jHOnINLPJsHe6s
         LFJQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5AgaKeFZ/a+5eACEXgYqnd5R2KDxAIPzxgl8Urr0MSr38QwHWcAd58m/iWakEajJ9pPuPM8w0+ilDOPo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ8MCVQWSB5n+kAj05Rj3GEHy2d6r+tPxkvxsbRBa8hW2+0Zaw
	Rh1hHfXhKHp5oAO1+KRtWvH+5Mow8wY+EhwjSoWhKRql4UC+BFiE3JROpwM7C14MUZhzkUZqoUk
	kiOW6xIs/Yl8E65dHPxs2/XpKivbasWKBSxdb+hcXuEw5BsXzyqnxz+ZGvdKEtizZcEI=
X-Gm-Gg: ASbGncvjht+iEg7sMzRF+MZbsXfuKfKUo4R/l50S35HXWVjDLwr1qQN4gWQAOPzProJ
	klP3+GIJeFzPCr238vSb3u0CLQjWYOYBmGPaY98oY9fRhDPCiGvVcMsXvsVrMEXM0oHCkk4sjAp
	ZuLcnA9GV3Ei6WVdFGqbNphAdsX1XT4vI5jw/eZclX40OaXtmg6D1tYG7GB1oQByzQcWPR3Z1Pw
	2Dr0hXXBlIjAnrIcH1WxkCMAimP5aYOknYZd4QxE3DKwrSQHMUDBaCwVTdgp42OO9/dsJRNYRBR
	S9GcFiN2obeui0tktEHAVV8SQuwhotg6bGQr7HSAbCGzLrMZJFAXE+85YW8LyqX19A==
X-Received: by 2002:a05:6214:48d:b0:6f5:3617:556c with SMTP id 6a1803df08f44-6f8b0834f7cmr47221256d6.1.1747502465599;
        Sat, 17 May 2025 10:21:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEL/rKen6YM5r/g0Pxafk+XQRuIYGMxqfn1DIef0c2Cb5fAVGwQZBFB3zwu/wHgNmNKd2SnVg==
X-Received: by 2002:a05:6214:48d:b0:6f5:3617:556c with SMTP id 6a1803df08f44-6f8b0834f7cmr47221086d6.1.1747502465285;
        Sat, 17 May 2025 10:21:05 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d4967c9sm318992566b.129.2025.05.17.10.21.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 May 2025 10:21:04 -0700 (PDT)
Message-ID: <a2ada2f8-bf0b-4730-a28a-2604a405e491@oss.qualcomm.com>
Date: Sat, 17 May 2025 19:21:02 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] clk: qcom: ipq5018: keep XO clock always on
To: george.moussalem@outlook.com, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Luo Jie <quic_luoj@quicinc.com>,
        Lee Jones <lee@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250516-ipq5018-cmn-pll-v4-0-389a6b30e504@outlook.com>
 <20250516-ipq5018-cmn-pll-v4-1-389a6b30e504@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250516-ipq5018-cmn-pll-v4-1-389a6b30e504@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dIimmPZb c=1 sm=1 tr=0 ts=6828c582 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8
 a=DjvbsIfDJYjzuW62fVwA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: tJFsyDCTB5UWDf9nytrvfzXdOog2dDR1
X-Proofpoint-GUID: tJFsyDCTB5UWDf9nytrvfzXdOog2dDR1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE3MDE3MCBTYWx0ZWRfX7pJHMmx3zbr5
 tQm5RUj5KNtIrnUdS5WOZ5USRQJIeHrU//QPIdeYiaYjZyBL/D1+2zYVVucCv3V0HLG/PfvguU3
 agGnMNsatFA4wLnBGn2lVl7Nvpj0a0cxnD7jA3f2ZAzzpRLvYps5oyJUelOIi/NTa4shsY2uSzb
 /a3b2Rr+N4M7UJOr78L89EF+jVoRbrmJ1zxfhDvZ80AjVb1f6Ti3kOAv4nkz8kJ75NE7e29mVwW
 Jkho4IZ382pApi2BueK/cbZVSLefBsmz2JUVKqwaM1mP0biDMCa0jORLkbSEVmajl2qwxU+HvU7
 TZbyeRbT6mwaMXt9nIY5anUszNVci9WQwCLBi4ozYRxC2U9ky325QdyPK6P6LJYYasoO/xXfWku
 cDAB71PL1OUdogU4aNJT/lXrgGvupIedTBjyjdXOLGAOiuL2d6vqhplYmO1W6IpcOf+TntXB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-17_08,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=544 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505170170

On 5/16/25 2:36 PM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> The XO clock must not be disabled to avoid the kernel trying to disable
> the it. As such, keep the XO clock always on by flagging it as critical.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
