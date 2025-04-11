Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8EF1F30B3
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 14:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744380892; cv=none; b=OFjzbMTR4M7ddm8gxa5wMxoFxAu1YwdWfgfhf7I+qhPz3L+92Q87HIGpZSJ/3rfah6nGJzyM6U33QQDmXpFlPCtxq1U+awPLiVGrq7bM13Znk6RxSAflNm5AlE5l18PrR45ndZrcyA5KzJNAQLhIEUybAj1UDtWfQ/swNW+JSgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744380892; c=relaxed/simple;
	bh=3I/jo4GVACXTfj3jcxaqe6QYqUY4G0brexzhnK0ZACQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N4oiIP3pSO8tsGyLG0XkbL55jmxEC5O4MNEheQxzIt0qRV4b8S7uakqi+nRQKvYJdchWf62cHU4jBGEkkQsoWTBusvPXxDodpn7ApspckZyckwnln+FPLWKN9DMTjBC3TgZ+HhfEWR/MN7kZK7PxQtemarGLnIB3m1k74xlRQtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3Vq6il/s; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3Vq6il/s"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-39727fe912cso970930f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 07:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744380888; x=1744985688; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KXMGF02aLSnVhhQjfgbwPODzDlrVvGFax9i6l7P95zQ=;
        b=3Vq6il/sCVD5ZKXiwUv+117yMDTw/VyqFHjMo8Mo/xhN81MZnac0O6UPv0LG/zZZzu
         qtp+f2IcAb73rselEvAG0EJUWXYD0in3jWUftxo6ls+332W6OtE35eVw/QH1B8ZGq9UG
         17PGVdMMwMBSJmYdfYv+cFyYRyqy5H7wpfnIodAId/6d6ZNm8YC5gBWGNWhy/ntXqzw8
         2zklx+jZCClTvAUtjwjM9BqrRQcx4o5Lv1i9iI6yelghgLAiOylCf5ZkuH0G4YsseFEg
         S7hChU1ELbv42HCK9bs8YpcJRG+MzyrXQP1kuQmL56ZPhmkp5baJOPc/MT1ySOZy5via
         Y2vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744380888; x=1744985688;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KXMGF02aLSnVhhQjfgbwPODzDlrVvGFax9i6l7P95zQ=;
        b=f+MUOQkMMN3DU00xQgVJOgZHloaX+RH7Rcp9WXxLuS8qFaRTHAQm+O1a1phhlolywV
         NZtpQ+Wt4Uq34/xkG4HgbOq6vYfEcliEJWQI2gr7itFbYRw7DiF+d9fGmHo6QX+0wLRP
         w4ajPT8QHqFoc7I5PDXL4gZIcMHCYo4w6S9rBa9D2CAXkcVneddBvUnbjTXuhP1v39tf
         8is2DNh23pTn9h2Tez3igKVNF6Q6+IzoooKRdawxBSNzhPM/kLiNGxR1ggwitn2vtNIN
         fhWw3ZiQgw2cWny1pfptJ7q0FaBHQ70ZEfdQunjR0rdqmZ5X8CuqbMpTIsTGM5pjRSkW
         agYw==
X-Forwarded-Encrypted: i=1; AJvYcCXHcURYHiiAgvahZUSEvf4/m6m9NjaednfiLfWNDP6qfx+Ca/na+yrVrz5LzwSI2z+ksf0A6uzGgDLax9Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjyHn04DUxa6r7dNam+ioiQ3KfP4Xonz7ELAR4kn0oUG38RAWM
	ZFx1aYjg37gSZ6jFgdWyPMSzg/2DjJ6bbmLevyCFtMgUi7bUgT9tBFYv3ATVvDm3KFhcNHwqFBE
	+jIT4VYgYxbtnosWOOxZms+JxOOfRcmawSqdz
X-Gm-Gg: ASbGncsVQxB/XhOJQ6SorU7SQ2e6Z6iRYUHqAoyd4BQNfO7dVQFC+/uf7fWzNde9aom
	VM5ZXdYFJ5wdDAbvu5CnP3FRkgvLIybp8l8omHlw/9nhM0kMswSgVjK5nciT0m0zThHKzoz0s9e
	2DWBWCcenObEuHlwgUA0u4GilQ+K+KT2s7HQ==
