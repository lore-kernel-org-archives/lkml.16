Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 733934A1E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 06:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748932964; cv=none; b=MF9b5ULp5YGdJv9tiXAB9m/UW3RwyL/qwe+OLKzrQiiwP+N6WmUesBjl09qiAQkdAeNmV1Sl16APUfF4tQE0Ut+N0uZlzQCSfaqe1m6F+gkmHdHNpigjEQc0YNRRdoi05qH79rj5+HyUC/iclPEyjHCZ1kw3nlo0vZ3TtmsTXR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748932964; c=relaxed/simple;
	bh=GN44FSpPUMryhxPjpfEqKO90JozkFgvGGpM5mOb+UyI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fulu2RxQRI01tPpeQ852k4qMhHyUP5htl5yL29xdRejkC5ey+lfSnzREThyrjYvbPwptLgcQ3VPoLe8y6Wli5EmNBC6p8OOphTNln+9cyb0GSGV5MLlWPBmMMUnkFmx8wTzUOngnUkXhppAIQnUYqMjtmnVGqzCtN30MUwB2avU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m4YWk38M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m4YWk38M"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5533o1Eb014092
	for <linux-kernel@vger.kernel.org>; Tue, 3 Jun 2025 06:42:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FapTv+hgyXWAiQtFZ/6aCrTIGpX87fiidKCn0qHWkY4=; b=m4YWk38M+e+WaUU2
	2MNnPRd1e3Wq3UkuCDEej4pffPNTitPdua7/lMlqc2fHzYiLSSX2L9OWlyXfABKJ
	8V7kETY7JrwU3NqtcXI8b2sJseVYOpP2vPpNOJuKnfFx5PY3GKcI97mW7F/AI7iX
	jmWYgthlSteecvgmEb5Hs1H6FvwIa+9Qkk5Q/ms7l/6aS0T3U1Vnn6XGgNLSQB9o
	+VFHEt9QDfCo2QrU2uD3svK1YCFScCfVTjudGNkWv0gEUZvBCtz7FjwnLGIEDZU2
	aIf3ie8WOXDf732HT9jP+8P9RYDUjxeRlGUT63+Q4QOjgT395KOxJtUzsd0IFDjn
	/dXExA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471sfurd53-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 06:42:42 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-310e7c24158so5160441a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 23:42:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748932961; x=1749537761;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FapTv+hgyXWAiQtFZ/6aCrTIGpX87fiidKCn0qHWkY4=;
        b=j7XTRqPTdsyBGWtrJtbFMxp8NuUDG145GFWheg+mhwGMDC+Rr0YR1Ct9pOUD6uz4Cu
         FofOYmuotGrZDmU7G5KcPOHL+ns3iTuNpCABPAgL+P+sV62jolNJBXqE7AeRybRvhQfG
         2/aGosM1YCXRPZcMmDxQ/LNunpv2Jy17Tql8Nze9GTsNvrmUPPgXXu8v3BqOEvL8YwIg
         h8Yt3dtvhWxjlVvF5TdunU27hN1t4Yys26ZT61mUDBjHflTpeLacvx6bfVVAwHD4+7sL
         ni7gByN3YcrN0OKUlBZPwzm3aSXR39nT+DIjdqHgBKXTw6vZjrIuS/5026RL6WBLB6lU
         nq4A==
X-Forwarded-Encrypted: i=1; AJvYcCWNwzpcw4e6Zx8RFmfEXTDbvkNq9+UfDppYtoBTwMSQ5+5rG88KP3GRpX3jsL9hTGp6nMinYgAWYtmMqdU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwU8XcO3CG7jJLsfJ9NJQnuYazSZPK3lrUp1+2VIsmM51etDWS9
	R1G6PzBbZJC5JSsTDO/iCzMa3Kc8AhrgD5SyPPwj1cFyfkOYVqR6Bl2jVsnfXSSPKRjTO6vhf4b
	r9O72uUD+Er8sA7o2b/VFoI60ThPouS5on52F1ZwGmSTMD89nLTGLvp0Xh3K2Hj+9OFk=
X-Gm-Gg: ASbGnctg2smxbJ0t2s4NFwjfLiU+9I97l1FAI6tRxz6ezMWq0+HSEYqIWneAm4wKNfU
	S99O5wVzuPRiFHqjZzUwl2RTCJikbajiIC19Darl+G7hf9tDwyIdmZDCoz+tDJi0R1l1YVQhg1j
	L7FaRAjGYOj38gTpQvE0cJCXhOXFxg3xekbWK/kR1+rKmG1p3yCbwCgM1Dg3I+t/6NFo5Q/jsGl
	tDmJFiNgqqTMwrrt+4/AslZjaayJiP6F7q8i+6yFD+FOi3mjpVV8pMOxBsuyis2UQrJB2AEutta
	lO1wSHHXtzJTbbQZZyw+sTa4ZzQ89WmPfw4f9zrOTnc8TFSBrn7RbtRJ5VSBObbqiP8rpUOsn0l
	Z
