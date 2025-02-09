Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch [79.135.106.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E62E249F9
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 23:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739142261; cv=none; b=rKPuYSrMaPeXkRk4Kij3h73/dH4MgjEM9AxgiUOjYy1WxG+HS8K/UjhEIcOgASgjJlBBuNWo8a4kdg0PuN7ZegWCqIn59uF+aekqdWbLL67Ol0tCR4lyTTIxK3RKnri+zqsZp/Ay87NrPwEvizmwI97Bk/m9ELsPhggS5pg0dl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739142261; c=relaxed/simple;
	bh=NU54NRxIUeP9QHF7MrgdhmxvtxOcKUrZnVuC7SbE1PE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZSc+2SanY++Q5h9Nc0eSB1BErlHDwHJWieK58pi74/AJZ5L5zKzZ8VWvrJeftDCWZDBXZMrIbkqGEdjVtERZo+9l7q5/tX0Po0AxoVq0LJWGrnaXfKtmnId3MA3txjmyGhn4YvwIky3Ku4Z144WS9P4g02yMwrsxDyErN+4oI9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=WwNL4KR8; arc=none smtp.client-ip=79.135.106.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="WwNL4KR8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1739142250; x=1739401450;
	bh=nRaMBfyk93ZFkt4WRRGiHTbZoG8BhcVQUtsupv/piFw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=WwNL4KR8JTWD1QP3SXqN6rK3D4Gdty6pqfM9fmqi3VU5s3tkNc75q0zJNeQbzhAfK
	 z8bmQB8biJmEunS+pZ81Y1Goru8fkyGW4eRyPH+aSANjtJn6APs+/tog8cCkZwDMGa
	 0zsHqlaJTs0jSdy7Mr9GmASQGkYTy7D4qkXawIJdZEcYE50Fe2NAG27w2/cYmjdwnH
	 RSuOITOSvOWUCqV/hbvFFwqrDokY3j6QaGfsXw+Vt+IpjExQ8uW2bZfWAN4hhgvmBq
	 mfvUqX2d2+lpIA52Dr9DV8qikLKbWnEZ34KPdtmWx1JcQHL5o3aBt+RI+3Gg5v+2Yh
	 Ijd0F/sLlIkXw==
Date: Sun, 09 Feb 2025 23:04:00 +0000
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lyude Paul <lyude@redhat.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, rust-for-linux@vger.kernel.org, =?utf-8?Q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Wedson Almeida Filho <wedsonaf@gmail.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Xiangfei Ding <dingxiangfei2009@gmail.com>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] rust/kernel: Add faux device bindings
Message-ID: <2a054a4a-8681-46bb-be40-f7ec6869f5c8@proton.me>
In-Reply-To: <2025020904-defile-juror-67ab@gregkh>
References: <20250207004049.178049-1-lyude@redhat.com> <CANiq72=bspqRga-hTTb3Vh9kD0ctyTehM9dvJdR=8biTE+iCQw@mail.gmail.com> <2025020715-subsonic-silenced-36c5@gregkh> <2ac39b766dbf5f9606107d3ead216ba384cfdd2b.camel@redhat.com> <2025020904-defile-juror-67ab@gregkh>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 7463dd321520320aa57d7ef3b15896993fd7e606
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 09.02.25 16:43, Greg Kroah-Hartman wrote:
> On Fri, Feb 07, 2025 at 05:10:29PM -0500, Lyude Paul wrote:
>> On Fri, 2025-02-07 at 13:16 +0100, Greg Kroah-Hartman wrote:
>>> On Fri, Feb 07, 2025 at 12:42:41PM +0100, Miguel Ojeda wrote:
>>>> On Fri, Feb 7, 2025 at 1:42=E2=80=AFAM Lyude Paul <lyude@redhat.com> w=
rote:
>>>>>
>>>>> This introduces a crate for working with faux devices in rust, along =
with
>>>>
>>>> s/crate/module
>>>>
>>>> (also in the module description)
>>>>
>>>>> +//! C header: [`include/linux/device/faux.h`]
>>>>> +use crate::{bindings, device, error::code::*, prelude::*};
>>>>
>>>> Newline between.
>>>>
>>>>> +        // SAFETY: self.0 is a valid registered faux_device via our =
type invariants.
>>>>
>>>> Markdown.
>>>>
>>>>> +// SAFETY: The faux device API is thread-safe
>>>>> +unsafe impl Send for Registration {}
>>>>> +
>>>>> +// SAFETY: The faux device API is thread-safe
>>>>> +unsafe impl Sync for Registration {}
>>>>
>>>> Perhaps some extra notes here would be useful, e.g. is it documented
>>>> to be so? Especially since faux is being added now, it may make sense
>>>> to e.g. take the chance to work on mentioning this on the C side.
>>>
>>> How can or should I mention this on the C side?
>>
>> This is a very good question :), especially because it turns out I actua=
lly
>> think this function is not thread-safe! Though I don't think that's actu=
ally
>> much of a problem for Send/Sync here:
>>
>> So - my original assumption was that since faux_device_destroy() just wr=
aps
>> around device_del() and put_device() we'd get thread safety. put_device(=
) is
>> thread-safe, but on closer inspection I don't see that device_del() is. =
It
>> _can_ be called from any thread, but only so long as there is a guarante=
e it's
>> called exactly once. I think that's fine both for C and rust, but it
>> definitely warrants a more descriptive SAFETY comment from me.
>>
>> So for the C side of things I might actually add documentation to device=
_del()
>> for this that would look something like this:
>>
>>    device_del() can be called from any thread, but provides no protectio=
n
>>    against multiple calls. It is up to the caller to ensure this functio=
n may
>>    only be called once for a given device.
>=20
> You are correct in that device_del() has to be called only once, but the
> idea of "thread safe" really isn't a thing in the kernel because we have
> processes entering/exiting the code from all different places so things
> better be "thread safe" almost everywhere, what matters to us as you
> know is "context" due to sleep/locking issues.

