Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9F228C03F
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 20:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746736884; cv=none; b=A58NQW8Wk0h4Xj/8oaoWE4Tnb0St5537CDT7ZpQsjouL8RGyaFLpwJa7SMC+G5naK6CBArv2KNZw82b+xbzM6QSUcMDJHG31I1zhvH/iN+eDNcXt88CsaRyW9glcbrS7edDnjUt87v92M4yxBAZ3xD0hqYgqtUugcDK32nAUvYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746736884; c=relaxed/simple;
	bh=QbQbInT28z8l5bMaj93I+MSq/eE1z7PNcWBODFwxaog=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jJTYcW7K0D7Gy1Qr1u9AN/lNYCWdZq/iOGeF8N3DC0/O4kRJLUYjpt7kgohWg/cD83KlJsZqrl2jmIcvIeJ+wtsdigYmfR2Qow60WNoJoH9B0x4mEJAC5HoQ7So4bECwZOBjWM7ryDSrf3LqfHPRO+JyVHRADVVljK3dqfh9Iqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fvs6oQQY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fvs6oQQY"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 548D0KH9010675
	for <linux-kernel@vger.kernel.org>; Thu, 8 May 2025 20:41:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QbQbInT28z8l5bMaj93I+MSq/eE1z7PNcWBODFwxaog=; b=Fvs6oQQYRHilLitm
	34io+n9UO4rUvBOKUB7nxCA9t046gAkqXD00fsuiZsHacF0viZUOWqjH0QueiUNW
	DOxz5zMb/5bqCLHp9AJQz5QceT1coAvLJtYETJmssPMWa0FN0wV1hI+MGefMTHNq
	ij6bD2+qJml2kCEx5KSEzFjenU3Gxp6fd+e6apcWsgaMcGV8WZuyGU0uqEVuWnjU
	z7opC0sEF9BBJyv2UiHbAwS8VdniWeyNCkG67+C+GZboI7RxCf99HC8XJ8ZN9ab/
	hNJTBbTEVoIq8AekA1IpSejkE12kGqYRV/xOVV8OchtpZncsyxVYvepYzyGp+Tvr
	IZVEOw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnpmjgp0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 20:41:21 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-742360cec7eso435124b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 13:41:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746736881; x=1747341681;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QbQbInT28z8l5bMaj93I+MSq/eE1z7PNcWBODFwxaog=;
        b=jYIMOcwXqiY0GaHPtO8g8FQeXYjbl5eYterkhVNfwLQhW7bBuQxz6gjyDMSRo7les3
         /B8whSWjF0MTjuCeLnwAdkG1ZJf4CO+PIwvlVJ93vnjcdvcL0gKhad2OLbZLTr61SnYL
         0Z/LA7RQUhmfTTqHB+WhcAnb7sdBQe3vPo2HDea9Is/ZSAAq0Waqk71pB9ryVv/abSlN
         IDQ1EiDY06nYecWSjnfoss+wHPD9oMfrBNJCgpBznXhAs+dqnEqeQ9cfMDvcmRP8qE0j
         JD70b50XVKqxACmC6V5uUD2Qptuq6y4cH4DVQaw45o4KCu91kKQmCBY83ZFYDZk19hzy
         cuSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWoiK6tljmFdTRWJiM9fDKsNOgAu4QtlNnyG9eB+kr5sVAS0KRBBLOqmIjO9g9d5omebXn8BXhIHIXmjos=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrG2/UyEXuteKkQSbRr3oyqnyTE06ZJOeWjb/swcIBaI7ui4jn
	YZi6f+ny7akVEcUqN3cVcp1fJuDbtH36A93y47cwkOYXy5ChwGPJ7CDJYmcHEMSzP2K3rGA+8qr
	kWEBzjEcFpVtwDuInerv90rWkj3uJIFXaIwRd52nC0/QpCxr95F2w7dLIYJFu4/g=
