Received: from mailrelay-egress12.pub.mailoutpod2-cph3.one.com (mailrelay-egress12.pub.mailoutpod2-cph3.one.com [46.30.211.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3958023C4FD
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 21:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.211.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750887434; cv=none; b=kohSA4Yw5Tgsa2T8rAs37kjby7/W8EGCDQQH9ylQd8gLdwnzfVvlVqoYIpCUn/G/zxknmAPJGqWElhhB9mq2XHgDqwYhJy512mHPjhVpfW8mv4m0qP+fou9P0Tjgy+rcX45J9FrxZVybgDjhNnFqFNI26X+y3abf6tcBBk8X55M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750887434; c=relaxed/simple;
	bh=ilbQaLsXwENndSBw51PdUvOjK/dnnDy97QH4tnfKTqY=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=C9jF5Euy5RxHOpMCOTFzkHNa/qfO3TrRIOavkXoOqOYVAGcCwZcmaSRP28MQ9JWw7YR8kLyWhTv9B3juqEw4QvAVXJFAP2TZOSwQUXeV30bcfaHFkCvdYzCowZf80Kxs70KwzzNMNb6TeaiDbJxsIfKE/D63R4E3G12hSYKW8t4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se; spf=none smtp.mailfrom=konsulko.se; dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=Ysa/HyK5; dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=GYrtw5Pb; arc=none smtp.client-ip=46.30.211.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=konsulko.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="Ysa/HyK5";
	dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="GYrtw5Pb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1750887423; x=1751492223;
	d=konsulko.se; s=rsa1;
	h=to:references:message-id:content-transfer-encoding:cc:date:in-reply-to:from:
	 subject:mime-version:content-type:from;
	bh=ilbQaLsXwENndSBw51PdUvOjK/dnnDy97QH4tnfKTqY=;
	b=Ysa/HyK5riIGun5j2VqbcimrgaZ+W2D3nTRJixRgfzKt4dLpfIgOx4xRjnpYsDKvuxUL80XzlTlFH
	 qb0Rny3CXFHeFEAInKijh2fkBuW3D54DEabb7cikrfWEJt1pnbN1ZObSBL60yuzOyTiVYp4w9HuVzI
	 TSko0zGc6sdxQsXw67TuoTBVt83hEHkgMcmyWjcPqQb/mYe6MUYJAZ/E5bCrDqdtB49ahNKqPLMj0n
	 D16tTAa4O+uD9YC22fqohubvuIaHvr2E3n1VM0btS8shYMFp028kZQmwTPAheJPigB7Z/GFLcSEoYR
	 BcyzoHndW/hA/3fOuMhJO0I2cgPmXZA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1750887423; x=1751492223;
	d=konsulko.se; s=ed1;
	h=to:references:message-id:content-transfer-encoding:cc:date:in-reply-to:from:
	 subject:mime-version:content-type:from;
	bh=ilbQaLsXwENndSBw51PdUvOjK/dnnDy97QH4tnfKTqY=;
	b=GYrtw5PbUKgz41A/YcEXPUOfdZj/NjQyRFx4uD7e+b+BBE7X2ADppPdLYFEFyrBy+sXAPNlXu0o4Q
	 RQIdnvnBQ==
X-HalOne-ID: 88763f13-520c-11f0-9217-4f541c8bf1cc
Received: from smtpclient.apple (c188-150-224-8.bredband.tele2.se [188.150.224.8])
	by mailrelay3.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
	id 88763f13-520c-11f0-9217-4f541c8bf1cc;
	Wed, 25 Jun 2025 21:37:03 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.200.121\))
Subject: Re: [PATCH v3 0/2] support large align and nid in Rust allocators
From: Vitaly Wool <vitaly.wool@konsulko.se>
In-Reply-To: <20250625143450.2afc473fc0e7124a5108c187@linux-foundation.org>
Date: Wed, 25 Jun 2025 23:36:53 +0200
Cc: Danilo Krummrich <dakr@kernel.org>,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 Uladzislau Rezki <urezki@gmail.com>,
 Alice Ryhl <aliceryhl@google.com>,
 rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <1117A060-F235-4F13-99B7-F67FAE1B5683@konsulko.se>
References: <20250625062917.3379804-1-vitaly.wool@konsulko.se>
 <20250625141022.e65e4a9b8377d4879ad7065e@linux-foundation.org>
 <aFxnAjUQ2n14D7Ya@cassiopeiae>
 <20250625143450.2afc473fc0e7124a5108c187@linux-foundation.org>
To: Andrew Morton <akpm@linux-foundation.org>
X-Mailer: Apple Mail (2.3826.200.121)



> On Jun 25, 2025, at 11:34=E2=80=AFPM, Andrew Morton =
<akpm@linux-foundation.org> wrote:
>=20
> On Wed, 25 Jun 2025 23:15:46 +0200 Danilo Krummrich <dakr@kernel.org> =
wrote:
>=20
>>> What is the preferred merge path for this series?
>>=20
>> I can take it through my Rust alloc tree, but I think it would =
probably be
>> better you take it through the mm tree, since I don't expect this to =
conflict
>> with anything else in my tree anyways.
>=20
> No probs.
>=20
>> The Rust changes gonna need some more discussion though.
>=20
> Great, I'll add a note-to-self that discussion is ongoing.
>=20

Awesome, thank you very much! The first patch is unlikely to need a =
change, the second one will be reworked as discussed with Danilo and the =
plan is that I post the new version tomorrow or on Friday.

~Vitaly=
