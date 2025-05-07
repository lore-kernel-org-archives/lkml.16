Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2DBD25B671
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 12:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746619655; cv=none; b=JwWkIa2e0TUZNZf4ZFGs3PAbG4q+wf5QoHi6D2EYNG5ARYcCjPjkX+IBTjPi4pwClzJ2pUyOxF14jsEd2ReN8Uy0BddN5O1CIk1VRnuKxyWfe35ZSL0HBoPUN8kMo0BPjhmbFx5uHbuQiJdg67PquaP85zv8w7GtaSvtTsncJ9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746619655; c=relaxed/simple;
	bh=1bILE7b1cKhuZEEWiM570vrQti54ZeG2GhZ2W5BeGTM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Xy6qEy4a/h+e6q2W0q3ACVGeuFHFPJ9PajdU1A76JlbKrw5Ub7rpaFZ5z3VRMkYldiyxnqqzvkCzHGRdxF4oF30q7jC1Qidjzyrxcid6yfVgvEo84//LWsWT8ZrSlPMQPrJjIepONALfDZAbdV2XVK3l+Hi0jF5ISZKOCdwe9G0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <l.stach@pengutronix.de>)
	id 1uCdYa-0005tw-5I; Wed, 07 May 2025 14:07:24 +0200
Message-ID: <05552657cac9395b83d454e2ede05271d4c15abc.camel@pengutronix.de>
Subject: Re: [PATCH] drm/etnaviv: Fix flush sequence logic
From: Lucas Stach <l.stach@pengutronix.de>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, linux-kernel@vger.kernel.org
Cc: Russell King <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner
 <christian.gmeiner@gmail.com>, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, etnaviv@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Date: Wed, 07 May 2025 14:07:22 +0200
In-Reply-To: <20250507112131.3686966-1-tomeu@tomeuvizoso.net>
References: <20250507112131.3686966-1-tomeu@tomeuvizoso.net>
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

Am Mittwoch, dem 07.05.2025 um 13:21 +0200 schrieb Tomeu Vizoso:
> We should be comparing the last submitted sequence number with that of
> the address space we may be switching to.
>=20
> And we should be using the latter as the last submitted sequence number
> afterwards.
>=20
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_buffer.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_buffer.c b/drivers/gpu/drm/e=
tnaviv/etnaviv_buffer.c
> index b13a17276d07..865b07b14b38 100644
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
> @@ -399,6 +399,7 @@ void etnaviv_buffer_queue(struct etnaviv_gpu *gpu, u3=
2 exec_state,
>  			struct etnaviv_iommu_context *old_context =3D gpu->mmu_context;
> =20
>  			gpu->mmu_context =3D etnaviv_iommu_context_get(mmu_context);
> +			gpu->flush_seq =3D new_flush_seq;

As I said in IRC: this should not be necessary. If we switch to a new
MMU context, need_flush will also be set. The code under the need_flush
condition already includes this exact line.

Regards,
Lucas
