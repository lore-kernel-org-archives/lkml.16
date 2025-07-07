Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A3829A300
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 11:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751889084; cv=none; b=fT35I54JlCODKzxveowFtQ34rrHkAa54ezXHtR9ZU6PXhGdnbDUcX3c4wNVRfzFKs4u5QZI8QdUg0236ktTjIKP7Zj1Mq1+lHxxKP5TUgD1CQIWmVqZ3NQ0CD631YMbwxEvU/npGcVNlLxmAv5rsPVEWtK2DMJRi4/EqQDGV6lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751889084; c=relaxed/simple;
	bh=HromPgHLGAp6n+vy0foly0fzoT2gC2OfwCflgvtSLU4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wnss0qB1P07Jn3mtLf7avP9oNdOE38EDxytjF4nhQfTXix6s9c7GV3zbwLctH0wlSq7/iSrmuYumTiBl1r9sr7yVJ2RNTnkx8746PGWRWCMK6qSoWdnJqJtDosF6VIEG5YHyFJqzWxK3YK7IQsRtorz1k4kN+55SuyzAFvhd1cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pBUe/VYl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pBUe/VYl"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56798mXY002830
	for <linux-kernel@vger.kernel.org>; Mon, 7 Jul 2025 11:51:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6cGMm3qKa0EUKUclROM1+8JzWt9ygh731G2RROfD7BA=; b=pBUe/VYl+wPZoFc4
	/Tl9/YU/Unt8P9CAx7w9UG5AdKPJOkP9wMOIKU2iS2KQViheY3FXvy5D83slwRdN
	NxFpk2SaAOAeQgT4gij5AgvFuk9WD19QM32Pv3XY7c7HsEbbuLP9udcw6s5+0sg3
	2llMUm3BRxA9KUDUqYzFGsgMmTPW2eXgAHJYisrUGA9sTMR3bcR4rgaWnN4ecuYL
	vGCHGfQJ9mZHlqXgjlRwES6CJZQBi3iS8zNFGdlLUYHpGi0Ri4bAc9h/M+4opYPg
	do5BAMLT39MkbDtm62OK26nY0gdrM9xVUq1fyV95QaAFSdMx+pzaV1oPrjq7wFt9
	53IvpQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pvtkcftr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 11:51:22 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d097083cc3so41989885a.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 04:51:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751889081; x=1752493881;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6cGMm3qKa0EUKUclROM1+8JzWt9ygh731G2RROfD7BA=;
        b=OGq+gtH115Wm4o/2a5owrl/yx5jN1iuNVdDb+XqrMII6yU0MNX0+q6l+cPBIkj43kh
         bDjC0vqTgD0xkeNOJJ0Y7E6wqRT5lPuZ4fME1LTkhG5ziZzHMx7ti6JgLzwq3GLig3fO
         F/pNYDaiKCPOqZV1lWGR5NtmIViN5VxfVbJKwhUFWy4Ael4tHUphzcW14/To9oIqEh0d
         Jeq6PzGLA4kBCJFpBHlezFOAjRpZyybWRYIQPv8Q2YyDY0KLpOcWptFO7gUdRPEEQPT4
         GGlciV23N/AESBYEFnsy+84267A+V9I9sAffLlMZSQswCN+sH1JOWdnWk0NYcR69/4X+
         ZWtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTlKET1IeWYvAXJADAc9JKGI2UvOq2pYDjBzAFZBi7h7MIPlYSOH8kmEcrLqzeHtJ1SwmmDD52I1Z3cvE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyalFcV3P+Ge3H8s8sURl6KINIUUGF8ZIlT6ESLhCb5E3tzz4x4
	PTwsm2mqfiRJBtWxCmrvIqK0xbtUHAtCVSJ+xo0SeagWlQwEi6qPb8D/TWqyMzuD5lsWFRSGWNR
	DCH2UIJmamqMOO+N+H0QbXm8QxJ+biW7PKKs9HjSwpFffkrMemnznriNPFrF7dWTvLh8=
X-Gm-Gg: ASbGncvSlS9wnn/vrAOoeJ0p41Xa2EgCNhZnCqyoWRwrw/kHHj7GF5QLfBc7d4mZ9jl
	24TX5aQAI2M4lMvrHYbMr23YlhZjRHY8m57oQNlaitkAIi4n/jCJbbdPwhy7v6HS/NXF5CzmsMb
	Oo4UT6glJE8rGFCYWrDt1LRS1qNWgtMR15wxSTolJrotZ4GlQI2VISAMo+IeiVcUbZH4AiUpNkM
	jWPOX2dm7yvWJi90CHKzBEmE/3+Pwb0WNJFtaChg8yag2EvaECex3ELjaWZL0/eEBA+cRMqYsfl
	g4w+RT9ys6TrENDe32gRKfdbL2eeQRB4qY87KV4EwRxFBRzI+oS0wzW1OwQl2ZsjxkiIxFyQYM/
	oGF4=
