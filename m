Received: from outbound.pv.icloud.com (p-west1-cluster4-host7-snip4-10.eps.apple.com [57.103.65.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857662DD615
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 23:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.65.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750894206; cv=none; b=UCII3dT519R+KR0c+MJxe6u9vYFLBwrP/NnLSBUt90XdfBNz+OsAzUpSGv/RmSF5SReIMnH23k4hmwimq7KW9vJr3K/8h21K8SVPLeVMM9jvuYy38z+f885AlumaMSpKRRmSnW5X5P9fvEuqxcc4sHv+qDellKuyViO4yj6uPJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750894206; c=relaxed/simple;
	bh=+LOrmoIb8KK5f7WjS6l8DdCbck8dbDHebIPzu7ufsM0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UDpYLOXQRUS6mYKB4T8v/+dR9NhbRIOMqIw5euOCzj88rgfyWuLizRvm20cd/fYxQuM7U4dO9UlYepl1TEAwJtWdtO1byq7imtLIxUNmjT93+ICppL97yeXub/rCg+OPcAaBDx691JSk7gN5qMmCcxzSyodoBG+UFqGtjgyqy3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=f2crs/Xv; arc=none smtp.client-ip=57.103.65.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="f2crs/Xv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; bh=jiFwjy9HPQt3cm9my0CNcRXj0OXu6GAMvjnck7QRBiY=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:x-icloud-hme;
	b=f2crs/Xv4X4TDC4RqpWxj90CbGb/mwis+QsSLEDrQRJ2L+bzaCMMsfsF7p0dQy5r2
	 pD83yNur4OFQgdgcyQ9KvwOLoKFY7SGVFXmLi7I1RYKETpUR6ge7IXBjFVFaL3LkcA
	 XXJfODemwrUybiXxDFNNToRFizK1qrD0aCS7ppJX8f4DcFT+nYfoI7mYrgc6+f3Wt3
	 yJmrOs6RBT8xnozNZDewHbWUiQYSW3xLrt+zWhAJ91+lAy6iDzJkVvP6+wA87KGIvm
	 z8sp6yDCMEjm4X9pDLL1nPqnGs7XUHgoZUF4pLrelPazLp7HNRntrnkQigi6HDQ36+
	 Z0GGYGgIKOCFg==
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by outbound.pv.icloud.com (Postfix) with ESMTPS id D369E18001E6;
	Wed, 25 Jun 2025 23:30:01 +0000 (UTC)
Received: from [192.168.1.26] (pv-asmtp-me-k8s.p00.prod.me.com [17.56.9.36])
	by outbound.pv.icloud.com (Postfix) with ESMTPSA id 5365118001E7;
	Wed, 25 Jun 2025 23:30:00 +0000 (UTC)
Message-ID: <ac666ce1-564d-496e-be42-8a8c1af654e7@icloud.com>
Date: Thu, 26 Jun 2025 07:29:56 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] char: misc: Enforce simple minor space division
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 Zijun Hu <zijun.hu@oss.qualcomm.com>,
 Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
References: <20250620-rfc_miscdev-v1-1-fda25d502a37@oss.qualcomm.com>
 <2025062445-procedure-latch-9421@gregkh>
Content-Language: en-US
From: Zijun Hu <zijun_hu@icloud.com>
In-Reply-To: <2025062445-procedure-latch-9421@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 0x8hjE11Lw2Ipc50sW9kVi7eVbsDK_pg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE4NCBTYWx0ZWRfX5qK/98sDJeMd
 8lMgbGfeVsJeolJ89Z6GkFgIL111e6A/F1xDE5S++bW/65dK2IpQ4f8niinSToYONsV8vv6J1Oa
 FvwoatvjPsBaUA9Q/lg3WMNccYl6CNUaevPY2YdAUDruPvfyfbQQN6sghLJi+3VJV7WHM/ByONd
 Ba4b2mtDmBRCAjbMXd8a6l3SVpSZams2+Dac911wR+RS2KXbjJmmbsKAQAJrqDZPgg6S48n5g9k
 vamT3NQ8tNd3Zfevc5Lz/s1MWSuWdkUo1d10iNgnp2tXfSL/vgxhVBuoJBu6RoFKCEk6n11jI=
X-Proofpoint-ORIG-GUID: 0x8hjE11Lw2Ipc50sW9kVi7eVbsDK_pg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_08,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 clxscore=1011 adultscore=0 phishscore=0 mlxscore=0 spamscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.22.0-2506060001 definitions=main-2506250184

On 2025/6/24 23:50, Greg Kroah-Hartman wrote:
> On Fri, Jun 20, 2025 at 10:53:32PM +0800, Zijun Hu wrote:
>> From: Zijun Hu <zijun.hu@oss.qualcomm.com>
>>
>> Enforce simple minor space division related to macro MISC_DYNAMIC_MINOR
>> defined as 255 currently:
>>
>> <  255 : Fixed minor codes
>> == 255 : Indicator to request dynamic minor code
>>>  255 : Dynamic minor codes requested
> 
> Is this the rule today?  If so, does the now-added tests we have for
> misc device properly test for this?
> 

1) yes. this simple division becomes possible with recent commits below:
Commit: 31b636d2c416 ("char: misc: restrict the dynamic range to exclude
reserved minors")
Commit: c876be906ce7 ("char: misc: register chrdev region with all
possible minors")

both available fixed and dynamic minors interleaves with narrow space
[0, 255) before above commits.

it is easy to balance minor space division by adjusting macro
@MISC_DYNAMIC_MINOR if required in future as well.

Also hope all fixed minors are registered with header linux/miscdevice.h

2) no. below recent commit don't cover the simple division fully.
Commit: 74d8361be344 ("char: misc: add test cases")

drivers/misc/misc_minor_kunit.c may need to be corrected to reflecting
division today.

>> This enforcing division also solves misc_register() reentry issue below:
>>
>> // Suppose both static @dev_A and @dev_B want to request dynamic minors.
>> @dev_A.minor(255) @dev_B.minor(255)
>>
>> // Register @dev_A then de-register it.
>> @dev_A.minor(255) -> registered -> @dev_A.minor(500) -> de-registered
>> -> @dev_A.minor(500)
>>
>> // Register @dev_B
>> @dev_B.minor(255) -> registered -> @dev_B.minor(500)
>>
>> // Register @dev_A again
>> @dev_A.minor(500) -> encounter -EBUSY error since @dev_B has got 500.
> 
> Does this ever really happen?
> 

i never meet this issue. but in theory, it may happen as explained below:

misc_register()/misc_deregister() are sometimes called within driver's
probe()/remove(), such cases have reentry requirements

actually, error handling in misc_register() also reset minor code allocated:

	if (IS_ERR(misc->this_device)) {
		misc_minor_free(misc->minor);
		if (is_dynamic) {
			misc->minor = MISC_DYNAMIC_MINOR;
		}
		err = PTR_ERR(misc->this_device);
		goto out;
	}

> And with the recent changes in the last dev cycle in this code area, is
> it still an issue?
>

this is a different issue with the ones recent changes fix.

>> Side effects:
>> It will be refused to register device whose fixed minor > 255.
> 
> Do we have any in-kernel users that are > 255?

NO. no kernel users have such usage.

Actually, if fixed minor (>255) is used to register miscdev, it may
encounter failure since the fixed minor (>255) may be allocated for
other dynamic requests.

> 
> thanks,
> 
> greg k-h

