Received: from sonic301-21.consmr.mail.gq1.yahoo.com (sonic301-21.consmr.mail.gq1.yahoo.com [98.137.64.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD50274B2B
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 11:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=98.137.64.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751370979; cv=none; b=uIuSmfJI1pkzLZsZdnlWLf4GUgKh/zVspyrKk63AA1tfeUalhhVAnQuvr7z06UPomKXf5JDc/uvQfdCNCj21EJLSsTXYoY6N/et5WHZMyjgXM7z3jrUblcHiIlliYzU+cpa0fSJk3pJ1eQolD9Yn7Kcu7UcGhuVtvYMc1iFDTbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751370979; c=relaxed/simple;
	bh=hzuzRgmP/yoXgQh8FKoxrurOwmMjAhR3D+Whara43Ws=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=P+h3Aanq1B/GnGrzZ2MSgBheyMn9TNS8PjR8+Qcq5rsHGc3nV+zp00KgwXYg01IG9JOKHX7euYKN+ZmbeW+0ZK+F3kVDdG01b8shMqLl/xkyROiw2G6n5+HyyZtmkOAr6oEDbeaMaxgSIvg6MELIFMR3WcWViQXDDuPk8hcwRls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=aol.com; spf=pass smtp.mailfrom=aol.com; dkim=pass (2048-bit key) header.d=aol.com header.i=@aol.com header.b=JQAjAJrC; arc=none smtp.client-ip=98.137.64.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=aol.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aol.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aol.com header.i=@aol.com header.b="JQAjAJrC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1751370977; bh=gntt+k0Q9g+Ea+fbZ/JyDhnXZM80SSryV8+O9wXd6Z4=; h=Subject:From:To:Cc:Date:In-Reply-To:References:From:Subject:Reply-To; b=JQAjAJrCUX+nG0rCWLOgI5+m3X4pnNXjiEIrzWqvl3wg5aGJdFQ+76RVcQH7KNT3eqS0cK2MRmeoYB2FEk/qjoDtv3rcKzO7RtzueQw4wXQYBe0wuW5UsyjFmhldpqhR2xYPPqmU/B2zRJT+jjO+LM/TJqzBCdb7TjU8IVJuWo30BFL4jANWf+Bzh5ioIxlGaN6ipeBLpy2LGoQy/myNL7dsoqxuj8Kq2ReSfsrnzokfWCwDGamBFc0Xzo4eU+Kw/AWd4y6Xqz/fk2YIwcvxo+M9RaDSTVUTi8bG/JlDHbGpgYZU3ueaiQvp4vRv0X2P+4d9TXgGlz+DnuY/xbUntQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1751370977; bh=pCCbZ2nTs3JwuLlZXeKrhN+QzfLjX/l5YyeP1xPTed1=; h=X-Sonic-MF:Subject:From:To:Date:From:Subject; b=LteqxI6pw5wLcJ7Vq4omNc/nMZrFS6Q4uTJ47jVTmlbnHc74G3C3Nr5nS2vctwXAjXByW0K8UV/997hoGjLD9ADh00uLHt6Rb/aLmpKeqwDWDBCn4JrU3tTOO7nG54oJMBUVKxJ1L0Wd0bAR5JyVDJ5XiyE+G6LR3LSYyXOHKl7YxIqxh7zmhM8tBN6c2T3AdFTKKoZXa8F8Cf/NIEbD5robpFdrKMhzeiGE9/uXJTdnEwkN9reoh7T0v3J+W7o3gR0Q4mkd3d/jEetIw0YWZls50GbfqjHuf7pjLvJr+eX883RsNUGccOUFpBnQwbTFHtRPYM0Y3joloKRTFDRaHA==
X-YMail-OSG: UzesalwVM1mJqSuLYpBRQdPHfjZgfddJ_v7HnnxGh3dqTRjJ_FgM3GUg39rGxmh
 kEC38OWmG8awEnn44Kmwf2YszBETJnex0Iiolpzmajkcnu9TXIa2_7kr942PQoHyvBlXZVO.Nuq3
 UohXc39LQbN58RDHjgUs9X6CFrYvj1_Ukh1NeqWsIJr7eTN3eZKosL7IjvZflIC6RpfzHqDtQ4Vh
 EJwvl58HTDDz_tNhca.jIB9dOyzZWjg.KjIOaXfGjI.uxkUyQgPh5xu36PSgwhzCmK4Tbb0vlv12
 uc57PobrxWa8oXVc1ogqEWKBDBfjTpdlztetmaE53KD6C4pSEt0fTpfVo2R7HTWw.MdVJ_rBDVf.
 RdFteBDZebqHzY5vZpUuSaRrHFOMLanYIvLTJ3f9SjJDKXr_zMagv1CQe3kW4R7.qb_yUFH9vZkb
 _MhKWVmbM9QUB3pssmcHG4E2.4Ua.U4ihVXE58zRs4gg5lV9DzFK5Zc4T0Szov6y7SLjudoS7Y_F
 5klv0SaDFfhDjOzXA9L31k8dFllHbOn_0oboTgAROyFP8OB4_B9mG7urxCbxy.EAhakrDNMbQ7GF
 vILHX9gKGeYjrV5q2jGPXvR745hb4KhpBEbfk3ooRT_89ZWi_ihe5u8uHlWD_ZQpwxBF0OSBBgq_
 q1hEgRrCDwMl9BZ.Irrx.b.UvsR.TmD6TJt1FluEkOen1lGEK6sWSl6goolVzgVkARc38ti8n0wg
 dKNBZGEdImjWRop0IBkRhC0fNl7_sKZR9nZy_SX2CSLGp59TWMkFJVg7tTJgAyLgEcDiV8QToMiy
 9AKNFgyyapEfdrOq.r0iDErVl55mB9wPa01L.7UZreZpn_nVLyiocPfFspKshHJAPvLe5NgB8H.T
 SkPkAWYNmsLmcYfQ61WPjjirKnacgF53tyuWEBaNDxYwepCLQzDHsoMaW6ER_PMX9E.JmXuPVf3D
 V9AHOJJHqA5hkb1tQhIaYFgEkupTWrrdjjUdZIj1K5aLH5DQGwSdUp9iW1x6xlc9YykdkjE5j3.x
 GKHJHivgatIzEBbKnaytedlJJhhkDVSoVDAVscC8S5xZdQxD6VmBjQqzBPHxDLoRwHN4ogmOL5XY
 uT6nQdX5cx28QaHWPA49lsiItdTILcTdrtOMO4lsGJxueSQa1u5dinlNg0NE6.PqtYC59IRcgpea
 MqSn1NcLs783ShAui0GT0m0_SyFxytFu71bNr8WqW6YdBLyIasjLq8K51BesCxsl2UV3quO_FhAc
 5FZ9A1HISg1ivJ9f2_zaiTHmmUwIbo.DPOZJDQV2HFFXnQi0nQosT__En.Dy83Q22yXxkRb_3Ppb
 6KAxnRckESfaxWqTiG5xyXZuELsYD8xfS3_hD83eZ1cY9dlRjA7aX4Kw55kc1d4Kna6pVunU9ILY
 iAqDVImhussu_yUQLo8T935Vg64Kkf1V8q.WsLMOEnb7Sc.LmQ0Q3XHWI6dlutASFMJ_KXzjk5Zp
 EhGoD65bk8VRTTmZcCfLZh0VJccGRSaiCWilcVHcZ4EuD2X_Zb3BB2rmzw3GTk7U48uId1sDZ6NV
 xfsaQ0Z8J4RJFlrl1ELUHar1LKp2u1qTsfdAxw3u5CNFMvOFnZ7eM2FBLraciEmePK2kiYBJdfgR
 fwh44xp8uAvnZNb.nwGCbU56hqKv6X3g6XoKqqo97E2mMdXY40sBjGT6xegKgaxtto_n66gwZ88a
 laWCHov_IglGAam3dLJ53IscwCSeL6o95CH_AJyNCZyFVEzIaTRN_g.91dwTX6vnexPjeOZk7Kkg
 AM0E4ggEdFxQBsrXequ.4EK67KeZoM5cogrnzaFf84WWMO3xo8zGgHZn9DPUA9UQi0wn7JbeTpSL
 ZOmhQ6LphbTk62GTcJINc5L.vdgmMI3WC8QhftR2iXqYeiHiY751Y9x8NgP2.axT4L2NYoEvo0R_
 m4BVUZg.8AEi7E.cdWPWYHGwL07Sx4EK2JGjnJzPwa7sGuZU_3CUNJjhD690V4STe1LKNWRLnDI9
 CorgJtoUL2vvZdCcL4vEbLNW49wlEBlnlu1bbMne607C1DBGtf2ruY664NkJLBT8dlbPsOP1eI8u
 CM.vXqrc3EruFaYy2mhQ5Hv_Zdt20Mz0tXJzOLJfQmmGkH6Szoo52fgRDv8LTZ2hfAbb7hPOsZMl
 DbZY2I8mcPnJzusKTgRLgiYD4HkYnkdlVthEm8YKUIYqAQNf0HsNJPbqvzVb0._c8YhtXCyZBLg1
 E2n5KAUqpDW6JZYLmHuNNVKdqt.1awBw3C3rSVyKN0S4y1DfkG1xcdaj.qO.9WD30GR7hgg--
X-Sonic-MF: <rubenru09@aol.com>
X-Sonic-ID: 89cf28c5-4810-4135-8a5d-d624a22df7f4
Received: from sonic.gate.mail.ne1.yahoo.com by sonic301.consmr.mail.gq1.yahoo.com with HTTP; Tue, 1 Jul 2025 11:56:17 +0000
Received: by hermes--production-ir2-858bd4ff7b-l75cc (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 3d62bb3bb3a6558dee9bf77d66b96d15;
          Tue, 01 Jul 2025 11:46:07 +0000 (UTC)
Message-ID: <922e109fc0f9cd1197674451cc1281cace025f83.camel@aol.com>
Subject: Re: [PATCH] drm/i915: replace DRM_DEBUG_SELFTEST with DRM_KUNIT_TEST
From: Ruben Wauters <rubenru09@aol.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen	
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <arlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Date: Tue, 01 Jul 2025 12:46:05 +0100
In-Reply-To: <8a3ef0b42de25db3faf384260b7abdce468cb65f@intel.com>
References: <20250701025426.262129-1-rubenru09.ref@aol.com>
	 <20250701025426.262129-1-rubenru09@aol.com>
	 <8a3ef0b42de25db3faf384260b7abdce468cb65f@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mailer: WebService/1.1.24076 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On Tue, 2025-07-01 at 09:28 +0300, Jani Nikula wrote:
> On Tue, 01 Jul 2025, Ruben Wauters <rubenru09@aol.com> wrote:
> > DRM_DEBUG_SELFTEST was replaced with DRM_KUNIT_TEST.
> >=20
> > This patch replaces the select in Kconfig.debug to use the
> > replacement.
>=20
> Why? That's the most important questions the commit messages should
> answer.

Sorry, I wrote the commit message quite late at night and forgot to
include a lot of information, I will send a v2 with more information in
the message.

> BR,
> Jani.
>=20
> >=20
> > Signed-off-by: Ruben Wauters <rubenru09@aol.com>
> > ---
> > =C2=A0drivers/gpu/drm/i915/Kconfig.debug | 2 +-
> > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/i915/Kconfig.debug
> > b/drivers/gpu/drm/i915/Kconfig.debug
> > index 1852e0804942..b15b1cecb3aa 100644
> > --- a/drivers/gpu/drm/i915/Kconfig.debug
> > +++ b/drivers/gpu/drm/i915/Kconfig.debug
> > @@ -50,7 +50,7 @@ config DRM_I915_DEBUG
> > =C2=A0	select DRM_VGEM # used by igt/prime_vgem (dmabuf interop
> > checks)
> > =C2=A0	select DRM_DEBUG_MM if DRM=3Dy
> > =C2=A0	select DRM_EXPORT_FOR_TESTS if m
> > -	select DRM_DEBUG_SELFTEST
> > +	select DRM_KUNIT_TEST
> > =C2=A0	select DMABUF_SELFTESTS
> > =C2=A0	select SW_SYNC # signaling validation framework
> > (igt/syncobj*)
> > =C2=A0	select DRM_I915_WERROR
