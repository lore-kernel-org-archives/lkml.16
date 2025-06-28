Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5E01A0703
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 14:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751121345; cv=none; b=EfcI7tQSdbzJ4UDEGVnTSVHVKksyuZR4qIgHoZl+7eTh81Ys67BkHKvnbZOeZafJywgUxLPt5/iavtFl/V3rTTsxHW+ymVJ1s7oTqjfkeQVb05jcQkxCiKHYY2TD5Xevy8qpqArQkuSfTuQv3tfc+mw+eC9Edx8xvo82+kJIFvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751121345; c=relaxed/simple;
	bh=ZwmPTuYd//NpHjFSXyhsEFGoqU1ElCwFt+fOoA9FZUQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rRzEDFZUMHLHMkuCjprDX3oiQSVcRp9u63rURPBZ1KjahLYEjI3C6dGnkbWZkkxGxdiy9/MySIWVtrUfXR4Veetes0rQnXi8t8YS9q59BHBia6qIl7u1iFdVSjMdSAsKwQ2NbOLRCp2L8GWObMby/JMPUqFIWNE83WMy41bXPj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nd6YdQZC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nd6YdQZC"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55SBTjVi030852
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 14:35:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RdooniM02C9R/EkedScsqRhlTqjpq/tmchEHaz+Tpss=; b=Nd6YdQZCOvbIIYgI
	oRCbFGXKlgxLN8bai56XBlG3uGawpnQAR4z8kipF0zM7silKfN9ed3cl75vE+OIO
	siWJtAtSJU5AecbUaF8hZJ/y6Eq0tYP8rBbeV9fgK7haA233ltYtFrepcFwShiI0
	dHHE1Nmw9kHnoBhvMVfC/zLsH7NEFnR0oSF4ioK7tZ03eFykE74JbRm/aFHL6sMo
	/+H4t3UmLG8QWz20g9huUm+cRteyYZjPrP/I7xNtaHLGfvMZ7hh67dfMPt0LFh5i
	RAbGZH8fpfKVtQj1zXU00ZNP7v3gxb994KaoG+VYm0A/FU/RMWRO0qAeQuu9sAkZ
	CLg//A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j9pcgnxu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 14:35:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d0979c176eso69459485a.1
        for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 07:35:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751121336; x=1751726136;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RdooniM02C9R/EkedScsqRhlTqjpq/tmchEHaz+Tpss=;
        b=UeA+w6RUVg2uskqCLCFP05Y97ffpVUIoQ+ZbHTEqVE6Ri0pNM0ylDn/79oMaVHdJju
         jXxzu8qmH3xUn+x3nxpCfTDLBSxgmysoP1U19gpKN1cNri6QzzS6GtQzaDWVck+MQUnB
         ztnmQhz4DBU5H6/pg2PeNbUQkG4UisZpWVcFlNxisn3KkdsW8qT3IqjKTSmPiUDi38f/
         wC0Uyna8DVL4vUNeiFTOB+tsg9dz+a3I36QCQ6QY2EN25zIHgDeTn2yjoODmtvScpvSP
         mIdOKzxS8fSKl5V7/oq9mMc0IdGSIsWBQYSwjsIRBVYm6DAbLIgjMW06G6COyAxHzQn4
         qZiQ==
X-Gm-Message-State: AOJu0YzVgtP9hQHPfrlpMKGh7EeT0mmcB+TBS/ETUb7NKBXYvLqBl90g
	kKBDd17wAghuk8Se4eHYy6Fxn4Ya0WRn80yZKJ2xU1H3FEjPXL7PzUEMH4XTnon/SxiB8MwaJfG
	UZCwN/9IizgUVPoFQnibs6EKrz7rRv3TpSTGg0e7M/E2H9/v+uwQHjpp/qRy/calVajM=
X-Gm-Gg: ASbGnct29Px5xt4se30Ay/67PJfTXuQaL4Lp8JUhrbKNbO9a0KgOt5/+3jjK237sQZ4
	7bQronHrE0z/bXpF8WSXSAV/Z+HoIfNnAh7Rs/iDBl3jhf358fDhxVmSeHvuPUud/uxRTgcthy/
	MjyADPgpwYOJEZOcsxfxoyUClfv35FLcezgVhrTxMXw28A/gt2ITceoVxsaZB/K7m2e4Fv+mzso
	bN+WuHdNBdWwslePcCdYnh3APMg9h2HdEZmMaysSdV38Wi4qE+aQGs4CJhvLpTJE7W/CGuwPku4
	d+HHIBHRgCP0ecHPU8yOpUKJBzzcodImC9Sw19yJs0fstO7NmCDb6b4z/8mrw87kKtuQw82h+d3
	VpFM=
X-Received: by 2002:a05:620a:2911:b0:7c7:a574:c6d2 with SMTP id af79cd13be357-7d44c26c479mr165462785a.9.1751121335777;
        Sat, 28 Jun 2025 07:35:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmkXpgMG0TusVkeycSb+c89XAZN62o2sArmPTQcM15a59JhXCfffsiR5C75Q4gxO0a1ZUgsQ==
X-Received: by 2002:a05:620a:2911:b0:7c7:a574:c6d2 with SMTP id af79cd13be357-7d44c26c479mr165461185a.9.1751121335381;
        Sat, 28 Jun 2025 07:35:35 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353ca2159sm327584766b.178.2025.06.28.07.35.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Jun 2025 07:35:34 -0700 (PDT)
