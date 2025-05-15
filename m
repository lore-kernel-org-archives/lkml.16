Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07416286D5D
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 08:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.255
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747296655; cv=none; b=P5hYsP+w9+GutAs3MtWgDsMW/m8BG1DFqSeEhZuLPFQ+CS28QD95piSDkMX8o3/9MwnZ64v9Vl5x9ZYG5291yBLjFljWGMypSmV8f7kucMigR1KvUjikqRv/4km1RlN7XWqp4OXStu8A5VTz4gE5yqLPKnetWMKfc65YRZjZHTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747296655; c=relaxed/simple;
	bh=LguIhDbbq9020BNM4hdGYiXTe8mSfXMCGO8AWMozp8Q=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=up0sVBOw90X7EFGg9+dVx+NrPct8k1DOKkrJRltYl2bof6yuZ9DrVJksHYA5VDRTWX5C0j2bJZWKkZDWGM4o+uvLh5djhGdpReRCULCWGsS9TpHGCOnxkUrrrSI1VhsW7io5/pcI5o4FHf3ezKBn8lCbG2Q+sUBkInMjAhRTv54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.255
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4ZyjXx6Knwz1DKb1;
	Thu, 15 May 2025 16:09:21 +0800 (CST)
Received: from kwepemk200016.china.huawei.com (unknown [7.202.194.82])
	by mail.maildlp.com (Postfix) with ESMTPS id 2B59F180B55;
	Thu, 15 May 2025 16:10:49 +0800 (CST)
