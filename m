Received: from dggsgout12.his.huawei.com (dggsgout12.his.huawei.com [45.249.212.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC436229B0E
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 07:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747381202; cv=none; b=BemVpSzQKHDkSZU6akq2klis2mq7vQ/7ooy4QkxIO1naXOEuG6+XeJ3i5Ny2jwS4Ok+GiPDLEPoJY16l1X7MQ74y9l/mIyZu3y6nTqU6BH5zg9rNUu727OcJ2FsVJoh8PTEPtVsRcTut06+xsQiHgLwcUNsfVnXf3AIymuIuvdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747381202; c=relaxed/simple;
	bh=J+piJ5Bk7W8Rg19D1Zr8uL6Y6MbbwJla5D4YwVjlEYs=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=FmS33v6QkYngE5NjsgzHcLv19wYBxCmhR18LxrjSf3fNFtfPo46aaiIefn0wc1k1mmo7qE0nEtTvx6iWb54tv4po98wzIFSzS0LHf0liX41SBm4rBGSpjO/kiirqVxSIRpzpwy2KiofQYTKgyjD8cZ7C3nlfwjxmBZki4V6LPoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4ZzJqw4RhMz4f3jR5
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 15:39:24 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.75])
	by mail.maildlp.com (Postfix) with ESMTP id 74FB41A07C0
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 15:39:49 +0800 (CST)
Received: from [10.174.178.129] (unknown [10.174.178.129])
	by APP2 (Coremail) with SMTP id Syh0CgBncWTA6yZokLDfMQ--.26021S2;
	Fri, 16 May 2025 15:39:45 +0800 (CST)
Subject: Re: [linus:master] [mm, swap] b487a2da35:
 BUG:soft_lockup-CPU##stuck_for#s![stress-ng-swap:#]
To: Kairui Song <ryncsn@gmail.com>, kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Baoquan He <bhe@redhat.com>,
 Barry Song <v-songbaohua@oppo.com>, Chris Li <chrisl@kernel.org>,
 "Huang, Ying" <ying.huang@linux.alibaba.com>, Hugh Dickins
 <hughd@google.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Kalesh Singh <kaleshsingh@google.com>, Matthew Wilcow <willy@infradead.org>,
 Nhat Pham <nphamcs@gmail.com>, Yosry Ahmed <yosryahmed@google.com>,
 linux-mm@kvack.org
References: <202505161438.9009cf47-lkp@intel.com>
 <CAMgjq7C4oX2nCPHzoWC1LXrxwybMDswYoovJ+hGhxwPXs5u_XA@mail.gmail.com>
From: Kemeng Shi <shikemeng@huaweicloud.com>
Message-ID: <c4e7cb39-7c2e-9507-d7e4-dff4ac542be3@huaweicloud.com>
Date: Fri, 16 May 2025 15:39:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAMgjq7C4oX2nCPHzoWC1LXrxwybMDswYoovJ+hGhxwPXs5u_XA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:Syh0CgBncWTA6yZokLDfMQ--.26021S2
X-Coremail-Antispam: 1UD129KBjvAXoWfGF4DAFW5Cr15Xr45tr15CFg_yoW8JrWkCo
	W5tr1fCr4xGFW5ZFy8Aa1DXryrA34vvFnrJrW2kr45GFnFq3yUJrZayw4UZ34ayF4rta15
	Zr1jqFWxJ3yDAwn7n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UjIYCTnIWjp_UUUYv7kC6x804xWl14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK
	8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4
	AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF
	7I0E14v26r4UJVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7
	CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8C
	rVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4
	IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xKxwCYjI0SjxkI
	62AI1cAE67vIY487MxkF7I0En4kS14v26r4a6rW5MxAIw28IcxkI7VAKI48JMxC20s026x
	CaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_
	JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r
	1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_
	Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8Jr
	UvcSsGvfC2KfnxnUUI43ZEXa7IU0s2-5UUUUU==
X-CM-SenderInfo: 5vklyvpphqwq5kxd4v5lfo033gof0z/



