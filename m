Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5346023D282
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 10:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750674968; cv=none; b=mjR0b0hXKt5qZzEHcFDQr9l2kK70Qx//N4nmq9GW8h5D8VnUdwd5Btf7t342k8kkbEK8QhZNDBKYX4yuqiHyyOo+kvxnmf1E7z2otIE90EuVZsCOvjKdKoUfa3VIi+zfRtIztJgsfzdSTgaNWuDGBAoWX3mAcZ8/KTkYrB0dxKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750674968; c=relaxed/simple;
	bh=ZGrdGD5S4Wy80BaqqmqkdCLyn23usLGumrbeUKa2VKA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BSHCdCXeO2PG0/mhuv3RM2Xu5pgljbfUNjfthXnQWh2XDp4DUoZaVPhqK+/b5m0i5l3ne1BqFH7M3PysmnvN8eCsUOqdeaOdJHV1ZLkYtn8UjHF7mpB13izXXkF4zyzdZtT0tSZyY1XVXhRwfHTOYo+xF3jBL99eh0cV6XTAbUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F9jigie2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F9jigie2"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N9Oq1s012665
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 10:36:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4GfYaxSuIzxVoUOK/O4NdD4H65yMossNv7+zfK6HzMQ=; b=F9jigie28s2Lm4G0
	JUcBqyW1XK6nCWusgni/AvmZGoMX2uSm6ipLZ2DwBGahnf683l1+hrRQso0xQkFv
	I7hoXhosNdUfGFlxjJBQuz61y4f0HaZZwrblXx3zCpbCY75Q/UYtOD1OHXCK/ZlY
	TysXKwrXnytPf2Ziv/8I9gr+PGx0FDsD/5btgAMyzXmwMkLzxL+91JIW3sEiniCh
	Ut6CNb/J+YjXNRocVzqWfruYkIgOrTQG+Id78CFIMYl1EQgXqi1AYsFSAw/Mzed/
	vBgQXL7E0LycGw3VyjvHlmx0vIPzw2oiPe+RB4kBdgNy+zZ+6wNx7QVBZePoH37R
	lexKKA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47eud09fp1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 10:36:06 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4a5a9791fa9so13447151cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 03:36:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750674965; x=1751279765;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4GfYaxSuIzxVoUOK/O4NdD4H65yMossNv7+zfK6HzMQ=;
        b=F+dCTAmabXuNnF2WW+VS/Bml7RR4FsujYsDnVMBAYJBLzIVgVCVG8S9iDEQaGhU5Je
         AWKbGZLJQXRIA8/lA1XmPgYMnYw+8puU6e7maAAADPmm3LYptf0urJMZXHfUwu7WTzRO
         R/xOhH7qw2pWxE4yqxhWyZQ36LIEiw4IVKhCBjMwt68kELwG26AKHoJ6/yIBq3C2hONO
         UH/ftpusx+wE4Ku0sLGB/6Pehd61723CtiVquup3iO6cvubsbNbZjw9PBbdiGHdvfh+D
         c7HJuEihuX1Youo0CalOINC6xt+kwpCHy6oR9DXzaK4HeIJs0RgbQZd8ynR030QxjJkM
         eDzA==
X-Forwarded-Encrypted: i=1; AJvYcCXbmKWMORvQmE29bXfMHHyuJF7Lh2eu+UuQz4Uo5kA2QikOFiok6ZsNowHLf2jOlrrT50FBCsExkFriXxY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdckhXJ2QFPIjObkJFwAvrLgW6FmnLzfmIESd26Fn8eEMdOix9
	XqarRWzEqrU4RtEvF4hgtSWsj8Omd/PckL0YxV/cRLeecq2fgH5bfj2t2Emj3RypwLTWWbR1vvo
	8E/SC5mGn5u7cYLqB0l/khUi0eP5yXHUh56OFkZ3GH9mqQDhldTz8i75rweteKf7iYoQ=
