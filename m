Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91176274FDE
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 14:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746715290; cv=none; b=JVi4x5NZgQCYyy5OloowGf6Aui0dgiyhXHaQA0OHXUomW7iIzAKqgv9K9uq5tqi9q6O3dSmc+BE7N4A0yjmTGGDZEvUg5cuBLrqw41EeEKBUuVvI9y2Zo7MYgKSCXMHyTUKMzzd8NNn/WjPAfml7mgDRCpvVMkED+OLjZm3/LSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746715290; c=relaxed/simple;
	bh=D2p2R6SzYbGr76htpl+9rp1P3w2GVsL1rfjfNsJkVgM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PmcVDJsAIhtiEVBLhbo+Bte58aCbOwzDluz0FyUs8fEtkf1nTB8ahZI13RS30iSLkV+DpXxQSPo2OiO/lsxeta8CzqR2zcxiknYp0qPQPJvn2rMpZAAxC6GKjcLpZLeZq7WgFKh0PcmsXZRDATrJEtwYTh0ekwFJ0IpZ6ZUU1fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G+dXzOUs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G+dXzOUs"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 548Cs3Ps010313
	for <linux-kernel@vger.kernel.org>; Thu, 8 May 2025 14:41:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N5elXAs3RRDCKmWaP2KRsgdXB/dfARJXr/m9cSVmgAw=; b=G+dXzOUscmeCMPyV
	aS5Gw4GVjMT2u/lOQwRZ5oQnfO6cKt9uY3eyfBdm9y1q0CSqbeIgVmd4QMtAbbLo
	cjBRDbGa+pquGvlhZPoyCThWmTqf00mNGnUbN/d+kQ37MySdUB3sdlPQcS702TWE
	nfD5NWat7WO9v6rd33uDJs1IYmYc8kRdfbBxiLK6c4qAGRpRFhP2wtRE+w4rnbUv
	Y/Oe1940AxKs1weDGsi9P+AJg302FDkAVyZkE8yVRvWQs+VRS4vc8sP197n0HRB1
	4X4ZFPJ7gsw2nuXxyA18FesqQfkccfDgice8I5Srqftwymwy6Cl861Fs5cHP5Cgy
	SJNKzQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp79pbn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 14:41:28 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c54be4b03aso22414085a.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 07:41:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746715287; x=1747320087;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N5elXAs3RRDCKmWaP2KRsgdXB/dfARJXr/m9cSVmgAw=;
        b=adkS691nQ7ydVFzfQVuHt1FQ+ees8AbXOHrbokyQxqOuFpxQKosWQhgPvfPcdh/gW5
         vzdSA2aSwulekpa1YM9i0mCSQltC4D7paEvUZQr7fnHIgNdpekCOOKpA7ekzTYXpW8wj
         ONOuyqfS3IRBfWI/EYZP8egcON3axRjQv+N2mhOz1STXDeEVPsteY9TU1FOvjL+iLJUM
         HXxVCjgHY+jPOlxqzcxSht+8faawdcUuDqsnAnHDWFjaer+7/eD2Y0fKlHqI6aKYnSMz
         EwnZC4MyCUmmS6XfcCf+b4EFuESVCCkvAkaABR1xu8WrodRRtotvMU/V6IyP6jzgLr0K
         VRMA==
X-Forwarded-Encrypted: i=1; AJvYcCWdrX6VzlgNQAyPezmgwS3xBpJIcoXQeiG0QrSrAlG5jNkZbHzJR6GGlrpsKSS42euVxnQsRCPe+KYwxZg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGOfpXqToER9KP5MV0E+HUQECuuxEtRjW7WlOJeXshX3q7rJCa
	0CvsdjGspqz24YJ03Rkm5nE0aXQOcTxl4WC1dFHl11+jsAtU+tWYwdop/DXXtf5EC5dB3gmQ1lF
	zLFDeMg96REsVXjjlxCB67v9v+YQlpErNlpR/v+guYAKU9a9GLnzGmVoCaYJRx9Q=
