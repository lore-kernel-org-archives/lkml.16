Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08115E56A
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 01:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747100919; cv=none; b=sSlmPyoqdI/Bk8IMkNjAWoowF29dJ+f33jCnhPixbc518Tbrh7aFUspfgyC1A1lKInujihvPslhNEF+7glM6rSUT9RZVag/NwNJoDMWZ2t/EYuP+dsXqI9/XzwUu09uXGJXWi/Ssv8VFb/rX9lVoCn4nU9Fw/YjV3oi9q9RabhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747100919; c=relaxed/simple;
	bh=xDK93dk0SiVRT64vlt0meQ6sSmQAfsmPy68IEnF0/Lc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KssGvsvaedi2gT749f7bQYRI4kFBmx7o8lFkMBSv2/QZE78lgGcUDoWFAYNJGt1ACfFcosnbWNgy04gEDlrT3YFd4lgdwT5i6DnmveXD9Rw2v6YHW+RHnDfDbCG+NeaHM9p5i0V84CF7j2fdEJ7/wlVwjOISSgISxW08W9DXZkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4ZxK9z2BZHz4f3kvh
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 09:48:07 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.75])
	by mail.maildlp.com (Postfix) with ESMTP id 795FD1A19CB
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 09:48:33 +0800 (CST)
Received: from [10.67.109.79] (unknown [10.67.109.79])
	by APP2 (Coremail) with SMTP id Syh0CgBXYGPvpCJowpSbMA--.9792S2;
	Tue, 13 May 2025 09:48:33 +0800 (CST)
Message-ID: <d3f27222-7262-4f04-8c80-329852bc251e@huaweicloud.com>
Date: Tue, 13 May 2025 09:48:31 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC next v2 0/5] ucount: add rlimit cache for ucount
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: paulmck@kernel.org, legion@kernel.org, roman.gushchin@linux.dev,
 brauner@kernel.org, tglx@linutronix.de, frederic@kernel.org,
 peterz@infradead.org, oleg@redhat.com, joel.granados@kernel.org,
 viro@zeniv.linux.org.uk, lorenzo.stoakes@oracle.com, avagin@google.com,
 mengensun@tencent.com, linux@weissschuh.net, jlayton@kernel.org,
 ruanjinjie@huawei.com, kees@kernel.org, linux-kernel@vger.kernel.org,
 lujialin4@huawei.com, Chen Ridong <chenridong@huawei.com>
References: <20250509072054.148257-1-chenridong@huaweicloud.com>
 <20250509131849.112545d60dd7bb2d28c3b966@linux-foundation.org>
 <20250512104828.hjVjvmT3@linutronix.de>
Content-Language: en-US
From: Chen Ridong <chenridong@huaweicloud.com>
In-Reply-To: <20250512104828.hjVjvmT3@linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:Syh0CgBXYGPvpCJowpSbMA--.9792S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Jry8AFWrGw4kuw4kGF4UJwb_yoWxJr4rpF
	W8ta45Ary8JF93t34kJ3y8t34Fk347CrZ8Ga15Gw1fCwnIyFnYgw17KrWYvF9Ikrn3Gw1a
	q3yq9ayqkF1qqaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUv0b4IE77IF4wAFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS
	14v26r4a6rW5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I
	8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWr
	XwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x
	0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_
	Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0
	s2-5UUUUU==
X-CM-SenderInfo: hfkh02xlgr0w46kxt4xhlfz01xgou0bp/



On 2025/5/12 18:48, Sebastian Andrzej Siewior wrote:
> On 2025-05-09 13:18:49 [-0700], Andrew Morton wrote:
>> On Fri,  9 May 2025 07:20:49 +0000 Chen Ridong <chenridong@huaweicloud.com> wrote:
>>
>>> The will-it-scale test case signal1 [1] has been observed. and the test
>>> results reveal that the signal sending system call lacks linearity.
>>> To further investigate this issue, we initiated a series of tests by
>>> launching varying numbers of dockers and closely monitored the throughput
>>> of each individual docker. The detailed test outcomes are presented as
>>> follows:
>>>
>>> 	| Dockers     |1      |4      |8      |16     |32     |64     |
>>> 	| Throughput  |380068 |353204 |308948 |306453 |180659 |129152 |
>>>
>>> The data clearly demonstrates a discernible trend: as the quantity of
>>> dockers increases, the throughput per container progressively declines.
>>> In-depth analysis has identified the root cause of this performance
>>> degradation. The ucouts module conducts statistics on rlimit, which
>>> involves a significant number of atomic operations. These atomic
>>> operations, when acting on the same variable, trigger a substantial number
>>> of cache misses or remote accesses, ultimately resulting in a drop in
>>> performance.
>>
>> Did you consider simply turning that atomic_t counter into a
>> percpu_counter?
> 
> That sounds like a smaller change. Also, do these 1…64 docker container
> play signal ping-pong or is there a real workload behind it?
> 
> Sebastian

Hi Andrew and Sebastian,

Thanks for your prompt reply. I'm currently conducting a "will-it-scale"
test on a 384-core machine configured to run up to 64 Docker
containers(max num). Even with just 32 containers, the throughput drops
by 53%, which indicates significant scaling challenges.

