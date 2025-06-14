Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B7F2E62D6
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 19:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749931160; cv=none; b=DzQYbW16uFDbEf/iVC3wjigmg3NueQu6NhMjyP+DrPJ4JB5cmu6+Xt5H3orkXFR/+I0hCbhR2HUCbPrEEnoBgVjjk8h4U27R0n9ddWCLRDAvgsB1hv32Sl4Eatm6m5RzcxkTrLj9NZjtOOi1LQU4aAJuGRnd3F9CDpAk2UFAfts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749931160; c=relaxed/simple;
	bh=PZaEJQhz3tByOxc2e8q1GMIyVFTagBkfd0BJeUZoZW8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T0EUS3u/6rxxHelNHXWV4Ppw5MU7r0PV6JhTX8xP913TGQUrF/NjNvgoU/jowpv7dskM5FhcCegjHRGzyP+o/c22Wg5b4uDUo9kWRhvR3FfIQQevG4TqEAPT07wjifG5PwMOwB7wqpQoyR32RKSCTRWeZDFjR6wfJbpL8G/JUbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dAMvxHGf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dAMvxHGf"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55EEjHFj000948
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 19:59:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D9Yz9eeOEAB6gwmE/XjUJssKvHuIHZG5zhBMZH1Z5yA=; b=dAMvxHGfPG4PEBnn
	4YUTpSk+0+m8gwP+g0AVnupkSOtc8TxpsPuUpn+mQ/1K6c/Z8Mqb2PdT/Ar/I1X5
	7CLLBd0dazKzV3QNASAhB46pQ8EkeqAsM3x0+LIPrABaMJvRuoa+lbh3gXmhmLRV
	Z4O4hyUfV/+gWjdrJgDPVXse2LGUCFXv3OYynO/ECvgfdBJGa8DCK3+LvWJdtXaz
	sp/O7RIX5ZfT7E5Nvbk42m9hA1aXhGpk8q6HvfVFgY8blWLG4FcWtWz//I42GS5Q
	Iu8+eRf5QjdyzkTaUfjIhbeBLY/t8xUL5n+Y6dNeojBYbgNzyonLz8ll4Er6xMrf
	2h3oDA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791h90yhj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 19:59:18 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f8ca9286d9so1023746d6.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 12:59:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749931157; x=1750535957;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D9Yz9eeOEAB6gwmE/XjUJssKvHuIHZG5zhBMZH1Z5yA=;
        b=Lbo+KMRSorreWRxhcFyzUkuaG3wVqLw0RchK91ZpQCKEiUvcYmxnfbjHnxvXaw2tT7
         LodQLG8dvc8ijW2nfiIoah8F7tgdsW6hIBQOKqXKcNORGqR61jwB+jp4h+weAHJtBE82
         IpeBDvORX9slwsu4ennyFfEMpknJVTFb88wmzxPByLcrDBAky8QEp/noJ5xpB2OoCq2O
         z+hl/8znZR4GIfAHzcQuTA2Shi4N0YvFZObfGxkLc3KwgSD3OzKgDyWidivq2Syx9uwP
         4LeQI8lw5I2z3Tij+I9eKlK7oVmIWK5cYhL7NKWqSpHvODQBbEcAJe1kb974zTbLLc3l
         0iTA==
X-Forwarded-Encrypted: i=1; AJvYcCWYGQqNe/RkRnY2hZgeQD9xwGwB4q+LQTq7mA2hXXKQkCE4lq7qh1oiA99xpPh4SqEkGDeuXvilQTAFmgM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWcPbl/BMO1RcdvRiBrGDbI9zVnEH1bt7eqzrDGE8i8Cm0f9gM
	irjOWvwSSjpMrtpC92upDAEyxhEoXaHvHArHwx/IdDxif4/daVB7ntKZ8GKsES4gKNSMKeYH8+T
	sG8xVhzAiq3cp4sGMuah8917qd8i0xsWSduNUH/A1aDzz9FD5eW7VOGwOucsNGChOVYk=
X-Gm-Gg: ASbGnctaKHnUwMIwlu3bmbJWVRTFjK5rBQRQXJeJoz4uocyznty3QbkPuWzSEW3bg8r
	nzDR5eNpDwdY33M1ZlKVMiMlq508fIAbIJSoRF6bk1bGf7s8vmvrX8iNKRb/DS1sY87PyWztyY9
	Lln0g7DTH+kRbOzeiNKSfx4vT1lB10WAfaEhmXihQxdaZLyMZ9DSy5QYUvljyCkHtRiwr/m1SgR
	lpP6teB0dxh4A3UXp8fMZqZX9PoOMiIC4XQdA8eflMH17b10KbarSaw0ROgXj+PJdaNAWCp8n5b
	9j+AJ080AlykoJkkUgZSek7LUfK7ynzwMVzlIIDsyLnIiraBkL258cWiLKH9trs8GqeoH1yuE13
	FkAM=
