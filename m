Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D552B126BF1;
	Thu,  1 May 2025 23:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746142729; cv=none; b=BBunp8O2/A7lDx3KTsa8/XvUWaKha7vBkellXyqDzW7T2eVHXvo/EoiygdIgif9Sex5CK87lIc8WRq36MPqsR+SzbACekMDg2+qIIlUBabJQHppQokwbYu5ZtSFNk0JkaYbV8E4SXSnGv7Kof8SPzoh2RWnJIQrvBL58Xk7PptU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746142729; c=relaxed/simple;
	bh=x4NIPcW2t8+Po2GtxjiAe77L6lbRw7MsrE1vNe8TtY0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jb6t6jIVCsUu83nRgJ+dJlsBHH3HLGbRZudV4UJgKIH9AgjXvYluBlfQZWzvAazkQpeWa47i1hK6eZ7trd4GCUPPxhT+5JCUQSNDBEx8vYgkVrCNSbnqs6cgy43zc9+6axvG2Cl0q+PLax1TRWvPtJ8koYiQCJYP53z2k/bJc9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AFKWetlW; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AFKWetlW"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-39ee682e0ddso827081f8f.1;
        Thu, 01 May 2025 16:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746142726; x=1746747526; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BgTw89Bn8iJJMWWcnciPTntefLN6JrxJBEGd602vq3k=;
        b=AFKWetlW8h2tQUR1vgG1fKCmW6RXMLsL8ezeUSdAhiPsyOF7hizQNUY3rh0ocCStR+
         pE82iYHQICCLKuqT8J3zvCQUxI5CbtLKjf3SMYXZDWeYQoeMzyT504ZUsrqlTSXNLVIA
         R1+JyubhcQeJta1feq0Ouba9Vk+w24ZAhN//F6L8bmEwhCByhPc+vscMRBNbiZJWpcHp
         Yd+aM4KlgfcI4f0hpDOwx1SC1C5G19T1cBbZB9mdnt3V99A3ZW/QVbPHRuXdxjBt2jdX
         UVz245BSeu5rhG5IwmpmhMuh5PuuikbsFKckceW8nLxhxtFT8miCzQq6uCMbRPGUezbT
         R8gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746142726; x=1746747526;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BgTw89Bn8iJJMWWcnciPTntefLN6JrxJBEGd602vq3k=;
        b=lwD/dld7V/5Ke/LI4TBclaxJKx9d7DvZP05nBr/IAgswGGaue4YRgsSA/dX8PkXMAc
         y43g1ECsp9s4MmmXNh98VKHjo3Nm/ljoG4C6JIzUCVMyrOhEoSxCiYwretju2u1ElxWn
         O3jcKdrSG+gy1wMfjZ2SC2yQvcw5r2Tr73Jkox5GEGnCLnAje5O9jALw4IpLpfeBgG6V
         NwfAAwLe5hTZ/vkVFY4R7chWi+hMBDSq95yu6D1O+QRDYmt9PQk41tV4FFqQX6nUthNN
         49jAtPBi1MA26Q+Y9YanyT4GJOjEwoGGv9OyHu9fWAfCn9MRDlw5NncTssMjeaD6nxBe
         H7kA==
X-Forwarded-Encrypted: i=1; AJvYcCUy3YF2jNC+49jLqNF7SUrg/iM0soOVuTTPTTXejASiBgX5Lk2hG5LNNb3OIJdMKa2QjE4lEtXGZQO5yzgi26k=@vger.kernel.org, AJvYcCXTF4OChWfXK0HRhE6y6o54tayQ2Xi/AsazH6JqwBphrikKgJ1NrS0dT2/tYf1O03fClQt8LgOsnkqxwhU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPnE1JX5OlDS+PF4GJ8BkxCQSHhvrsJfxljjo2XKyP4rVFBwFR
	oKq1DNc5Av12iSFfeh6TPZFtkLfHmrOWoAigk87WkW0syu2MN6J8
X-Gm-Gg: ASbGncvV2/ZMxjqSUogT6hWgv2kwsM3aXDdKHpjvBG4lL3k9jvI+uF62M3e8Qu6V5lJ
	StNebueAdp+cmTHenruEXV3crJtmlrGBa0XZrVQl5oP8yuk1PZGDHE6D5azoxlVj00yARgH4sL8
	ZvFkWLPY38rygDvzZLj7m/dxppFU4ViyY+7UHpbfbPaozlX37XrIZC1Z7ivEcEKThZpJS5oizSh
	KiDsspPN63rmDixx/NlH+3bqqlf5dJJK0SKSMdsq+uz1vQ4z6+mYhtUkGe620UdGSTy7ARgkXIv
	gv7WBvFgU0PUvQvq80bMrEIrdNmgGDogvFyzVmKEdgZ+Sylq8zEswSBWqmuMdPGT
