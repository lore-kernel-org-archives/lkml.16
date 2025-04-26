Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C0823BE;
	Sat, 26 Apr 2025 12:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745671081; cv=none; b=hGuGRb7LViBBJQLge2zcfgb+8hUeCsZLo6c0SyudyV1jOdjj8N2XDrs+YQ+6Q6XntdYdyCmIwNE7PFxVXv2a5DNMUzfzPnGVVxz7HlIxGoqRxqPuXYGRTZhNghGInqupr6ErP9yCcPcWmKJp4D2gKDN1xNthA4gBcT5E7+HbIPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745671081; c=relaxed/simple;
	bh=iVm0TgSUq1X8824i7H5Q1jPfT2hTMoopWW3MVt+gxGY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Puv8IfC/Bh5HXuBBwqiFokeqrTOeaiiM5NfE77m6ZvjPqfol40pD+RRlPUZKSWUgsMNaXnG956h5p6TeXMrsIL65qCkUwU5Ap8ufakvNR0jeS8hMFsf3Gd06Op4OQPlV/fJGBSz8IQJG1quR/SsMpzf/Dk/8krjn7uCV4f7TZ04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KCg5U5Kh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KCg5U5Kh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74FC4C4CEE2;
	Sat, 26 Apr 2025 12:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745671080;
	bh=iVm0TgSUq1X8824i7H5Q1jPfT2hTMoopWW3MVt+gxGY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KCg5U5Kh6ytIvx9abvrcD2HVSNWglQs1xGcBJjPHx0QiYqzuk0R4yiDRPmKgaUkFV
	 /iB85Th2hjKMYUpkii6KI6RkRzju0yMnzAqpv/deXHfvoJPh+J+tybP3tgWM7Wqszt
	 Ce2BkM2R7oiPTvF/Uw/Kqg89+HXpC4KroTQjjSYNo8vs0yxWYa4wmpuVAoDJa+CJCK
	 FsU3EaKme/AVePY7c32+FUgK3/7WR7VF1REmllzqekAJzjQUdAGn7Q4QgSBsq9FhZG
	 l6s15Mbmw4R46HRUOUxm93dYSeSMwvOuDSXtdZfnvLcLbfS/rA1S4gNg/YrgdLDFaV
	 UNg4Lq0sV8A1Q==
Message-ID: <7bc208b3-5d28-4f25-8a59-c17f3ffa1907@kernel.org>
Date: Sat, 26 Apr 2025 22:37:56 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/nolibc: Add m68k support
To: Daniel Palmer <daniel@0x0f.com>, Willy Tarreau <w@1wt.eu>
Cc: linux@weissschuh.net, linux-m68k@vger.kernel.org, geert@linux-m68k.org,
 linux-kernel@vger.kernel.org
References: <20250426041212.4141152-1-daniel@0x0f.com>
 <20250426051423.GA8239@1wt.eu>
 <CAFr9PXkU3W6DdYKhHz13K7bk9bnik67R85wqYUwHeROKEx59zA@mail.gmail.com>
Content-Language: en-US
From: Greg Ungerer <gerg@kernel.org>
In-Reply-To: <CAFr9PXkU3W6DdYKhHz13K7bk9bnik67R85wqYUwHeROKEx59zA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Daniel,

On 26/4/25 16:16, Daniel Palmer wrote:
> Hi Willy,
> 
> On Sat, 26 Apr 2025 at 14:14, Willy Tarreau <w@1wt.eu> wrote:
>> Nice, thank you! Could you please also add support for it to
>> tools/testing/selftests/nolibc/ and verify that it works ?
> 
> Sure, doing that now. For now it'll be using the mmu enabled m68k virt
> machine that QEMU supports out of the box.
> 
>> changes. You may possible have to add a few ifndef, as I don't
>> think we've ever had a nommu platform yet. If you face too many
>> failures or just difficulties, please let us know so that we can
>> figure together a suitable solution.
> 
> I need to test actually building and running something for nommu but I
> will do that later today.
> Making nommu test automatically might be a bit difficult though as I
> think it only really works with some changes I have to linux and QEMU.

It works out-of-the-box for m68k qemu and a mainline kernel configured
for m5208evb_defconfig - when using the qemu "mcf5208evb" machine.
That is a nommu m68k/coldfire variant.

Regards
Greg


