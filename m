Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AFCB382;
	Fri, 30 May 2025 21:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748640439; cv=none; b=uHu/MwmpbCAahdaOdqNk5CwfXpUxoA+rj/Zoskl2FD5+sHliAmchXhpF77QXffQgfudCk1tGMu2THfmTMkePweq1O3vFC9TlNDGhhiQcOgMxep4B39NW1IoFXgLJK9PbC4lfkm+C0fXAhUg3XkYjRZaVgoYH/FEiKbJZ/htsm4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748640439; c=relaxed/simple;
	bh=hzQW+sz/putkzGGC1OXXuHlYUfULyn+QPuxXibe587o=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=AtFRSmp6f2MmFQ4rBtyjr2XHPNzvlF8fsmA11YY3uVtoW+ozOLNkm3JXF2q7iZEj6MDk5rrZQYtVjKzk08dr3y3Rdpk25rNyNxTjed/O7MYSrdOntNEZldC4XP/RDUm+1rItNMS10yFTk000UVsgCxQ2lRrxhDrFN15FM49AxSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hvDqYrzr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hvDqYrzr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1964DC4CEE9;
	Fri, 30 May 2025 21:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748640439;
	bh=hzQW+sz/putkzGGC1OXXuHlYUfULyn+QPuxXibe587o=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=hvDqYrzr+lwSZZ1zRqKF289DxEmlR8v33ukpMBbXy+4GHR3HpGk0RISTZ8itkBn86
	 vdLeiD8rFppVPDTPkuX57rPqT4k/qAu05B01T0fNehQvrInEZ74XGtyL3ylxTKzmhl
	 X4EfEMZ+REMtXfL6Dl38b+Pb2/k9xX1uhktU9+tUuGpXoORm9x/EqZ0N2/N+CRd81F
	 fXzHz08xRci1aL1DTLl+06jshqfJPgpvS7M9mD6rl5Vmg9SfMngnR0guJ4xbvA432l
	 dEpXNIglgqT4OVdPO+7wCZkTkbrsWtdeykZoFlOcU/e/Z4h0vpfHwG62jd531bMlkx
	 PzdQPR373zwxw==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 30 May 2025 23:27:14 +0200
Message-Id: <DA9TATN3QCAW.3V5G2YL8OV23P@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/7] rust: types: support fallible PinInit types in
 Opaque::pin_init
From: "Benno Lossin" <lossin@kernel.org>
To: "Christian Schrefl" <chrisi.schrefl@gmail.com>, "Danilo Krummrich"
 <dakr@kernel.org>, <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
 <ojeda@kernel.org>, <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <benno.lossin@proton.me>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>
X-Mailer: aerc 0.20.1
References: <20250530142447.166524-1-dakr@kernel.org>
 <20250530142447.166524-2-dakr@kernel.org>
 <DA9QST4SISFK.37NSCTH594NSF@kernel.org>
 <6dfafb34-8b85-4f54-9453-c39297d1f851@gmail.com>
In-Reply-To: <6dfafb34-8b85-4f54-9453-c39297d1f851@gmail.com>

On Fri May 30, 2025 at 10:11 PM CEST, Christian Schrefl wrote:
> On 30.05.25 9:29 PM, Benno Lossin wrote:
>> On Fri May 30, 2025 at 4:24 PM CEST, Danilo Krummrich wrote:
>>> -    pub fn pin_init(slot: impl PinInit<T>) -> impl PinInit<Self> {
>>> -        Self::ffi_init(|ptr: *mut T| {
>>> +    pub fn pin_init<E>(slot: impl PinInit<T, E>) -> impl PinInit<Self,=
 E> {
>>> +        Self::try_ffi_init(|ptr: *mut T| -> Result<(), E> {
>>>              // SAFETY:
>>>              //   - `ptr` is a valid pointer to uninitialized memory,
>>> -            //   - `slot` is not accessed on error; the call is infall=
ible,
>>> +            //   - `slot` is not accessed on error,
>>>              //   - `slot` is pinned in memory.
>>> -            let _ =3D unsafe { PinInit::<T>::__pinned_init(slot, ptr) =
};
>>> +            unsafe { PinInit::<T, E>::__pinned_init(slot, ptr) }
>>=20
>> Could you move this function into an `impl pin_init::Wrapper<T>` block?
>> (it's the same function, but in a trait that was recently added)
>
> This is then basically this patch [0] from my `UnsafePinned` series.
> Just that I did not update the comment. :)
>
> [0]: https://lore.kernel.org/rust-for-linux/20250511-rust_unsafe_pinned-v=
4-2-a86c32e47e3d@gmail.com/=20

Oh yeah, I completely forgot we had this... I even reviewed it haha!

---
Cheers,
Benno
