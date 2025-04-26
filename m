Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA59224B05
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 10:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745664307; cv=none; b=f59ViXHyWzoHcUbOFiBZdciuwQ1njognMVEv9mIm3LvCm+88Rp3UP7PCCMxnV5pc+Cc1W16yz/8qB+z437pBHZpMPfSKEYXo5v84odGW1i9QqnTw8Huy9QhW8IUmgF1CLSuvtb3K5/6zPeGFQl53UEZJusf0ySIAzq3oFBTF5Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745664307; c=relaxed/simple;
	bh=W2cjkRemjCUenJHUNPy6mF05A9vEztYbyP+NpqiS4ns=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Iq4Uo9jS6U1Tw70QG736ciA5PHfeR14MUoNdxTiYnv760iAee6FxYJGiAxGNOfO4ZgtmUz4W8sQesg5Zp0l8WKOMSeW8QhPxuRFjLXirYseGKAy1o3fA7XYJYixYa+yMPNBH/YMLhgaUvL0j9zDWoB5yWaIkbI+QmhVM+a14JKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ak7Bg+we; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ak7Bg+we"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53Q6g3M5026640
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 10:45:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Cti0cls6RpmnwuEVrPBosDHrl0E/TWcIksexIlUz1V4=; b=Ak7Bg+weLiLtmPbP
	mt+dNjk8S9Gx2LEOfa1s2nCl+j+2sfhFaLdLzBEEGQngO1cZADpIMgoOTlSRH/fw
	E6BzuUhRBfS5PHLSSl+egKF+GoZlBKBmcXLZYsdMbpc2fLcutXolg+H+5ZEJZBaH
	R8U7jG0OQFIBayCER7RTOoXTDCP1vfn8Jek/obaDj8o3VUoW1MMI1wmvNzwHEAZH
	i5P1Qniv9PrcxRchbcKKCHXijPr7M7BcUNcb6YCxeE2z12Rrn0z+rfA3bYPPMIPg
	Xtob+VoaLSi/30Tu2ydzjb0ZZe/eWu6qdZQRDV6okn704V/E65/ftmrb7LiTLMLu
	EBa89g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468pev90mk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 10:45:03 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4768b27fef3so5524511cf.2
        for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 03:45:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745664302; x=1746269102;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cti0cls6RpmnwuEVrPBosDHrl0E/TWcIksexIlUz1V4=;
        b=dr1cEbJdeH9W0Eq7VOSP87ObV+z96S2O9Le5ZgNDkS/u1xMnThRQaNufI+46v+l7cG
         WbxOcdBnUpyhldoYTyCKwPiF8LAkWI7+o4XLnNGtn9WCrq/fjSK6iRTqDakoAUQOWvFV
         7tNEbNVO43kIsppUEwzCvz4aVMAOxaT2en/NH+aAFj16oiPeEBa9Otvb6wI1lcZ8P3fJ
         Axx2qSyoUW4tEAqyyA84ClGCfm6+ujakrrCdgJHZT8Ff0Onz58iZOwNPeeeNz31XPf32
         s/QZCuaIDA1vDr5rSgueiDAhh5yxZu5XQ1pmNTVi0a3qkclaXRqC6v+45+azox3QdQ98
         wwgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJ8omsoB4EpySdcaGY28i4fN2B4n2NlvzzPE+I/HidlEYdghp1QzrcOjyfMd8upnBvbBXiYgO1Q95I1TU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYNLY6ALzA/rQPUT72ERvRwh/6lp+zOn+qOY5nWMTHqkxDHrlC
	vLXpuxUYl2U7fScK2jHXoaeuR2gtck+hQY+L3sl5e0FoSBfcF9FN+B7W1mspidzmBhRKNoxpecZ
	Eih802jcAiWcoVE+HYpVR9kL01kKfRJykG8dSeynszzaHeA3y++fYOB6XSHWypjE=
X-Gm-Gg: ASbGncsXY7LZ8VGXN4ad6cwwJR7KhI6UPYnu7lSIHVRTJDGtKzjKLc5uq5yHM8g5VOj
	fJvTIGh3KzvLygPACrWQ5r3DQ/RC4ta6F810EVNc8eXLVHed8o3NDnVajDiav6llel7gMxxgiF4
	+lfCUi4NnbF6lBiBDI+voutQnQlsqqy03VqxwfOCwReoY+jAoTD0GrONOU+009dpHlooFN8UVlC
	eZ//d5JSW0flCAWz+zDld1txX1Dy7FX5U1H6NtvsZ+aAAZY8+feudmSLT4gWd+G7PVeKvMUdxlx
	AyRdWZ5QMGiGybEYcFy52kWEb8vI11vMc7+Nj+Pm+EFyE7ikpWpzv2hwYYpRRt5AbIk=
