Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0304727511D
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 14:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746715231; cv=none; b=XwG7VVH0DuwCi3fN3FV0uqEcemkLgwe8cTTXQC97m+Lgt04uvbANaZVUcbG0S2J2ZPKSphZfHFTZBD9oOxFZpwsESSDuz+AnJAJZm2n90Bp1ZFkidAX1STRyI2zHdcwrdkLjWFYgBU//H/jFBC8YQpaj3a3xO8TE0ggQTS2qtQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746715231; c=relaxed/simple;
	bh=w/IRPkoqI29om20GziWR6uLh/++CAuBf10WI0YmJ+ys=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tSvTrsCXcBKjadv9VIJBj4oNn1DntOJrf+uccSFNXEmSvn0nh0O0jDzCfo9V4x06LDP1xVX6PSAv5a2nuMPyRiqfDVKfSU6GXI706I73oYnIK2ibz7V73exFkfi7T7Y5F/QwrG9stB3dmhkrD0+3nuwT4NW7UPMWuh5b1aqLSxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BZTj44Lv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BZTj44Lv"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 548CojhC014298
	for <linux-kernel@vger.kernel.org>; Thu, 8 May 2025 14:40:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XILZM7Gn5eaJwNn51SrBifians0biwpZ5P5rKKRfJL0=; b=BZTj44LvDUht/smb
	ldixBceDdCVkQWBtkAn0daOovnKWgqpvtfhJbe64PuLA6fJKhXR1vf/NjFZzsdtE
	/bPK3osOJj36Xa8GTQXrh0y98wYi25tP/7YolhJIStoXrjGV7bVIMeFBQloADyow
	m1Zzckm98huWiLU/Vq+UdJyssaXzh6ojOnShTAk88e0vcO4ww/+KY1v9rMz5I7+A
	7IfNtMzCwebiZrVzRylx2Fhae7ibCps9OgvswfiMrRpGRiIauPESIR5Tt4b91eW+
	oeem+sZ0X6eO5KRg6b+DGSX8HpvsRmmltlmKSQIEMnThifHCyeKlmOjQDF9O0su7
	yKMjNQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp4hp1w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 14:40:27 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c547ab8273so22285885a.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 07:40:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746715227; x=1747320027;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XILZM7Gn5eaJwNn51SrBifians0biwpZ5P5rKKRfJL0=;
        b=KPtEfjaqCAxwnTensikd/mPaFfu/R33KSDYQ7uFTPQad0ZvUJDw5B27fXlve4hg2ys
         HnL0SlvyXv4ABh82Ppkc4Q17hS+7OHllIVqzeLqwRIfEENeGSE1Mkwb156BwhbmqZSBY
         lJ13/kt6ZRpODriA+OZ/NESWTR3j1nFd7/p5FzCskmNMZ1n5/Nc22Ooz2h1T7Fpd0SPd
         ZvGF31H+TzdDQ1OAdcuK0oivESzim9pNraicPsfr9Un4X4LqontJc1y6aN65kjW0KHX6
         d7yoKFRByBPbk8+Q86fIcKD9leXcE0LUm2GZPNzCv/sE072ptAZoRVxTVJUmwEsSLeN5
         zDfg==
X-Forwarded-Encrypted: i=1; AJvYcCWtsAGsOjDhIeMrM1jrMjutl+d+rnAK+qnFC8Z6ipRX5tte44FlARAqxx8whOBkhA4Y1cEu/ouLiYzJha4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWsqRFo+RAyeZgAOgSuChY0mCUfjPtEHHwu7Yftn5U8k5nqND6
	ZOj8YXCK51Uf4Gngbfn+ULkE5GdMVdCLdYDv607Wf4V3lxAnE2z2/K0MUY52C+A2hTvjlthLvXb
	+kbCzX6cjA95vQGd4MhoiB2417zf74fKpEe187zOjoGsndpD6hlXec6FqZwuRwnU=
X-Gm-Gg: ASbGncsmJDpS9Irxjvd63TokGJa7MibucUfGLqv63/alyAQiD0kXjY38PfiwuwVdg6U
	rhJMHs0wSGSldCMELHu5o3XgqVjhBW0Wm1tWYHyGumkqJerx7ITut/pYYEtWjIQU0OePUurygG1
	VEv2+sE85uzQ0GyIeLOOLDWekx4mA4r2SDodKi/f8DEgiJ0G019HfxgobyaJSxniPh6LR6+PMcj
	nyDCglQiDLxtbGJgEfhPRR3Fzzo0STIq0v6mwWC/lWv/G7n+4jCapvJqDZhmrdNkx/S+UQxCwJ0
	IEbAe2sLIwAdC9oprGIRdBu37VzLPMEJKWLBMM0uH/IVY3Jnty4yJDxY3kZZu3vWhkY=
