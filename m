Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7132192EC;
	Thu, 12 Jun 2025 11:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749726937; cv=none; b=EC7RZsdg2S0HVUZXH90K9dEDh/s1B4DqUJ9Q+fkV8zCQp+AgnXyQ+EIstMfUzZQ4rM5UruJPfBGkzPYmYHID6rUsoo4F7w8syiVDHAcAKLzckUf6YRIrA4SbAGD6dAJl/bjWx9fEpS7Ly/f3mBrcniG7N46NErUREz7sQd+ztsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749726937; c=relaxed/simple;
	bh=M072i+LZ+YXLZum52dXBwK5mFDPq+4NU2quKw4f6fi4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=KaoxdZuEk/Me9/R3ftJKe7HOtdPbNK6pee9IdlIEAi800zX/i5iP86KTlPvjnhv5XqE1CUR0WSlZrxbnmaHLCOaJz+q3Qx3ABa9F9q5kN730456ZMPioxRoiRWbulWKB3xD04BXjwhQ/I0yfAHY/MWbZWdJRqAwU/kIfoxO28K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N5HsfpQW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N5HsfpQW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B18ECC4CEEA;
	Thu, 12 Jun 2025 11:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749726937;
	bh=M072i+LZ+YXLZum52dXBwK5mFDPq+4NU2quKw4f6fi4=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=N5HsfpQWJAI1f2eZZmiAYy8aO17u1fQ6GjJEYEGBT/2ao8JADzWh6Xn8C1nZcd61l
	 uajirQLnBoCHwTwFmhRCblAG11JtMqPRZc8kmuNyPyPbwuFSQ4WlYv17crKmexfc5V
	 DmCcjbDb9cf4VwPYi+Z0MBwLid36spKp/qCn0m9YSVPTmnZejrK2Zz3gOSLdfn0tqx
	 g/ckI7ebRADbQLy7dApHWZJVQ8p2m6CNRLJNO6LHauCENWV0Nq2XMlFHP9EuvKLq1X
	 VrQ8hgba6GNARDMDQZ0rKPsKDpJc8+obaKQn0K/i1gExln18EEdoNh1cfdfwJTwGfF
	 p646fTXN2O4Mw==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Jun 2025 13:15:31 +0200
Message-Id: <DAKIFJF2G8J1.16M76708TDL8M@kernel.org>
Cc: <gregkh@linuxfoundation.org>, <rafael@kernel.org>, <ojeda@kernel.org>,
 <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <benno.lossin@proton.me>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
 <chrisi.schrefl@gmail.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Ingo Molnar" <mingo@redhat.com>, "Peter
 Zijlstra" <peterz@infradead.org>, "Juri Lelli" <juri.lelli@redhat.com>,
 "Vincent Guittot" <vincent.guittot@linaro.org>, "Dietmar Eggemann"
 <dietmar.eggemann@arm.com>, "Steven Rostedt" <rostedt@goodmis.org>, "Ben
 Segall" <bsegall@google.com>, "Mel Gorman" <mgorman@suse.de>, "Valentin
 Schneider" <vschneid@redhat.com>
Subject: Re: [PATCH 1/3] rust: completion: implement initial abstraction
From: "Benno Lossin" <lossin@kernel.org>
To: "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250603205416.49281-1-dakr@kernel.org>
 <20250603205416.49281-2-dakr@kernel.org>
 <DAKEM192U5RZ.3D00TOR520LRY@kernel.org> <aEqtexr4WwfU7rIP@pollux>
 <DAKHYVHNSO30.3SICBU2MAW9UL@kernel.org> <aEq0tA7yuBPxTSXq@pollux>
In-Reply-To: <aEq0tA7yuBPxTSXq@pollux>

On Thu Jun 12, 2025 at 1:06 PM CEST, Danilo Krummrich wrote:
> On Thu, Jun 12, 2025 at 12:53:45PM +0200, Benno Lossin wrote:
>> On Thu Jun 12, 2025 at 12:35 PM CEST, Danilo Krummrich wrote:
>> > On Thu, Jun 12, 2025 at 10:15:55AM +0200, Benno Lossin wrote:
>> >> On Tue Jun 3, 2025 at 10:48 PM CEST, Danilo Krummrich wrote:
>> >> > +    /// Signal all tasks waiting on this completion.
>> >> > +    ///
>> >> > +    /// This method wakes up all tasks waiting on this completion;=
 after this operation the
>> >> > +    /// completion is permanently done.
>> >> > +    pub fn complete_all(&self) {
>> >> > +        // SAFETY: `self.as_raw()` is a pointer to a valid `struct=
 completion`.
>> >> > +        unsafe { bindings::complete_all(self.as_raw()) };
>> >> > +    }
>> >> > +
>> >> > +    /// Wait for completion of a task.
>> >> > +    ///
>> >> > +    /// This method waits for the completion of a task; it is not =
interruptible and there is no
>> >> > +    /// timeout.
>> >>=20
>> >> Another thing that we should document is weather this function return=
s
>> >> immediately when `complete_all` was already called in the past.
>> >
>> > The details are all documented in [1], which is also linked in the mod=
ule
>> > documentation of this file.
>> >
>> > [1] https://docs.kernel.org/scheduler/completion.html
>>=20
>> I dislike that we don't have the docs right there on the function.
>> Following that link, there is also a lot of other stuff there that don't
>> apply to Rust (eg initializing completions, and the
>> wait_for_completion*() variants).
>>=20
>> After a bit of reading, I found the part that I was looking for (by
>> searching for `complete_all`...):
>>=20
>>     A thread that wants to signal that the conditions for continuation h=
ave
>>     been achieved calls `complete()` to signal exactly one of the waiter=
s
>>     that it can continue:
>>    =20
>>     ```c
>>     void complete(struct completion *done)
>>     ```
>>    =20
>>     ... or calls `complete_all()` to signal all current and future waite=
rs:
>>    =20
>>     ```c
>>     void complete_all(struct completion *done)
>>     ```
>>=20
>> Let's just put this information on the `complete_all` function.
>
> It's already there, no?
>
> "after this operation the completion is permanently done"

The phrasing in the C docs seems more obvious to me "signal to all
current and future waiters". The "permanently done" part is a bit
ambiguous to me.

---
Cheers,
Benno
