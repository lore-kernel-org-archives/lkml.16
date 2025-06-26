Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56F82EBDC8
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 18:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750962258; cv=none; b=trKxW0HJ2NnHFqJ1kTbnhAWR5O1WymFQuDAm3W2wNlv3sR5ewYDh0YU05OBLnR6n/s+4dl6RUyxnoABbFgV1tA8YL1hejO5Xg1qYdFwxMRxRWDjl90ArvpNwbXgJAPfzlLGo+25cGmGxdqA1C+FfI2M2f4uazcUYQnpz9kDe9wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750962258; c=relaxed/simple;
	bh=SEb7ufgzEXj8edBJyUUGHHko48ljKtRxkyisUqsSCAk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oHM6kr6bHs1aApubXrAHtz2R3hI2OZzv1vX6XpxtY6dcOkKMcPSxjUUOj9VqTV6qt0grR3mkb+9TS+FtXeX9RmbyBxFw1g9oL7nFfktHCqzrHJ2pkSzXgEt/tbtyb/WllhY8/dbIR3SgCG//JzmOKGFexjhosjDD8yi5jiM5p1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hSBjJ3DU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hSBjJ3DU"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QA1n56014014
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 18:24:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SqrHJ7cfWfnQcM3hQMJMXiBTqi4dPan6flRx03S8nPI=; b=hSBjJ3DUYGlbVw4q
	HFPnYfSqIRfncb3Fig25cbaMZSncGiPtDRaGmUOl6GRBzXszLU8wrv8Fg7FciVsY
	7Q9gcgcAGGv28Vbud85ERBmTOrdWomtM/Zpib5Wk/gr8xkHBW7giZ544LOKmcwtr
	TwFrX1UnCNLcGhDo005G8fUxjGhmUQEEb8rhqkoNa2O6XDtLNx5FP+8vONUNS4+M
	aWkqi4kt/eo1BHM9uUtCcZWF0zpWi9pkEpCHzpetqo/pgl2FgAy23j3Mv4Vi3F49
	zqa2x1swjQ66q8Ov+ecjzqEfyXfmq+kUE8fib15jLS49k/FYFh2O2xt7bKVEmBbU
	AGiPBw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbm22v9j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 18:24:14 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d09a3b806aso26035085a.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 11:24:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750962253; x=1751567053;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SqrHJ7cfWfnQcM3hQMJMXiBTqi4dPan6flRx03S8nPI=;
        b=G7VUMpQe3QsKYTZthgo4VHQs6OoT2xjJTLNt57wqm5HZhzGP6L6UXQE/fn7TOpuJH2
         Ii2cNsnO7ven6l2HRUJP5qRZOmsXiX0XoAaGZ4SiK9KShctwdIGeegg3HOdF0hKtdCGU
         hhyj26p3u57k4EJgCkIG1jgZrvU2gVdsGP27iJL9T/xMtCYt/75ihzS+0QAzRti7oyLX
         ZGvyggL1N34NYc3n852j49x07dHPsj48SEkEkAD/2SAxV61fdzvmI6x163cNSjgTUG9q
         m2Qx+QXy3YBKK+sW+Dk2lDnzEz14ooqMmWMOfaYepDBShoBxlFX4fTVmV5SiEFCVYFNQ
         IRrQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3QluprwmCjeEhyQ6cLU56k4nGJqMq7qhOtM6rFjmPFOkjZqkPGL994arkxFjqkaa7NdwBjvIgtW15ud8=@vger.kernel.org
X-Gm-Message-State: AOJu0YygH+P8GOT8YVQ1BuNsL4Z6uh+bz2ysyah89i1haRRqAMssM7qA
	sdGbxH0AKiNuJPG8DWIhLmDYniHtMfPhiiruujzhKWSHrAYAZ8h/t8GVwv3chZDjxGA1nBFSYyc
	Qxi21izkCfk8OMN+FGpRiTFJBjuY0H+IjGGrPslm42xTuQF/T9OV1kV0TcsRYCPBAL5TudjEQsJ
	M=
