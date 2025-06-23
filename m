Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C183A21ABCB
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 11:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750678469; cv=none; b=tOCOaiNvUPLrOe9hGM31P7jXhX3XVUwJ1tM6RPNVshLVSY3MmQLg2YYVqEyMkIMt1g2BRLFxraEbUNAQxayyx/bJwcUhw769LtaH7SVW9Jo0iImZ4yu99YzPUh471TTvb6IgzsspFGUWTmmHLlmDPeRjTqi6jyjvBZQbTIlY8dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750678469; c=relaxed/simple;
	bh=PFy6DZqYijFvvzn5Rs4R3EvlKOJ49HtPp5i9VMENABc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=UfK/caFMszmnRJQQwlPGRYJmsXhTp1QyvsE/2Dc56vulN0I0oBrpi35UGIhLG2GVNx12JxI0XkA05KAmiwdCcb0JAdGlG8Il8M/7Y2iWA98lbqW4T/XcL1z/EeJobAEHwef/CEQVzXHVgs5sZ6tQuJ4JELChZEgsQoh2vSJ9CDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kTMMMmD1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kTMMMmD1"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N91pkb021510
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 11:34:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1P4gqQHkmhqMopG25g3g+FXXW4439jKx8yVBtkS8vRw=; b=kTMMMmD1fSIvw7Jg
	dZO++ktt8Fo/6HzE2zsAUlXoEPPqEKIDUptrbzetKgfBsAs6Fi3S5r4b1AaNQPEf
	UGNbUHMtjHLMdVgxHwX3fdj7oChOJ0vAXjmwCWCKyxAlD6AMy8cT+rgdzxn68ex1
	xC/TnTaG+q9nNorO8ZRk2v/QZgRukXfc1ZtkE0Tm0SnTRiKs8fLZQVJV8FPZ1/Mj
	2KLSTiWYNOswek+bsSP80lx6sd7IbOpYH1vUkZS3PC4DOpaaELFTWTi2EJuKXrO0
	z2q3DfvQas2pkGoEZWoezTUN3PIqXhMp+FecM9Tqg5Jna2UDBV9Wh/1kBMXnr3Kx
	b4EU9g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47esa4hs2j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 11:34:26 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-49a4f4021ccso4433821cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 04:34:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750678465; x=1751283265;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1P4gqQHkmhqMopG25g3g+FXXW4439jKx8yVBtkS8vRw=;
        b=E3wI6Ni/gEmajnnnXS2TxG7x60YZZ3pPijfR5EbEgfWlvGg2gu05kPH4XKx3qgXhL+
         oMDfhBizZkMQ0Q/v4vbXmbhCOTm6r7qHGWNmbU1M4fG0CrBDYVywCTsJQErAu0MqKvwe
         pq9XqSguEsiae1wv8OSM1RSlABVUVAEKq+D3X9DICti7dCSfQW2rx+N/BeB3CoUijFKK
         Mnc3OfflBFYNzIrarPZdM0t0BfmTGuMsyC3xhRFl9/G1QKGgmNdVwIp9kzymOn/FPYRx
         Utwd17FlbAKsnt3L+Q2PAWNHs5Rl0O/7S9ydyp/cUYl7q/w6GgPbfLPZv+11KOHD6/XS
         WoAw==
X-Forwarded-Encrypted: i=1; AJvYcCXKCuoqJjUKZVB6HUiihSQhmdor+7R+n/24SNk8CEgleuTKOj+htAIBNCZ6gPYxbsbOPgYnVOFgcL537WI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxUcEMOFXsZ+3ABJSAWRkk0C6xhqOgiXNaTbBiQtvMXG+btIbn
	Jn75Qauk2rBfjXwlqQ+Y8I4In/nXMTo6877nQmSHn6rgmoHJ58Z43eRLvCcei/AVMaca9ULwMBu
	RLryGn9PKySQ0626OIu5kH3CGPPNl+ia6Z4qiaSpICprpXnzpPqBdVdKDXKaBn8hlF3A=
