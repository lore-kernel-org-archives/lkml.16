Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94E3250F8
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 16:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739118002; cv=none; b=tkl4hnqglVgkV8cRsJ3lLfyhN3bp/weDwmFtRTVL9TysMh6VC41GVibqIaCwqSQNu9cMN9XC6mCjKNbBMC9udvZRkPF9izuqZKm9hby+TIcDKgjopyZSR1WOHoOElh5dMOq4b1CIMf53yzytAj6SGdnZ2vC4/CNSmkVGffdILrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739118002; c=relaxed/simple;
	bh=ifjluPUakW+96MCIWqdQbZnHzkmiYmc/U3OkyX77Pig=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ocI7xlqnFAogdXXT+Pq+pd6bKyT+ztkdyAxXlIIEqq3Qi7b7llKlLOXYXjm9jckzR71E5mHs/d5FwvLJO5N9Y8TSK9hbvcmrWYUevMkLD/091ypA68U0002j/aFmliGkEzTCTPZMT/Ombg5waV70OnP0ZVCEoaLfFOXm+Bfaeqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=vt.edu; spf=pass smtp.mailfrom=vt.edu; dkim=pass (2048-bit key) header.d=vt-edu.20230601.gappssmtp.com header.i=@vt-edu.20230601.gappssmtp.com header.b=aVzU7phe; arc=none smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=vt.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vt.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vt-edu.20230601.gappssmtp.com header.i=@vt-edu.20230601.gappssmtp.com header.b="aVzU7phe"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-5fc6cd89f85so621717eaf.1
        for <linux-kernel@vger.kernel.org>; Sun, 09 Feb 2025 08:20:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vt-edu.20230601.gappssmtp.com; s=20230601; t=1739118000; x=1739722800; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dvvEwD0sTJthbBM/YD3kaZ7WUn0gz8E22WCyOMue1ik=;
        b=aVzU7phe5+RUJ/hTfJ3ySTYJsuFeGRHkyMWoZJwu87Z0OftpUSSEBLRVsBxXL9B0IX
         V5/FP3zxl91q3UvRFDGHBKNpkR6dHSrihWy8LEEy/DNz/mG5ETuzzM12SL//hft/86Y4
         U0ybgus6GCg9DsDCSAEAz55bIbqcLPlfeHj6NnCR68XKoZRFOsa/KuJBgFfddRzTWsGK
         /9pCzyur8y6tpeNFrAKhbg+KKOBXQSpAudMLf/AIGfklHzRkQEacuQLD3mkljXIe6c7S
         Bal0+qYMQyGKA710yefC0irdq4AVRY+6lrtLYrIt6PtaU01ngjyKCw1EmDQWOtLsD0u2
         kkRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739118000; x=1739722800;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dvvEwD0sTJthbBM/YD3kaZ7WUn0gz8E22WCyOMue1ik=;
        b=C70KA94h4lZ1FC7AxT8suR7fnMVqw5ItK9QLtZORZIowKbm3OJT+JgKm3eAhGR+hB3
         ZSCjYfl/jZuMRT1vXHwSaoAvRQmkn0uXzVXT+MmRd2zStN7uey2JhsfBr8Ds40xnY9nf
         E+BShD75PH40rYx/NW4I1UJgfCYcdZoSuTvc5BuFu+GY2qShc8NwH3XDHivnxQ+upTNF
         QBgaUp8tIf7a0/Z9tj3njtWoJgoHl+ozQE9C4qAlLCQMIP3W6pdub61zkSs10upiE+G/
         irquzoIsrV0PW3u9SBJEg3cWlypxPKAvJan6ZY5fNH/6LQOdzevsvCwPEP4gQqimFL7b
         05pA==
X-Forwarded-Encrypted: i=1; AJvYcCXWtCCeqVmM/D0JkyMRT9pisxg6eKny5TtIQ3gq+W88e3KGIKPqlHy0WyaAj3F0gqG1RvOMaSXOQc+ol7Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzdo6gGUO41nA0oGS/qyxQ5kzQtQb1zT7pdTUbfzt7V0SSebmEz
	PEplKVmg9j4ShPj4vEzYNoHMnw7DcI4Dhdq89OQYL+XYEWWNy2nSahr4nGV9wfg=
X-Gm-Gg: ASbGncu34onGrWqdhEnfoBeI7bGa/PTeKCBDQq/Tt8TQ0CN5u49VK9PbPWt538K9o+j
	Eyi9CRPJbbULq1TWab4I3DehoyaDP5IvqAp6NUbvAHgB2U8iDpA+rpA8aB60jF6+2umR++NZlGK
	0Pp+6LsWod3t+sVnGGO0cc3mCGPDt+BWOMUpyd6BHykYIYO7HTAalKT7h43b5u/3cjjwFY+CLZD
	PUAsF8fA/0aeWBzWgGZeaAbmw1fnBSwHE1h+q7dEbpKtLJufPwUXvKLSWRYFeypPrGQqFfKnI/b
	Gl/E0dI/hsNTaqn4LT1UqmbBYzqWsY/q55+hCdWY7MxKM/E4ijs/qpy6IQ==
X-Google-Smtp-Source: AGHT+IEPbHpU34hW2fuOTfUZssneFgJQCeacANatw+//XNFvaeoOL3OjufV8AgclHjY9ynCZqH1OUA==
X-Received: by 2002:a05:6820:134f:b0:5f6:e60a:776f with SMTP id 006d021491bc7-5fc5e5ff7e9mr7297600eaf.1.1739117999599;
        Sun, 09 Feb 2025 08:19:59 -0800 (PST)