X-Received: by 2002:a17:90b:3e89:b0:311:af76:35b2 with SMTP id 98e67ed59e1d1-3125047f1b0mr18780912a91.30.1748932960970;
        Mon, 02 Jun 2025 23:42:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGVU9kEh+fJEWFdjM3ozZfG8ZXX9JAQnIZMnanwAHvQ7aYTu3wh5QiNLtgU2x8tq/oYaLaBQ==
X-Received: by 2002:a17:90b:3e89:b0:311:af76:35b2 with SMTP id 98e67ed59e1d1-3125047f1b0mr18780895a91.30.1748932960527;
        Mon, 02 Jun 2025 23:42:40 -0700 (PDT)
Received: from [10.133.33.127] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e2b67f4sm6603856a91.3.2025.06.02.23.42.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 23:42:40 -0700 (PDT)
Message-ID: <14cba9ae-e3bb-46e8-a800-be5d979b2e06@oss.qualcomm.com>
Date: Tue, 3 Jun 2025 14:42:35 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] dt-bindings: soc: qcom: pmic-glink: Move X1E80100
 out of fallbacks
To: Krzysztof Kozlowski <krzk@kernel.org>, Sebastian Reichel
 <sre@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel@oss.qualcomm.com,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org
References: <20250530-qcom_battmgr_update-v2-0-9e377193a656@oss.qualcomm.com>
 <20250530-qcom_battmgr_update-v2-6-9e377193a656@oss.qualcomm.com>
 <4e093835-af3b-4a84-b42f-fa7d3a6f60a1@kernel.org>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <4e093835-af3b-4a84-b42f-fa7d3a6f60a1@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CY8I5Krl c=1 sm=1 tr=0 ts=683e9962 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=kUhqu5DrlFyasPmHbFAA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: fTmUfws18xa4srtq63sWU8NS6QQRfyhN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDA1NiBTYWx0ZWRfX5PBPEcjvbXDk
 F7uHg22VSrYDsjQRqh+fNy/b0KBrlcif1PB5TiQzzD1RvRpTvdEy8X8NzTXLTJbNwKGa0/EiXBJ
 4leJ83HxDKInvn+RY0R2otI3aPz66s30GcKIKZNvHonRlltKH1aXdg5cmXej7R9Wb9bEMB+jB20
 ZE3wt8Cpi+j2+LMZFnivdee2XXmXEAQIh21QPDqvuKml17sFwcYmS7uNKScLVXZkKR0P3N3DE6t
 8hXZwBx1EXx5bSIU15EqD1x9sqEKtAXE/XS60iwVjM3yqVYegfypcSkE0971L1T2jTx2aByqi+e
 dWR+LbQsW9YUqf4bR8jVvygXqywSnkXQY75ZCqnOoh5fCbzrpPUQEzSP5K8ZULfmROwETtHv4MB
 5+jrD1G2iQAYNn2nwON99vBO5Z2JHxDVOdctLQ2qIH9t7E5NYwuJzRpHPJSW5J7NbxZa1YWf
X-Proofpoint-GUID: fTmUfws18xa4srtq63sWU8NS6QQRfyhN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 impostorscore=0
 phishscore=0 mlxlogscore=830 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506030056


On 6/2/2025 3:40 PM, Krzysztof Kozlowski wrote:
> On 30/05/2025 09:35, Fenglin Wu via B4 Relay wrote:
>> From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
>>
>> Move X1E80100 out of the fallbacks of SM8550 in pmic-glink support.
> Why?
>
> Do not describe what you do here, it's obvious. We see it from the diff.
>
>
> Best regards,
> Krzysztof

Previously, in qcom_battmgr driver, x1e80100 was specified with a match 
data the same as sc8280xp, also sm8550 was treated a fallback of sm8350 
without the need of a match data.

In ucsi_glink driver, sm8550 had a match data and x1e80100 was treated 
as a fallback of sm8550. There was no issues to make x1e80100 as a 
fallback of sm8550 from both qcom_battmgr and ucsi_glink driver perspective.

In patch [5/8] in this series, in qcom_battmgr driver, it added charge 
control functionality for sm8550 and x1e80100 differently hence 
different match data was specified for them, and it makes x1e80100 ad 
sm8550 incompatible and they need to be treated differently.

I explained this a little bit in the commit text of patch [7/8] in this 
series, I can make similar description in patch [6/8].

