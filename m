Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A65828C030
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 23:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748646270; cv=none; b=uv408LxCJU90ZTmAAZEQy4jNLz1lRlHUaiOyOfcd9MCxRbuYLbfiX4DC1e/6CMIocEs5Odew8Ci2U9KwJoK2ZdiKO0ZKTZExJMAJzpHfIMdYArPpwyFcfeGGwz39d/N6XJSHUuT+bPQAHcp22O22oMsp5EB9xjKxiZqICCL9sPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748646270; c=relaxed/simple;
	bh=byiZoh49SLANJUmSAfCqkOwCaNc9lAE28TTBexKKF/c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uLt7N52gyVPzQ2CJrrOklCt3OFqMq4E4RHEM+/xlrL3P4DZGRH3MmMCmVFbgt0edUudO+YEaQ8MeO90Fh/JDT0fIuqF2NwqcgxinesBEnHW4/jAoAoIfTD+5KQI7z2+ltvjPPHEiqHHMw6XbK+kSbUElYozvfi8+YnpF0nOIMPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V0BnDPAQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V0BnDPAQ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UL4W7V031835
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 23:04:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dkCBS/+sevFscPkQYrCdD9qA2ujLMqx9Mjn5PoGA0mk=; b=V0BnDPAQ1cZA5vMx
	wrO+uwAWz8KFlXnstE/uufBrXfFTgi9pMy5ti7STYQH8q8NfAlgSoJywzRQ6RcaA
	6L4TJWa4Uz403dM51XNkHzP/9ei2iIwgXqq+mOW85fAgEex2hgHJ8sNILvHTUBtx
	QMmPQvrIfUhawDrBFMPX2VL8X4HSZYJ6jM24pYyOVnxGGOnTewosFWMUTitVV0hm
	KmSkZ/UPg4Xm8SkaQ6cc3gS7/f80g+dpbgrj3rRQ2grar1cbok/T3eBRMT7e4Nov
	M6dcZIyQItB+TI3kB95iWFi5BpBHlRQOo4mvsDGr9r4aZtKEZ+qjdWdfclyqhQkp
	lNnSrA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6vk2q2b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 23:04:28 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-47ae9ed8511so5046021cf.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 16:04:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748646267; x=1749251067;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dkCBS/+sevFscPkQYrCdD9qA2ujLMqx9Mjn5PoGA0mk=;
        b=M23ygCTg/XWdEmEqdo2wFYl0jQGe9DncHQrhlMl3cdvPBwjQ0lb+RGsX1BTiZCDF7T
         Ghw5Wqwm6kTRULdvSfKPURjVeNK8Yu2MFM1YT7FBL4npvIPHPfZnJQZvgG3hyxkuStU9
         bCtbsEE8a3MWeCMw8D1BwuZjROV92w9Oj14TbXl3wTc1h/0mrJI57T9mzhGYQgcg2K/h
         Kwb/YHs35DZ8Zjmth4uTN+ROI2f2ff0uW9NtGrJH3rMqYgQEKk5u0lpIBcr48rl36sWk
         FQVRmMyipVowSnxQSwxeNurUw27Au4t21FdK2FuPQL1QU1oJm6S/uUbRKnQQrHDqxhmR
         R1pg==
X-Forwarded-Encrypted: i=1; AJvYcCUg+Z/4PepHW6b47VN+al6V8NyY3DiG61xUomyWAl/3eEqzGDpnM0Re/bKpET1UJJQvObbyST4f1JK/zgM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxkNFypfKwivCKYh7eImxTBWquVzJOxp2DIunzIcwOKxQlqPbT
	NhJlu6yfudzLKJgUu/HK4WOU30DPNkqymgvlj7jVC+JkvDBPbC3kxFfyaKXtxESUgxveCHh1Eql
	4IomwetahPkAybf9AB82og9aSjx4apBwKbTDNuF3TiFnkWikTOnOAi6Xr5avrS1gWEbA=
X-Gm-Gg: ASbGncsnnWKeXDWHV7uGgTMgPBqpc5RV3nMRmg6/Mk7tz3EQjun2lXrcCDc/9MxAp/O
	iJThXVt1luQRY3g8ZW/5ftpppVKFPslVSNf1iiL0/jJFJmoU3JSKRg3liGbY6xx0oI7AoR/if+/
	I3Kxe3qQz2EElfPNlk+0HFh/VhCaxp0O6a69HGnt0THV00fhj14pGfTsrgJW8Fsi1CGycDCIirI
	uZkLgOKNIsfdKbKeu7qiB9XwN0ElbFIf6rZcnu+nbunU2Qw5dhuBNBDq9gLRf0pOnfewphkqU/q
	PNiR/sEr7pedgxiZ0k+7yJm1oNUOjPtJtK7hEJJS9rMq+bkQMM4ZY1j4i/Ue/O4xew==
