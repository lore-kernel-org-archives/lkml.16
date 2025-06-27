Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193432E8DE5
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 15:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751036949; cv=none; b=rzqSsv9rvn6b2WgdqCbjbG3zh9omkoUzm9CH548YAJXOmjHVesTS4f+9m50juOWkuW/NVTUz52ZtkUkLX+DbzGIpXOX9/SlkLEXHw96riLNNQFQ4KnujrmVgWChow6k3LeaHI5MXcpAK+1fmehC2YbIOGeMuXBwCPJ8M/XTHFoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751036949; c=relaxed/simple;
	bh=iMZn/aTdSGkvKkFlQS1GAGPqfZH8KYUWTWQbWhJrKso=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qf/srVeOsOiDSR1lewPxACUa0ZkRwJ2kDpGx5uD+cAVbutAqH1PFoCmhjXIy7y6nCjDZyqTM31p1F8QhgQ2gYnI0/XW2bZrE7ynJ00ETX1l4yzAoW4KzDKh7D35dK6GXj4neCcTmE7OxbnF+t03n+OBOCD2RaooYZp8dAqdefEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kkIDuFUu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kkIDuFUu"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RC4ASf028843
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 15:09:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/fF5SH13vrMw8KXy51ozasVmBjXn9MBTWvPmrdC+UC4=; b=kkIDuFUuZQ5o1xkL
	G+WE+dgI2SllNQ5TJqfxVAZfrOi7ScVO07RCvFz0Jjd4QSzW4CQJqOC0j+Kqmaq8
	8iHWTiRcSJnJa68C0TqIkYa+A5JEto1OWb5iLyfIEogAJ8dq7fcbib5FnYM8i333
	MNrkiu+YSh9z+iv6iStYzYXR/XdiIqBU1P+JCnkkrrAuJJ6qxorta5nCO1N+3T3y
	ZM6eOHpyRmkNT4ayz1ZYE+CEjT724kcQtDP+xBD1rXKOg8Desu8mLbutOsSfS1lA
	QZxAP87BdTcZD96mOW7qSiDhR9o5btMQiqYqeoJuHK3A7vu5bvude+gYqaXVeYA6
	GSNy7w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47esa50j3n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 15:09:07 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d09b74dc4bso43859885a.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 08:09:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751036946; x=1751641746;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/fF5SH13vrMw8KXy51ozasVmBjXn9MBTWvPmrdC+UC4=;
        b=G+SCWICIng0MeECA8wL1Ysd3YugzRQp4JO4Bq7ixz4O+h9rofks2FKHURvA6j7q0CR
         NyuG0fr858DZ6JgfCNvQaA0av0dBspma/1FSFI6Qm0LnZZsDk31iYBmR2TEq5QjwbuAy
         acFQfCF1KaxC1QOFc2Hb/0rf+62QZtF9mgCxzpvu2RQpBR4xCAOiyarUdbWeVgN9pFvY
         mD0c6TkxoohhTXNV11HgPYUfXE5lEpVZC+tBiqWIZlNQN5y28UpIPWzD8irD89MFhA9Z
         Yq3qyt3O17e+4YLXaHKb3js4rc87rE1PJ/tP2BNvKSv2MC8GpwHA6c9TF3bAh/1wFLLg
         o7bA==
X-Forwarded-Encrypted: i=1; AJvYcCVH42tDPmuPafv2TSHuHO3grHCoIMQZZASdBZWKj8WEUHiD+0jEmCMwHgaEfYpRzaTbrsj4j0gK4X1wbz4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzU8ZxY3H/dwlZ8l6xUxEcG3BT/TDqPJUdCz2gVRitqA2WmZRQQ
	c706JRCKny5V3XSRqGSpb7KDHCYJ6VYDTm/nX9Q/9Yx03IbGMdfVpe9H/iFDvPkr/8jAtKr+dSt
	TrOH0PiFhAf6IU1h3IO51oryZEhNH1w55BC5zqwHpz336kRhbWAhoYu3ZQ1ovJ1YW+04km8UMUC
	k=