Received: from [10.67.108.122] (10.67.108.122) by
 kwepemk200016.china.huawei.com (7.202.194.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 15 May 2025 16:10:48 +0800
Subject: Re: [PATCH] ipmi: fix underflow in ipmi_create_user()
To: <corey@minyard.net>
CC: <openipmi-developer@lists.sourceforge.net>,
	<linux-kernel@vger.kernel.org>, <lujialin4@huawei.com>
References: <20250513081622.125071-1-yiyang13@huawei.com>
 <aCMrg1wqUVi2iCMk@mail.minyard.net>
From: "yiyang (D)" <yiyang13@huawei.com>
Message-ID: <d3d50ad3-19e7-7822-f22a-3deb57758ab7@huawei.com>
Date: Thu, 15 May 2025 16:10:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <aCMrg1wqUVi2iCMk@mail.minyard.net>
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemk200016.china.huawei.com (7.202.194.82)



On 2025/5/13 19:22, Corey Minyard wrote:
> On Tue, May 13, 2025 at 08:16:22AM +0000, Yi Yang wrote:
>> Syzkaller reported this bug:
>> ==================================================================
>> BUG: KASAN: global-out-of-bounds in instrument_atomic_read_write include/linux/instrumented.h:96 [inline]
>> BUG: KASAN: global-out-of-bounds in atomic_dec include/linux/atomic/atomic-instrumented.h:592 [inline]
>> BUG: KASAN: global-out-of-bounds in ipmi_create_user.part.0+0x5e5/0x790 drivers/char/ipmi/ipmi_msghandler.c:1291
>> Write of size 4 at addr ffffffff8fc6a438 by task syz.5.1074/5888
> 
> This code has been completely rewritten in the next tree and already
> fixed.
> 
> -corey
> 
>>
>> CPU: 0 PID: 5888 Comm: syz.5.1074 Not tainted 6.6.0+ #60
>> ......
>> Call Trace:
>>   <TASK>
>>   __dump_stack lib/dump_stack.c:88 [inline]
>>   dump_stack_lvl+0x72/0xa0 lib/dump_stack.c:106
>>   print_address_description.constprop.0+0x6b/0x3d0 mm/kasan/report.c:364
>>   print_report+0xba/0x280 mm/kasan/report.c:475
>>   kasan_report+0xa9/0xe0 mm/kasan/report.c:588
>>   check_region_inline mm/kasan/generic.c:181 [inline]
>>   kasan_check_range+0x100/0x1c0 mm/kasan/generic.c:187
>>   instrument_atomic_read_write include/linux/instrumented.h:96 [inline]
>>   atomic_dec include/linux/atomic/atomic-instrumented.h:592 [inline]
>>   ipmi_create_user.part.0+0x5e5/0x790 drivers/char/ipmi/ipmi_msghandler.c:1291
>>   ipmi_create_user+0x56/0x80 drivers/char/ipmi/ipmi_msghandler.c:1236
>>   ipmi_open+0xac/0x2b0 drivers/char/ipmi/ipmi_devintf.c:97
>>   chrdev_open+0x276/0x700 fs/char_dev.c:414
>>   do_dentry_open+0x6a7/0x1410 fs/open.c:929
>>   vfs_open+0xd1/0x440 fs/open.c:1060
>>   do_open+0x957/0x10d0 fs/namei.c:3671
>>   path_openat+0x258/0x770 fs/namei.c:3830
>>   do_filp_open+0x1c7/0x410 fs/namei.c:3857
>>   do_sys_openat2+0x5bd/0x6a0 fs/open.c:1428
>>   do_sys_open fs/open.c:1443 [inline]
>>   __do_sys_openat fs/open.c:1459 [inline]
>>   __se_sys_openat fs/open.c:1454 [inline]
>>   __x64_sys_openat+0x17a/0x210 fs/open.c:1454
>>   do_syscall_x64 arch/x86/entry/common.c:51 [inline]
>>   do_syscall_64+0x59/0x110 arch/x86/entry/common.c:81
>>   entry_SYSCALL_64_after_hwframe+0x78/0xe2
>> RIP: 0033:0x54d2cd
>> Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b0 ff ff ff f7 d8 64 89 01 48
>> RSP: 002b:00007f4751920048 EFLAGS: 00000246 ORIG_RAX: 0000000000000101
>> RAX: ffffffffffffffda RBX: 0000000000796080 RCX: 000000000054d2cd
>> RDX: 0000000000000000 RSI: 0000000020004280 RDI: ffffffffffffff9c
>> RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
>> R10: 000000000000001e R11: 0000000000000246 R12: 000000000079608c
>> R13: 0000000000000000 R14: 0000000000796080 R15: 00007f4751900000
>>   </TASK>
>>
>> The buggy address belongs to the variable:
>>   ipmi_interfaces+0x38/0x40
>>
>> The buggy address belongs to the physical page:
>> page: refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x45a6a
>> flags: 0x3fffff00004000(reserved|node=0|zone=1|lastcpupid=0x1fffff)
>> raw: 003fffff00004000 ffffea0001169a88 ffffea0001169a88 0000000000000000
>> raw: 0000000000000000 0000000000000000 00000001ffffffff 0000000000000000
>> page dumped because: kasan: bad access detected
>>
>> Memory state around the buggy address:
>>   ffffffff8fc6a300: 00 00 00 00 f9 f9 f9 f9 00 00 00 00 f9 f9 f9 f9
>>   ffffffff8fc6a380: 00 00 f9 f9 f9 f9 f9 f9 00 00 00 00 f9 f9 f9 f9
>>> ffffffff8fc6a400: 00 00 f9 f9 f9 f9 f9 f9 00 00 00 00 f9 f9 f9 f9
>>                                          ^
>>   ffffffff8fc6a480: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>>   ffffffff8fc6a500: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 f9 f9
>> ==================================================================
>>
>> In the ipmi_create_user() function, the intf->nr_users variable has an
>> underflow issue. Specifically, on the exception path (goto out_kfree;)
>> before atomic_add_return(), calling atomic_dec() when intf->nr_users has
>> not been incremented will result in an underflow.
>>
>> Fixes: 8e76741c3d8b ("ipmi: Add a limit on the number of users that may use IPMI")
>> Signed-off-by: Yi Yang <yiyang13@huawei.com>
>> ---
>>   drivers/char/ipmi/ipmi_msghandler.c | 9 +++++----
>>   1 file changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/char/ipmi/ipmi_msghandler.c b/drivers/char/ipmi/ipmi_msghandler.c
>> index 3ba9d7e9a6c7..27a12b31cfb6 100644
>> --- a/drivers/char/ipmi/ipmi_msghandler.c
>> +++ b/drivers/char/ipmi/ipmi_msghandler.c
>> @@ -1246,18 +1246,18 @@ int ipmi_create_user(unsigned int          if_num,
>>    found:
>>   	if (atomic_add_return(1, &intf->nr_users) > max_users) {
>>   		rv = -EBUSY;
>> -		goto out_kfree;
>> +		goto out_dec;
>>   	}
>>   
>>   	INIT_WORK(&new_user->remove_work, free_user_work);
>>   
>>   	rv = init_srcu_struct(&new_user->release_barrier);
>>   	if (rv)
>> -		goto out_kfree;
>> +		goto out_dec;
>>   
>>   	if (!try_module_get(intf->owner)) {
>>   		rv = -ENODEV;
>> -		goto out_kfree;
>> +		goto out_dec;
>>   	}
>>   
>>   	/* Note that each existing user holds a refcount to the interface. */
>> @@ -1281,8 +1281,9 @@ int ipmi_create_user(unsigned int          if_num,
>>   	*user = new_user;
>>   	return 0;
>>   
>> -out_kfree:
>> +out_dec:
>>   	atomic_dec(&intf->nr_users);
>> +out_kfree:
>>   	srcu_read_unlock(&ipmi_interfaces_srcu, index);
>>   	vfree(new_user);
>>   	return rv;
>> -- 
>> 2.25.1
>>
> 
> .
> 

I see that you resolved this issue through code refactoring in the Linux 
next tree. How do you plan to address it in the stable 6.6 tree?

--yiyang

