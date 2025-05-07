Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C95319AD5C
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 16:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746636683; cv=none; b=MscIwHDl+/2cvsKxbWtAkYWYEdTjQCmkK0I/lvbT0NtRnxPgMFke1WHfmB2GYiTV9dAJULmNs1/o42V3v1tiNpQqNi8vdSgvKGecuylXDnODe3y0QE5UWuqppoYaTkdrHhORxaI2qdDvVoLIB94eqQjdr0tahdn/LeA2akUO3m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746636683; c=relaxed/simple;
	bh=AhS7skW69JrErTmvxNkCPnTEII81RuMnY6oo6mEw8S8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DDEl7Q5oqW8vsGq4+GRBMYI1oSRB/pjQOotghUtQkNQbC61Nt91HE9evICZEQSo680n5Thu0Fl+rGAxqT5IfqWts6znWY1QoFMPej9IrCQ0FhY9hL+I8EItwB0+5vXwK/72a76oWrLZy1MD6jjzfnaXZ/97nEi4nK9ikn/srqaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A2B5716F2;
	Wed,  7 May 2025 09:51:11 -0700 (PDT)
Received: from [10.1.197.43] (eglon.cambridge.arm.com [10.1.197.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 57A913F58B;
	Wed,  7 May 2025 09:51:18 -0700 (PDT)
Message-ID: <0c526e05-8e51-4cca-a4a0-5dd330328209@arm.com>
Date: Wed, 7 May 2025 17:51:16 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 00/27] x86/resctrl: Move the resctrl filesystem code to
 /fs/resctrl
To: "Shaopeng Tan (Fujitsu)" <tan.shaopeng@fujitsu.com>,
 "x86@kernel.org" <x86@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: Reinette Chatre <reinette.chatre@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, H Peter Anvin <hpa@zytor.com>,
 Babu Moger <Babu.Moger@amd.com>,
 "shameerali.kolothum.thodi@huawei.com"
 <shameerali.kolothum.thodi@huawei.com>,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 "carl@os.amperecomputing.com" <carl@os.amperecomputing.com>,
 "lcherian@marvell.com" <lcherian@marvell.com>,
 "bobo.shaobowang@huawei.com" <bobo.shaobowang@huawei.com>,
 "baolin.wang@linux.alibaba.com" <baolin.wang@linux.alibaba.com>,
 Jamie Iles <quic_jiles@quicinc.com>, Xin Hao <xhao@linux.alibaba.com>,
 "peternewman@google.com" <peternewman@google.com>,
 "dfustini@baylibre.com" <dfustini@baylibre.com>,
 "amitsinght@marvell.com" <amitsinght@marvell.com>,
 David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
 Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>,
 "fenghuay@nvidia.com" <fenghuay@nvidia.com>
References: <20250425173809.5529-1-james.morse@arm.com>
 <OSZPR01MB87982E5190AF6B1C8B35D3988B88A@OSZPR01MB8798.jpnprd01.prod.outlook.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <OSZPR01MB87982E5190AF6B1C8B35D3988B88A@OSZPR01MB8798.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello Shaopeng Tan,

On 07/05/2025 13:00, Shaopeng Tan (Fujitsu) wrote:
> I ran tools/tests/selftests/resctrl with the following patch on AMD EPYC 9454P 48-Core Processor, it looks good.
> https://lore.kernel.org/lkml/cover.1717626661.git.babu.moger@amd.com/#r
> 
> 
>>> https://lore.kernel.org/lkml/96d276c11e69cfb1e29d50a12c8043555c06b404.1718144237.git.babu.moger@amd.com/#r
>>
>> It is strange that you needed to add this since it can be found in v6.10 and up.
> Sorry, I made a mistake. This patch is in v6.10 and up.
> 
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>

Thanks for re-testing this!

James
