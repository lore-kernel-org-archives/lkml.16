Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8CBE256C73
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 18:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749581875; cv=none; b=E5M94nHrZw4R07AB/bpxoTBCOzdiefapoQH62u1FRqZxbBs6X9OSh8wa6fsMPfxv+8DUtDA77iBxC4OPKFojqWf8MVPHGUPGCpGH43XKuMtLgsOvbOs0dg+m4dVzDqHpaRuejbBbxrYm9jh7Nlk9vCJ2e7tnJIooX8wX5TMKwbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749581875; c=relaxed/simple;
	bh=OHkRo8FvD4elBOPDQqurUw3uyz5hZ0e8dTn8vLmfrJM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d/1dlgkSeIAHHWwlo1COR4M7WQJbSPRfWKJM+gfISA6oNzh/LLTqxJkJdxiq2MfYecRyhVONNQB3KD4H5PdegN6jb99s9/pXIDJ8+gaBiJ18ZkrqHpz5t1xgUQSwArpZAEVFGkr7S+PK4kRbz2/atrofGTYKHGFH8MWaPxOe6Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UvZQfX6/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UvZQfX6/"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55AIPmht032760
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 18:57:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yrN1HUZD6Bynbfi5bC2hLc7uKiSyjY36xQNKue8CeUY=; b=UvZQfX6/cSgx18Dd
	lvTE6esc8Ims4sjnSW67RQsYweRHZRelc374HhxEwhyRhjSUL8cnNtwLbPo4sSPr
	6mKAO5mE4yN3xGDIq/seQxrc4zENSJLkW7Xz/lg+QYGc9unwisjXPDfpQTtHgkvf
	9JsybKdR9V68ijniYzNTG3zOxhnGbypOx38pgX5to0Evuh56LKtzIrSe5+dltFQk
	cLBq1jgc/vjOiRHEfBs4VQwnd8AkbukSZ7k9VOHs2V5CUW/aJR0dZt/eXYT7pQ3q
	AmkMciEr1Te2jpQ+eYmgX1D9LJNccY+8g/GZvGSMCS8GGXJlOc2zn4u3pEsaaVTH
	jusFRw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ccvafp3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 18:57:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d09a3b806aso102554785a.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 11:57:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749581870; x=1750186670;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yrN1HUZD6Bynbfi5bC2hLc7uKiSyjY36xQNKue8CeUY=;
        b=fORmPEqq+Nm9iVAZo9I3/UNmnmdnWcm22uKOmpp+yNp/SF+RNPyeYh5ADwyY84wCEG
         6dv6pXazuebKele9geyH1/IvTlwyO4AXSTqH5uzG8tp8IRgqgLh2t+X6UwLJYHaYsiKd
         D5oDHHLTLvwsIrppTts2YytofEur8XEf2LPGtUUu3oYzqv28ubNPSCwtshu5pyVX9P+y
         MHR3hryMHXu9jh3sXxV1Ow3GUzVT49bXmjnlVnAP8/EM57gdUC5kzgWHrIjEt+WN8WdJ
         MTk8Y2PRtMpKHVoxxGgAeGIGb+Laie1tf7n61MfJwxKRBa/hKhvBOyfuJEdll+YLJtyY
         ruwA==
X-Forwarded-Encrypted: i=1; AJvYcCXvBYwZWxyB7DTTdYfFd4AKX8N+xewgYue7o+Qc4z+OcxX8gNNYgZLostXyCzLda9x6Yz2TGoqGGE4KtaE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyealkDOsoHjo85i+T6ddSvnaSjQ//g31hPVcQLM8LicxkdIR3l
	vePVw28moPVzArSbCWiWk3nNTaS4MrbszyeJZFzstWfwg7yaAYrFhZk43qtHAzevwohq3EGEhnZ
	qs4p5gBA7cNubtE+LI0QAHsmlFpmQUGs0275SFbWLmRS8gFyEiwko62p81UO5bqlJPgA=
X-Gm-Gg: ASbGncsobgODliZo/PWWr8Jeiaa1lT/+nI37HmGc57GXC9U+AKsLqMrs478Tuom+x3B
	l03Tjbdyf+L8n9+vNL3+w1VyRzqs5hPMXcZ7vaVdONUTSR1VJRWNitlTupPzkgBp0IqY4jT44ia
	i69aZ2TQxjx+8eodSsbgQDQPSVGecUiBxukbERc9/YZz993rFIbuKR6T+QKNAwc2XzWWW0MWbRK
	yMBFgyT+MKMfWNV+XpjzqWU6Wbp8UYQ2tSeJAWWALdbKJEKg7pv4tNnhVqZgUndjnwxHsWCAamY
	UZM0zy+/cTYP/pzmoN3DMBBQDqpj8IfF15nBkqfftsxbvTHEb4+ip25WIRHP8ytdQ+ceclJ8T6p
	wXt8=
