Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59362211A0B
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 01:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743989583; cv=none; b=OF/MnqQiHPJXMfozulE2PXz1nljOzhxv3ZrXj/3twcC29Y6uF8e3KnBqiiEwCMunP9L/N2fjEGifB14xYPJoZjuuWa0Jx2ZLHV2klFqfyh+e4G5Rx4EcggYXCxx1BLNKY/+mLcPWoX2E519gN9S3up7Rizh+WffNq9Ce9D/USx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743989583; c=relaxed/simple;
	bh=x745bKwj3AYvTCP02GKp728B0sAv1EcHX7lRGBJVxK4=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=gF70395jVFxE8wNslx8dus6tVUnkrertcwACk2znEwu3ht07UFcTokw2ioVouxtXt195FZp0V/XwYBlGNcjrbuRX6Xi6BwujPIp55gn3eGvPkONhZ9DyTiFdkFnOJzIg0jWzGdNi+UBqJHA/gWT9kB6jGd/hWbe4iJ6jFBe6EL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C6r+7chV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C6r+7chV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7E68C4CEE3;
	Mon,  7 Apr 2025 01:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743989582;
	bh=x745bKwj3AYvTCP02GKp728B0sAv1EcHX7lRGBJVxK4=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=C6r+7chVGj9OYrPguNeBRIjRtXNfptHIh+owhEmjKSmulm+UohqDl/88xbed0zPCl
	 +vtXKoJxAqvhK5nWOiD3P2G2AyKhDF0NA/mNslenUsWZB36/FJsAJRwbUo09WzDE8E
	 KbcVaEw7FkL97GUrovkMTTGADCFNyirylQwbia6ZjmvcC7VaCG9XaqP+t/TOnaU8FQ
	 1M/A8Lzhk5vZiw5wLkewnIWC/4LOob+3C60r4R1SJcJleIm73vTm1Cq+wLnsjgq/c9
	 66gmmnjwt4AGTytjv8tvGNt31Y3sD0SmJqGgUc1wu2/ZFnoDWWqNLihj7hbMNK9t8S
	 kaeagplLyYgNA==
Date: Sun, 06 Apr 2025 18:32:58 -0700
From: Kees Cook <kees@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
CC: linux-kernel@vger.kernel.org, Andrey Konovalov <andreyknvl@gmail.com>,
 Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Nathan Chancellor <nathan@kernel.org>, Peter Collingbourne <pcc@google.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, Will Deacon <will@kernel.org>
Subject: Re: [GIT PULL] string fixes for v6.15-rc1
User-Agent: K-9 Mail for Android
In-Reply-To: <CAHk-=whVfxi4KRu-H=tsgSdoGdDz1bvu0_miJT0BTgAf4igpdg@mail.gmail.com>
References: <202504061053.F27227CA@keescook> <CAHk-=whVfxi4KRu-H=tsgSdoGdDz1bvu0_miJT0BTgAf4igpdg@mail.gmail.com>
Message-ID: <FFE5FB0B-CC92-4A25-8014-E7548AD1C469@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On April 6, 2025 12:04:04 PM PDT, Linus Torvalds <torvalds@linux-foundatio=
n=2Eorg> wrote:
>On Sun, 6 Apr 2025 at 10:54, Kees Cook <kees@kernel=2Eorg> wrote:
>>
>> - Add wcslen() to support more Clang libcalls (Nathan Chancellor)
>
>Oh Christ=2E
>
>Does clang not know how expensive function calls can be?
>
>I really think the right fix here would have been to say "don't do
>that", rather than make that function available=2E

I should have said "libcall optimizations"=2E It's not just blindly constr=
ucting calls=2E This is the same kind of thing that has been heavily discus=
sed before for bcmp() and stpcpy()=2E The resolution from those threads was=
 to add the symbol, as the least of many bad options:
https://lore=2Ekernel=2Eorg/all/CAK7LNAQHj-GeqH_5WpKo7gA6qZAiX8OOxxnL1v-SN=
ZwRHFSXQQ@mail=2Egmail=2Ecom/


--=20
Kees Cook
