Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F702737F9
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 09:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.38.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751016246; cv=none; b=gJ/prLnzOQT45XT3xg8HZJbiKms5uBI/nnFEsvuGfjcjmG65+PXpLR2/Li5nhAR9cLdHLIR3wyQbiugY8vKfFOps3fzccOPiyIPw8fakSXUycmJRusvazmQIHuU2gapSip9C/4guW7pVHuLFpdEQHF2lXoDxdyntQhnNe/D3k/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751016246; c=relaxed/simple;
	bh=VKQBj2stu7iXeJd9KQUHIkIoUgY637IlmEQqau/g0Jk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lcwP7i7E3z4ZSNcVEMlOm99rgulbzWA6RNsXwATNYFZtkvoC/TKTNB0tuLvSWqo00lbdoOp40H+J9tm6qtWLrlew5vooKgRw7sdY5JVABsTdcn40YGEVdvOHMwctldjlqEY14RM9nKGvF8jmPRbsvY3RDXMGPmd5o+8BoL3n43M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net; spf=pass smtp.mailfrom=sipsolutions.net; dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b=r6Tgp/P6; arc=none smtp.client-ip=168.119.38.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b="r6Tgp/P6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=J4ZjnT6oCMq1CKTCNR3HCJ0iSz8drwLRwfHKoiq9yKA=;
	t=1751016245; x=1752225845; b=r6Tgp/P6/GUZOIbQebXQIaXw2CEvcGL7OY/jmZ5zZvjVD1k
	3NAHvd01qqLsW9qFufVCRlSs+ws5ykLZXxPWU+G+0Q/ySsDzcRXDLpF8wrfYDbyXgwCVec14wAffx
	J4yQpI1ki4dVOIMNsYmkalYvIcpAfec0bynflemxLp9UkcEA3pSt/C4Mtqyfo8/vGzzhMi7ZCECVp
	GpDsr9JWidX+9yuayDuUJnbgNh5aMz0Jn5eztaCZzlqFSKYXK9nhevPLQSRA+EAqhoZm7qNiyMGDa
	eC7ieUUByA/uUqIDmFcVpXOvsf4McGUKFK7AmqpCe94K1FV0434P4dB9eZp16crQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1uV5JP-0000000DS2I-3RBo;
	Fri, 27 Jun 2025 11:24:00 +0200
Message-ID: <94de787f4c3ad6fc3a44c50c2a5d5311861ddd6c.camel@sipsolutions.net>
Subject: Re: [PATCH 1/1] um: virt-pci: Switch to
 msi_create_parent_irq_domain()
From: Johannes Berg <johannes@sipsolutions.net>
To: Nam Cao <namcao@linutronix.de>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Richard Weinberger
	 <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	linux-um@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Fri, 27 Jun 2025 11:23:58 +0200
In-Reply-To: <20250627084943.nCYOI4Vp@linutronix.de>
References: <cover.1750947651.git.namcao@linutronix.de>
	 <b911c2f15c031354850eee277a773832890c3c17.1750947651.git.namcao@linutronix.de>
	 <45f44f0298259abf1862b965805307b7c01a279d.camel@sipsolutions.net>
	 <20250627084943.nCYOI4Vp@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-malware-bazaar: not-scanned

On Fri, 2025-06-27 at 10:49 +0200, Nam Cao wrote:
>=20
> Thanks for testing! The later kernel crash should be fixed with:
>=20
> diff --git a/arch/um/drivers/virt-pci.c b/arch/um/drivers/virt-pci.c
> index e51a9357934da..557d93aea00a1 100644
> --- a/arch/um/drivers/virt-pci.c
> +++ b/arch/um/drivers/virt-pci.c
> @@ -407,7 +407,6 @@ static const struct irq_domain_ops um_pci_inner_domai=
n_ops =3D {
> =20
>  #define UM_PCI_MSI_FLAGS_REQUIRED (MSI_FLAG_USE_DEF_DOM_OPS		| \
>  				   MSI_FLAG_USE_DEF_CHIP_OPS		| \
> -				   MSI_FLAG_PCI_MSI_MASK_PARENT		| \
>  				   MSI_FLAG_NO_AFFINITY)

Can confirm that.

> I have no immediate idea about the lockdep warn, I don't see how the
> MSI_FLAG_PCI_MSI_MASK_PARENT flag can be related to that. Probably there'=
s
> another problem, let me stare at it..

Seems to go away as well, perhaps it's due to taking some wrong path
with the flag just prior to the crash?

IOW, works for me with the above change with no crash and no lockdep
warning either.

johannes
