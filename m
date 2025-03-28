Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51211DFFD
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 12:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743166476; cv=none; b=FMxYKbGsY8yWwLuGlh8L+H1mhg/HPKZxrUEr+byDVlsJeNSdQdf+Sl1MUOwmpD6a9x/AezOFwCQFU8V9vDT7JcsO78/SomwmE5y1enGCpsP2josILBqtyFusNQ/RG0zEko0o3l/hsnPzhfchA8V8MxuJnyWN1fDcOf1ieivHIPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743166476; c=relaxed/simple;
	bh=G3WWYuc5GvW8h32iSiZgqgWX1hDfDZ8BHoTOP2eBi4c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EPGRAlogHyEH7XHq9VKUJqiIrKOYhz+XmXhCpsmNy4sLsLFBKQtU54uktNxZ+WjlcSSrxlT78d84MMKxcuKqjpOQLgZXUwu8PXmSGLB2jfDM4W3qUdn4zEFWKEFdXhH27Cx0SAnfLSmUKqrmf1x+5QNsUwVgzxrX9vfjzRZ9wWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nrYy/kep; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nrYy/kep"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52S5UlH8013917
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 12:54:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ShLIqJChs4NQY13uEAwgUNFU1goNqz+IV4be6pPmZCY=; b=nrYy/kepSE6IBcBv
	cDNecBAQRggndoQGem2wsyyOA/ab90nb6y+TXiqaDQdwa5sTh8UPzDzUHuUEzVYf
	ZoE+6xmddcg7QgMsmvoHfPezbsYbBILxd7EgZbXPOE12EqHtNJ7rZ/+ozXAXMUhb
	tXWyApgzgEDrYhPC3XBCZFuDhg27HTKOQhW+nJc8wab3CJ7w1N5WJHCSD+yOSzlW
	6WRcL3Ap7YiAgphYo5d/uYY+4upEJ4YTn7eeh2MNMCgxlxayKC0xcdg/rIgU/O0I
	4YmtBjZSTkpWtUEaohkzXyN6X/0+Gby2lzz9kVotPH7uhbPalnSsY1s/tqiGK14I
	0rhI1Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45mffcqjuw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 12:54:33 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-22410053005so60701785ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 05:54:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743166472; x=1743771272;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ShLIqJChs4NQY13uEAwgUNFU1goNqz+IV4be6pPmZCY=;
        b=guuZB+Fss2/N4kyhYFsb2OCa77jLBWmMSwRVaRPl6e1nqg+7X7sDCJ9CdfkL+NED48
         uzcmUS9K5AocP80T1rbw52fjIYrl+gfQxuBeALSUqIDGTGBq9wEW8cWcvVkNGluFXdAJ
         kzlbXNa4U8ciNwXHYCiZ/szW8ZaydfMatEy2kalIiMeWEfqjRLHCQ7Zlk/7ny956PYlJ
         NRnOXYBi6Qi5qLYtar2pnn6isOfw5g3WV/e9/Mew8A2KRcJ5yFftcdjT8kCMVVAtlw0M
         oeFm32AWkrkn2c/0+tL+UJjOH4YkCVNQ6hHcgRuJZfmZ44Mc0w+HAqFZq4st1Dx8EVtL
         48eg==
X-Forwarded-Encrypted: i=1; AJvYcCVdabyBa2P3mPSXpqkSFlVkGnvti5OXFOSg9M0DJliAf7S8ppOZL9cJ65DflkXCsWvZTm7luKd+8r8ny20=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6iocTyY2rlNBktuxvtpSO1umkL1EFJ3u4lD0Dfevqg0kUYBiU
	kn6ucQthqADDIcuKKFjOwzCF1fSklxuoOmCWtw1g1lr+pLZyMDTkZNZJtPD4ATNoTKIRvqMb7+B
	/rMF2tnUXWtskNw+ZZVQlxEdZH6a7/cfxzENO+6QYwwhP12scz1BtpQ4Ag8UObSk=
