Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41293125D6
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 14:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746108674; cv=none; b=Qvz2Fhu2YaDgGWXnUm1bBIBQUm1emwcW3A9mNzQ8hvIx52pJbLBGjNQbjm51ZqktnuQIpWBEMUYiYTvGKMWI+xd6O2fJYzINuO3incl2Y704OBqf2E+1KwZ2KuLaCLC+iMFJ6xc9vORkICPWgJA/hj1Kl+GBenCP3lJW1qXE2Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746108674; c=relaxed/simple;
	bh=veKpqZ9GHntTF00sZOsL1I9TTe+yYZTZfGC3J3/Co3U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hD6BHFT+ZyzruF0GjIcNuxanFrk3g/nap2+dLtg4hUL0tExgCsx7VwDpsudFq+Klv2igK4XAgpMD2z4dSSmc0bpi9dNkjVSHdCOrUiiSyJkXBsMxCJqgXxlkyhSnQmvAVLWO8nFN8gLZolWdzePApjsbln325LTXkGVswgZCkpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=akdthsjn; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="akdthsjn"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 541BovuK027337;
	Thu, 1 May 2025 14:10:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=l70TwK
	mPbbUNPJBQcsTTi97Jt0SmLosu6cNfY4ZVL3Y=; b=akdthsjn58t/aoXJ4cFpBg
	W9ZPaEEj5GAWkwX6u/2/TmvIRsoj+4KO1KZcFBFRj9u8bNZgrhO+eXM/9+dJVgA9
	mYxTHHt1DlnBxb5AhXkrmlOpmNn1CS2ODmzuVcdsMwxaQLhXStPggQnwOdDYWniD
	46pXyp/xjoPpe2BDiVeiEXOB6lXIjmqRfItBmkPgtRzUo2E1lpluOhqg8So74/2K
	1Y88Cq1gTSknWcZ46h9WSwsPUeQ5+exVMCEnfHzBVUecJUr6B6zDa2B4AGWrVo+X
	MmavU/ecXDKRazGn09BPw9n4BfloemsYrQ4HvoaZrwpEZ+RFhNTgMENYTJHGFkbA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46buy93j1k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 May 2025 14:10:42 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 541EAgLL030074;
	Thu, 1 May 2025 14:10:42 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46buy93j1g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 May 2025 14:10:42 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 541C0HhA008518;
	Thu, 1 May 2025 14:10:41 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 469ch3d4qh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 May 2025 14:10:41 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 541EAeXd66847178
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 1 May 2025 14:10:40 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3D7E858057;
	Thu,  1 May 2025 14:10:40 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5478558059;
	Thu,  1 May 2025 14:10:34 +0000 (GMT)
Received: from [9.39.16.182] (unknown [9.39.16.182])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  1 May 2025 14:10:33 +0000 (GMT)
Message-ID: <eef9111b-c4d5-47bf-ba6f-54f481ca8f00@linux.ibm.com>
Date: Thu, 1 May 2025 19:40:32 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] driver/base: Optimize memory block registration to
 reduce boot time
To: kernel test robot <lkp@intel.com>, Mike Rapoport <rppt@kernel.org>,
        David Hildenbrand <david@redhat.com>,
        Oscar Salvador <osalvador@suse.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>, rafael@kernel.org,
        Danilo Krummrich <dakr@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
        Linux Memory Management List <linux-mm@kvack.org>,
        Ritesh Harjani <ritesh.list@gmail.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Alison Schofield <alison.schofield@intel.com>,
        Yury Norov <yury.norov@gmail.com>, Dave Jiang <dave.jiang@intel.com>,
        linux-kernel@vger.kernel.org
References: <fbe1e0c7d91bf3fa9a64ff5d84b53ded1d0d5ac7.1745852397.git.donettom@linux.ibm.com>
 <202504300024.YxAyenLy-lkp@intel.com>
Content-Language: en-US
From: Donet Tom <donettom@linux.ibm.com>
In-Reply-To: <202504300024.YxAyenLy-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAxMDEwMyBTYWx0ZWRfXyyCklGBK9z6n WV0FN2Lw1S/4HdP4WMg1kXbYyDRTjicnudctzpxC/icDYmWJLKxsh/UCwBnI37e07rzXwcmmXWr sT06B827uQml2IjZvVvpNKRmFWbV9sMtsSSf8htSwVV/0jMeKvWC5ZwXJB9UKSLFC34iwgrLZjp
 pl9VudFEFwR3gZayND4v1WjXCkRSWjQ9Cep0hDagt7h4LHY6qvDU8BKXXsNBxHxQmk0R67Xtr09 NRqT8pCVQ3JIXqd8ZmxjG/SPtBw4aZd8//HEm+jfJbbhjNzL9Oa/3iqtqKP1q/lWrIAUqWLuts/ h8vXtDm/9q8yjtNLv5uiYj40eFLGpZYQ+I8x5ATUCOTmDZv2E+aKn+gIoKN1JbYuMQT+hxQsR2t
 nUGa7yQP0da4zP/gslT/cDLWlN8sQJ9pD5Rb4gkhMhA93bS0g0J+m94Ya2gb1pOupX/Hgfx3