Your suggestion about using percpu_counter was spot on. I've since
implemented a demo to benchmark its performance. Here's the code I wrote
for testing:

static void do_dec_rlimit_put_ucounts(struct ucounts *ucounts,
@@ -281,10 +289,10 @@ static void do_dec_rlimit_put_ucounts(struct
ucounts *ucounts,
 {
        struct ucounts *iter, *next;
        for (iter = ucounts; iter != last; iter = next) {
-               long dec = atomic_long_sub_return(1, &iter->rlimit[type]);
-               WARN_ON_ONCE(dec < 0);
+               percpu_counter_sub(&iter->rlimit[type], 1);
+
                next = iter->ns->ucounts;
-               if (dec == 0)
+               if (percpu_counter_compare(&iter->rlimit[type], 0) == 0)
                        put_ucounts(iter);
        }
 }
@@ -295,36 +303,40 @@ void dec_rlimit_put_ucounts(struct ucounts
*ucounts, enum rlimit_type type)
 }

 long inc_rlimit_get_ucounts(struct ucounts *ucounts, enum rlimit_type type,
-                           bool override_rlimit)
+                           bool override_rlimit, long limit)
 {
        /* Caller must hold a reference to ucounts */
        struct ucounts *iter;
        long max = LONG_MAX;
-       long dec, ret = 0;
+       long ret = 0;
+
+       if (override_rlimit)
+               limit = LONG_MAX;

        for (iter = ucounts; iter; iter = iter->ns->ucounts) {
-               long new = atomic_long_add_return(1, &iter->rlimit[type]);
-               if (new < 0 || new > max)
+               max = min(limit, max);
+
+               if (!percpu_counter_limited_add(&iter->rlimit[type],
max, 1)) {
+                       ret = -1;
                        goto dec_unwind;
-               if (iter == ucounts)
-                       ret = new;
+               }
                if (!override_rlimit)
                        max = get_userns_rlimit_max(iter->ns, type);
                /*
                 * Grab an extra ucount reference for the caller when
                 * the rlimit count was previously 0.
                 */
-               if (new != 1)
+               if (percpu_counter_compare(&iter->rlimit[type], 1) != 0)
                        continue;
-               if (!get_ucounts(iter))
+               if (!get_ucounts(iter)) {
+                       ret = 0;
                        goto dec_unwind;
+               }
        }
-       return ret;
+       return 1;
 dec_unwind:
-       dec = atomic_long_sub_return(1, &iter->rlimit[type]);
-       WARN_ON_ONCE(dec < 0);
        do_dec_rlimit_put_ucounts(ucounts, iter, type);
-       return 0;
+       return ret;
 }

As shown in demo code, the current implementation retrieves ucounts
during the initial rlimit increment and releases them when the rlimit
hits zero. This mechanism was introduced with the commits:

  fda31c50292a5062332fa0343c084bd9f46604d9 signal: avoid double atomic
 counter increments for user accounting

  d64696905554e919321e31afc210606653b8f6a4   Reimplement
RLIMIT_SIGPENDING on top of ucounts

  15bc01effefe97757ef02ca09e9d1b927ab22725 ucounts: Fix signal ucount
refcounting

It means that we have to requires summing all percpu rlimit counters
very time we increment or decrement the rlimit and this is expensive.

Running the demo code in a single Docker container yielded a throughput
of 73,970 —significantly lower than expected. Performance profiling via
perf revealed:__percpu_counter_sum is the primary performance bottleneck.

+   97.44%     0.27%  signal1_process    [k] entry_SYSCALL_64_after_hwframe
+   97.13%     1.96%  signal1_process    [k] do_syscall_64
+   91.54%     0.00%  signal1_process    [.] 0x00007fb905c8d13f
+   78.66%     0.03%  signal1_process    [k] __percpu_counter_compare
+   78.63%    68.18%  signal1_process    [k] __percpu_counter_sum
+   45.17%     0.37%  signal1_process    [k] syscall_exit_to_user_mode
+   44.95%     0.20%  signal1_process    [k] __x64_sys_tgkill
+   44.51%     0.40%  signal1_process    [k] do_send_specific
+   44.16%     0.07%  signal1_process    [k] arch_do_signal_or_restart
+   43.03%     0.37%  signal1_process    [k] do_send_sig_info
+   42.08%     0.34%  signal1_process    [k] __send_signal_locked
+   40.87%     0.03%  signal1_process    [k] sig_get_ucounts
+   40.74%     0.44%  signal1_process    [k] inc_rlimit_get_ucounts
+   40.55%     0.54%  signal1_process    [k] get_signal
+   39.81%     0.07%  signal1_process    [k] dequeue_signal
+   39.00%     0.07%  signal1_process    [k] __sigqueue_free
+   38.94%     0.27%  signal1_process    [k] do_dec_rlimit_put_ucounts
+    8.60%     8.60%  signal1_process    [k] _find_next_or_bit

However, If we can implement a mechanism to unpin ucounts for signal
pending operations (eliminating the need for get/put refcount
operations), the percpu_counter approach should effectively resolve this
scalability issue. I am trying to figure this out, and if you have any
ideas, please let know, I will do test.

Thank you for your guidance on this matter.

Best regards,
Ridong

