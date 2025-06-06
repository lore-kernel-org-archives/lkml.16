Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A8820330
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 11:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749209588; cv=none; b=m+ZiFMgtdZto+LZpH66xyWb0V25SXGyHLrdEB9GbEsbJ4YbZ+VgqM9VWew0t9/G4SeKxbpsKbQxAfPK1QSl8bhmADh5cKz/PJ9j0lAh9ywPdOpDy2pBTY7/A3fykvj7y69MbZuomDkX2/wrvlYqOXFoVofIOHRu6UsKbBYmf5Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749209588; c=relaxed/simple;
	bh=rjq1RfB16uNwsEaeeDKPTE1D7mp2xB4/K2KeD5ubBp0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DkyScBCtbAqpxypNYnXbZQBADuJKXjxpqeVI4mPqsi89SjNzo1SGwfLkYFOXyQtbJcQsb77BxVqj7JoRSpEzckWnG8ACtv1qwsdUhcqDMhMvCCEqD01+lX9cLwy8tjEdTckot6lJbCl445htTVytPVki1lPriWjO+5/ym9pb+Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AvRMOeek; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AvRMOeek"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5569sHtI006499
	for <linux-kernel@vger.kernel.org>; Fri, 6 Jun 2025 11:33:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hBsVUSV4bS/Pj8To1O6ismeXm6A04KaflnyzIZ+5dok=; b=AvRMOeek5EwJU2YB
	0fyP/4clx+tIreBlfo30vhV6WzpoZEFXv0O5iVcSwLbb78v+srVl0kMSKf1kGmY5
	zvXTpd/B0JpsKkLWBcuq+Ah2ZxATf4rVEunFlzhjHHgBDW91jTUS7wY1KSNcjAMq
	5FloY9SaMTjP5qiomrJIuXu2w0RiFdHGXd+UASM6TtntCY20EWrL5VaUmUDERLDf
	oHHbDlhZuPDulg+ljh9dHBx4Cq4XZepbv0+qAnQ7jUYFm7ywrun+pAzm+z1RAvmI
	gxyWfYPFS71srhJlh7iIbYWO+EbQ06TLejh54jKqGJCiU0aTt34QwFpaZEAnw2o+
	y30SYA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8nvddq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 11:33:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d094e04aa4so44714485a.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 04:33:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749209584; x=1749814384;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hBsVUSV4bS/Pj8To1O6ismeXm6A04KaflnyzIZ+5dok=;
        b=RGJ2XzXfeVDc50wfnZAtAL3COhmr6+K6OxUB8HMpDoBQqmHE9iGesi98EO/qKEhI9w
         ykObBKd8EXN5HFHpotwJYLJcjSEYzkZcjwfDVva5RBqGVQJkklRbu3nSPD6WCAnOY6fY
         d6Ko5z9nMETmnAs14CXw09fbyNqqV4GT6vsnT+vv00K/DyztpVTtHRuCpY8HwfkjvFh4
         3etqoqORNx/pEEpBs/wMBM0+GZcrj+NL2Ye7WRCDliGab4oSjg0mBBkVnA9HlnAl7vNp
         2IexeWJ2F9YviW8Tbr3Eigt4WhvaOCzrGvgqNdCwkItRgIdzdLnw0+vMtyIbXL4XGPgk
         G7Ow==
X-Forwarded-Encrypted: i=1; AJvYcCXBi/VjwiCDDyWqu9Z3DtesK/Umi2h686CWzEpt00ehmQScleSrh30fGrM+PJOdOL1WnP9eqPgKdsK8qxo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHJ2N3as9wqqY5xvXcLNG4KS961jqT/GUqohKPq8ubWj6yIHwI
	hiIQ4f010L4swKpOggB+Bj/EwYNYVcz2OPdxFiyFLN8vL+8jJoTkauu7VUOYfCvuyCAhJ/1sj5l
	pO2HIxwGjMlxw1DY+dfMOcOYAqqNU9BUSUlq1zYq/GGEOgspgy1/MBI52eNK4iIJhW1M=
