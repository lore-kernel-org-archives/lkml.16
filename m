Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B01D1F0E47;
	Sat,  5 Jul 2025 07:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751698899; cv=none; b=MlHVlRT3GxwfHJM4XrfRT3KyddlNuKGIkEzfcoJZTMztHHNNKBmYhVDWlsLlU1N30k5JSC5SH5+cOE1NBhnS9x8eWgm2eplFtxEIZvs8SxV36gwMITwNY8gm6dFy9iF0x1a6oxaNOJyDpUS2m1bktpaEyTSwn8aHdzAupW6vdJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751698899; c=relaxed/simple;
	bh=Idmu/dCAYI+cgqBEYepV+Mv0IJ2ByJnr314LV8QmSKk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=u3VQCiaQzRFDnB7b7f3SxYi/3Rc98A//K9OtFoREF4FP4JjAszR6OL7eya09uDv8kYVmgMSIoNU7JinoC+zHHZylQV3DmE2JyjMEylEzEjL0gKFk92u/Pq93rfoeyL18KeymGgCjtjG/CFo7hEuBF3HYw3zKZwaQEg49n8qTkGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ot5FtxDd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ot5FtxDd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8D1DC4CEE7;
	Sat,  5 Jul 2025 07:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751698897;
	bh=Idmu/dCAYI+cgqBEYepV+Mv0IJ2ByJnr314LV8QmSKk=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=Ot5FtxDd/DzDG+uyjUTdveMYO13QXkaaamkCO+pyezWTNJXS7NJVaY6jt/fDXh3BI
	 yrvzzzNAO9Zj/yTXLmdAhrN48kcAvAOeuXiQ/eWpYmTGyArutMm0zRtAwTYiAv6OX5
	 jWQmMWBQhnAcDw6k2lpRTzFL9lkUHyqlVu7nGOlxIYFHW7mOSFTyjz82nsVI88x8l8
	 qcNuHgA8x/bcvuWHnj3Ck2+Sy3zdFO2TPPizEYNHLn5Q3iGgttXYDG17e75IfLLKk6
	 NeFShxy/bVLLaiy7Gs+V8aMJ+b+vzRiWXLnbgQpjVHG+s6Sb7Xxpvg4j693n76fk4k
	 EMg2seiqYVyOw==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 05 Jul 2025 09:01:33 +0200
Message-Id: <DB3XFMG7M4SO.J6A2LVOAOJDX@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dakr@kernel.org>, <ojeda@kernel.org>, <skhan@linuxfoundation.org>,
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 <~lkcamp/patches@lists.sr.ht>
Subject: Re: [PATCH v5 0/2] rust: revocable: documentation and refactorings
From: "Benno Lossin" <lossin@kernel.org>
To: "Marcelo Moreira" <marcelomoreira1905@gmail.com>
X-Mailer: aerc 0.20.1
References: <20250626165927.66498-1-marcelomoreira1905@gmail.com>
 <DB29YAYDK6YW.1NF5I2WSI1BPR@kernel.org>
 <CAPZ3m_iqCRYh+XhMip3h=ZWKpw4VPfnRQ6ofmoAnrzKDbOO-PA@mail.gmail.com>
In-Reply-To: <CAPZ3m_iqCRYh+XhMip3h=ZWKpw4VPfnRQ6ofmoAnrzKDbOO-PA@mail.gmail.com>

On Sat Jul 5, 2025 at 7:09 AM CEST, Marcelo Moreira wrote:
> Em qui., 3 de jul. de 2025 =C3=A0s 05:24, Benno Lossin <lossin@kernel.org=
> escreveu:
>>
>> On Thu Jun 26, 2025 at 6:59 PM CEST, Marcelo Moreira wrote:
>> > This patch series brings documentation and refactorings to the `Revoca=
ble` type.
>> >
>> > Changes include:
>> > - Clarifying the write invariant and updating associated safety commen=
ts for `Revocable<T>`.
>> > - Splitting the internal `revoke_internal` function into two distinct,=
 explicit functions: `revoke()` (safe, synchronizing with RCU) and `revoke_=
nosync()` (unsafe, without RCU synchronization), now returning `bool` to in=
dicate revocation status.
>>
>> Could you wrap your text to a more readable column? Thanks!
>
> Sure! Thanks!
>
>>
>> >
>> > Marcelo Moreira (2):
>> >   rust: revocable: Refactor revocation mechanism to remove generic
>> >     revoke_internal
>> >   rust: revocable: Clarify write invariant and update safety comments
>> >
>> > Changelog
>> > ---------
>> >
>> > Changes since v4:
>> > - Rebased the series onto the latest `rfl/rust-next` to integrate rece=
nt changes, specifically the `bool` return for `revoke()` and `revoke_nosyn=
c()`.
>> > - Dropped the "rust: revocable: simplify RevocableGuard for internal s=
afety" patch, as the approach of using a direct reference (`&'a T`) for `Re=
vocableGuard` was found to be unsound due to Rust's aliasing rules and LLVM=
's `dereferencable` attribute guarantees, which require references to remai=
n valid for the entire function call duration, even if the internal RCU gua=
rd is dropped earlier.
>> > - Refined the `PinnedDrop::drop` `SAFETY` comment based on Benno Lossi=
n's and Miguel Ojeda's feedback, adopting a more concise and standard Kerne=
l-style bullet point format.
>> > - Corrected a duplicated line in the commit message of the second patc=
h.
>>
>> Now since we had to drop the `RevocableGuard` change, its safety
>> invariant & comment in `deref` is insufficient. It shouldn't have the
>> invariant that the rcu lock is held (since it owns an `rcu::Guard`, that
>> already is guaranteed), but instead it should require that the
>> `data_ref` pointer is valid. That invariant is then used by the safety
>> comment in `deref` to justify dereferencing the pointer.
>>
>> Also, I think it's better to reorder the patches again (since the
>> current first one relies on changes from the second one), the first one
>> should be the change to the invariants section of `Revocable` (so
>> currently the second patch). Then the second and third patches can be
>> the removal of `revoke_internal` and the `RevocableGuard` safety
>> documentation fix.
>
> All right Benno, I'll prepare the comment for `RevocableGuard` and send v=
6.
>
> The order now is:
> 1- Documentation for invariant and updates associated `SAFETY` comments
> 2- Remove `revoke_internal` (Refactoring)
> 3- `RevocableGuard` safety documentation fix.

Sounds good!

---
Cheers,
Benno
