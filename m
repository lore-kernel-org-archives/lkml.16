Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A574D1B960;
	Thu, 27 Mar 2025 12:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743077260; cv=pass; b=KddnBlPuItczT0EIaNSX+tkE7IXcevug3/dxKZMq3/QUuEYMoibwaBVgj+bkUrUE5UAq5AffSNQZ5fPj62Z7EJRqVXDEoUHo3wVsVoo9MDjmhLflS7OGPbaiWA5+5Ms8U5drr3Hhig28j7dkEPlbLrhLsALC5buaUTBQmZYiHLk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743077260; c=relaxed/simple;
	bh=BynpB61EpozAYgAFVJ1O9n90cvcD7/Y7nukc6SQNUno=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=Y2LSK/XmvyHH6Jj8YjscoutomHSK7X3/XixFcPlO3lvpJ/naKW3nHigsCc4cOh1qRVYb9z7Ui0JSc+fMEOArMJTSW+EL7gbItOfwKOP+m7VeXI0gGeXs2wkdWfcuNUUTqUx3zAjgpdYFT9WeV+Gt0rO6Q9md/kaMyQpq6mESw4Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=g4FxEEYM; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="g4FxEEYM"
ARC-Seal: i=1; a=rsa-sha256; t=1743077238; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=csFEIdcdIilbpYzxAHcCzAuwSXyxT0KX2uIlwxfZaBHIiT5pzNi1yDklJzP5bWRNLJLJ4q4iZEzNQTLKGKZdtOKJZAwc/S/Tq+ARZef3mwvKI0ldQSLVMnIatLhEqtxZvXCxsxO218HVVirfB/NrpQ0Nj0rqz1BUdbukbqvlUS8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1743077238; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=BynpB61EpozAYgAFVJ1O9n90cvcD7/Y7nukc6SQNUno=; 
	b=hKoHeLLAgMK4RxenLeK4kX/RiZvvnYtoxXlPf2pVzL7FN/IdNmMAtOtEImPzJagOmm3X4uP6Bnr/5F5TBuG8Zb4CLJyx4LkpymqbpJC92hMsQtUUDJJRyzy8uHF59Fgq2KRYd0ifZJ0Zw4AyqfwMILzsPewXmDlGLPInQWKJGD8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1743077238;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=BynpB61EpozAYgAFVJ1O9n90cvcD7/Y7nukc6SQNUno=;
	b=g4FxEEYMvw4rWm0fvpr9QGu0YyhGR2+l9Ide6UFgL3K6FCFy2ZCnfu37fmfEdfNz
	RcFL5HmACgl+Pg12aC6YG9RRPihZA9L4hSsExms4G+xlx9sHs9ksV2+MbTmUZS1+hBT
	HdSSwoxjfUozuQKgl6Sw9I7j2W3sOKbDFCVPwLvU=
Received: by mx.zohomail.com with SMTPS id 174307723515972.65411109826118;
	Thu, 27 Mar 2025 05:07:15 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: [PATCH RESEND v2] rust: regulator: add a bare minimum regulator
 abstraction
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <Z-U7ggqQAVq1IIJi@pollux>
Date: Thu, 27 Mar 2025 09:06:59 -0300
Cc: Mark Brown <broonie@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <7EE7F737-3DD8-45A4-8451-A6BF92F453BC@collabora.com>
References: <20250326-topics-tyr-regulator-v2-1-780b0362f70d@collabora.com>
 <a98eb789-4c49-4607-ad15-76e260888d64@sirena.org.uk>
 <0698A75E-D43C-4D02-B734-BFE1B3CC5D34@collabora.com>
 <f22cbd85-1896-4842-8746-d74ee160ab3c@sirena.org.uk>
 <D9ADCA08-C3B3-4964-BDB9-E62A2C7DE85F@collabora.com>
 <Z-U7ggqQAVq1IIJi@pollux>
To: Danilo Krummrich <dakr@kernel.org>
X-Mailer: Apple Mail (2.3826.400.131.1.6)
X-ZohoMailClient: External



> On 27 Mar 2025, at 08:50, Danilo Krummrich <dakr@kernel.org> wrote:
>=20
> On Thu, Mar 27, 2025 at 08:46:29AM -0300, Daniel Almeida wrote:
>> Any function that takes 'self' by value (i.e.: =E2=80=9Cself" instead =
of =E2=80=9C&self=E2=80=9D )
>> effectively kills it.
>=20
> I'm sure Daniel didn't mean it that way, but to avoid confusion, I =
want to
> clarify that a function that takes `self` as argument not necessarily =
results in
> `self` being destroyed. It could be moved into some other structure, =
directly
> returned by the same function etc.
>=20
> It's just that if the functions lets `self` go out of scope, then it's
> destroyed.
>=20

True, I found it easier to explain the current code by simplifying the =
story a
bit to fit the function we are discussing, but what Danilo said is what =
is
actually correct.

=E2=80=94 Daniel=
