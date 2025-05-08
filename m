Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ADB026F447
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 14:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746714642; cv=none; b=EzmZDAN/pTuH9IfpXVKCpMySDHP/XhmtTqS5wqWt5VWhHFm26m5YknF+GCNc3YvM+rqhVsQCJlcSMPedSsAAqI/1bfFCXLlGdYPOj4GDu0sYqucPdJMCtiuA03yK69Lu7mbql/zgYtAzQVPR8H15KifA4pH3Fk8K2qrsLe3lTPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746714642; c=relaxed/simple;
	bh=t4oLXiz8QfvEsARyF6xExsOe53WBHk8ZMnYpTzjULGs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IZYxMJcyBU6tlPyy7i972Do3I9HcpRYkRRwijY4ovN6YaPQVsSHElObsupck6T6e/7z+J3KzIoWF1ef4sxMQVxfFSDy8AG7Yf1nNKpsg6pKknYvVBJGr7FNuCbFxEpWOYx96/TKBPQlSAH6xOoCQ/mfEpxi2bHCik7xvDkQllKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TuXlWv9t; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TuXlWv9t"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 548DGXVS030761
	for <linux-kernel@vger.kernel.org>; Thu, 8 May 2025 14:30:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dqFrO+71U8ibQ3gpsHV7HYk+y8vT7OVM8bBAwyHrapg=; b=TuXlWv9tZ50cNzlA
	VxNCh8Dw7PETMDZTd1RX4sprzGJ8jxg0iKvbCRrW9a/YGqHM3kfs5il4hh5o04D8
	MNNn5AGiIgiX0a035xPOZLeMgdvR43Hq1RoFrm9KXdNrhq+1VnZ9xbQViUO+UFHm
	tEO7O8zznYIaib8nskpb1HcVoHuqeiowG+GImxBIikz69S6ShSAq/TcT4XWGlOvd
	FH6oZgtd3mf09TjvPxAuQJXx7YF8wRZ78/cp3uYPep1B25zQWEqMP/byaWvGgMcS
	qorxqNwrT6vwM0vu+TdHKpEs8QH+fNiARxSziGbiuW2esQe/0cc3R8AZRoO1EfnL
	AaA4QA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnpghk3h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 14:30:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c54734292aso26217785a.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 07:30:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746714639; x=1747319439;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dqFrO+71U8ibQ3gpsHV7HYk+y8vT7OVM8bBAwyHrapg=;
        b=BoM0NpzIglSoauXoUqXX4ruYvCzWFWx8LnFjVxCMKylkaH2qcDK11Sh9D6TfZnlObJ
         9/bwvF07/vFcveyLX6qF7Mno8IDQ6ROIauGdYWLAqvw5sOzAV1rzSQUDYG0zq70Zz1tO
         v+8UnlCVFNli9iSMqoaCGuW0aiSgswOW15T6sS/Py9SmXwZK9KlQ8DTgdGnz6XIwjIqx
         KgnpN9FKPb/dKiSg5sp1T3i5NNhwgvMiw5Z0GSMgotDATm3R43f3cPVQgqfREZ7SYTI8
         19XlQdt+j1WxuxnhNSIpnkWMd5rJF/cM9nmdTjkp5MC8n01GRF4HMYaQZ2v2HMrvvEAd
         hBRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFwIHWGn6gSYROqjiO//y3aVrJbG4z53q3+HxtWVOOelywoU4pXH4KPUAs9v6BrG0HTChKLaIYoh/2heU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7vCcLQCQcLmFSDmFH7rpRsKzkzmRCLbkhHDb9ZVlPecdRsMBh
	1bNwjWkHxQGU07N0Q68PvvK1/AO8cmbAEyHWJdvTUdYuP9LCG/l6F3aadBoU3V0XAv0UbWTzcCv
	eHjeuUgmMFBuyhnJ4R0lpLM5GW33IB1wUl7tkGqUxxG32XJjHeDK8YvV5g4WaBpo=