X-Received: by 2002:ac8:7e8d:0:b0:47a:eb49:273c with SMTP id d75a77b69052e-4801cd5eb1cmr33064861cf.8.1745664301981;
        Sat, 26 Apr 2025 03:45:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5ahbGaThCrsLU5YdXHhOSo0roeSKraRYtG07uhVbFeJV6F+w1ZPA4VBcrJMdVncIiFqK5Uw==
X-Received: by 2002:ac8:7e8d:0:b0:47a:eb49:273c with SMTP id d75a77b69052e-4801cd5eb1cmr33064711cf.8.1745664301568;
        Sat, 26 Apr 2025 03:45:01 -0700 (PDT)
Received: from [192.168.65.154] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e41ad27sm268969666b.5.2025.04.26.03.44.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Apr 2025 03:45:01 -0700 (PDT)
Message-ID: <306ce1fa-be83-4f13-bedd-97a20448d162@oss.qualcomm.com>
Date: Sat, 26 Apr 2025 12:44:57 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: x1e80100: add bus topology for
 PCIe domain 3
To: Johan Hovold <johan@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Wenbin Yao <quic_wenbyao@quicinc.com>, catalin.marinas@arm.com,
        will@kernel.org, linux-arm-kernel@lists.infradead.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        krishna.chundru@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_mrana@quicinc.com, quic_cang@quicinc.com, quic_qianyu@quicinc.com
References: <20250425092955.4099677-1-quic_wenbyao@quicinc.com>
 <20250425092955.4099677-3-quic_wenbyao@quicinc.com>
 <4bb58766-a080-4351-87f5-79a98219171c@oss.qualcomm.com>
 <aAt4TBrekUqyTjfi@hovoldconsulting.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aAt4TBrekUqyTjfi@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: yPMKdmGUmNfF74gy341z64XauLjAiT24
X-Authority-Analysis: v=2.4 cv=aeBhnQot c=1 sm=1 tr=0 ts=680cb92f cx=c_pps a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=FwFjppTGKuqVC4zksNsA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: yPMKdmGUmNfF74gy341z64XauLjAiT24
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI2MDA3MiBTYWx0ZWRfX1dbJKFaQFeUA iFwrQkQe4V2wQyfOzNjdSrzfvjHZDFRT3EdVvaGWZX91dmlZtxI9mLGV6ruDi+drDi9MTEXq2CD rnwqK54/ltYIs8AKlYsgZ6aBMelqSouo7hDTTw8VkQLqwYqvgnWnzqTEvA8/wTBL7GprdEaNfIo
 +DmZ5r0W4NRN7/XQ2P2dTUSuLrrTFEsni7VbP63FWG8L6eCxLrtV3U2AGBGr7NpR19NZdU+CLVH 3wOqSjyiUV3kBZw7gEI9WcfAMb1Wstl/r3T3UbYmSbEdmeN7c/GZTJ+SK2IDxjmP5hZMIT39Jy7 ZUuNtddl6wn3bUXp2ZxBGEDWcEgKLt1JE0/WnZwVCzk1WlHkSNxd2g3UmyK0hoIpd2I1LBXO+Z9
 FHONvMdtUGtOI643F/w9Cfv5kmGfys6DtozK5UC7PMARODNeehDlA61mFWSkXsE0GnK7544b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-26_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 lowpriorityscore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504260072

On 4/25/25 1:55 PM, Johan Hovold wrote:
> On Fri, Apr 25, 2025 at 12:22:56PM +0200, Konrad Dybcio wrote:
>> On 4/25/25 11:29 AM, Wenbin Yao wrote:
>>> From: Qiang Yu <quic_qianyu@quicinc.com>
>>>
>>> Add pcie3port node to represent the PCIe bridge of PCIe3 so that PCI slot
>>> voltage rails can be described under this node in the board's dts.
>>>
>>> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
>>> Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 11 +++++++++++
>>>  1 file changed, 11 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
>>> index 46b79fce9..430f9d567 100644
>>> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
>>> @@ -3287,6 +3287,17 @@ opp-128000000 {
>>>  					opp-peak-kBps = <15753000 1>;
>>>  				};
>>>  			};
>>> +
>>> +			pcie3port: pcie@0 {
>>
>> @0,0 for PCIe adressing (bus,device)
> 
> No, the bus number is not included in the unit address, so just the
> device number (0) is correct here (when the function is 0) IIUC.

Some DTs definitely have that, but I couldn't find any documentation to
back the syntax up or explain it properly

e.g.

Apple T8103
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/apple/t8103.dtsi?h=next-20250424#n930

RK3399 GRU
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi?h=next-20250424#n486

Konrad
