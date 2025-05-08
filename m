Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E44617A2E2
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 17:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746724092; cv=none; b=SyAKmWpeZBAfZ994pLyNX17yvwa19xE4plCD96WYVSKuaKpW5cVU8rphHyrqJzRjkmMUqS4FFjBmSxAp60p9UBBNRHD1+l9aVrw1p0YeKlHXqsPOdUA7o4/7aopx55jrtxpjoqXuh2J04/uZzd2AwRXiXfd4cAPIVQ3orjjmjzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746724092; c=relaxed/simple;
	bh=u4BVgpwlW3L+XA0sSf9CqoTwlFzxeaowJIuq6fa48JM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fgvsYH4jqyrlnz143YG0Z19Syr1zFLO7Z/sbILYQHP+kZAq/5c8iqPHlxTrD+91WgUunokScMvvo4qLKygLlIGGwgypznd/KCrRMfF61fltFbldApOjhTtuCJmwuN5YgvR80Z85VExLdb5uqvRga6DEMABeiO/8tkGepyQYT0g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <l.stach@pengutronix.de>)
	id 1uD4j8-0004jx-Ex; Thu, 08 May 2025 19:08:06 +0200
Message-ID: <a18f214ab0487a1c562f9e2f7f66ab1345925177.camel@pengutronix.de>
Subject: Re: [PATCH v2] drm/etnaviv: Fix flush sequence logic
From: Lucas Stach <l.stach@pengutronix.de>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, linux-kernel@vger.kernel.org
Cc: Russell King <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner
 <christian.gmeiner@gmail.com>, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>, Guido
 =?ISO-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 etnaviv@lists.freedesktop.org,  dri-devel@lists.freedesktop.org
Date: Thu, 08 May 2025 19:08:04 +0200
In-Reply-To: <20250508145624.4154317-1-tomeu@tomeuvizoso.net>
References: <20250507112131.3686966-1-tomeu@tomeuvizoso.net>
	 <20250508145624.4154317-1-tomeu@tomeuvizoso.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

Am Donnerstag, dem 08.05.2025 um 16:56 +0200 schrieb Tomeu Vizoso:
> We should be comparing the last submitted sequence number with that of
> the address space we may be switching to.
>=20
This isn't the relevant change here though: if we switch the address
space, the comparison is moot, as we do a full flush on AS switch
anyway. The relevant change is that with the old code we would record
the flush sequence of the AS we switch away from as the current flush
sequence, so we might miss a necessary flush on the next submission if
that one doesn't require a AS switch, but would only flush based on
sequence mismatch.

Mind if I rewrite the commit message along those lines while applying?

Regards,
Lucas

> Fixes: 27b67278e007 ("drm/etnaviv: rework MMU handling")
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_buffer.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_buffer.c b/drivers/gpu/drm/e=
tnaviv/etnaviv_buffer.c
> index b13a17276d07..88385dc3b30d 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
> @@ -347,7 +347,7 @@ void etnaviv_buffer_queue(struct etnaviv_gpu *gpu, u3=
2 exec_state,
>  	u32 link_target, link_dwords;
>  	bool switch_context =3D gpu->exec_state !=3D exec_state;
>  	bool switch_mmu_context =3D gpu->mmu_context !=3D mmu_context;
> -	unsigned int new_flush_seq =3D READ_ONCE(gpu->mmu_context->flush_seq);
> +	unsigned int new_flush_seq =3D READ_ONCE(mmu_context->flush_seq);
>  	bool need_flush =3D switch_mmu_context || gpu->flush_seq !=3D new_flush=
_seq;
>  	bool has_blt =3D !!(gpu->identity.minor_features5 &
>  			  chipMinorFeatures5_BLT_ENGINE);

