Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D198B35949;
	Tue, 22 Apr 2025 14:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745333138; cv=none; b=sG68+fBInTQoJIFBWaSE0uhsG//CX8h6KCfNti7Epxhk4EALHuvlwqxHyxEPWUneb89h9a4vl2F7D3yeZqWUnbxPMTT/HrJ183P53Km+jKmNIIpfT+6NaQon6FLY/rMTqUjJXNJSSjmfrtcCX31S7HzhqFoH+taWCyFW0D3AsD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745333138; c=relaxed/simple;
	bh=e5aaGUW94gZf/MvlvamwTsdv9AsIgZTWXlPzKCWsV8Q=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n+y2j3TNV0F7pIUCrnofEdf9FVrAaRQ1A7BinoisYR+oaaq7SzbDvhgyWllgv2g8PS8R2MZbJI3OGJel4nlL8O5cmBHR8BV9tSXxrWuRUIkzBuxK5CXbTSjz3yJDBPBsxibO8mAE/pEdnC1nMRb6b/cRppezDF8ilj+yI+foNUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=mTTw081d; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="mTTw081d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=3medxrlvbbf3tlyrx5raelhcne.protonmail; t=1745333128; x=1745592328;
	bh=UXuSV1f79NbyF709WCuFqcBmWk4CD4WFGjva72joqI4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=mTTw081dyg1w9LR98H0jk4MgJMtsOphPYc8ai5ITKuB9ggpV34zwwpE3aWr641Zui
	 DUdqFXT8CO/GMnHZBKFzGPRR6LvcS9DlcVq9Ufjvph1Ff0sfx7Uv9Inp/y73ICI4Bz
	 ORJ5CuI0vqH+/U6giyDRu0tXlbEKx9JYQRgugxWvZ1RvrDyDYXsIiffHlUPm02B+70
	 heR9o9tja4AVZl25pxmgmAavNw1+bZTseSKoVeYhW64WKJsjzeqJl0TClyv4M7EsFj
	 CjgopylXUWdsOAt6JNmtVolayiMS+g9y5KM7s5caReo2+edI1Ee/SBB0wFPaKk+oRS
	 POHAdxKa8YM+Q==
Date: Tue, 22 Apr 2025 14:45:22 +0000
To: Boqun Feng <boqun.feng@gmail.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Fiona Behrens <me@kloenk.dev>, Alban Kurti <kurti@invicto.ai>, Michael Vetter <jubalh@iodoru.org>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/8] rust: pin-init: allow `pub` fields in `derive(Zeroable)`
Message-ID: <D9D8YDFLD98E.D8DZEIIW4EN5@proton.me>
In-Reply-To: <aAekPSsKnQWJSBhQ@Mac.home>
References: <20250421221728.528089-1-benno.lossin@proton.me> <20250421221728.528089-7-benno.lossin@proton.me> <aAchUjDJsukcCgKM@Mac.home> <D9D0ZHG5ZKGL.30GLJKI6X8TG7@proton.me> <aAekPSsKnQWJSBhQ@Mac.home>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 676289a5fcab86467fda80dfda41cd2e61706b7b
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue Apr 22, 2025 at 4:14 PM CEST, Boqun Feng wrote:
> On Tue, Apr 22, 2025 at 08:30:40AM +0000, Benno Lossin wrote:
>> On Tue Apr 22, 2025 at 6:55 AM CEST, Boqun Feng wrote:
>> > On Mon, Apr 21, 2025 at 10:18:33PM +0000, Benno Lossin wrote:
>> >> Add support for parsing `pub`, `pub(crate)` and `pub(super)` to the
>> >> derive macro `Zeroable`.
>> >>=20
>> >> Link: https://github.com/Rust-for-Linux/pin-init/pull/42/commits/e831=
1e52ca57273e7ed6d099144384971677a0ba
>> >> Signed-off-by: Benno Lossin <benno.lossin@proton.me>
>> >
>> > Kindly request tests/examples for this patch and the following one
>> > (patch #7) ;-)
>>=20
>> If you send a patch, I'll take it :)
>>=20
>
> First, I'm happy to help improve pin-init, *if* I fully understand the
> changes and have the cycle ;-)
>
> However, here we are at the review process, so I need these examples to
> close the gaps between the implementation and the usage to provide any
> meaningful review. There's no example/test in the commit log, the kernel
> code and (I've checked) the GitHub repo. Although I fully trust you, but
> there is no second source that could help me verify the changes easily.

Maybe this is just a case of me being too familiar with the code, but
the change in this commit and #7 are very trivial. I'm not too sure what
I should use as an example because of this. I could do something like:

    #[derive(Zeroable)]
    pub struct Foo {
        pub a: usize,
        b: u64,
    }

    #[derive(Zeroable)]
    pub union Bar {
        pub a: u64,
        pub b: i64,
    }

But I don't see a lot of value in adding those either as doc-tests or as
examples. Rust users normally expect that derive macros can handle any
kind of visibility for fields (there are exceptions of course, but they
don't apply to `Zeroable`).

The union case is a bit different in that not all derive macros support
them, so I agree that the docs should reflect that better. I can add a
patch when I find the time, as I'm stretched pretty thin (hence I
suggested you submit a patch :)

> In this case, it may be special, because you're in fact syncing an
> external repo with the kernel part, i.e. the development is done, so if
> we trust the external repo and of course, if no obvious error is
> founded during review (from the people who can review), we should merge
> it in. If that's the case, this patchset is more of an "FYI" instead of
> a development process IMO. Is this the case here?

I'm not 100% sure on the workflow for pin-init. Ideally all changes made
to the pin-init repo can be ported 1:1 into the kernel. There are of
course smaller things such as commit references in commit messages that
need to be adjusted. But aside from such smaller administrative things,
the idea with the sync was to only have one singular version. If you
want to spend the time looking at the pin-init PRs then feel free to do
so :)

Since I port the history from the repo and not do one single commit with
"sync with version v... of pin-init", I do think that kernel review can
indeed change things in the upstream repository, but I'm not sure by
which means it should do so. I want to avoid to rewrite history
upstream, so there it has to be a new patch.

---
Cheers,
Benno

