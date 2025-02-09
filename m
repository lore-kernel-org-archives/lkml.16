Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423AC143723
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 13:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739109246; cv=none; b=PtX/V6udoyo8l3eepYTO3kp6kgEID5yXN7Ae5oEbujVXnGM074BXFVGn2aKDg7YNRk0/L+gP+lnsPcVOKekPuMHB8TBRUtSoufBkpFPzKN8X15VNJgSwN3jLFv36QMCxfZDPtgiAEQy72wChi+bih3rOd4l4/1DG+XshdyJoGIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739109246; c=relaxed/simple;
	bh=teKGPj586TuQGXQSHU7KVCjMSBPyuJFyC/BbjoOcrXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AqbN9j+597mGMKgfdKxQYRphFukV1uHKRTb1B3w7GMMluCCLln6BeE3YsKsWSSCxNUPqDtfzMO/ciUW5DmS/nfZeOoAs51Ddhtp/qILYBH52c4VlKg4II9Ht+zR+HLE8KDDzGg+JVMCL3EuewdE5rIcNx0qj83/0tlFG5aj4y8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VyDw41iR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VyDw41iR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC288C4CEDD;
	Sun,  9 Feb 2025 13:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739109245;
	bh=teKGPj586TuQGXQSHU7KVCjMSBPyuJFyC/BbjoOcrXk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VyDw41iRPZAsEm1WHz1XCBtbskTEUkwv9gdoq/3byK/OJ4eRCpkzDRoE4zSqZvUEx
	 0J2RUx8xBVDLd2N/Jvn9LUfFkHNXubExpix+nyeaGx3IIqGYWbj6VcZ1gyopPDUD6v
	 ABUmj3tmFVBF4qBPz9yVC3s1NHxX3QvkkdEiYVN3yip7AsPBFRIOPj8vPfDyIlAqV7
	 o5mj2AB8zmcfRUUny2BQAxW/dOTYNQpOBMvFZPoa3gB6YMN8cWvGZx0OZXDlamJl76
	 b5qNXpTbb8z506ALw47wMiwu4AfpBmK59WXNIVWOx/nNsCCJ64gSqx8aIxz6KyIr2o
	 OUDUxeQTWySrg==
Date: Sun, 9 Feb 2025 15:53:54 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Stephen Eta Zhou <stephen.eta.zhou@outlook.com>
Cc: "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: =?utf-8?B?5Zue5aSNOiBbUEFUQ0g=?= =?utf-8?Q?=5D?= mm: optimize
 memblock_add_range() for improved performance
Message-ID: <Z6izcu5M3LRM3GzC@kernel.org>
References: <BYAPR12MB32059CFEB36A5FC7D859B69FD5F72@BYAPR12MB3205.namprd12.prod.outlook.com>
 <Z6YfqcOx5FACtvae@kernel.org>
 <BYAPR12MB32056738A6225C6B5D61A01AD5F12@BYAPR12MB3205.namprd12.prod.outlook.com>
 <BYAPR12MB3205B550D78130A3858535C0D5F12@BYAPR12MB3205.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BYAPR12MB3205B550D78130A3858535C0D5F12@BYAPR12MB3205.namprd12.prod.outlook.com>

Hi Stephen,

Please don't top post on Linux kernel mailing list.

On Fri, Feb 07, 2025 at 04:03:31PM +0000, Stephen Eta Zhou wrote:
> Hi Mike,
> 
> Given the concerns raised, I would greatly appreciate your guidance on
> whether you think it's worthwhile for me to continue with this approach.
> Should I proceed with further refinements and testing, or would you
> recommend a different direction for optimization? Your input will be
> invaluable in ensuring this patch meets both performance and stability
> goals.

I doubt any optimization for memblock_add_range() will really improve boot
time and even produce a measurable speed up.

With all the fragility and potential of breakage, I don't think it's
worthwhile to attempt optimizations there.
 
> Best regards,  
> Stephen
> ________________________________________
> 发件人: Mike Rapoport <rppt@kernel.org>
> 发送时间: 2025年2月7日 22:58
> 收件人: Stephen Eta Zhou <stephen.eta.zhou@outlook.com>
> 抄送: akpm@linux-foundation.org <akpm@linux-foundation.org>; linux-mm@kvack.org <linux-mm@kvack.org>; linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.org>
> 主题: Re: [PATCH] mm: optimize memblock_add_range() for improved performance
>  
> Hi Stephen,
> 
> On Wed, Feb 05, 2025 at 05:55:50AM +0000, Stephen Eta Zhou wrote:
> > Hi Mike Rapoport、Andrew Morton
> 
> > I have recently been researching the mm subsystem of the Linux kernel,
> > and I came across the memblock_add_range function, which piqued my
> > interest. I found the implementation approach quite interesting, so I
> > analyzed it and identified some areas for optimization. Starting with
> > this part of the code:
> >
> > if (type->cnt * 2 + 1 <= type->max)
> >       insert = true;
> > The idea here is good, but it has a certain flaw. The condition is rather
> > restrictive, and it cannot be executed initially. Moreover, it is only
> > valid when the remaining space is (2/1) + 1. If there is enough memory,
> > but it does not satisfy (2/1) + 1, the insertion operation still needs to
> > be performed twice.
> 
> The code in memblock_add_range() is very fragile, and many attempts to
> remove the second pass that looked correct at the first glance failed for
> some corner case.
> 
> Unfortunately, it's impossible to capture all possible memory
> configurations and reservations in the memblock test suite, so even it it
> passes, there is a chance the kernel will fail to boot on an actual HW.
>  
> > - Before the patch:
> >   - Average: 1.22%
> >   - Max: 1.63%, Min: 0.93%
> >
> > - After the patch:
> >   - Average: 0.69%
> >   - Max: 0.94%, Min: 0.50%
> >
> 
> These numbers do not represent what's actually interesting: the boot time
> speedup.
> 
> --
> Sincerely yours,
> Mike.

-- 
Sincerely yours,
Mike.