X-Google-Smtp-Source: AGHT+IEvfllzR2JPfvaVSPMfFR259rJ0LInD1vvPV1cUQw8WY9tKKwVRF8+YuZkXX5HFgCCrO2dQv4csvUmAfS+p+8c=
X-Received: by 2002:a05:6000:144f:b0:38d:dffc:c133 with SMTP id
 ffacd0b85a97d-39eaaebc5c4mr2768779f8f.44.1744380888247; Fri, 11 Apr 2025
 07:14:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250411-no-offset-v3-1-c0b174640ec3@gmail.com>
In-Reply-To: <20250411-no-offset-v3-1-c0b174640ec3@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 11 Apr 2025 16:14:35 +0200
X-Gm-Features: ATxdqUGt2HpUIhfbszKbRnHcJkw44XStGlH5K6VgtPiPDEF_Tvxme1ItV2cYEZU
Message-ID: <CAH5fLgg6_U4OAnDXy1eM98ur=MZonnDq3tk2o=KAf+YXNPtBbQ@mail.gmail.com>
Subject: Re: [PATCH v3] rust: workqueue: remove HasWork::OFFSET
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Bjorn Helgaas <bhelgaas@google.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 11, 2025 at 4:08=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> Implement `HasWork::work_container_of` in `impl_has_work!`, narrowing
> the interface of `HasWork` and replacing pointer arithmetic with
> `container_of!`. Remove the provided implementation of
> `HasWork::get_work_offset` without replacement; an implementation is
> already generated in `impl_has_work!`. Remove the `Self: Sized` bound on
> `HasWork::work_container_of` which was apparently necessary to access
> `OFFSET` as `OFFSET` no longer exists.
>
> A similar API change was discussed on the hrtimer series[1].
>
> Link: https://lore.kernel.org/all/20250224-hrtimer-v3-v6-12-rc2-v9-1-5bd3=
bf0ce6cc@kernel.org/ [1]
> Reviewed-by: Benno Lossin <benno.lossin@proton.me>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Tested-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Seems reasonable enough.
Reviewed-by: Alice Ryhl <aliceryhl@google.com>