The "everything needs to be thread safe" mantra makes a lot of sense for
C, since there it will blow up in your face very quickly if you make a
mistake (and crucially, I can imagine a lot of nasty bugs that only
show themselves once another change is made years later). But with Rust,
we can let the compiler enforce the rules and thus allow more efficient
constructs in places where we know that the object only stays on one
"thread".
Also, there are several concepts in C that are associated with a type in
Rust that are inherently thread-unsafe. For example RCU: you're not
allowed to take the RCU lock and then context-switch to another "thread"
(or whatever the right term is) and unlock RCU there. In Rust, we would
model that with a guard object that you're not allowed to send to
another thread. (if you tried to do it, you would get a compiler error)
The same is true for locking a mutex (I haven't been in the loop w.r.t.
the C lock guards, AFAIK they exist and would have the same problem, so
after locking, you're not allowed to move it to another thread (if that
is even possible with how they are implemented)) and having a pointer to
an object that one doesn't own a reference count to (I imagine that that
rarely happens, but in Rust you're allowed to do that as long as there
is some synchronization that guarantees that another thread still holds
a refcount).

> So how about this wording instead:
> =09device_del() must be called from process context, not interrupt
> =09context, and also provides no protection against multiple calls
> =09for the same device.  It MUST be up to the caller to ensure that
> =09this function can only be called once for a given device.
>=20
>=20
>> And then I suppose we could refer back to device_del() in faux_device_de=
stroy()'s
>> documentation if we want. For the rust side of thing the safety comment =
could
>> just be like this:
>>
>>    // SAFETY: Our bindings ensure only one `Registration` can exist at a=
 time,
>>    meaning faux_device_destroy() can only be called once for a given
>>    registration - fulfilling the driver core's requirements for thread-s=
afety.
>=20
> Sure, but I think we are going to start getting "thread" confusion over
> time here, is this something we want to start thinking about or am I
> just running into it for the first time here?  I know it's a userspace
> thing but not normally thought of in the kernel subsystems I'm familiar
> with.

This has come up in several past discussions, including the confusion
around the terminology. I'll take this as an opportunity to clear things
up and explain the Rust terminology in a bit more detail. If you're
already up to speed, others will surely benefit from this.

I also have some confusion about what your terms are and what they mean,
so it would be great if you either have a pointer or a quick overview +
explanation (or someone else of course).

In the following I will continue to use "thread", because that's what I
am used to. "Thread" to me means a different execution context in the
abstract machine: it has a function call stack, local variables and
executes code instructions one after the other. Any execution that does
not infinitely starve a thread and upholds synchronization primitives is
a valid one for the abstract machine. So in particular when not using
synchronization between threads, the program can behave
non-deterministically.

So we are doing all of this business solely for the purpose of keeping
our programs deterministic. (which is a great property :)



