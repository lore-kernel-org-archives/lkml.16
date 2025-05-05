Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769CCEAE7
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 10:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746441323; cv=none; b=DBzYmE+xlZOe5EiJYgLap+zeA8nAP32Pi+LPu6ftCLjgTslEsCiQaSNFIo4LA959UQkQyhwZQS+8h+8e4u8BebOqgqR++O5/UIS16fFQnLxa3xXebguV0xIQrAePwGiKbtetF9xUflyykod44TFg5fJrIYUb/qZOG7iTqjs5QwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746441323; c=relaxed/simple;
	bh=DaC2vDdqmokz9Jt/U40zeutsPirki/qadpEpK5UZga8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tK7+MfSJok+aAslD5u2mfg4I7hXKhy4aP8mtCVlo4HACgcvGmnU8N+8ZL/SKwuxpjloSfsp7+NZbhq+ot1JiWBTzlZPuaF/OTmU0DLRdTGq+JXYx8JHwMbvF9WoqGkPyhs1+fVwmn9gH+oqrH1Pn1f0SZ3p8vgfv9Iyd2mso3BA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g3PUSukw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g3PUSukw"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544NVdg1014482
	for <linux-kernel@vger.kernel.org>; Mon, 5 May 2025 10:35:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mzndjCg+e2OPuoc9rAF/IaDWFAfTk+vHxfMSSvYANmI=; b=g3PUSukwQcumUQ4W
	hpzGmBY1y8ZIOFAs1AI7ul4kpiFVp9AusLV6bWWe06IKm0C948aSuV2Gh82W2dV/
	PyZJOc25/WBfqwSAp0DtZDZV6jm3e/D1pKWFUQKyRediGofam3Vaxzuf0kuJPmnB
	Lz9y1kEmtzmDhpORXn+HFWtXmrAeFf5KrkKcJV9qYbaVYDCwn5SaDdhxjWdQ1QFq
	uEJXKnO2b3I/mOFa57Gcv3dNXzo/5NwkpA4VHCmjGf8dyMdJhvsYGA7i0J/RG1x4
	YXCrkAiYF0aOQdJhNkn+nd34jmD89CrrVwbTdVGvArsBqb1y3B2MSJebe06a0e/5
	GQV7MQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46d9nkuwgn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 10:35:21 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-736b431ee0dso3189378b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 03:35:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746441320; x=1747046120;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mzndjCg+e2OPuoc9rAF/IaDWFAfTk+vHxfMSSvYANmI=;
        b=ZARWkXUxppv1+KJEKS4C+vebcu8XYw2DOzREQJpg0pQQR6GdFSQ+M8zGjw7J/Q9F/n
         mvLeIeAcknyabEgzuryXpGpQ69Q8rrQHUBA9P7SYIpwroDbKGwCFPy5DsQpS04fmOu+J
         hZgW7CPkHYe3ul9KVAw3mfoYjihFKQOjJ6MHIWfJ9r/kfiPlqmR0wWe0jXlFeHzBrZz6
         oAb0JUqPVZUVEs++smqtsuOg9PJF+7l7zcbCTlWmB28N4mtmhpUGAY2DEeC33RqHeoqp
         vGYIxt2Y5IfM8PBmFQUaDO5MTNSQvdPHBeJyTifytm58X184V7mFBw41xTDR15McRfbQ
         8ZnA==
X-Forwarded-Encrypted: i=1; AJvYcCXJafBdx/VrfuHXqkl+OaaUxR5vGynuCTyXhcXyX5wwICWZQqlH953ZlnaLKJWjeMp5zkPTOOFKKhjs35k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvmqYXWUqIBIKzJVZyPaVKpNAqqgO67Wozri5tvBzoLeIII5Bo
	cT14aKoEMOx73Et2giaQ3jrMr850rkuoRnepat8Tq0YXNpqriBx6E2aoI1jG4JCO4IM9onQ0Mal
	AYqHiY9b5wzCWTaEf+zBRunp/L1XfCAkScVNPy53Ogi6ilnnH7mVgPLDR/eck5kA=
X-Gm-Gg: ASbGnctcxMqcl/TwX2yuUNhfRma486AtFL0suiaaWsz2fOLe07jfd1W3H2RHBneiza+
	T4rvR1noEB37b3HrWh7ItNB7PhVYh0hwDMTgJPnHy+7ftqjNMBapXCR64g7qI7D/1F9BWftIIaf
	zIpwiW/sch5hXX5mT5t1rcnPG6aXufAxNiV/ke5wHSr1slgnE8PfYlRa33yjo6ufouNOA/rFccB
	XnHH1OOa4POPmXA/hUSe5nPUFAWolH/v2if0h/PfGQWWQ69GNAfJp8C0mBJRW31PV8WwNOKxi+G
	5TMIGwoyQb1HkwXOZod7ilC8p8zRcCivOfQy10dPgr/x7N99mXpA
