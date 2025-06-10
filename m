Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5384C12D758;
	Tue, 10 Jun 2025 21:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749589634; cv=pass; b=ZA02oyGH6TFej5aXSoLWhUXrX3EppkR7Z5Fhg0xhadSgNFiXxdf3CwrrWWJ5GnC8hOM4Z/T5pDnUdhpYmLzys9JUlqMbiMyQmGpq1t8Yn+xSDEpFtr9rF8stxQlos2oC+72CML+UT4DxvobL2tJOOw/Zs7WUrbEPn2fejrzA4G0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749589634; c=relaxed/simple;
	bh=AC7I0fLcRle5LXTlRX8hM4Pm54CmEKFUklwUmoEHnVw=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=MI6vubqC6JByYMlRy8NrxV1rMfKLn7pcUDFh28askfZ54Cc1wFc/PB+DGRlN7NClGKmRwQVvpJ+VFF475SEtRwHivtpPn5blobi4Re5GyMwc2RGsyC0GJmg5qkKXPYgASeV5PCyjQWT0T1UMM+nU39tHI1j5aEMgttiuGzmp1aU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=MsBZ2Xbd; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="MsBZ2Xbd"
ARC-Seal: i=1; a=rsa-sha256; t=1749589598; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=QnwiR8PxwjupnwxJy8gFtigPyvLnjBWKq1Je9QzZFqiwHKlOk0M23Zjv1UtVcJDdJv8nDnWeldo22/qCSWF6e75MWpRbmm3GaqeR9AqiBNAjX+9iyQv3SNHOz4UR2PBk6cPHwXuYqHWTMrfyi7RPNi/IssimDHPbJgemSEXKvoo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1749589598; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Zoi7i2LrLRe56/s2vnkgJeF3ZP5eOJb/bXYYDs/zeCk=; 
	b=J9hs0rSJcuSajR2eDuaduV4z/bPdWeszm0MoCSLTQOZVOirKnOaZSCxTW7HSFe1fn4k8ocnzGYtSWcfu7kEBKE/U0oKoCuw2eXQ6QHW0LwlHHxuBSnQIaP1lIhIvNPpgz1jY3NbsXvEYEPuSDJNRp6ik5w37srzjPvm0ptvVjNo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1749589598;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=Zoi7i2LrLRe56/s2vnkgJeF3ZP5eOJb/bXYYDs/zeCk=;
	b=MsBZ2XbdGmRFxY3Qi1/E4tNJbd0q54nZyZubKr5jKN52PdBZeyPl5h5G/IVIK0Yw
	E1k/KC5y122BK1LPWEQfc4H5tRBK3K1waEH01/VDm8dc5US50NH0Pe2SA7Ti5gpw5rz
	u9JKMQBYy6FnGBhxvd1s+/SvHMm9ZOlt31w8CrGY=
Received: by mx.zohomail.com with SMTPS id 1749589596973203.10184682890394;
	Tue, 10 Jun 2025 14:06:36 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH v2 2/2] rust: drm: Add GPUVM abstraction
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <aAgHGuzCZzh7YPz2@cassiopeiae>
Date: Tue, 10 Jun 2025 18:06:20 -0300
Cc: Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Lyude Paul <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Asahi Lina <lina@asahilina.net>
Content-Transfer-Encoding: quoted-printable
Message-Id: <45E62F9A-39BB-4026-93FA-E27060498DB4@collabora.com>
References: <20250422-gpuvm-v2-0-44d4fc25e411@collabora.com>
 <20250422-gpuvm-v2-2-44d4fc25e411@collabora.com>
 <aAgHGuzCZzh7YPz2@cassiopeiae>
To: Danilo Krummrich <dakr@kernel.org>
X-Mailer: Apple Mail (2.3826.600.51.1.1)
X-ZohoMailClient: External

Hi Danilo,

[=E2=80=A6]

>=20
>> +
>> +impl<T: DriverGpuVm> OpMap<T> {
>> +    /// Returns the base address of the new mapping.
>> +    #[inline]
>> +    pub fn addr(&self) -> u64 {
>> +        self.0.va.addr
>> +    }
>> +
>> +    /// Returns the range of the new mapping.
>> +    #[inline]
>> +    pub fn range(&self) -> u64 {
>> +        self.0.va.range
>> +    }
>> +
>> +    /// Returns the offset within the GEM object.
>> +    #[inline]
>> +    pub fn offset(&self) -> u64 {
>> +        self.0.gem.offset
>> +    }
>> +
>> +    /// Returns the GEM object to map.
>> +    #[inline]
>> +    pub fn object(&self) -> &<T::Driver as drv::Driver>::Object {
>=20
> You can use drm::Driver instead, which reads much better.

Can you expand a bit on this?


=E2=80=94 Daniel=
