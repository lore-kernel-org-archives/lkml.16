Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FAE972606
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 14:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749480839; cv=none; b=M/XmatcA1bV09uYzv5FRXepnj61Dr5z4i9x0rKttuhbjobZzyop9ltgZ+DMT+V5Z65ek+/RQiMf5m0k5n/tQY27cJ91Iynqcnlb/CJrUccqDrmvBnDE7cJTAKilKazj+HxvMrVSf0pSX92rvsFdtQts55fSXXBs88csIcj/MZbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749480839; c=relaxed/simple;
	bh=n+GFs4WWzAp7qMHBWrM0v+4qNfiW4lNEGemM+lvqp5k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iiB3Ue0/QMSPrzElwT3deHZFauQbhKxcqy8jcu18talNYYqj9teczQeVfnjFqtDJbwIdA97GGlaYlyAvUdQX/3/NTIztiZ2x5yW92gh2QdJBegIUj0T3gFOe6VL0fQb7e2f/4tkp5O6vDbOFRa77bPAYSoW8cLr+D60yTUgxpXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PWHB+n3k; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PWHB+n3k"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5598P0MW003426
	for <linux-kernel@vger.kernel.org>; Mon, 9 Jun 2025 14:53:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E1M6ijwJW+Gd9T4ETx2mR2E40RSLTL8lBpW0rnVfE5A=; b=PWHB+n3kQ/cF7fcN
	uvRz7QeiwsrrGGl/pT/VCfMQLLDuQLHbAKmprUpPOUt8ss0tRBIs0HfHrkGdFI1V
	1zUQwZmqE1UWvHLLNHGY5XB3O8o2dQahzRPEkkpfBBm6G04kczI96W1CllXxXJL3
	oXFYLl/U8/pUvHSbHOUxJUbQ1PJt7Qnw00sBeM0/egDRQqS6YUtUVm+aC6N6fM/Z
	imtqq/QCwY6PphN0VdcvDdB7OAkXdnFPew13ErG5xo3hzGTUgMekJSGXD+WbqebQ
	+sJ92Kx9Wl1MvBzV6BAvwUdFcQ1o/aCPWsIhIP2lwZP/7/kMdxaWqahoHLgQgDv3
	7AnLMg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475v2y14hg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 14:53:57 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5d608e6f5so1125665185a.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 07:53:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749480836; x=1750085636;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E1M6ijwJW+Gd9T4ETx2mR2E40RSLTL8lBpW0rnVfE5A=;
        b=Rm/2PIYc6HM96oiNhI3Zj5UzsAsAEeHpcg3o0VRPGJhmZF4TPnn+IbNGrUIRxTCJbS
         GjmwC238At9jvYw49k7hmsrYZ4CCT8YQC2vcwJoCy4WG5fzifwuMdgz/9txkoOyRlYFn
         DQ6MXHsXp+Bsq+bQLZC1NA0jWIQnfk1W6e5/2onRnTu1ayaAol833wAc5csRxtNA3kci
         vgVTeckiZJ1hWOJJ5Clh6bnhrg9r9Usk1HUgeFm54bjTv97Z86RTZ9tprHvTCbCvwqiZ
         EKIrXml3tjWaP9S08VGBYlmCpwUmnL+IFGT1WnB0k/WwVElTUk0i8IQFytul7LrVNJWl
         0usQ==
X-Forwarded-Encrypted: i=1; AJvYcCVv5h7A7S1YxGApVyUJd/FDBqCqOMCeL7nDiqvzspg3+mb42j30l9PIhMJqKjmAWPbLge2aCeRbGLQNby0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx58WakHfTktlqHpqwutd9wxSfkwTFthtf38xPqd93I2c6cGpeI
	hdC+aSr0o+18HcB8bSktPsVPjzjVnNQBT078t17a7L+TQUHnA/dIn0xUsYsSmBn3wf0tn1RQe1u
	G4UHx3IpQlRLDsVzFw6Xz6Qwbv/IBp4wojBll2NeJQAgbxvYtZI3vHe/dVdgGUwAJUOU=
X-Gm-Gg: ASbGnctgNiI4OV1lSEgSk1JAMZtFSta+LNuBmDbPeB1lw76bSJyEID7iKJGZMQoJX0M
	BCZrUq9w1oXVhwE/d3BezbZp8aVdrSwKW1DV4maQb1iRLXZbKxpc9qUF/3BPd5Kc+Fu8FLN0bkZ
	UYDS4BOcU5+6w5aE/n42xiIGaENZmDOPV4QZ6BvTIYr0T43uhqH7u6IB4j4n+D2H9i506CrhWvq
	s1XquwnvmOHPjaHPlnJ8f0ChUykDogD/7ksjutA1AASqoWq/N8Ftt1oI4P9ChZFqO8tK8goqtKW
	hFyNFUQoyM1sF07eF7Fij64TEsWfWc3TUOnabaUtKNngSV9qDPGtxTe6avt06f2Z2lmMNT+3M6f
	1+9BQOpjgiTh/MA==
X-Received: by 2002:a05:620a:600b:b0:7ca:f40b:f44b with SMTP id af79cd13be357-7d2298ebee9mr2089958285a.50.1749480835995;
        Mon, 09 Jun 2025 07:53:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEb8djcfSHUYkhGhkFKlXy0yjWsEdhnsRRjWWLNkEw47WLc5Gb7W13oBbQa9G3Qg4Lp1K39iw==
