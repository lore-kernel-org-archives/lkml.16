Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D85246797;
	Thu, 12 Jun 2025 10:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749725632; cv=none; b=KHKGze7DiAhdXUPhmVAGY5DtQNxSfI1HPkwqxzQERhrXC9WcNikZ/X5l2CAxtikKOED1awx3az1RO4AUD5xaAC01rQaX3S/N3FNUZo06INT6zSP3VucBUmVNLRTn2p9yQa7ZdrKToC+789YoDYLqUlmFnQokJZlQYAJgaChBr3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749725632; c=relaxed/simple;
	bh=kLBLY/1VoxwlHEXQXPLtXWDGykTKRQSRy0gRlSA3/44=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=OAkJvlSHnf0fi234uj4aEprEMci0UFegKq5vLzqtRINrcrY11hsRyrybwmSVBAT0MAWTn1TpFYJ5kOd2I867+1SFq6/9zIHIyBuUDmPJDpQu8ftRtHeNrkeJb9aS9Mvb8tyPvprbCd46zwiZyWh206CifhCObxA2y+mLONqIdFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pPLGB5DC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pPLGB5DC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 789ECC4CEEA;
	Thu, 12 Jun 2025 10:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749725632;
	bh=kLBLY/1VoxwlHEXQXPLtXWDGykTKRQSRy0gRlSA3/44=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pPLGB5DCggP6sVYRduvA5cFsFJ8EyHL7r38ZXnGPQQCnfYo2Ybo5BsSUhUjMVYmw/
	 oUrqbv8lrTTXHVgjmkTMGmzDduNQdBJIPLuYMHBFuP6XuNRM9BrJLFKol8MQQKzRnp
	 NR2m1dcjzO3cfp4AWt2c2RlSQp2EmP56FaLGm7ekYc4BxsK6CVfXcWT7ehOkOoQyP7
	 AecsNaazSRvv0S0NjQAxQyQ3Jd00eLlzc+pIC6p17WbjDfokG0B+voHEQx1TMhvbR/
	 1StxwJ4Kfni0KyhDjIZ3QeKdmIVCgBn9Vn4ZRnUj3bT6Wh6Z9kC/+usDJnIOO59udD
	 I/y7cUpPqmRrg==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Jun 2025 12:53:45 +0200
Message-Id: <DAKHYVHNSO30.3SICBU2MAW9UL@kernel.org>
From: "Benno Lossin" <lossin@kernel.org>
To: "Danilo Krummrich" <dakr@kernel.org>
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
X-Mailer: aerc 0.20.1
References: <20250603205416.49281-1-dakr@kernel.org>
 <20250603205416.49281-2-dakr@kernel.org>
 <DAKEM192U5RZ.3D00TOR520LRY@kernel.org> <aEqtexr4WwfU7rIP@pollux>
In-Reply-To: <aEqtexr4WwfU7rIP@pollux>

On Thu Jun 12, 2025 at 12:35 PM CEST, Danilo Krummrich wrote:
> On Thu, Jun 12, 2025 at 10:15:55AM +0200, Benno Lossin wrote:
>> On Tue Jun 3, 2025 at 10:48 PM CEST, Danilo Krummrich wrote:
>> > +    /// Signal all tasks waiting on this completion.
>> > +    ///
>> > +    /// This method wakes up all tasks waiting on this completion; af=
ter this operation the
>> > +    /// completion is permanently done.
>> > +    pub fn complete_all(&self) {
>> > +        // SAFETY: `self.as_raw()` is a pointer to a valid `struct co=
mpletion`.
>> > +        unsafe { bindings::complete_all(self.as_raw()) };
>> > +    }
>> > +
>> > +    /// Wait for completion of a task.
>> > +    ///
>> > +    /// This method waits for the completion of a task; it is not int=
erruptible and there is no
>> > +    /// timeout.
>>=20
>> Another thing that we should document is weather this function returns
>> immediately when `complete_all` was already called in the past.
>
> The details are all documented in [1], which is also linked in the module
> documentation of this file.
>
> [1] https://docs.kernel.org/scheduler/completion.html

I dislike that we don't have the docs right there on the function.
Following that link, there is also a lot of other stuff there that don't
apply to Rust (eg initializing completions, and the
wait_for_completion*() variants).

After a bit of reading, I found the part that I was looking for (by
searching for `complete_all`...):

    A thread that wants to signal that the conditions for continuation have
    been achieved calls `complete()` to signal exactly one of the waiters
    that it can continue:
   =20
    ```c
    void complete(struct completion *done)
    ```
   =20
    ... or calls `complete_all()` to signal all current and future waiters:
   =20
    ```c
    void complete_all(struct completion *done)
    ```

Let's just put this information on the `complete_all` function.

---
Cheers,
Benno
