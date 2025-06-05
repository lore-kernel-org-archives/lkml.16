Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239DC1E519;
	Thu,  5 Jun 2025 14:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749133830; cv=pass; b=PaJhnRtmC3F08NfYgTQ+xsiYUgNtFvoKzvJDlE5A1tCchYVZg5sXDSnKk97925kqW9nzjB+13zx7ZKLPfiwdiyhBX8hr/KDSXM6Sj2PEfw/ah6wutUK0aZ3c8syaWM+W3mqVNfipZF2LqyGBVE1TpXdQhxWNs8ngcXMBkrzUqlQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749133830; c=relaxed/simple;
	bh=dOKX5XgQWui0ZH6Gq6gTWPMVx1EqSN+SXdKEnQh6sz8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o+oVkrig4ZhSrbaAMnF9+AN+VP+Cdi+RXVeHQWH5f/LLqO8EvBzK40DnHAv0Q7QgeIqB/5yt94OnnDVFhGA11MB2BT9BT1wV8rK6cuFb1mRYZEBBVOYEXgRzuw7oxJk5ehcwAZSim2tiYhVNx1tGovqV05+WiVeLMbygmN8IhQg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=Rrj3d25/; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="Rrj3d25/"
ARC-Seal: i=1; a=rsa-sha256; t=1749133806; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Cm6ZjglNs1wvYweT9Us5An1inTGf+KVBAMEoRfRgpwb/tVgCvqw5/BBIb12lFIcVoJzKO8ps4bXSaQgl0MkA9akys2LOITPXnPSNa9Xu7pS7x74JDhDglcfp4dQQ2UI9G++tEWnV6bQNYjfOcQEZKZVuXukoAxESDeX6J+IdFvA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1749133806; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=resss7K4qvU6NWyxFJWLS6WsVQuzoxAMiEubRGdhp+M=; 
	b=KuaIYvqILDw8UfenDJos4jntoe/D5HYkaffoElx+5GCNVyVzIuEgDstaVqOBxoplsXs1f2ybuT8n4KRDqEpX9jYHU/GjZim5ncbTThEUhWvCP36TwnyFuN2+wFscmmrbyG8xZQxQgu4XXe0bfNUClB2ckaswZs67NRHYZVF1Tvw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1749133806;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To:Cc;
	bh=resss7K4qvU6NWyxFJWLS6WsVQuzoxAMiEubRGdhp+M=;
	b=Rrj3d25/g82afDgjAU4l4eHRMxr+5QuKjS82B7ekAYmIf8HM3Jp1zDRmrF59/4Yg
	iZETA2HIRQSDRoveFZHmj7SdN/Nrs3GLyCFwomxsrp3e3OYtx2p/jMOdcFfjGAEQaiY
	pGHzEU0GV9e+/ZmytoJkzRuWXsKLuUl5oQFO+3Ks=
Received: by mx.zohomail.com with SMTPS id 1749133803848946.3319019454383;
	Thu, 5 Jun 2025 07:30:03 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Pei Xiao <xiaopei01@kylinos.cn>
Subject:
 Re: [PATCH 1/2] ASOC: rochchip: Simplify the condition logic in
 rockchip_sai_xfer_stop
Date: Thu, 05 Jun 2025 16:30:00 +0200
Message-ID: <5905546.31r3eYUQgx@workhorse>
In-Reply-To: <3f668462-ac5f-49fa-bd9d-140d32fc9627@kylinos.cn>
References:
 <cover.1749006565.git.xiaopei01@kylinos.cn> <5104592.0VBMTVartN@workhorse>
 <3f668462-ac5f-49fa-bd9d-140d32fc9627@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Thursday, 5 June 2025 03:57:54 Central European Summer Time Pei Xiao wro=
