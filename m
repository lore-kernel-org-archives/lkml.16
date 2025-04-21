Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E2AF1DF256
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 19:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745262586; cv=none; b=uM6z+7nZ6VhtOHuHlcgDUdFKapDo1jlEXBMgYcBvpmgHrMmBAFFddQNuuiJG2Mq5PudMiGaL1eU6VRRdpie8OvvWc/6llLh12D0oxtSqQc/nyMXDjm4bVbisYnKbJdGqYpuQLs4y8h/PYPgczU3xLs5c/HtPtddhuocesrrfGCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745262586; c=relaxed/simple;
	bh=Ipy/IlMQR5m3AbiVrZjXOxC3psCUPUEnpm0aP+lGnG8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y1l9C2+801/lBRXUGI0GQaAYrgFeAOaysaq5TYXEYN9FL/d6H92gEZCxUeAKNX2RIPoesNjAxaLhuOJaofsurIkAyBOQI3+wwsUsmw9ZdDm5wLoG5vH5t9ccLyVTOftEnNyeXcQg7BhhULUf4KxFojf7FT4cUgC3DofNKe0iJUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=BpnKfwOS; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="BpnKfwOS"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-706cb438672so30108277b3.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 12:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1745262580; x=1745867380; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T08XUeirEjZZ3rFusZ9ui4pbr1iJ6mTBH3F3K3ayArk=;
        b=BpnKfwOSnnHbDHm+0NyompQdo/e9PAF3GvurdUWJGmI5kBBrZh/wT6hOujzhiMb3vr
         iRDuL7pYUCkdHo5Y8EHMKmwh0Ezl4qa19P2Upv2noI1RAMbxSPlflvry2GDNMVgk7lzK
         vxHGssoYph8Ndq7i1+a6TPC7xHEO3ViAHfEzobYPv6yU1UVpQUaU2aw7IwmC0uAaCPeS
         L9dEyDFiPAfDL0vzKIDN1c0SQbSNbfsDkUgCC2O9nBWEywlO2PdQbgkxdttAc4g20TxQ
         jh7+rkxWlj6ljoA5xJliSG0APSThR9PFQq1Fe4zefqNkXEzoLLoVBn2M7iLj/cnXeWIH
         WhMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745262580; x=1745867380;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T08XUeirEjZZ3rFusZ9ui4pbr1iJ6mTBH3F3K3ayArk=;
        b=sqwUhUXpcvmUzsPOwjqcSUgOCfC4BUWYF0/+0oOBAomSKOF9Zv13aVhQPJjidVunJe
         zAmFPHXQGrQqK5RjRWx5sacSQC9SzfTDv0OVVgPeIetxBjnySy6mWsA07xxQqcWgbF6W
         AOA4WlJLn0v0FMNsMvWcUXHd8EKKUXinIUNngEM0JMXR/JCqptfO82gFUxAInqyhzxXj
         VHqdPukrRrp8QtkBbRTxsA+mZpT76RFBKPzRSEmxJ24lETiPlbg+m1QDjGcM6XxFZt6I
         /Th0DDC7MIeD6pBlQHhUVBWo0FuvBikk7z2jQrD4XPO0SS/tYeciS0hans2fI8RhKaaw
         bwEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLu/imupXITIsEPexMblKxup6YTIUMcaOxXorOOOIKJbAIjNIGCO/THh+SKtSotZwczIffvgPhFsO7Wpc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+pHshdj226mitckLgsNZNV6av6oJcgvSsYm2Bs9gSHYMrqZE5
	YmPrkdlpNE7sT8Cu3Iw5uvFwpiUj7yOBNCjwcL3bLYHGgNHD10zA4ZgS+Bbn93lzlKql+dWNeny
	+SaeMsO0K/fhyORsyo0y0fzVfWQZWtkirB5sk
X-Gm-Gg: ASbGncsPbcnqywdC8023daxPvYzigNK6lA+9kKKnhavUrinedkWXV0Tj/TtiqC2JEwW
	In6k5goSuDe2Jc5GY/RyPw/n8EbsxcZ+qsbxpISifVxEhEzEd2Wvb9RMyL0o5q4odvHr95GWvOu
	WDq0U6HieYBJfKDmScwQTHoQ==
X-Google-Smtp-Source: AGHT+IEq81DQWkZ97JRyt5xETBtFSorBaF92Ou9Zo82I6G2+i+i8EcwH+xtm9xonVfTXTIJqZpTYrjxiZqHXvvmgyoI=
X-Received: by 2002:a05:690c:3588:b0:703:ac44:d367 with SMTP id
 00721157ae682-706cccc0c45mr179795477b3.6.1745262580700; Mon, 21 Apr 2025
 12:09:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416213206.26060-2-kernel@o1oo11oo.de>
In-Reply-To: <20250416213206.26060-2-kernel@o1oo11oo.de>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 21 Apr 2025 15:09:29 -0400
X-Gm-Features: ATxdqUEYOsA9flEG-c70fcJwePHBgE2dUMSRCtlm3hgaQYBOzeZmlB1-mNQVx4c
Message-ID: <CAHC9VhS=jWEZqb3MqCtUAJhY9ci8d_N4H6CqWsYU0YmEG=8_yA@mail.gmail.com>
Subject: Re: [RFC PATCH] lsm: Add Rust bindings with example LSM
To: Lukas Fischer <kernel@o1oo11oo.de>
Cc: James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 16, 2025 at 5:36=E2=80=AFPM Lukas Fischer <kernel@o1oo11oo.de> =
wrote:
>
> These are the bare necessities to implement an LSM in Rust. They are in
> an early WIP state intended to gather feedback, mainly for the use of
> unsafe.
>
> The LSM is implemented in security/rust_lsm/lsm.rs and uses the bindings
> to the C side directly to set itself up. This is of course not
> production ready, but enough to set up a minimal example of an LSM.
>
> The `lsm_info` struct technically needs to be aligned to
> `size_of::<kernel::ffi::c_ulong>()`, but Rust does not allow this in
> combination with `repr(transparent)`. So far this works, but it seems
> brittle.
>
> To limit the scope of the implementation, the example and bindings only
> cover the `file_permission` hook.
>
> Signed-off-by: Lukas Fischer <kernel@o1oo11oo.de>
> ---
> As part of my master's thesis, I am developing a Rust-based LSM. These
> are the bindings I have created for that, so that I can register and
> implement an LSM in Rust.

Thanks for sharing this Lukas.  My Rust knowledge is still far too
basic to offer any constructive review of the Rust code, but I'm happy
to see some effort being put into looking at what would be required to
support a LSM written in Rust.

It isn't clear to me if this is simply an exercise in seeing what
Rust/C interfaces would be needed to implement a Rust based LSM, or if
you ultimately have a LSM you would like to submit upstream and this
is the necessary groundwork so you can implement it in Rust.  Unless
it is the latter, I'm not sure this is something that is a candidate
for merging into the upstream Linux kernel as we don't merge "demo"
type LSMs.  If you are intending to develop a proper LSM, we do have
some guidelines that may help explain what is expected:

* https://github.com/LinuxSecurityModule/kernel/blob/main/README.md

--=20
paul-moore.com
