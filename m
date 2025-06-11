Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A965F10A3E
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 15:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749655037; cv=none; b=M4lnt04bYwQdd5JRPTVgDuK4YWbMqL/CVuqLevsm6YnNYvxKV7IImFzUa+39xxt6+oVGE8B06FeCYo6x8xSGTme9TL2MQf+PMavhgJzhOi7O/MHfWNKP9SJW7nQ9MJ5KNocp6WfW6H49E6Bpv8hpdsN89i6dZFN9Vl0UJdNZxSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749655037; c=relaxed/simple;
	bh=pGgotr9k0uSAGJ/bX3htTWswsENYRPWHaegUlGQDCiY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Af/ttMmWwHx/87IVnF8TlTfoieVAGvotBAT4CiIsMMHYC5Mn3IILYuAmPbLkcRqE+eDsUbEy3w2e0bmRV560jGtuekDT+/hd73QGZBuLwhaG1MtPogGWpllSGMUHMqDVmQl1tsS3TsTUGSmPnV8T3CgkEOYzBFF+m1OYXwYvc70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bHg0w8FU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bHg0w8FU"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55BAnqjY003259
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 15:17:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EqTW/NVYvWCa/RrQ71wsb3xnRvish0J2TidcBsJz/7o=; b=bHg0w8FUw0YHtQ1/
	sj9ponopkcNURpPNqj5l1H+rnMWzzdZ7SZLG1ZXxNPz3yyk6zC3604OL+CJbpwo9
	5iQXv4yib1niyonEkfGcnjVMxlMGGjD/S35GG2rzoa3W6MnIPkKV0ukZR+uY6+sM
	qYm3lnfUXwLKcHHntAus0CvsV4c4I4I39ItEN16x2pqVAXInbdJZ+CuPcu4Mz0hw
	t0L9Fxaz7+syk/gz1ulRNnqjepbu2Ik+yqEs5XCsi9Om8svcCxehpJ9gfGXlyJC5
	jec5kGcgc/jq4btiB5AqXBLNVPISFo0NRW57EggMVh3IVCk62wAFK3ZfUVx3kKUI
	DX3s5w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4778cwgres-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 15:17:14 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d0a9d20c2eso21129485a.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 08:17:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749655034; x=1750259834;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EqTW/NVYvWCa/RrQ71wsb3xnRvish0J2TidcBsJz/7o=;
        b=VHIDA+zg6NhNqCjeTyrSJYSbz9/kJgzqWvD7hOta0o4Dkfu2UHoFJFDYyln2bzKpqy
         eFJK3uGIBD/ZBLSafuYwDQ7y7iW/8MCq55E/T/JrL+yV6HoOTEC1KSI1qyodQzsQTXEB
         de+w1A2R9BX0Ug/avVvcvKublwd9JSPrCt/aoBrfXb8ZD6bbrt7lgH3ya3NAiSyw6kPT
         7NIUrh5WTbAwUDEy9xo7JK+chGkHX5e/QRe0nX6dLVyID1EIb5FMy/Lm9L2jg+lbZzEv
         MZNigyqQJoM2PVjxkDvwz70ZewKxHFHun5LA5+o+KzL1jLMMyuPXcy37aRSw/8ICDl4n
         tyXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwtFOrQpcsD0hBvf2jGkmV1IBp19V6TD0u6X1ZK0YIn6tECL/AyzLAoBnXCbaspgOLX+7klCvpQ5nckq4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+mO6y1QhaBD/ByA2NVekLJN9nlDRqJYt0d219fp0blCrgVHwp
	/NU7iw4jYRZDP9ULBxzg1Zk2Mcts5ZyqOvd4Yfr9j3w7taXD6iS4T0U+sIaz1f/1kvUoaJKLa/G
	9cBZLZ/zLtq997Z4tOXCXW5r1r6Vkc7DE8IgFlfRJAZDqcSeIZWvoSZ7l6zkikXV/sx8=
X-Gm-Gg: ASbGncuWWtiFo4KaaIrUDTSYaiI9EztYVAo327oKaFtqfcxuZZoFJeibcdqR9Bk61El
	oFfltFlZuSV1SWZo2ore3smgzo+JP2h99MC1CCnw/PY4ZZYoZuhWlER5nt1WgCye2BKy/YvJkKr
	V0zjbHSBLZG3WiEp2hsClmq2mzuG+Db5KrmI8JMf8+fb1k5P7w7HsFY7nLs5k80OYxvs+ymbUa4
	2cLr7+y6DBwp8iXKE30uf8mNnbqbmXtmGjQTVJLXp5fYg/kbDKT4q/bcbZvJHH3imq0tJ7SKr03
	dhctTd8FDBQhhWofo6PTJSJt5zdjVdgbYtMDEFIQFxzpTEGmErG6wv8f5g7uS9fkx6MONaxBwJU
	hhMQ=
X-Received: by 2002:a05:620a:800c:b0:7c3:d3a0:578d with SMTP id af79cd13be357-7d3a8865591mr218867385a.14.1749655033552;
        Wed, 11 Jun 2025 08:17:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOlrj+WvRgsqxAguisTMF18suedyxOAw5Xm9Xpltd4DgN1JJ+kNX5luk8nv8h7J7EhzglSGA==