te:
>=20
> =E5=9C=A8 2025/6/5 01:23, Nicolas Frattaroli =E5=86=99=E9=81=93:
> > On Wednesday, 4 June 2025 05:13:29 Central European Summer Time Pei Xia=
o wrote:
> >> cocci warning:
> >> ./sound/soc/rockchip/rockchip_sai.c:387:8-10:
> >> 	WARNING: possible condition with no effect (if =3D=3D else)
> >>
> >> Simplify the condition logic in rockchip_sai_xfer_stop() by removing t=
he
> >> redundant SNDRV_PCM_STREAM_PLAYBACK branch. The modified logic now:
> >> 1. For stream < 0: handles both playback and capture
> >> 2. For all other cases (both PLAYBACK and CAPTURE):
> >>    sets playback =3D true and capture =3D false
> >>
> >> Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
> >> ---
> >>  sound/soc/rockchip/rockchip_sai.c | 3 ---
> >>  1 file changed, 3 deletions(-)
> >>
> >> diff --git a/sound/soc/rockchip/rockchip_sai.c b/sound/soc/rockchip/ro=
ckchip_sai.c
> >> index 602f1ddfad00..79b04770da1c 100644
> >> --- a/sound/soc/rockchip/rockchip_sai.c
> >> +++ b/sound/soc/rockchip/rockchip_sai.c
> >> @@ -384,9 +384,6 @@ static void rockchip_sai_xfer_stop(struct rk_sai_d=
ev *sai, int stream)
> >>  	if (stream < 0) {
> >>  		playback =3D true;
> >>  		capture =3D true;
> >> -	} else if (stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK) {
> >> -		playback =3D true;
> >> -		capture =3D false;
> >>  	} else {
> >>  		playback =3D true;
> >>  		capture =3D false;
> >>
> > You can probably get rid of the locals playback and capture altogether:
> >
> >     static void rockchip_sai_xfer_stop(struct rk_sai_dev *sai, int stre=
am)
> >     {
> >         unsigned int msk, val, clr;
> >
> >         msk =3D SAI_XFER_TXS_MASK;
> >         val =3D SAI_XFER_TXS_DIS;
> >         clr =3D SAI_CLR_TXC;
> >        =20
> >         if (stream < 0) {
> >             msk |=3D SAI_XFER_RXS_MASK;
> >             val |=3D SAI_XFER_RXS_DIS;
> >             clr |=3D SAI_CLR_RXC;
> >         }
> >
> >         regmap_update_bits(sai->regmap, SAI_XFER, msk, val);
> >         rockchip_sai_poll_stream_idle(sai, true, stream < 0);
> >
> >         rockchip_sai_clear(sai, clr);
> >     }
> >
> > but this in general makes me suspicious of the intent of the code in
> > the first place. Playback always being true and capture only being
> > true if playback is also true seems odd. Checking the callsites of
>=20
> Yes,it's very odd to me too.So I send this patch to ask for your advice.
>=20
> > this function confirms my suspicions that while this fixes the cocci
> > warning, it just means the code is now intentionally broken.
> >
> > This here may be closer to the original intent:
> >
> >     static void rockchip_sai_xfer_stop(struct rk_sai_dev *sai, int stre=
am)
> >     {
> >             unsigned int msk =3D 0, val =3D 0, clr =3D 0;
> >             bool capture =3D stream =3D=3D SNDRV_PCM_STREAM_CAPTURE || =
stream < 0;
> >             /* could be <=3D 0 but we don't want to depend on enum valu=
es */
> >             bool playback =3D stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK |=
| stream < 0;
>=20
>=20
> bool invalid =3D  stream < 0;=20

This isn't correct, -1 isn't passed as invalid but as both streams. This is
because it wants to pass something as an argument from the asoc core
directly in one code path (rockchip_sai_trigger to rockchip_sai_stop to
rockchip_sai_xfer_stop) but it also wants to clear both streams at once
in a different code path, and the enums aren't powers of two so it can't
just be flags bitwise-OR'd together.

>=20
> bool capture =3D  stream =3D=3D SNDRV_PCM_STREAM_CAPTURE || invalid;=20
>=20
> bool playback =3D stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK || invalid;
>=20
> Would this modification be acceptable?=20
>=20
> It could shorten each line since the stream value only needs to be evalua=
ted once.

This isn't really the right place for microoptimisations and the compiler i=
s likely
doing this for us already anyway.

Kind regards,
Nicolas Frattaroli

>=20
> >             if (playback) {
> >                     msk |=3D SAI_XFER_TXS_MASK;
> >                     val |=3D SAI_XFER_TXS_DIS;
> >                     clr |=3D SAI_CLR_TXC;
> >             }
> >
> >             if (capture) {
> >                     msk |=3D SAI_XFER_RXS_MASK;
> >                     val |=3D SAI_XFER_RXS_DIS;
> >                     clr |=3D SAI_CLR_RXC;
> >             }
> >
> >             regmap_update_bits(sai->regmap, SAI_XFER, msk, val);
> >             rockchip_sai_poll_stream_idle(sai, playback, capture);
> >
> >             rockchip_sai_clear(sai, clr);
> >     }
> >
> >
> > Please let me know whether this looks right to you.
>=20
> thanks=EF=BC=81
>=20
> Pei.
>=20
> > Kind regards,
> > Nicolas Frattaroli
> >
> >
>=20




