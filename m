Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B914E14D283
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 05:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743743404; cv=none; b=cFAJHj/kkv73p1FJryQEcUKRXsTVwfXgg5dyDM7DJOymepMZJHAGeh1+MSjDwZVlm71opEg3pfUjuSsJBFPAYHR2bPIuAqBTgH4IDEprwjFDWhJTxqKulVT9aOREpUctRgi+CjhunZ19dbXKEyv0hh54IvFN8lv/cT8P6wpYkNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743743404; c=relaxed/simple;
	bh=ZW+Sm8CQg4PZTX4baRjz/t9MMJShN+RVK3I3r7dLJ14=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=MsyN17kCK1tnoejDAe+3zJdm6IL7Dhc7VOZfKY+chawtvUu4O50mF107WJc+VhpWceoG72q+Z0wGMgkgFjbdXBxKu1r2DgYKHzLJLiH/F01WRAB2X+SstPVVGf5l/TAyXx1M/NjWGaZ2DO6U6wKxboVlXslVmlaiNTWSz74OLVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=bZ9IiSat; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="bZ9IiSat"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=content-transfer-encoding:from:mime-version:subject:date:
   message-id:references:cc:in-reply-to:to;
  bh=rcIEj9tAcLv8npsbk2TjLvic1LGJ5GO1UWVB8rPBpE0=;
  b=bZ9IiSatK/BlM1/ih70EXhQmUwI09sFzq3bKur8hV7QVdGWcRY2iH1rv
   8nkJNmP0Jrlzm+XpEr4b3gwQtTjAygh2a3Ds336Kxe/Tc/brdxOTDojMF
   5ZfDzfJbxm3Ui1nzC5LjTTlnmM9LAQZSbZZifWAL5wyUJZtb5vO+A+p+2
   Q=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.15,187,1739833200"; 
   d="scan'208";a="216305057"
Received: from 57.250.133.77.rev.sfr.net (HELO smtpclient.apple) ([77.133.250.57])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 07:09:53 +0200
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Julia Lawall <Julia.Lawall@inria.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v3] staging: rtl8723bs: modify struct field to use standard bool type
Date: Fri, 4 Apr 2025 07:09:42 +0200
Message-Id: <DD50035D-03F7-4EFD-B97E-BBEF11084146@inria.fr>
References: <Z+8NpFYvxPTvjGje@HP-650>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 outreachy@lists.linux.dev, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>
In-Reply-To: <Z+8NpFYvxPTvjGje@HP-650>
To: Samuel Adekunle Abraham <abrahamadekunle50@gmail.com>
X-Mailer: iPhone Mail (22C152)


Sent from my iPhone

> On 4 Apr 2025, at 00:37, Abraham Samuel Adekunle <abrahamadekunle50@gmail.=
com> wrote:
>=20
> =EF=BB=BFThe struct field uses the uint values 0 and 1 to represent false a=
nd
> true values respectively.
>=20
> Convert cases to use the bool type instead to ensure consistency
> with other parts of the containing code where true or false has
> been used.

This structure is changing size. You need to acknowledge that and argue why i=
t is ok.


> reported by Coccinelle:
>=20
> Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
> ---
> Changes in v3:
>    - Added more patch recipients
> Changes in v2:
>    - Improved commit message based on suggestion from Julia Lawal
>    - Clarity was provided to Greg Kroah-Hartman by Dan Carpenter on why
>    it is safe to make the change to the struct.
>=20
> drivers/staging/rtl8723bs/core/rtw_ap.c      | 2 +-
> drivers/staging/rtl8723bs/include/sta_info.h | 2 +-
> 2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl=
8723bs/core/rtw_ap.c
> index ed6942e289a5..82f54f769ed1 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_ap.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
> @@ -389,7 +389,7 @@ void update_bmc_sta(struct adapter *padapter)
>        psta->qos_option =3D 0;
>        psta->htpriv.ht_option =3D false;
>=20
> -        psta->ieee8021x_blocked =3D 0;
> +        psta->ieee8021x_blocked =3D false;
>=20
>        memset((void *)&psta->sta_stats, 0, sizeof(struct stainfo_stats));
>=20
> diff --git a/drivers/staging/rtl8723bs/include/sta_info.h b/drivers/stagin=
g/rtl8723bs/include/sta_info.h
> index b3535fed3de7..63343998266a 100644
> --- a/drivers/staging/rtl8723bs/include/sta_info.h
> +++ b/drivers/staging/rtl8723bs/include/sta_info.h
> @@ -86,7 +86,7 @@ struct sta_info {
>    uint qos_option;
>    u8 hwaddr[ETH_ALEN];
>=20
> -    uint    ieee8021x_blocked;    /* 0: allowed, 1:blocked */
> +    bool ieee8021x_blocked;
>    uint    dot118021XPrivacy; /* aes, tkip... */
>    union Keytype    dot11tkiptxmickey;
>    union Keytype    dot11tkiprxmickey;
> --
> 2.34.1
>=20