X-Gm-Gg: ASbGncsbzYP2g1Z/wYmlCFAR0O4VZPq8hKI43TSjBTFAbp8UzziSC295lY82kvkEKwT
	BdeuKUXy7ap/Zuv+nwp9jvOEx1hcrP3EZf26iNbmROjXdmJ81b5qYR9LGg9UBNE/Qy9rpI1cnxn
	aPoweswgED6MGCNu2Z5xCBwmfWNk0WEMIVnv81L4a29jQvyYddzKbZWzIH7FEotvK+8WIBIAwMo
	6e3zXbaB6x52k5p/+ven1DIUJBYeLxkADiYwqdcN4/h3w6TPtA3XrHnZoNG0dnft0X6WyrtFZ0p
	k5cjVcrbXVwijwJTVL6Thny6MAjo3Nd3AySsCIGssQH+JYk=
X-Received: by 2002:a17:902:e805:b0:223:6254:b4ba with SMTP id d9443c01a7336-22804840baemr107748765ad.13.1743166472168;
        Fri, 28 Mar 2025 05:54:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3anLwA38qSCKKag9lmtLmor/BQAnLHTK54dL2de4RfOxS+atpW42HtIHCjKX01cq8OUGIKw==
X-Received: by 2002:a17:902:e805:b0:223:6254:b4ba with SMTP id d9443c01a7336-22804840baemr107748345ad.13.1743166471521;
        Fri, 28 Mar 2025 05:54:31 -0700 (PDT)
Received: from [192.168.29.92] ([49.43.229.109])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eee5011sm17016405ad.103.2025.03.28.05.54.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Mar 2025 05:54:31 -0700 (PDT)
Message-ID: <090572fa-7c4c-798d-26e9-39570215b2b7@oss.qualcomm.com>
Date: Fri, 28 Mar 2025 18:24:23 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v5 1/7] arm64: dts: qcom: sc7280: Increase config size to
 256MB for ECAM feature
Content-Language: en-US
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
        Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        quic_vbadigan@quicinc.com, quic_mrana@quicinc.com,
        quic_vpernami@quicinc.com, mmareddy@quicinc.com
References: <20250309-ecam_v4-v5-0-8eff4b59790d@oss.qualcomm.com>
 <20250309-ecam_v4-v5-1-8eff4b59790d@oss.qualcomm.com>
 <3332fe69-dddb-439d-884f-2b97845c14e1@oss.qualcomm.com>
 <0cc247a4-d857-4fb1-8f87-0d52d641eced@oss.qualcomm.com>
 <h6bnt7ti3yy3welkzqwia7kieunspfqtxf6k46t4j4d5tathls@hra2gbpzazep>
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <h6bnt7ti3yy3welkzqwia7kieunspfqtxf6k46t4j4d5tathls@hra2gbpzazep>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CdgI5Krl c=1 sm=1 tr=0 ts=67e69c09 cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=YFFC5ybGexI6wqmPE8t+iw==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=taV9Rfz_io-hon4YrvgA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: an2U1Brw88X87cAeVkl7i7GCQssZsHzQ
X-Proofpoint-ORIG-GUID: an2U1Brw88X87cAeVkl7i7GCQssZsHzQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-28_06,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 spamscore=0 mlxlogscore=999 lowpriorityscore=0 suspectscore=0 phishscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503280089



