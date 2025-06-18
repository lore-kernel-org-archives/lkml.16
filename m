Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5113B277C8E
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 09:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750238302; cv=none; b=sfmBzkJ0fpGgS/QfuUFTsGrbb/cB/5z/oHMxiBseNfQ9Y5DyERwzOt4BS12bo7bC8elky+I6KYp2ebjYArqpWyBgvKYm9eKxsz7VID/UviNSbq06c2mYZ4s+ve+WePCI7WuZrhKSccuDU28WKGLpG4vuTbXf3pU792oh+7x+wK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750238302; c=relaxed/simple;
	bh=j3yPqxVhBRubpXAnhCCuwTQ8HVzQJfgdRxMhr4pnooM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=blKowWlsgRwz+Q8g4W1DkCHZMgyyI929Z0grpxvYmUbj4whMiGkMqK5WQy374a0RqqtZRnjR4NbHH4gmbi9bJzwn63/IteaJzeN3IgWRn+OUsCHMMdF3m1gi8iU5CGc7nSHdTwc9Mj2Zsd3BdUsPc48CzAKBm82A8bbb0w+agPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RR+NqD8s; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RR+NqD8s"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55I5lrbo002282
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 09:18:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fOJroyMKNm7vSUy+fmC7JYV71ihvrx4URxb1UJUiwg0=; b=RR+NqD8sZMb/as38
	gD30LEbfUIlOEhRpq6nBdDvla+v6cUuAJ5NAljP7PwZX/TGq5LysHHkw0O6vrToq
	f6VdfEAkgf6c2i6bTwqsBS+/pglxrQOU0suarFXR7zDPSsaFxG887rhYFhj7pcPh
	AmFdqcrsQm+xSRPDeRXcTvOOStG2TkVB7RcyKdMRVqb9lGrbYvmru2HiaJczaqSf
	WFyxidav5zESnC42tBERaWJr3QGetOLh66kJfGmegqe1UdfnPa7zLfytegT3u2lG
	flpKLGkd4o0/X4EfUuzHQTobi1ofGGEPEtVm9Q9/a6NuveZ5esFX0jiNIFa/Oeh1
	mS6x0w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47akuweymy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 09:18:19 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fabe7822e3so9354996d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 02:18:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750238298; x=1750843098;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fOJroyMKNm7vSUy+fmC7JYV71ihvrx4URxb1UJUiwg0=;
        b=Vlv1Wafz3sP6/UzhaWwNRUuhMnbYaB/dyUxwpNoFCSvnB4sPitlyYCC9++PIk6NxAo
         ruW+Q1VuKI3HASqnYxsNVk8WXNuIKKTUnhio5uvki2j2mDQk9uI68PPdNopVRPFgpnX7
         XMlORQez+aEzzUC2qoJCxEJpEZFrz0zZixUwHwHZrHWpFRIoPBTlkGpcDn1z5XZ1tJKy
         fso6CXf3bf8rIIyAvI/2kMk82wzRz9EsXvDbuqLDLgYgmDKxxKukusQNfVhzFtRaInNt
         fhrbRs3L76pqg0aU0RjefL1v6szXqpVVDqIhsk53q3k8mYpiqN8UVgH97LAefmC2NFhT
         vuSA==
X-Forwarded-Encrypted: i=1; AJvYcCWXr+kE4BeozlRzk822ayYqJ7qiG0I+aKBa6CFBDNY/SSRP6+knvjGPvzrzBuzqzRbDGUGSxZBKyBM6CKU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAorOVCcX9Zrk7Cq6GCaGXaGreTqLaMtY/NrNUDdKfsiOCEO67
	ofK0F6HuVrOYzPD4nUp9n27z7J55wvub2gDY95i/XP2u4JUfdaW4yYba7BqEfKCO7UQ9xoDckjc
	NKW4VUH3vZwI7dHTcrBLQZeYZU556I90tfL0CYKyOoQDYYDKG3xeo3CpiMhYnDE8CX5o=
X-Gm-Gg: ASbGncvPZEJhuW8KGFB4g3tTFNDy/7hujh+/i80537FHkbfXTgmK1Qjnb6JnaXslkDt
	VozXuAxplS4rOzyxcgxkiOmtjQD8tyy1BKEBPGNJFxJbaCIGjqZ3+ZC0j7e5IOb+SgKJ94udrTB
	W1lreqUO2ri/MW9fZw0ZrItY8vVkmLpGToAK4N3HcT8OT2sv64OQRPSRzsFdAUnhY2j4P6R5TDp
	FeY+PPG3h6eS7TTlppwmIdz0IIkw7lTmgtg6imOVRfalJTGduc0cD9e8Wn/8h5S2sPctamiFDvm
	cBIQiujLzOVnYtpTTmW3ewF/Vwzw+VqlYVoSN2dg8rtuLeoqtIRYDBXpeozeemMMjoEjRfn4T1n
	vOxk=
X-Received: by 2002:a05:622a:1a15:b0:474:faeb:50aa with SMTP id d75a77b69052e-4a73c55c1c7mr88059931cf.5.1750238297815;
        Wed, 18 Jun 2025 02:18:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFroTGQ38e7nIabQthNy/Uv5H8RTwz2UgGQOdmYHCVSIwztO+5tMX7dXUQ+pcaxlMq4WUfu4Q==
