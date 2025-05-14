Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00272296D36;
	Wed, 14 May 2025 21:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747256676; cv=pass; b=afciIDhfXgn5W9/xdP6WlDhbfmEeXblfPEpKwwfdN7N3mErNaxb9UzwfAt5cTM6an2XoBnQu7G6P/HXIXdBLImavBDsiGiFueYL0TFXZHgQmNdMKT1MZpuWXHxSQCfHM9P49S/w69khNfqpUccceDbGNEbWPl+SWyA+cd/O7lOA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747256676; c=relaxed/simple;
	bh=6RUy2CK1wlmEINbBG4ZAsmJD+VHiDwQbmoBgwzKHUDQ=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=VdE8zTODGSfbi33unSCJxW0bDdxvXG3RQQvu0GQYAx9gszcwYecYym3w1QzldmgdKYDqqXnt7AYz4qeJzOJT3R7N1D3zEkxYpeKBT8sMGqTbihsSS9932fzoc7CCDEGPszYAJUhMopqS7ZMM1tA5aHF8mhH6aAebZ/TjJT6SPBA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=C2is0HPq; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="C2is0HPq"
ARC-Seal: i=1; a=rsa-sha256; t=1747256652; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=QhkybkztgduN6xwsObRq/rLRBWErw4neK7emPUg1mze2Ofp4J+TyNbuL3iQziGmDNhrcmkSKIONTDzaPgnPivxGlXTQXg0fTOElARSDxZKB3fH/kD8QFpWiiYR5tBUweAvZtdPH2DI2nuLm3CPJPHNtZjWa+tobYdZKF/aaxMt4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1747256652; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=6RUy2CK1wlmEINbBG4ZAsmJD+VHiDwQbmoBgwzKHUDQ=; 
	b=A5B5RDO3uj7FpBclPdV6nNGe+l8E9nVFAvgAHmScO2Qw5O4ICxV46ziqkzaAQ9j316JDfqRz65Ex7vTKEOmPtrTcGM8+WCaX+9NwmZL+Lnp/Hzh1XNOW6dVj0Bmo4wfkxA/m6mOA/2UAwZhzO7x6HHnpV0HXN70QgPylvmG8UJ0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747256652;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=6RUy2CK1wlmEINbBG4ZAsmJD+VHiDwQbmoBgwzKHUDQ=;
	b=C2is0HPqGIsbNZmhmaxH/zQv9ncR3q+3RCioD/9lrj7Th4erKUU5XKFItmWTPUkc
	g0EX61BiS2NnsS5hHKSS5gY96y/8Ypz0WsU6NDUJabBRh56wPXwIuGFqK3LoN/dbFX9
	ECdLMYTuloBJu+eKzkvkJbEttW+UlN2lswoZ6lko=
Received: by mx.zohomail.com with SMTPS id 1747256649706755.5056830075335;
	Wed, 14 May 2025 14:04:09 -0700 (PDT)
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
In-Reply-To: <497D0D1E-B607-4822-A083-C0C5B9DB3C57@collabora.com>
Date: Wed, 14 May 2025 18:03:54 -0300
Cc: Miguel Ojeda <ojeda@kernel.org>,
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
 Thomas Gleixner <tglx@linutronix.de>,
 linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <F77F7ABE-3A11-4DF5-942A-2B4FED0AD99E@collabora.com>
References: <20250514-topics-tyr-request_irq-v3-0-d6fcc2591a88@collabora.com>
 <20250514-topics-tyr-request_irq-v3-1-d6fcc2591a88@collabora.com>
 <D9W5IX9Z7QMU.3DL48O2KYTN1Z@kernel.org>
 <497D0D1E-B607-4822-A083-C0C5B9DB3C57@collabora.com>
To: Benno Lossin <lossin@kernel.org>
X-Mailer: Apple Mail (2.3826.500.181.1.5)
X-ZohoMailClient: External


>> Didn't your commit message mention SpinLockIrq?
>=20
> This is not upstream yet. I removed all mentions of SpinLockIrq on
> purpose, but I apparently missed some as you say.
>=20
> We definitely need interrupt-aware spinlocks to access the data in =
interrupt
> context. It is just a matter of deciding whether we will be referring =
to a type
> whose API is not 100% formalized as we speak, or to SpinLock itself - =
which is
> already upstream - with a caveat. I chose the latter.
>=20

Minor correction =3D> to access the data in process context.

=E2=80=94 Daniel=
