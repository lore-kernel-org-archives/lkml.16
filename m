Received: from invmail4.hynix.com (exvmail4.hynix.com [166.125.252.92])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10A6914F98
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 02:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.125.252.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748399042; cv=none; b=qT6n5hqPTA/8DIVA1/q4AhkWAX2sJLVioDH3riUGdt4ZNMwO8Ebk2qkn+luZeoU0Gaz1TU0k98rEsU/jO80zHJBxT14phw/ucl+9sETKhm2ndnDSQlj7Ud/o5hxg+rMzUQiNkAEHOASotLbVZ+/HYuaOKoBD87b/L34RKtOP8gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748399042; c=relaxed/simple;
	bh=i9+uLrA29n1Y3Db0nkdiYujc5Plr7p/jODTJeXT5qos=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=BhkFMwmH3K2VQrZHvrRKSEjmnnDATcdhv8ankfEnhNpMkQPctrqIyIevDiF2OrU+dTRTqzIQU3GP6/VqIJXZyQmPKh5Q11Csah30Janegsx6Z1bZgLAlMtYx+AfuF25DP2AXO4I40afNOcY5D+UzrllN+N/NRh+yPF3OuwEM6T4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com; spf=pass smtp.mailfrom=sk.com; arc=none smtp.client-ip=166.125.252.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sk.com
X-AuditID: a67dfc5b-669ff7000002311f-a6-683673baa881
Message-ID: <3ad3bcba-b8b6-4e30-8ad9-adba5761e923@sk.com>
Date: Wed, 28 May 2025 11:23:53 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: kernel_team@skhynix.com, Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>,
 Hyeonggon Yoo <42.hyeyoo@gmail.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, Rakie Kim
 <rakie.kim@sk.com>, Harry Yoo <harry.yoo@oracle.com>,
 dan.carpenter@linaro.org
Subject: Re: [PATCH v3 2/3] mm,memory_hotplug: Implement numa node notifier
To: Gregory Price <gourry@gourry.net>, Oscar Salvador <osalvador@suse.de>
References: <20250502083624.49849-1-osalvador@suse.de>
 <20250502083624.49849-3-osalvador@suse.de>
 <aBTkgnYYSN0SMQCU@gourry-fedora-PF4VCD3F>
Content-Language: ko
From: Honggyu Kim <honggyu.kim@sk.com>
In-Reply-To: <aBTkgnYYSN0SMQCU@gourry-fedora-PF4VCD3F>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrIIsWRmVeSWpSXmKPExsXC9ZZnoe6uYrMMg0mHuS0m9hhYzFm/hs3i
	w7xWdouv638xW/y8e5zd4v6yZywWqxZeY7O4vGsOm8W9Nf9ZLc5MK7KY3djH6MDtsXPWXXaP
	7rbL7B4tR96yemz6NInd4861PWweJ2b8ZvH4+PQWi8f7fVfZPM4sOMLusfl0tcfnTXIB3FFc
	NimpOZllqUX6dglcGW3fTzEXPJKs+DBxPWMDY7NIFyMnh4SAiUTH5enMMPa75uksIDavgKXE
	p3svmEBsFgFViSuHV7NBxAUlTs58AlYjKiAvcf/WDPYuRi4OZoHfTBK/+l+wgySEBbwltjT+
	ZQWxRQQ8JTY9OscEUiQk0M8o8XtWI1iCWUBEYnZnG9hmNgE1iSsvJ4Ft4xQwk/iwYBcLRI2Z
	RNfWLkYIW15i+9s5zCCDJAT62SX+Xd3LCnG2pMTBFTdYJjAKzkJy4SwkO2YhmTULyawFjCyr
	GIUy88pyEzNzTPQyKvMyK/SS83M3MQIjblntn+gdjJ8uBB9iFOBgVOLh9dhgmiHEmlhWXJl7
	iFGCg1lJhLfJ3ixDiDclsbIqtSg/vqg0J7X4EKM0B4uSOK/Rt/IUIYH0xJLU7NTUgtQimCwT
	B6dUAyNP+r+XEedNOx1mTMuxd7l64HGUnwSfP8u26Il6sf+33l3hcPSO0N0nHQemq/w7ezb9
	Vb7mR5Hl182ConSdcxSZZtmkPpvUuiVjcnS0lXCPw/zttSk/NobpXW8ofC/NWK34ySk7OpJX
	+fCMlZfd3nyoZpTSk9BsMHHZVC4cekThU2L9Efb1pUosxRmJhlrMRcWJAKYMQZG0AgAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprIIsWRmVeSWpSXmKPExsXCNUNLT3dnsVmGwZwJ1hYTewws5qxfw2bx
	YV4ru8XX9b+YLX7ePc5ucX/ZMxaLVQuvsVkcnnuS1eLyrjlsFvfW/Ge1ODOtyOLQteesFrMb
	+xgdeD12zrrL7tHddpndo+XIW1aPTZ8msXvcubaHzePEjN8sHh+f3mLxeL/vKpvHt9seHotf
	fGDyOLPgCLvH5tPVHp83yQXwRnHZpKTmZJalFunbJXBltH0/xVzwSLLiw8T1jA2MzSJdjJwc
	EgImEu+ap7OA2LwClhKf7r1gArFZBFQlrhxezQYRF5Q4OfMJWI2ogLzE/Vsz2LsYuTiYBX4z
	Sfzqf8EOkhAW8JbY0viXFcQWEfCU2PToHBNIkZBAP6PE71mNYAlmARGJ2Z1tzCA2m4CaxJWX
	k8C2cQqYSXxYsIsFosZMomtrFyOELS+x/e0c5gmMfLOQHDILyahZSFpmIWlZwMiyilEkM68s
	NzEzx1SvODujMi+zQi85P3cTIzCiltX+mbiD8ctl90OMAhyMSjy8HhtMM4RYE8uKK3MPMUpw
	MCuJ8DbZm2UI8aYkVlalFuXHF5XmpBYfYpTmYFES5/UKT00QEkhPLEnNTk0tSC2CyTJxcEo1
	MAZOa8yYb7Y5SNP8bfiR+P/T4ziFpj5i6dgpnXKaYc/e/vkucyJ+bJ4hKc63X33S64gXO6LD
	bi4LqZRQSkz5Fdnf5tF72tFkuoiTkbHUPbZDE/UFY+quCZlU+thfFJ1+UPx+rfBF4eLjU5il
	a/lMtionrRNauWT+pB0fP2ac1nq1i61zyzMjZSWW4oxEQy3mouJEACup9sSkAgAA