X-Gm-Gg: ASbGnctyR0GVA757YapqlugSQl5x2WWkguJNzvBzloDpnQLsdJeew7z/Uj65FmscCK4
	mUMd5fo68fv6MjGvNqgvR1T3pmo7d7KGHPe4/uwVFVNEvvo83pIWrPJh3lATv8OMnClHxaFY+7+
	e3IbolyfUCiVVsap6l/Ondj6nzFIKH5mYygZNN1xMU/pu/7gNV/4x0+5bcNYzxdBisAjIx9FmJ3
	DLzosi4TIW4rbUN2EEz46mdnrgdkR5GokJMy+h053Uf/KbK3121fMuaPHbMJsxxx4TrNRzsK3tn
	tXAs2U+23spqQ6zL95H4HFjOSa8ZlrNr+sM2HBGl4WhNU5VfU69BPxsdbh+5jjPZ6pbMuz+9oAq
	TdPw=
X-Received: by 2002:a05:620a:28c4:b0:7c5:79e8:412a with SMTP id af79cd13be357-7d44390daa2mr30490285a.2.1750962253604;
        Thu, 26 Jun 2025 11:24:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGeXgRbD/zpz06rGqRZPcG9OMXst6AVLMv8E1zNjKgi9yDWIHZ6FRqknPqbMJXd0Mnx0ebTew==
X-Received: by 2002:a05:620a:28c4:b0:7c5:79e8:412a with SMTP id af79cd13be357-7d44390daa2mr30487285a.2.1750962252950;
        Thu, 26 Jun 2025 11:24:12 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c8290e37csm323341a12.31.2025.06.26.11.24.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 11:24:11 -0700 (PDT)
Message-ID: <8680b702-7890-4abc-a4c0-49bce5a11177@oss.qualcomm.com>
Date: Thu, 26 Jun 2025 20:24:09 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] arm64: dts: qcom: qcm2290: Add venus video node
To: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: krzk+dt@kernel.org, bryan.odonoghue@linaro.org, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, mchehab@kernel.org, robh@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org, andersson@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250626135931.700937-1-jorge.ramirez@oss.qualcomm.com>
 <20250626135931.700937-6-jorge.ramirez@oss.qualcomm.com>
 <08e3c707-3b39-4b67-ae9d-f9fe65ad210e@kernel.org> <aF1YTmxF0pAVDFYe@trex>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aF1YTmxF0pAVDFYe@trex>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YYu95xRf c=1 sm=1 tr=0 ts=685d904e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=kIY5E4sY9iMOqdOJmHYA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: j5R3PhcRVgi-E_BsoHEytqzg4aEDqIr1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDE1NiBTYWx0ZWRfX0Sh3T/axpH6i
 1/KrAxvAPf0p62i5NAaEzfkVOwvOkFLlr0S4dEeyQb6MIHI+pQT0BPKoFHw/70WpBD32e6zkNu/
 BnoZ5xkaFoCsNKjpZoMaLzBGSj/sWIBXK7WmtUvkw5LziJt60BCvwwuw5ux9ExrB4ErMzxOM8py
 pUVvfTAJIq5tcRlN8vbljuOqOuXn0Hn1YRE+jupXAQNjXnaqrRDRu6t/2SxkDmsQ4NyFclxB1/v
 5vwEscq1vIWXsMlwHDunpd8DpOpwVsPRwN7TeCy0/naUBpGu+NAnfU8abK3WQbZ4PqdeRelNTaL
 c80jCmLgfcenDlHM6eTt0Oi30+8NLcIdMg4oMcQllVhi81FBOwBIG4s+a9Z6vZLu/lFOaPynrFH
 CjDJyqsfsCzBlYiqgj0I9fSbwGKOIXiFGuxHkFR9MlnV67nuIj52ei3RbT79dWR3zMeWxnAB
X-Proofpoint-ORIG-GUID: j5R3PhcRVgi-E_BsoHEytqzg4aEDqIr1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_06,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 mlxlogscore=880
 clxscore=1015 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506260156

On 6/26/25 4:25 PM, Jorge Ramirez wrote:
> On 26/06/25 16:05:00, Krzysztof Kozlowski wrote:
>> On 26/06/2025 15:59, Jorge Ramirez-Ortiz wrote:
>>> +
>>> +			interconnects = <&mmnrt_virt MASTER_VIDEO_P0 RPM_ALWAYS_TAG
>>> +					 &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>,
>>> +					<&bimc MASTER_APPSS_PROC RPM_ACTIVE_TAG
>>> +					 &config_noc SLAVE_VENUS_CFG RPM_ACTIVE_TAG>;
>>> +			interconnect-names = "video-mem",
>>> +					     "cpu-cfg";
>>> +
>>> +			status = "okay";
>>
>> Drop, unless you override existing node, but then this should follow
>> standard override-label/phandle syntax.
>>
> 
> yep

With that taken care of:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
