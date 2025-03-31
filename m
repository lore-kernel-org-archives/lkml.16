Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF21E1DE3BE;
	Mon, 31 Mar 2025 22:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743460552; cv=pass; b=GclLbCbMoaLxMRKHkk24Sf8BzkJElg3zRDYoogu4Mx0aAn8nqdSiNrbmKniufaQZwq6wc6328Zib7ph1oRU6SucZzpQtDTrcJd5pAb5IvK9cPrwzZFjPJPERi5aHd5N1vG4v9qqDJokcTKfNh109hCd78zy2fH0fp2gVCOmmV6U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743460552; c=relaxed/simple;
	bh=CxAxPDZ5Yt8xLBwYUA5+ikXJ/5H9zBfzuEnXUkl1tqo=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=PoKri+UabSFyiP8lt+j/kl4VDaY+zf2wx6nk8vkr5/sh0ReCgW8+3RGWvLRbSMod0/otfcfeR3XB4Iarc/JKguE0ngIKG8G7fQJGfTgRkbW7dQE/3kKvgj1V3oZ/y2+8ZZr/EEdFLnkToWmOQPzxFvvw65ryj3UVU85fQtxSVjo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=UHkZdidX; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="UHkZdidX"
ARC-Seal: i=1; a=rsa-sha256; t=1743460522; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=exVukdtysCb5OXZTJgDGh4+oDDujkcNrn2kXT1QUGD9SxY6zmaXnrIP5EAZx2vCJssUrmfRKkZPh6yGdlooVCD8H8pjv6ZiMf5JLsdzOSiSTvyj8wS/4fyhEfcRF4K5MGPtnrv1S9/elYm8u8nkty/wWjqNdziqIuOmfdbPdm7I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1743460522; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=2msDgzabCeuIJDum9dR+ovgiMk1K6LSZBK/IDwpF0IM=; 
	b=gn4onwP/SLLeXdcxEwvNINxu1E699ou+coo0xKi2oqK/rtI1dYav20bFtYC26rtbkJohdjhHZ6hj/YOqSIN5RL8o9D4INhTXCeL6rIOdCjmxWZAVochBbGViLsMZv/IjPCbxWjWZcAxJQFH5mv4keXMxcv5xAG1L9vgfcE+XCyo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1743460522;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=2msDgzabCeuIJDum9dR+ovgiMk1K6LSZBK/IDwpF0IM=;
	b=UHkZdidX22fcA7ORTQKmRLT44Q3veQ+m2kF1kL3klqywreREPaijYtMe2RkQvPv3
	3gQv/vjigf1ldrmY6qZdloWPFu53v2+Ye4fJGo5TIEO3KcfzafWRtBgITpHC7Ay0PaD
	XJAHWweZ9d5+7POaMiDUEWflBeyFIYDfZ+4qf9fM=
Received: by mx.zohomail.com with SMTPS id 1743460518368106.31940124900552;
	Mon, 31 Mar 2025 15:35:18 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: [PATCH v2] rust: add new macro for common bitmap operations
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <ca81003c84618e7f8e73f777b9aa6576ffcc03e1.camel@redhat.com>
Date: Mon, 31 Mar 2025 19:35:02 -0300
Cc: Filipe Xavier <felipeaggger@gmail.com>,
 Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 rust-for-linux@vger.kernel.org,
 felipe_life@live.com,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <16B126B0-DC90-480C-80F5-93EE9F922C71@collabora.com>
References: <20250325-feat-add-bitmask-macro-v2-1-d3beabdad90f@gmail.com>
 <ca81003c84618e7f8e73f777b9aa6576ffcc03e1.camel@redhat.com>
To: Lyude Paul <lyude@redhat.com>
X-Mailer: Apple Mail (2.3826.400.131.1.6)
X-ZohoMailClient: External

Hi Lyude,

