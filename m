Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C191D932F
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 20:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744660814; cv=none; b=BR9l5U3qqdxTSFlYzXmJTF6t8iWhta7t1aK6MQu6zi+YNhR4VRXYgAiFWJ9bBLZXnkRQIL3Rli2OFF14tDdbVRn6yr/CtRwZWVbTqqMOSO1XFTObbhko/B6oksS0neBdbUUd2stnUoT2zf4Veboa5ncSXEWCz5zLuE/0BySSIyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744660814; c=relaxed/simple;
	bh=onkGD7IMGYYTDQ1k9EeiYgsn35bofu/HwOQD6cSvNlQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Chj/q971jJLub7rogEnmMhGjZvDGaehg1O68110gNRdu9D0WJ4YqoeRNNLxWznXeQGvLw7vumf0xDMHlHS0R4/mXBaEwNZ4PZop4XLWq3yxM3A7rup7KltPqXYHHwz/1ERAnIZKhIdBQ047lunXteHi8DtVNe2p4V5lrfVC0tG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=mTZbbvq5; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="mTZbbvq5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1744660810; x=1744920010;
	bh=1rLZ1Gjo2Q6wANcQPpDmCfAuAi8w2svdSSCbs+ToqpE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=mTZbbvq5/fjWisurh/tWftCph+iFfW+F2Zbfski/3fZLRTsoPgDxklkWPTmR8X7tF
	 Kqk+5e8Q6yomyKMdbHtq5Fl7fpkTtv6e0WhxBhJUThSRzgPT/FCESh3CUBQ9AYgbQ2
	 0xxYJHCMHk6nEe/R2re+yIxn7K8qSYe7bQWfUJ0LfXEqJI0rp1sPAS22Cy4Uc3GxXi
	 muy03U0TWjyIfy6/HhoEghPDP3kaeWCXno+MxDH3Uz8zcvJQTj3wvy12Rsb17NRNjr
	 KPiBEfyygmNyxbkwiEwgPAYi0LGiFYpldxcE9CHQSjFM+oWuWqnzjjQECwaOQA3/fE
	 R6Y2Up7msnHDw==
Date: Mon, 14 Apr 2025 20:00:03 +0000
To: Benno Lossin <benno.lossin@proton.me>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Fiona Behrens <me@kloenk.dev>
From: Benno Lossin <benno.lossin@proton.me>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] rust: pin-init: internal: skip rustfmt formatting of kernel-only module
Message-ID: <20250414195928.129040-2-benno.lossin@proton.me>
In-Reply-To: <20250414195928.129040-1-benno.lossin@proton.me>
References: <20250414195928.129040-1-benno.lossin@proton.me>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 3121d4f810d1bc5aa2915236284e3cc2c00020a5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The `quote` module only is available in the kernel and thus running
`cargo fmt` or `rustfmt internal/src/lib.rs` in the user-space
repository [1] results in:

    error: couldn't read `~/pin-init/internal/src/../../../macros/quote.rs`=
: No such file or directory (os error 2)
      --> ~/pin-init/internal/src/lib.rs:25:1
       |
    25 | mod quote;
       | ^^^^^^^^^^

    Error writing files: failed to resolve mod `quote`: ~/pin-init/internal=
/src/../../../macros/quote.rs does not exist

Thus mark it with `rustfmt::skip` when compiling without kernel support.

Link: https://github.com/Rust-for-Linux/pin-init [1]
Link: https://github.com/Rust-for-Linux/pin-init/pull/33/commits/a6caf1945e=
51da38761aab4dffa56e63e2baa218
Signed-off-by: Benno Lossin <benno.lossin@proton.me>
---
 rust/pin-init/internal/src/lib.rs | 1 +
 1 file changed, 1 insertion(+)

diff --git a/rust/pin-init/internal/src/lib.rs b/rust/pin-init/internal/src=
/lib.rs
index babe5e878550..56aa9ecc1e1a 100644
--- a/rust/pin-init/internal/src/lib.rs
+++ b/rust/pin-init/internal/src/lib.rs
@@ -22,6 +22,7 @@
 #[cfg(kernel)]
 #[path =3D "../../../macros/quote.rs"]
 #[macro_use]
+#[cfg_attr(not(kernel), rustfmt::skip)]
 mod quote;
 #[cfg(not(kernel))]
 #[macro_use]
--=20
2.48.1


