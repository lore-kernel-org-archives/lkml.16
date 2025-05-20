Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F4B242D84
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 14:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747752337; cv=none; b=p5J8CgfCTR0LvLf80lnSgMFJylWY8+s6lgsmw7zL34JAZTKj4WFYRzBS+4xjE+sfJwUzD/BzGYDnhkCGVpnI9xwvzAthn/SXeJuBasfQAhOARrM9paL88A4GYCGos60JhN5TLLw6Jr3SbAjvGSVtF6AhFel27rhmCp7i9zH3aW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747752337; c=relaxed/simple;
	bh=AhpNTohfkxb/6HCtk/2e1VKzunmWW2d5HeDbWYTrHCY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PoYW/dNGcNO6VMWlq/T71uhI9wSkooVOWvk72Zf39VkGL+HWKym0WkPNoZp6WzmGYsjs9Say9YBxIqhHwIPa06uY1zdtf3dv9xl2eKaUFIPYpaNrNTKGIH7EuHpSoXeR3mf6cENfCrnHD4nJADybqDzGmGPJCkndLFV+wy//x3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bAwQZIKV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bAwQZIKV"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KDjw3M022850
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 14:45:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F+UYVkRq7QWAvs/4Psl68WMbM9V3F5w7kl8Oo8qj3QE=; b=bAwQZIKVGRjy+y08
	agztzhNXUygFJYKi4dG8FcP9GA08H7BOQZ3vuq4x83WynM52cZoMHGcIJoFUvYXP
	OX6kv0tSz9WkFavzxTVAq+CYQk+LBPxWQRVbPCEa0hB9pKib201ZVygkmTYSYdeJ
	lLuyMjdqx5FVe0ilJ8H/6ORr6k4UMfIxgV37qr7lmmSvGw+K+7SvtgI368pit6lE
	DXEwLlW0qZdCzKKRIJLpU90C5ZTjoRkf8xR87TglFqQROazOvhHAi+fmKlKoJCRr
	kyeoC0femN2IUnupGSlgaOjUWS1Ko1qwvlaT5wbMYGmXUyGkb8BluDa/FyEQ8dd9
	Y7zdRQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r041vpcp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 14:45:34 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f8d8f77d4fso41323276d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 07:45:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747752333; x=1748357133;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F+UYVkRq7QWAvs/4Psl68WMbM9V3F5w7kl8Oo8qj3QE=;
        b=G/2P6KT1UaHE2FpuMDdGlVkvmradCWgTJCItFUE+Z+2w16h2hZelOs1Hu+WsPteZg5
         3QUTad1G/ZUaOYRXw3NVJ/6R5QN28Gub8H0znWoLYwEVf8ZZKjIkO4btJURuccjL86Sp
         R+3BRbvPkYTzSPj+BxkUgFYnN+iXw/JqX9v/BVi1nsL23L6mpxW/dWh3zeShG1WDevkQ
         wQSEAnOVEeSaze6MyrnizJf++BQ2YKKo80W7B26sik7e3O/4hbtV1bzmX86M0jhHF8sg
         1mf5slm0cFIlaS8NGV5TZoXGCeOjp7slxDYvJv8qK+6Dub+45omrLVrwl8WRwRXCTTbO
         uXlQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1wXgwoLrH8SMCbKHDOtW3tUy3q0MfyBHxFZs7k7fqxL1ApgAoLQ47OatqFDNpVB+mYXpp4Z+/gp+JTMs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJbxnGOSqOEkEmXeyQF8zcDzZBgfOcEIr7ul0qES7OFxgjDSg1
	OW0wNpTuSHVG1pCwcigG0IG52iL5msb7NliTimXmqYmIdSHKRL8I/h6zvHBzn3e21GY3As90y1i
	FvaVGS/m2qwnGMJJVZXpvVC7w9GB+IjCGOIQT/IRTtfKTLxyeep4yDtKj7x2Kv84sRHE=
X-Gm-Gg: ASbGncv/a+04gGAgbhS8WpuwlCuqK5sjntah7wP8wHu8hOhfA6H4R8Zd50Le62dMYcH
	IeilmjQRBHyjujOnr0j3WuKFcS8hoTk5lV8OeS7B4r/zJw5ehBRzM3IrsbLsNkxlFj9Gjl/akkD
	nR/yKcTZZ00YUXDS7fP+KyL1qrt8ie+Xy8odM4QO/Off8rb8+sEDJ7wcg+Grtc0x2Q26zY540GV
	8glHe45s6jwghCttbvQR+u84TFlGU85VRL7iY/n/9FpbYYT4BXq0LxtNXQFXNwl5ob2Wzvif7v6
	cI0jhayXPpzSEJj7KYyFlKdUkZ5FgBfMDK/5nh592zFcask9jjLA5TtWRGQEJ58tdteQ
