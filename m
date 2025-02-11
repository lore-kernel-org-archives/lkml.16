Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBA2B250C11
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 18:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739299030; cv=none; b=pYLd9G1eF6Q4hgWZ2a+s4T49M80cms03vMyXUKNQubC0TOzvPfC0g6TdHEJuXgi32VGz1a0qM1nk8lc0pd4whYIiXiUmT8Kn+ddihdDtLTL3+oK5fQCQkw42HrDEP8ZsIyDvSDm9I4AsciDX3/RSw/AveRYUSGi8ZsJ23B0eIzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739299030; c=relaxed/simple;
	bh=OjWr7WsaGC8SFv2jOf/htjGjD8jhGmObeZffKbgfh/0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LECJODNaN28DhHv9gW/jcidwvu5iVexvV9/PUxcAqhKIb+Ptl3s2UQbbUV7UTSzYqdqbWkmbTiY6+DmKU4m/9GKXF81+M9eKqUJpIIb24e629xOdIfsgBQrAwQbAOpTT5SCsblKe90Uo0KwwNfRyVP6SdJMDJw/jvd1W83SFzwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4AB9313D5;
	Tue, 11 Feb 2025 10:37:29 -0800 (PST)
Received: from [10.1.197.49] (eglon.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DADAD3F58B;
	Tue, 11 Feb 2025 10:37:03 -0800 (PST)
Message-ID: <0a7cf2ef-55d9-470f-a2cb-03655a6329d5@arm.com>
Date: Tue, 11 Feb 2025 18:37:02 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/42] x86/resctrl: Move the resctrl filesystem code to
 /fs/resctrl
To: Reinette Chatre <reinette.chatre@intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, H Peter Anvin <hpa@zytor.com>,
 Babu Moger <Babu.Moger@amd.com>, shameerali.kolothum.thodi@huawei.com,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
 Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>
References: <20250207181823.6378-1-james.morse@arm.com>
 <f600712d-d089-4285-8d04-e12f53a61572@intel.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <f600712d-d089-4285-8d04-e12f53a61572@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Reinette,

On 10/02/2025 17:24, Reinette Chatre wrote:
> I'd like to check in on what you said in [1]. It sounded as though you were
> planning to look at the assignable counter work from an Arm/MPAM
> perspective but that work has since progressed (now at V11 [2]) without 
> input from Arm/MPAM perspective. As I understand assignable counters may benefit
> MPAM and looking close to settled but it is difficult to gain confidence
> in an interface that may (may not?) be used for MPAM without any feedback
> from Arm/MPAM. I am trying to prevent future issues when/if MPAM needs to use
> this new interface and find it confusing that there does not seem to be
> any input from MPAM side. What am I missing?

Shortly after that some 'new' Spectre issue turned up - unfortunately those rapidly
consume all the time available, and predicting them is, er, the nature of the problem.

This is still on my todo list, I think Dave is planning to look through the ABMC series
too. I had previously sent some comments, (words to the effect "works for me"), and shared
a branch with the MPAM tree rebased on top.

I'm part way though rebasing the MPAM tree on top of Babu's latest version, and still hope
to give some feedback based on testing it...


Thanks,

James