X-Received: by 2002:a05:620a:2a0a:b0:7d2:2019:c14b with SMTP id af79cd13be357-7d3a884427bmr28136085a.10.1749581870517;
        Tue, 10 Jun 2025 11:57:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFL9+1OgozdcD0e49HSLFtrscbL8pflDN77oeih/OFQ2Al80bPXOe/82xvA4uxsalTvF4826A==
X-Received: by 2002:a05:620a:2a0a:b0:7d2:2019:c14b with SMTP id af79cd13be357-7d3a884427bmr28133985a.10.1749581870126;
        Tue, 10 Jun 2025 11:57:50 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc3a4absm774105366b.143.2025.06.10.11.57.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 11:57:49 -0700 (PDT)
Message-ID: <38e161a2-2f93-4042-9db7-50559ad5f381@oss.qualcomm.com>
Date: Tue, 10 Jun 2025 20:57:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: qcom: msm8974-samsung-hlte: Add touchkey
 support
To: Luca Weiss <luca@lucaweiss.eu>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Adam Honse <calcprogrammer1@gmail.com>
References: <20250419-hlte-touchkey-v1-1-9d93c3e2b31f@lucaweiss.eu>
 <1e7afaab-e050-4376-8dde-07f09fb01e51@oss.qualcomm.com>
 <28770566-ed85-4c8f-b01c-c4c14efee743@lucaweiss.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <28770566-ed85-4c8f-b01c-c4c14efee743@lucaweiss.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: xurH1h-CciZ-We-53Rzo2g3w9vu1v0OM
X-Authority-Analysis: v=2.4 cv=TsLmhCXh c=1 sm=1 tr=0 ts=6848802f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=pGLkceISAAAA:8 a=dlmhaOwlAAAA:8
 a=QR4-IV6K3ZDuD3Off1kA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=y4cfut4LVr_MrANMpYTh:22
X-Proofpoint-GUID: xurH1h-CciZ-We-53Rzo2g3w9vu1v0OM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDE1NCBTYWx0ZWRfX94rVlrHZBAlx
 +QoY/Mfkl+9ByuPPEz60/wlvz4F3J81f5mdlTET7mfobcSUkyD+jOIfyo54sTazwlFmTmENOI8x
 2I5JuTb5vgSoRuOAe8Ux6Od8cSQ5/aaEnggkASkTsbykHmD+eX0Ucn49J2QyQxL7BuGdG50bLny
 h9GOz86WkLnY2K8k0/WyBezcBcdVtVLrgH+EILIK6m9L1T6P66rs8e7C8w2mIox8xI+8vXzwM4Z
 +24XYk1G+lYVPkX7YNcpcaPS0Ihcnm9hE8qV+bKGdxlI8hYxkI/oJBxrxYBn21CGdTU3xmaiJiP
 kGIkFMB+GKTcruMyggWa7vUYKIrUd46cpnlA5gGlnIx/R0FwzMNgKoSrwckwE5hSdvwFnwSkmdv
 sNNNS3U5q4ZL3cnOLekAv8CAA8ZwU7cUtaog20SQu62rq5MOxjLX1nLtppNQejlPmYf+xbl2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_09,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 mlxscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100154

On 6/10/25 6:57 PM, Luca Weiss wrote:
> On 22-04-2025 9:43 p.m., Konrad Dybcio wrote:
>> On 4/19/25 11:08 AM, Luca Weiss wrote:
>>> From: Adam Honse <calcprogrammer1@gmail.com>
>>>
>>> Add support for the touchkeys on the Samsung Galaxy Note 3 (hlte).
>>>
>>> Signed-off-by: Adam Honse <calcprogrammer1@gmail.com>
>>> ---
>>> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>

[...]

>>> @@ -332,6 +368,9 @@ pm8941_l24: l24 {
>>>               regulator-min-microvolt = <3075000>;
>>>               regulator-max-microvolt = <3075000>;
>>>           };
>>> +
>>> +        pm8941_lvs1: lvs1 {};
>>
>> LVS1 is unused by anything here - it's probably good to define it, so
>> that the driver picks it up and regulator_ignore_unused is aware of it
> 
> Yes, did you mean here to put the addition of lvs1 into a separate commit?

I guess I was just thinking out loud, it's okay

Konrad