on 5/16/2025 3:19 PM, Kairui Song wrote:
> On Fri, May 16, 2025 at 2:37 PM kernel test robot <oliver.sang@intel.com> wrote:
>>
>>
>>
>> Hello,
>>
>> kernel test robot noticed "BUG:soft_lockup-CPU##stuck_for#s![stress-ng-swap:#]" on:
>>
>> commit: b487a2da3575b6cdfb6d6559311830c8fea70bb9 ("mm, swap: simplify folio swap allocation")
>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>>
>> [test failed on linus/master      fee3e843b309444f48157e2188efa6818bae85cf]
>> [test failed on linux-next/master 484803582c77061b470ac64a634f25f89715be3f]
>>
>> in testcase: stress-ng
>> version: stress-ng-x86_64-f76f86ffb-1_20250412
>> with following parameters:
>>
>>         nr_threads: 100%
>>         disk: 1HDD
>>         testtime: 60s
>>         fs: xfs
>>         test: swap
>>         cpufreq_governor: performance
>>
>>
>>
>> config: x86_64-rhel-9.4
>> compiler: gcc-12
>> test machine: 64 threads 2 sockets Intel(R) Xeon(R) Gold 6346 CPU @ 3.10GHz (Ice Lake) with 256G memory
>>
>> (please refer to attached dmesg/kmsg for entire log/backtrace)
>>
>>
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <oliver.sang@intel.com>
>> | Closes: https://lore.kernel.org/oe-lkp/202505161438.9009cf47-lkp@intel.com
>>
>>
>> [   76.825919][   C17] watchdog: BUG: soft lockup - CPU#17 stuck for 26s! [stress-ng-swap:3017]
>> [   76.825921][   C17] Modules linked in: xfs ipmi_ssif intel_rapl_msr intel_rapl_common intel_uncore_frequency intel_uncore_frequency_common i10nm_edac skx_edac_common nfit libnvdimm x86_pkg_temp_thermal coretemp kvm_intel btrfs kvm sd_mod sg snd_pcm blake2b_generic ghash_clmulni_intel xor dax_hmem ast raid6_pq snd_timer rapl cxl_acpi drm_client_lib ahci intel_cstate cxl_port drm_shmem_helper snd libahci cxl_core intel_th_gth nvme acpi_power_meter isst_if_mbox_pci isst_if_mmio soundcore intel_th_pci mei_me intel_uncore ioatdma i2c_i801 megaraid_sas ipmi_si einj acpi_ipmi pcspkr libata drm_kms_helper nvme_core mei isst_if_common intel_th intel_pch_thermal i2c_smbus intel_vsec dca wmi ipmi_devintf ipmi_msghandler joydev binfmt_misc drm fuse dm_mod loop ip_tables
>> [   76.825949][   C17] CPU: 17 UID: 0 PID: 3017 Comm: stress-ng-swap Not tainted 6.14.0-rc6-00228-gb487a2da3575 #1
>> [   76.825951][   C17] Hardware name: Inspur NF5180M6/NF5180M6, BIOS 06.00.04 04/12/2022
>> [ 76.825952][ C17] RIP: 0010:shmem_unuse (include/linux/list.h:119 include/linux/list.h:215 include/linux/list.h:287 mm/shmem.c:1497)
>> [ 76.825959][ C17] Code: 30 48 8d 6b 30 4c 8d 60 d0 48 81 fd 20 e3 26 83 0f 84 8a 00 00 00 48 83 7b 18 00 75 89 48 8b 43 38 48 8b 53 30 48 39 28 75 6c <48> 39 6a 08 75 66 48 89 42 08 48 89 10 48 89 6b 30 48 89 6b 38 4c
>> All code
>> ========
>>    0:   30 48 8d                xor    %cl,-0x73(%rax)
>>    3:   6b 30 4c                imul   $0x4c,(%rax),%esi
>>    6:   8d 60 d0                lea    -0x30(%rax),%esp
>>    9:   48 81 fd 20 e3 26 83    cmp    $0xffffffff8326e320,%rbp
>>   10:   0f 84 8a 00 00 00       je     0xa0
>>   16:   48 83 7b 18 00          cmpq   $0x0,0x18(%rbx)
>>   1b:   75 89                   jne    0xffffffffffffffa6
>>   1d:   48 8b 43 38             mov    0x38(%rbx),%rax
>>   21:   48 8b 53 30             mov    0x30(%rbx),%rdx
>>   25:   48 39 28                cmp    %rbp,(%rax)
>>   28:   75 6c                   jne    0x96
>>   2a:*  48 39 6a 08             cmp    %rbp,0x8(%rdx)           <-- trapping instruction
>>   2e:   75 66                   jne    0x96
>>   30:   48 89 42 08             mov    %rax,0x8(%rdx)
>>   34:   48 89 10                mov    %rdx,(%rax)
>>   37:   48 89 6b 30             mov    %rbp,0x30(%rbx)
>>   3b:   48 89 6b 38             mov    %rbp,0x38(%rbx)
>>   3f:   4c                      rex.WR
>>
>> Code starting with the faulting instruction
>> ===========================================
>>    0:   48 39 6a 08             cmp    %rbp,0x8(%rdx)
>>    4:   75 66                   jne    0x6c
>>    6:   48 89 42 08             mov    %rax,0x8(%rdx)
>>    a:   48 89 10                mov    %rdx,(%rax)
>>    d:   48 89 6b 30             mov    %rbp,0x30(%rbx)
>>   11:   48 89 6b 38             mov    %rbp,0x38(%rbx)
>>   15:   4c                      rex.WR
>> [   76.825961][   C17] RSP: 0018:ffa00000232ffce0 EFLAGS: 00000246
>> [   76.825964][   C17] RAX: ff110020c063bde0 RBX: ff110020c063bdb0 RCX: 0000000000000006
>> [   76.825965][   C17] RDX: ff110020c063bde0 RSI: 0000000000000000 RDI: ff110020c063be2c
>> [   76.825966][   C17] RBP: ff110020c063bde0 R08: ffffffffffffffc0 R09: 0000000000000000
>> [   76.825967][   C17] R10: 000000000000ffff R11: ffa000000cafa000 R12: ff110020c063bdb0
>> [   76.825968][   C17] R13: ff110020c063be2c R14: 0000000000000014 R15: ff110020c063bdb0
>> [   76.825969][   C17] FS:  00007fcb691d2580(0000) GS:ff11003fbac80000(0000) knlGS:0000000000000000
>> [   76.825970][   C17] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> [   76.825971][   C17] CR2: 00007fcb6490f000 CR3: 00000001897e4006 CR4: 0000000000773ef0
>> [   76.825972][   C17] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
>> [   76.825973][   C17] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
>> [   76.825973][   C17] PKRU: 55555554
>> [   76.825974][   C17] Call Trace:
>> [   76.825975][   C17]  <IRQ>
>> [ 76.825976][ C17] ? watchdog_timer_fn (kernel/watchdog.c:770)
>> [ 76.825980][ C17] ? __pfx_watchdog_timer_fn (kernel/watchdog.c:685)
>> [ 76.825981][ C17] ? __hrtimer_run_queues (kernel/time/hrtimer.c:1801 kernel/time/hrtimer.c:1865)
>> [ 76.825985][ C17] ? hrtimer_interrupt (kernel/time/hrtimer.c:1930)
>> [ 76.825986][ C17] ? __sysvec_apic_timer_interrupt (arch/x86/kernel/apic/apic.c:1038 arch/x86/kernel/apic/apic.c:1055)
>> [ 76.825989][ C17] ? sysvec_apic_timer_interrupt (arch/x86/kernel/apic/apic.c:1049 arch/x86/kernel/apic/apic.c:1049)
>> [   76.825992][   C17]  </IRQ>
>> [   76.825992][   C17]  <TASK>
>> [ 76.825993][ C17] ? asm_sysvec_apic_timer_interrupt (arch/x86/include/asm/idtentry.h:702)
>> [ 76.825997][ C17] ? shmem_unuse (include/linux/list.h:119 include/linux/list.h:215 include/linux/list.h:287 mm/shmem.c:1497)
>> [ 76.825999][ C17] try_to_unuse (mm/swapfile.c:2295)
>> [ 76.826003][ C17] __do_sys_swapoff (mm/swapfile.c:2736)
>> [ 76.826005][ C17] do_syscall_64 (arch/x86/entry/common.c:52 arch/x86/entry/common.c:83)
>> [ 76.826008][ C17] ? __rseq_handle_notify_resume (kernel/rseq.c:420)
>> [ 76.826012][ C17] ? syscall_exit_to_user_mode (include/linux/rseq.h:38 include/linux/resume_user_mode.h:62 kernel/entry/common.c:114 include/linux/entry-common.h:329 kernel/entry/common.c:207 kernel/entry/common.c:218)
>> [ 76.826013][ C17] ? do_syscall_64 (arch/x86/entry/common.c:102)
>> [ 76.826015][ C17] ? __perf_sw_event (kernel/events/internal.h:229 kernel/events/core.c:10210 kernel/events/core.c:10235)
>> [ 76.826016][ C17] ? handle_mm_fault (include/linux/perf_event.h:1503 mm/memory.c:6106 mm/memory.c:6233)
>> [ 76.826020][ C17] ? do_user_addr_fault (arch/x86/mm/fault.c:1338)
>> [ 76.826022][ C17] ? clear_bhb_loop (arch/x86/entry/entry_64.S:1538)
>> [ 76.826024][ C17] ? clear_bhb_loop (arch/x86/entry/entry_64.S:1538)
>> [ 76.826026][ C17] ? clear_bhb_loop (arch/x86/entry/entry_64.S:1538)
>> [ 76.826028][ C17] entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:130)
>> [   76.826030][   C17] RIP: 0033:0x7fcb69976fc7
>> [ 76.826031][ C17] Code: 73 01 c3 48 8b 0d 39 2e 0d 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 b8 a8 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 09 2e 0d 00 f7 d8 64 89 01 48
>> All code
>> ========
>>    0:   73 01                   jae    0x3
>>    2:   c3                      ret
>>    3:   48 8b 0d 39 2e 0d 00    mov    0xd2e39(%rip),%rcx        # 0xd2e43
>>    a:   f7 d8                   neg    %eax
>>    c:   64 89 01                mov    %eax,%fs:(%rcx)
>>    f:   48 83 c8 ff             or     $0xffffffffffffffff,%rax
>>   13:   c3                      ret
>>   14:   66 2e 0f 1f 84 00 00    cs nopw 0x0(%rax,%rax,1)
>>   1b:   00 00 00
>>   1e:   0f 1f 44 00 00          nopl   0x0(%rax,%rax,1)
>>   23:   b8 a8 00 00 00          mov    $0xa8,%eax
>>   28:   0f 05                   syscall
>>   2a:*  48 3d 01 f0 ff ff       cmp    $0xfffffffffffff001,%rax         <-- trapping instruction
>>   30:   73 01                   jae    0x33
>>   32:   c3                      ret
>>   33:   48 8b 0d 09 2e 0d 00    mov    0xd2e09(%rip),%rcx        # 0xd2e43
>>   3a:   f7 d8                   neg    %eax
>>   3c:   64 89 01                mov    %eax,%fs:(%rcx)
>>   3f:   48                      rex.W
>>
>> Code starting with the faulting instruction
>> ===========================================
>>    0:   48 3d 01 f0 ff ff       cmp    $0xfffffffffffff001,%rax
>>    6:   73 01                   jae    0x9
>>    8:   c3                      ret
>>    9:   48 8b 0d 09 2e 0d 00    mov    0xd2e09(%rip),%rcx        # 0xd2e19
>>   10:   f7 d8                   neg    %eax
>>   12:   64 89 01                mov    %eax,%fs:(%rcx)
>>   15:   48                      rex.W
>> [   76.826032][   C17] RSP: 002b:00007ffd6d92dbd8 EFLAGS: 00000206 ORIG_RAX: 00000000000000a8
>> [   76.826033][   C17] RAX: ffffffffffffffda RBX: 0000000000000019 RCX: 00007fcb69976fc7
>> [   76.826034][   C17] RDX: fffffffffffffccc RSI: 000000000003d000 RDI: 00007ffd6d92e690
>> [   76.826035][   C17] RBP: 00007fcb64910000 R08: 0000000000000007 R09: 0000559500e1f530
>> [   76.826036][   C17] R10: c7c9ff097bf742d3 R11: 0000000000000206 R12: 00007fcb691d2180
>> [   76.826036][   C17] R13: 00007ffd6d92e690 R14: 0000000000000001 R15: 0000000000000000
>> [   76.826037][   C17]  </TASK>
>> [   76.826038][   C17] Kernel panic - not syncing: softlockup: hung tasks
>> [   77.239533][   C17] CPU: 17 UID: 0 PID: 3017 Comm: stress-ng-swap Tainted: G             L     6.14.0-rc6-00228-gb487a2da3575 #1
>> [   77.251353][   C17] Tainted: [L]=SOFTLOCKUP
>> [   77.255672][   C17] Hardware name: Inspur NF5180M6/NF5180M6, BIOS 06.00.04 04/12/2022
>> [   77.263635][   C17] Call Trace:
>> [   77.266915][   C17]  <IRQ>
>> [ 77.269756][ C17] panic (kernel/panic.c:354)
>> [ 77.273643][ C17] watchdog_timer_fn (kernel/watchdog.c:735)
>> [ 77.278568][ C17] ? __pfx_watchdog_timer_fn (kernel/watchdog.c:685)
>> [ 77.284015][ C17] __hrtimer_run_queues (kernel/time/hrtimer.c:1801 kernel/time/hrtimer.c:1865)
>> [ 77.289201][ C17] hrtimer_interrupt (kernel/time/hrtimer.c:1930)
>> [ 77.294040][ C17] __sysvec_apic_timer_interrupt (arch/x86/kernel/apic/apic.c:1038 arch/x86/kernel/apic/apic.c:1055)
>> [ 77.299835][ C17] sysvec_apic_timer_interrupt (arch/x86/kernel/apic/apic.c:1049 arch/x86/kernel/apic/apic.c:1049)
>> [   77.305454][   C17]  </IRQ>
>> [   77.308382][   C17]  <TASK>
>> [ 77.311313][ C17] asm_sysvec_apic_timer_interrupt (arch/x86/include/asm/idtentry.h:702)
>> [ 77.317275][ C17] RIP: 0010:shmem_unuse (include/linux/list.h:119 include/linux/list.h:215 include/linux/list.h:287 mm/shmem.c:1497)
>> [ 77.322373][ C17] Code: 30 48 8d 6b 30 4c 8d 60 d0 48 81 fd 20 e3 26 83 0f 84 8a 00 00 00 48 83 7b 18 00 75 89 48 8b 43 38 48 8b 53 30 48 39 28 75 6c <48> 39 6a 08 75 66 48 89 42 08 48 89 10 48 89 6b 30 48 89 6b 38 4c
>> All code
>> ========
>>    0:   30 48 8d                xor    %cl,-0x73(%rax)
>>    3:   6b 30 4c                imul   $0x4c,(%rax),%esi
>>    6:   8d 60 d0                lea    -0x30(%rax),%esp
>>    9:   48 81 fd 20 e3 26 83    cmp    $0xffffffff8326e320,%rbp
>>   10:   0f 84 8a 00 00 00       je     0xa0
>>   16:   48 83 7b 18 00          cmpq   $0x0,0x18(%rbx)
>>   1b:   75 89                   jne    0xffffffffffffffa6
>>   1d:   48 8b 43 38             mov    0x38(%rbx),%rax
>>   21:   48 8b 53 30             mov    0x30(%rbx),%rdx
>>   25:   48 39 28                cmp    %rbp,(%rax)
>>   28:   75 6c                   jne    0x96
>>   2a:*  48 39 6a 08             cmp    %rbp,0x8(%rdx)           <-- trapping instruction
>>   2e:   75 66                   jne    0x96
>>   30:   48 89 42 08             mov    %rax,0x8(%rdx)
>>   34:   48 89 10                mov    %rdx,(%rax)
>>   37:   48 89 6b 30             mov    %rbp,0x30(%rbx)
>>   3b:   48 89 6b 38             mov    %rbp,0x38(%rbx)
>>   3f:   4c                      rex.WR
>>
>>
>> The kernel config and materials to reproduce are available at:
>> https://download.01.org/0day-ci/archive/20250516/202505161438.9009cf47-lkp@intel.com
>>
>>
>>
>> --
>> 0-DAY CI Kernel Test Service
>> https://github.com/intel/lkp-tests/wiki
>>
>>
> 
> It seems this is exactly the problem "mm/shmem: Fix potential dead
> loop in shmem_unuse" trying to fix?
> https://lore.kernel.org/linux-mm/20250515154758.956521-4-shikemeng@huaweicloud.com/
> 
> Hi Kemeng,
> 
> Can you help take a look? And maybe add a "Closes:
> https://lore.kernel.org/oe-lkp/202505161438.9009cf47-lkp@intel.com" in
> your patch?
> 
> BTW I also just found there is another potential problem with shmem,
> the "list_del_init(&info->swaplist);" in shmem_writepage could lead to
> leaked shmem inode on swapoff, it's unrelated to this problem though,
> I can fix it posting one patch for that after double checking.
> 
Hi Kairui,
The "list_del_init(&info->swaplist);" issue is also fixed in my patchset, see
https://lore.kernel.org/linux-mm/20250515154758.956521-5-shikemeng@huaweicloud.com/.
This issue could also lead to a dead loop.

I have not taken a deep look, but I think the "list_del_init(&info->swaplist);" issue
is more likely to blame as it happens to be introduced in
b487a2da3575b6cdfb6d6559311830c8fea70bb9 ("mm,  swap: simplify folio swap allocation").

With these information helps.

