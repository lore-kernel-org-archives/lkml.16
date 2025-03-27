Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B292FB6
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 00:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743034845; cv=none; b=OvCDkTC2WsMxQR8kzlqaw64ozvcKn4zGrbUwrQtPUzanfkOjX4MKKojMZqS0ATQDpNbTf+JbmOR1XqAj9cN35ZS2J4YGzH5TbxiQD/d888y3WdftdTXfEkpaEh7RGsUHZp2zqNIvxCtWuo/yNY8BLIiDuRNlx9vhAHDyqHuUrfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743034845; c=relaxed/simple;
	bh=oT86x151NRNQrKFuKk++HZi+a9RbkKjXhwJl/1Npiyk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GcPkFHu1o7aQJDfKCLJx76hd6oYu+4kGp2bWwANF36yCCd79ny+dG6PIvpnN95uyOZYhFgI6IkfYEFOs5FVfSxRMALQ6jIoBd60YFuXTleqCpBjwhGRstELiYlXcYQrPSilwa/zXQQVnugyOaPt6yKlebI5MilraPGZ2eMk3yEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WG1gKdVF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WG1gKdVF"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52QFC8uH000961
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 00:20:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	of8QtCoWCO2HkVGtOiFqijpidWD9Kyv6Ep+ZR6p7yq4=; b=WG1gKdVFiCjM1Yst
	UEYU8zbHLCYg1qwjc03eldbgfgsm8OEhsM+RCwbyxVg35UcVFPNwClKPJrxhQQVm
	z6kZKUgKSwx3ukKfVKIM2L5IA0DaLj9mh9mCeOHgNXmY+s9DO1scLxHxL/oj/r1w
	v4+5Grnvig4eT56WVTk85nuQk5yITXe2rluoBY22mNLZppjGsdvzc3I4+qqMH5vV
	LHKmswe1qfEeRspdwuwAwRE3zVdamH1UnWnJHxGEjgfBeONVvgpwOBF4kKWoD5jI
	+WFFI45IlXWZmyicr/XQ7XqQLC1iY25tFF2w/asDbzwpIfjzXqLw8ZDIBGIeD1qV
	5A1s4A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45kypscjv3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 00:20:41 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2ff798e8c93so576704a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Mar 2025 17:20:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743034837; x=1743639637;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=of8QtCoWCO2HkVGtOiFqijpidWD9Kyv6Ep+ZR6p7yq4=;
        b=LqGgS1m5eBm1DsYplDNpmW7bwiOWMupaB5R+CDxE2yg/TooRbRkiPRqnpG9XfaswZ8
         QO4DyeTM3Nng2sqAnDZk+9Vyt6qcNNjrGdFzQ9/Lhi9o89dPBtxvIl93Ex7XgEMC/g53
         9ZYNw0P0K1tiM7C9rbxY8D5c+qvCtztqTupeui8KPdcto1LfYBGSIY3V66Pg9Ay0zH+W
         xCjFm/HpFrvfw8S/6LtuY9Y76qYR4qSVMihFpt+SBWhySVasTTkXFIUPemWIIboUmnta
         iGgAfzDSIcsGBiF1LOW8WL0/BLM0Fpip+YscaYVDdxYKBdncWFnRWwjJazD/yBeSlq3s
         8xqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRcoDiXTZ070zMJY6+bAMwtpvipmDYsWp2J4Ye+h9tGU7VjZWbgp19f/KP43bJ4Pw1SaTYkUHNDwdInLo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDdaLOwSU/15WVMgAYRUOl9avm20g+oecjCajkYjsas/w05XFL
	KlBmOkx9Rb0+iAIaomDn6wABpcnmukcxdvC2HpojxdN0cuiz2U26JwxQTFwqh/cuiGMBoMwcZwQ
	WdhSJpSxxUehyoPcvGNGT9fLDTTWAsCIIOz/ljs8DMt3ggvtCk0BWLK4OMskCWGI=
