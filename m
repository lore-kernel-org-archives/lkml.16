Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0859A1F4CAB;
	Thu, 12 Jun 2025 08:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749718077; cv=none; b=aU7modrsOIBnRmDR6AqIftZyF3MgzU4LUq9Jrd5XaYQ2ZLg4LHaqZjQqcUbqTKXF40s2/+s94nBdKbHm6YMXIq2FrS7fUAfblT/WG5occyDUeBrgTBDNkYjUth4spEGi65eksNsDRQTZKmisQNmR97VoQleR5lESxBKuUSnBPAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749718077; c=relaxed/simple;
	bh=GueOvweik3rNbhheZCa910uQPXb79aqCUMGeUSjUtHs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=FtiJ0ELeaQxYW13ySZNtU/x+6IYGD6qza/YVxh3fw/sEIKXCUNVyeBTlAMrYqYRkCCnqB/vjwFXzXeU2YXGdFmibXrbpIieH5UMG5RrvEJwHLy1sxFPzDa+xjg7XadwF6S5tSg/gDyF7D67ZdNJMmGMSMoojzBI9PeKmAJxyX7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X8UmPG2x; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X8UmPG2x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B94A7C4CEEA;
	Thu, 12 Jun 2025 08:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749718076;
	bh=GueOvweik3rNbhheZCa910uQPXb79aqCUMGeUSjUtHs=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=X8UmPG2xp5OL9kkQ5BBbWTfTyjSXDNGTAHEBALa0lmjbls9NmFXbXH82YRc5AFfUg
	 ctoK7FCb9O9YkXx+fshddAfWTV3DS6GB06jyBjTYakd7NqwP5/0l11Wi//lkIxf2OK
	 GZVlWgmc/piJJFKuHi8HNFDvaCfohNmRFyKl0+jLj+S3b/iyoGJXoWgAIYxvjRswgW
	 cgslof9HXZC6Dk83wVym4JNigrL5Z0YKzNDrjeFSpP/f35763IVaCBSBDg/r6Xyk7E
	 t7lNE6tg5Oi+MWGEHwzgVIpFtPBETa/eV5K3fRDkwYg1qVoZ9kwFybHbEq4IFJQhTT
	 mgC2Rp/+l4N5g==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Jun 2025 10:47:51 +0200
Message-Id: <DAKFAHGCNE8N.G1RH5X4QD8MW@kernel.org>
Cc: "Danilo Krummrich" <dakr@kernel.org>, <gregkh@linuxfoundation.org>,
 <rafael@kernel.org>, <ojeda@kernel.org>, <alex.gaynor@gmail.com>,
 <boqun.feng@gmail.com>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
 <benno.lossin@proton.me>, <a.hindborg@kernel.org>, <tmgross@umich.edu>,
 <chrisi.schrefl@gmail.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] rust: devres: fix race in Devres::drop()
From: "Benno Lossin" <lossin@kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
X-Mailer: aerc 0.20.1
References: <20250603205416.49281-1-dakr@kernel.org>
 <20250603205416.49281-4-dakr@kernel.org>
 <DAKEK5YPNCAU.3LQGI98GGG4KF@kernel.org>
 <CAH5fLgharxhAHrP6OFZxXrWKSTsMp=vY5sGvUKzca3yhRJEW7A@mail.gmail.com>
In-Reply-To: <CAH5fLgharxhAHrP6OFZxXrWKSTsMp=vY5sGvUKzca3yhRJEW7A@mail.gmail.com>

On Thu Jun 12, 2025 at 10:15 AM CEST, Alice Ryhl wrote:
> On Thu, Jun 12, 2025 at 10:13=E2=80=AFAM Benno Lossin <lossin@kernel.org>=
 wrote:
>> On Tue Jun 3, 2025 at 10:48 PM CEST, Danilo Krummrich wrote:
>> > In Devres::drop() we first remove the devres action and then drop the
>> > wrapped device resource.
>> >
>> > The design goal is to give the owner of a Devres object control over w=
hen
>> > the device resource is dropped, but limit the overall scope to the
>> > corresponding device being bound to a driver.
>> >
>> > However, there's a race that was introduced with commit 8ff656643d30
>> > ("rust: devres: remove action in `Devres::drop`"), but also has been
>> > (partially) present from the initial version on.
>> >
>> > In Devres::drop(), the devres action is removed successfully and
>> > subsequently the destructor of the wrapped device resource runs.
>> > However, there is no guarantee that the destructor of the wrapped devi=
ce
>> > resource completes before the driver core is done unbinding the
>> > corresponding device.
>> >
>> > If in Devres::drop(), the devres action can't be removed, it means tha=
t
>> > the devres callback has been executed already, or is still running
>> > concurrently. In case of the latter, either Devres::drop() wins revoki=
ng
>> > the Revocable or the devres callback wins revoking the Revocable. If
>> > Devres::drop() wins, we (again) have no guarantee that the destructor =
of
>> > the wrapped device resource completes before the driver core is done
>> > unbinding the corresponding device.
>>
>> I don't understand the exact sequence of events here. Here is what I got
>> from your explanation:
>>
>> * the driver created a `Devres<T>` associated to their device.
>> * their physical device gets disconnected and thus the driver core
>>   starts unbinding the device.
>> * simultaneously, the driver drops the `Devres<T>` (eg because the
>>   driver initiated the physical removal)
>> * now `devres_callback` is being called from both `Devres::Drop` (which
>>   calls `Devres::remove_action`) and from the driver core.
>> * they both call `inner.data.revoke()`, but only one wins, in our
>>   example `Devres::drop`.
>> * but now the driver core has finished running `devres_callback` and
>>   finalizes unbinding the device, even though the `Devres` still exists
>>   though is almost done being dropped.
>>
>> I don't see a race here. Also the `dev: ARef<Device>` should keep the
>> device alive until the `Devres` is dropped, no?
>
> The race is that Devres is used when the contents *must* be dropped
> before the device is unbound. This example violates that by having
> device unbind finish before the contents are dropped.

If `Devres::drop` is being run, nobody has access to it any longer.
Additionally, the data in the revocable has already been dropped if
`revoke()` has been run, so it's fine?

---
Cheers,
Benno
