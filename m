Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155551DB958
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 18:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749926014; cv=none; b=nqwDmslUb4qd62y6X7OX5YEYyN9x+Eu2DMlRETN8HxQ3MHjN/rvuKSsx+q08Eoa0swEf5i3oecn2zMXHB6rKDmwgU6K+x3klpJDUof5+/QWfb8JUtiF/daIxBlCG0XlUOMGo0iexJdRBfgo9lrBK1GbcrUYG0JhXaH2TASBYP+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749926014; c=relaxed/simple;
	bh=wcKKiiDIo+/kDlB11ct8+jiLlrxLrZ/6H5sTWEC2GkI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=erOAiPdhqq7yfZ9wp6O1PRZsYQ6znA+Mc4NH0s9wls5lQ1dPSpoBWPAGM6IpQcPXuwOsOr+TlU/PMwQtuT/1ABJW2EdsvheHsbwdxTN+ikDTOa/E3FnhDfiPJjOSbzZkIOBVQ9f+6sqAX0DTX94n8RguVb15WMy9I3tyPH4QNFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bqo/SoUs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bqo/SoUs"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55EHHasT003626
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 18:33:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/EROXfotcQS3z6Op4w/xu5h9Lj/9QhcJZ9gpHwfbqmE=; b=Bqo/SoUsDnbPkIWj
	msBtdYSTpXEn3j9+qPij8RXCp+xcjRIcQwUQgQhUEHkYwfl20si/fqLS0odQnsY9
	Mgj3Fr631qR9kHRQ/pYemFSYIK6TVkxKsE5TmGg7TWtd/PufX6dvujY3VWIP0RaW
	KHenQwJ5b7UZyGrsrlJ/zSFmYaYIYzSm850HyR47eL0qdZsnwVt+Cpowv7HybWdl
	SYbWvpvD06gHjOmYbBuECwGgtX2ZAibNwfJCcGFbDOyTIU69KilTwiwEin0K8u5E
	x1Ph0I5rdBoVUpHU804V9+Vnw0OYDWUhpQTid/ED9JvRgHvh9OujMSYyCjN3/SvO
	sw+YYA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791en8vw7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 18:33:31 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d097083cc3so81842685a.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 11:33:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749926011; x=1750530811;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/EROXfotcQS3z6Op4w/xu5h9Lj/9QhcJZ9gpHwfbqmE=;
        b=bs4CJDyqLobSDF3SYAhB1/NISS3rjSyebiU7W4AcXk2Y68tpye/wo+lrwhv6zcA446
         z9gcXAVtO6mt+7DChqvOpeFGDqJKOZVDRAqcB1PytIm4xOLljO8J/TxYi44+SI9jfbOy
         zUJep3u/j30Kywa6wWlGp3ezOhJ3kcKsnCKJ0/FGp/ilyGZQPMnoJJHaIbacGSh+STzP
         KICA7LeW7+N/2KyQY5ZaB7CT+/LeAlZV7izg8EK62dplRap3uapYdciwLedfES+hfM3s
         5wDUVPY/8pXBDH/vp56HcAoTucs7hgPSw1rr/4wUxHhL3lERR2Z16oPh/lStICjw294W
         6o9g==
X-Forwarded-Encrypted: i=1; AJvYcCVuTMapNjRzLNnh3Ol24fytDCqy9dPXv5WyLvvsR/Rc4RV6nT12S730jXLvMStWXcfMtkyNMYFJwe2jF/o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCedEb1VLaHe7rOYUzhphie6k3odFbdCI0gZqLtlY/OSq9llUX
	RVz2oeX/cgKQAgPwQW4lMhsUXd8I4YtcHP8/t9d0f7YcioSPHdtRR2gO/HB21eqNpJ+JPGFJVBZ
	kzue4OIi85kBT+akEGc45KHW1BE1HROfiNO1Fxspy5hMWE9dDYBBT4DGeH+tvnZir5Sw=
X-Gm-Gg: ASbGncsfKb+oq12tjpuZ03J5+yw5QeMWaG7M259V+kMfW8Fk3m+ZRe4e6U6uN2OJhnu
	ItTLaDLvcyGrgL97U15GHOg88cwahxwf/MrlQL1+7m/m0SOfN9cXA0OovhUyKH3Knb/y8DY7CEk
	Zi89D2wd0JTsOWhfxil203WLNEHCeBdkYCZkAeykgNktar7CTUNg7X1e9FFeb3S+x5sdlW/ChM5
	Yb1WdZGD8rK7tfI60fK/BZwF3fvgO2IbOdg6awKkTX6OSXixv7Wem5ElA6EbvbFdNb/hRZXykbf
	oCeLo5DBfAAaRTnnYbJ+5GjII+Pkbdk+HkWtpg3dxvfd/PvWyiWXKbz3M1eSxj8P4JkgzfKDgPh
	gV/E=
