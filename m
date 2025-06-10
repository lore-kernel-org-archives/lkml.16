Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6FD28CF4C;
	Tue, 10 Jun 2025 10:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749551122; cv=none; b=V3f8yEQCD7RHuslbzRp+hsdHNS3NwAtXZNSzWiYkA65OoDYRQnTHOgTy5oDotS9Gl08rhpf9Ymr5iH4DSdwkCamSdVFX11ERuRECTwJJMLxppq/A5gV6bqq4qo7Rn3KeVx+pKQ4/dRJ/hZklnh2fOf4iI7qtzg1wJUu/V5tQOT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749551122; c=relaxed/simple;
	bh=E3G8JLOFOz6gdX2I9IACKDS0gwH+Jplg/jGdoU+kY5g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=e8UraBdQToNTM4554dx0ywcy2iDPmWV0ziqPfKpZ1hWZdZF1P4uNnQ1WPFIxf0tt3AFU0Jq+RoU6XRyt9ndTgbhnb7kCtiok744+XRWRTMJrfG1+/j26yYPeF16BDKMJp14Ik+UtwOGE0rxrrOvkLpW7xnb3ec3jIgeWTInKzO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UgNDHfKN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UgNDHfKN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD546C4CEED;
	Tue, 10 Jun 2025 10:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749551122;
	bh=E3G8JLOFOz6gdX2I9IACKDS0gwH+Jplg/jGdoU+kY5g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=UgNDHfKNBbMxGZNfvawnBASc4E/MmDqHkEHlYfiE7bMcQyDQjfXjwbOE7BE8k3EWK
	 t6IKCIx/3Q9uQJU1qDsyk7z6V6pz7W7JUc7T2zVsp6Ld03yGsXU070qMsusEnm7Q1F
	 CyF2ZAXOAmLqktaPjHVh+YyyUwKPBJOe2RerendUBwq7VMZYiFYvmffA5G3A4h8lfP
	 oO+mVDvLp1An08Q2oN4Wo1lgMP9uGiHonWH0R4BedXTVgT7Vm1tQqKWyk161npo/j3
	 PgqTW6Z6aVS0Q3Weoj6di7WHt4S+UtesN3Dwjvrwn2pn1qa21nrN9kkj+wkDWlFBMM
	 Twq7WEsSMAOMg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "FUJITA Tomonori" <fujita.tomonori@gmail.com>
Cc: <alex.gaynor@gmail.com>,  <ojeda@kernel.org>,  <aliceryhl@google.com>,
  <anna-maria@linutronix.de>,  <bjorn3_gh@protonmail.com>,
  <boqun.feng@gmail.com>,  <dakr@kernel.org>,  <frederic@kernel.org>,
  <gary@garyguo.net>,  <jstultz@google.com>,
  <linux-kernel@vger.kernel.org>,  <lossin@kernel.org>,
  <lyude@redhat.com>,  <rust-for-linux@vger.kernel.org>,
  <sboyd@kernel.org>,  <tglx@linutronix.de>,  <tmgross@umich.edu>
Subject: Re: [PATCH v3 3/3] rust: time: Add ktime_get() to ClockSource trait
In-Reply-To: <20250610.171506.1930082951902279512.fujita.tomonori@gmail.com>
	(FUJITA Tomonori's message of "Tue, 10 Jun 2025 17:15:06 +0900")
References: <-OrPPXscT_4STsX2CDg5ki77Lz68HLwGbucr-EZuMsTXhLnEdyuDfskI5daZYIwNuMJN_CBXX-gW_RLrw_H-aA==@protonmail.internalid>
	<20250609010415.3302835-4-fujita.tomonori@gmail.com>
	<874iwo3tze.fsf@kernel.org>
	<dLoUGc_2n-ucLABtNidnDEFHkzly22x6iRKRh7Fz_7uoj9tvw9qZySUE5dIVWndnQlq9044P04kltwMTMuUI2Q==@protonmail.internalid>
	<20250610.171506.1930082951902279512.fujita.tomonori@gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 10 Jun 2025 11:34:00 +0200
Message-ID: <87h60o2b5j.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"FUJITA Tomonori" <fujita.tomonori@gmail.com> writes:

> On Tue, 10 Jun 2025 10:01:57 +0200
> Andreas Hindborg <a.hindborg@kernel.org> wrote:
>
>> "FUJITA Tomonori" <fujita.tomonori@gmail.com> writes:
>>
>>> Introduce the ktime_get() associated function to the ClockSource
>>> trait, allowing each clock source to specify how it retrieves the
>>> current time. This enables Instant::now() to be implemented
>>> generically using the type-level ClockSource abstraction.
>>>
>>> This change enhances the type safety and extensibility of timekeeping
>>> by statically associating time retrieval mechanisms with their
>>> respective clock types. It also reduces the reliance on hardcoded
>>> clock logic within Instant.
>>>
>>> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
>>> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
>>> ---
>>>  rust/helpers/helpers.c |  1 +
>>>  rust/helpers/time.c    | 18 ++++++++++++++++++
>>>  rust/kernel/time.rs    | 32 ++++++++++++++++++++++++++++----
>>>  3 files changed, 47 insertions(+), 4 deletions(-)
>>>  create mode 100644 rust/helpers/time.c
>>>
>>> diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
>>> index 0f1b5d115985..0613a849e05c 100644
>>> --- a/rust/helpers/helpers.c
>>> +++ b/rust/helpers/helpers.c
>>> @@ -39,6 +39,7 @@
>>>  #include "spinlock.c"
>>>  #include "sync.c"
>>>  #include "task.c"
>>> +#include "time.c"
>>>  #include "uaccess.c"
>>>  #include "vmalloc.c"
>>>  #include "wait.c"
>>> diff --git a/rust/helpers/time.c b/rust/helpers/time.c
>>> new file mode 100644
>>> index 000000000000..9c296e93a560
>>> --- /dev/null
>>> +++ b/rust/helpers/time.c
>>> @@ -0,0 +1,18 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +
>>> +#include <linux/timekeeping.h>
>>> +
>>> +ktime_t rust_helper_ktime_get_real(void)
>>> +{
>>> +	return ktime_get_with_offset(TK_OFFS_REAL);
>>> +}
>>> +
>>> +ktime_t rust_helper_ktime_get_boottime(void)
>>> +{
>>> +	return ktime_get_with_offset(TK_OFFS_BOOT);
>>> +}
>>> +
>>> +ktime_t rust_helper_ktime_get_clocktai(void)
>>> +{
>>> +	return ktime_get_with_offset(TK_OFFS_TAI);
>>> +}
>>
>> This just caught my eye. I think policy is to make helpers as much 1:1 as
>> possible. We should not inject arguments here. Instead, we should have
>> just one function that passes the argument along.
>
> Indeed, you're right. It should have been as follows:
>
> +++ b/rust/helpers/time.c
> @@ -0,0 +1,18 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/timekeeping.h>
> +
> +ktime_t rust_helper_ktime_get_real(void)
> +{
> +	return ktime_get_real();
> +}
> +
> +ktime_t rust_helper_ktime_get_boottime(void)
> +{
> +	return ktime_get_boottime();
> +}
> +
> +ktime_t rust_helper_ktime_get_clocktai(void)
> +{
> +	return ktime_get_clocktai();
> +}

Yes, even better =F0=9F=91=8D


Best regards,
Andreas Hindborg