X-Received: by 2002:a05:620a:414d:b0:7ca:d38c:5d8b with SMTP id af79cd13be357-7caf7267bf5mr402757985a.0.1746715227018;
        Thu, 08 May 2025 07:40:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFT72bwxRsnCw6X+H7BXkoHxOCMnrHK7Khu5jQoHo0XXuFugh3AhL43OS8kDS21FFjGTDgXLA==
X-Received: by 2002:a05:620a:414d:b0:7ca:d38c:5d8b with SMTP id af79cd13be357-7caf7267bf5mr402756585a.0.1746715226531;
        Thu, 08 May 2025 07:40:26 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad18914740esm1092006566b.31.2025.05.08.07.40.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 07:40:26 -0700 (PDT)
Message-ID: <a8a1aa0e-f53d-4a77-9199-958878563b9f@oss.qualcomm.com>
Date: Thu, 8 May 2025 16:40:23 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] arm64: dts: qcom: qcs615: Add mproc node for
 SEMP2P
To: Lijuan Gao <quic_lijuang@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: kernel@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Kyle Deng <quic_chunkaid@quicinc.com>
References: <20250507-add_qcs615_remoteproc_support-v2-0-52ac6cb43a39@quicinc.com>
 <20250507-add_qcs615_remoteproc_support-v2-3-52ac6cb43a39@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250507-add_qcs615_remoteproc_support-v2-3-52ac6cb43a39@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: cbSKDF09_v2wT2toJviyLqhfVh9GazJL
X-Authority-Analysis: v=2.4 cv=E5XNpbdl c=1 sm=1 tr=0 ts=681cc25b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=NOOO9hkfg8HFgf3i-E8A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDEyNSBTYWx0ZWRfXxWLDkXlBMf1U
 RmTFIytCPF8bpdtrXDbHYy9MsJanU+tp0hCmIHXSpQA1zsg54YpJiwhiwnToPIaXU7BaVpl9VXj
 /nA+vri/9GUp+zsXlKfyxZn+wSo9RxiaEh10OOpB1Goq+54mdXnWouiLX5MuXPJHhxtwRzjqxnm
 9cfZ70LXDIfy+0gmoevo+wzrm5Tw/C79zsDxgZvXh5Dv1Rv6lRturZywMuYCgTCyHyfGILQa8e4
 ym6hzAmJZoWVHbwqze+JBvVHzdUZsrtdAhDeRM3aWC5ew9t4utTXzNpuWXaTD3/62NY3huoFvxr
 0/pGP+SPhg9YPvQ1QF3lwBYdINbSFharbF6OEUBulFIYI82qQsum56pRWhL2FZx9rFvcDp09DT5
 MIrd/ll95DftD2A0jyEXn81u2EO2U3tdzfhg4c1xTEdTstWKFhuEYn88R23OfOUVknhEZcjX
X-Proofpoint-ORIG-GUID: cbSKDF09_v2wT2toJviyLqhfVh9GazJL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_05,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 phishscore=0 spamscore=0 priorityscore=1501 mlxlogscore=999
 lowpriorityscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505080125

On 5/7/25 12:26 PM, Lijuan Gao wrote:
> From: Kyle Deng <quic_chunkaid@quicinc.com>
> 
> The Shared Memory Point to Point (SMP2P) protocol facilitates
> communication of a single 32-bit value between two processors.
> Add these two nodes for remoteproc enablement on QCS615 SoC.
> 
> Signed-off-by: Kyle Deng <quic_chunkaid@quicinc.com>
> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 43 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> index 7c377f3402c1..53661e3a852e 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> @@ -332,6 +332,49 @@ mc_virt: interconnect-2 {
>  		qcom,bcm-voters = <&apps_bcm_voter>;
>  	};
>  
> +	smp2p-adsp {
> +		compatible = "qcom,smp2p";
> +		qcom,smem = <443>, <429>;
> +		interrupts = <GIC_SPI 172 IRQ_TYPE_EDGE_RISING>;
> +		mboxes = <&apss_shared 26>;

26 will poke at the SLPI instead

Konrad