X-Gm-Gg: ASbGnctr8h3dE6ZOTy5DgtHaaXDaYf6eT0+YJgb0ieCSGJwysppsTSPbZKW6XBljaj3
	Q2O4qN30PCgtX5m9xJdWM4garOsaAEz6FkyKLMHBgMH+MytLGu3lw7T+eNE5Xt5vyqHIA+lXBUx
	1uzXHjYZI9BuyV1BZkTjbZmT0k9bi/DODVT1ahquWLcOc9QFVzii+kgEFYhCxLCfHgohrA4D+u/
	DHfC1KOpqwhUQ4YK+mDh1Ytty7L44g4mQpoaY+cyCsN/LDPq4oLiCJJYEWU747IurbbJHlL4+I7
	Mq60/trEJTpm5rvf+sB7kAnjtZlWYw0LrbpOOmNLbCE4DEOuODQJdjGrwxRFoBvnO7mnTCaSWHj
	y8jiYDVOz
X-Received: by 2002:a05:6a21:78a7:b0:1f5:7873:3041 with SMTP id adf61e73a8af0-1fea2d7e078mr2787986637.18.1743034836938;
        Wed, 26 Mar 2025 17:20:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEeZQUHW17xyRIGxMp6yweCQMjqa5GFBetmO0dud0soamNjfYWDY56HKGzCXhpuMfZWbcOSQg==
X-Received: by 2002:a05:6a21:78a7:b0:1f5:7873:3041 with SMTP id adf61e73a8af0-1fea2d7e078mr2787957637.18.1743034836561;
        Wed, 26 Mar 2025 17:20:36 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af8a27db2ebsm11678477a12.5.2025.03.26.17.20.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Mar 2025 17:20:36 -0700 (PDT)
Message-ID: <e9c50bf0-e85f-4c71-b46b-b9b919955045@oss.qualcomm.com>
Date: Wed, 26 Mar 2025 17:20:35 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the kbuild tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrew Morton <akpm@linux-foundation.org>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc: Oliver Glitta <glittao@gmail.com>,
        Alessandro Carminati <acarmina@redhat.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250324103048.3d8230f9@canb.auug.org.au>
 <20250327101610.45f13473@canb.auug.org.au>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250327101610.45f13473@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: QQQmcNxVHlW7oZFlfML8jQrvALFU91_0
X-Authority-Analysis: v=2.4 cv=fIA53Yae c=1 sm=1 tr=0 ts=67e499d9 cx=c_pps a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=e70TP3dOR9hTogukJ0528Q==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rOUgymgbAAAA:8 a=4OeygS09qlqKeb4FxogA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=MP9ZtiD8KjrkvI0BhSjB:22
X-Proofpoint-GUID: QQQmcNxVHlW7oZFlfML8jQrvALFU91_0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_09,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 mlxlogscore=946 bulkscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270001

On 3/26/2025 4:16 PM, Stephen Rothwell wrote:
> Hi all,
> 
> On Mon, 24 Mar 2025 10:30:48 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> After merging the kbuild tree, today's linux-next build (powerpc
>> ppc64_defconfig) failed like this:
>>
>> ERROR: modpost: missing MODULE_DESCRIPTION() in lib/kunit/backtrace-suppression-test.o
>> ERROR: modpost: missing MODULE_DESCRIPTION() in lib/slub_kunit.o
> 
> This is now lib/tests/slub_kuni.c
> 
>> Caused by commits
>>
>>   19f3496e6241 ("kunit: add test cases for backtrace warning suppression")
>>
>> from the mm-nonmm-unstable branch of the mm tree and
>>
>>   1f9f78b1b376 ("mm/slub, kunit: add a KUnit test for SLUB debugging functionality")
>>
>> from Linus' tree (in v5.14rc1) interacting with commit
>>
>>   6c6c1fc09de3 ("modpost: require a MODULE_DESCRIPTION()")
>>
>> from the kbuild tree.
>>
>> I have temporarily reverted the latter commit until the former are
>> fixed up.
> 
> I am still reverting that commit.
> 

Guenter & Oliver, can you add MODULE_DESCRIPTION() macros to your respective modules?

Context:
https://lore.kernel.org/all/20250311-moddesc-error-v1-1-79adedf48d0e@oss.qualcomm.com/