Received: from ?IPV6:2603:8080:7400:36da:dff5:4180:2562:4c1e? ([2603:8080:7400:36da:dff5:4180:2562:4c1e])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5fc6f2764e7sm801647eaf.17.2025.02.09.08.19.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Feb 2025 08:19:58 -0800 (PST)
Message-ID: <42efddde-9fe0-4984-a903-c89328a726b6@vt.edu>
Date: Sun, 9 Feb 2025 10:19:56 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] rust: add dma coherent allocator abstraction.
To: David Airlie <airlied@redhat.com>,
 "carlos.bilbao@kernel.org" <carlos.bilbao@kernel.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Christoph Hellwig <hch@lst.de>, Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 daniel.almeida@collabora.com, aliceryhl@google.com, robin.murphy@arm.com,
 rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Valentin Obst <kernel@valentinobst.de>,
 open list <linux-kernel@vger.kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 "open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>,
 Greg KH <gregkh@linuxfoundation.org>
References: <20250108122825.136021-1-abdiel.janulgue@gmail.com>
 <20250108122825.136021-3-abdiel.janulgue@gmail.com>
 <20250108135951.GA18074@lst.de>
 <CANiq72=R2N+QiCiHZQu-6YJ9aYpn_bik3BW3U=nAW3jL7unzLw@mail.gmail.com>
 <1894f095-e93a-4def-a223-d5c089ecc2df@vt.edu>
 <CAMwc25p1kGHjy7z19Kg+vv7yVc0bF2taA08hBKhk72e4HiK5xA@mail.gmail.com>
Content-Language: en-US
From: Carlos Bilbao <bilbao@vt.edu>
In-Reply-To: <CAMwc25p1kGHjy7z19Kg+vv7yVc0bF2taA08hBKhk72e4HiK5xA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello David,

On 2/9/25 00:44, David Airlie wrote:
> On Sun, Feb 9, 2025 at 9:55 AM Carlos Bilbao <bilbao@vt.edu> wrote:
>>
>> Hello,
>>
>> On 1/8/25 09:16, Miguel Ojeda wrote:
>>> On Wed, Jan 8, 2025 at 3:00 PM Christoph Hellwig <hch@lst.de> wrote:
>>>>
>>>> No rust code in kernel/dma, please.
>>>
>>> What do you suggest?
>>
>> This is it. What do people suggest? This thread has received a lot of
>> attention -- maybe it's an opportunity for the community to brainstorm.
>> Here's an idea:
>>
>> Some maintainers clearly hate wrappers/bindings to Rust, while others don't
>> mind as long as the R4L folks commit to the maintenance duties. Depending on
>> the subsystem, it will be a completely different conversation. It seems to
>> me that right now, every time the R4L folks interact with a new subsystem,
>> they need to understand the maintainer's stance. That looks like an
>> exhausting process.
>>
> 
> That is the process we are committed to, everyone has a voice and gets
> to be heard, and we move forward in the appropriate manner with each
> maintainer. Bypassing maintainers is the last resort, not engaging at
> all with maintainers isn't a productive way forward either. Your below
> attempt is trying to create a technical solution to a social problem.
> 
>> Would it make sense to have a C middleman that Rust calls instead of
>> binding directly to the C funcs? This dispatcher would provide a simpler,
>> stable API with fixed function signatures, even if the C functions change.
>> If a C func is removed/changed, only the C dispatcher would need to be
>> adapted, but until that happens, a new error could be returned to the Rust
>> side (not ideal, but Rust doesn't just break).
>>
>> This would obviously impose some limitations on the Rust side, but it might
>> be less conflictive than direct bindings. Also, in Abdiel's case here (for
>> example), he'd explicitly take on the maintenance of the Rust abstraction
>> and its DMA dispatchers, leaving no ambiguity about ownership.
>>
> 
> This just adds overheads for everyone to little advantage for the
> cases where maintainers are fine with all the other approaches.

I'm not sure there's a need to worry about overhead in this hypothetical
case if the dispatcher is merely a translator and doesn't validate inputs,
copy buffers, or such. It would be less than calling from userspace.

What I meant to say (I wasn't clear before) was for this solution to apply
to cases where maintainers are firmly against all alternatives. Obviously,
if all the parties involved are happy, direct bindings are preferable.


> 
> Also the bindings code in rust is usually pretty trivial to change,
> it's not like you can really abstract things that far, changing APIs
> is hard no matter what, understanding the nuances in every C driver
> can takes months of work adding rust bindings to your changes is
> rarely going to be the limiting factor. We have learned over the years
> to not make API changes that are subtle or hidden, and can leave out
> of tree or in development users broken in subtle ways and as long as
> we keep making API changes like that, updating the rust code is the
> least of anyone's worries. This isn't like having to learn Mandarin vs
> English, it's code written with a different syntax, it's not even
> perl.

I'm not sure there's a need to worry about overhead in this hypothetical
case if the dispatcher is merely a translator and doesn't validate inputs,
copy buffers, or such. It would be less than calling from userspace.

What I meant to say (and wasn't clear before) is that this solution could
apply to cases where maintainers are firmly against all better
alternatives. Of course, if all the parties involved are happy with direct
bindings, that's preferable. But as you said, this is a social problem, so
maybe it's not a one-size-fits-all solution.

I agree that in some cases, abstracting the API could be complicated, but
I’d focus on keeping it simple and providing Rust with the minimum subset
it needs to keep things moving forward. Abdiel's PR is a good example --
by keeping the functions in his CoherentAllocation, we keep that option,
but lose the granularity of DMA mapping attributes (which would be some
default in the C dispatcher).

I agree that making subtle API changes is risky, and it would def. be
something to keep an eye on.

And yes, with this approach, some Rust developers may eventually miss
certain DMA functionalities in the future; but that would still be better
than the current situation, where _all_ Rust devs are missing all DMA
capabilities.

> 
> Dave.
> 

Thanks,
Carlos