X-Gm-Gg: ASbGncsx6F7BuZImf0giYrZuOJDRR932BZini6+Wg8tsnGBrS/1nFYP8XSjhcSzNCAJ
	AWb8sz84oA+7nLDJXtPQ3kTlb/JzORaCfuyXKmAJG9B1Wv7ayZ8TbLgD70u+pPLmpR+tLN2k9YQ
	EfxFS8LAWMdpP7am3cADux+mq7nXwprvIRZV1QXdbNhCS9wrS6CVAqhDN15goGBTKWjMY4a9wti
	c0hYfdYhAFESzKFX4J+m9lQFrU2AgRpdVhgX1VtmOJpdb8xrzTetNk2FMfqaZ5Inire+qrHFRww
	3epmdt5nvgTjz2tNFGE8IVDxJ9T+IqigIWpGegKbFavg0RJN7vX4ggYtJr8cC2jbKjV7UcMHKQ/
	f4Ts=
X-Received: by 2002:a05:622a:8f0f:b0:4a7:7f80:7a8c with SMTP id d75a77b69052e-4a77f807e4fmr40214291cf.1.1750678464671;
        Mon, 23 Jun 2025 04:34:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqS4ZDp8SWWd7RHWhdDGT8Y9mjrW/Hb5L9OlYTHjzT2jbPYQIQhvFBuzyl/0D53huNkma7TQ==
X-Received: by 2002:a05:622a:8f0f:b0:4a7:7f80:7a8c with SMTP id d75a77b69052e-4a77f807e4fmr40214181cf.1.1750678464137;
        Mon, 23 Jun 2025 04:34:24 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae053ecbe9esm688093966b.44.2025.06.23.04.34.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 04:34:23 -0700 (PDT)
Message-ID: <465751c4-a45a-41ce-ab65-ebddb71dd916@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 13:34:22 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: ipq9574: Fix 'l2' regulator min/max
 voltages
To: Varadarajan Narayanan <quic_varada@quicinc.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, lumag@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250623113227.1754156-1-quic_varada@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250623113227.1754156-1-quic_varada@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=eLYTjGp1 c=1 sm=1 tr=0 ts=68593bc2 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=EVHRmTP1ojgPMQ00PA4A:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: CXIqsK1NF3Ze_qf7nEEjsA5aM2T9ukj5
X-Proofpoint-ORIG-GUID: CXIqsK1NF3Ze_qf7nEEjsA5aM2T9ukj5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA2OSBTYWx0ZWRfXwhhVXLIxHGP8
 tla6aoisgr2R/8rBDIcaA3rlKi6qhECqyw83kQrDqm3cvBe/MilIxKt+U01CCJRC0DMFcakXVHl
 mi00KuThMgtLC/lfC/pNx8NxsETUyriQn8BX9likPa2F9I7AgwAK/AYFk7PwkbyZRhD2re2TMT7
 4P/5q8zMNzplUmKpiGG2yKmepFI+tYByozW5NelMmqk8FUHeg+WnlRnzRGhUQXwoCe6IkRoabXP
 KfwKYSPOHrSCHiIaiIuHmCCOCG6sYbHLwWTgep2+aapnF7vrvzXNaIToWRjSS91hgwg3dtYYqf9
 8iUWrzFSPmfu5e/xfTuz+6lc+kcqnBOfNyn66+15L0VM+7bXp73INmxUBSYVFlgXYVA7b/ZmHS3
 oRsCDsT0H4S/CDjxhxag1DXA8PZCXT9ky4LvsDmzspsgje/9mTv/m5I6r9HCKuHEZJKwQ0O4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_03,2025-06-23_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxscore=0 clxscore=1015 mlxlogscore=813
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230069

On 6/23/25 1:32 PM, Varadarajan Narayanan wrote:
> The min and max voltages on l2 regulator is 850000uV. This was
> incorrectly set at 1800000uV earlier and that affected the
> stability of the networking subsystem.
> 
> Fixes: d5506524d9d9 ("arm64: dts: qcom: ipq9574: Add LDO regulator node")
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---

Shouldn't there be a consumer for it, instead of it being always-on?

Konrad

>  arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
> index bdb396afb992..21b04a2c629d 100644
> --- a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
> @@ -106,8 +106,8 @@ ipq9574_s1: s1 {
>  		};
>  
>  		mp5496_l2: l2 {
> -			regulator-min-microvolt = <1800000>;
> -			regulator-max-microvolt = <1800000>;
> +			regulator-min-microvolt = <850000>;
> +			regulator-max-microvolt = <850000>;
>  			regulator-always-on;
>  			regulator-boot-on;
>  		};
> 
> base-commit: 5d4809e25903ab8e74034c1f23c787fd26d52934