X-Received: by 2002:a05:622a:118a:b0:472:1d00:1fc3 with SMTP id d75a77b69052e-4a73c57f8c6mr23641611cf.8.1749926011134;
        Sat, 14 Jun 2025 11:33:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5fSi9d9kAxuqrCjFUVKnWBGJCsy0WRD0sHgTYjunPnnUJGatx/nKYgEs9XUhs3Viaioi94g==
X-Received: by 2002:a05:622a:118a:b0:472:1d00:1fc3 with SMTP id d75a77b69052e-4a73c57f8c6mr23641451cf.8.1749926010681;
        Sat, 14 Jun 2025 11:33:30 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a91dabsm3146308a12.53.2025.06.14.11.33.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Jun 2025 11:33:29 -0700 (PDT)
Message-ID: <7b024732-6ae7-40f7-b0fe-02a9bf090e1f@oss.qualcomm.com>
Date: Sat, 14 Jun 2025 20:33:27 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] ARM: dts: qcom: msm8960: disable gsbi1 and gsbi5
 nodes in msm8960 dtsi
To: Antony Kurniawan Soemardi <linux@smankusors.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Max Shevchenko <wctrl@proton.me>,
        Rudraksha Gupta <guptarud@gmail.com>
References: <20250614-msm8960-sdcard-v1-0-ccce629428b6@smankusors.com>
 <20250614-msm8960-sdcard-v1-3-ccce629428b6@smankusors.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250614-msm8960-sdcard-v1-3-ccce629428b6@smankusors.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Q03FjMBx434N0ffjKiFNCguv7Bvrep7g
X-Authority-Analysis: v=2.4 cv=D6RHKuRj c=1 sm=1 tr=0 ts=684dc07b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=wxLWbCv9AAAA:8 a=C-WE-IFwnVoy-LijzQUA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-GUID: Q03FjMBx434N0ffjKiFNCguv7Bvrep7g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE0MDE1NSBTYWx0ZWRfX9I6ZDqJOO5dz
 IxZ3pcJkiVoHPHduX6UL/m7Rh21IoQCBImWjCVK4s3gRv3QlCAtIjkfVsYkq8U+RIm0RG5WOK2/
 ZraLzsSVJpxp+PYqqlMLvMZsOGxFnwgKVrvAJuG/iigAgAFkCGJ/U8dxtwfSaJGB7jKphfALXGh
 g/WQUnic4cCEtoA02h9sK0BXRwydEpwJNxIcqM2yztK9k7/+SN7Uhfv6iBAA2ntYrl/Tq656VOU
 3rPr5HJBXuE6qxgKA+3NiQn+daZi8aZfwpdQcX+rNsPWsVHOMfHEPPuEYnyy66tCAR7/747+lhu
 7BiQg6mGW5IFuaUWVMZ43tNM2tjHV3Ye87VzPIrWcuZhNRxjRHnQ5oMxC92miaa4iXqwKNQYNu4
 cKtG9vUYZhYm6RI9lwEzn9vm8OwTEPHv5R42WXiuFst8cM2OPGvJ0SHWiCflGMKRyDfxIAm5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-14_07,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 suspectscore=0 mlxlogscore=999 clxscore=1015 mlxscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506140155

On 6/13/25 7:50 PM, Antony Kurniawan Soemardi wrote:
> Not all devices use gsbi1 and gsbi5, so these nodes should be disabled
> in the SoC dtsi, following the existing pattern used for gsbi3. The
> upstream samsung-expressatt and msm8960-cdp devices already have status
> "okay" for these nodes, so this change should not break existing
> functionality.
> 
> This eliminates the following error messages when gsbi nodes are not
> configured in the board's device tree:
> [    1.109723] gsbi 16000000.gsbi: missing mode configuration
> [    1.109797] gsbi 16000000.gsbi: probe with driver gsbi failed with error -22
> 
> (Note: Xperia SP doesn't use gsbi5)
> 
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---
>  arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
> index 66071ad498e49c4f54ba105fa94640575fe08da6..84d4d1bffa9f73b5e395e4290b8dc856e0966e9b 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
> @@ -321,6 +321,7 @@ gsbi5: gsbi@16400000 {
>  			ranges;
>  
>  			syscon-tcsr = <&tcsr>;
> +			status = "disabled";
>  
>  			gsbi5_serial: serial@16440000 {
>  				compatible = "qcom,msm-uartdm-v1.3", "qcom,msm-uartdm";
> @@ -440,6 +441,7 @@ gsbi1: gsbi@16000000 {
>  			#address-cells = <1>;
>  			#size-cells = <1>;
>  			ranges;
> +			status = "disabled";

I know I'm picking on style a whole lot, but please keep a newline
before 'status

Konrad