X-Received: by 2002:ac8:5786:0:b0:4a4:3cad:6378 with SMTP id d75a77b69052e-4a442fd5b4dmr24294051cf.4.1748646266910;
        Fri, 30 May 2025 16:04:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwEI1tzi2R7YfDu7oYyeYqxX/g+u3B+J1JeZ+9bSeOHb3HGbzLToYdbggmXX+xwNflLNapVg==
X-Received: by 2002:ac8:5786:0:b0:4a4:3cad:6378 with SMTP id d75a77b69052e-4a442fd5b4dmr24293841cf.4.1748646266428;
        Fri, 30 May 2025 16:04:26 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d7ff075sm399104366b.37.2025.05.30.16.04.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 16:04:25 -0700 (PDT)
Message-ID: <ee3caba9-deff-462e-8117-f375882aaccf@oss.qualcomm.com>
Date: Sat, 31 May 2025 01:04:23 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] clk: qcom: gcc-ipq5018: fix GE PHY reset
To: george.moussalem@outlook.com, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King
 <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20250528-ipq5018-ge-phy-v2-0-dd063674c71c@outlook.com>
 <20250528-ipq5018-ge-phy-v2-1-dd063674c71c@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250528-ipq5018-ge-phy-v2-1-dd063674c71c@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=UOXdHDfy c=1 sm=1 tr=0 ts=683a397c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=qC_FGOx9AAAA:8 a=UqCG9HQmAAAA:8
 a=EUspDBNiAAAA:8 a=rZqdB0JiAKPJAkIg25gA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: xyJeXjqkWkM8QZQ4NPL-nmYTnk5Lwbi1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDIwNyBTYWx0ZWRfX5ltwrvF+kqsQ
 lpPp5bmSb0B3VuiqIW9mUdG1kSQgB4tPhFqSBalOEObhCPYpZNtwBBxbbOaCHYmVcBVFAhxUubt
 xfeYnQmU8VgMYnZkUoEd/ZDeqO6mw3YoYfkSPXb6UQsDaXowXmaHb/ZuXkahRDlx8jDN/on1rx5
 2RK0woWImuCSzEQA3g4+zrp/CRnuMRrxjJ9COYSWQGOSCKRVugUPO2OflSWerg61gcfUwIOMBrp
 MFK3Aa6jtsmZR4e9MFDxQGfaBUfgpYxOOvgs5oyfJdHIpG+5PE+Xw6d5kyAW3w9k+UFEgQM855q
 SUo9TQULRaavkoQx/OD7MHuCmo3u4BrGi2CZwyErOx+oFHPP6TioVCBG5hGIeIkCZd3I8H5NL/n
 SULLKBAWQYHp03eUQdIzIQ8LUsAWYelVDXAg2MSqoVY2P6SmSUa4MfqRMmJNGGtCY6v07rz/
X-Proofpoint-GUID: xyJeXjqkWkM8QZQ4NPL-nmYTnk5Lwbi1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_10,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505300207

On 5/28/25 4:45 PM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> The MISC reset is supposed to trigger a resets across the MDC, DSP, and
> RX & TX clocks of the IPQ5018 internal GE PHY. So let's set the bitmask
> of the reset definition accordingly in the GCC as per the downstream
> driver.
> 
> Link: https://git.codelinaro.org/clo/qsdk/oss/kernel/linux-ipq-5.4/-/commit/00743c3e82fa87cba4460e7a2ba32f473a9ce932
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>  drivers/clk/qcom/gcc-ipq5018.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/gcc-ipq5018.c b/drivers/clk/qcom/gcc-ipq5018.c
> index 70f5dcb96700f55da1fb19fc893d22350a7e63bf..02d6f08f389f24eccc961b9a4271288c6b635bbc 100644
> --- a/drivers/clk/qcom/gcc-ipq5018.c
> +++ b/drivers/clk/qcom/gcc-ipq5018.c
> @@ -3660,7 +3660,7 @@ static const struct qcom_reset_map gcc_ipq5018_resets[] = {
>  	[GCC_WCSS_AXI_S_ARES] = { 0x59008, 6 },
>  	[GCC_WCSS_Q6_BCR] = { 0x18004, 0 },
>  	[GCC_WCSSAON_RESET] = { 0x59010, 0},
> -	[GCC_GEPHY_MISC_ARES] = { 0x56004, 0 },
> +	[GCC_GEPHY_MISC_ARES] = { 0x56004, .bitmask = 0xf },

in case you send a v3:

0xf -> GENMASK(3, 0)

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