X-Received: by 2002:a05:6a20:7d9b:b0:1f5:6878:1a43 with SMTP id adf61e73a8af0-20cde85d355mr16144496637.14.1746441320564;
        Mon, 05 May 2025 03:35:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHP03PciZv8s1ToFZ5GwS61QgMF+GczmQXsLG40quiJUaX2iw5O5dKsziticwj7Edr0uWka/A==
X-Received: by 2002:a05:6a20:7d9b:b0:1f5:6878:1a43 with SMTP id adf61e73a8af0-20cde85d355mr16144478637.14.1746441320214;
        Mon, 05 May 2025 03:35:20 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058d7a225sm6379719b3a.23.2025.05.05.03.35.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 03:35:19 -0700 (PDT)
Message-ID: <15f4021a-821b-4a5d-8873-8eb8f59484e2@oss.qualcomm.com>
Date: Mon, 5 May 2025 16:05:15 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: ipq5424: fix MSI base vector interrupt
 number
Content-Language: en-US
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vignesh Viswanathan
 <quic_viswanat@quicinc.com>,
        stable@vger.kernel.org
References: <20250505-msi-vector-v1-1-559b0e224b2d@oss.qualcomm.com>
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20250505-msi-vector-v1-1-559b0e224b2d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDEwMCBTYWx0ZWRfX4PT5Tlk6IKTG
 3X6wbcthLZ+ZDnLHkCGRMjNkOX9/P3PZp2sQ5cwWQ7YhzGiiGrOHrQUly0KbEAW5WVeb/eNB3lC
 Vfim06jUfHzFGLCL3qLw3GEitz1q6y7hVfuHcHlkYsGLU7jkIYSF65g+o1OPoRWUtDP5yXyOzUW
 F697s56CeR9Gi+8AFdP7rMOYcu+6Q5TlJHQspZWp13TBdITs/2qG2VPk7tZtPqWi7x9ITuvkuJe
 t+voBZEkqwR6pvCJhRWGT3RyZJYhPEB7sOabhBRpJ7CLtzgdnGIWlMsxyyGzFJh3h59qJFz6X4Z
 spHEYiKfn5+29W1U2Cwwf2uiHlDhn1SQKEY7rmWqQYiuF96priWkfGHhOCtHokh8fuGLKBYaBAz
 EH+sYseGaH/GOUSddwOSLLqOkGiiHHv4wZq8+POEqREMe+4U8xze5Ru8PMmf5PCusvCqUi1d
X-Proofpoint-GUID: u-Veb0ayONSqYkL_KZplOpXM_3qjluow
X-Authority-Analysis: v=2.4 cv=LpeSymdc c=1 sm=1 tr=0 ts=68189469 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=rSoPyq_vb_VxFnRLzkQA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: u-Veb0ayONSqYkL_KZplOpXM_3qjluow
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_05,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=759 adultscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 clxscore=1015 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050100


On 5/5/2025 3:29 PM, Kathiravan Thirumoorthy wrote:
> From: Vignesh Viswanathan <quic_viswanat@quicinc.com>
>
> As per the hardware design, MSI interrupt starts from 704. Fix the same.


Please ignore this patch. There has been some confusion.


>
> Cc: stable@vger.kernel.org
> Fixes: 1a91d2a6021e ("arm64: dts: qcom: add IPQ5424 SoC and rdp466 board support")
> Signed-off-by: Vignesh Viswanathan <quic_viswanat@quicinc.com>
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/ipq5424.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
> index 5d6ed2172b1bb0a57c593f121f387ec917f42419..7a2e5c89b26ad8010f158be6f052b307e8a32fb5 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
> @@ -371,7 +371,7 @@ intc: interrupt-controller@f200000 {
>   			#redistributor-regions = <1>;
>   			redistributor-stride = <0x0 0x20000>;
>   			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
> -			mbi-ranges = <672 128>;
> +			mbi-ranges = <704 128>;
>   			msi-controller;
>   		};
>   
>
> ---
> base-commit: 407f60a151df3c44397e5afc0111eb9b026c38d3
> change-id: 20250505-msi-vector-f0dcd22233d9
>
> Best regards,
