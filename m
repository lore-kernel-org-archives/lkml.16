Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36B9239E97;
	Tue,  3 Jun 2025 15:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748963559; cv=pass; b=sg8RFjOHS4EDoEpZi9OtAav3Aa/L8Iirbb9cxYd6a+VQ/PE3fcmiWcatMGdGo9wrklG6SwGpehygEhW++QBETdpW0tT74ci2qlf0pqEIqa+4j1IM+Y6XZIKQsIUFxBgINiHn9pD/NL6GNrds6rn2wExpg5ZY6XO2v9ji51yW/9A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748963559; c=relaxed/simple;
	bh=/Ou9J00S329Zl45RGnMyn4tnUrD/3mnLV6NZAI1i81Q=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=NvbvIVs2EJCpMyqoEkkIRpeP8Qx+/5Edb8dD2eeurSbovidDGLtafGRbE9d6ZtrTJKf0upQT5vUtQzAmup7Ov7g6UZS6rlH80HVPegDuRWaL1Ue7pY7Zvkfik8DDTwMaXl9oTDw2ercdv2n6i2fBJ4VrJGiVkaQAi4imhyAHbOc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=UwXV1INE; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="UwXV1INE"
ARC-Seal: i=1; a=rsa-sha256; t=1748963532; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=CTUqcNpnbIqdGQMgNYOXmH6UO3FoTXR/rOmx45OWCi6wfAIDQsV/8idEdHgUSNFp63QYX3HrAxRZ8VledQoP77rhnBvN95uKPthZSIOEnwp7Ix5RPngrqpLfEaCbYlny9yoItCb7daaBModdPEY2TTbzUYlOj/6gHqwUowLVXbQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1748963532; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=/Ou9J00S329Zl45RGnMyn4tnUrD/3mnLV6NZAI1i81Q=; 
	b=NX/YpP6QjjiAhYSDjvISieVUyDdRV0dCofjcMlITlgVlLdVgOZriGbZp/4Ai1ROO3qQwchXuNZG5b8E1gVmtbI8JYVHQwqGpTe7iL6MmjS4+wzbtUKYUclpVIpcUm+R0Y0lfTglqRauDu6cMwPLfyOnPNoJxpK+cqTbNwO4I770=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1748963531;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=/Ou9J00S329Zl45RGnMyn4tnUrD/3mnLV6NZAI1i81Q=;
	b=UwXV1INEFoeuc+cKzzLb9EqcA5LvCNERoN/cVtlxjp2IFUNvznas7gSbwLeU7+gR
	3/wBEJsAWmqqvXBw385CNdGCjcYy0IpMK+Cj5NDDfSK6pf9RN8LtQhN1kLf/iCkYyE+
	xl8GehdtuqqUNAnAyDPteAHpIZz8pz2xunO1znsA=
Received: by mx.zohomail.com with SMTPS id 1748963529177909.6802903628969;
	Tue, 3 Jun 2025 08:12:09 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH v9 0/4] (no cover subject)
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20250603-topics-tyr-platform_iomem-v9-0-a27e04157e3e@collabora.com>
Date: Tue, 3 Jun 2025 12:11:52 -0300
Cc: linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org,
 Fiona Behrens <me@kloenk.dev>
Content-Transfer-Encoding: quoted-printable
Message-Id: <3D5701AB-0889-4FA7-96F3-2757BBA57A40@collabora.com>
References: <20250603-topics-tyr-platform_iomem-v9-0-a27e04157e3e@collabora.com>
To: Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Ying Huang <huang.ying.caritas@gmail.com>
X-Mailer: Apple Mail (2.3826.600.51.1.1)
X-ZohoMailClient: External

Sorry, messed this one in b4.

The rest of the patches seem OK though.=20

=E2=80=94 Daniel