X-CFilter-Loop: Reflected

Hi Gregory and Oscar,

On 5/3/2025 12:28 AM, Gregory Price wrote:
> On Fri, May 02, 2025 at 10:36:23AM +0200, Oscar Salvador wrote:
>> There are at least six consumers of hotplug_memory_notifier that what they
>> really are interested in is whether any numa node changed its state, e.g: going
>> from being memory aware to becoming memoryless and vice versa.
>>
>> Implement a specific notifier for numa nodes when their state gets changed,
>> and have those consumers that only care about numa node state changes use it.
>>
>> Signed-off-by: Oscar Salvador <osalvador@suse.de>
>> Reviewed-by: Harry Yoo <harry.yoo@oracle.com>
>> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>>   
>> diff --git a/mm/mempolicy.c b/mm/mempolicy.c
>> index f43951668c41..b3ad63fb3a2b 100644
>> --- a/mm/mempolicy.c
>> +++ b/mm/mempolicy.c
>> @@ -3591,20 +3591,20 @@ static int wi_node_notifier(struct notifier_block *nb,
>>   			       unsigned long action, void *data)
>>   {
>>   	int err;
>> -	struct memory_notify *arg = data;
>> +	struct node_notify *arg = data;
>>   	int nid = arg->status_change_nid;
>>   
>>   	if (nid < 0)
>>   		return NOTIFY_OK;
>>   
>>   	switch (action) {
>> -	case MEM_ONLINE:
>> +	case NODE_BECAME_MEM_AWARE:
>>   		err = sysfs_wi_node_add(nid);
>>   		if (err)
>>   			pr_err("failed to add sysfs for node%d during hotplug: %d\n",
>>   			       nid, err);
>>   		break;
> 
> May I suggest rolling this patch in with this change:
> https://lore.kernel.org/linux-mm/aAij2oUCP1zmcoPv@stanley.mountain/
> 
> seems to fix the underlying problem, and returning an error now makes
> sense given the change.

The 'err' of sysfs_wi_node_add() wasn't propagated to its caller before
this change as discussed with David at the following.
https://lore.kernel.org/198f2cbe-b1cb-4239-833e-9aac33d978fa@redhat.com

But as Gregory mentioned, we can pass 'err' now with this numa node notifier
so for this hunk, shouldn't we add the following change on top of this?

diff --git a/mm/mempolicy.c b/mm/mempolicy.c
index 3a7717e09506..3073ebd4e7ee 100644
--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -3792,7 +3792,7 @@ static int sysfs_wi_node_add(int nid)
  static int wi_node_notifier(struct notifier_block *nb,
                                unsigned long action, void *data)
  {
-       int err;
+       int err = 0;
         struct node_notify *arg = data;
         int nid = arg->status_change_nid;

@@ -3811,7 +3811,7 @@ static int wi_node_notifier(struct notifier_block *nb,
                 break;
         }

-       return NOTIFY_OK;
+       return notifier_from_errno(err);
  }

  static int __init add_weighted_interleave_group(struct kobject *mempolicy_kobj)

> 
> +cc: Honggyu Kim, Dan Carpenter

Thanks for cc-ing me into this thread.

Honggyu

> 
>> -	case MEM_OFFLINE:
>> +	case NODE_BECAME_MEMORYLESS:
>>   		sysfs_wi_node_delete(nid);
>>   		break;
>>   	}
>> @@ -3639,7 +3639,7 @@ static int __init add_weighted_interleave_group(struct kobject *mempolicy_kobj)
>>   		}
>>   	}
>>   
>> -	hotplug_memory_notifier(wi_node_notifier, DEFAULT_CALLBACK_PRI);
>> +	hotplug_node_notifier(wi_node_notifier, DEFAULT_CALLBACK_PRI);
>>   	return 0;
>>   
>>   err_cleanup_kobj:
