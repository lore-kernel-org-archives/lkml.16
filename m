Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A986529B213
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 19:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748027654; cv=none; b=Cofh5jf1Od8Lnqy/gniQ+8HXTaMiF85q+nUIhk857mzSgPpiOyRF5L0zB9Jm8hxtbVwMBbP8d1FVS1iBwE1x3VfiZjxzUiPn3ToGXwnVS4Fvh+Iex6/K6zl4QGzMgu1srLxOoOzvp8YTekiYCeaqcC1cFLtf6SUrHTBjgWhYV10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748027654; c=relaxed/simple;
	bh=NJY4gnaLqh/2PIZVTRhxEeGz5B8sCMlGdIW35U2vmsU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BjFZSxE9MsE0FsiSJV3kkW9lVDZ1mE5y4bI7WoByaPDfVAR+UJcLmuK/aT9aiP2J8ugNSsaoPmLq4KyKDAuJbo07/D0yDwFzwJoV6DmocMIH3nnN3jWAZJH4I+lY5LPKWrajK5S+g+v919+jRNUcYaA1Wy0y2Y+Tj09x896jTwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z6OzVMMC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z6OzVMMC"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NBFHJm006644
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 19:14:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VI//RR7juJWGD286Mdk8S/XWLwI1d3+sqd+3hZdpgp4=; b=Z6OzVMMCh1rGW/i5
	d7WZnpPw+Vmv+1YdSEB/u45k3pg1ikPUAQ2dR3G3NZnnHSpGEPamLpf/Gc3YVTSd
	gdiu6699W3GfEFfMAxYnWBevoIYS1fxgr6ogoZSMoh5c7GDu1ImVqADL5p9NoNY1
	2EKQCtK2vAZEmmo8SGYy/FTCWDwQdoesYKIgbGnC8wnwjDSpXsLP0gaOZfC1AZcy
	XFtZV4N+seqM/59W7y2UbWBNBpMVj8gFyoIti2RQidgBXfI/Rob0rQ+KgksAGwZp
	UwJjWAD2QJeQQXQ0as1obmNUcIBZD3w25wTFPI2orvBHH4LpRIGqmDiSEo5c+xPO
	R0j1Gg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf0u58g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 19:14:11 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7ceec331273so2609185a.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 12:14:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748027650; x=1748632450;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VI//RR7juJWGD286Mdk8S/XWLwI1d3+sqd+3hZdpgp4=;
        b=aVRh3eghPPFBYI75HhbsguazjtQWDqzUzfaTz5VuCYoCzaBHeQXGlP4CJseJ0zdq1a
         iC5Z2mogzfH2oHyP4CPvZglTvDSGjhz8yc4ju4HCI/cVvknf1I44UTVnF9Kbm3NY5Mp4
         HY92NgxUVxpNQu82Ox0wPxoUdTrNAgdrgp3/iu3/w8YfyJr6jSlOWJd7aVTdSV+GTKDe
         2EJxDsjG3WvMzS1kpLssPD1peB1neot1L6hPKndRstXKIzfK7zgGLgglSCXXTJQbSUCR
         BPTnMJL2V0hKKGTBMso1/7SA9umz19rIQDpnvnkc7N55sd8+3YrYS+s8unhe5I0W3zMl
         989A==
X-Forwarded-Encrypted: i=1; AJvYcCX0qTvG0f0c76Y8hgewKowe/A1UyOhRrtT5gfdQuQSAG0iL4glbp+HXgIVqom14JJcWG4CkKhX+WrGe97M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJnj7xmFemkhUnLkRlmEXprueqvoDiiHEh73iTk6zZolZdFQjq
	hnhMSE0Ux61brlLa219/DzTKYFnnLya2qVVBTQCnUPat4QFeW7JFlrKp9uZV2UiQ0f6HNnMx/Xv
	StBy1odosT1GuInd6SWFqZWiR0LD61df7J2eHoTPE6bsFuZWQ2P3ItUBXQdoJD/nzvLk=
