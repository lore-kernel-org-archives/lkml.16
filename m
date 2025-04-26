Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC7B24EF91;
	Sat, 26 Apr 2025 13:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745675841; cv=none; b=pCAUVP6I3irCzCkPCmPFUZnmwOapARQXsnTYbc11Oh3rEYY1HGxzz78ttQkL/p33q9pAeLjn/C0DwqwbPo74ujJzeWm9C9dUqK+2UygpDh1x8svo9nBa11YsoVcsEwsF1GQRHsIKgBOgeYg4eM8+fZPxWX0FdbL7qYfmgV3fOfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745675841; c=relaxed/simple;
	bh=vRjpAIvEqTCQN92YZya7r0Mf0krmSGuIyAoRbu0NHYo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M1sOquQExJqh0s4sIf+FkLUMH2ptlwtLCkMQVOG1j8796WCsPccjwtEVAwYUO93SlPiPw0f5k/uroUi3zzCRkkfkzKXzgnBXdZ9qzxXwOcuxd3HlobEgj1iCHWtSE/KZJ6rl35NQdbH322t8xN6lk4DtQ1aROVfWZJ2dpwemUFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GZiSqer9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GZiSqer9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A559C4CEE2;
	Sat, 26 Apr 2025 13:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745675839;
	bh=vRjpAIvEqTCQN92YZya7r0Mf0krmSGuIyAoRbu0NHYo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GZiSqer9yQCa+ajBXiohkfrKWZ1NgGJqHfkJ1n0KClyBJoR9EzesRq76nkbyGSN8A
	 ZEWKLaS9KblbUSKjr4FiP7Qd5LFHkCKzLYhbT3VSU+bx12Um6HN/XoWmibKO62fUK8
	 XHouX9RatwJNqjf1Wyt9eWoWm9XyaUuG46ce0aGNI801boMfEcmzaDQbE9RfWp5+M7
	 JYXjaOLPYraCqNuGkHb7yUEiGIPxiGnwtgZYrRSYJtB806SRWNqdUNCLMIonD7poGn
	 6VDIf910hFnbw6cHWubaS31R0lmKLUAhSs2x26mp2Yk4C9wWf+KBQopN4XX1WIshNV
	 seIUobzkkPbTg==
Message-ID: <12166789-6c01-4c9d-b293-6fc5a4530971@kernel.org>
Date: Sat, 26 Apr 2025 23:57:15 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/nolibc: Add m68k support
To: Daniel Palmer <daniel@0x0f.com>
Cc: Willy Tarreau <w@1wt.eu>, linux@weissschuh.net,
 linux-m68k@vger.kernel.org, geert@linux-m68k.org,
 linux-kernel@vger.kernel.org
References: <20250426041212.4141152-1-daniel@0x0f.com>
 <20250426051423.GA8239@1wt.eu>
 <CAFr9PXkU3W6DdYKhHz13K7bk9bnik67R85wqYUwHeROKEx59zA@mail.gmail.com>
 <7bc208b3-5d28-4f25-8a59-c17f3ffa1907@kernel.org>
 <CAFr9PXk5ycoZYce1eBOUBvnP_m7swPLT-giHDQSXaa4ywe7mZg@mail.gmail.com>
Content-Language: en-US
From: Greg Ungerer <gerg@kernel.org>
In-Reply-To: <CAFr9PXk5ycoZYce1eBOUBvnP_m7swPLT-giHDQSXaa4ywe7mZg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Daniel,

On 26/4/25 23:06, Daniel Palmer wrote:
> Hi Greg,
> 
> On Sat, 26 Apr 2025 at 21:38, Greg Ungerer <gerg@kernel.org> wrote:
>>> I need to test actually building and running something for nommu but I
>>> will do that later today.
>>> Making nommu test automatically might be a bit difficult though as I
>>> think it only really works with some changes I have to linux and QEMU.
>>
>> It works out-of-the-box for m68k qemu and a mainline kernel configured
>> for m5208evb_defconfig - when using the qemu "mcf5208evb" machine.
>> That is a nommu m68k/coldfire variant.
> 
> Ok, I didn't realise there was any working nommu machine in mainline QEMU.
> Does direct kernel booting with a ramdisk work there? The tests for
> nolibc require that.
> Either way, I'll it out tomorrow.

Direct kernel booting with builtin root init ramfs works.
The defconfing is not configured that way, but I always run it
with CONFIG_INITRAMFS_SOUCRE set to a suitable rootfs.

Regards
Greg


