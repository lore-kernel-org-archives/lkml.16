Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05FF523C8D3
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 15:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738943702; cv=none; b=cQ4WEPSIo2A+3jtyOKZnTUqc2E7uQd6i8MTQE8KDGDF1xHyhb0s86tbN0C6CpJhdYktxQUsihodpRCxeCvFMr3gRppDICdkAqubOUaDuLVe/mVtEEQ5ao+VqnKfOLuyGVgOb9eQ2slfRfnltPNd1gNmnDsP/AwY6zVTGOaF4K9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738943702; c=relaxed/simple;
	bh=y8hgClxh41dIdE7g0dLAnEBinfy5soi0hWyD1OiYr3c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tfp9PBk2/XxOgCcMS1ZyC1fXEqldNraMRwx4H2CsLPU2jMusdaWAEaa390azaOkOMTkdtxGR3SV4e0f37U6xylp+NcBhpoAVK2lJwm1/3hPnL81HQMp3NCEmoyJZgJOVWLIf+AtUnrJsGvf5lxFekxFuosutWF8Omu1K7FHm3EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 339A51E32;
	Fri,  7 Feb 2025 07:55:23 -0800 (PST)
Received: from [10.1.196.57] (eglon.cambridge.arm.com [10.1.196.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 08BD63F58B;
	Fri,  7 Feb 2025 07:54:52 -0800 (PST)
Message-ID: <70f4a5ad-9a89-4833-bbb3-84b7613201c2@arm.com>
Date: Fri, 7 Feb 2025 15:54:52 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 38/40] fs/resctrl: Add boiler plate for external
 resctrl code
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
 <20241004180347.19985-39-james.morse@arm.com>
 <b674aa71-bd06-4cd9-be3e-13e99fb23f15@intel.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <b674aa71-bd06-4cd9-be3e-13e99fb23f15@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Reinette,

On 24/10/2024 01:08, Reinette Chatre wrote:
> On 10/4/24 11:03 AM, James Morse wrote:
> ...
>> +++ b/fs/resctrl/Kconfig
>> @@ -0,0 +1,37 @@
>> +config RESCTRL_FS
>> +	bool "CPU Resource Control Filesystem (resctrl)"
>> +	depends on ARCH_HAS_CPU_RESCTRL
>> +	select KERNFS
>> +	select PROC_CPU_RESCTRL if PROC_FS
>> +	help
>> +	  Some architectures provide hardware facilities to group tasks and
>> +	  monitor and control their usage of memory system resources such as
>> +	  caches and memory bandwidth.  Examples of such facilities include
>> +	  Intel's Resource Director Technology (Intel(R) RDT) and AMD's
>> +	  Platform Quality of Service (AMD QoS).
>> +
>> +	  If your system has the necessary support and you want to be able to
>> +	  assign tasks to groups and manipulate the associated resource
>> +	  monitors and controls from userspace, say Y here to get a mountable
>> +	  'resctrl' filesystem that lets you do just that.
>> +
>> +	  If nothing mounts or prods the 'resctrl' filesystem, resource
>> +	  controls and monitors are left in a quiescent, permissive state.
>> +
>> +	  On architectures where this can be disabled independently, it is
>> +	  safe to say N.
>> +
>> +	  See <file:Documentation/arch/x86/resctrl.rst> for more information.
>> +
>> +config RESCTRL_FS_PSEUDO_LOCK
>> +	bool
>> +	help
>> +	  Software mechanism to pin data in a cache portion using
>> +	  micro-architecture specific knowledge.
>> +

> There now seems to be two copies of this ... patch #23 added this exact same
> "config RESCTRL_FS_PSEUDO_LOCK" snippet to arch/x86/Kconfig

Oops - I'm surprised Kbuild didn't bark at me about that!


>> +config RESCTRL_RMID_DEPENDS_ON_CLOSID
>> +	bool
>> +	help
>> +	  Enable by the architecture when the RMID values depend on the CLOSID.
> 
> "Enable by" -> "Enabled by"?

Yup,


Thanks,

James
