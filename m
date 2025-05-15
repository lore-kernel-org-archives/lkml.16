Received: from sender3-op-o12.zoho.com (sender3-op-o12.zoho.com [136.143.184.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD67333DF;
	Thu, 15 May 2025 13:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.184.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747315043; cv=pass; b=i8pj17HoGDHwXurRtNUTBSISOz/KiMNTGmPHuS/vyShzxcsMi5hVPWpJzS3GiGdFOyNZKRS9fV+EMahV/V9MTKqqcJint+KqvdWZoNVfNd8dSqu2lrUGHtc6zPkmzIY4t0wlbfezmRKu4M6R1XtJerujfpH8LHD1OIXQHeNGeQM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747315043; c=relaxed/simple;
	bh=IAj+xO+2T0h66qX6kz5MVBVBZcTGgewMrVzK5SEv9lg=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=iC0nrzkvpxKE3kmC87LSjxAQ+Q6bioSqCyCVJz0fC7hd9EYVSWXhjKX4t7EXScDtB8/Jd8xwXIWdMRlaGZ0/R8V/9VhW4TbE/D7dK63dSwbKnw0PrN9qy3KTdUF7YZCgK1L90iLRFbLIDOUJJO+S1y8Rx9fF+baN7Rg6kHR5XpU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=ClNRRPO6; arc=pass smtp.client-ip=136.143.184.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="ClNRRPO6"
ARC-Seal: i=1; a=rsa-sha256; t=1747315011; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZYtudI/NlSCPowxFepDvRBb49ZIHlOY4KinjqPpQy3ytTJQph9lTujVRVPmUQK43EKYjzynWGRMdrQLMFLB4i8rNgyOTegZ9JBeP3KZJYwlDfp+mgTdX82aXJQOrUT+saJlivkq7NLacYIKFufw+mf0plJN1N1Ne/FT9hJiN9pg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1747315011; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=IAj+xO+2T0h66qX6kz5MVBVBZcTGgewMrVzK5SEv9lg=; 
	b=cTUhMR8UHRqqRuwQUKOBEpCxvCYYnXcy11cPWxSYmeQp4LrfBtw2NsZ9RD3U/g4LQNiDXFKwvo3SsSJHxetD8iE1J71eZLMnXtHGfQja6UHZss9UH6vNdw653iDjQj5yeZ3F7L64tK1ueCxJC35Alc01gPC3Li0i977VVzJGid8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747315011;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=IAj+xO+2T0h66qX6kz5MVBVBZcTGgewMrVzK5SEv9lg=;
	b=ClNRRPO6LZy9xdMCQ8Ie/zyx0cXNx6nKOkeYn3YBLaHEHxF2lunzgZBmkMuom+mA
	hwJGwkO5Lq+Cdh4G/XcPVHRknpiobrTeDqn9bG+qJodWbgA6gV6ap+eFaWq++e5B3si
	rqB28a8soPnmKWY/oIzYwvWmJX5lpffn9ahPv3f0=
Received: by mx.zohomail.com with SMTPS id 1747315009313702.3806734670801;
	Thu, 15 May 2025 06:16:49 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.500.181.1.5\))
Subject: Re: [PATCH v3 1/2] rust: irq: add support for request_irq()
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <aCXh1g5FWNiz7exb@pollux>
Date: Thu, 15 May 2025 10:16:33 -0300
Cc: Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <BEDD659F-B222-4150-9018-3B59126140E6@collabora.com>
References: <20250514-topics-tyr-request_irq-v3-0-d6fcc2591a88@collabora.com>
 <20250514-topics-tyr-request_irq-v3-1-d6fcc2591a88@collabora.com>
 <aCUQ0VWgoxdmIUaS@pollux>
 <A7E3A124-AF77-4A4A-B4E2-AE7DDB1CE007@collabora.com>
 <aCXYaCGvO_tI1OOh@pollux>
 <39C56E3E-07C6-44BB-B5F6-38090F037032@collabora.com>
 <aCXh1g5FWNiz7exb@pollux>
To: Danilo Krummrich <dakr@kernel.org>
X-Mailer: Apple Mail (2.3826.500.181.1.5)
X-ZohoMailClient: External


>>=20
>> Well, not really, because this impl PinInit can be assigned to =
something larger
>> that is already pinned, like drm::Device::Data for example, which is =
(or was)
>> already behind an Arc, or any other private data in other subsystems.
>>=20
>> IIUC what you proposed has yet another indirection. If we reuse the =
example
>> from above, that would be an Arc for the drm Data, and another Arc =
for the
>> handler itself?
>=20
> Can't you implement Handler for drm::Device::Data and e.g. make =
Registration
> take an Arc<T: Handler>?

No, because drivers may need more than one handler. Panthor needs 3, for
example, for 3 different lines.

>=20
> The irq::Registration itself doesn't need to be allocated dynamically, =
so it'd
> still be a single allocation, no?
>=20

Right, the registrations don't, but the handlers do.

=E2=80=94 Daniel=
