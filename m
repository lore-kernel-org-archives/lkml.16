Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C4D10942
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 04:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751860927; cv=none; b=aLIm3MQCY2Ub9F6xeNkmfZ3EUemB6ThYJiXkS116We/7SlEpvhH0FWZpKCZhWDVme0ZP+uafxh6KFL7ogR13zZvhZMBhj7p6MSk05mLJY40xjdM2ZXJ0+lW//amXkVd6hWzdGQffPTkh6BUBveyQLr3RAZf72QJJjLJnucGsp2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751860927; c=relaxed/simple;
	bh=Xbki2377ptU8/DyDFzCi+C9XQLDh2XVATm9SZjxEbgM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IHzpoIBC7FzMoyhDB7u2jUX0256Z1Zric9N0A8645nqGSZB8Oc7QHWW/7c/AWJW8a0Vsw4m3LjoRPvlZJeQ9gBorWHYErU465x5OHJn9EYJ/hHcmIT6SpkzkI3s0yvHLFEEBXjnoTA4Ww6I9KDGqeoyM+o6gM7MNJMvGNcFXs5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=fHxNYfTj; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="fHxNYfTj"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 566JwjU6029879;
	Mon, 7 Jul 2025 04:01:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=0jkCC5
	vc1Ep0d2o1MPjj/UHlIophWUPzN/EEy1rjq/k=; b=fHxNYfTjNk4f63if41FpVY
	wEKMMdAkDa3NU0N3UXXnz0DcEY3wcPmM4hyNABiA7dz8D3MhZUiewRg8REpodjtZ
	JA04PHkL9e/h8Fzow5tOuw2P2Qee1mz1rY9FIW9zFCQjmsfnpF8ew/9GPkxEwrLO
	e706dyY4z83Nsniaew1LLnSgJAbbiN08sLDL+FIgkHL4H1A9DtNkJdwgrdXUkg4L
	3kXWUI8DzxXMVPWFgmVjnmk6BpXl1crSMO9APO/IFGJX6gcG7p+B0b51ekrsGzD9
	Bja3PGrtv/tDKCtbEeCVOyUPxAQcfu9gh4rUxhktZvThsJb80BFlHsfFVtZPawMw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47puqmxv8a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Jul 2025 04:01:34 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5673uQPv028836;
	Mon, 7 Jul 2025 04:01:33 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47puqmxv87-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Jul 2025 04:01:33 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 566NF7cX025593;
	Mon, 7 Jul 2025 04:01:32 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 47qfcnvaar-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Jul 2025 04:01:32 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 56741Wlj31457964
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Jul 2025 04:01:32 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5761258059;
	Mon,  7 Jul 2025 04:01:32 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 65A5158043;
	Mon,  7 Jul 2025 04:01:26 +0000 (GMT)
Received: from [9.124.213.32] (unknown [9.124.213.32])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  7 Jul 2025 04:01:25 +0000 (GMT)
Message-ID: <a2a5fde6-ef72-4c13-8190-84a684f6248b@linux.ibm.com>
Date: Mon, 7 Jul 2025 09:31:24 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers/base/node: Handle error properly in
 register_one_node()
To: David Hildenbrand <david@redhat.com>, Oscar Salvador <osalvador@suse.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ritesh Harjani <ritesh.list@gmail.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, "Rafael J . Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Alison Schofield <alison.schofield@intel.com>,
        Yury Norov <yury.norov@gmail.com>, Dave Jiang <dave.jiang@intel.com>,
        KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>
References: <20250702112856.295176-1-donettom@linux.ibm.com>
 <aGUqQbybFXd6uJu-@localhost.localdomain>
 <83012fcc-36ca-41fe-8e2e-949f1ba8adf3@linux.ibm.com>
 <0e36647a-414a-4f53-9159-1ae3ac836d11@redhat.com>
Content-Language: en-US
From: Donet Tom <donettom@linux.ibm.com>
In-Reply-To: <0e36647a-414a-4f53-9159-1ae3ac836d11@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=FZ43xI+6 c=1 sm=1 tr=0 ts=686b469e cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VnNF1IyMAAAA:8 a=eGJtRLdNXFAazgnYVQgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: u8pCr4j-iRa8n9x-TKBFqYalk5oRF-eX
X-Proofpoint-ORIG-GUID: I4i8XC_HrXgeBu9D82e_LmQrrzMfAerP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDAyMCBTYWx0ZWRfX20WKFnqSSuV1 wXBnKIFbDo8f69GxVzjYnIJNQNqJqHrS+qnAMwKQ2ZKcPxEwlIfJ4LfoOcPpsND8Qnpl5qds986 4qc3EqsEeXYdFnosd50kbdUlZZH31URReJ6YJqN89et4g339wc0qIvb/ZBNh5NCTZWBGTc7Nl17
 KDqlA154lCBQvuOYgNPJ/viev+pOKBX/J4uVsh1pgaSsOmSFTmrtwi6kFFvdAAMPGhv+ygMWZFu nQi65lfE8S+KT3AIWVWGvRnfEnDAIx0rKG7r0reg1djTBdOnVJQy9LJ5DS1w0gJVkcXdYeDWe1O GlF1Fnk+NSzCIT7YlJpkLzvkGjqt7d7E/+A9vhwZ65esPjveU7cVIqAPhchVXT9x+gYk8+zhsyp
 qsd2wlL1UBE5am0EsdUeMpTihKzsKnElR1yAUOS86h5iKXyLFP5qKm0bkqMm3bxwMahOAcbA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 priorityscore=1501 malwarescore=0 mlxlogscore=927 clxscore=1015
 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507070020


On 7/4/25 5:59 PM, David Hildenbrand wrote:
> On 02.07.25 14:59, Donet Tom wrote:
>>
>> On 7/2/25 6:16 PM, Oscar Salvador wrote:
>>> On Wed, Jul 02, 2025 at 06:28:56AM -0500, Donet Tom wrote:
>>>> If register_node() returns an error, it is not handled correctly.
>>>> The function will proceed further and try to register CPUs under the
>>>> node, which is not correct.
>>>>
>>>> So, in this patch, if register_node() returns an error, we return
>>>> immediately from the function.
>>>>
>>>> Signed-off-by: Donet Tom <donettom@linux.ibm.com>
>>>> ---
>>>>
>>> ...
>>>> diff --git a/drivers/base/node.c b/drivers/base/node.c
>>>> index bef84f01712f..aec991b4c0b2 100644
>>>> --- a/drivers/base/node.c
>>>> +++ b/drivers/base/node.c
>>>> @@ -885,6 +885,8 @@ int register_one_node(int nid)
>>>>        node_devices[nid] = node;
>>>>           error = register_node(node_devices[nid], nid);
>>>> +    if (error)
>>>> +        return error;
>>> Ok, all current callers (based on mm-unstable) panic or BUG() if 
>>> this fails,
>>> but powerpc, in init_phb_dynamic(), which keeps on going.
>>> Unless it panics somewhere down the road as well.
>>>
>>> So I think we need to:
>>>
>>>    node_devices[nid] = NULL
>>>    kfree(node)
>>>
>>>    ?
>>
>>
>> Yes, I will add this too.
>>
>> But one question: if register_node() fails, is it okay to continue, or
>> should we panic?
>>
>> What is the correct way to handle this?
>
> panic() or BUG() is not the answer :)
>
> Try to recover ...

Got it, thank you very much, David.


