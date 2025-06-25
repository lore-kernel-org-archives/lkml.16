Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940282DAFD5;
	Wed, 25 Jun 2025 19:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750879100; cv=pass; b=WlNHJ41qFSdaRUKQ2CAeQbX7kwReKTuKsXBpPeR2QFuN6fRmafa0f8nyTn2RJ3MIC187gSa3N4PbwobyOtaSGsTkrLZqioPQJGu0HzIePiSgM0L0EK3cdW1QOP7b+WwXweU3nQmDRjprHo3qGls/n4waNll/YslvQFUBqxXUuBc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750879100; c=relaxed/simple;
	bh=uyy4xiNlMjh21MUqTmqBPBeeB97sutVHpJnk3zwpGiI=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=RmtZQClBLu8PiL9bFIi0ctW0akRIO+SZn/dpIhlEabv5t5VaTkItYasUMaQ2pqKpF07DGpFZxrg+OjB3AtByf+HaoVpSWQT0FJdc770VHjDh2fFXQJyL3DfFCNcA6nW2vhLNHLakEBZ4oCIjiHNJD8Utq9xFZIUIGCcg800zJa4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=PN0Oge+T; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="PN0Oge+T"
ARC-Seal: i=1; a=rsa-sha256; t=1750879071; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UqET5Z3qZJFBe6aSFk/n/qpxfMIlbohNMpS4qaUD7wsZxDNVH/5K+fNrrGkel5tYw8wtxBjo2z66U9omjU59QK4hhC/g7XA+B24WqHwtOQCHWGYxQF+W8lqt3WA63wzEOBHwk6OzhCHeaLbxuMLbIT6RV420mDfOwCovkkcSpfo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1750879071; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=dHw1fcw6yCMKDuaRUUmcQkZkXANFxT243nZxfiY1M6I=; 
	b=iGsGrCAxuU1kE2CWKUlQIQdxdSz+I/4sLPr68FwvaalROom8waebR8SQ/937q0m+A8axgV8HYRFLR6K7cIKsbjeo1CU4UWdhzEooF+WTe+JY/rVWdaSVfpmpvIWM1l5ZHOWmFeVIiesbnuKN9rgP9QktfZnUiRpU4pbMl/DE5ac=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750879071;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=dHw1fcw6yCMKDuaRUUmcQkZkXANFxT243nZxfiY1M6I=;
	b=PN0Oge+TTYcSdiDSd3aXm/0E+ddTAJxm0dS7Nup2dbcXCpiZwLIZIf3I/U5u3mTw
	Y2ShIAkD43R+DzRaY9rNq1UFQG15HQZ8v7uZl4LLeOFgq7JhccBAfHgXJqLwXlvlOn9
	gsZYk+2LAxsEVInprpbycQAutRMKQsNEm4Wp7epE=
Received: by mx.zohomail.com with SMTPS id 1750879068314974.8188270241737;
	Wed, 25 Jun 2025 12:17:48 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH] rust: drm: mm: Add DRM MM Range Allocator abstraction
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <CANiq72k07PuSodVgb+LDNw1jZVWhKt1BuYSULfBY8DBH1EJbBA@mail.gmail.com>
Date: Wed, 25 Jun 2025 16:17:33 -0300
Cc: David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org,
 Asahi Lina <lina+kernel@asahilina.net>
Content-Transfer-Encoding: quoted-printable
Message-Id: <3E03D94C-5446-4857-BC94-D7EA1646E54A@collabora.com>
References: <20250623-topics-tyr-drm_mm-v1-1-82fe8104a6f5@collabora.com>
 <CANiq72k07PuSodVgb+LDNw1jZVWhKt1BuYSULfBY8DBH1EJbBA@mail.gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
X-Mailer: Apple Mail (2.3826.600.51.1.1)
X-ZohoMailClient: External

Hi Miguel

> On 25 Jun 2025, at 09:47, Miguel Ojeda =
<miguel.ojeda.sandonis@gmail.com> wrote:
>=20
> On Tue, Jun 24, 2025 at 12:13=E2=80=AFAM Daniel Almeida
> <daniel.almeida@collabora.com> wrote:
>>=20
>> Signed-off-by: Asahi Lina <lina@asahilina.net>
>=20
> Patches from others also need to be signed off by you as carrier.

Thanks for catching that. This was indeed forgotten on this patch.

>=20
>> Changes from v0:
>=20
> I assume you mean the RFC patch from more than 2 years ago, i.e.
>=20
>    =
https://lore.kernel.org/rust-for-linux/20230307-rust-drm-v1-7-917ff5bc80a8=
@asahilina.net/
>=20
> Right?

Yes

>=20
> (In general, it is very useful to have a link to the previous version
> in the changelog, especially when it is a very long time ago, when
> titles change, when it is non-obvious in general, etc.).
>=20
> Thanks!
>=20
> Cheers,
> Miguel
>=20


Ack, will fix this in v2.

=E2=80=94 Daniel=