X-Gm-Gg: ASbGncufuICZduVltc4WS+o1bvqPrOv6gztWt7Bkh9p6+KElZ/kEsiMshyTMBT15u80
	o1o9Yqw/gIZOMCGBY3WZ4+Uti4YWfVwH6y563R/Fh2tPcYO/cUe4Ubr38O79vo8cWUc9vKTfYHK
	iojU5i7g3AmLzyrS+qU5g5NmvW/ZB9xilIkwou0CPuKQwyjCpHfLDG+xsiI0jv4wr9ak2NeWx3I
	7DFzs4czOrzQv/39xuj24rZ0Xf7OFi/N+54b/lS6043EXMYg4BUi3YHEJm9fWU/7gVQ2ZPAd1ll
	Wch58jy0+jWRO0L81GU+4E8+7Bj+pROg6yHqFeD1CY51emGqf3X3JA2dX+C/KS8vcaveArOYVXD
	MNzc=
X-Received: by 2002:a05:620a:4447:b0:7cd:4bd2:6d5a with SMTP id af79cd13be357-7d44391f092mr209041085a.5.1751036945710;
        Fri, 27 Jun 2025 08:09:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETw4nn0kGPIiE1WYULEdxyyAO8SokIluvUEsVpj6pE8PQWACUktsCLwBYUcxwsaoA4Q1MI0w==
X-Received: by 2002:a05:620a:4447:b0:7cd:4bd2:6d5a with SMTP id af79cd13be357-7d44391f092mr209039385a.5.1751036945328;
        Fri, 27 Jun 2025 08:09:05 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35365a021sm142492566b.54.2025.06.27.08.09.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 08:09:04 -0700 (PDT)
Message-ID: <42dd44ef-cd6f-4dce-bd40-6f5cb32c5fbb@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 17:09:02 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm6115: add debug UART pins
To: Bartosz Golaszewski <brgl@bgdev.pl>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250625152839.193672-1-brgl@bgdev.pl>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250625152839.193672-1-brgl@bgdev.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=eLYTjGp1 c=1 sm=1 tr=0 ts=685eb413 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=Wqh5l9TQGOq_QAyi0ksA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Tj-YNYrX9cE5fETljYrwhCfe91Zfca1U
X-Proofpoint-ORIG-GUID: Tj-YNYrX9cE5fETljYrwhCfe91Zfca1U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEyMyBTYWx0ZWRfX7VGIXp7TqRZn
 wWe3wmtNDj8AaVOsvJHHmT2mIbI/5sFH5rusBizC8nJR/tWNELU1c5gaqNxD44JYyT2jOWYUREK
 mCGbUjC6+MWtDtbtGkmiGgdGYJ5hO8psvn8ZjCusxcqsCX6oVmf3BACM6l00JnTGPWkmC7dd3/H
 8hsZOPI6vjM04ftgUp2C7lNUP93Qy2UYWhzylTtH9R7EdSzFRa1wny++FDtFV40VyivmaeyWacH
 16PRqTg8d1mzeYTFersEk6x0M7fm29kffFJTKW4Eqy+Z87kBBMtlfNAP51xhKk6V0hj+Ngk4ZWu
 WITgWVvsdJ56pdWBmMzXXimTKyTHu8MIaP3NPaUX2shPJvKL9ZawX7rrAQohn5eAD9kNUG0VTqG
 +lOCNEpyn48iySBUiiSaLThug4d5XmZ+3tCF5hzf/RIBKeV7TC3TlpHYX9QipLZMCIdAJGt3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxscore=0 clxscore=1015 mlxlogscore=916
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506270123

On 6/25/25 5:28 PM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> We should not rely on the bootloader to set up the pinmux of the debug
> UART port. Let's add pin definitions for uart4 to tlmm and bind them to
> the relevant device node.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