X-Gm-Gg: ASbGncsJeJCJrgx4EqzD2x9mHP5B5i1lkelxV7ygZYQa+j0NBATsdCZvFJcI4n/yrHf
	K6/IE5eA7LimjSiyGBFxY+f8sHxePdK1MRldPBS9giKEEAd4Tgp/D/sLoIxWDrvBV9fZEBWtVjn
	GkEJ2Z+RQklFwmWQG27rwsHBoe7Auf6C5CUNdoWU4WvRW2LMK4RDHXfEN+Pb1NNKbkeS5vNMBA4
	VwTRsMmzprAQMymqVgQqRe6cQupz1AiS8RT7Jczy1v2yXX6zzMWmdvftU3iMukGDmTSDYRyVxTg
	ae2nNHA5qz67bpgBZNnOUQFR6hoJTLyeQcST8ENxz+1bSFCiJvPk7qp+w/+yio8VJg==
X-Received: by 2002:a05:6214:5095:b0:6f8:e1d8:fa9d with SMTP id 6a1803df08f44-6fa9d324303mr3561556d6.7.1748027650249;
        Fri, 23 May 2025 12:14:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4YJNIMGoREgu+QKQuFwjxJdFPg04USqYp/clsfNZvtlC5H/HL6A5EzRZCUWIQa0RIPUkW2A==
X-Received: by 2002:a05:6214:5095:b0:6f8:e1d8:fa9d with SMTP id 6a1803df08f44-6fa9d324303mr3561376d6.7.1748027649844;
        Fri, 23 May 2025 12:14:09 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d06eac2sm1296261866b.63.2025.05.23.12.14.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 12:14:08 -0700 (PDT)
Message-ID: <555e8dcd-6f1d-4ef6-8a1b-78c53a39a327@oss.qualcomm.com>
Date: Fri, 23 May 2025 21:14:07 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: ipq5018: Add crypto nodes
To: george.moussalem@outlook.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250523-ipq5018-crypto-v1-1-0818047d8a18@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250523-ipq5018-crypto-v1-1-0818047d8a18@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6i926vJFEDGy2ibhOjp2sR_ynl8yqv_s
X-Authority-Analysis: v=2.4 cv=J/Sq7BnS c=1 sm=1 tr=0 ts=6830c903 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8
 a=APJUAXjnw3rPWsM6C6AA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 6i926vJFEDGy2ibhOjp2sR_ynl8yqv_s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDE3NiBTYWx0ZWRfXzKUGERzQOrNA
 LYpehlnxSPYejav+PD3DNxZv7M4w861UN1VIMLh21ITL7po+ZZMgfTXki5xCO3I6EtyqjRnzT+I
 SwMamKiC8RgJdVkvdo7ltvc9vulDZeR/6R4BMkbGWiuGBDwFFJwgFDoZdv1j5N+UsFKDoAdodAN
 8WxERDwVnBp4/nXz1SGFKPpH44GtDjK68wRhpzB9TpslaxQjXUpAdKYQPcyZCTUtJEAGJGF4CJN
 JkRIn0CaEWpmTK4Z3obqekdJ3Y5y0d2+sCs3t5ic1A5WyhA/NJIJbad+QzMgbeN5A/5o4dv6iw/
 IEgNcq/i5TKntGkkGm46ulSLixLM83ApAfsWGhCA0XFV7l9XuToc9V3E4vUnfO6xti2/QcdeSf1
 2f1G5PhU/RZHIAHz3o14SCaqONvw/C+5eLfMN1j+1JVRSJ8A5LjX5XMj/k6TCc0rs3gqXi7U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 mlxlogscore=895 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505230176

On 5/23/25 2:30 PM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> IPQ5018 uses Qualcom QCE crypto engine v5.1 which is already supported.
> So let's add the dts nodes for its DMA and QCE itself.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5018.dtsi | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> index 130360014c5e14c778e348d37e601f60325b0b14..09ed9c34c1c6129174143ae770f8542dbf61128b 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> @@ -182,6 +182,36 @@ pcie0_phy: phy@86000 {
>  			status = "disabled";
>  		};
>  
> +		cryptobam: dma-controller@704000 {
> +			compatible = "qcom,bam-v1.7.0";

1.7.4

with that:


Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