X-Gm-Gg: ASbGncuW9RSOZcSp9k9e0z1KkYKRPGqtrzYc7DKgvGeRk01T79asMAzUcf2W8S/0Nw4
	memw8D57xLMaaThNOPEaqhXcNv4XaYklMDtIrsMp0dxboimwFa6tK7SkKdx2ZDR+z3ZguHQBBTA
	f9+7DScaqY/ORuvGw6cGCmKankH1/DkbBv/a2oDzIXqzAj4pyU74VKAIYIyCaTtNg3hKY+GwT5f
	hyNljOdns5DKeAbM4AzpeNM+ddXT13Jol3u96nUzF0+vuf4fKwPZYCtTQv4vJOpm0MxSWzcklx5
	mRKV2LJHSlvyxCm3hKu+O4jMLlU+lYnQ2aXR8m3GeaSPOUCP8N572RBp3VW1U5D/bg==
X-Received: by 2002:a05:620a:410e:b0:7c0:add8:1736 with SMTP id af79cd13be357-7d33df1fe47mr93551585a.13.1749209584475;
        Fri, 06 Jun 2025 04:33:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFkuxkZEdiQyqedab+Vm7k2HP8tSudyEGg5/Rxa0+D0cherRON5LyZpShuOvPOo20kuyO7SzA==
X-Received: by 2002:a05:620a:410e:b0:7c0:add8:1736 with SMTP id af79cd13be357-7d33df1fe47mr93549685a.13.1749209584031;
        Fri, 06 Jun 2025 04:33:04 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-607783de2bcsm873720a12.68.2025.06.06.04.33.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 04:33:03 -0700 (PDT)
Message-ID: <05534fa7-9479-4fe0-85bd-0dca5541f739@oss.qualcomm.com>
Date: Fri, 6 Jun 2025 13:33:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: qcom: msm8960: use macros for interrupts
To: wctrl@proton.me, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rudraksha Gupta <guptarud@gmail.com>
References: <20250606-msm8960-irq-macros-v1-1-03e573ba26d6@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250606-msm8960-irq-macros-v1-1-03e573ba26d6@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: X9z2UlCqVK5CXQPA9tRI9IIvlS6K8K4U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDEwNCBTYWx0ZWRfX3G6/b7SF0yFu
 ojMZj9sgeZ54Dgwf/vUtEA6avYRefh8JnJjSQAdyiqO6oPKY8ijyy2rGrnrTgQ123oHJgzO+zog
 xgvEK82fkXpIqcTofFFQ62UW5jDcFEFos5zq9wtVisRtHPxdXvDR6+93rt603OdCJ83ex3hTsUu
 ai6Lu8vycY11XscljyiTalt2v+gaqZDDw9ewe7CbZjx0XEzKyeTJNg39bgqQpznKMnvcQ7wlfrp
 zSBmIWukOVJi2mff+zG++D8peMqahibBm7bQQyNSKAzAGflzaZJW39Z98/vP+0C9LcSARt/Is3p
 gDg1oCM/WA5QyC4hhD4hG+ROILZg7X7zWvsnYnVh9AIiJXFr+TwAdnL85OaHCL9RVNNG7an0yEq
 hpdetG6lGEoK1jHFFTK5vmDNTc1vbZmelgwnP6FHuC+fQB38TARvAxB3holC9rAjWGLxELll
X-Proofpoint-ORIG-GUID: X9z2UlCqVK5CXQPA9tRI9IIvlS6K8K4U
X-Authority-Analysis: v=2.4 cv=UphjN/wB c=1 sm=1 tr=0 ts=6842d1f1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=MzN8uu8svZ0T6_zCNRoA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=lZGKyyPKw46fRox7ShMU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_03,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=685 clxscore=1015 malwarescore=0 adultscore=0
 bulkscore=0 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506060104

On 6/6/25 1:03 PM, Max Shevchenko via B4 Relay wrote:
> From: Max Shevchenko <wctrl@proton.me>
> 
> Replace the raw values with macros. No changes to the output
> 
> Tested-by: Rudraksha Gupta <guptarud@gmail.com>
> Signed-off-by: Max Shevchenko <wctrl@proton.me>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