X-Gm-Gg: ASbGnctAmFk+XM0EoHMyOxhU254K2u1wSuSgdOLlYl6PLJY7PqKfgsZ1e609H0JP3nM
	Xko3fu/rtmUOjUQq7wSVKkq21q576FPISFE0ewvpcJNwWDj/fK+/HYPDhJ28NkIaF6v+U+4/xb7
	QonD9cy8uyd2ERhmGN4QTaNPG2KpGPUuAkwW9ZdFgDPJ93pWuuFTbqgwOfbznhAsXc+iWWlCYTy
	IkxwbSgHmld1E834+7z4RZEip2UMuqKKixshEYx7zJcCoIiJN0eaQeqtYqfF4wB4asRoXj8S7gV
	GV7ZCYL9ZSwS1K3Y4xbOV1TNyjlZ626PH4NEsaSJQ5MLYdDt9F2v2m4NizlXpHUZ0kHFRm5UfDR
	fl30=
X-Received: by 2002:ac8:5885:0:b0:494:5984:1022 with SMTP id d75a77b69052e-4a797ede8f2mr29221701cf.11.1750674965129;
        Mon, 23 Jun 2025 03:36:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUp42df1AyK7Fldxd7syMMacQxRLPJ73fL2nISVg9GUkcQPMWOuG2N96/HmW8znlbsAgOkLA==
X-Received: by 2002:ac8:5885:0:b0:494:5984:1022 with SMTP id d75a77b69052e-4a797ede8f2mr29221471cf.11.1750674964665;
        Mon, 23 Jun 2025 03:36:04 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae053ee4c90sm698271566b.62.2025.06.23.03.36.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 03:36:04 -0700 (PDT)
Message-ID: <00e367e6-56bd-4ce6-8a1a-d74b90609a7f@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 12:36:02 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] firmware: qcom: enable QSEECOM on Lenovo Yoga C630
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20250621-more-qseecom-v2-0-6e8f635640c5@oss.qualcomm.com>
 <20250621-more-qseecom-v2-3-6e8f635640c5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250621-more-qseecom-v2-3-6e8f635640c5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _BPqeRxyozcJ6-3y-Xx1jshQ5tNzILin
X-Proofpoint-ORIG-GUID: _BPqeRxyozcJ6-3y-Xx1jshQ5tNzILin
X-Authority-Analysis: v=2.4 cv=eco9f6EH c=1 sm=1 tr=0 ts=68592e16 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=_iSA65KrAhrjOTfTvEcA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA2MyBTYWx0ZWRfX2WZFtZrUMYPZ
 SWhOHcWdTDoPGoQNoIUmA76K7kq85ihhmk5IQMLGZydoB/cNg75uEaCCzTcyz5as0gcrLwnr6if
 MFzX9x1T3gcJ5z3hbIcJA0FSrLcBcgsdN20XZrdelO4oGrSMBXh5F3Bq+ZCikxTkKKzYDo+yTkB
 Brf8MSUA++oHxl/p36hNy0PGZ4s9OqhPEguSaFTiiTNAKvRfriXaBrNAhCdZokw4qGvuJz351If
 8qO0p7b/YNFnjndk14DUGhOW0oL4DP2WFyJREfAhjRY9E4zsXXZBfK8VSlx4bv27n4uA7bgxwWt
 3oYuOm25C8/DIVarg/eSYpntiVA09hSMJLetkCRTm8qcgdFJ262F/eYqzrhpQWZj5qXYGmg7fvZ
 pDFZV2k08QUei62xT8jnvx7SpLUe1G/nvRAKdkkNq9GVSA3jBEAhgyLMfT5ds5K+e+3JbXJZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_03,2025-06-23_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0 adultscore=0 clxscore=1015 mlxlogscore=785
 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230063

On 6/21/25 9:56 PM, Dmitry Baryshkov wrote:
> QSEECOM driver end UEFI vars access works on the Lenovo Yoga C630. This
> platform has only one storage (UFS) shared between Linux and SecureOS
> world, uefisecapp can not update variables directly. It requires some
> additional steps in order to update variables, which are not yet reverse
> engineered.
> 
> Enable the QSEECOM device on that laptop and set up a quirk, making UEFI
> vars read-only.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
