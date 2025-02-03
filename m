Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66CCD205E05
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 13:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738590822; cv=none; b=nr31UjHMAvorx9wf37ZVdCscTCNiyM/69aX8XAVNOPmWVml1ItMQ9kf9ONgTNoECxeCyfcFEg12gJoftYTlNtplnVb870a94te/yuFr3m+ixqr6Q1g6q49rHPgovzJ3/v5INbzBYg4SUO/ku3xVchBGtVC7HIluiGqtykip/e4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738590822; c=relaxed/simple;
	bh=iALE8pAfZJSHRXfGu8XVGq+lv+SBzpsXd080MrzXlQ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TQ+shyxnmzojXVZ6h9GTHG2N1zBw6nwgHiR0IxY7E8jzBSdtQ/5IOpFK+o4hZx0c/YPHBDBnf0qLD/FN43+GpHZmBxqNCii2v45wysOV7iG7GPKCb+9yPtWIMRDqgNqVv2Q5x7Sn5TMg9EyxuZSkwtVOEezTLhQDdRbIRoISiio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d7Apou27; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d7Apou27"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 513BUOnx003800
	for <linux-kernel@vger.kernel.org>; Mon, 3 Feb 2025 13:53:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QSv/7PkAKpQ8nAIRs6GPpYKojD4RMpnIBxaHmaeb+lg=; b=d7Apou27U4Va++ZH
	vrttHaIEfvF9zN9RDwikHgCCxar3VbEhvM02YOb4XiaELo1kKmWETCWkT/6TnC9V
	B6Xfyf2tvYCqlDhEh2sMM4q8rCKE0+qKCNqFwzLfl2M2HGAUGTUl6NIrPlFS72ex
	DHoakw0/abIMeE8n8eX6y/a3w0zt3NnooFA1gLSW+lpbGyG0r081MH8hY6JmWQfz
	v2L18DKJsYvqzlSI0mp3qMTNyLDzbS2fmxFqRk+ngW4aEdgjhCFXFqdXnSUc1NG6
	fQ8Q8FaSj0mD0Sh2eSDt7r7AB30W6256n620f0PtKsDE3trp0n8qDKSptbizyzMD
	M8VBxQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44jw03ggec-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 13:53:40 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-467922cf961so4149471cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 05:53:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738590819; x=1739195619;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QSv/7PkAKpQ8nAIRs6GPpYKojD4RMpnIBxaHmaeb+lg=;
        b=hvUtIv/oEm1Eh057472RAvFZgVpHOPKlfOLg6sqfua2KWny9DLOU5HuC/sWYFaIsVS
         uh8YO5/LaCyB45AY2po+ojF0HeN/AJxxL58vndlh3i7Rt6UYgBaGhvL0MZIODgmDjlNF
         TsVGBTRjjW9qsWZG3xi+vfKkKQZ6pjSscWuPF0Fa4oU5FYRkeY9sQ5fhLYcERY0DguPr
         +uUBww0mLT6dHS9leVhcjRel+eR2QuVYHeqQ97ykaV+gay0kYFbffjKQKxYMCVv8JnD0
         ul63vbKuU/fynpm5iPgW7g+ZiikBkvtQrrkieaU9+gRVV8tFf72MjGwFCb1P9dEGp0TK
         bg3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUTniLUsWzKI9AeQadsw7qBrSPqKhFvBvRBaUCklTl8pO7PzNkmhmF3wfszByJvAUcTBZe4L4HAAqnmU1Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfWgEc78MGvQWblPROI0YQCuMvTRij0c+TbR4anTEiU8E3QI61
	wQKJfwaxHYSw8zOXZJXfDj9BbkjAvee3cPOn2QCkXPbTntRAjhFvHRmgWGjUlbchYMlUk2wUzQk
	hIURMUYOOaRl+vKNsXAjXR2A7Yi3xoA6oY2/A8LPJKRXkZr1jpGx9EQMq083ZsRc=
X-Gm-Gg: ASbGncu0yZLtshyWz1W2bd+mSUxkFfDUNXoLlkl/u3xuJHpqEuM6q41ichvdjHH7yLD
	cphnlYEE/uRLDb3ngJi6iG9XqqcZHQN7nH1k8wpN3Kx9lCeP6Z/1gqUngB0Vgj7S7zMtupFWgAz
	gFJXIDpTtWNi7PTFYWzu4xdBzcwpDeVHqKJQgeII5n2YRK6vMrdM3e14E1l6lssterqY3le7wN4
	xur4PEuiZqzsBwvqSLhiaCj5hP8Bo5XL0HEdlSS7n6MfpWIMkM454kVbnW9YLZE0Wo+FxeT6B6G
	6cilFrrGSmcpob10LyBN9cIBigk8uPlSeOzPncn8ooEw+oQ1rPaFM0LQ7uE=
X-Received: by 2002:a05:620a:40cc:b0:7ac:b32a:3997 with SMTP id af79cd13be357-7c009b38647mr822903985a.7.1738590819241;
        Mon, 03 Feb 2025 05:53:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEgceImfzV8y+oE8r85Xh7QN5KXyc4CPa69uZAzMjW/nziNSKht9JytBTvf5hqpOMhFNtVZTA==
X-Received: by 2002:a05:620a:40cc:b0:7ac:b32a:3997 with SMTP id af79cd13be357-7c009b38647mr822902885a.7.1738590818864;
        Mon, 03 Feb 2025 05:53:38 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc724c94b1sm7708809a12.66.2025.02.03.05.53.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 05:53:38 -0800 (PST)
Message-ID: <2128f6c1-9750-405c-9595-125995ea76da@oss.qualcomm.com>
Date: Mon, 3 Feb 2025 14:53:35 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: qcs615: add ethernet node
To: Yijie Yang <quic_yijiyang@quicinc.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20250121-dts_qcs615-v3-0-fa4496950d8a@quicinc.com>
 <20250121-dts_qcs615-v3-3-fa4496950d8a@quicinc.com>
 <30a82d74-a199-4ccf-997b-b8a6971cf973@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <30a82d74-a199-4ccf-997b-b8a6971cf973@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 4CBSimSgU0E8DyYkx0yqT3lQmQ1T6cv9
X-Proofpoint-ORIG-GUID: 4CBSimSgU0E8DyYkx0yqT3lQmQ1T6cv9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_06,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 phishscore=0 mlxlogscore=710 impostorscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502030102

On 1.02.2025 4:48 PM, Konrad Dybcio wrote:
> On 21.01.2025 8:54 AM, Yijie Yang wrote:
>> Add an ethernet controller node for QCS615 SoC to enable ethernet
>> functionality.
>>
>> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
>> ---
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Wrong copypasta, please use this one instead:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