> On 31 Mar 2025, at 19:29, Lyude Paul <lyude@redhat.com> wrote:
>=20
> Sorry this took me a while to get back to, last week was a bit hectic. =
I
> realized there's a couple of changes we still need to make here (in =
addition
> to the other ones mentioned on the mailing list):
>=20
> On Tue, 2025-03-25 at 10:10 -0300, Filipe Xavier wrote:
>> We have seen a proliferation of mod_whatever::foo::Flags
>> being defined with essentially the same implementation
>> for BitAnd, BitOr, contains and etc.
>>=20
>> This macro aims to bring a solution for this,
>> allowing to generate these methods for user-defined structs.
>> With some use cases in KMS and VideoCodecs.
>>=20
>> Small use sample:
>> `
>> const READ: Permission =3D Permission(1 << 0);
>> const WRITE: Permission =3D Permission(1 << 1);
>>=20
>> impl_flags!(Permissions, Permission, u32);
>>=20
>> let read_write =3D Permissions::from(READ) | WRITE;
>> let read_only =3D read_write & READ;
>> `
>>=20
>> Link: =
https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General/topic/=
We.20really.20need.20a.20common.20.60Flags.60.20type
>> Signed-off-by: Filipe Xavier <felipeaggger@gmail.com>
>> Suggested-by: Daniel Almeida <daniel.almeida@collabora.com>
>> Suggested-by: Lyude Paul <lyude@redhat.com>
>> ---
>> Changes in v2:
>> - rename: change macro and file name to impl_flags.
>> - negation sign: change char for negation to `!`.=20
>> - transpose docs: add support to transpose user provided docs.
>> - visibility: add support to use user defined visibility.
>> - operations: add new operations for flag,=20
>> to support use between bit and bitmap, eg: flag & flags.
>> - code style: small fixes to remove warnings.
>> - Link to v1: =
https://lore.kernel.org/r/20250304-feat-add-bitmask-macro-v1-1-1c2d2bcb476=
b@gmail.com
>> ---
>> rust/kernel/impl_flags.rs | 214 =
++++++++++++++++++++++++++++++++++++++++++++++
>> rust/kernel/lib.rs        |   1 +
>> rust/kernel/prelude.rs    |   1 +
>> 3 files changed, 216 insertions(+)
>>=20
>> diff --git a/rust/kernel/impl_flags.rs b/rust/kernel/impl_flags.rs
>> new file mode 100644
>> index =
0000000000000000000000000000000000000000..e7cf00e14bdcd2acea47b8c158a984ac=
0206568b
>> --- /dev/null
>> +++ b/rust/kernel/impl_flags.rs
>> @@ -0,0 +1,214 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +//! impl_flags utilities for working with flags.
>> +
>> +/// Declares a impl_flags type with its corresponding flag type.
>> +///
>> +/// This macro generates:
>> +/// - Implementations of common bitmask operations ([`BitOr`], =
[`BitAnd`], etc.).
>> +/// - Utility methods such as `.contains()` to check flags.
>> +///
>> +/// # Examples
>> +///
>> +/// Defining and using impl_flags:
>> +///
>> +/// ```
>> +/// impl_flags!(
>> +///     /// Represents multiple permissions.
>> +///     pub Permissions,
>> +///     /// Represents a single permission.
>> +///     pub Permission,
>> +///     u32
>> +/// );
>> +///
>> +/// // Define some individual permissions.
>> +/// const READ: Permission =3D Permission(1 << 0);
>> +/// const WRITE: Permission =3D Permission(1 << 1);
>> +/// const EXECUTE: Permission =3D Permission(1 << 2);
>> +///
>> +/// // Combine multiple permissions using operation OR (`|`).
>> +/// let read_write =3D Permissions::from(READ) | WRITE;
>> +///
>> +/// assert!(read_write.contains(READ));
>> +/// assert!(read_write.contains(WRITE));
>> +/// assert!(!read_write.contains(EXECUTE));
>> +///
>> +/// // Removing a permission with operation AND (`&`).
>> +/// let read_only =3D read_write & READ;
>> +/// assert!(read_only.contains(READ));
>> +/// assert!(!read_only.contains(WRITE));
>> +///
>> +/// // Toggling permissions with XOR (`^`).
>> +/// let toggled =3D read_only ^ Permissions::from(READ);
>> +/// assert!(!toggled.contains(READ));
>> +///
>> +/// // Inverting permissions with negation (`!`).
>> +/// let negated =3D !read_only;
>> +/// assert!(negated.contains(WRITE));
>> +/// ```
>> +#[macro_export]
>> +macro_rules! impl_flags {
>> +    (
>> +        $(#[$outer_flags:meta])* $vis_flags:vis $flags:ident,
>> +        $(#[$outer_flag:meta])* $vis_flag:vis $flag:ident,
>=20
> So we might want to make sure we have one of the other rfl folks look =
at this
> first but: ideally I'd like to be able to the type for an individual =
bitflag
> like this:
>=20
> /// An enumerator representing a single flag in [`PlaneCommitFlags`].
> ///
> /// This is a non-exhaustive list, as the C side could add more later.
> #[derive(Copy, Clone, PartialEq, Eq)]
> #[repr(u32)]
> #[non_exhaustive]
> pub enum PlaneCommitFlag {
>    /// Don't notify applications of plane updates for newly-disabled =
planes. Drivers are encouraged
>    /// to set this flag by default, as otherwise they need to ignore =
plane updates for disabled
>    /// planes by hand.
>    ActiveOnly =3D (1 << 0),
>    /// Tell the DRM core that the display hardware requires that a =
[`Crtc`]'s planes must be
>    /// disabled when the [`Crtc`] is disabled. When not specified,
>    /// [`AtomicCommitTail::commit_planes`] will skip the atomic =
disable callbacks for a plane if
>    /// the [`Crtc`] in the old [`PlaneState`] needs a modesetting =
operation. It is still up to the
>    /// driver to disable said planes in their =
[`DriverCrtc::atomic_disable`] callback.
>    NoDisableAfterModeset =3D (1 << 1),
> }
>=20
> It seems like we can pass through docs just fine, but could we get =
something
> to handle specifying actual discriminant values for the flag enum as =
well?
>=20

This should be possible, as the bitflags crate lets you do that in =
userspace. Their syntax is a bit different than what
we currently have in `impl_flags` though.

=E2=80=94 Daniel=
