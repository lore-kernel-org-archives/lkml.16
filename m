Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA12A23C8A1
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 15:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738943670; cv=none; b=Z15cpoQjXxtlT6V0zBgsTon8V6otcalGBPeGxTibSIqx/x5RNl4qnuU8aEMyk7cQQ6yqV6y18xYBPGuovn2s+VpoqaXSD7IF7+u2yOgoyN6GW0BilBeQ7MV98hjWEStfdhe8+tzzvDKv+n4Ckh+jZwLI/lbfTTfajHy0m5H05O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738943670; c=relaxed/simple;
	bh=WAF93G7dZWyhoQxf2JKBt1LR/kuLXYKYX0VD4C+PGmk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vCI9rREnhBGxl3t3XatN9h0JRuRb+A259F1Dm9H7K82NFSzJYU70B6zolk221Z/kdJxe4gJgaZemEt0Zr1B0E9X2iXaAhwfNfEsdR31zJwedNTbGLQkbORQufcM2xdhzfkSbuS+4WOtFwPSjOPf+BgUdxduFTcQ62N2vjPigWZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 00CEF113E;
	Fri,  7 Feb 2025 07:54:51 -0800 (PST)
Received: from [10.1.196.57] (eglon.cambridge.arm.com [10.1.196.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A3C663F58B;
	Fri,  7 Feb 2025 07:54:22 -0800 (PST)
Message-ID: <f2ecb501-bc65-49a9-903d-80ba1737845f@arm.com>
Date: Fri, 7 Feb 2025 15:54:21 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 32/40] x86/resctrl: resctrl_exit() teardown resctrl but
 leave the mount point
To: Reinette Chatre <reinette.chatre@intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
Cc: Fenghua Yu <fenghua.yu@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 H Peter Anvin <hpa@zytor.com>, Babu Moger <Babu.Moger@amd.com>,
 shameerali.kolothum.thodi@huawei.com,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
 Dave Martin <dave.martin@arm.com>, Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
References: <20241004180347.19985-1-james.morse@arm.com>
 <20241004180347.19985-33-james.morse@arm.com>
 <93fe977c-e5c4-407e-ad84-dec7f81e6b87@intel.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <93fe977c-e5c4-407e-ad84-dec7f81e6b87@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Reinette,

On 24/10/2024 00:50, Reinette Chatre wrote:
> On 10/4/24 11:03 AM, James Morse wrote:
>> resctrl_exit() was intended for use when the 'resctrl' module was unloaded.
>> resctrl can't be built as a module, and the kernfs helpers are not exported
>> so this is unlikely to change. MPAM has an error interrupt which indicates
>> the MPAM driver has gone haywire. Should this occur tasks could run with
>> the wrong control values, leading to bad performance for important tasks.
>> The MPAM driver needs a way to tell resctrl that no further configuration
>> should be attempted.
>>
>> Using resctrl_exit() for this leaves the system in a funny state as
>> resctrl is still mounted, but cannot be un-mounted because the sysfs
>> directory that is typically used has been removed. Dave Martin suggests
>> this may cause systemd trouble in the future as not all filesystems
>> can be unmounted.
>>
>> Add calls to remove all the files and directories in resctrl, and
>> remove the sysfs_remove_mount_point() call that leaves the system
>> in a funny state. When triggered, this causes all the resctrl files
>> to disappear. resctrl can be unmounted, but not mounted again.

>> diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> index f77fab859c35..bb5aadaf99b6 100644
>> --- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> +++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> @@ -4319,9 +4319,9 @@ int __init resctrl_init(void)
>>  
>>  void __exit resctrl_exit(void)
>>  {
>> +	rdtgroup_destroy_root();
> 
> If I understand correctly, rdtgroup_destroy_root() can now be called
> twice, first during the error interrupt and then on unmount. Would the
> second call be safe?

Hmmm, I thought the mount point would be holding a reference, but this is undoing the work
done at mount time, not init time. Yes, its not safe.

As there is no caller of resctrl_exit() until the MPAM driver, I had another piece left
until later - which covers what happens if the error triggers when resctrl is not mounted:

https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/commit/?h=mpam/snapshot/v6.12-rc1&id=44bb27404b4ce6744fdd4058d1fc07ed2f8d1a9f

(which also covers serialising this against umount if the caller is really unlucky)


> I am not familiar with this code but  I
> see kernfs_destroy_root() and __kernfs_remove() dereferencing pointers
> without checks. I wonder if this needs to be made safer with a:


> 	rdtgroup_destroy_root()
> 	{
> 		if (rdtgroup_default.kn) {
> 			kernfs_destroy_root();
> 			rdtgroup_default.kn = NULL;
> 		}
> 	}

My version checked rdt_root - but nothing actually nobbles that. Your version is a lot
better. Thanks!

If there was a helper to reverse kernfs_root_to_node(), it'd be possible to remove
rdt_root completely - but its contents are private to kernfs.



>>  	debugfs_remove_recursive(debugfs_resctrl);
>>  	unregister_filesystem(&rdt_fs_type);
>> -	sysfs_remove_mount_point(fs_kobj, "resctrl");


> This breaks symmetry with resctrl_init(). The changelog describes the
> motivation clearly but once this line is removed it will be difficult to
> get back to this motivation. Could this function get a comment to explain
> why the mount point is not removed? This will be helpful to anybody following
> this work that may attempt to "fix" the asymmetry by cleaning up the
> mount point created during init.

Sure. I've added some kdoc to explain where/when this is called, and what it does at a
high level:
| /**
|  * resctrl_exit() - Remove the resctrl filesystem and free resources.
|  *
|  * Called by the architecture code in response to a fatal error.
|  * Resctrl files and structures are removed from kernfs to prevent further
|  * configuration.
|  */

Then specifically:
|	/*
| 	 * The sysfs mount point added by resctrl_init() is not removed so that
|	 * it can be used to umount resctrl.
|	 */


Thanks,

James
