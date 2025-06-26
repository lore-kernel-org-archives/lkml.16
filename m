Received: from outbound.pv.icloud.com (p-west1-cluster5-host7-snip4-3.eps.apple.com [57.103.66.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C712E7F3A
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 14:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.66.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750949691; cv=none; b=HwdMhM9bSw5+w1dpRFbvREVGrl9QHEKaiU/YynDb9ApMVWWf2uisIAsx33S2eHvPNZUSSrogznA0fJIyj2VaMuoMJP2pKof8cqmsrx8BNKL34o5eY45TFahoiI7dSG3H2E276Fzyi7tuvKdOWuewezB7NQARKqyoHp9SjzQC+Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750949691; c=relaxed/simple;
	bh=XkghIV6L2ACOZzDoRXsL/DsPc36f/nv6ExXGbDLwQtw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F1G91fNXmWWFZ+AFmyg0nlgxXWUOdXwuBNzXPsJ6cDD+3to9V4FU3jUmcD2M//VCe2AkALlB3HXkOI74YpY1T+Ae8Y7a5qnZ3NVHk9gIY1DflK+zphrPXzyGvAVYJ3Y3gFrwxT7ZKSDXiwOdzriN6shUAIlVsKdgox5SQwt6wwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=cEt/V0v3; arc=none smtp.client-ip=57.103.66.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="cEt/V0v3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; bh=Sq5O+9MqfT7zMxuHrXJR6XAUWQWqfjSYlGWvNhkQkSY=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:x-icloud-hme;
	b=cEt/V0v3BmBCZARBN42SjDZ1vzv3i76h/y7ZvT5YM+3dB9FGmIYX6+MUKb9q/YRF9
	 RKlaKlR2dDd/OmYWThKMQZ632FWIDQoHpHvT6wa5a1STQy4tuJTgJldYxPBpEAN53a
	 Hb2ZZFgC1ZZFya0Y090NugSyXShQxRjNS5lzVRwLY0zAkY3gkYrDSrOWfxjlHD0gkx
	 uHbU1KGCapMN9V1URScsGZrP5/25a1oKlFf+X4idG6a+kGmrvvtQu+C1Iury44vc2Z
	 NxviCHugHjBSChBHWqOwvDm0ubV4NjQqy4RkRSNh9lCnmmQcswO8FPsPLefFifedEQ
	 AILfAKvfFY5qw==
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by outbound.pv.icloud.com (Postfix) with ESMTPS id 04B8018002A0;
	Thu, 26 Jun 2025 14:54:46 +0000 (UTC)
Received: from [192.168.1.26] (pv-asmtp-me-k8s.p00.prod.me.com [17.56.9.36])
	by outbound.pv.icloud.com (Postfix) with ESMTPSA id 0278C18002AE;
	Thu, 26 Jun 2025 14:54:44 +0000 (UTC)
Message-ID: <ac02a348-8caa-4f99-a982-cb71695b3887@icloud.com>
Date: Thu, 26 Jun 2025 22:54:41 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] char: misc: Enforce simple minor space division
To: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 Zijun Hu <zijun.hu@oss.qualcomm.com>
References: <20250620-rfc_miscdev-v1-1-fda25d502a37@oss.qualcomm.com>
 <2025062445-procedure-latch-9421@gregkh>
 <ac666ce1-564d-496e-be42-8a8c1af654e7@icloud.com>
 <aF0-_0pHqLL39wse@quatroqueijos.cascardo.eti.br>
Content-Language: en-US
From: Zijun Hu <zijun_hu@icloud.com>
In-Reply-To: <aF0-_0pHqLL39wse@quatroqueijos.cascardo.eti.br>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: rtXbBDaMKQJqGq53_5Ynt_LgK6nCDUDo
X-Proofpoint-ORIG-GUID: rtXbBDaMKQJqGq53_5Ynt_LgK6nCDUDo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDEyNiBTYWx0ZWRfX5hoCOoGoIk6L
 9+ELtP9BpqESTGKFU5eKTTjfecT88k9wc9OvIkRub60glbRP/6VygM3OwpnG/+6c32a+4Ttq/wh
 U8gUo75qCtk8pg6wM3tAaa1I+B8F/EC8XZEzftL8G4OFmOg7k2y7H+uJVeoXk+5fb4bgNZMr+r/
 G5+PAoZ6TCRhB84wxHHRQz5jQ8VksV7Al9T0hPrBtmri3q5L77uOxHwUC0eYLQ08c736KpHex+Y
 rIy8gobkYhcKEuRE7TJ9XtCwPVHguRw3hQ+w9ENeXrih7doCIkN+Z4DCoUmbhXwy6GtL216No=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_06,2025-06-26_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 mlxlogscore=999 phishscore=0 clxscore=1015 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.22.0-2506060001 definitions=main-2506260126

On 2025/6/26 20:37, Thadeu Lima de Souza Cascardo wrote:
>> drivers/misc/misc_minor_kunit.c may need to be corrected to reflecting
>> division today.
>>
> Correct, those added tests do not enforce that one cannot register a static
> minor above MISC_DYNAMIC_MINOR.
> 
> However, to some extent [1], it tests that a MISC_DYNAMIC_MINOR allocation
> will not return a number in the range of the static numbers. See
> miscdev_test_dynamic_only_range.
> 
> It also tests that if a dynamic minor is allocated and one tries to
> allocate that same number statically, it will fail. It also tries [2] to
> test the other way around. That is, if one minor was statically allocate in
> the dynamic range, that a dynamic allocation will not return that same
> number.
> 
> Those tests, named miscdev_test_conflict and miscdev_test_conflict_reverse
> were written considering the current implementation, which allows for
> static allocations in the "dynamic range".
> 
> If we are going to change that, you need to change the tests too.
> 

agree.

> I would suggest applying only the last hunk of your patched
> drivers/char/misc.c with a separate commit. Then, when misc_deregister

agree.

> would be called the minor would be restored. However, since statically
> allocating a minor above 255 would still be allowed, it could "restore" it
> wrongly.
> 

now. will disallow statically allocating a minor above 255 since below
disadvantages:

1) if the minor was requested by other dynamic request. requesting a
fixed minor which > 255 will be failed.

2) both fixed minors and dynamic minors interleave int the same space.


> As Greg has observed, if there is no known case in the kernel where minor
> is not set to MISC_DYNAMIC_MINOR by the driver before it calls
> misc_register a second time, then there is nothing to fix here. If there
> is such a case, then the driver must be fixed. It has always been the case,
> even when the ranges were different, that the minor needed to be reset to
> MISC_DYNAMIC_MINOR before calling misc_register after misc_deregister has
> been called.
> 

this patch is to solve such reentry issue.


> As you point out, when misc_register fails, it already restores the minor
> number.
> 
> Let me know if you want to proceed with this change and need help with the
> test case. I may be slow to respond since I am going on vacation.
> 

I will split this RFC patch and modify test cases.

welcome to get your comments at any time. thank you (^^).

> Regards.
> Cascardo.
> 
> 
> [1] To some extent, because due to the large dynamic range, it only tries
> allocating 256 dynamic minors. And only verifies numbers below 16 are not
> returned, because that was the bug that existed before.
> 
> [2] Tries, because due to the large dynamic range, instead of allocating
> all numbers, it just assumes that the allocator would give the first
> number, but it also picks that "first" number by doing a dynamic allocation
> and freeing it.