X-Authority-Analysis: v=2.4 cv=FOYbx/os c=1 sm=1 tr=0 ts=681380e3 cx=c_pps a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=anyJmfQTAAAA:8 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=i3X5FwGiAAAA:8
 a=QyXUC8HyAAAA:8 a=Qydo1BIZeAhsg4m5zJgA:9 a=QEXdDO2ut3YA:10 a=mmqRlSCDY2ywfjPLJ4af:22
X-Proofpoint-ORIG-GUID: iYr0RAGbRdlNFWnmlUeZrkRvvjGST1j1
X-Proofpoint-GUID: W4pxqsK7vzszLGTcSSCcyhQ042Wnb_nu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 mlxlogscore=999 spamscore=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505010103


On 4/29/25 10:31 PM, kernel test robot wrote:
> Hi Donet,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on akpm-mm/mm-everything]
> [also build test ERROR on linus/master v6.15-rc4 next-20250429]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Donet-Tom/driver-base-Remove-unused-functions/20250429-010442
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> patch link:    https://lore.kernel.org/r/fbe1e0c7d91bf3fa9a64ff5d84b53ded1d0d5ac7.1745852397.git.donettom%40linux.ibm.com
> patch subject: [PATCH v2 1/2] driver/base: Optimize memory block registration to reduce boot time
> config: x86_64-buildonly-randconfig-004-20250429 (https://download.01.org/0day-ci/archive/20250430/202504300024.YxAyenLy-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250430/202504300024.YxAyenLy-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202504300024.YxAyenLy-lkp@intel.com/
>
> All error/warnings (new ones prefixed by >>):
>
>     In file included from include/linux/swap.h:11,
>                      from include/linux/suspend.h:5,
>                      from arch/x86/kernel/asm-offsets.c:14:
>>> include/linux/node.h:124:6: warning: no previous prototype for 'register_memory_blocks_under_node_early' [-Wmissing-prototypes]
>       124 | void register_memory_blocks_under_node_early(int nid)
>           |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> --
>     ld: security/keys/encrypted-keys/masterkey_trusted.o: in function `register_memory_blocks_under_node_early':
>>> security/keys/encrypted-keys/masterkey_trusted.c:125: multiple definition of `register_memory_blocks_under_node_early'; security/keys/encrypted-keys/encrypted.o:include/linux/node.h:125: first defined here
> --
>     In file included from include/linux/cpu.h:17,
>                      from include/linux/static_call.h:135,
>                      from include/linux/tracepoint.h:22,
>                      from include/trace/events/tlb.h:9,
>                      from arch/x86/include/asm/mmu_context.h:9,
>                      from include/linux/mmu_context.h:5,
>                      from include/linux/cpuset.h:18,
>                      from include/linux/sched/isolation.h:5,
>                      from kernel/sched/build_policy.c:19:
>>> include/linux/node.h:124:6: warning: no previous prototype for 'register_memory_blocks_under_node_early' [-Wmissing-prototypes]

Thanks for the report. I will fix this and send a revised version.

>       124 | void register_memory_blocks_under_node_early(int nid)
>           |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>     In file included from kernel/sched/build_policy.c:52:
>     kernel/sched/rt.c:9:18: warning: 'max_rt_runtime' defined but not used [-Wunused-const-variable=]
>         9 | static const u64 max_rt_runtime = MAX_BW;
>           |                  ^~~~~~~~~~~~~~
> --
>     ld: drivers/usb/host/xhci-mem.o: in function `register_memory_blocks_under_node_early':
>>> include/linux/node.h:125: multiple definition of `register_memory_blocks_under_node_early'; drivers/usb/host/xhci.o:include/linux/node.h:125: first defined here
>     ld: drivers/usb/host/xhci-ring.o: in function `register_memory_blocks_under_node_early':
>>> include/linux/node.h:125: multiple definition of `register_memory_blocks_under_node_early'; drivers/usb/host/xhci.o:include/linux/node.h:125: first defined here
>     ld: drivers/usb/host/xhci-hub.o: in function `register_memory_blocks_under_node_early':
>>> include/linux/node.h:125: multiple definition of `register_memory_blocks_under_node_early'; drivers/usb/host/xhci.o:include/linux/node.h:125: first defined here
>     ld: drivers/usb/host/xhci-trace.o: in function `register_memory_blocks_under_node_early':
>>> include/linux/node.h:125: multiple definition of `register_memory_blocks_under_node_early'; drivers/usb/host/xhci.o:include/linux/node.h:125: first defined here
>     ld: drivers/usb/host/xhci-dbgcap.o: in function `register_memory_blocks_under_node_early':
>>> include/linux/node.h:125: multiple definition of `register_memory_blocks_under_node_early'; drivers/usb/host/xhci.o:include/linux/node.h:125: first defined here
> --
>     In file included from include/linux/acpi.h:18,
>                      from include/linux/i2c.h:13,
>                      from drivers/power/supply/sbs-battery.c:13:
>>> include/linux/node.h:124:6: warning: no previous prototype for 'register_memory_blocks_under_node_early' [-Wmissing-prototypes]
>       124 | void register_memory_blocks_under_node_early(int nid)
>           |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>     drivers/power/supply/sbs-battery.c: In function 'sbs_get_property':
>     drivers/power/supply/sbs-battery.c:834:30: warning: '%04x' directive writing between 4 and 8 bytes into a region of size 5 [-Wformat-overflow=]
>       834 |         sprintf(sbs_serial, "%04x", ret);
>           |                              ^~~~
>     In function 'sbs_get_battery_serial_number',
>         inlined from 'sbs_get_property' at drivers/power/supply/sbs-battery.c:965:9:
>     drivers/power/supply/sbs-battery.c:834:29: note: directive argument in the range [0, 2147483647]
>       834 |         sprintf(sbs_serial, "%04x", ret);
>           |                             ^~~~~~
>     drivers/power/supply/sbs-battery.c:834:9: note: 'sprintf' output between 5 and 9 bytes into a destination of size 5
>       834 |         sprintf(sbs_serial, "%04x", ret);
>           |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> --
>     In file included from include/linux/swap.h:11,
>                      from include/linux/suspend.h:5,
>                      from include/linux/regulator/consumer.h:35,
>                      from include/linux/phy/phy.h:17,
>                      from include/linux/usb/otg.h:13,
>                      from include/linux/usb/of.h:11,
>                      from drivers/usb/core/usb.c:41:
>>> include/linux/node.h:124:6: warning: no previous prototype for 'register_memory_blocks_under_node_early' [-Wmissing-prototypes]
>       124 | void register_memory_blocks_under_node_early(int nid)
>           |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>     drivers/usb/core/usb.c: In function 'usb_alloc_dev':
>     drivers/usb/core/usb.c:706:37: warning: '%d' directive output may be truncated writing between 1 and 11 bytes into a region of size between 0 and 15 [-Wformat-truncation=]
>       706 |                                 "%s.%d", parent->devpath, port1);
>           |                                     ^~
>     drivers/usb/core/usb.c:706:33: note: using the range [-2147483648, 2147483647] for directive argument
>       706 |                                 "%s.%d", parent->devpath, port1);
>           |                                 ^~~~~~~
>     drivers/usb/core/usb.c:705:25: note: 'snprintf' output between 3 and 28 bytes into a destination of size 16
>       705 |                         snprintf(dev->devpath, sizeof dev->devpath,
>           |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       706 |                                 "%s.%d", parent->devpath, port1);
>           |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> --
>     ld: drivers/i3c/master.o: in function `register_memory_blocks_under_node_early':
>>> include/linux/node.h:125: multiple definition of `register_memory_blocks_under_node_early'; drivers/i3c/device.o:include/linux/node.h:125: first defined here
> --
>     ld: drivers/i3c/master/mipi-i3c-hci/ext_caps.o: in function `register_memory_blocks_under_node_early':
>>> include/linux/node.h:125: multiple definition of `register_memory_blocks_under_node_early'; drivers/i3c/master/mipi-i3c-hci/core.o:include/linux/node.h:125: first defined here
>     ld: drivers/i3c/master/mipi-i3c-hci/pio.o: in function `register_memory_blocks_under_node_early':
>>> include/linux/node.h:125: multiple definition of `register_memory_blocks_under_node_early'; drivers/i3c/master/mipi-i3c-hci/core.o:include/linux/node.h:125: first defined here
>     ld: drivers/i3c/master/mipi-i3c-hci/dma.o: in function `register_memory_blocks_under_node_early':
>>> include/linux/node.h:125: multiple definition of `register_memory_blocks_under_node_early'; drivers/i3c/master/mipi-i3c-hci/core.o:include/linux/node.h:125: first defined here
>     ld: drivers/i3c/master/mipi-i3c-hci/cmd_v1.o: in function `register_memory_blocks_under_node_early':
>>> include/linux/node.h:125: multiple definition of `register_memory_blocks_under_node_early'; drivers/i3c/master/mipi-i3c-hci/core.o:include/linux/node.h:125: first defined here
>     ld: drivers/i3c/master/mipi-i3c-hci/cmd_v2.o: in function `register_memory_blocks_under_node_early':
>>> include/linux/node.h:125: multiple definition of `register_memory_blocks_under_node_early'; drivers/i3c/master/mipi-i3c-hci/core.o:include/linux/node.h:125: first defined here
>     ld: drivers/i3c/master/mipi-i3c-hci/dat_v1.o: in function `register_memory_blocks_under_node_early':
>>> include/linux/node.h:125: multiple definition of `register_memory_blocks_under_node_early'; drivers/i3c/master/mipi-i3c-hci/core.o:include/linux/node.h:125: first defined here
>     ld: drivers/i3c/master/mipi-i3c-hci/dct_v1.o: in function `register_memory_blocks_under_node_early':
>     drivers/i3c/master/mipi-i3c-hci/dct_v1.c:125: multiple definition of `register_memory_blocks_under_node_early'; drivers/i3c/master/mipi-i3c-hci/core.o:include/linux/node.h:125: first defined here
>     ld: drivers/i3c/master/mipi-i3c-hci/hci_quirks.o: in function `register_memory_blocks_under_node_early':
>     drivers/i3c/master/mipi-i3c-hci/hci_quirks.c:125: multiple definition of `register_memory_blocks_under_node_early'; drivers/i3c/master/mipi-i3c-hci/core.o:include/linux/node.h:125: first defined here
> --
>     In file included from include/linux/acpi.h:18,
>                      from include/linux/i2c.h:13,
>                      from drivers/hwmon/pmbus/ibm-cffps.c:11:
>>> include/linux/node.h:124:6: warning: no previous prototype for 'register_memory_blocks_under_node_early' [-Wmissing-prototypes]
>       124 | void register_memory_blocks_under_node_early(int nid)
>           |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>     drivers/hwmon/pmbus/ibm-cffps.c: In function 'ibm_cffps_debugfs_read':
>     drivers/hwmon/pmbus/ibm-cffps.c:169:60: warning: '%02X' directive output may be truncated writing between 2 and 8 bytes into a region of size 3 [-Wformat-truncation=]
>       169 |                                 snprintf(&data[i * 2], 3, "%02X", rc);
>           |                                                            ^~~~
>     drivers/hwmon/pmbus/ibm-cffps.c:169:59: note: directive argument in the range [0, 2147483647]
>       169 |                                 snprintf(&data[i * 2], 3, "%02X", rc);
>           |                                                           ^~~~~~
>     drivers/hwmon/pmbus/ibm-cffps.c:169:33: note: 'snprintf' output between 3 and 9 bytes into a destination of size 3
>       169 |                                 snprintf(&data[i * 2], 3, "%02X", rc);
>           |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>     drivers/hwmon/pmbus/ibm-cffps.c:180:60: warning: '%04X' directive output may be truncated writing between 4 and 8 bytes into a region of size 5 [-Wformat-truncation=]
>       180 |                                 snprintf(&data[i * 4], 5, "%04X", rc);
>           |                                                            ^~~~
>     drivers/hwmon/pmbus/ibm-cffps.c:180:59: note: directive argument in the range [0, 2147483647]
>       180 |                                 snprintf(&data[i * 4], 5, "%04X", rc);
>           |                                                           ^~~~~~
>     drivers/hwmon/pmbus/ibm-cffps.c:180:33: note: 'snprintf' output between 5 and 9 bytes into a destination of size 5
>       180 |                                 snprintf(&data[i * 4], 5, "%04X", rc);
>           |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> --
>     ld: drivers/usb/typec/tipd/trace.o: in function `register_memory_blocks_under_node_early':
>>> include/linux/node.h:125: multiple definition of `register_memory_blocks_under_node_early'; drivers/usb/typec/tipd/core.o:include/linux/node.h:125: first defined here
> --
>     ld: drivers/usb/cdns3/drd.o: in function `register_memory_blocks_under_node_early':
>>> include/linux/node.h:125: multiple definition of `register_memory_blocks_under_node_early'; drivers/usb/cdns3/core.o:include/linux/node.h:125: first defined here
> ..
>
>
> vim +125 security/keys/encrypted-keys/masterkey_trusted.c
>
> b886d83c5b621a Thomas Gleixner     2019-06-01   1  // SPDX-License-Identifier: GPL-2.0-only
> 982e617a313b57 Mimi Zohar          2011-08-27   2  /*
> 982e617a313b57 Mimi Zohar          2011-08-27   3   * Copyright (C) 2010 IBM Corporation
> 982e617a313b57 Mimi Zohar          2011-08-27   4   * Copyright (C) 2010 Politecnico di Torino, Italy
> c9fecf505a3421 Alexander A. Klimov 2020-07-05   5   *                    TORSEC group -- https://security.polito.it
> 982e617a313b57 Mimi Zohar          2011-08-27   6   *
> 982e617a313b57 Mimi Zohar          2011-08-27   7   * Authors:
> 982e617a313b57 Mimi Zohar          2011-08-27   8   * Mimi Zohar <zohar@us.ibm.com>
> 982e617a313b57 Mimi Zohar          2011-08-27   9   * Roberto Sassu <roberto.sassu@polito.it>
> 982e617a313b57 Mimi Zohar          2011-08-27  10   *
> 5395d312dff00d Kees Cook           2017-05-13  11   * See Documentation/security/keys/trusted-encrypted.rst
> 982e617a313b57 Mimi Zohar          2011-08-27  12   */
> 982e617a313b57 Mimi Zohar          2011-08-27  13
> 982e617a313b57 Mimi Zohar          2011-08-27  14  #include <linux/uaccess.h>
> cc100551b4d92f Stephen Rothwell    2011-09-15  15  #include <linux/err.h>
> 982e617a313b57 Mimi Zohar          2011-08-27  16  #include <keys/trusted-type.h>
> ee0b31a25a0101 Mimi Zohar          2012-01-17  17  #include <keys/encrypted-type.h>
> ee0b31a25a0101 Mimi Zohar          2012-01-17  18  #include "encrypted.h"
> 982e617a313b57 Mimi Zohar          2011-08-27  19
> 982e617a313b57 Mimi Zohar          2011-08-27  20  /*
> 982e617a313b57 Mimi Zohar          2011-08-27  21   * request_trusted_key - request the trusted key
> 982e617a313b57 Mimi Zohar          2011-08-27  22   *
> 982e617a313b57 Mimi Zohar          2011-08-27  23   * Trusted keys are sealed to PCRs and other metadata. Although userspace
> 982e617a313b57 Mimi Zohar          2011-08-27  24   * manages both trusted/encrypted key-types, like the encrypted key type
> 982e617a313b57 Mimi Zohar          2011-08-27  25   * data, trusted key type data is not visible decrypted from userspace.
> 982e617a313b57 Mimi Zohar          2011-08-27  26   */
> 982e617a313b57 Mimi Zohar          2011-08-27  27  struct key *request_trusted_key(const char *trusted_desc,
> 146aa8b1453bd8 David Howells       2015-10-21  28  				const u8 **master_key, size_t *master_keylen)
> 982e617a313b57 Mimi Zohar          2011-08-27  29  {
> 982e617a313b57 Mimi Zohar          2011-08-27  30  	struct trusted_key_payload *tpayload;
> 982e617a313b57 Mimi Zohar          2011-08-27  31  	struct key *tkey;
> 982e617a313b57 Mimi Zohar          2011-08-27  32
> 028db3e290f15a Linus Torvalds      2019-07-10  33  	tkey = request_key(&key_type_trusted, trusted_desc, NULL);
> 982e617a313b57 Mimi Zohar          2011-08-27  34  	if (IS_ERR(tkey))
> 982e617a313b57 Mimi Zohar          2011-08-27  35  		goto error;
> 982e617a313b57 Mimi Zohar          2011-08-27  36
> 982e617a313b57 Mimi Zohar          2011-08-27  37  	down_read(&tkey->sem);
> 146aa8b1453bd8 David Howells       2015-10-21  38  	tpayload = tkey->payload.data[0];
> 982e617a313b57 Mimi Zohar          2011-08-27  39  	*master_key = tpayload->key;
> 982e617a313b57 Mimi Zohar          2011-08-27  40  	*master_keylen = tpayload->key_len;
> 982e617a313b57 Mimi Zohar          2011-08-27  41  error:
> 982e617a313b57 Mimi Zohar          2011-08-27  42  	return tkey;
> 982e617a313b57 Mimi Zohar          2011-08-27  43  }
>
