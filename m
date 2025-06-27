Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F27727BF79;
	Fri, 27 Jun 2025 22:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751063844; cv=pass; b=nGUw7C3xrt09zoSKlpdViO0p8iLXnb966VL1D0BYhXHfICMcLsnN/6ypG4B4LVdYpDup5Rot2P0d+xC/nrXgiPKIcNW0z4AKVlhbIl7niz2HBGqYxVlhsZcxuEDlSO262vbF9LJVbbe0gjNgI0HopHc3k2NXJuesyea5cHDRnC0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751063844; c=relaxed/simple;
	bh=gK3BJJwtSH+KH5T+UiyABgIKLAnwcEEGHQbA1+yVIrI=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=HtvwrzQHOtXvTFObCTl4+uKtgPY7e5bvqlFtmEu8jpAQhYYhL38BhjrxeJhNuzmbp02xdpk8gABO3fkPrx2VU+4e7njixOCU0WLCUfD//1DNejekV9hDNoK77nvleYiFUG033XdkyoYeJH/6/qUOTy0/aDkp3zm8cOZZu8wTU/s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=bvhI3mYA; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="bvhI3mYA"
ARC-Seal: i=1; a=rsa-sha256; t=1751063812; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=S1wHygDdS5FUBREk+qu3hMBF5+DmylQmSxA5WQRFGdskeuYRWbt9B+GzWtOjdiPYKHUk9RVRWQ4YkF65xNO00z2tY4gdSGa4L0MfsI1iU0PqDyF0uTjrMDrOOjQRL4i5CuMPqU38z8kWwCRA2biLwG3GfpJUyMywBfQvYp/r1nk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1751063812; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=gK3BJJwtSH+KH5T+UiyABgIKLAnwcEEGHQbA1+yVIrI=; 
	b=FOluvlbIoF4xZu+e7W/0SJEHVyJVO1njy2gsnijUupMV4wBUcYWq5/iVT0tdcfUnhxyAJiJWUXp13jswVtAW1ii2HJCiCVnwYkhyaKGNjvNUPuqQzFzcufsoZVlq9wXlRIkNbQrhieLhQsCGrOBUHbhuK8Hfp04gB2wgnuMeCKI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751063811;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=gK3BJJwtSH+KH5T+UiyABgIKLAnwcEEGHQbA1+yVIrI=;
	b=bvhI3mYAzd500MoClJ4rlZjlDa/9fjTNtW/UZ9zpawQkVCljPIpo/f7ZuYn/62Y5
	r/MgFfT+M9llVyRJ2asX+IuLSaOAqZATLnwvlUaqar5jChE9Xl0fXhk+JmSu1j2IE4+
	S3wV3/2aUjXw0ElqBTPrYzlb0P+If9beZM6ZTfs8=
Received: by mx.zohomail.com with SMTPS id 1751063810885656.1657901201971;
	Fri, 27 Jun 2025 15:36:50 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH] Introduce Tyr
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20250627-tyr-v1-1-cb5f4c6ced46@collabora.com>
Date: Fri, 27 Jun 2025 19:36:33 -0300
Cc: linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org,
 kernel@collabora.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <81B29EDF-B6FB-458E-BADC-F3708A9434BB@collabora.com>
References: <20250627-tyr-v1-1-cb5f4c6ced46@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
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
 Daniel Stone <daniels@collabora.com>,
 Rob Herring <robh@kernel.org>,
 Alice Ryhl <alice.ryhl@google.com>,
 Beata Michalska <beata.michalska@arm.com>,
 Carsten Haitzler <carsten.haitzler@foss.arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Ashley Smith <ashley.smith@collabora.com>
X-Mailer: Apple Mail (2.3826.600.51.1.1)
X-ZohoMailClient: External

I=E2=80=99ll fix the missing =E2=80=9Crust: drm:=E2=80=9D tags on a v2.

=E2=80=94 Daniel=