In Rust terms, we have two traits `Send` and `Sync` that -- at least in
user space -- govern whether an object can be sent (`Send`) or shared
(`Sync`) between threads. "Shared" in this context just means that
you're allowed to send shared references to other threads. So `T: Sync`
is just a short way of saying `&T: Send`. Sending a value to another
thread means giving up ownership of it and moving it to that other
thread [^a] (most of the time in the form of moving a pointer to the
value there). When talking about thread-safety, one can mean one or the
other, or both (which is a bit annoying and the reason for my preference
for saying "this type is not `Send`" instead of saying "it's not thread
safe").

This "special" meaning of these traits is not really special at all.
They are just normal traits [^b] and their meaning comes from their
usage as bounds for generics. For example, in std when spawning a new
thread, one can only give it ownership of data that implements `Send`
[1]. This also holds for any other process of moving data between
threads such as channels or shareable smart pointers.
Importantly, in the kernel, we can shape our own meaning of `Send` and
`Sync` (at least to a degree, as there are some constraints that core
gives us), since it only depends on how the bounds of them are used. We
even could introduce new traits that have different meaning such as "can
be shared with this other context" while `Send` still means "can be
shared with any other context". But such an addition should be done very
carefully, as it's a huge pain if we later find out we would like to
change it, as it infects everything.



Now to give some examples and further explain the meaning of `Send` and
`Sync` in user-space. I will start off with a possibly surprising fact:
there are types that are `Sync` but `!Send` and vice versa. For the
first case, there is the `MutexGuard` [2] from std. But also the `Guard`
[3] type from the kernel crate. This is because, unlocking a user-space
mutex and a kernel lock type respectively is not possible from a
different thread than where it was locked. However, accessing the data
behind such a lock in a shared manner *is* possible (of course only if
that other thread knows that the first one still holds the lock and
isn't writing to the data), thus it still is `Sync`.
For the flipped case (`Send` but `!Sync`) there are -- to Rust
programmers well-known -- cell types, but they have little to no
counterpart in C, so I present a different example: the `Receiver` [4]
of the multiple-producer-single-consumer channel of std. Since there is
only supposed to be one receiver thread, the receiver type cannot be
cloned and it must not be shared, hence it implements `!Sync`. But
you're still allowed to move the ownership of receiving into another
thread and thus that type is `Send`.

Another examples is `Rc<T>` [5], a non-atomically reference counted
smart pointer. It implements neither `Send` nor `Sync`. It must not be
`Send`, because if it were, then the non-atomicity of the reference
count would be a problem. It also must not be `Sync`, since one
increment the refcount using a shared reference and that is again a
problem. So if one knows that a value is only used by one thread, then
`Rc<T>` is a more performant option over `Arc<T>` (the atomic refcounted
smart pointer).



Now to discuss what `Send` and `Sync` (could) mean in the kernel. One
current usage that I already mentioned is that they prevent unlocking a
mutex on a different thread than where it was locked. I do not know what
"thread" would be in this case other than the abstract definition I gave
above. But I heard that interrupts might behave similarly to user-space
threads in that you're not allowed to release/lock a lock on one that
was/is locked/released in normal execution context on the same CPU (no
idea if this is actually true, I might be misremembering here).
Another location where we're also using `Send` already is the workqueue.
If you take a look at the `enqueue` [6] function, then you will notice
the `Send` type bound in the function signature. It ensures that
whatever values sent to the code executed in the workqueue have to be
`Send`.
Timers will be another example: if you look at the upcoming hrtimer
abstractions by Andreas [7], then you can find a `Sync` bound in the
`HrTimerPointer` trait. So timers will only have shared access to values
that can be shared between threads.

The safest approach (and IIRC the one that we're currently pursuing) to
the meaning of `Send` and `Sync` is to just be very strict about what is
considered the same thread. That also allows us to always use `Send` and
`Sync` in cases where we're unsure if a value should be allowed to be
shared with/moved into another context. This is not going to result in
any memory issues, as we are essentially forbidding everything except
the most obvious things that are OK, but it might lead to missing
functionality/pain when implementing something.
I don't believe that there will be many thread definition where we
decide that they don't constitute a different "thread" in the sense of
`Send`/`Sync`, but that's just my intuition. Maybe I am wrong and there
is something that could technically be considered a different thread,
but it doesn't make sense to e.g. forbid moving a mutex there, since
it's fine.

Lastly, I want to try to bikeshed the name "thread", as clearly, we're
missing a proper term here. I have seen some people use CPU, execution
context and others that I forgot, but I never heard one that was as
satisfactory as I find "thread". At least that's my user-space
perspective, since to you "thread" could mean kernel-thread or
user-space-thread (and maybe more?). I don't like CPU, since interrupts
might happen on the same CPU, but would have to be considered a
different thread. And execution context also seems wrong, since I
associate that with the state of preemption, so atomic context.
Maybe "abstract thread" fits the concept best, but I don't like the fact
that it still contains the word thread.

[1]: https://doc.rust-lang.org/std/thread/fn.spawn.html
[2]: https://doc.rust-lang.org/std/sync/struct.MutexGuard.html
[3]: https://rust.docs.kernel.org/kernel/sync/lock/struct.Guard.html
[4]: https://doc.rust-lang.org/std/sync/mpsc/struct.Receiver.html
[5]: https://doc.rust-lang.org/std/rc/struct.Rc.html
[6]: https://rust.docs.kernel.org/kernel/workqueue/struct.Queue.html#method=
.enqueue
[7]: https://lore.kernel.org/rust-for-linux/20250203-hrtimer-v3-v6-12-rc2-v=
7-0-189144725399@kernel.org/

[^a]: Note that references (i.e. `&T`) implement `Copy`, so they are
      automatically cloned and thus sending one to another thread
      doesn't entail giving up on it yourself.

[^b]: People knowledgable in Rust might pause here, since they still are
      special in a different sense, as they are auto traits. But that
      has nothing to do with their meaning, so one can just disregard
      that specialty.

---
Cheers,
Benno

