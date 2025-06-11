Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE56428D836
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 14:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749650944; cv=none; b=mom6Rt5RIzdfyKbIBufMEmbk0pv92Mbw3pISQMuVRJkm7TGvkeApX1mWmL4kUDxQ6UfdKcl8dVub0aKTHB3lI9t4zjpla1ZfARFpXJZLH+q/PcAzYny8Jw4H/6tWqpLk3ZvxqhbV+toilTnR/6ESsF2qc+5oGztci0KQ6R4GBpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749650944; c=relaxed/simple;
	bh=8umeUY4xnAvrUdO79d9nFVuoRb0TW5UYKKfEdyqbmqs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NPiTWRYAtndBKgcD8SLS1xP62KIBQWqEJ3Tn/UiDzPref1/094tEzh6MIEhRRhuxN5gGndtnFp3JcBAxseDgCFNuDaJNipegPN8Lf6JY+2s5sbDthfx+U/XLfoltKS21yxuiwSZalX89+wYxEvKF3MGEz8+v1+jJX1XWXHtq+gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S/radQfO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S/radQfO"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B9DFto013448
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 14:09:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AmeztB2LHDf8SBdCFz8cnXw9fFkHuSmFpu3b1oz+irc=; b=S/radQfOA1lnYWMC
	umTVhVPTtpR/WYV3I7GbshcAF6+vvSO/5+HvxkoJ6UpnlyLpaVqlUvNfehxsTloP
	JIOqMpoYSMPCLi2CTRONkZUsbYp0bus0xN5WnDAO67wBlKDFkk7+a6iEgRsn0gqh
	ZEq684Z0zlMjyQpBjnLQn7foY+N1p1WovErPDYuiOmTqi4Lg2oMJbLgF4ogbgxYL
	Md7urulqHWZOixgJUq3EafRt03r5JK2KByQaCWl9oXWuByi+EZSCAe/kXYxAIu9/
	Hd4bklruTlMnevr4A2rlhuoVrMLRDnG7ymFHdKyG0OJkJoPRvBP3h6ZrtGFhSvDW
	FshRSQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 476fmnctv7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 14:09:01 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d0a9d20c2eso19952285a.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 07:09:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749650940; x=1750255740;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AmeztB2LHDf8SBdCFz8cnXw9fFkHuSmFpu3b1oz+irc=;
        b=QbakKvpsRDmKnxKTsLaGM/TMqysd54LUls4FCw+Li0/XGz90wr2JGKHSCcxFBUvTtI
         9eIDrz7rOKwqLQU/4z8arCvyivb7vdTm7hjvZmTZFnjXxPUyBuijGp9R/LzbVeuxxtUW
         oa0LLAzKvsB68AqsB0P1ER2c05Rz7uKkfrLa4SD2vF5NxUQgVV/UrwqWltedJ1vet1oz
         W9Z7Bel0wTWXdObuXiAxtFkCZzka0a7i972uqCKa8ZdhYmMLUJ4pAdDr/uGNpOc1mngM
         bD6dJs37avBA3wVtYNEuqQd/hhHCQeLMZn1KRpTjCXZghu4DgVfG8pnsGAIde48grzv3
         gcnA==
X-Forwarded-Encrypted: i=1; AJvYcCWgrR2/MZKkSD75H5GEfJypcgnsgUHxi0qSYrisO0inkgpCs+2+6bqzY0gaUfROHH1ohHKADSr8GUQI9Ic=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz9saERGPQD662wDDscmlsQXdt+RfvNyGKJNftULRtlILnxrTi
	Z2W59cyYmPndvZDm08UqdYyKj35edXCXSaMSg+xTm/6YJjuTyT3x9Dco9PtVkjpfXbZmUS6mgYI
	WoUO60qO8S5wvGWmXKZcqiqxMGl1QRgSruhQzzM8XA3t7mvk1YUI9AB1xaBNCrR9R/rM=
