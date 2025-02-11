Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81631F542E
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 10:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739268612; cv=none; b=NjkCASgeJ9s/Z0v572KN78I2b1JJe9kwxgU/N0XUMRRlEWapma3yqj9o9xQuPNu2jliNHr93M9sefjnb0iJdPFH85cwgWsvFWZhzOeLgtnYEMih1wRjYgMdE6UMF1NEr+d9ViRDBPTVmwBYY7Xg674PwDvykTYk26sbM/xrDYyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739268612; c=relaxed/simple;
	bh=GVVxknP8XcjV7IxcHxYqky6tQhaRT6+VsfH+h1D2T8g=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=ElJ+rREyucoMfw7hUe0er4Jpn8KeYyZPTxgIS35c75emuoaoRdJ/0D+v7U08hIegUhoCHACt/bElC5x6j2ktv9HKa+MoqZVGpeyqShjfg2QeedWC5TvYfCzaojDpfnkMfSS4gjSXM32AEhcnaOQM8G81CQUYhbMRFVCYvQDnn4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ueTynWnd; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ueTynWnd"
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1739268607;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V+gMOYvoWIt5nU3jlhjNHZLeP9/GydXZtu5uaVnrrrk=;
	b=ueTynWnd5MLaFyH1IO4YEHlbzsyJtELwNLq0Ww8MRFrSSbuyu9HduE5tXsBV7l8wRvIuXe
	YxosfzDMHZn8mkfgGY7QP3LP3ALT2PQn1TFFT802TfTpQnoX5o2HGnJUuRo4Zysi9u7wue
	AJzo80aRIIFIvy/nCiWJRYIcKDe+CtQ=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51.11.1\))
Subject: Re: [PATCH] powerpc: Transliterate author name and remove FIXME
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
In-Reply-To: <774CD605-AE6F-4D37-AB50-B9676858CDFA@linux.dev>
Date: Tue, 11 Feb 2025 11:09:54 +0100
Cc: Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <0C108CDE-EDFC-4F62-B749-FAFBECD86FCB@linux.dev>
References: <20241110162139.5179-2-thorsten.blum@linux.dev>
 <87v7wuy3p5.fsf@mpe.ellerman.id.au>
 <55B1EE24-BEC9-4A8D-84B0-ED32FCC070A5@linux.dev>
 <87v7weodqn.fsf@mpe.ellerman.id.au>
 <d9e232bb-5069-4526-b781-f4e316bda95d@csgroup.eu>
 <774CD605-AE6F-4D37-AB50-B9676858CDFA@linux.dev>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
X-Migadu-Flow: FLOW_OUT

On 7. Jan 2025, at 13:16, Thorsten Blum wrote:
> On 23. Nov 2024, at 11:19, Christophe Leroy wrote:
>> Isn't our file just a copy of the one from binutils ? Shouldn't we =
adjust it based on commit =
https://github.com/bminor/binutils-gdb/commit/2ce18a16268a ?
>=20
> It looks like it's a copy and the name is spelled the same as in my =
patch:
>=20
>  "Mimi Phuong-Thao Vo"
>=20
> What's missing to get this merged?

Anyone?

Thanks,
Thorsten=
