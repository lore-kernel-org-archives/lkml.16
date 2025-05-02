Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1F52550C5
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 13:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746193289; cv=none; b=q6ZEyi7qJuAM+ZjTPbX0boIRibUhc9XFUrgD86hIo590+YEpTKCH9oKISUBS3AKtOauKYfDbw7lGdaZPUii8S15fU7Xxp54G9HSXxnkwjCXg/ZZkMUtrt3D0cJE8q93SGjo9iO0WSNAWhfgiiwCzmjoWJGcMArz9HSTuslvmVKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746193289; c=relaxed/simple;
	bh=7ctWe9g+bFqInv1ZScTK1DftzAfA+fAaQRA0VhrX++Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UiBvSodkQ6/mIJISxVXK7x4OcCP8czP0hix73KgLj5wGX6Llgjtf1n8k+Xl24AX/+oCIfW3d6ek6SCFh4LgZYguE+sl3+ptHxk/PFaTmmUu0GDT3/+QzTBLaOWjYqHlsCiXfo/I14yx1vLwf+KRfkkOQWTV+wxkULrmDEgIwaKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XBBuYMPf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XBBuYMPf"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 542DQPon015851
	for <linux-kernel@vger.kernel.org>; Fri, 2 May 2025 13:41:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tRa0e6yzESCL53RBCKhEahi2ua9XrR9IpLFLe64y6t8=; b=XBBuYMPforHmAtBm
	H5FIgiWGFHx/rirNgvHm8uCpeP3+W5XiGVJAXgcJ196ov/SKhH53jJ75c410K0jy
	olIo9OcfhiF122ZpZZ7CCdCeBBWcBIWdpHCOGPOhdFjuR4HtChTx9daNEozpI2GD
	6unYvAglJlNodLjKJ2FFhqZwiYWfaokeucGYLum/IRvKEAwBTs5RlPRLBpM61FrK
	eOuC7/EJpiPiOpPzB2xZ6gba1pzo8a6akiCUJWig/l1yzoJLHKbNdAbH+cHp/Fvu
	Bm3YJLTfexs50TRYMp+z8w2pxLHuNzp7+883322cLXDiPv7vFEIlKniZxK+pgNcb
	yE4PWA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u40d3e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 13:41:25 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5af539464so52732085a.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 06:41:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746193283; x=1746798083;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tRa0e6yzESCL53RBCKhEahi2ua9XrR9IpLFLe64y6t8=;
        b=WXyabWYL7WoTfPsLLtjzCgtwXlsEZGv0FyWRO/B8q0k0D4R/ztLgBLwC7kdfiN67L3
         O2PRCSsMcWPV6HVwzghau6zoDhoyAiwkKXstxAGg1b8sabo6husEDcG5G1zFJhJDa0CJ
         UgwqNJHfBXsv2wc+hogkNHjdvhB2VkZGr4mR/qt+GFIG1nrSpDtkPUoguVaOAcBQpOHU
         hvcCqGMmPUtmXr93zv4pwRiRaqN7orqZ7p2R+ijp4MWy7V+311TLf93SvErTT9HeJU5N
         vphSEtaG0v6zOzTJ0biUf5ZmyPoAgEpmy3sWkR640KtSqux2Pzy7/IOTUm3SvPdebsn7
         ilUA==
X-Forwarded-Encrypted: i=1; AJvYcCXNEJlbMGo22MGJvQJ1E9P8K+triYkwyfXnnftpZONgz9JuDmy8dL1zXM5b3w8YaWiWwt7ar9epKgeVcNw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrmTJrbJ6mvlZQ80t2LBUL9zbioqxmftGxFXHmMjQ6wvl7B/2C
	VEGqEUcm587N9D1lGIWcJQDo5neZKrA23oW99SKLqRwO3vNMkZVpFdjIYPhZ5pY4S5n2l2gIE1E
	2PeCIuZ0gomVpRH7h6fadKGHYVj9ITpZU4Lw3Zi+j2M19rFmrFt4j5scIvC80uG4=
X-Gm-Gg: ASbGncuy67twnLpszzeC3j9ucJEeWgn2a3sfHTXPOEr47o0ZTwioVwiQ5ma0LfyIoZR
	R6Vq6C3WemYSswuBThUhUAGipNPDIpXXL7GjVuZPPgLtV2ATMldDD4g5PDnhmJohdPBlIlnzIct
	sYGHlpVbwoL+yrMy5fzbfjFWZv8WglbuQwUJ6G0fodOl5nWpcEqRGSOQrkuUnrQH0FoZi30WKBR
	wHRKYKKqrZ2ggDzLc4kTPeaoF355g4is4pDNj8tBkUEJlH+mhzS3NVJIMQ8m6/xkUpUX194G3Bw
	AuYyoF/XMAeJTa69KBvjA+TqRN7/ZWWMUxB6iG4GdgrBlgHaJFYMq3E47B/e1gXOPb0=
X-Received: by 2002:a05:620a:4252:b0:7c5:8ece:8b56 with SMTP id af79cd13be357-7cad5b386c6mr117518285a.4.1746193283683;
        Fri, 02 May 2025 06:41:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFfDTzMBbUFb5N3T6kjUkUukjjuCz2lS26RtjyWTZXBYvPjhKFgERakqZQ1lYamKTv/P1YcxQ==
