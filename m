Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235F11DFE8
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 10:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.208.246.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747391279; cv=none; b=TMITKhx4PYCUSbrDIFrR1ZKrOCUt+Yxj35jAt7ICmNruNYSHmGPm+AxNzQDOlFuKMQEmGqJdGqZk8OiZb9JDyiuTasygu/kyFPRfvT+3sTRnpLrFR+C2XL7tL/uaSdeAIk10NO1LuckxHIYZrzNc3GeCT7Nur3o1eANYH2LPwew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747391279; c=relaxed/simple;
	bh=AKFCODECv+RIDFEhuXs9YRPLfS90Hd9W0nq4d89zy1Q=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rb9D0GNWHpJaUH4/FrGsQS6EOH6rMcrvuepEDaNNzRGiCL+JntyH3AtB8Lh0IbiqkalnqSBMwroW6W01NIUlLBk9mxSl4ftTnZVIAZLlGHIYRsxvmYEALZTUpRGQFPIrOmVHd/u9WYrFAprKlhwMcm4+gUEzp6Q9nNLKbrU+HgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site; spf=pass smtp.mailfrom=xry111.site; dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b=DgkbtHsx; arc=none smtp.client-ip=89.208.246.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xry111.site
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b="DgkbtHsx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1747391277;
	bh=AKFCODECv+RIDFEhuXs9YRPLfS90Hd9W0nq4d89zy1Q=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=DgkbtHsxkx33k2kNb/yYAtAR01gicGDKJrGWDLwfQShE4DJbYd7jXFW9zIrDPi6no
	 f1iaRjHUno99jiuhO85kWVEE7ntmFIgkutN/YusXX4gAukPesxTq5bSRgOUwVqSVgl
	 rmp61pspICYvnvj5yELNHaNy2Ub6PJhOg1RkO0Rw=
Received: from [IPv6:240e:457:1000:4d1d:620b:9b2:5a59:f0a1] (unknown [IPv6:240e:457:1000:4d1d:620b:9b2:5a59:f0a1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 6F58665F62;
	Fri, 16 May 2025 06:27:52 -0400 (EDT)
Message-ID: <af6f08bac8cdd68d7b839cac382a7696c3cc599a.camel@xry111.site>
Subject: Re: [PATCH v2] arm64: Add overrride for MPAM
From: Xi Ruoyao <xry111@xry111.site>
To: Ben Horgan <ben.horgan@arm.com>, James Morse <james.morse@arm.com>, Marc
 Zyngier <maz@kernel.org>, Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>, Mingcong Bai
 <jeffbai@aosc.io>
Date: Fri, 16 May 2025 18:27:47 +0800
In-Reply-To: <ead19392-a8d3-4c1e-95db-d5cbf40c66fa@arm.com>
References: <20250402031603.35411-1-xry111@xry111.site>
	 <ead19392-a8d3-4c1e-95db-d5cbf40c66fa@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2025-05-13 at 11:42 +0100, Ben Horgan wrote:

/* snip */

> > diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeat=
ure.c
> > index 9c4d6d552b25..44dcc0037ec2 100644
> > --- a/arch/arm64/kernel/cpufeature.c
> > +++ b/arch/arm64/kernel/cpufeature.c
> > @@ -88,6 +88,7 @@
> > =C2=A0=C2=A0 #include <asm/mte.h>
> > =C2=A0=C2=A0 #include <asm/hypervisor.h>
> > =C2=A0=C2=A0 #include <asm/processor.h>
> > +#include <asm/ptrace.h>
> Unused include?

Oops, it's a leftover from v1.

I've sent v3 to remove this and fix the typos in subject and comment:
https://lore.kernel.org/all/20250516102556.9688-1-xry111@xry111.site/.

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