X-Gm-Gg: ASbGnctJxgGvC41zxnauocRVhOWNfv2IyeaqMCfvnayXSP8BbhV0dXU2Nc7QbdXegG3
	992A81bhLjPJGmZHlZZHFNzwUe7M//zIZoa5XkbvczS44vabYiYd+NEF1kcQja+ZuCfC/MsbwaY
	3RRY1zBernYiveLw5AQexMjtdjazkjQhOXfCaLDchOI0kM25keP6UBply/6p/vSEfK8qvCiZ3iy
	aq96OvP7AWcUjpYKtPJsofQfbiILudSuvC5uS0fJFwW1dgH7oim9Ko1L9V3A/oWka9mx/IMs+cw
	Rv76DfHMyL18Qse2tDjEA0t4Du9XeOqt1iu2/4zvmEiqUAvXMoLVdy+ELU9o/FDC45g=
X-Received: by 2002:a05:620a:f13:b0:7c5:79e8:412a with SMTP id af79cd13be357-7caf737f08dmr455458185a.2.1746714638998;
        Thu, 08 May 2025 07:30:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFERWPG6KvKc50ZOv48iurNgCUBU1wb1dtfWuaQD0GVFc2xadC8U2UgV9n2hIN+6mOuzpaQbA==
X-Received: by 2002:a05:620a:f13:b0:7c5:79e8:412a with SMTP id af79cd13be357-7caf737f08dmr455455085a.2.1746714638460;
        Thu, 08 May 2025 07:30:38 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad189147403sm1100399366b.13.2025.05.08.07.30.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 07:30:38 -0700 (PDT)
Message-ID: <314117c9-1865-4e33-b7bf-5022869412ae@oss.qualcomm.com>
Date: Thu, 8 May 2025 16:30:35 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] ARM: dts: qcom: msm8226-motorola-falcon: limit
 TPS65132 to 5.4V
To: Stanislav Jakubek <stano.jakubek@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1746711762.git.stano.jakubek@gmail.com>
 <b67ed6c7813fa52cf00b473dded9b5042102f593.1746711762.git.stano.jakubek@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b67ed6c7813fa52cf00b473dded9b5042102f593.1746711762.git.stano.jakubek@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ao/u3P9P c=1 sm=1 tr=0 ts=681cc00f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=p4YvtlIvSzqog-DnsKAA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDEyMyBTYWx0ZWRfX6aSYp8j7v6Go
 t0vVVMrj6i2JzKtSlBv2rzlos+N+3ViOok/Eoq+ffpXEaGIXbFMrhNJHbFT3aIv4IEih893Ucn+
 ofKpKz0lkAgYcJwlqx8vuDvcpkzue9Yw11UJfs3tvJQy2SpGVQizqLs7nK4kOJSxKUq4zMp2aac
 PnnFGdOx4aW2WiMjzTiouOMnTKJdMbCBwFaysJNBfsGyMyKTrbsBASdjhRRvWaF56UqUIFay0fL
 S2+w/Nj75FSqHlUt1gk7BBtZb9lq2FFEPSNwW1w62gY6OyEJZl8VE50in0QTZF0Aw5UDNpjmBbl
 b18uJJarbRMw7N6rdvt2igtmHonf0morFsDBGJxorJA1zdcqOjO7H3ZtNvhv6mWjvoHKvVZKJ+a
 iPch1iXwB+7Po8yfyV4NFEeqfisAI06jB/N4Eoh9IGQk8RXf4SET/47ps0/WfnOsnWI5nxnM
X-Proofpoint-GUID: MVswQ9fAOjfm_nvXxRsS3jHwv02Ksv2v
X-Proofpoint-ORIG-GUID: MVswQ9fAOjfm_nvXxRsS3jHwv02Ksv2v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_05,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0 mlxlogscore=754 bulkscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505080123

On 5/8/25 4:11 PM, Stanislav Jakubek wrote:
> After some digging in downstream sources, it was found that the TPS65132
> outputs are fixed to +5.4V and -5.4V respectively. This is further confirmed
> on runtime through debugfs, the troubleshooting guide confirms this as well.
> Specify these limits as such.
> 
> Signed-off-by: Stanislav Jakubek <stano.jakubek@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
