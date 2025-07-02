Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D2630E820;
	Wed,  2 Jul 2025 18:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751479525; cv=pass; b=ovxRdFe1e/1oo05o8/Tp6OJGTWiZKnKEcq5KyrLgGDVKGsyiz5H4o2Y1cxJixBPFOIeZCwBsvid6WYnq6bBUul/9ubLCQu4nSG4uyuneWuyzdiX1s+mQLMCl8n8Y6ZNErXZ99LlJHXHWgzMFFmo+CIeThGHLz0kq0Za7a+0jnqs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751479525; c=relaxed/simple;
	bh=+1iN/ppiWwYuvQ7aCaXfQ7OMEU4L9uJfsI6J8cVpacY=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=hJy2+c5zvigZQlZgm31Pf2MMORcueqwm0FCtSXAOi+g4NTUrmRmk9aXH8LPZTXdNux+DOTzJ7C9ywRBElhhjH0PCHzq5fHXLnqytf2jY4qguiMnCqs7SFMJZgdPv4+PLttMsX6BnnnFH09lco18cWTW9UK/5LlsdlS/85oPVtvM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=CMVonJkI; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="CMVonJkI"
ARC-Seal: i=1; a=rsa-sha256; t=1751479497; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=QH8wTollkzQby69pfxpum3+Kf9+wHf/5VLA/6m9TpxuUf7j1VU/jGDEL0/Q33FpLhqcdRdiDppekkmWNVuPc4veJfN3CWSq1czqC7Y9C6IN2P9iRTtjfwGiqUi4RtNOyJ9HWrkix6tuK8lQBs+E6ktlC3j2oiaRAPfGUT9J3z0Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1751479497; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=+1iN/ppiWwYuvQ7aCaXfQ7OMEU4L9uJfsI6J8cVpacY=; 
	b=O4TWemNMkb0z9a/Qo+i/7VH6TOTh0RI2GTkb2wVWvCPMSsKj4Ke63tXtWhsigdv8o9vSKY7BRbMoCudOknkuF97hOAwwrNGuceV29/DIPAIHwV+YUEHgfsU4eCQ0HHC8/WcZqyB2fT3Vaj1Lst3UIKDqNSzCNjNDHHigOxWEIR8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751479497;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=+1iN/ppiWwYuvQ7aCaXfQ7OMEU4L9uJfsI6J8cVpacY=;
	b=CMVonJkI3FOXki4E9S1Lw2D4TR6kWLHAjYC+NDVPz7Q3wJfvy0XuinO9FGwQK8DQ
	SU5H59RD/Cksxm2UbE9ji4GyUTUyYRV7bWyy+ey8JhHicSXqHZdtnVb5fj4Z+5n8Pp1
	fvzaNv1XqAD75IhvFWDpcCqfYC8uSYlT4PDypVbc=
Received: by mx.zohomail.com with SMTPS id 1751479496117758.5462233195104;
	Wed, 2 Jul 2025 11:04:56 -0700 (PDT)
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
In-Reply-To: <CANiq72khZQMQcyp7uVjMz--U1dbbnx7K3pU1Eu=ZN6SXi98TZw@mail.gmail.com>
Date: Wed, 2 Jul 2025 15:04:34 -0300
Cc: Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
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
 Ying Huang <huang.ying.caritas@gmail.com>,
 Benno Lossin <lossin@kernel.org>,
 linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org,
 Fiona Behrens <me@kloenk.dev>
Content-Transfer-Encoding: quoted-printable
Message-Id: <14F43E80-7DCF-4825-BB08-6D3B5CE6A698@collabora.com>
References: <20250701-topics-tyr-platform_iomem-v11-0-6cd5d5061151@collabora.com>
 <20250701-topics-tyr-platform_iomem-v11-1-6cd5d5061151@collabora.com>
 <CANiq72khZQMQcyp7uVjMz--U1dbbnx7K3pU1Eu=ZN6SXi98TZw@mail.gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
X-Mailer: Apple Mail (2.3826.600.51.1.1)
X-ZohoMailClient: External

Hi Miguel,

>=20
> "Safe", periods at the end. (few instances)
>=20


Is it only about the periods, or is there any issues with the word
=E2=80=9CSafe=E2=80=9D itself (and/or its capitalization?)

=E2=80=94 Daniel=