X-Received: by 2002:a05:622a:1a15:b0:474:faeb:50aa with SMTP id d75a77b69052e-4a73c55c1c7mr88059761cf.5.1750238297388;
        Wed, 18 Jun 2025 02:18:17 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b48dd68fsm9525214a12.22.2025.06.18.02.18.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 02:18:16 -0700 (PDT)
Message-ID: <db65c9f0-334f-43fb-bddf-316bf883a848@oss.qualcomm.com>
Date: Wed, 18 Jun 2025 11:18:14 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v3 5/6] wifi: ath11k: choose default PM policy
 for hibernation
To: Johan Hovold <johan@kernel.org>
Cc: Baochen Qiang <quic_bqiang@quicinc.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson
 <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
        Takashi Iwai <tiwai@suse.de>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>
References: <20250328-ath11k-bring-hibernation-back-v3-0-23405ae23431@quicinc.com>
 <20250328-ath11k-bring-hibernation-back-v3-5-23405ae23431@quicinc.com>
 <d0cd065c-1cd1-4e56-8c57-60777b1f3664@oss.qualcomm.com>
 <aFJ-SwT1g500h3kC@hovoldconsulting.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aFJ-SwT1g500h3kC@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: dmBTH6KEyA4Di3EtoZemDCWE4UqaFhmy
X-Authority-Analysis: v=2.4 cv=He0UTjE8 c=1 sm=1 tr=0 ts=6852845b cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=ueFis7n8dWqy784j0wMA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: dmBTH6KEyA4Di3EtoZemDCWE4UqaFhmy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDA3OSBTYWx0ZWRfX/j8jRY97axOH
 XT2WdTjircyiCUtdoMuySSlZxWwK/bFrLnzFzqAt45kGfm0wGKVochCNNcMzik3gT+eJA32IJAW
 8O/MBD0kxvsfq+S3vzM3/RCR1oj8GPnCx+uMSjPaFgRVe1QjbV7BseNiD5KJPMCiUUVkmfPO/Jf
 I1lRzG8uGZLFVY4hPKYVv2tIY+EsOxuCzUEao2E8jCvlefRu7MUuAwdxEmc6hwmerGgSQHbC5D6
 sQiGPpcbwMY/BfakPn3ffPcGhxjcRgYUsjeurvxSIpwbh/iaO97EpC/qWTHvKilsOoHpL5RFNRq
 81s1WZJ7YCnN+kU7rvFj63mbI5nTIfdC1dnjPJi1eWtFDgNFtf25fuchCINJKxYFMY2BCF/DJZS
 ShNsSDHRNn2amzBGx3h3lUVWwyUfA3TlpV0JARH5P+RoM69QsHT1Rp8NMdnNvhkc0ZSGzhRR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_03,2025-06-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 bulkscore=0 mlxlogscore=999 lowpriorityscore=0 phishscore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506180079

On 6/18/25 10:52 AM, Johan Hovold wrote:
> On Wed, Jun 18, 2025 at 02:15:04AM +0200, Konrad Dybcio wrote:
>> On 3/28/25 6:32 AM, Baochen Qiang wrote:
>>> Now WoWLAN mode is chosen for those machines listed in the quirk table.
>>> This works for suspend (S3) but breaks for hibernation (S4), because
>>> WoWLAN mode requires WLAN power to be sustained, which is not the case
>>> during hibernation. For hibernation, the default mode should be used.
>>>
>>> Register a PM notifier with which kernel can notify us of the actual PM
>>> operation: if system is going to suspend, the original PM policy is
>>> honored; while if it is hibernation, overwrite it with default policy.
>>>
>>> To summarize: for suspend (S3), WoWLAN mode is chosen for machines listed
>>> in the quirk table, non-WoWLAN mode for others; for hibernation (S4),
>>> non-WoWLAN mode is chosen for all.
>>>
>>> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30
>>>
>>> Tested-by: Takashi Iwai <tiwai@suse.de>
>>> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
>>> ---
>>
>> I've bisected the following splat to this patch, still happening on
>> linux-next/master, WCN6855 + SC8280XP CRD, 100% reproducibility 
> 
> WFIW, I'm not seeing this with 6.16-rc2 (which has this patch) on either
> the X13s or sc8280xp-crd (ath11k now fails to resume on the latter
> because of missing regulatory data, but that appears to be a separate
> regression).

Do you have CONFIG_DEBUG_NOTIFIERS?


>> [root@sc8280xp-crd ~]# echo mem > /sys/power/state 
>> [   20.267830] fb0: Framebuffer is not in virtual address space.
>> [   39.863070] PM: suspend entry (s2idle)
>> [   39.908067] Filesystems sync: 0.035 seconds
>> [   39.934453] ------------[ cut here ]------------
>> [   39.939259] Invalid notifier called!
>> [   39.939268] WARNING: CPU: 5 PID: 513 at kernel/notifier.c:79 notifier_call_chain+0x84/0x1a4
>> [   39.951566] Modules linked in:
>> [   39.954732] CPU: 5 UID: 0 PID: 513 Comm: bash Not tainted 6.14.0-rc4longbois-01215-g32d93b51bc7e #12177
> 
> 6.14?

g show 32d93b51bc7e2e557771abe4a88da69c609e3d52:Makefile | head

# SPDX-License-Identifier: GPL-2.0
VERSION = 6
PATCHLEVEL = 14
SUBLEVEL = 0
EXTRAVERSION = -rc4

it's been in the tree for a while

Konrad
