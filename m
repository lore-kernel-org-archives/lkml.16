Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525A33085D0;
	Thu, 19 Jun 2025 09:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750325481; cv=none; b=nfW4Bd2sYPECVVQ+s8PcprFKpz326htfLv8EnpU4HLJUIyT75JjCZJFI29yff+ccfhuaCDuaIblrWRnFAGEBtfiCbhXGslwRmpiCuiDhGSvxuZ67h+p0Y42WC2spBxTSX07G1Gx4bDWuZZMt/zFczSt0nNGALYdwWUGbdhxiQmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750325481; c=relaxed/simple;
	bh=ef6r/imHJ3hajGEmpAtQ+y6raHXVCuay3xH3gaxqvbE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=YaBN6d8qRlV18dNCo2JhK5CYgcsk9Qo6T4hjsHcwpR92QV4JRzWr6jrRZmw8LEhhEWWMrhQ13c52KI2rN8/2ou0OUH8cf4TWD5mVaCn3flLqi96MmjsxrgOvIZdkTJejmIwOX+LCan9wVUfmsK9luuHiRIvHghXr+/1ieVemOcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=amN2wTZT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="amN2wTZT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D2CCC4CEED;
	Thu, 19 Jun 2025 09:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750325481;
	bh=ef6r/imHJ3hajGEmpAtQ+y6raHXVCuay3xH3gaxqvbE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=amN2wTZTOCnGjS5pjIXKx8Dx1bQZVBOuu3rV0FOy6KQpiQpsEi9p/OcpCfnSFUEx/
	 HE0rRNFo6T9adZ+4ypLZvy1ldorHp7QresRh9/6vWc0ega6cXw4qgmu0OTzGoB0AYN
	 2+HHPIjaGDUXnjGymx4TOJyngtzVG1VWH7+bR7GK8y/dlsuS7vtbYWL9m3wICKUqxL
	 PewnBulP2Gl0Wk1iPqfmapnr5I4EveS+jRbD1USuPK4PddHfETOSWGpG8MiWmgD0Ir
	 RyxF1RjrFyGWkdueCsZGXgpzCntd/UNAEDGTuZnOMYwQdUN38Y5LCjvEmJFVKAJS9a
	 chpnd8o5Z9+Rw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "FUJITA Tomonori" <fujita.tomonori@gmail.com>
Cc: <boqun.feng@gmail.com>,  <alex.gaynor@gmail.com>,  <ojeda@kernel.org>,
  <aliceryhl@google.com>,  <anna-maria@linutronix.de>,
  <bjorn3_gh@protonmail.com>,  <dakr@kernel.org>,  <frederic@kernel.org>,
  <gary@garyguo.net>,  <jstultz@google.com>,
  <linux-kernel@vger.kernel.org>,  <lossin@kernel.org>,
  <lyude@redhat.com>,  <rust-for-linux@vger.kernel.org>,
  <sboyd@kernel.org>,  <tglx@linutronix.de>,  <tmgross@umich.edu>
Subject: Re: [PATCH] rust: time: Seal the ClockSource trait
In-Reply-To: <20250619.092816.1768105017126251956.fujita.tomonori@gmail.com>
	(FUJITA Tomonori's message of "Thu, 19 Jun 2025 09:28:16 +0900")
References: <aFENRtYZixePYn0XFOGCbNOkSV9338iV4jWk8XJYKI0crpf4QniT_GyZCmFuqmsKs5Cl64z8qlIK6aVfdTBjbA==@protonmail.internalid>
	<aFJINI8ImfxMnvrx@Mac.home> <87tt4c983g.fsf@kernel.org>
	<lliFJqf-6WmrKCArjCpOguz4jsHNtiF9GU0X4Ip5bE8NseTdlyKNH_7Bp_CyxNBD5ZR-Jbz0teNRS4UgV_7Z3g==@protonmail.internalid>
	<20250619.092816.1768105017126251956.fujita.tomonori@gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 19 Jun 2025 11:31:08 +0200
Message-ID: <87cyb084df.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"FUJITA Tomonori" <fujita.tomonori@gmail.com> writes:

> On Wed, 18 Jun 2025 21:13:07 +0200
> Andreas Hindborg <a.hindborg@kernel.org> wrote:
>
>> "Boqun Feng" <boqun.feng@gmail.com> writes:
>>
>>> On Tue, Jun 17, 2025 at 05:10:42PM -0700, Boqun Feng wrote:
>>>> On Wed, Jun 18, 2025 at 08:20:53AM +0900, FUJITA Tomonori wrote:
>>>> > Prevent downstream crates or drivers from implementing `ClockSource`
>>>> > for arbitrary types, which could otherwise leads to unsupported
>>>> > behavior.
>>>> >
>>>>
>>>> Hmm.. I don't think other impl of `ClockSource` is a problem, IIUC, as
>>>> long as the ktime_get() can return a value in [0, i64::MAX). Also this
>>>> means ClockSource should be an `unsafe` trait, because the correct
>>>> implementaion relies on ktime_get() returns the correct value. This is
>>>> needed even if you sealed ClockSource trait.
>>>>
>>>> Could you drop this and fix that the ClockSource trait instead? Thanks!
>>>>
>>>
>>> For example:
>>>
>>>     /// Trait for clock sources.
>>>     ///
>>>     /// ...
>>>     /// # Safety
>>>     ///
>>>     /// Implementers must ensure `ktime_get()` return a value in [0,
>>>     //  KTIME_MAX (i.e. i64::MAX)).
>>>     pub unsafe trait ClockSource {
>>>         ...
>>>     }
>>
>> Nice catch, it definitely needs to be unsafe. We should also require
>> correlation between ID and the value fetched by `ktime_get`.
>
> What's ID?


  pub trait ClockSource {
      /// The kernel clock ID associated with this clock source.
      ///
      /// This constant corresponds to the C side `clockid_t` value.
      const ID: bindings::clockid_t;

The constant used to identify the clock source when calling into C APIs.


Best regards,
Andreas Hindborg


