Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861AE38DD1
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 14:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747145439; cv=none; b=GIXGqfjuSFhfy0LsY2KMHEHNJ++A9EiRXaiZMfAYnw72U7aXMNOjRfQWdBrysuuVsIdml0IyUfNUVGAg+1vBOF8aiLIF6bWpVgFqmOqtsdRzp3CQBWOb1WqmRMK0iIifZkFXnDzPjRowS17zGJVoHjfNx0qb/R3I/iDbcPhlG4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747145439; c=relaxed/simple;
	bh=RuHV0JP63FUbbTvqcpXUe1mpiQvpEiCoZ6sJCLI8njE=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=Vb9/jzn/3LonXVT8hFWNFAAOpVbDIyFD9I7hsGJ1a4Hg9g/HQ1FwjZPJwVfiZ7m2e4M7cphPdXdGLpNVREbMTfxS8sr3WmUGWT/JUv+yUR0c8Kd/ozIniYpcSNi8liYxsXy0pbIAyYuoV0jgQJaWInKE/VlHNPWOtHbIGphUI/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=bRByksJT; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="bRByksJT"
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747145434;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WJxlQK2BLgRievfiJv78ygfw01x+UGw/l/TDAlxIbio=;
	b=bRByksJTllYyII1FKBTMUY/MK+KgwgVbDRWKIpowlDva0i7U+YGZ21lCB2I1cVjASFQjjI
	3BoASqJrxPBPHCXDYEdFA6GlaVCQjlKbTrKg5eLMhs0KCeqBNRJaHGltS/1Ojx3kv08Fo8
	to7EiawZtqOGCmYCgU07/RhdBHuWFRw=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51.11.2\))
Subject: Re: [PATCH] powerpc: Transliterate author name and remove FIXME
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
In-Reply-To: <774CD605-AE6F-4D37-AB50-B9676858CDFA@linux.dev>
Date: Tue, 13 May 2025 16:10:21 +0200
Cc: Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <504A9138-865E-4CB3-8E1C-E19C4B86F1D3@linux.dev>
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

Does it make sense to resubmit this or do we leave the name and the
FIXME as is?

Thanks,
Thorsten

