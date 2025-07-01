Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84AE242D8C
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 10:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751367401; cv=none; b=R2lMOdtuFSdKTjwfHmVgCin3lQRd1LKCc52jCmyJM1mYmD0S4/rV0gWrCIGvCr46WTPgfVYmejH6rD/j7n6lgRHhSJ2+JeXf0XeUwxZgWWUWE15IXQNUcNoVHIBBypGT8wQMv2KykvadxHQFTa62jYZBpj89PG+RTeYeiBN2OX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751367401; c=relaxed/simple;
	bh=AaZIOW8LFl/s3flg9giqywN4wwU5/9+iLNi1F0u5tus=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EE0oSidWJ8tGrAIQCHcxABJQWasKFH6K6Ob7yZtzqgc/XzLMCR8bpdddM9t5kE52oThsC1Jpv3L9g0/sE4iFaQ31WtF9wkYUkSfzvDOoGgHEm9g2u106lA3OHVlaQjqeSBxK4ZCCbGL32NezFSgQlqvTtW4tr4hJuojQgheF+7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LgbOhlfF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LgbOhlfF"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 561A42xR025382
	for <linux-kernel@vger.kernel.org>; Tue, 1 Jul 2025 10:56:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TeKgcaFWYCzmdQ+v/KUY/g3rynYYApSLvY5HT0tokvM=; b=LgbOhlfFRo334foW
	RTjZZp2R1NKV6mfuHcefXeTLKUqcbjRAp3yAAWAJ3yNEdy4WPu8S6wCyoPLDxeyh
	csL2M8s1vJdKKr0uEIx4LbB00DSim+EYA8AhzQLyqvryxxXT2SaSakjWmOJZ/VjY
	wQmZplnARt3M08DLBBVWj5CtY//bfDOZ6FEjEu5JQSa++DYfRfDAw3bARdG4Toab
	4lNvMch2Xss8xi+RMTguqMDbk/WW3+AOCg5RQW9jBsPAhZE85OdvrE9BeARPJ8tU
	d3EcwBGrB0DOFMvsBfKVGscym3i05QA3ZiQ5uSdVnFS257+46CBpIaB92Nn/JJFL
	AJ+NjA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kd64ntbr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 10:56:38 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d097083cc3so145387885a.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 03:56:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751367397; x=1751972197;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TeKgcaFWYCzmdQ+v/KUY/g3rynYYApSLvY5HT0tokvM=;
        b=d4bj1e6kxWUZp6XKCPeLGf+SQ5L73LMvlzeb7vK256hRPyiD+CA6dnXwTu4z1b7F5k
         vsdp4MABYLHzJeauBTVZjkchp9U3JBYNusQG53j/KYfGUrXFhXsxt51OcMBBbpvyTxIi
         lXxvtx3DVTQQ3LoTRFmIuoHWTCPG132HaWer9CTXhght5LW3YGm7SWXD5MwW7Y7df+mY
         MGL/Ar4MjtevkLPQo4+QkvfJRfBt4iSDYmHHZln1t24qhejb618eBJOmxw6LE5NtHYB4
         MBIpAFmJzTupOJVOBUq/KGZJpJZwbBao7X/X5UBircyy5mAHEzrF5OCCkPm/3Bv5Mb1h
         GuZA==
X-Forwarded-Encrypted: i=1; AJvYcCWc64cLvNxHG48FQPPTg7QZHHLk5lsmkooGTTdrYSMsB4lMcA91ojPmKLsBXTm5HSWD/lTt02BtBsaMKcI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhtXOJoDGxR5SSo4vCUxujWlU9k43OH732DJc7epX7jSMQQWBq
	NES33xkT6/KglxrWMWlaz6B4Cog5e5lFMZaJyTiy3LtczBTmgZo0OmHzVfJL9dJ/5eLKjJ3xDAO
	dNCBIaAqyOS6fhO18qNEGIqjuc37UKruOkEowwJqGv33lo8hmUGmEqDaqzkfm/kX3M9E=