X-Gm-Gg: ASbGncslPxHfKsTm+aLRji3u1Ibxve8nxey96l3gJ49K6Zc29viwJgv6kGze2SEcekX
	2Lk4opJGogyd5J1Oywhnqo2egFpmPcjagQJnXWnEAAQyT9iNPjwcZAGpWj3lGi0I+/0pqcvjb60
	18KgUvFrg48H6yjRZVjFattWyKVGArsHpmv4DmSJOi+oBiFdT6aKS1D24IO3boQoz5pJnnGNO3O
	JQKX7dmMd4mSsTXBeFq4GC3+pWAJK8K11cQZsVw7Bqhbh/9vEobOx+Y8yLPmY5hRiCub+iygb8d
	psa11gVRZKuBtmhP0xby6o3p4GRKZFOrlr8QeCXnv0a0N8rz2qn/2WEmL+u9kB+/uvs=
X-Received: by 2002:a05:620a:25d2:b0:7c5:8ece:8b56 with SMTP id af79cd13be357-7caf73a3fa0mr345848685a.4.1746715287246;
        Thu, 08 May 2025 07:41:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvotDF/EgOTa/Kwtd8jpkit/1sMcKqDxmTcLL6op4C9NEVKeeD4uecRAKFVemZdy2mMST5Tg==
X-Received: by 2002:a05:620a:25d2:b0:7c5:8ece:8b56 with SMTP id af79cd13be357-7caf73a3fa0mr345845985a.4.1746715286890;
        Thu, 08 May 2025 07:41:26 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1894c0238sm1098500366b.106.2025.05.08.07.41.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 07:41:26 -0700 (PDT)
Message-ID: <64893588-544f-4cb0-8c0b-7eef588468d5@oss.qualcomm.com>
Date: Thu, 8 May 2025 16:41:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] arm64: dts: qcom: qcs615: Add IMEM and PIL info
 region
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
        linux-kernel@vger.kernel.org
References: <20250507-add_qcs615_remoteproc_support-v2-0-52ac6cb43a39@quicinc.com>
 <20250507-add_qcs615_remoteproc_support-v2-4-52ac6cb43a39@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250507-add_qcs615_remoteproc_support-v2-4-52ac6cb43a39@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDEyNSBTYWx0ZWRfX+CtyQAzwMJnY
 loEt59P5EuOfuqS5nHfr3rG+4QnQ5eKPXbohe6XpqSUf5fIVe8PzTJkWpNqwCVECKZvifZmTR1y
 G4wFuCUyafmtG9bs9vtTbPigU4xSbdJqN3wmvqfbBMD4VPZlLGjAI9GtXLGZssOQyLu3YyjHW3t
 EbSBV0plTnaskARWXmBCsUXq1suX8M0837wZ8+A/CLHU4r38MqwOJvz8Nc1YY35f8MO+piuaiuW
 WBHuO32e00vTFRaa66YSIqz9fuF75gX0rZMu4RRK2H85uNNj05t4vake9OMiQXbC0xFwCb5E2mY
 NmV7pM+j/EcJZukRHL4E1B5nFOqypMX5aglbYoY7VAFBBki04U52zwIj8/jPI85KLezRJSSSyeK
 /E+QP2FUW6+R4x8wGBfByqOfQBES86T6RjG/VysejSLpShZ0++QYcKK73WxPBZbBFBjCanEJ
X-Proofpoint-GUID: i0QK6fN-X6yLuJyiH54eS08DPdFyZ5yM
X-Authority-Analysis: v=2.4 cv=B/G50PtM c=1 sm=1 tr=0 ts=681cc298 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=q_8UC9VRXJzehZv9TEEA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: i0QK6fN-X6yLuJyiH54eS08DPdFyZ5yM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_05,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 mlxlogscore=888 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505080125

On 5/7/25 12:26 PM, Lijuan Gao wrote:
> Add a simple-mfd representing IMEM on QCS615 and define the PIL
> relocation info region as its child. The PIL region in IMEM is used to
> communicate load addresses of remoteproc to post mortem debug tools, so
> that these tools can collect ramdumps.
> 
> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> index 53661e3a852e..fefdb0fd66f7 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> @@ -3266,6 +3266,20 @@ sram@c3f0000 {
>  			reg = <0x0 0x0c3f0000 0x0 0x400>;
>  		};
>  
> +		sram@146aa000 {
> +			compatible = "qcom,qcs615-imem", "syscon", "simple-mfd";
> +			reg = <0x0 0x146aa000 0x0 0x1000>;

0x14680000 0x2c000