On 3/28/2025 5:14 PM, Manivannan Sadhasivam wrote:
> On Wed, Mar 26, 2025 at 06:56:02PM +0100, Konrad Dybcio wrote:
>> On 3/11/25 12:13 PM, Konrad Dybcio wrote:
>>> On 3/9/25 6:45 AM, Krishna Chaitanya Chundru wrote:
>>>> PCIe ECAM(Enhanced Configuration Access Mechanism) feature requires
>>>> maximum of 256MB configuration space.
>>>>
>>>> To enable this feature increase configuration space size to 256MB. If
>>>> the config space is increased, the BAR space needs to be truncated as
>>>> it resides in the same location. To avoid the bar space truncation move
>>>> config space, DBI, ELBI, iATU to upper PCIe region and use lower PCIe
>>>> iregion entirely for BAR region.
>>>>
>>>> This depends on the commit: '10ba0854c5e6 ("PCI: qcom: Disable mirroring
>>>> of DBI and iATU register space in BAR region")'
>>>>
>>>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>>>> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>>>> ---
>>>
>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> I took a second look - why are dbi and config regions overlapping?
>>
> 
> Not just DBI, ELBI too.
> 
>> I would imagine the latter to be at a certain offset
>>
> 
> The problem is that for ECAM, we need config space region to be big enough to
> cover all 256 buses. For that reason Krishna overlapped the config region and
> DBI/ELBI. Initially I also questioned this and somehow convinced that there is
> no other way (no other memory). But looking at the internal documentation now,
> I realized that atleast 512MiB of PCIe space is available for each controller
> instance.
> 
DBI is the config space of the root port0,  ecam expects all the config
space is continuous i.e 256MB and this 256MB config space is ioremaped
in ecam driver[1]. This 256 MB should contain the dbi memory too and
elbi always with dbi region we can't move it other locations. We are
keeping overlap region because once ecam driver io remaped all 256MB
including dbi and elbi memory dwc memory can't ioremap the dbi and elbi
region again. That is the reason for having this overlap region.
> So I just quickly tried this series on SA8775p and by moving the config space
> after the iATU region, I was able to have ECAM working without overlapping
> addresses in DT. Here is the change I did:
> 
I am sure ecam is not enabled with this below change because ecam block
have the address alignment requirement that address should be aligned to
the base address of the range is aligned to a 2(n+20)-byte memory 
address boundary from pcie spec 6.0.1, sec 7.2.2 (PCI Express Enhanced
Configuration Access Mechanism (ECAM)), with out that address alignment
ecam will not work since ecam driver gets bus number function number
by shifting the address internally.

If this is not acceptable we have mimic the ecam driver in dwc driver
which is also not recommended.

- Krishna Chaitanya.
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> index 3394ae2d1300..e41c8e3dd30c 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> @@ -6395,18 +6395,18 @@ arch_timer: timer {
>          pcie0: pcie@1c00000 {
>                  compatible = "qcom,pcie-sa8775p";
>                  reg = <0x0 0x01c00000 0x0 0x3000>,
> -                     <0x0 0x40000000 0x0 0xf20>,
> -                     <0x0 0x40000f20 0x0 0xa8>,
> -                     <0x0 0x40001000 0x0 0x4000>,
> -                     <0x0 0x40100000 0x0 0x100000>,
> +                     <0x4 0x00000000 0x0 0xf20>,
> +                     <0x4 0x00000f20 0x0 0xa8>,
> +                     <0x4 0x10000000 0x0 0x4000>,
> +                     <0x4 0x10004000 0x0 0x10000000>,
>                        <0x0 0x01c03000 0x0 0x1000>;
>                  reg-names = "parf", "dbi", "elbi", "atu", "config", "mhi";
>                  device_type = "pci";
>   
>                  #address-cells = <3>;
>                  #size-cells = <2>;
> -               ranges = <0x01000000 0x0 0x00000000 0x0 0x40200000 0x0 0x100000>,
> -                        <0x02000000 0x0 0x40300000 0x0 0x40300000 0x0 0x1fd00000>;
> +               ranges = <0x01000000 0x0 0x00000000 0x0 0x40000000 0x0 0x100000>,
> +                        <0x02000000 0x0 0x40100000 0x0 0x40100000 0x0 0x1ff00000>;
>                  bus-range = <0x00 0xff>;
>   
>                  dma-coherent;
>   
> 
> Krishna: Could you also try similar change on SC7280 and see if it works?
> 
> - Mani
> 
