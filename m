Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B1A2836A5
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 12:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744289508; cv=none; b=TSXcKt++TSXGlsrFAMLkDOFNfSbaIxMAxfMsDK5DpjzZpoE9sFY2OShkS4ut0e7rERLPea0eClJfrTARLhgwOTE6YFHlM1h79ANYj82tu6QKFibHNuV5seRQSHGgaJDbDX8XG/woMFjZq/42czRowRW0dEAcDawh02GX/DER+zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744289508; c=relaxed/simple;
	bh=xfUCVqF4JldfeT25bpk33lgQ9gtBH2lU4BDC96N9pwM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VB1xFYKlDJTvzPBDLH8+QcGMWNNFtrJlhQ49+dIT2IDvgbnE9pofXY5D/O1/zgnusVP1BMi8AKVEN74hfg/KslNsOsNnnlbV+eFiiySeqJr5Sg+xC69UOvNDFhPj/lXfwMw5vlQAMBP9F/jWLmbIKVFMIm+/+cDit/fCE8OI1GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=x4HPNisg; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="x4HPNisg"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=a4JIrqkWV6pq9frxXOKtyCpnd6YTeQcQLBm37c334dE=; b=x4HPNisgK9SWArZLW9LHQRU9B/
	sdGwquoaDF0JSYE516Kwo4fHX/sEeACBtYq4h0r2wGgB4qh7P1qTIgC31aKiNueTsIKA6zY2I4v/3
	O/qCzfycQpiRSt8I5PgyUBnE3AzlsbwM9OVpsbbJjDlP8s8RRk4wzvlUVWHt4am2Bdq57msyZj2oj
	dQjEgOqO4LQbKpWJGJ8SZpBUH5ScSJB2I3unnZwUqpwe0LH3pwbuJvPrvd26Pyb7kCa6Ov9raMLsu
	p/28fm94cpHLhbllptaNhGD0/rlwOnRKGTZThJC8lmm9Aj67zgWyDfkNvhojuZ54DU9vWfjxySrgB
	cAiUihSQ==;
Received: from i53875b95.versanet.de ([83.135.91.149] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u2rNX-0007NU-4d; Thu, 10 Apr 2025 14:51:35 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: lumag@kernel.org, Andy Yan <andyshrk@163.com>
Cc: cristian.ciocaltea@collabora.com, mripard@kernel.org,
 neil.armstrong@linaro.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH] drm/bridge: dw-hdmi: Avoid including uapi headers
Date: Thu, 10 Apr 2025 14:51:34 +0200
Message-ID: <3022515.VdNmn5OnKV@diego>
In-Reply-To: <20250314075754.539221-1-andyshrk@163.com>
References: <20250314075754.539221-1-andyshrk@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Andy,

Am Freitag, 14. M=C3=A4rz 2025, 08:57:47 Mitteleurop=C3=A4ische Sommerzeit =
schrieb Andy Yan:
> From: Andy Yan <andy.yan@rock-chips.com>
>=20
> It is not recommended for drivers to include UAPI header
> directly.
>=20
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>


But looking at=20
	scripts/get_maintainer.pl -f drivers/gpu/drm/bridge
it seems like your cc-list is missing bridge people:

Andrzej Hajda <andrzej.hajda@intel.com> (maintainer:DRM DRIVERS FOR BRIDGE =
CHIPS)
Neil Armstrong <neil.armstrong@linaro.org> (maintainer:DRM DRIVERS FOR BRID=
GE CHIPS)
Robert Foss <rfoss@kernel.org> (maintainer:DRM DRIVERS FOR BRIDGE CHIPS)
Laurent Pinchart <Laurent.pinchart@ideasonboard.com> (reviewer:DRM DRIVERS =
=46OR BRIDGE CHIPS)
Jonas Karlman <jonas@kwiboo.se> (reviewer:DRM DRIVERS FOR BRIDGE CHIPS)
Jernej Skrabec <jernej.skrabec@gmail.com> (reviewer:DRM DRIVERS FOR BRIDGE =
CHIPS)


> ---
>=20
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/=
bridge/synopsys/dw-hdmi.c
> index 0890add5f707..306e09a24a1c 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -22,8 +22,8 @@
> =20
>  #include <media/cec-notifier.h>
> =20
> -#include <uapi/linux/media-bus-format.h>
> -#include <uapi/linux/videodev2.h>
> +#include <linux/media-bus-format.h>
> +#include <linux/videodev2.h>
> =20
>  #include <drm/bridge/dw_hdmi.h>
>  #include <drm/display/drm_hdmi_helper.h>
>=20