X-Gm-Gg: ASbGnctUSic4qcWeFWhrwo65k+WB2kyZ1FordyCcEnqztQUw2C0O20X48qjjsLGxqx5
	cKBvuvXxtYK0oDB0VXc7QTlN6l0WlbcttqBHxiFW5vLQWFWiD/4fGljHqRPWCLzxeN24bq49HBR
	HWE4gV08SS0IT03eI8saCjBJSptjOnOktgkq/0XfHO5E0jO1EF/46XGj7zWmbGa52L5oTLDMzGU
	8EBa5XQrHuKF+TcojTNiWbBNq4wfUOpnfeNDJY2zPl8G/QoROSrLpLNcCNAilc7BBMvujXFUMlE
	hcpB8+S1T10Kc4xrDsSiWDoDmdTK1jYl45hqCTrkcLhAz3AU0CGdP9I42WacdOFa7GJns37clz7
	CGGg=
X-Received: by 2002:a05:620a:2a04:b0:7d2:89c2:eddb with SMTP id af79cd13be357-7d3a87bfb10mr197099985a.2.1749650940506;
        Wed, 11 Jun 2025 07:09:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9WowvqmmYPKWaY8pD6n8uaOQ+TKS/kPAXsLiaAzSif3KtKbjRfbYePG427VC/sE9AJip0tQ==
X-Received: by 2002:a05:620a:2a04:b0:7d2:89c2:eddb with SMTP id af79cd13be357-7d3a87bfb10mr197097685a.2.1749650940051;
        Wed, 11 Jun 2025 07:09:00 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc76feesm892015366b.147.2025.06.11.07.08.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 07:08:59 -0700 (PDT)
Message-ID: <74b017c2-7144-4446-969c-8502fb2cb74b@oss.qualcomm.com>
Date: Wed, 11 Jun 2025 16:08:57 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: qcs615: Enable TSENS support for
 QCS615 SoC
To: Gaurav Kohli <quic_gkohli@quicinc.com>, amitk@kernel.org,
        daniel.lezcano@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, quic_manafm@quicinc.com
References: <cover.1744955863.git.gkohli@qti.qualcomm.com>
 <1758b5c2d839d40a9cb1dd17c734f36c279ac81c.1744955863.git.gkohli@qti.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <1758b5c2d839d40a9cb1dd17c734f36c279ac81c.1744955863.git.gkohli@qti.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: TqDpxCPew7Ob2rIdYgfVsCbh5_O4ERLl
X-Proofpoint-GUID: TqDpxCPew7Ob2rIdYgfVsCbh5_O4ERLl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDExOCBTYWx0ZWRfX7U0FzFErYqIT
 +1uixQ18vKlEP9NBPAaodavdYOtbpGDbWkF/oI1VRncot7VCpqr2+fgHPDWeZsZ6GSNcirB66Jt
 xKxtK0CkJl2CAFYgBB2beqjeClKtwultAMfPoqfP/ltuCtddwNThbEqYs9qM/7w9/bGQcEMh/U6
 OrXX3qduBUZrtAPdv4MCSo6Y9p9E6Sz6zKdpeEzA5wGKPl1zmSCoJU9SRyYui1dAQF7JkrDBZOj
 1uNtMO8dm8AbyiILC52ijq5Sez3HqnxgeabGm7lcwicCkNXb78CxcQaQinuTOSUebM+BWjc5BjI
 DdZqUk0AbAhhEGjEPRAmyWUOVq3keZpIkpcP4IjvDmLCWHSZ/D9+HMuvFS6UFrMCLHhZ2fAKMwy
 0Be5npsaoYnQVHr3CwvFnfN2ZUjKFzsqS79YOxP6igL6rz7nuFzwDZpmvAMWfhHZ179o2Iz8
X-Authority-Analysis: v=2.4 cv=K8wiHzWI c=1 sm=1 tr=0 ts=68498dfd cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=EH_knqGQgeMXXTF48UIA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0 mlxlogscore=870 phishscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506110118

On 6/11/25 8:37 AM, Gaurav Kohli wrote:
> Add TSENS and thermal devicetree node for QCS615 SoC.
> 
> Signed-off-by: Gaurav Kohli <quic_gkohli@quicinc.com>
> ---

[...]

> +	thermal-zones {
> +		aoss-thermal {
> +			thermal-sensors = <&tsens0 0>;
> +
> +			trips {
> +				trip-point0 {
> +					temperature = <110000>;
> +					hysteresis = <5000>;
> +					type = "passive";

All of the passive trip points you added that aren't bound to any
cooling devices should be critical instead (otherwise they're not
doing anything)

otherwise, looks good

Konrad
