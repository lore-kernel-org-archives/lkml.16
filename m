Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F16239E84
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 15:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749568980; cv=none; b=HtO0p7fblohr/irKWCtSPCbY3WusKv/Hly3vjsFwgWD0XtgLggaoAd9IOvE7IWpHXSnz9OIZ9sCaFPON862gnegE9pAIgUb1BVq5qVW7UF5TuRHPZwADldmNZVCNq3CQvIKbRRs0xftAgj9BJqutqCbjAJ2XNbVn1K22n+xyfbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749568980; c=relaxed/simple;
	bh=ZgS9YhjNsHBJl3Lvr4F9rM8TY19/yblIcAWcsduVrow=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NZk9ZmPRPu405fwVMfEJMG/DBfveMnpoChELV1kP8DogsGEKA3e37TckoCdMQtBlMfya4QVfDwuraR6Ihne8izNe4cjF5tmEy+lZqRFmxE2JRYqSUFAje2kZkndGAwvv5jSm+132AVyIHrIsZ46RpoVuJNYU0mDTxIWkKEnVJ0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E7/7CAy/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E7/7CAy/"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A9ZTK0009897
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 15:22:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e114YZ488PyX5H8bdxjDah+KG/E0gP9d9huL6plo+H8=; b=E7/7CAy/wq7H5+zD
	WnX8GlFw5fc5XZz1GaHLYnYgQYBlw9d7t/vvCNU7Ata6F2W7hZH0G0VEIhquY2FU
	emqXoMl/Neq2Y2P20jr6UP58GPTSGEQTRyVhBaY40i64cCTKaKjFrJHksSQKQ/nh
	xmeey4Z9nUX7NnAxMu5mXnjcmyyWyz8a6KvpNTZEkc2y4kLsbhsNfJenKcheklFV
	Cct2stKsbtxIFebaJiPoNLcJ/samSt32ueGQbzbctSgy1KWp1/cUVNlu6Gq282+a
	rAE/hFxC+WZtaIK/orhKBpYxaK/7zm1dGI6A6AZsVLuLSV5qt12sqNh8Cjh6ewCF
	0wyToA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474d1221dm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 15:22:57 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7391d68617cso4873644b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 08:22:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749568976; x=1750173776;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e114YZ488PyX5H8bdxjDah+KG/E0gP9d9huL6plo+H8=;
        b=UlAUULhYxIAOtaQuK6nVk0hlIRsZag4rBV1E0PqtgJscpx/nWAPFv/2fSjXVO5cbV4
         e2rlXdrVjM022nRapN07Xg+//wUjEsmTd+sZ6go2PaUiyPDLxE2LoC9XHrfsHIGHVM2L
         TtTrQo78n8cJ3ykN8x5dVsegmGiiirpJLYTwMvewIz/mV6bRCLLaKtHRS3DWeaDcoPea
         L9IQzDMAtCCDUgx7n/YOPeHu4k3QAX8wgtMrSpkxo4ZgaWef/HKz0kqvwHYL+C5Q5n7j
         +1jZp+kCux/Np4BOl+VIlHVj9IJ7Wb7VZfHvbW2uRjJm0uiwbWjD4U1JYCjCSO+1m8Aw
         26dQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjpIBQXfwHveC1wsQQBImlBViqq28KgPmlmJtMJsQIKycxa3zpaul48HQhiTIe8KVWUHh9+i4bgKVOe+U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk+JjJtWBnuc01nbQjLzlqRKyKjdm8kMNJabe+sLBom6plii31
	70QbjdchYwxzQPMguvWw8ualq3BpNqkOJypNQUlH8oJQVSiibaCQndLw2dVNQNCM8r7BuCuMxkH
	DVEpVKSXzQkAQLGZii+fWxQusCBZQupX9+iVhdbm6PGqBkCBIDW6L35DlIQX3Md6Torw=
X-Gm-Gg: ASbGncv7tVfJ9cQ+aJDZy+ZyQsWN3mbq/C/acYpK4/IFReDqF2lyO4SRJKWLeCETBPz
	CACsxYoMEgtmELdWRP+z6kfmkfewiodKGU3QBPzoHsH/YDJ4q4zmsC1Er6NubJK3uq25TJEHibq
	ozCxL6DkmB4hUakXzwThw3pkeK6BXIIONBEHeelZKUvV+wZlXtJiTOg75G4dLElSV1G2uxQJjJO
	V1/KV2haHONivVkbkGaxjgdgDDGHCITQwHALBBXt9FY5AKUVY8VvdA5Wnwm3u+903DGljKcAvq3
	kw0CPuSDOi+xQdsx2fIFxC/1KQCnvpGFjs1vtNJOCmIltGfcswFgaKsSEaLxhpvJw5SAzteQ
X-Received: by 2002:a05:6a20:6a05:b0:21a:cc71:2894 with SMTP id adf61e73a8af0-21f7696b725mr5956496637.17.1749568975805;
        Tue, 10 Jun 2025 08:22:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRW9TAgrPxwCJk/o8eP9DoS0GIWBXXYaSbfoHboYL0uaKLdt5ZmSeDkSVqNYVQEjp5EHKv7w==