X-Received: by 2002:a05:6214:1d25:b0:6fa:fcb0:b899 with SMTP id 6a1803df08f44-6fb4779b7edmr21624266d6.4.1749931157283;
        Sat, 14 Jun 2025 12:59:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyfvXu2z/Eu8GxiF3dbJxs97S6hPTXH957lzGZe6VLmsR4eBt3mhoTtVoO+YoinFTILZFt4Q==
X-Received: by 2002:a05:6214:1d25:b0:6fa:fcb0:b899 with SMTP id 6a1803df08f44-6fb4779b7edmr21624086d6.4.1749931156870;
        Sat, 14 Jun 2025 12:59:16 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec8158d33sm356206366b.31.2025.06.14.12.59.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Jun 2025 12:59:16 -0700 (PDT)
Message-ID: <296a9ab8-04e3-4623-8246-c8fd3fca8d98@oss.qualcomm.com>
Date: Sat, 14 Jun 2025 21:59:13 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] phy: qcom: qmp-pcie: add x1e80100 qref supplies
To: Johan Hovold <johan@kernel.org>, Wenbin Yao <quic_wenbyao@quicinc.com>
Cc: catalin.marinas@arm.com, will@kernel.org,
        linux-arm-kernel@lists.infradead.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        vkoul@kernel.org, kishon@kernel.org, sfr@canb.auug.org.au,
        linux-phy@lists.infradead.org, krishna.chundru@oss.qualcomm.com,
        quic_vbadigan@quicinc.com, quic_mrana@quicinc.com,
        quic_cang@quicinc.com, qiang.yu@oss.qualcomm.com,
        Johan Hovold <johan+linaro@kernel.org>,
        Abel Vesa <abel.vesa@linaro.org>
References: <20250604080237.494014-1-quic_wenbyao@quicinc.com>
 <20250604080237.494014-6-quic_wenbyao@quicinc.com>
 <aEBh2xHu3QDtUrxe@hovoldconsulting.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aEBh2xHu3QDtUrxe@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 6KVw1zbTXb24b7pK3tt137rxBpll7pF0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE0MDE2NiBTYWx0ZWRfXyBGkU4XdTKlZ
 HggdnleTTqVa5sQutTneixaT6DcteoJCOgKI1/ZMqMfADUdUDdrbRQuxXDiTLYbwHgsJqevCPhu
 QDYn+K3piDMNYhFBBDCPdMNvdFxzuPTL2ySRap6H/fA+cxjZa3h6B9WjJ2qMj6PtuPphSO9X5pf
 XCynhyOi9I751tq7xjLr6IrVNUqNOdQTTJVzvNF7MQziCwS+1V0gT2I9o0iA9dV8sGo1Z+MgApp
 bHKfRTpJJVEG47WFBnxeV/2d28MFta7RI8LyMigNZZA3orlJlBSvJbZcwZFIGHk/D5RFI1J8HWW
 k8Zi1jDbW+9Av8giGAAquICwFG4miAcpqgYeYRBiIR7Dgo5XBmk0W5XYEC3VEnawC+zXi7G2/YC
 bJTIm6oaAW4DiHOG5luOPUJfWhxQuhdd3Quasev+B+zda+SMr0tKki0RdhpRySmcyD0Ra/XS
X-Authority-Analysis: v=2.4 cv=UL/dHDfy c=1 sm=1 tr=0 ts=684dd496 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=zitRP-D0AAAA:8
 a=EUspDBNiAAAA:8 a=6rhPmxELWQzppWOSQc8A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=xwnAI6pc5liRhupp6brZ:22
X-Proofpoint-GUID: 6KVw1zbTXb24b7pK3tt137rxBpll7pF0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-14_08,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0 mlxlogscore=999
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506140166

On 6/4/25 5:10 PM, Johan Hovold wrote:
> On Wed, Jun 04, 2025 at 04:02:37PM +0800, Wenbin Yao wrote:
>> From: Qiang Yu <qiang.yu@oss.qualcomm.com>
>>
>> All PCIe PHYs on the X1E80100 SOC require the vdda-qref, which feeds QREF
>> clocks provided by the TCSR device.
> 
> As I just mentioned in the thread where this is still being discussed:
> 
> 	https://lore.kernel.org/all/aEBfV2M-ZqDF7aRz@hovoldconsulting.com
> 
> you need to provide a lot more detail on why you think modelling these
> supplies as PHY supplies (which they are not) is the right thing to do.
> 
> Also please answer the question I've asked three times now on how the
> QREF supplies map to PHY supplies on X1E as no one will be able to use
> this binding unless this is documented somewhere (and similar for other
> SoCs).
> 
> The fact that you so far have not been able to provide an answer
> seems to suggest that these supplies need to be managed by the TCSR
> clock driver which can handle the mapping.

To emphasize, we apparently can't do it, because there exist IPs
where the QREF *ref clock* is not expressed through a bit in TCSR
(which we interpret as TCSR_CC), but the *supply* for that clock must
still be described somehow, as it obviously needs power.

To add to the mess, it may be that there is more than one supply
per reference clock required (which is not necessarily an issue
when the driver takes care of it, but something to keep in mind).

Konrad
