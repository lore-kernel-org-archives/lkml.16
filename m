Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31EEF18FC80
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 08:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.208.246.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746952378; cv=none; b=ISyuM5/lTF5cfJOc5QBKJHUr83aMm4RCOX160eD75TES3bYbLn/D3oQvfrXraQookNFDejiubxsoskESrUu0v+aVZqndvdMOmTNhGS24MFlSGyw4Yz0kEzgfiCmAK/i6brl0nJChuLQfSsKooaLhIu3YimW2Y6ZhQc6sL2VP3X4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746952378; c=relaxed/simple;
	bh=EJ+oZpbOIRUh6eg8KwjLoofSwHDEYp16eNDo73C/hic=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sC6DRsWif98PsILVJl65GvFLKzx3aULvgE7JnR38LwuIvsZi6X7oYUUAOboYJP7fkRdr39am4DcmETvVjWC/tTxop8DsfbbojfZDQs0OSUxFWIGCStuU/z233+OFStSzzpnKnLYxjefz3t/ef1nCLR+M/T23NKFkumCu1ZSV/Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site; spf=pass smtp.mailfrom=xry111.site; dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b=V141oJNz; arc=none smtp.client-ip=89.208.246.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xry111.site
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b="V141oJNz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1746952002;
	bh=EJ+oZpbOIRUh6eg8KwjLoofSwHDEYp16eNDo73C/hic=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=V141oJNzWHmHvuq1fYeNvh0N5iDxba+4Tghv1QI1qKkJcBosIe7F2I7zkWej02nNx
	 +wAW+0+Wc69shSQCNiwVzp8kELgW4qOF1PlR9SQDPaiBBwxyxloTSIDnB5rsPmywKM
	 2iHr8JXKqUUDPXME2n21k8bpPi+FKGt6N2TRwfVc=
Received: from [192.168.124.38] (unknown [113.200.174.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id E219A65F62;
	Sun, 11 May 2025 04:26:40 -0400 (EDT)
Message-ID: <95e820cf9977b8d20d7cd3c64be463285ca57772.camel@xry111.site>
Subject: Ping^2: [PATCH v2] arm64: Add overrride for MPAM
From: Xi Ruoyao <xry111@xry111.site>
To: James Morse <james.morse@arm.com>, Marc Zyngier <maz@kernel.org>, 
 Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>, Mingcong Bai
 <jeffbai@aosc.io>
Date: Sun, 11 May 2025 16:26:38 +0800
In-Reply-To: <20250402031603.35411-1-xry111@xry111.site>
References: <20250402031603.35411-1-xry111@xry111.site>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2025-04-02 at 11:12 +0800, Xi Ruoyao wrote:
> As the message of the commit 09e6b306f3ba ("arm64: cpufeature:
> discover
> CPU support for MPAM") already states, if a buggy firmware fails to
> either enable MPAM or emulate the trap as if it were disabled, the
> kernel will just fail to boot.=C2=A0 While upgrading the firmware should =
be
> the best solution, we have some hardware of which the vendor have made
> no response 2 months after we requested a firmware update.=C2=A0 Allow
> overriding it so our devices don't become some e-waste.
>=20
> Cc: James Morse <james.morse@arm.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> Cc: Mingcong Bai <jeffbai@aosc.io>
> Signed-off-by: Xi Ruoyao <xry111@xry111.site>
> ---

Ping^2.

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