X-Received: by 2002:a05:620a:24c9:b0:7d0:aafd:fb7a with SMTP id af79cd13be357-7d5ddb72bc2mr535682985a.4.1751889081154;
        Mon, 07 Jul 2025 04:51:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhXFkyLduPc2k4sQvzjIKdtwOsGoaF8niEUdcy13uce9KkeWVA7oKiNmElpE7Y/t9cWYfpdQ==
X-Received: by 2002:a05:620a:24c9:b0:7d0:aafd:fb7a with SMTP id af79cd13be357-7d5ddb72bc2mr535681285a.4.1751889080711;
        Mon, 07 Jul 2025 04:51:20 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6b02a2esm690064266b.119.2025.07.07.04.51.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 04:51:20 -0700 (PDT)
Message-ID: <129650aa-9845-44aa-b7d6-5143642f1f7e@oss.qualcomm.com>
Date: Mon, 7 Jul 2025 13:51:17 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: x1-crd: add USB DisplayPort audio
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20250624122933.54776-2-krzysztof.kozlowski@linaro.org>
 <fvyx662cayttlyrniyjifu7vi5sflmptzs323wm4a7pey7ethz@o2xq2j4ifwx4>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <fvyx662cayttlyrniyjifu7vi5sflmptzs323wm4a7pey7ethz@o2xq2j4ifwx4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDA2OSBTYWx0ZWRfXw0oA2pc+Mgj2
 f94t7FLT5BLWu5iADNlpernxfxr1wxYqSToTDsctBHI4z/tle+uI9TM7v0Pk5rnqatmobnOzZko
 xnr83rIthh0jzRPu/vCHszDowTy3GShD0XkuH8OzLr0g0LNHl2e2zf9lkUeuANTS+uq8vaN76xK
 IEjuFXHfo2K/x+kcVHGBXh4CKWuMLE/9ctQc0wobvOTNmR6LNccHgJ/S3otLTElhTabaBK5K8DT
 56d+N8Bi9txNUu9jLP8DJp1sZF5m3gEu/yyBBp/2cY3leuoDl0GU9Xlqr+e3Ni7S1vJVPBiNEC7
 IIArC3xwumYkpJwZ4eM4AtQecXKTla6KY7lDPAqqQAU+/pjnJ8lzkbcGSwAI2eaO2dEG9S4eNgN
 KrKAoaP6iw/b2yoipDdpuOD08hWxrhQ8u3XoUXGl4bU/C2Prlr8Cyx0v4kLBvaGE5CDx60OR
X-Authority-Analysis: v=2.4 cv=Vq0jA/2n c=1 sm=1 tr=0 ts=686bb4ba cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=NHrBlrzgGPaEoZByAxIA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: _GbmpdL-d53NRDQtC9e0p_a0_BahDQAT
X-Proofpoint-GUID: _GbmpdL-d53NRDQtC9e0p_a0_BahDQAT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_03,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 mlxscore=0 malwarescore=0 mlxlogscore=785 impostorscore=0
 suspectscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507070069

On 7/5/25 2:46 PM, Dmitry Baryshkov wrote:
> On Tue, Jun 24, 2025 at 02:29:34PM +0200, Krzysztof Kozlowski wrote:
>> Add support for playing audio over USB DisplayPort (the two left USB-C
>> ports on the CRD device).
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>
>> Changes since v1:
>> 1. Rebase (x1-crd.dtsi appeared)
>> 2. Re-order cpu/codec
>> 3. Add blank line before status for mdss_dp
>> 4. Tags
>> ---
>>  arch/arm64/boot/dts/qcom/x1-crd.dtsi | 36 ++++++++++++++++++++++++++++
>>  1 file changed, 36 insertions(+)
> 
> Just for my understanding:
> - Is the corresponding topology file updated? Will this work with the
>   current topology from linux-firmware release?
> - Do audio drivers handle playback if DP gets disconnected or
>   reconnected?

As we talked offline, this also could be refreshed to include the third
USB port if someone has the machine on-hand to test it..

Konrad
