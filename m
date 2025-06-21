Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA3F1D6DB9
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 12:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750509876; cv=none; b=e/hxRWKjJHIJJZ3KH1lCf5xpBuKWDvcR1HEDlYuM5saCagx+SRPdcs/HgidmOUiIsM0cNA3S50YVuGLLLIwPytIeaUixpaiFMZq/tXvneKqrPzKlJ+KvYxc1gg9B5k6OgkGJwfsek2MxmnpJcbx5Zh/PCaDC1mEPVL/73PuIFUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750509876; c=relaxed/simple;
	bh=vuGrZKWkCQ5OixtJ0zo4aOMg1kMzT2IpnXsC0NHblD4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=PXADTVLtdCmK+l6vXCRNkN9VYn0hKVVMVf8X10gd2A2Aaj4dyY2Nzov1l5mwZklnibnULG7roPGJNF3OKV2BuV7nRm2hpzLpg08iRPSyc+ZY3MBUvMo+jby3pOBhBDVR9fRhQPta2E+pz+LzmBcHJPt+nP8BQUaAmuOmhS7SZEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cbAVxaE6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cbAVxaE6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C9AFC4CEE7;
	Sat, 21 Jun 2025 12:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750509875;
	bh=vuGrZKWkCQ5OixtJ0zo4aOMg1kMzT2IpnXsC0NHblD4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=cbAVxaE6AikRP7aCz6lNgUwOcwU8ehVxu4Et1P1JGS10V1VzxMH25djnPfzpYbTKo
	 rIA2f80sjGoSR+jvnVz8jOfRwE4OKe8sf2Hmxr7VDxDwzVfa4XlJCy7tTTYaX3bq+p
	 P1swmZiO722sA7y3TDtB/c//dZgEi5ZQe/9/EgvMwvPwkWs+nhm5w1R3D90Xj/FaqA
	 IZMUTPgWQ3nttLXisMxRt37mxKeefaIzWu/mEj54w/9Fg1GqjwJX6NK3vngXzyPGyL
	 YwXqnyt+8WyXpxudVp1Op/wldGprUp2aJPdZWn5CJaQZLQFhYM5kSRmUOu19NHL3Os
	 h6UyjsQmEe3sA==
From: Pratyush Yadav <pratyush@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Guenter Roeck <linux@roeck-us.net>,  Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>,  Alexander Usyskin
 <alexander.usyskin@intel.com>,  Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: Linux 6.16-rc1
In-Reply-To: <CAHk-=whDM950+cCgmNH2edB2edCaktdpvBLGjFESAZfYZ3ZpRQ@mail.gmail.com>
References: <CAHk-=wiiqYoM_Qdr3L15BqJUyRi6JjR02HSovwwz+BXy7DdVeA@mail.gmail.com>
	<241b0829-5fec-4d88-866a-ba59e2ca748e@roeck-us.net>
	<CAHk-=whDM950+cCgmNH2edB2edCaktdpvBLGjFESAZfYZ3ZpRQ@mail.gmail.com>
Date: Sat, 21 Jun 2025 14:44:32 +0200
Message-ID: <mafs08qlluuvj.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Linus,

On Fri, Jun 20 2025, Linus Torvalds wrote:

> On Tue, 10 Jun 2025 at 18:25, Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> The test failures are all due to commit 0aa7b390fc40 ("mtd: core: always
>> create master device") which breaks mtd partitioning.
>
> Ok, I just merged the pull request that reverted that one.
>
>> One side note: Various qemu machines configured to use Macronix flash chips
>> are no longer able to access the chips. This is primarily due to commit
>> 947c86e481a0 ("mtd: spi-nor: macronix: Drop the redundant flash info
>> fields"). After that change, SFDP support for affected chips is mandatory,
>> and qemu does not or not correctly support that. This affects quanta-gsj,
>> kudo-bmc, ast2600-evb, and supermicro-x11spi-bmc machines (and possibly
>> others).
>
> .. but this issue presumably remains, unless there's been some subtler
> indirect fix that I didn't realize.
>
> Miguel, that one came through you too. Comments? I do think that
> running things in qemu is likely important for a lot of these things
> that don't actually have a ton of hardware that is easily automated...

There isn't a fix AFAIK. From the thread [0], there seemed to be a
conclusion that it was a qemu problem and not directly a problem on the
driver side. So I dropped this down my list of priorities of things to
look into.

I don't have much idea of how people use qemu for testing, but since you
say this is important for testing workloads, I can take a deeper dive
next week and have an answer by -rc4.

[0] https://lore.kernel.org/linux-mtd/8d4bd876-3571-46e5-857a-948e58b21c5b@roeck-us.net/

-- 
Regards,
Pratyush Yadav