X-Received: by 2002:a05:6a20:6a05:b0:21a:cc71:2894 with SMTP id adf61e73a8af0-21f7696b725mr5956462637.17.1749568975426;
        Tue, 10 Jun 2025 08:22:55 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482af7aa6esm7780346b3a.59.2025.06.10.08.22.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 08:22:55 -0700 (PDT)
Message-ID: <c0bea584-10d1-4afa-a80d-594179f3a734@oss.qualcomm.com>
Date: Tue, 10 Jun 2025 09:22:53 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: semantic conflict between the drm-misc tree and
 Linus' tree
To: Lukas Wunner <lukas@wunner.de>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Simona Vetter <simona.vetter@ffwll.ch>,
        Bjorn Helgaas <bhelgaas@google.com>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Krzysztof Wilczy??ski <kwilczynski@kernel.org>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250610124809.1e1ff0cd@canb.auug.org.au>
 <aEeqkw670ZcuDdZO@wunner.de>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <aEeqkw670ZcuDdZO@wunner.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: sZy8Jv1ibeWwLyAhLnr9Obj53bm_UkHP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDEyMyBTYWx0ZWRfX0FrmBjgGJBUP
 yOVJpOYdDqIj2kl5Z+3jCUpOUPahYBhnRG91Ymt6hnLERuCQkseP3t4UUa+e1viJ7aUMETVaySk
 5i2fWSHpZiFAAx71MZDGlVjACH/vR8y6cRxq/1T1byXMjll6E/H93JM/490J4Jsz89/8N/vYI6e
 Etlx+i5C43chqpqoC9y3q1w7Ob0pcyx0ggFMSFU79e340gmA1Vg1jd3xT/TY54jBTfI6bphus3Z
 SlbdNNBzuhMiAqHr1EEpFx9TQGzIyBZ8+aIF83y97ahyEgyYHBlnvFOSi+QaO+5B9kQ2kXEgua3
 Otiblvhv/+RweeBo9NvCaipniAdgZsoE3NMbSjexzHX5n6n+iC0tlY0x0MQ8Ie76TnaZTZv1dYf
 cuiNjx/jpxGOxzqhxt770lFQFGubn4yzKmdM5Dj/guYRHYRlg+KqqcPSsJabVuJ8ljxSEKEy
X-Authority-Analysis: v=2.4 cv=GYkXnRXL c=1 sm=1 tr=0 ts=68484dd1 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=Ho3n10bA_UD04d3nvKkA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: sZy8Jv1ibeWwLyAhLnr9Obj53bm_UkHP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_07,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999 bulkscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 mlxscore=0
 adultscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100123

On 6/9/2025 9:46 PM, Lukas Wunner wrote:
> On Tue, Jun 10, 2025 at 12:48:09PM +1000, Stephen Rothwell wrote:
>> After merging the drm-misc tree, today's linux-next build (x86_64
>> allmodconfig) failed like this:
>>
>> drivers/accel/qaic/qaic_ras.c: In function 'decode_ras_msg':
>> drivers/accel/qaic/qaic_ras.c:325:17: error: implicit declaration of function 'pci_printk'; did you mean 'pci_intx'? [-Wimplicit-function-declaration]
>>    325 |                 pci_printk(level, qdev->pdev, "RAS event.\nClass:%s\nDescription:%s %s %s\nError Threshold for this report %d\nSyndrome:\n    0x%llx\n    0x%llx\n    0x%llx\n    0x%llx\n    0x%llx\n    0x%llx\n    0x%llx\n    0x%llx\n",
>>        |                 ^~~~~~~~~~
>>        |                 pci_intx
>>
>> Caused by commit
>>
>>    c11a50b170e7 ("accel/qaic: Add Reliability, Accessibility, Serviceability (RAS)")
>>
>> interacting with commit
>>
>>    1c8a0ed2043c ("PCI: Remove unused pci_printk()")
>>
>> from Linus' tree (in v6.16-rc1).
>>
>> As a fix up patch would be a bit of a mess, I have used the drm-misc
>> tree from next-20250606 for today.
> 
> The simplest fix is to use dev_printk() and replace qdev->pdev with
> &qdev->pdev->dev.

Ick. I agree, this is the quick fix. I'll implement it and try to get 
-next unblocked ASAP.

> The PCI core already contains one occurrence of dev_printk() in
> drivers/pci/tlp.c (introduced this cycle - 82013ff394ea).
> 
> Additionally drivers/pci/aer.c goes so far as to define a custom
> aer_printk() for lack of a pci_printk().
> 
> drivers/pci/controller/dwc/pcie-tegra194.c contains further
> occurrences of dev_printk() which could use pci_printk() instead.
> 
> Those occurrences suggest that the removal of pci_printk() was
> perhaps uncalled for.
> 
> Thanks,
> 
> Lukas

