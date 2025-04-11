Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02202279353
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 19:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744399535; cv=none; b=HWiGs+pz6VWJcKxay4M4OjCDLe4vb4q4wt+9A2VTlWAtmv5WleK0YrzZvmPSPuI10xOt0GkXKd17/hDImT8D2a2OMyXO37iOSbT6RRnWsvj64jRbiDhcK8/W3T0tkIvYnhULh7K8btpty+99Sq14COvHLIMipsgB8OHKaASkFys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744399535; c=relaxed/simple;
	bh=V0anQo1rxh4XE0m3zSwiP2GeM/s5e9XDDcmvcf/l5VE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DBhq6qdtO0LTV8TjmXZyT7pLFCxYAc4eCnPmozeAkO7TKF5TSX2S8XQe+a80YbK4zWaO5Lw+Y+m6dBDV726aVlhr+w3VoaOqAYFj+RTg2E+WwPUbxwJj35Ga9RueGuqqXZrPumSmmcYE/lg2qnDL8FzbWHk5kNxwsiogDQbh3ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VPdiGdvk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VPdiGdvk"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53BFSfoB029696
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 19:25:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9VH1A/ujECFcwD3gWjS1rTnxfuwqzakJlrQs995Lk7Q=; b=VPdiGdvkv8QNnVKt
	wO04rHDsWbvYpPMLw9gKuvhUH0cXMDbMPlvZfzIjMj0wTSjrs0CjQDjjUc9NrrJz
	m/2OpPyY1vSROvok3nOxyGp8Et9FKyDz0gUxXYXtnkPqF0cmn/lwmrv2UgiWykzv
	sDiVg3+lflMjvyWduFzeASB8hie0tbq9q3YqbeSYX0jZ6tM6BlmezNZTpyn+yHzP
	hvorOf2+LxgIEyfvu1L0ZoELjhAdTs3TOgFmLQFxe1Lntdam7n4X6oHOVMS3Ma4T
	isyWJehBv3ZFya9VD0NZS6cQVY3uEiG9wAWXFX3WIyDMQZT0tncUvYP1gjRih1fp
	Vee5oQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbuugpt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 19:25:33 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4768b27fef3so3569701cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 12:25:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744399532; x=1745004332;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9VH1A/ujECFcwD3gWjS1rTnxfuwqzakJlrQs995Lk7Q=;
        b=Mg68yFDdEAYoQ0RNnOejxqc7btn8dfsNtJ8xRlUUpia4UC8q5Vxqn0uELEZmhpZc70
         tQQLGaVgXhUxQQp/xHsDYRzo5olriQj73jtbGDq/AW0AlTWdI4WvVzIGFHQKRQeQQkW4
         rk8SG8GOZ4nZ+p7M/DvchllsGzFhPMMtuKLI1ZOYqL6dU5NqYW5XdEpoy8qGBAmg3vQu
         JPWmKygQKTFsZFif9HmvKMk47cs12Opht3vF8zEhrsIDqw2zZxQFqiq0x7wEzmQz9KUD
         o/Dqa42vv9MMCzFt6IfZA62aLQlOQY+tDFLgGrzUuuY6zrZEDD5mO9FNkcRw9P/dMLgf
         mYWg==
X-Forwarded-Encrypted: i=1; AJvYcCWBR2gM5OU7wXnQNHoWKJlQjpw1gmLarvNh1VDPiWglOcgQe/80Y5a3S7+TOtwGFcur/Icc1z0kU/zkC1w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDOd0WuN36ca4T7Cz0+wA6LrGzqwIBqijatnQnU4YkT+nkBu6p
	XiGzBjCbIpIgOSX/zY8X2+9vWlMDlIyKlg+aY5sKC7KcSES6IJIwW5Faw3NfKZ4ar9BPHYORPgu
	uqD7a89Mp+1bMYi16QFbortjC52KUdpdDh3cBnQ9OHPOuZQAcfk3vzH540VM8QsA=
X-Gm-Gg: ASbGncvCYgrQ4qGz6IX0mCER8JHOVQjT8+5nmVTYzzfFBSMogAP2/KwquSHHy+C4gFY
	HgX54MlmypTeBOP26MB8ch+xIREA/KSkPdzG3t+LuoBF7qOWwkr31Cl4Udq7JnZWXtI02K6wy/J
	L+EWBG8jbFQeDu8t+nEmVn+o1IdcpQ7fleNb3TklkFriiVjWmhyv6N8ZHkks3hjT6B9wG8bDhPq
	+LV8kzfpkIWSmIIY0MnADg93xcvIx5P5o8udD6ATEAztEam8QEbfLVgQpgEEgh1yK6XU+ytbs/k
	ZVezH7Ah/Z/BovODLOUuZd07Q/tyM2kjzRAqtShnSp9r8sH9miwO5bdC5f3lFM6dFQ==
X-Received: by 2002:a05:622a:cc:b0:477:5f29:dbc9 with SMTP id d75a77b69052e-479775dcc97mr20980091cf.13.1744399531816;
        Fri, 11 Apr 2025 12:25:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0GkTYT8sp70z92tpLERChqQZCSLS8yHt/ASTJmtZUW7ReS3382lVpeD20MinPQfD0hTs2nQ==
X-Received: by 2002:a05:622a:cc:b0:477:5f29:dbc9 with SMTP id d75a77b69052e-479775dcc97mr20979941cf.13.1744399531497;
        Fri, 11 Apr 2025 12:25:31 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f36ef56e54sm1390299a12.18.2025.04.11.12.25.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 12:25:31 -0700 (PDT)
Message-ID: <e19eddd1-0911-42c6-85e7-a9fbbeea778d@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 21:25:28 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x:
 enable MICs LDO
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
References: <20250411155852.4238-1-alex.vinarskis@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250411155852.4238-1-alex.vinarskis@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: U33KibD3YB4d9nPMRGa_d7rofjE3qup0
X-Proofpoint-ORIG-GUID: U33KibD3YB4d9nPMRGa_d7rofjE3qup0
X-Authority-Analysis: v=2.4 cv=dbeA3WXe c=1 sm=1 tr=0 ts=67f96cad cx=c_pps a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=pGLkceISAAAA:8 a=I4MXn53k6lXHh1bxTIIA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_07,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxlogscore=907 phishscore=0 mlxscore=0 spamscore=0
 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504110123

On 4/11/25 5:54 PM, Aleksandrs Vinarskis wrote:
> Particular device comes without headset combo jack, hence does not
> feature wcd codec IC. In such cases, DMICs are powered from vreg_l1b.
> Set regulator as always-on to enable microphones.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> ---

Can we bind it to the soundcard or something, so that we're not leaking
power?

Konrad
