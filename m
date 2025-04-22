Received: from plesk.hostmyservers.fr (plesk.hostmyservers.fr [45.145.164.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0DBD1F4CA0;
	Tue, 22 Apr 2025 14:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.145.164.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745332737; cv=none; b=dgm/ncH/2RaRlJWnVU7GBNun9V2HIzkxEk7aYZYACxY2TbzVjpxw1kZX0mg1cFUuHbHGfAP4Wb8INixIUU0xoTdR1czum3WUalK8BPIdBqCVG4MNwPk5M0E0SSlf0GyP3r8vZVUJxpVdJmEJVF70JPMaYqS8QKF+ImFRcPuXSVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745332737; c=relaxed/simple;
	bh=HLx87QPNTuMaTQeym4RmvxQInJnjnlheBrR3J9NHh00=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GLas9MVv357hUUz85gL28ZSzcOyh49lyExiTAcN5PxGLygQKsQIwUEPQg84r4IUtiAHV5coRnMQPJyHtq1F2vgcCWZfY4SBzfYYhkt3/tp/j8hdNypGsV+3UuLpNLCo/zdMFulF4XmwSVtvkRflWzzMFXPwjMcP1j7LHQkA8RxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arnaud-lcm.com; spf=pass smtp.mailfrom=arnaud-lcm.com; arc=none smtp.client-ip=45.145.164.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arnaud-lcm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arnaud-lcm.com
Received: from [IPV6:2a01:e0a:3e8:c0d0:c864:fba8:3048:a3c2] (unknown [IPv6:2a01:e0a:3e8:c0d0:c864:fba8:3048:a3c2])
	by plesk.hostmyservers.fr (Postfix) with ESMTPSA id 8077854ED0;
	Tue, 22 Apr 2025 14:38:53 +0000 (UTC)
Authentication-Results: Plesk;
        spf=pass (sender IP is 2a01:e0a:3e8:c0d0:c864:fba8:3048:a3c2) smtp.mailfrom=contact@arnaud-lcm.com smtp.helo=[IPV6:2a01:e0a:3e8:c0d0:c864:fba8:3048:a3c2]
Received-SPF: pass (Plesk: connection is authenticated)
Message-ID: <d2087f2e-7362-493b-ae23-546cd7789f6b@arnaud-lcm.com>
Date: Tue, 22 Apr 2025 16:38:53 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] checkpatch.pl: Add warning for // comments on
 private Rust items
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
 Dwaipayan Ray <dwaipayanray1@gmail.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 llvm@lists.linux.dev, skhan@linuxfoundation.org
References: <20250422125633.30413-1-contact@arnaud-lcm.com>
 <CANiq72mo+DSyFZ3gVWVhqH5LHa0hkJ6gyTN70=smhRYzpNMYWA@mail.gmail.com>
Content-Language: en-US
From: Arnaud Lecomte <contact@arnaud-lcm.com>
In-Reply-To: 
 <CANiq72mo+DSyFZ3gVWVhqH5LHa0hkJ6gyTN70=smhRYzpNMYWA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <174533273413.15210.7584426659504595655@Plesk>
X-PPP-Vhost: arnaud-lcm.com


On 22/04/2025 16:10, Miguel Ojeda wrote:
> On Tue, Apr 22, 2025 at 2:56 PM Arnaud Lecomte <contact@arnaud-lcm.com> wrote:
>> Background
>> ----------
>>
>> The Rust-for-Linux project currently lacks enforcement of documentation for private Rust items,
>> as highlighted in https://github.com/Rust-for-Linux/linux/issues/1157.
>> While rustc already lints missing documentation for public items, private items remain unchecked.
>> This patch series aims to close that gap by ensuring proper documentation practices
>> for private Rust items in the kernel.
> I think this background wasn't changed from the previous version --
> you can include a changelog in the cover letter too (some do that
> only, instead of per-patch), which may help to mention what changed in
> the cover letter itself, if any, since this is a good and long cover
> letter :)
>
> By the way, some of this cover letter (the "Results" section in
> particular with the examples) could be nice as part of the commit
> message on the first commit -- that will make it forever part of the
> Git repository, which can be useful to understand the commit itself
> and why you designed the heuristics like you did.
>
> Thanks!
>
> Cheers,
> Miguel

Definitely make sense to be part of the commit message for the first 
patch, thanks !

Arnaud

