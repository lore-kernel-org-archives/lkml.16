Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A7E180A80;
	Sat,  1 Feb 2025 12:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738412192; cv=none; b=NERvUepRVV70n2bJo576AAiO3x1ema40t1KRRN3lHx3O6JCfBbJR7qeSX8XybHsR2fNhKKQK4qwvFri1gWURh40qoM/zBec0Q5EkObFQqz2whZlPurVQpn6qInbjrNYZsIil7tPpJVzoRsOMZ8UGJ4gxZ7NkWBoT49EHvGe2Pq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738412192; c=relaxed/simple;
	bh=+CgwBaNs7f0YdCQF4Utemtm2lkPFC4UYGQ0xY49Lhxw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=s4YOcyPcibMWR14B+KDbG0ht4Vf+rro2yV72KcsqteLbqTCmhfJIO7XSdUP/mxVYI8uUaqZJJoY/vCr6VLCaaniQGdGk1s+fnPeaVyz/m5Nk7EpPp9NGfsgi5j0hOar+82l2Zv1U4JP4/VS4mq1akjlpaOFSRZJOOwMDvTRR8p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=dnIFoLKS; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="dnIFoLKS"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=IdbN/O7TC9GJuAxDBVNthbbIDsMGAMlqaYeodM4oHJA=; t=1738412188; x=1739016988; 
	b=dnIFoLKSHh612PnIPuD55K3nsWrY6YPrBVP1884DXbMnR/v42cKuAzP6THMlmUAEsdaZURGW2QV
	SGEg5BMKs9ej5yXCcxfuksZsm1MY7Q4uaKyO3/3d1HbXIi8D7HU9nehRxrDIVo6HuVuBhaX4lUovL
	3cyxhxLKXxe080sE236rUzlIoXxYJFaD3cxwgdK39cPmlvvW6r7f1PrauhiNgSzF2d8pb6hQZrVTI
	sP/H0zWuqpUF/vTNZlnbBuVjChiCH7dZAugHOQBVsEi84eH+3faofN+4YAzaLRmu2Z/mTLprp+SzC
	FS2mZkkRggcTjFdJMi4ZJ1pjjbv5c84fb/ew==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1teCQD-00000000HvD-3Nsl; Sat, 01 Feb 2025 13:16:25 +0100
Received: from [164.15.244.35] (helo=[10.66.67.227])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1teCQD-000000011fm-2Byn; Sat, 01 Feb 2025 13:16:25 +0100
Message-ID: <bebe04527833a0eb73b449068ed2f573bb95823e.camel@physik.fu-berlin.de>
Subject: Re: [PATCH] m68k: Do not include <linux/fb.h>
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Thomas Zimmermann <tzimmermann@suse.de>, gerg@linux-m68k.org, 
	geert@linux-m68k.org
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Date: Sat, 01 Feb 2025 13:16:21 +0100
In-Reply-To: <20250131144026.310672-1-tzimmermann@suse.de>
References: <20250131144026.310672-1-tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-ZEDAT-Hint: PO

Hi Thomas,

On Fri, 2025-01-31 at 15:40 +0100, Thomas Zimmermann wrote:
> The m68k architecture's source files does not require <linux/fb.h>.

Minor: Replace "does" with "do".

Adrian

> Remove the include statements.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  arch/m68k/kernel/setup_no.c | 1 -
>  arch/m68k/kernel/uboot.c    | 1 -
>  2 files changed, 2 deletions(-)
>=20
> diff --git a/arch/m68k/kernel/setup_no.c b/arch/m68k/kernel/setup_no.c
> index c926da9d5ec28..f9872098f5ca5 100644
> --- a/arch/m68k/kernel/setup_no.c
> +++ b/arch/m68k/kernel/setup_no.c
> @@ -21,7 +21,6 @@
>  #include <linux/sched.h>
>  #include <linux/delay.h>
>  #include <linux/interrupt.h>
> -#include <linux/fb.h>
>  #include <linux/module.h>
>  #include <linux/mm.h>
>  #include <linux/console.h>
> diff --git a/arch/m68k/kernel/uboot.c b/arch/m68k/kernel/uboot.c
> index 8bb1cb3a7490e..5e52ea150d5cb 100644
> --- a/arch/m68k/kernel/uboot.c
> +++ b/arch/m68k/kernel/uboot.c
> @@ -10,7 +10,6 @@
>  #include <linux/sched.h>
>  #include <linux/delay.h>
>  #include <linux/interrupt.h>
> -#include <linux/fb.h>
>  #include <linux/module.h>
>  #include <linux/mm.h>
>  #include <linux/console.h>

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