Message-ID: <daf6ae39-3c5f-41a1-b061-498346de6fe1@oss.qualcomm.com>
Date: Sat, 28 Jun 2025 16:35:32 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 0/2] Introduce dummy regulator consumer
To: Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Mark Brown <broonie@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
References: <20250607212654.126412-1-alex.vinarskis@gmail.com>
 <8a688e9f-012e-461c-a916-f06b34fdd913@sirena.org.uk>
 <CAMcHhXpVKaWX8guog_M+5wHfJ+6uxBteNnV1xCjcDJuGFWOCkg@mail.gmail.com>
 <b481298e-319f-41ce-8a56-e3f78b8649ff@sirena.org.uk>
 <CAMcHhXoioEJH+KnLYbXmnt5eyGT-tXg0-CzLQpvj=8Jy5sGXuw@mail.gmail.com>
 <6fcbedb3-eb41-449f-9b6d-10699153c9dc@sirena.org.uk>
 <fbccc241-f957-43cf-9aa2-120e192cad55@oldschoolsolutions.biz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <fbccc241-f957-43cf-9aa2-120e192cad55@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: e7jbvhzjpRFDrNl87xkzt-TfZU5fybU6
X-Proofpoint-ORIG-GUID: e7jbvhzjpRFDrNl87xkzt-TfZU5fybU6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI4MDEyMiBTYWx0ZWRfX5er/wAP9I6ac
 1LWheGJxdgY3vE9WgTZzkNDeZojlrTtG51r+hXLq+LMsTgzIUniRsgJvBhcLvia6OEyCTPoCvxF
 rlQz+bWthBkqSmC+XKL/jgllvc9X0+inBy0usJ6PtPB7D7LvrAhQpxQmFyypEkiPKCeiqqRhMoQ
 Jj5Pr/AFWaKgyI8zHqEjWS+VRMhEwvUVYre6sC6qK8kVgNiHlFap7RcldHYN8abDbVsALXiNoz2
 7RfdpbixCI1bx59y4z5n0Mr6QyRdj/mu+2dUC2EULbyfb5dOspwAfXevnvtLYuRdV4TUZ2Z0fTR
 5iQYniANeQdiyVa4OgD921WC6Na8vzRyW8D2k0ISO9GLrXqc0Ftb8NxBcHV9eOb4X8b7DQsCJyn
 gE4O7fNzh/ABOmZME66OkSRgZNjHKo3e2N1zHY7C7sTOgdnfVT1bWx+jn0eItV6iRiX3cHFH
X-Authority-Analysis: v=2.4 cv=QMFoRhLL c=1 sm=1 tr=0 ts=685ffdb9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=AUi7sQLs0AGD5IH8auAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506280122

On 6/28/25 8:14 AM, Jens Glathe wrote:
> Hi there,
> 
> On 10.06.25 15:51, Mark Brown wrote:
>> On Mon, Jun 09, 2025 at 11:15:09PM +0200, Aleksandrs Vinarskis wrote:
>>> But how would we approach the lack of particular information, in this
>>> case all possible VID/PID for an embedded camera? VID/PID was
>>> identified by checking the actual device, which does not rule out OEM
>>> switching camera SKU on the next batch, same way they do with other
>>> peripherals.
>> I'm not saying this a particularly great or pleasant solution, just that
>> it's where things are at.  You're trying to solve an OS problem with a
>> firmware description which is a bit of a mismatch, ideally the firmware
>> descriptions would be better but that's just not how ACPI laptops work
>> unfortunately.
> 
> Just like dummy-regulator is an (undesired, but apparently life-saving) solution to the issue of not having enough info to correctly specify the power supply, it is in this use case, so to speak. You found the enable pin to make the peripheral work, you make an educated guess and define it as a regulator. For power management to handle it, you need a consumer. For all this its nearly irrelevant what the device id is (USB discovery runs via the USB host controller in this camera case) nor is it really relevant what the voltage is (also an educated guess what stand-alone USB devices would get via the bus).
> 
> Of course, it would be better to get the correct info and describe it accordingly. But more often than not, reality bites.
> 
> On that note, another example. I replaced the WLAN and NIC m.2 cards on the Snapdragon Dev Kit with an Intel i226v m.2 card that fits into the A slot where the WCN7850 was. To reliably enable it, I had to:
> 
> - either keep the whole pmu-wcn7850 definition (with wcn7850 consumer description, regulators apparently on the card and all) in the tree
> 
> - or "wire up" the vreg_wcn_3p3 so that it is activated and accepts any consumer.
> 
> This didn't go well.
> 
> vddpe-3v3-supply on the pcie slot: works, but no USB-A for whatever reason.
> 
> Dummy consumer for the regulator like this
> 
>     lan {
>         compatible = "regulator-dummy-consumer";
> 
>         vdd-supply = <&vreg_wcn_3p3>;
>     };

In this case, it's more or less easy because the 3v3 supply should
probably be bound to the PCIe port (+Mani)

Konrad

> 
> This works, reliably. The i226v card doesn't have a node, nor does it need one. The driver for this card (igc) seems to be at odds with power management, so you need additional kernel parameters anyway.
> 
> I'm in favor of having a driver like dummy-consumer to make things work when the info for a better definition isn't there. Like dummy-regulator.
> 
>> It does seem a lot easier to just mark the supplies as always on if
>> there's no integration with an actual client driver TBH.
> 
> Exacerbating power consumption when suspended.
> 
> with best regards
> 
> Jens
> 