X-Gm-Gg: ASbGncseQOc/4vX1bTE6+eT6V0ckkSqm1HnfEIbf5arhxwIP4aEax+e2BiAqFaKqmCP
	8tdo4oHNGLb1mL9gX9zvl4ua1Qx0QMoTHT9sHsXJd1E/omdfhpgSPVqWSQg2nlJ3QSZT4mB5Q4l
	gtDwkr728oIXK0pr0/451JPwXGVA9Gc/1Ve3SNoQacVJG+CrYIbqJggI/BaT/SGfm3tRKXzFlaX
	yEcQPsflqmDME/XAEtcO95R9LSsRzMCI6rADaHwkojT5PCMH3fzTUxN9bRE5DXhFmdSiPhcHWlZ
	lR9q5jB3YntDWFo39xwNJjj67tjJZ5AA7cxASmY0XY09cb0h5rTUXrIfuA2MC/aESUg=
X-Received: by 2002:a05:6a00:a387:b0:736:4e67:d631 with SMTP id d2e1a72fcca58-7423c0847cdmr802796b3a.23.1746736880846;
        Thu, 08 May 2025 13:41:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEprAh+upkBqZbr6AvV6R8fa6aznVOqLH7rPSamRDubjAMwRZxovE7CTUHUv5Q3UkygrNcxiQ==
X-Received: by 2002:a05:6a00:a387:b0:736:4e67:d631 with SMTP id d2e1a72fcca58-7423c0847cdmr802768b3a.23.1746736880454;
        Thu, 08 May 2025 13:41:20 -0700 (PDT)
Received: from [10.71.111.209] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237a408bcsm467404b3a.149.2025.05.08.13.41.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 13:41:19 -0700 (PDT)
Message-ID: <8c6a8e84-a802-442a-89f5-a99261761d20@oss.qualcomm.com>
Date: Thu, 8 May 2025 13:41:18 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] dt-bindings: arm: qcom,ids: add SoC ID for SM8750
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250508134635.1627031-1-mukesh.ojha@oss.qualcomm.com>
 <20250508134635.1627031-2-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
In-Reply-To: <20250508134635.1627031-2-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TpjmhCXh c=1 sm=1 tr=0 ts=681d16f1 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=J9Vk1PX46GMNcKasQmoA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: cNOffeBjSPHuP6wU64FmoM-kCPQAi8js
X-Proofpoint-GUID: cNOffeBjSPHuP6wU64FmoM-kCPQAi8js
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDE4NSBTYWx0ZWRfXxptUZXdBBNGM
 waK9aZJCUQppVIbCB/0qhAnKcQy8JJCpWCgykiw0i+ITu7dRkBLiKE3I7BQKNcEFkqVjP6QAxLl
 IWVuF7k/FtVkitFxzBRlCfT3ZBcc03iXCWKN0rtg+Knw2ilnBSSJbbgSeASqRa1VcbCo1vxyv7R
 R5QDxCir+sFboGLl5uxBo8fnwUVyOwPIV+M0Qcw+R7iyM5lOnVh9F4VVGNnLBv13IzL719fVcPM
 k8uhXi05ccIS0X/z6mEOWHzYZ8pwdeKSNYBvMQFGiZEDwEA2VVgqipeqFRz/u/wSEcB98Ip3hAJ
 5su3GZjhCmjtrRGDmwF6O1z3ddkM361rNIWIQZVmotNnUA70lGVthqp250cckSmb9C8xW/iM+Si
 6FAicr2kyXEIZ0BfdACHhTsPsy3/BtdaOA/zCpn7dv1n2qlvIt+Wh6zF0tY6oSBE1xXvAL4W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_06,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 adultscore=0 malwarescore=0 mlxlogscore=666 spamscore=0
 impostorscore=0 mlxscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505080185



On 5/8/2025 6:46 AM, Mukesh Ojha wrote:
> Add the unique ID for Qualcomm SM8750 SoC.
> This value is used to differentiate the SoC across qcom targets.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
>

Reviewed-by: Melody Olvera <melody.olvera@oss.qualcomm.com>

Thanks,
Melody
