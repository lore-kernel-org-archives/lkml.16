Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4CC026AF6
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 18:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745864190; cv=none; b=sPwU9L+tfBYQqjugyfopMJIcWWJ3Tx/VM/ngcLACfuEEBJZprKnHZopw4O4AEZfwGmqu14ma2Zavn1YIwfq8f2CiYFTRwzfMqf8/OyF60/W1ol+NgkIAXxt7ECuv+QpUA57fxLhvcShuVzx61a9UNcD8UZ78dFvj7lhUk+fui+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745864190; c=relaxed/simple;
	bh=J2NjDwqxbCREVF7cYbxWhVeVD5IjGCL+8llBMNF4IB0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NsvALyJeJlQhUnVer5IWxFtcRQaAzADMKlBSfio3NEj4bs6zQY89D6lbVnQ9bSMi9PgpAxM/cmLEayj8d6LkLtx5DwIhp61gYX2qHf0VZbwv902TNtvfD7inkUVjCq2/AtzJ2yJYlx8zlfcyZS5pK7RLzoa3SIDANUBPRJO7Tuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U+dlezha; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U+dlezha"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SDKtlp014200
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 18:16:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pyzYPzNdKJ5hQ6D4PSTvT03qdPB40WqZn1pcHvBuv1I=; b=U+dlezhaBSxpQQJ1
	hbS01xOAyQrW/KVOqtyup9H//GPuLtniOmmFvSGngRTTUkDSFpxwTO8AuErYjhKf
	PatmdMrXCAfq796TA7HUFXXGDw1FRpFyJnIkyf6WZ50dSNWk6c5mOxB1tCKbSfw0
	KHVquU6LRrvwJ9BRZUeUQh/ZM/ps0Pu1VpORuRMYtAhi0bq3vOJ8tC6yOHINJ0RW
	DOUFNBypgdE0aMT1+ZvpE6czD2SvcPQxRgWIe0l/fL5/1EzHVWXT7ZLNQjkeWCwA
	sCqeIc2J45eoPa/6wx9incf5JhFD4HuqI710wfbDZkqaSMzy8hZ+tlmF/5xgIQR3
	HrEJRA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468qq5h6j5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 18:16:27 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-47983a580dbso10849901cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 11:16:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745864186; x=1746468986;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pyzYPzNdKJ5hQ6D4PSTvT03qdPB40WqZn1pcHvBuv1I=;
        b=OKTpYgEUH8j8qn3+BOgLpbkpa8LZhpVYtY0eEKSxK7XSZU6x48sHy553U/kM++Nsc4
         DWSkfXzRVfJtPT8ZTG3FGXNfy5682cqzYtOgSdOrx7dzKZE3olHnGPD2PeVt/sTQ25Ke
         Ebmc5U6Y1psZW2YcchycVag95XaHIZlGDgHWgoPTPaAhTIp7US3v65Mva0Rm0qJMS6qb
         J5gHEy1QyfpR5432Z1yMoBhfF/lhyrq0W51O54F8iVxABjN8s1xewVj1zegs2IVVBBtM
         X74vKYe2gHsiqsw2wtxsgMCePnf6Kt1YlX3bF9kfR/zzk3bwctR4PhAbIZV6ggAVZa7E
         09vw==
X-Forwarded-Encrypted: i=1; AJvYcCVj+i876HqyhlC5ywuHjffMhLYEyGgXKjN4oR10A/19eK3jvkipyDAbv5jHIEBdK8WUNdV7cTcUbYXVWWg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmbohCKIwf0ZljRgT3TRqxa3VnYA8teOFp48bETIirFgrTcYH3
	wEg9utT/do4VW9u+dZpjqKpvm6f3ZS2/2OLEaq4W+FR+8UzDl8sda+rCSxP77eu+XZXDZF4kBEL
	adlpKkJKB58qDvLhtaaPW4u9CPOM8ionkJSV1ZnpfqgEytTcnynOqW8MWIwTOb+Q=
X-Gm-Gg: ASbGncuOvEAJt6ihnJ8uwlcOYS0abVsENmOlQ4Tk5l5MOos6LpnEW1nRgo/PLJ+qf8M
	v8WYnRI+64UXUTR7AdRas561u2oudPz3dZ7s0oyWaO6EzkBsArvYBhESPofMMCGoEBh1t6DbR1+
	Ysn3h11qdfyWZzRnyCRQW7dl5iKbqxmQAzo37teAT16GvTjoIdw7CvkD1uwi5ud1bN3WMrxJr0h
	Rv1EnPAkkgIWKRjUT789FftGHbq/PRt4pJPvCbOwqeJKYxPhdnS0EggK5w3f9P8OAujtyr0ZbAJ
	BM17wXVjPOOI4WvJvG+Z/P2t7+IqxIJpkZt0jXErGWz+nYtYuv+7vE1Fzl/IxwFjkw==
