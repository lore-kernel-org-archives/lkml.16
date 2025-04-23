Received: from plesk.hostmyservers.fr (plesk.hostmyservers.fr [45.145.164.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86CD0269826;
	Wed, 23 Apr 2025 11:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.145.164.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745408016; cv=none; b=uELW/dNX+aWaQF2D/u8N6NpacsuTPIIOR3c7j99T9modKmI2TJi0fVfH1YATkd/gKQEsJIOp7lG4cEnSTscJ5kK9x5NBwZ++Zp23N7d6/bUpK1WRBm6vZuo0ot5coHVV/tNrmFPWu6kiZPyJWUxbDJUf9BtgaDVx+dBXcU++xNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745408016; c=relaxed/simple;
	bh=Silleq7gutm/szIl71jZSkSzc7i3W7sTu6tXKNr5uKk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X/1XRrQYPzhVb7zv86NyZKQKRqmpIIt/xlfKbd81yKU9mpyAAGbVjHpEc9b2jpfrPtXXX9BY43qWiewsEYmlszZIIMU0YcatynHzjAB07NkgvaRfB2FNX6B+QOh47oXtVMBuKO6SyZqGu7nEI+dvUufqT1eo7ddTvYZig/6sxfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arnaud-lcm.com; spf=pass smtp.mailfrom=arnaud-lcm.com; arc=none smtp.client-ip=45.145.164.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arnaud-lcm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arnaud-lcm.com
Received: from [IPV6:2a01:e0a:3e8:c0d0:d851:318b:70da:57a7] (unknown [IPv6:2a01:e0a:3e8:c0d0:d851:318b:70da:57a7])
	by plesk.hostmyservers.fr (Postfix) with ESMTPSA id 2694532A4DA;
	Wed, 23 Apr 2025 11:33:31 +0000 (UTC)
Authentication-Results: Plesk;
        spf=pass (sender IP is 2a01:e0a:3e8:c0d0:d851:318b:70da:57a7) smtp.mailfrom=contact@arnaud-lcm.com smtp.helo=[IPV6:2a01:e0a:3e8:c0d0:d851:318b:70da:57a7]
Received-SPF: pass (Plesk: connection is authenticated)
Message-ID: <32293daf-a6ce-49cc-b41d-1001037444da@arnaud-lcm.com>
Date: Wed, 23 Apr 2025 13:33:30 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] checkpatch.pl: warn about // comments on private
 Rust items
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
 <20250422125824.30525-1-contact@arnaud-lcm.com>
 <CANiq72n41Oj4K-yZCWbNXJQEEjTqjXHYgrkffAg_mUg8dKLWQg@mail.gmail.com>
 <06dde2dd-5d88-49d4-9e46-72a2e12ab1c2@arnaud-lcm.com>
 <CANiq72=UOOyf-esnRUCR0_gxFptdpNOymCz02vgesdNL7zTvHg@mail.gmail.com>
Content-Language: en-US
From: Arnaud Lecomte <contact@arnaud-lcm.com>
In-Reply-To: 
 <CANiq72=UOOyf-esnRUCR0_gxFptdpNOymCz02vgesdNL7zTvHg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <174540801176.10535.4552947519128350548@Plesk>
X-PPP-Vhost: arnaud-lcm.com

On 22/04/2025 17:32, Miguel Ojeda wrote:

> On Tue, Apr 22, 2025 at 4:37 PM Arnaud Lecomte <contact@arnaud-lcm.com> wrote:
>> As mentioned earlier, we can reduce the score of any heuristic which
>> could lead to any important false positive.
>> In my opinion, as long as the heuristic is relevant, we always have the
>> possibility to diminish the score associated with the heuristic, hence
>> preventing unnecessary false positives.
> Definitely (my comment above for this one was just a note, i.e. there
> may be nothing to change -- I just thought the commit message referred
> to just checking "Return" and not "Returns", since it said
> "imperative").
>
>> I think that you are definitely more experienced with what's done
>> commonly in rust code. Let's maybe change this heuristic definition with
>> @ related to types or some other annotation. Do you have some example I
>> could have a look to come in the next version with a relevant list of @
>> we can encounter.
> What does "references" mean in that heuristic? If you mean external
> links to some URL, then we typically use Markdown for those. The
> inline ones like `<https://...>`happen in both comments and docs. The
> `[...]: https://...` ones are way less common in comments I think (I
> can't find one).
We should then remove it. I'll wait for other reviewers for their 
feedback and then send a new version of the patch serie. Thanks :)
> As for `@`, if you mean the actual character, I grepped for it in Rust
> files with the /.*@ regex and found just ~13 matches, and all were the
> emails and disambiguators I mentioned. So I don't think we really use
> it for "references" (assuming I understand what that means).
>
> I guess you already looked in some `rust/kernel/` files -- some of
> those are really the best examples of how docs and comments should
> generally be written.
> Thanks!
>
> Cheers,
> Miguel
>
