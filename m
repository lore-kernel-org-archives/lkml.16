Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398CC4C98
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 16:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748968796; cv=none; b=Qlj2Vifo0a7dUoA6DVH4NQvRcbN198qYNhBAM++SJIiCZUaXaSd6qlekr57+JPy8y4rxk/Fyk1FxegukzRjBBrMHj6p9tRXas77dGMFZFx1/eFkhWp2J/uwxk4t/2xs6yl6EuUjgfGGnWHZhqT/os/64QGeqrOdXDPYRt9zHV7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748968796; c=relaxed/simple;
	bh=3oGZ0bCqtcXEfaMpat3M8zjURdp9ufeZObFypBxWjh4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=BwFMOlVj8D3KaI2XZ0RNdfVKQKg+kBIFRqYXWA0YU+vUZ8kpmvqcCNbREbY5nVy87pCUYBcbUwwZ64qNwM9RjIUXiLHvU6bbPnzEYfhN5CVQiXVKYtLTovcVm8y+eZVCq96LpU97FL7awb47DNRhthId9cgY9UZOGca/WJuvC7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=PPGNg801; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="PPGNg801"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 553FYCoA027571;
	Tue, 3 Jun 2025 16:39:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=nK2gtG
	y8nJgAy6Lqq0a/2oiQcZetp9Jonp+U9rtmqqk=; b=PPGNg801xWbMdU/pi/cF9U
	RRmojYNcBGJ+rXdR7+LXOT2VIu9L26+U33dgdha0v+OiXSAy+3fUUpFxGwdT/SQp
	814XZlRXEYwJqvKyVE/pmiuGLOC26LvQoC6xRlY4mzVFZ36xCZ38nOsOtRrvLmEe
	Crh/3KUxbJSfiBTJHlWItNUZ1e4MmRLxCKORZDdCDHUMT03dIupS5p8hyTK5x/k6
	U/6d4RlHzheMH4GEgCXnV8IwSrHqiLOP0fHxsDHx/mmQAKVajKGC1WjixxLUh/oV
	OSko4HJYPlkTLhAUaRfWt+ZIj3uLOl8PwGSJn/V2N6COA68chK31IM2ilISzc7CA
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 471gw1wkhu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Jun 2025 16:39:41 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 553Dwmim028472;
	Tue, 3 Jun 2025 16:39:41 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 470eakbg39-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Jun 2025 16:39:40 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 553GdbRH17629670
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 3 Jun 2025 16:39:37 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5067B20040;
	Tue,  3 Jun 2025 16:39:37 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9278D20043;
	Tue,  3 Jun 2025 16:39:33 +0000 (GMT)
Received: from [9.43.67.159] (unknown [9.43.67.159])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  3 Jun 2025 16:39:33 +0000 (GMT)
Message-ID: <47196e67-6533-4015-95db-63a76c1c0c5c@linux.ibm.com>
Date: Tue, 3 Jun 2025 22:09:30 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] kernel/rcu/tree_stall: add
 /sys/kernel/rcu_stall_count
To: akpm@linux-foundation.org, Max Kellermann <max.kellermann@ionos.com>,
        song@kernel.org, joel.granados@kernel.org, dianders@chromium.org,
        cminyard@mvista.com, linux-kernel@vger.kernel.org
References: <20250504180831.4190860-1-max.kellermann@ionos.com>
 <20250504180831.4190860-3-max.kellermann@ionos.com>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <20250504180831.4190860-3-max.kellermann@ionos.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDE0MCBTYWx0ZWRfX6pOHfZ8oaXTy IiPvFbIJn/23IknO7658GgNehV+Xs0kkel6ich2VUJn3Twb5guiS7FZ6pCKNpiFLNC+po3/F6/n D8cxmWwjC1KFiaPpFpFTEnsnhTTpRzYUGA2MkuHpLUJl179jh1by/2sdx0ZYvG8TpOcdp1yqeuS
 4R9cjuneeJfnICotbJATZUh4yFWXCU5ufORfxtqUVbfJ787X3OFIulAaav3Ce2/NnLF5bYZwn7S gb4dCRQLfsEOwscApSA55WkC+tAQ3csUi6hXrQqFS+5DWFiWqeME+ogdOVIrVzOHfvTrU/We1kv nYz23/vxLqjXXxi+VuyDqj0G/1j4/4Cjt7DfneHnrOZ43OGXX4AkHOe4cmwJ/f0eomEu92x/n9C
 fkhQdIEeZuvbzRvb8rLVvymHy+x2ebcsLRinjFBfx5C6dZ9hkT3ansQjJ0055f79W6kheyuA