X-Received: by 2002:a05:620a:600b:b0:7ca:f40b:f44b with SMTP id af79cd13be357-7d2298ebee9mr2089954585a.50.1749480835529;
        Mon, 09 Jun 2025 07:53:55 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0c3:3a00::4c9? (2001-14ba-a0c3-3a00--4c9.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::4c9])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32ae1cab682sm10882151fa.70.2025.06.09.07.53.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 07:53:54 -0700 (PDT)
Message-ID: <a88f479b-e022-4ed7-8286-5d546423bfcf@oss.qualcomm.com>
Date: Mon, 9 Jun 2025 17:53:52 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH drm-dp 03/10] drm/hisilicon/hibmc: fix irq_request()'s irq
 name variable is local
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
        kong.kongxinwei@hisilicon.com, liangjian010@huawei.com,
        chenjianmin@huawei.com, lidongming5@huawei.com, libaihan@huawei.com,
        shenjian15@huawei.com, shaojijie@huawei.com,
        jani.nikula@linux.intel.com, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20250530095432.1206966-1-shiyongbang@huawei.com>
 <20250530095432.1206966-4-shiyongbang@huawei.com>
 <oof3yrny3x5vglnjvcsz6brpn2a4l2nkmpepnykojqquytfj56@vz5sk7coojhw>
 <c59b893c-dca4-4c7f-a57e-99e60401ebc0@huawei.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <c59b893c-dca4-4c7f-a57e-99e60401ebc0@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDExMCBTYWx0ZWRfX8qi21/96gCEi
 WY1YIaFj5ivHAlH7DKKf+S9p95PhjxfDQ2cJrdWwN8lD+YgpndW4edc7N2YZ7TNfQyJp+aoR+ws
 pvD1H0qLW3+YICEHRFOizf4+g88JDD1S5I5wbYaaTs+c6bXQ36cq59ffP3vMFKjgy9TuBq3jCUk
 f8aw3EPGByKLfhLWb8ejLLEIGYDdESP7kTPKAI6g3w6mQfq85TqighvMYChBdBpXh25qiH2ix49
 NRJkK+2M8OioDGXEpKrqVlN1QnWfBlQEQ7ePGiVl+ooOsxoIqA/JxyMmrVyQKh7tsUwPaHi8kj1
 B5Ks/M6KwL/R+9AodhXP1aVi9mQAJhvKWPybzhFU3LCAdVZIZaFGoYGnK+sdn1ZoVKLbUp3vbWC
 WapZQJxmYXD24BC7yQX1qIPbLaTjWblxm46tEuo+20B1j21X83pLFucoqhIMdNMuIbD3f3BJ
X-Proofpoint-GUID: Xuy8KkLvVmFPYA4bD_olCuQi4wzlyHEX
X-Proofpoint-ORIG-GUID: Xuy8KkLvVmFPYA4bD_olCuQi4wzlyHEX
X-Authority-Analysis: v=2.4 cv=f+BIBPyM c=1 sm=1 tr=0 ts=6846f585 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=i0EeH86SAAAA:8 a=-d6p7pKwPKVYLx0Ei34A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 mlxlogscore=999 bulkscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0 mlxscore=0
 malwarescore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506090110

On 09/06/2025 17:50, Yongbang Shi wrote:
> 
>> On Fri, May 30, 2025 at 05:54:25PM +0800, Yongbang Shi wrote:
>>> From: Baihan Li <libaihan@huawei.com>
>>>
>>> The local variable of irq name is passed to devm_request_threaded_irq(),
>>> which will make request_irq failed. Using the global irq name instead
>>> of it to fix.
>> This doesn't explain, why does it fail and which IRQ name is actually
>> expected.
> 
> The local variable is passed in request_irq (), and there will be use 
> after free problem.

This needs to be explained (in details) in the commit message.

> 
> 
>>> Fixes: b11bc1ae4658 ("drm/hisilicon/hibmc: Add MSI irq getting and 
>>> requesting for HPD")
>>> Signed-off-by: Baihan Li <libaihan@huawei.com>
>>> ---
>>>   drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 10 +++-------
>>>   1 file changed, 3 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/ 
>>> drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
>>> index 768b97f9e74a..4cdcc34070ee 100644
>>> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
>>> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
>>> @@ -32,7 +32,7 @@
>>>   DEFINE_DRM_GEM_FOPS(hibmc_fops);
>>> -static const char *g_irqs_names_map[HIBMC_MAX_VECTORS] = { "vblank", 
>>> "hpd" };
>>> +static const char *g_irqs_names_map[HIBMC_MAX_VECTORS] = { "hibmc- 
>>> vblank", "hibmc-hpd" };
>> Please point to the corresponding IRQ names as currently implemented in
>> the upstream kernel.
> 
> Ok.

I was thinking in terms of IRQ lookup. You can ignore this comment (it 
makes me wonder, how did you understand it, if you responded with Ok).

> 
> 
>>>   static irqreturn_t hibmc_interrupt(int irq, void *arg)
>>>   {


-- 
With best wishes
Dmitry