X-Google-Smtp-Source: AGHT+IGGLKRWLKqNHsCAhWo8MFEupNx7xPLyU3TVmOnryIbKhbOKnvbipwShUUdf44Pi9DvOCz147Q==
X-Received: by 2002:a05:6000:2cf:b0:390:fbcf:56be with SMTP id ffacd0b85a97d-3a099a8597emr338736f8f.0.1746142725929;
        Thu, 01 May 2025 16:38:45 -0700 (PDT)
Received: from ?IPV6:2001:871:22a:99c5::1ad1? ([2001:871:22a:99c5::1ad1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae0ce2sm525797f8f.16.2025.05.01.16.38.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 16:38:45 -0700 (PDT)
Message-ID: <d770162d-a271-48da-82f5-a2e38ae03c57@gmail.com>
Date: Fri, 2 May 2025 01:38:43 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] rust: time: Avoid 64-bit integer division
To: Boqun Feng <boqun.feng@gmail.com>, Arnd Bergmann <arnd@arndb.de>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andreas Hindborg <a.hindborg@samsung.com>,
 Frederic Weisbecker <frederic@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Anna-Maria Gleixner <anna-maria@linutronix.de>,
 John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Russell King <linux@armlinux.org.uk>
References: <20250501015818.226376-1-fujita.tomonori@gmail.com>
 <aBNojspyH5dHsuOm@Mac.home>
 <20250501.220717.849589327730222635.fujita.tomonori@gmail.com>
 <aBNzIp9UF7GZVYLs@Mac.home> <aBN1BzCawU0a9Nx9@Mac.home>
 <cbbeca76-7a7a-425b-9cdd-8da778b6d8a1@app.fastmail.com>
 <aBP9yvWnB66qJeRh@Mac.home>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <aBP9yvWnB66qJeRh@Mac.home>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.05.25 1:03 AM, Boqun Feng wrote:
> On Thu, May 01, 2025 at 05:11:44PM +0200, Arnd Bergmann wrote:
>> On Thu, May 1, 2025, at 15:20, Boqun Feng wrote:
>>> On Thu, May 01, 2025 at 06:12:02AM -0700, Boqun Feng wrote:
>>>> On Thu, May 01, 2025 at 10:07:17PM +0900, FUJITA Tomonori wrote:
>>>>> On Thu, 1 May 2025 05:26:54 -0700
>>>>> Boqun Feng <boqun.feng@gmail.com> wrote:
>>>>>
>>>>>> On Thu, May 01, 2025 at 10:58:18AM +0900, FUJITA Tomonori wrote:
>>>>>>> Avoid 64-bit integer division that 32-bit architectures don't
>>>>>>> implement generally. This uses ktime_to_ms() and ktime_to_us()
>>>>>>> instead.
>>>>>>>
>>>>>>> The timer abstraction needs i64 / u32 division so C's div_s64() can be
>>>>>>> used but ktime_to_ms() and ktime_to_us() provide a simpler solution
>>>>>>> for this timer abstraction problem. On some architectures, there is
>>>>>>> room to optimize the implementation of them, but such optimization can
>>>>>>> be done if and when it becomes necessary.
>>>>>>>
>>>>>>
>>>>>> Nacked-by: Boqun Feng <boqun.feng@gmail.com>
>>>>>>
>>>>>> As I said a few times, we should rely on compiler's optimization when
>>>>>> available, i.e. it's a problem that ARM compiler doesn't have this
>>>>>> optimization, don't punish other architecture of no reason.
>>
>> What is Arm specific here? I'm not aware of the compiler doing anything
> 
> Because Arm is the only 32bit architecture that selects CONFIG_HAVE_RUST
> for non-UML cases, i.e. this is the only 32bit architecture that has
> this problem. If your point is we should do this for all 32bit
> architectures, then I won't disagree. Just s/CONFIG_ARM/CONFIG_32BIT
> then.

I would be for using `CONFIG_32BIT` since from what I understand this
applies to all 32bit architectures. It feels a bit weird to single out
arm just because it is the only one that currently has rust support.

Cheers
Christian

> 
> Regards,
> Boqun
> 
>> different from the other 32-bit architectures, though most are missing
>> an optimized __arch_xprod_64() and fall back to slightly worse code
>> from the asm-generic version.
>>
>>> Copy-paste errors:
>>>
>>> 	    unsafe { bindings::ktime_to_ms(ns) }
>>>
>>>> 	}
>>>>
>>>> 	#[cfg(not(CONFIG_ARM))]
>>>> 	fn ns_to_ms(ns: i64) -> i64 {
>>>> 	    self.as_nanos() / NSEC_PER_MSEC
>>>
>>> 	    ns / NSEC_PER_MSEC
>>
>> I'm sure this is still broken on all 32-bit targets.
>>
>>      Arnd