X-Received: by 2002:ac8:5709:0:b0:476:add4:d2b5 with SMTP id d75a77b69052e-48864dc24aemr677521cf.2.1745864186513;
        Mon, 28 Apr 2025 11:16:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFiBHTGPzXdz71tkCZQWognqMTsRKpmoKTruiCpJpeGT+JHe1UiZNWbwkpyFf9Bf70YBU8p6w==
X-Received: by 2002:ac8:5709:0:b0:476:add4:d2b5 with SMTP id d75a77b69052e-48864dc24aemr677331cf.2.1745864186191;
        Mon, 28 Apr 2025 11:16:26 -0700 (PDT)
Received: from [192.168.65.47] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ecfb339sm658100166b.115.2025.04.28.11.16.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 11:16:25 -0700 (PDT)
Message-ID: <4b467493-5ea1-48d9-b4c0-56f05b7edb46@oss.qualcomm.com>
Date: Mon, 28 Apr 2025 20:16:23 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: msm8998-lenovo-miix-630: add Venus
 node
To: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250425-miix-630-venus-v2-1-cdfca385a0c8@oss.qualcomm.com>
 <CAOCk7NrcpwAnUKcVsc5D03Aazt=qWLZB034xa2FH2PF9LuL6ZA@mail.gmail.com>
 <vxwbzzds4lkixt2zsvjwnmfk22u3mmvp3cqk36aak2thomyagu@znr6b7gcue6w>
 <CAOCk7NqLQdpbvdknEHEB0NNU7OPhmmHkH3Q4PCYiOzf2fBQBkw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAOCk7NqLQdpbvdknEHEB0NNU7OPhmmHkH3Q4PCYiOzf2fBQBkw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: wu52Gg8p2jTYSRHN_hzqm-y51a_2jA-M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDE0NyBTYWx0ZWRfX+sHgsg8Auezl 4PXX7LUmOFlwLKMhJ3t099ZIRnei73HTEb7jwU8WKPbYTJ0JYBOBYwK9f7axFumw0G1zjGIZ9mM OqA/bvDTmPelGI3hchaT6eOW38FrE/Rey17BfDHQgt7+NBE4MvzEbQnSfRSgvccvpa7cLyo/9IO
 fD/cm/6FNe9V/mpYU3L6Qzi280nSLvm+h1jVFjjshV6Riqmx5kCLdsezwGauhaRAyIo1AdiRfCG KaKVSq2YLsojDgre48LWYAcwi8rrqQsfU8fJYrKXOIbssPWLc8EPRWfe73KX7DM1oQLHkAhzH/H BHzaDOG0QCAzu2BFwkI9MINgqvymm2cD+osxY0H/Q3VQ42halo3qpcHMUUB3hW+yP1Qryc8HdGa
 iA0br1mu9PacRIoYZTuxRh9usEZ82lXcjpPT+v4dFlT5D6u+S2uN3e0/+pGtsuP3g+c80MGL
X-Authority-Analysis: v=2.4 cv=QP1oRhLL c=1 sm=1 tr=0 ts=680fc5fb cx=c_pps a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=VeHn5rkiVmJbRrHcbRoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: wu52Gg8p2jTYSRHN_hzqm-y51a_2jA-M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_07,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 clxscore=1015 mlxlogscore=999 lowpriorityscore=0 adultscore=0 mlxscore=0
 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280147

On 4/28/25 7:48 PM, Jeffrey Hugo wrote:
> On Mon, Apr 28, 2025 at 10:21 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>
>> On Mon, Apr 28, 2025 at 09:40:52AM -0600, Jeffrey Hugo wrote:
>>> On Fri, Apr 25, 2025 at 12:28 PM Dmitry Baryshkov
>>> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>>>
>>>> Enable Venus on Lenovo Miix 630 and specify corresponding firmware file.
>>>
>>> I'm curious, how did this get validated?  I didn't think there was
>>> enough infrastructure enabled on this platform to check that the
>>> lights were even on on in Venus.
>>
>> I must admit, I basically checked that the firmware starts up. Marc
>> Gonzalez worked on enablement of Venus on MSM8998 (on the freebox), so I
>> didn't perform a thorough check.
> 
> If you got the FW starting up, that is farther than I expected.  I
> must be wrong about the capabilities then.
> The DT node looks right to me.

If PIL accepts it, it's basically good to go

Konrad