X-Received: by 2002:a05:620a:800c:b0:7c3:d3a0:578d with SMTP id af79cd13be357-7d3a8865591mr218864285a.14.1749655033020;
        Wed, 11 Jun 2025 08:17:13 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc1c771sm906550266b.103.2025.06.11.08.17.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 08:17:12 -0700 (PDT)
Message-ID: <7eca5cd3-9ab8-4c42-93e8-d8043dd26408@oss.qualcomm.com>
Date: Wed, 11 Jun 2025 17:17:09 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: qcom: sc7280: Move phy, perst to root port
 node
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring
 <robh@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Krzysztof Kozlowski
 <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_vbadigan@quicinc.com,
        quic_mrana@quicinc.com
References: <20250419-perst-v3-0-1afec3c4ea62@oss.qualcomm.com>
 <20250419-perst-v3-3-1afec3c4ea62@oss.qualcomm.com>
 <20250423153747.GA563929-robh@kernel.org>
 <2ce28fb9-1184-4503-8f16-878d1fcb94cd@oss.qualcomm.com>
 <ba107a41-5520-47fa-9943-6e33946f50b1@kernel.org>
 <56eccdb0-c877-431d-9833-16254afa1a0c@oss.qualcomm.com>
 <77eeca94-0703-44c9-b30b-17fc989dedb7@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <77eeca94-0703-44c9-b30b-17fc989dedb7@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AaixH2XG c=1 sm=1 tr=0 ts=68499dfa cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=lYUf8r55RHZWWh1rIM8A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: wiwohyjH6PNaFBR6yBSk6IoCjf882XMi
X-Proofpoint-GUID: wiwohyjH6PNaFBR6yBSk6IoCjf882XMi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDEyOCBTYWx0ZWRfXzK2rL4CaIxpa
 bx42up7zKyvy6rVI1Fun7J1eU1o5Nk4HPnBystJ7DTOX2E4x9GqSkmJR6RFeQvlo1Eba8IMzISO
 L8GaG51GOhkG50fVM6ww+Ve+9DlVCEortR9wAxmzqIln63KpRarQZI1NCg2IZswpAkKbf+QYL50
 LJ35KF/L6mHFJb59o+OI/Oqh+T2CXyF7pkM/YsiEu4DR3rWQIA+dJDt6zNbhsOWbTQTbZgRgfo5
 vnMU8+bNwka8jzL4Mm840ZbqJttiFfLeizaFjjipmRflBkEmA2EoTiJ7ukbV+jodC/vgyIY2Bwy
 ScKrLkamq66OPSRX02QQ6RytpxvKYVd9XKNJ3d9IvU5JSWN5aVquAaoX5Nq15Qlc5KEPHNS8naQ
 OwPzCPQH04WOA36EyonRIFWtXQ3wWRf1FYsl+ijYVyv1vVtVAFqR9Aghgxlrb0RYmGok+Re9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 bulkscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506110128

On 6/11/25 8:36 AM, Krzysztof Kozlowski wrote:
> On 10/06/2025 15:15, Konrad Dybcio wrote:
>> On 6/2/25 3:01 PM, Krzysztof Kozlowski wrote:
>>> On 08/05/2025 16:26, Konrad Dybcio wrote:
>>>> On 4/23/25 5:37 PM, Rob Herring wrote:
>>>>> On Sat, Apr 19, 2025 at 10:49:26AM +0530, Krishna Chaitanya Chundru wrote:
>>>>>> There are many places we agreed to move the wake and perst gpio's
>>>>>> and phy etc to the pcie root port node instead of bridge node[1].
>>>>>>
>>>>>> So move the phy, phy-names, wake-gpio's in the root port.
>>>>>> There is already reset-gpio defined for PERST# in pci-bus-common.yaml,
>>>>>> start using that property instead of perst-gpio.
>>>>>
>>>>> Moving the properties will break existing kernels. If that doesn't 
>>>>> matter for these platforms, say so in the commit msg.
>>>>
>>>> I don't think we generally guarantee *forward* dt compatibility though, no?
>>> We do not guarantee, comment was not about this, but we expect. This DTS
>>> is supposed and is used by other projects. There was entire complain
>>> last DT BoF about kernel breaking DTS users all the time.
>>
>> Yeah I get it.. we're in a constant cycle of adding new components and
>> later coming to the conclusion that whoever came up with the initial
>> binding had no clue what they're doing..
>>
>> That said, "absens carens".. if users or developers of other projects
>> don't speak up on LKML (which serves as the de facto public square for
>> DT development), we don't get any feedback to take into account when
>> making potentially breaking changes (that may have a good reason behind
>> them). We get a patch from OpenBSD people every now and then, but it's
>> a drop in the ocean.
>>
> I don't understand what you are commenting on. Do you reject what I
> asked for?

If the general consensus among kernel PCIe folks will come down to what
this patch does, I think it's fair to shift to a "correct" hw
description, especially if this is a requirement to resolve a blocker
on functionality (which the author didn't clarify whether is the case)

Konrad