X-Received: by 2002:a05:620a:4252:b0:7c5:8ece:8b56 with SMTP id af79cd13be357-7cad5b386c6mr117516085a.4.1746193283175;
        Fri, 02 May 2025 06:41:23 -0700 (PDT)
Received: from [192.168.65.113] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1894c0363sm50718166b.121.2025.05.02.06.41.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 06:41:22 -0700 (PDT)
Message-ID: <f6d9b03d-3870-494d-b97f-b0487927c9d3@oss.qualcomm.com>
Date: Fri, 2 May 2025 15:41:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] phy: qcom: qmp-pcie: Update PHY settings for SA8775P
To: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, krishna.chundru@oss.qualcomm.com,
        quic_vbadigan@quicinc.com, quic_nayiluri@quicinc.com,
        quic_ramkri@quicinc.com, quic_nitegupt@quicinc.com
References: <20250423-update_phy-v1-0-30eb51703bb8@oss.qualcomm.com>
 <20250423-update_phy-v1-1-30eb51703bb8@oss.qualcomm.com>
 <tqzmof6rq7t7k3jbdmay7dplz7el3c6i3ehesdiqnp7iq5f7ul@3lnf3awj7af5>
 <CAMyL0qMQCGE-JNwTjqJk8TrGLBDr_1W7Sv_nECkW9Xp1fXgeuw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAMyL0qMQCGE-JNwTjqJk8TrGLBDr_1W7Sv_nECkW9Xp1fXgeuw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Bv6dwZX5 c=1 sm=1 tr=0 ts=6814cb85 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=2aamsdQwrFB3mmDgIHkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: NztIGgT8CpXc86h6UoPqe338-DsEnbdh
X-Proofpoint-ORIG-GUID: NztIGgT8CpXc86h6UoPqe338-DsEnbdh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDEwOSBTYWx0ZWRfX9p3eb6RHZfZJ dbEl4SePLQXycCbMBdXSArKz7SVI1hRTbssKHZVARyK15EkwaTIfl4neQXQGeAzLedopZook+qP LG3Dv6rvfcNZ/dLhAel6nT53w3vvx2fLdTN/h+wN016n/Dx+N8FKGmk24R+nSC6qfVD6SUI0O/F
 EaqfKo2cyueo1y2sTEgVeAiyRaTXGKnFKejMC1MyIi1qYY2dTkqvchJC6pQPbphHzpJN/kup7DX DINADK26BhcEYZcamQBCSZZfA51dt7O0K+gG5SbOLkuP/MtGYtWCUR36+PQAjQDptByCuy9Wmio hrJwAy0lCq6aKZ0bfBMeOsQooOQ984B2KoVVh9fbUPoNVNICVtKLLuJdIK/o2dGi7sAzPLKNeVA
 h40IjiyMse+VyrjRVltv/8W4o4AIXktgfGRPcy5mh5ri/oe4kxFc17ZlzzbcAMDhG8lJq4cR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_01,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 mlxlogscore=999 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020109

On 5/2/25 2:25 PM, Mrinmay Sarkar wrote:
> On Wed, Apr 23, 2025 at 7:07 PM Dmitry Baryshkov <
> dmitry.baryshkov@oss.qualcomm.com> wrote:
> 
>> On Wed, Apr 23, 2025 at 04:45:43PM +0530, Mrinmay Sarkar wrote:
>>> This change updates the PHY settings to align with the latest
>>> PCIe PHY Hardware Programming Guide for both PCIe controllers
>>> on the SA8775P platform.
>>
>> Please read Documentation/process/submitting-patches.rst, look for
>> '[This patch] makes xyzzy'.
>>
>>>
>>> Signed-off-by: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
>>> ---
>>>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           | 89
>> ++++++++++++----------
>>>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v5_20.h |  2 +
>>>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-v5_20.h      |  4 +
>>>  .../phy/qualcomm/phy-qcom-qmp-qserdes-ln-shrd-v5.h | 11 +++
>>>  drivers/phy/qualcomm/phy-qcom-qmp.h                |  1 +
>>>  5 files changed, 66 insertions(+), 41 deletions(-)
>>>
>>> @@ -3191,6 +3194,7 @@ static const struct qmp_pcie_offsets
>> qmp_pcie_offsets_v5_20 = {
>>>       .rx             = 0x0200,
>>>       .tx2            = 0x0800,
>>>       .rx2            = 0x0a00,
>>> +     .ln_shrd        = 0x0e00,
>>>  };
>>
>> This does more than just updating PHY sequences. ln_shrd-related changes
>> should go into a separate commit.
>>
>>     Hi Dmitry,
>     thanks for the review.
>     Actually in the previous phy version there was no ln_shrd related
> register write.
>     and only one ln_shrd related register write introduced to the latest
> phy version.
>     so introduce added ln_shrd with phy update.
> 
>     I will add a separate change for ln_shrd.

I think it's fine to change them both in a single commit, but you should
explain in the commit message that previously no writes have been made
to that region simply because none were deemed necessary.

Splitting that into two commits will give us an unpredictable programming
of the PHY, where not all parameters are in sync.

Unless that separate commit would be just adding the offset data, but I
think that's form over function really

Konrad
