Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160E91F8753;
	Thu, 12 Jun 2025 10:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749725947; cv=none; b=qi4tfnW3QwLadL7TUFMZD7/HAw+0sYMcux+dJMMvcmb6WBBCjjlFHGVEgn16GYvdROczdDNvHMo4phg31enB46SXWK0U7XPqiuMyyLr7HC3AD3D2oQjbAr7lxCkqZh8o8OsrQgY1D3d7ke7jfBV/0V8OWTRSVpnK2EXaqvmMZyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749725947; c=relaxed/simple;
	bh=vMAHfjlbjHixSu0ohBbA7Gb1WT9CoTHqU3ZgKBp+b1k=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=QA7w9g0Lkn4E+PRIDMPcVyzDJxvshMd5W5ii7pqn8uxUylmxzy/vdlFfIBlYArF1HYN1S/xjm5b86da9MTZDFzWDDwUZ8wGCzfupjsAsjsazdDRWxMpDkGvX76VrNYhfBHYp6KAkWhme3zo6FRAGjRSqHdW67WN0fpwZSQKfncg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ul7CbOTm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ul7CbOTm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B73FBC4CEEA;
	Thu, 12 Jun 2025 10:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749725946;
	bh=vMAHfjlbjHixSu0ohBbA7Gb1WT9CoTHqU3ZgKBp+b1k=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=Ul7CbOTmVY4o107i+RctimItI8ys3hweW9W3pUlYP3CUBmoFtP6vPxvFrs6sk8x85
	 jLJmb20rQO0pT0itvAzoQe1Zt+oGY8ckLtPmKz380DZImoEiX8GAMFSVkx2lh/QHJT
	 Bmq7e+N1r9q6Z+wfXWJkWsNxQUcN8L+7l8hSOiu6H1jYkJo/8QRczM51DyWxb+OL+X
	 icJGwrDzXA7txgNgrU3v1ZI0/8DYVXyMWWRrgq1XPWMAzBmvLdYdYJjPVPmrXdt8/m
	 bNjsJW49DM89EBrZuemDVYXLDqaDoq+OChl76EHQyavwONPfVDTuanoJoFMkSmu2x4
	 5XrGMjGju5sjg==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Jun 2025 12:59:02 +0200
Message-Id: <DAKI2X0JAMD8.3763Z96W10VZP@kernel.org>
Cc: <gregkh@linuxfoundation.org>, <rafael@kernel.org>, <ojeda@kernel.org>,
 <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <benno.lossin@proton.me>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
 <chrisi.schrefl@gmail.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] rust: devres: fix race in Devres::drop()
From: "Benno Lossin" <lossin@kernel.org>
To: "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250603205416.49281-1-dakr@kernel.org>
 <20250603205416.49281-4-dakr@kernel.org>
 <DAKEK5YPNCAU.3LQGI98GGG4KF@kernel.org> <aEqrY3fEWGKl8rf2@pollux>
In-Reply-To: <aEqrY3fEWGKl8rf2@pollux>

On Thu Jun 12, 2025 at 12:26 PM CEST, Danilo Krummrich wrote:
> On Thu, Jun 12, 2025 at 10:13:29AM +0200, Benno Lossin wrote:
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
>>=20
>> I don't understand the exact sequence of events here. Here is what I got
>> from your explanation:
>>=20
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
>
> Your "almost done being dropped" is close, actually Devres::drop() may or=
 may
> not be done calling Revocable::revoke(), i.e. drop_in_place() of the data=
.
>
> CPU0						CPU1
>
> Devres::drop() {				devres_callback() {
> 	self.data.revoke() {				this.data.revoke() {
> 		is_available.swap() =3D=3D true
> 								is_available.swap =3D=3D false
> 							}
> 						}
>
> 						// [...]
> 						// driver fully unbound
> 		drop_in_place() {
> 			pci_iounmap()
> 			pci_release_region()
> 		}
> 	}
> }

Ahh I missed that the splitting point could be inside of `revoke`.

What are those `pci_iounmap` and `pci_release_region` calls? Ah maybe
they are from a `T` that expects the driver to still be bound when it is
being dropped? That would make a lot of sense.

If I'm correct, do you mind adding the above example execution to the
commit message? Including the information that the type `T` is allowed
to expect that the driver is still bound while being dropped. That would
make it obvious to me what the issue is.

> This means that we have to ensure that the revoke() in Devres::drop() is
> completed before devres_callback() completes, in case they race.

Agreed :)

---
Cheers,
Benno