X-Gm-Gg: ASbGncsfdeVuKxnOTbk1byNhzUZJ/bxS9fw6yvuu06accYnh/DZDryaJLGvHb9fJRPi
	diMY0LkRPa+C/AzrFFY2yxf8IJmSgOcfgh9ts4WpTXtziwq/cALG+/XpUgWWNdM5WwcLqLZyeIw
	W7xlSm5lif44o3csV5nk4tBIbNFmH9zGa9TA9CeZbyesiMntviVa4HvzfztuSCS5WZxxwMZvMAb
	si4Afwq158EpzdEVo6ga/90WOUZv8g86chZohNxnnBHI9BO9eRqUMT8X3cB8JUsTrSS/QEL6lNw
	qhBzCPQHpthJukcYd+MRyImwKgkubAGMVTZgKlz7mWKnwOHkgnVmGDGYcqqn+ViSPcAJro8cAvv
	y0NB/VugA
X-Received: by 2002:a05:622a:199a:b0:4a7:6586:8da with SMTP id d75a77b69052e-4a82fc19646mr16622111cf.11.1751367397394;
        Tue, 01 Jul 2025 03:56:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFH4VxQeg0CaFvYhEgN2Q+i8n3PEWF+B4AevBlG/ryxBThRmsxoQPl8MVI0QdsxgKfm6CDLeQ==
X-Received: by 2002:a05:622a:199a:b0:4a7:6586:8da with SMTP id d75a77b69052e-4a82fc19646mr16621861cf.11.1751367396770;
        Tue, 01 Jul 2025 03:56:36 -0700 (PDT)
Received: from [192.168.1.114] (83.9.29.190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c828e3b49sm7398797a12.22.2025.07.01.03.56.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 03:56:36 -0700 (PDT)
Message-ID: <bb433897-f061-481b-8b35-114e9334eaf1@oss.qualcomm.com>
Date: Tue, 1 Jul 2025 12:56:33 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/2] X1E HBR3 fixes
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
References: <20250630205514.14022-1-alex.vinarskis@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250630205514.14022-1-alex.vinarskis@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Z+PsHGRA c=1 sm=1 tr=0 ts=6863bee6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=fKQzr7EGRj+VoE0XNsDNvQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=92s0zTvQtuwzI3XGIlUA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA2NiBTYWx0ZWRfXxQW4ITjQHiML
 tVmndV7vWOmPpfyLZnp9abaBCSvQyzmPMEoIQuc8CD9can0haXijlHOC957rBq/KpSArLxxOQ96
 j8MbAUXmj+77iggLRLMNamWuSVZI0ieEDAY1DdY8HFWi1Fx4pd6SIixjTNFu042/s9a81lk8/7m
 weWOwA/yLtE9fHpFN6yLqldnxlj1VbcRiqxb+Kwm830HqOWF/lZs4EwKPVAITqlUh+nu+V17j7r
 5eJ5LbYAF46LkqpidFr2ghnjiSWfRtiVLirIaQnR3VdwBpXg5j9F+7HwUaLTff3VYtwaYA2SKHV
 BfpsnNJwiTfvBTzC8CVuDl1Rqn2Q6SSCmhccm6NKLBX8RtCWj1V398Dfj21cVYF+PcHQ0DayNWY
 zI7sRnwHYrZUc+PKiLxTYIMLP3fMvPdZYELVimRR15tSiaLIVN6suQMqRQBYp9WkX8GmAPGR
X-Proofpoint-GUID: bO0EkTH297k6IMcAJM4_7Rf7xHi7FFFM
X-Proofpoint-ORIG-GUID: bO0EkTH297k6IMcAJM4_7Rf7xHi7FFFM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 mlxlogscore=682
 spamscore=0 adultscore=0 mlxscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507010066



On 30-Jun-25 22:54, Aleksandrs Vinarskis wrote:
> It appears during initial series to enable HBR3 earlier this year [1]
> few devices were left out, add them.
> 
> [1] https://lore.kernel.org/all/20250226231436.16138-1-alex.vinarskis@gmail.com/

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
