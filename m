Received: from plesk.hostmyservers.fr (plesk.hostmyservers.fr [45.145.164.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279A828A1E0;
	Tue, 22 Apr 2025 14:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.145.164.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745332671; cv=none; b=WxiSGXEK9pN5i6fE3JX3/DxGPQuDGHWiDwfPpwlDqIXIJdurwg1HKMLnN0+Xe2ajcUGTlMXMQcylqG0AntSj3hRbsE40axRfDb/GmIBnlqvF8VooUkhFsMlgoQthfSyIA8knto23Kxx2IDkoTVqMNwwVZf4dbDPT+USqtRNDMdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745332671; c=relaxed/simple;
	bh=jF59aou5iKEjumEl+yWFS1HVfmxA+SlpjANlPt1s+cg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tUQE3i+LQAueg8NjEg6wXjde0jF2eG6ooUgn8qZMgR7i6WKvWXAIyvrNvIAcEGK7lrsz6ezfa/hrvhCnUI/aX+CNM7evptBAacwYMR4xOQ1J6gGJzfNQnqqhWm4L5lMD9h5H6d+hsWXFS2my0FGWHZXlqSUCIS7w+5IggWTKw0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arnaud-lcm.com; spf=pass smtp.mailfrom=arnaud-lcm.com; arc=none smtp.client-ip=45.145.164.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arnaud-lcm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arnaud-lcm.com
Received: from [IPV6:2a01:e0a:3e8:c0d0:c864:fba8:3048:a3c2] (unknown [IPv6:2a01:e0a:3e8:c0d0:c864:fba8:3048:a3c2])
	by plesk.hostmyservers.fr (Postfix) with ESMTPSA id 1550A54ED0;
	Tue, 22 Apr 2025 14:37:47 +0000 (UTC)
Authentication-Results: Plesk;
        spf=pass (sender IP is 2a01:e0a:3e8:c0d0:c864:fba8:3048:a3c2) smtp.mailfrom=contact@arnaud-lcm.com smtp.helo=[IPV6:2a01:e0a:3e8:c0d0:c864:fba8:3048:a3c2]
Received-SPF: pass (Plesk: connection is authenticated)
Message-ID: <06dde2dd-5d88-49d4-9e46-72a2e12ab1c2@arnaud-lcm.com>
Date: Tue, 22 Apr 2025 16:37:46 +0200
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
Content-Language: en-US
From: Arnaud Lecomte <contact@arnaud-lcm.com>
In-Reply-To: 
 <CANiq72n41Oj4K-yZCWbNXJQEEjTqjXHYgrkffAg_mUg8dKLWQg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <174533266790.14176.16102449170099582736@Plesk>
X-PPP-Vhost: arnaud-lcm.com


On 22/04/2025 15:46, Miguel Ojeda wrote:
> On Tue, Apr 22, 2025 at 2:58 PM Arnaud Lecomte <contact@arnaud-lcm.com> wrote:
>> The detection uses multiple heuristics to identify likely doc comments:
>>    - Comments containing markdown
> Markdown is required in both documentation and comments, so I don't
> think we can use some of those, e.g. inline code spans (i.e.
> backticks) are common (and actually expected) in comments. Something
> like a title (i.e. `#`) or intra-doc links are uncommon, though.

Let's then maybe reduce the score of this heuristic and remove intra-doc 
links and titles detection. After reviewing, it indeed doesn't really 
make sense.

>>    - Comments starting with an imperative tone
> Some people document using the third-person, e.g. some functions say
> "Returns ..." like you have below. (It is not easy to enforce
> kernel-wide a single style here, thus so far we don't.)
>
> (Looking briefly at the code) Ah, I think you are covering both, good.

As mentioned earlier, we can reduce the score of any heuristic which 
could lead to any important false positive.
In my opinion, as long as the heuristic is relevant, we always have the 
possibility to diminish the score associated with the heuristic, hence 
preventing unnecessary false positives.

>>    - Comments with references: @see, @link, ...
> Do you mean Markdown references? Or javadoc-like ones?
>
> (Looking again at the code...) I think you are referring to actually
> strings like `@see`. Hmm... I don't think we have those -- the only
> `@` I would expect in a comment are thinks like emails or the
> `rustdoc` syntax to disambiguate the "kind" of item, e.g.
> `type@NotThreadSafe`. I do see a `@maxlen` somewhere, but that should
> have been an inline code span, and anyway it is not a `@see` or
> `@link`. But I may be confused here?
>
I think that you are definitely more experienced with what's done 
commonly in rust code. Let's maybe change this heuristic definition with 
@ related to types or some other annotation. Do you have some example I 
could have a look to come in the next version with a relevant list of @  
we can encounter.
>> Comments are only flagged if they:
>>   - Appear above private items
>>   - Don't contain obvious non-doc patterns (TODO, FIXME)
>>   - Score sufficiently on heuristics
> Nice work! I wasn't expecting something with actual weighted scoring,
> but if the maintainers are OK with something as involved as that, then
> I guess it is fine. We may need to tweak the scoring in the future,
> but it may be a good experiment.

I think it is a nice approach due to the granularity it offers. This 
will drastically reduce the number of false positives.

> Thanks!
>
> Cheers,
> Miguel


Thanks for your feedbacks,

Arnaud

