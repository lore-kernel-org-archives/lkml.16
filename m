Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666B126771B;
	Wed,  2 Jul 2025 13:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751461570; cv=pass; b=pmFkEfc2KULVbg4HC36ikLEjbjHdb2mto8hBnLmLMb1qXosHU1nfrtOkDE1KKFWfxOqdvCRGSnU/+P61s8CP998+/cmvcW+0E+fWDm1EuFG01+oAgWt/v6t13Yk66OPBhEBpuuOy1DqIot7VcbM5hciyTXZ09+1LOfh2/nVQlF0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751461570; c=relaxed/simple;
	bh=sfT5q1GCk139yZl1ZuQRka7S8TZTkbjz7Bsz+AfeQxM=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=ol3wS+QIzMVSSltyBE+T+oS3Xzo+sphdycB4XOivHcghosOLIGGKZwdx1Yj7xuPiFyh7jyHS1f6+C+5HBJmb39oEA0yGZ1BU4n/Gau5A0aaLfy8CdOk8/44Yh9hV1naM2JQwhOVUWAXh6JE3BMT6VRckU84t0l8T4GJS/dg/d3E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=asR0ylms; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="asR0ylms"
ARC-Seal: i=1; a=rsa-sha256; t=1751461550; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mw/uMhCZAtozQK8r5zEYobiHKhAsQJ6FtLPilglRlmmbdNerjdFfrou2pnwG8WVrvSKFq72mAiDnwJ3Hj+G55W01gbQRCMGZLsPaU07+v4TmPK9+PoeUovxjMudIfCFJg7k3E2qP16gWlFin08o2xZDhsGV4sA39OGhJx6GLYPk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1751461550; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=sfT5q1GCk139yZl1ZuQRka7S8TZTkbjz7Bsz+AfeQxM=; 
	b=Me2RxfMQJqoAmUYXCncVN+j9vXzFTz23DLOGF6LBPsSkxxq2yJaKB7tCKbZ5RC7pQR5ILcyfnC4h5TSqCozQ+7rce6KUTV7WYEJBkfjUWNHqzgyXZLQ6atZqdCI0LzEC0h7TBNm2a9M+/hlFclj8nvHSLR3ytMqPXMu2m6nqdd8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751461550;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=sfT5q1GCk139yZl1ZuQRka7S8TZTkbjz7Bsz+AfeQxM=;
	b=asR0ylmsiL5OlGhDTmx9mTyfpVj8EyXzsuoogSadSza1PuGApeBCoZiTX/+jFWrC
	NogYShRFABZZ3iJGJpEouZcz/JxQ4POXP+EuCdOVcOcm5U26U8teTmLfzs7YlEtJ5YR
	7V6zWbTduYK1oJ2Zkk6I3e8NQBA9ZG0UGZlO5gqo=
Received: by mx.zohomail.com with SMTPS id 1751461547793174.49808757376593;
	Wed, 2 Jul 2025 06:05:47 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH v7] rust: kernel: add support for bits/genmask macros
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <CAH5fLgicRxTsjpBKXDrcJSibOq7HQOsTXdKEBnH1-K8Jt=S-xA@mail.gmail.com>
Date: Wed, 2 Jul 2025 10:05:33 -0300
Cc: Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Benno Lossin <lossin@kernel.org>,
 linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <067C1035-2FD5-4186-A45C-F6F7444F05E2@collabora.com>
References: <20250623-topic-panthor-rs-genmask-v7-1-9f986951e7b5@collabora.com>
 <CAH5fLgicRxTsjpBKXDrcJSibOq7HQOsTXdKEBnH1-K8Jt=S-xA@mail.gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
X-Mailer: Apple Mail (2.3826.600.51.1.1)
X-ZohoMailClient: External

Hi Alice,

> On 2 Jul 2025, at 07:27, Alice Ryhl <aliceryhl@google.com> wrote:
>=20
> On Mon, Jun 23, 2025 at 10:18=E2=80=AFPM Daniel Almeida
> <daniel.almeida@collabora.com> wrote:
>>=20
>> In light of bindgen being unable to generate bindings for macros, and
>> owing to the widespread use of these macros in drivers, manually =
define
>> the bit and genmask C macros in Rust.
>>=20
>> The *_checked version of the functions provide runtime checking while
>> the const version performs compile-time assertions on the arguments =
via
>> the build_assert!() macro.
>>=20
>> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
>=20
> Is it intentional that the macros are not available for usize?
>=20
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>


Not intentional, but do we need it?

I really have no idea whether it=E2=80=99d be useful really.

=E2=80=94 Daniel=