> ---
> Changes in v3:
> - Extract first commit to its own series as it is shared with other
>   series.
> - Reword `HasWork` safety comment.
> - Link to v2: https://lore.kernel.org/r/20250409-no-offset-v2-0-dda8e141a=
909@gmail.com
>
> Changes in v2:
> - Rebase on v6.15-rc1.
> - Add WORKQUEUE maintainers to cc.
> - Link to v1: https://lore.kernel.org/r/20250307-no-offset-v1-0-0c728f63b=
69c@gmail.com
> ---
>  rust/kernel/workqueue.rs | 50 ++++++++++++++++--------------------------=
------
>  1 file changed, 17 insertions(+), 33 deletions(-)
>
> diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
> index f98bd02b838f..d092112d843f 100644
> --- a/rust/kernel/workqueue.rs
> +++ b/rust/kernel/workqueue.rs
> @@ -429,51 +429,28 @@ pub unsafe fn raw_get(ptr: *const Self) -> *mut bin=
dings::work_struct {
>  ///
>  /// # Safety
>  ///
> -/// The [`OFFSET`] constant must be the offset of a field in `Self` of t=
ype [`Work<T, ID>`]. The
> -/// methods on this trait must have exactly the behavior that the defini=
tions given below have.
> +/// The methods [`raw_get_work`] and [`work_container_of`] must return v=
alid pointers and must be
> +/// true inverses of each other; that is, they must satisfy the followin=
g invariants:
> +/// - `work_container_of(raw_get_work(ptr)) =3D=3D ptr` for any `ptr: *m=
ut Self`.
> +/// - `raw_get_work(work_container_of(ptr)) =3D=3D ptr` for any `ptr: *m=
ut Work<T, ID>`.
>  ///
>  /// [`impl_has_work!`]: crate::impl_has_work
> -/// [`OFFSET`]: HasWork::OFFSET
> +/// [`raw_get_work`]: HasWork::raw_get_work
> +/// [`work_container_of`]: HasWork::work_container_of
>  pub unsafe trait HasWork<T, const ID: u64 =3D 0> {
> -    /// The offset of the [`Work<T, ID>`] field.
> -    const OFFSET: usize;
> -
> -    /// Returns the offset of the [`Work<T, ID>`] field.
> -    ///
> -    /// This method exists because the [`OFFSET`] constant cannot be acc=
essed if the type is not
> -    /// [`Sized`].
> -    ///
> -    /// [`OFFSET`]: HasWork::OFFSET
> -    #[inline]
> -    fn get_work_offset(&self) -> usize {
> -        Self::OFFSET
> -    }
> -
>      /// Returns a pointer to the [`Work<T, ID>`] field.
>      ///
>      /// # Safety
>      ///
>      /// The provided pointer must point at a valid struct of type `Self`=
.
> -    #[inline]
> -    unsafe fn raw_get_work(ptr: *mut Self) -> *mut Work<T, ID> {
> -        // SAFETY: The caller promises that the pointer is valid.
> -        unsafe { (ptr as *mut u8).add(Self::OFFSET) as *mut Work<T, ID> =
}
> -    }
> +    unsafe fn raw_get_work(ptr: *mut Self) -> *mut Work<T, ID>;
>
>      /// Returns a pointer to the struct containing the [`Work<T, ID>`] f=
ield.
>      ///
>      /// # Safety
>      ///
>      /// The pointer must point at a [`Work<T, ID>`] field in a struct of=
 type `Self`.
> -    #[inline]
> -    unsafe fn work_container_of(ptr: *mut Work<T, ID>) -> *mut Self
> -    where
> -        Self: Sized,
> -    {
> -        // SAFETY: The caller promises that the pointer points at a fiel=
d of the right type in the
> -        // right kind of struct.
> -        unsafe { (ptr as *mut u8).sub(Self::OFFSET) as *mut Self }
> -    }
> +    unsafe fn work_container_of(ptr: *mut Work<T, ID>) -> *mut Self;
>  }
>
>  /// Used to safely implement the [`HasWork<T, ID>`] trait.
> @@ -504,8 +481,6 @@ macro_rules! impl_has_work {
>          // SAFETY: The implementation of `raw_get_work` only compiles if=
 the field has the right
>          // type.
>          unsafe impl$(<$($generics)+>)? $crate::workqueue::HasWork<$work_=
type $(, $id)?> for $self {
> -            const OFFSET: usize =3D ::core::mem::offset_of!(Self, $field=
) as usize;
> -
>              #[inline]
>              unsafe fn raw_get_work(ptr: *mut Self) -> *mut $crate::workq=
ueue::Work<$work_type $(, $id)?> {
>                  // SAFETY: The caller promises that the pointer is not d=
angling.
> @@ -513,6 +488,15 @@ unsafe fn raw_get_work(ptr: *mut Self) -> *mut $crat=
e::workqueue::Work<$work_typ
>                      ::core::ptr::addr_of_mut!((*ptr).$field)
>                  }
>              }
> +
> +            #[inline]
> +            unsafe fn work_container_of(
> +                ptr: *mut $crate::workqueue::Work<$work_type $(, $id)?>,
> +            ) -> *mut Self {
> +                // SAFETY: The caller promises that the pointer points a=
t a field of the right type
> +                // in the right kind of struct.
> +                unsafe { $crate::container_of!(ptr, Self, $field) }
> +            }
>          }
>      )*};
>  }
>
> ---
> base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
> change-id: 20250307-no-offset-e463667a72fb
> prerequisite-change-id: 20250409-container-of-mutness-b153dab4388d:v1
> prerequisite-patch-id: 53d5889db599267f87642bb0ae3063c29bc24863
>
> Best regards,
> --
> Tamir Duberstein <tamird@gmail.com>
>