X-Received: by 2002:a05:6214:21a5:b0:6d8:99cf:d2db with SMTP id 6a1803df08f44-6f8b08cfaf2mr302480706d6.38.1747752333372;
        Tue, 20 May 2025 07:45:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgeJAE3OlzT6P01yBXck+LegPxtMNuwI1oL+8K4BLsmkQnugoNimzkxj/J7I7mt6VdI/ZWFw==
X-Received: by 2002:a05:6214:21a5:b0:6d8:99cf:d2db with SMTP id 6a1803df08f44-6f8b08cfaf2mr302480276d6.38.1747752332995;
        Tue, 20 May 2025 07:45:32 -0700 (PDT)
Received: from [10.153.41.224] (176-93-133-115.bb.dnainternet.fi. [176.93.133.115])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328085d0dafsm23934011fa.109.2025.05.20.07.45.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 07:45:32 -0700 (PDT)
Message-ID: <22c32283-768d-441e-b392-bd59a102f000@oss.qualcomm.com>
Date: Tue, 20 May 2025 17:45:31 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] SC8280XP SLPI
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250517-topic-8280_slpi-v2-0-1f96f86ac3ae@oss.qualcomm.com>
 <aCr7UzmK7XCjpsOx@hovoldconsulting.com>
 <a49df292-dcc6-457c-a565-984887687341@oss.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <a49df292-dcc6-457c-a565-984887687341@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDExOSBTYWx0ZWRfX/2iqQTeTEOEg
 /QNjax78sfFBV4crV3an/H81zkLB0epWFMVPWWZRPTa69h175hDf5luuxQlMgXklVVHqetki6m+
 DHonSgXTcTGjCYtmqmOXUMb3aEbU9ZP0he45pj9d0LxnKiY1QGRS6mSkFSKSJhsbnvM8NRoMVTT
 L1JoiALsotHmPgzLPao/+z8vrvhU9WB9TxzQbYGWuf8YEv3BppjfNav3N4e03zIt8hWbpIQbkjL
 y24EylpU5M3mvP3OlNmMmRMEDeAWjM1rurQq7AdTwZz4JhWnzEcR3d6J9vfLxU7andRGEDaanXN
 MPNFe52lcG4eP+FGqg3Chkb6TEPxMIoi1Biuwu+PezobPsRS/MdOG4ny/ErZFFPNZ9fbgTSIfW0
 NewjMERObVW7VTRsa7WI7NDwdA9M/+YTSjsqcyYgDbF8vG7P/E2CsGK3o3sah/Hu1QsoIZ7l
X-Proofpoint-ORIG-GUID: 3KAzeQaPTDG8enqFe7jAIrgxRtUXGByW
X-Proofpoint-GUID: 3KAzeQaPTDG8enqFe7jAIrgxRtUXGByW
X-Authority-Analysis: v=2.4 cv=HIjDFptv c=1 sm=1 tr=0 ts=682c958e cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=wJfVPMc1y4yLOrLMgEZDyw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=6qslIKx09P05B-qpR40A:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_06,2025-05-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 mlxscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 mlxlogscore=836 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505200119

On 20/05/2025 17:29, Konrad Dybcio wrote:
> On 5/19/25 11:35 AM, Johan Hovold wrote:
>> On Sat, May 17, 2025 at 07:27:49PM +0200, Konrad Dybcio wrote:
> 
>>
>>> Konrad Dybcio (4):
>>>        dt-bindings: remoteproc: qcom,sm8350-pas: Add SC8280XP
>>>        arm64: dts: qcom: sc8280xp: Fix node order
>>>        arm64: dts: qcom: sc8280xp: Add SLPI
>>
>>>        arm64: dts: qcom: sc8280xp-crd: Enable SLPI
>>
>> Without firmware this results in errors like:
>>
>> 	remoteproc remoteproc0: slpi is available
>> 	remoteproc remoteproc0: Direct firmware load for qcom/sc8280xp/qcslpi8280.mbn failed with error -2
>> 	remoteproc remoteproc0: powering up slpi
>> 	remoteproc remoteproc0: Direct firmware load for qcom/sc8280xp/qcslpi8280.mbn failed with error -2
>> 	remoteproc remoteproc0: request_firmware failed: -2
>>
>> but enabling for the CRD reference design and requiring users (read:
>> developers) to copy it from Windows should be OK.
> 
> We shouldn't expect non-developers to have the CRD on hand, right? ;)

Non-developers without Windows can extract the firmware from the 
corresponding cabinet file.

-- 
With best wishes
Dmitry