X-Proofpoint-ORIG-GUID: OGn1qN9b2Fsq-_ROqbI68IhVgb5YJHwG
X-Authority-Analysis: v=2.4 cv=HcIUTjE8 c=1 sm=1 tr=0 ts=683f254d cx=c_pps a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=UgJECxHJAAAA:8 a=VwQbUJbxAAAA:8 a=Y_zN7klmYV0XI4u_UmgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=-El7cUbtino8hM1DCn8D:22
X-Proofpoint-GUID: OGn1qN9b2Fsq-_ROqbI68IhVgb5YJHwG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1011 mlxlogscore=999 suspectscore=0 malwarescore=0
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0 mlxscore=0
 adultscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506030140

Hello Andrew,

On 04/05/25 23:38, Max Kellermann wrote:
> Exposing a simple counter to userspace for monitoring tools.
>
> Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
> ---
> v1 -> v2: added documentation
> ---
>   .../ABI/testing/sysfs-kernel-rcu_stall_count  |  6 +++++
>   kernel/rcu/tree_stall.h                       | 26 +++++++++++++++++++
>   2 files changed, 32 insertions(+)
>   create mode 100644 Documentation/ABI/testing/sysfs-kernel-rcu_stall_count
>
> diff --git a/Documentation/ABI/testing/sysfs-kernel-rcu_stall_count b/Documentation/ABI/testing/sysfs-kernel-rcu_stall_count
> new file mode 100644
> index 000000000000..a4a97a7f4a4d
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-kernel-rcu_stall_count
> @@ -0,0 +1,6 @@
> +What:		/sys/kernel/rcu_stall_count
> +Date:		May 2025
> +KernelVersion:	6.16
> +Contact:	Linux kernel mailing list <linux-kernel@vger.kernel.org>
> +Description:
> +		Shows how many times the system has detected an RCU stall since last boot.
> diff --git a/kernel/rcu/tree_stall.h b/kernel/rcu/tree_stall.h
> index 925fcdad5dea..158330524795 100644
> --- a/kernel/rcu/tree_stall.h
> +++ b/kernel/rcu/tree_stall.h
> @@ -20,6 +20,28 @@
>   int sysctl_panic_on_rcu_stall __read_mostly;
>   int sysctl_max_rcu_stall_to_panic __read_mostly;
>   
> +#ifdef CONFIG_SYSFS
> +
> +static unsigned int rcu_stall_count;
> +
> +static ssize_t rcu_stall_count_show(struct kobject *kobj, struct kobj_attribute *attr,
> +				    char *page)
> +{
> +	return sysfs_emit(page, "%u\n", rcu_stall_count);
> +}
> +
> +static struct kobj_attribute rcu_stall_count_attr = __ATTR_RO(rcu_stall_count);
> +
> +static __init int kernel_rcu_stall_sysfs_init(void)
> +{
> +	sysfs_add_file_to_group(kernel_kobj, &rcu_stall_count_attr.attr, NULL);
> +	return 0;
> +}
> +
> +late_initcall(kernel_rcu_stall_sysfs_init);
> +
> +#endif // CONFIG_SYSFS
> +
>   #ifdef CONFIG_PROVE_RCU
>   #define RCU_STALL_DELAY_DELTA		(5 * HZ)
>   #else
> @@ -784,6 +806,10 @@ static void check_cpu_stall(struct rcu_data *rdp)
>   		if (kvm_check_and_clear_guest_paused())
>   			return;
>   
> +#ifdef CONFIG_SYSFS
> +		++rcu_stall_count;
> +#endif
> +
>   		rcu_stall_notifier_call_chain(RCU_STALL_NOTIFY_NORM, (void *)j - gps);
>   		if (READ_ONCE(csd_lock_suppress_rcu_stall) && csd_lock_is_stuck()) {
>   			pr_err("INFO: %s detected stall, but suppressed full report due to a stuck CSD-lock.\n", rcu_state.name);

It seems like this patch was not applied properly to the upstream tree.

Out of the three hunks in this patch, only the first one is applied; the 
second
and third hunks are missing.

commit 2536c5c7d6ae5e1d844aa21f28b326b5e7f815ef
Author: Max Kellermann <max.kellermann@ionos.com>
Date:   Sun May 4 20:08:31 2025 +0200

     kernel/rcu/tree_stall: add /sys/kernel/rcu_stall_count

     Expose a simple counter to userspace for monitoring tools.


Thanks,
Sourabh Jain
