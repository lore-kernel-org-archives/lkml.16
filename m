Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16BEC146585;
	Wed,  2 Jul 2025 18:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751479906; cv=pass; b=mOY83XYEB5x7gQ+XhT/7lto1whUxJMqDg+XHuf5Tl52Ln6rFO2qYQZy0k2QsrxFy8CHXUVpXYIgLp+sZm4tV5pIApv35/8CCLpZmb3SqDWktCAu7hpRqzg7HxeQzf4/4ZLzAW1LcVbDOg/yzRXo/9lN4igohRaO7ckf1ol6TNfc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751479906; c=relaxed/simple;
	bh=tv/bI3uTuyVQ+g6wAysqf+9+tzQP3Z7sZHo9xEMYJvw=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=AOTp2zm9L2TnkzPayHfwJTLea+JzlGGD5+u5c9fCkmzNv2jPXKxEAynIZrB6vBcqJD5RJgT4kD9DTO47EtrZArfy/d+nqjXhs7ojjSTSlWLLoWN6xif6TTJ6q9rDorfOtakFMPHdZFf87u59fT/Mn2F1KPFbsKxGZPm07/cvtXA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=ZGGyg/Vo; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="ZGGyg/Vo"
ARC-Seal: i=1; a=rsa-sha256; t=1751479884; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=CYIrjO6tnxNii7cg4P2V65xvhPVEJHvjUb38quB/ePmujXxNOTD6Hl0rEnWcLkCWTr2hzMucjwGysi2SVQlBC0aI4O3APWzgqnGvh8cpf7dSHYxSc4wUjSJWiSIcNLzIV7VVKFhDJ8xJNiztKb76BYEX84pikSjIK07HUMHxNBs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1751479884; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=hTb8Fi3EycrT6E3NVDJLj/JJFgB6mitJyYwFgj0GBOE=; 
	b=ePUlVjrwHS39yA+kJLU/RJ/G6OMs93CF2mFlrSLtyiSPWt2vjvQT0Eq0hsS16Gp7EjcLGfZtNbcohwGFONOAy3BRqDngTcEOLBOAd/HY4eeCVyQKMvIH+gAm1lVXnKoan5SRAiFGoFYBf/APpIlcvIjrccR4FGU+GxrdtFQ2o5M=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751479884;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=hTb8Fi3EycrT6E3NVDJLj/JJFgB6mitJyYwFgj0GBOE=;
	b=ZGGyg/Votg3U5e7Z432jNYCPWfxXH39iFnLNHnrpqyN84WHMB2b2aQ55k4qKx6Ol
	vV9sxqLdov7VgURKInAulHPiTBn+X4K9xeuu5Dlno/WrB0B3xx/Q80Uro5N9JylQXcd
	hf+PIY5pnkp7hrKUjXzGErmsnjQv5Hg83GKim/Lk=
Received: by mx.zohomail.com with SMTPS id 1751479881072827.7076739157039;
	Wed, 2 Jul 2025 11:11:21 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH v11 1/4] rust: io: add resource abstraction
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <6b8c65cc-d0cd-4022-8d8c-3a4aaf8d36e5@kernel.org>
Date: Wed, 2 Jul 2025 15:11:04 -0300
Cc: Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Ying Huang <huang.ying.caritas@gmail.com>,
 Benno Lossin <lossin@kernel.org>,
 linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org,
 Fiona Behrens <me@kloenk.dev>
Content-Transfer-Encoding: quoted-printable
Message-Id: <4DF66D6F-C89E-4472-AB76-B3EB1CB6F07C@collabora.com>
References: <20250701-topics-tyr-platform_iomem-v11-0-6cd5d5061151@collabora.com>
 <20250701-topics-tyr-platform_iomem-v11-1-6cd5d5061151@collabora.com>
 <6b8c65cc-d0cd-4022-8d8c-3a4aaf8d36e5@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
X-Mailer: Apple Mail (2.3826.600.51.1.1)
X-ZohoMailClient: External

Hi Danilo

> On 2 Jul 2025, at 07:21, Danilo Krummrich <dakr@kernel.org> wrote:
>=20
>> +#[cfg(CONFIG_HAS_IOPORT)]
>> +/// Returns a reference to the global `ioport_resource` variable.
>> +pub fn ioport_resource() -> &'static Resource {
>> +    // SAFETY: `bindings::ioport_resoure` has global lifetime and is =
of type Resource.
>> +    unsafe { Resource::as_ref(&raw mut bindings::ioport_resource) }
>> +}
>> +
>> +#[cfg(CONFIG_HAS_IOMEM)]
>> +/// Returns a reference to the global `iomem_resource` variable.
>> +pub fn iomem_resource() -> &'static Resource {
>> +    // SAFETY: `bindings::iomem_resoure` has global lifetime and is =
of type Resource.
>> +    unsafe { Resource::as_ref(&raw mut bindings::iomem_resource) }
>> +}
>=20
> This caught my attention, and I have a few questions:
>=20
>  1) What do you need them for? I don't see any methods that would =
usually
>     consume those.
>=20
>  2) Why are they behind CONFIG_HAS_IOPORT and CONFIG_HAS_IOMEM, even =
though the
>     C instances are not?
>=20
>  3) What happens if we pass them to IoMem::new()? Is this really safe, =
or do we
>     need them to be a special Resource type?
>=20

Good catch, actually.

I worked on this patch with Fiona and IIRC, she needed access to these =
two for
her LED abstractions. This patch has seen a few iterations already and =
this may
or may not be obsolete by now. I must say I've never used these before =
so I
don't really know how they work nor do I need this at all.

Fiona, do you still need these two accessors?

=E2=80=94 Daniel=
