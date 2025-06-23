Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE2610E9
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 11:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750677450; cv=none; b=RHYPmsUvQFnkDMYX+ZEkAvm+miy6PMA8IbvToIirWpMZGWjBp8GnhKUbew89OE3nUbWef3OCwL8vt0OhTKF9Swt2ztPfxwu4kAZgy5j1Cm72xQEz67Y61d6jAOYdBIWON4slfw4TmUzYN/SjXxzBLRWu/ihM6sayMxj9krUI/OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750677450; c=relaxed/simple;
	bh=ovl/bHYb6C3KR3AeewAgyU8Q13C+1+oe9okwz4HcAeg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=uiPgigxsGPL5LbqOPd6Nw5ayx7ynXkY6eL3HuNbNEQLlZfm6G0XS8L6IpzDal3et7ulBhY8r1YNsChaJYhxQUuzCDfr1yf5p1djB08TEpdQQvYOSQdzbVo9OGWzAEPOeysMoR6kucLigFRPDArz30NC8tEOVk2MCyBbp/mK2LJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OEr69dhK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OEr69dhK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A78F6C4CEF0;
	Mon, 23 Jun 2025 11:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750677449;
	bh=ovl/bHYb6C3KR3AeewAgyU8Q13C+1+oe9okwz4HcAeg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=OEr69dhKSRthCqaEgPW64NAaUuEPniLMmF9+/ZeaS31fTcklJn52PJOAiqardC16M
	 7SE8iurS7Xnkqck1Rnwd10AzqjmoC1N4PL1K9EBFczG21fUXomRqhFYVmShBjsCr3k
	 NGKDeCyxnDmA4f/U2OxhUBkRBWpMPFOSQ/AnIyBJ4lPbhfdOB3Ssce41bZ+Ubj1//p
	 aLDIQ4y0NzbDsJemMMNMH4yBnFP5P6ftUV76MEpgPPNNMXPgpNvjAHRY0/V4p12MHV
	 6vxwQTZ13XXjhdrczmCft1yfwbFk+UUp98mO3ZwRiS+e9fQoXFbcFrckuC78C/VrOD
	 oGx6zyzj/YA/A==
From: Pratyush Yadav <pratyush@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>,  Alexander Usyskin
 <alexander.usyskin@intel.com>,  Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: Linux 6.16-rc1
In-Reply-To: <2e7b74ad-b308-46af-9edb-59c0ce416d89@roeck-us.net>
References: <CAHk-=wiiqYoM_Qdr3L15BqJUyRi6JjR02HSovwwz+BXy7DdVeA@mail.gmail.com>
	<241b0829-5fec-4d88-866a-ba59e2ca748e@roeck-us.net>
	<CAHk-=whDM950+cCgmNH2edB2edCaktdpvBLGjFESAZfYZ3ZpRQ@mail.gmail.com>
	<mafs08qlluuvj.fsf@kernel.org>
	<CAHk-=wjYB7tvFoqsL3aED9YZ2eusi9dMc=ckPzF-dnrRsERBUA@mail.gmail.com>
	<2e7b74ad-b308-46af-9edb-59c0ce416d89@roeck-us.net>
Date: Mon, 23 Jun 2025 13:17:27 +0200
Message-ID: <mafs0wm92u2pk.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sun, Jun 22 2025, Guenter Roeck wrote:

> On Sat, Jun 21, 2025 at 08:59:46AM -0700, Linus Torvalds wrote:
>> On Sat, 21 Jun 2025 at 05:44, Pratyush Yadav <pratyush@kernel.org> wrote:
>> >
>> > I don't have much idea of how people use qemu for testing, but since you
>> > say this is important for testing workloads, I can take a deeper dive
>> > next week and have an answer by -rc4.
>> 
>> Thanks. I'm not sure *how* important this is, but if it affects
>> Guenter's test coverage, I assume it affects others too.
>> 
>> But it's not entirely clear how much it *does* affect Guenter. He says
>> five failed tests, but those are all accounted for by the master
>> device thing.
>> 
>> Guenter, maybe you can clarify?
>> 
>
> Sorry for the delay; I was travelling.
>
> I modified qemu to make the flash type configurable, so it is not a problem
> for me. However, anyone using upstream qemu will see the problem. My qemu patch
> adding the option to configure the flash type was rejected, so those affected
> will have to wait for a proper qemu fix.
>
> I would suggest to not make any changes in the kernel: The qemu problems should be
> fixed in qemu. I only brought this up to raise awareness that there is a qemu related
> problem, not to ask for a change in the Linux kernel.

In case you missed it, see my reply in [0]. For me the flash works fine
with qemu v10.0.0. Which version do you have?

Anyway, I agree with you. Without further evidence, I think the kernel
side is fine and no fixes should be needed.

[0] https://lore.kernel.org/linux-mtd/mafs01prbvbjm.fsf@kernel.org/

-- 
Regards,
Pratyush Yadav
