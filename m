Received: from sonic310-22.consmr.mail.gq1.yahoo.com (sonic310-22.consmr.mail.gq1.yahoo.com [98.137.69.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085CA1E8338
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 03:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=98.137.69.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751339368; cv=none; b=LE7XfRk9xTH8iiQkDSSW+iJRx4JT0mkfc7GvDR6+r4SEv33TjFki3cb9PkR0Uv87yy4XcgDiTLSeGNtd/FuqEwcGDmDC+dqd6Nx4KZ9RXDmc51QK7q+Sb39QHwBREDCWIJJJq0/any1e++cFORA6jalkCGJGduohgRqjbRBeMEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751339368; c=relaxed/simple;
	bh=lpdN8XXKHzXH3rNSE3wnGoDvfvve7P9iuCjY0dP4r1k=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QT/CxASve0pxl6aFXY1hsJk5/FhSIIlFk+KebZgme3CKWeB7Vj6Us+hJ3CJpb5AP6aGmF1NS/Tmt9QCzTsirNUaoRo5FNbefiqACTlsO5SoHn99BFotPgjtCednMGBrzNlRjz8RpN/OmKIeFOYCc+LTRhlLb4N7d6Y0HSNVIo8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=aol.com; spf=pass smtp.mailfrom=aol.com; dkim=pass (2048-bit key) header.d=aol.com header.i=@aol.com header.b=R4K1Xz8F; arc=none smtp.client-ip=98.137.69.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=aol.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aol.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aol.com header.i=@aol.com header.b="R4K1Xz8F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1751339366; bh=QncXrhBWoZyfStRoeWX86SBiHK4kerChKRWDNNe+cMM=; h=Subject:From:To:Cc:Date:In-Reply-To:References:From:Subject:Reply-To; b=R4K1Xz8FZEp7R3CsXDCjWsHJ8e5IhmgUzLXHlFqOcKPU3XKyhRdfUajk4J3qD/DZhu2Y294E6rVgpvv8cCt1OCMpK+5RMFZVd58s+bd6JxaOGh5U+sVGis5G2LZZXtRaSR0+0G1PTyib4KAyAICB1Pq1gpC9DJumLvyOLBU54wxnWkoQsC0hekkl8o+rPPc3FV1IVkE91QBEYeMsTVJ7Y1UoBg9ez5EjNwhsGK7ZxxeX2Q3PoSEaB74hAVX47jA6An507eQ8l6IueTYkR0ur1N7RuVhul/PftVul+F+Cj5OEROrrvw4vpD508Cb/TT6L6BkHF/CU7g9h10Pd4JE9lA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1751339366; bh=UBTDCpUnEjUASTeMTQRT4uxQDUsF4cRsKQQYSBWjTok=; h=X-Sonic-MF:Subject:From:To:Date:From:Subject; b=XGRT9CuNdl45SAqUrYOmTGvnys0j8Qjm6MgyQ3RTtHhGSFnM08BiU4C26MR3baaFMsUM1iqhfxISzfIUu/Qw9VE0H1AmCd8eoGicKUm8lKjlY2ZIMhViHt7zB2CshmiQXGZBDHeUw+ys3sCcmT7mEjl4iQIJaOYaRZCO9I2JRsWhLb/yE1f7/t7fV4g7a4lbuTVf2HCwEngsqooRUH5nmj+HyKcoICTY3EImd6/T/w+wmsZFsMj98Z2lPpyyNdOVwfXbHv7JjYEasxpN5JmowAWlzQrxTh8ebkNxSOdFzH+iNFDxjpwLL2i0qOL7CzL51qkhrsv9EN00a/T9qHYPDg==
X-YMail-OSG: .rhQ3wwVM1nSODRfzIuPbiSSRXkg3P9APAsqYHw3SI4BTC87lZqnv7jB9ZT9GEx
 IpthOs_9mm3h8ldaLchxk0qFWNUUNpm3thIX45mwgHyRpBrYuifPMusyeuF3ccoS5bNYUt45lwdn
 496qeVlw5WBWOAfTieUFvaxOm9H7zs85pVAqZ_QQqJeHlpxbL39jPRd52xKu92XyaMgHXY_HDnI.
 eZIMgnjNZzsUL9KM4F31QrNmtzPHxXovwTvL95Cen2xUQHs.tVMfNhyV_pindBTqGGABxJlgRGnu
 CTQE5yI_63yPJ8Mwe7KZBo3A_gRFTIIkCzEz1L05SWdrvAdI.xUcg.9zTR.PJqKK4AUpyGbvq1lJ
 cZT5NUvXu5fMEaYDbi0TgHWvDpr3fJSsEl4IUAMuhOunPnvRpnibVv9AMvdh3xU_kN.KitgX2dpm
 vjVFCgdLI_xWO_xW6Dn0.0N3h0yfn8Nq3tLDqElcu9FnMRbFETMtOhHrBFzR71JTxHlwVG_qQd2a
 wHgdJRwoRp1s6r4kNPvEC1o_DrEWfUn031PnFV6OXvuIhQnnY4wsz9lPUpNXPV10GSwp3x4iHmEL
 dCg4Kf1_IG7MwQBCRy9O8Kq4XtgYoyTnzSu64nlhWXUVtst8qHOm1mKuqNlv1h2nQ9eGVPHoEOb2
 iGr4Twt8x2ozDaTErbnWnniqWVF1uEfkEbhChfKE2KZ.XGEEYYiW1xmgiVgpHU08FbgfyXj0r8Yx
 3ZRrSd3WU7POh1msKs3wPrzIxxeVQiTYmanWvqt2EazascREFFP3fbR3Sey4oJ3t6aySpBNCApQ4
 u7jCkfurZTiONqdtZE463erUtRs6NNdQAu45kRLDgE8gveg6gj87QTYnGWtGp4ZVVtE2sTXPif.n
 .cHXI_OzmWBaXazKY8fa8VS0unNRcU26mJw0fJoGCbee2Th0833MdzsLmaEzSMmaBexEF6Q0M1lc
 W19KTSAr89mpTpZx2d7uWILbe.P.XZzEPHsboNaPzAp9jYibk6gKrEg.HrwHyt0fBoC.xoiNOeYN
 Hd7exU_wzzrL5WeGJMUj5rUosQ3ORA.c0o_BtEx_sorohN0BRW8rWaNC5aCVEOxQroolVV9q85oZ
 KrEIbLwEvNs69AldUf.t.bpCY2LZyqmnrhOUawGTXDqe_SDiVc0VYVun9nnWR6VmFdRM8fH5oA.o
 CP.LJ1hryAD9NdcESTow_Pm8A.vGASAWbYFLr5Asl5IRloWgnBT7OEoxmyYXPhNooSKS5eqozYS3
 c6E7VT.d6ui_WtbeeFKKwrYzdvTln8MuWRj.It.2GWjIHs7BqK47wnbFlLSHTfMjXDGK_ZY9fbtt
 d20PERUOnjWxwkJqLjz4rQwpEkyjh.oDqPo8iY5I4WSAhvLXDqe9GlcjkvhPPlQQs3szbJHBKstT
 O_7ErSDm9gz2HISy_.9HVE_54CJ_Omn9ufHvtoRjRaFfW1O5.ZZDiFJdwRA7uUv4K6bVj_8fgC9N
 NFwUIMYfwAZqLBr2m3x1709eJFt541obQ8Vxj3b6GphjgIFdAMm1QqaBOGtNRYXJqa6S7y0BZN.m
 dUXkpZp9uj4OWtbtYbrMXF17PR2gGJYpn3AwCraxQn7EDhcxcH8Zf5MnkgZMlyb7Cgw7I7SAFC2I
 2P9fanZfSSEkyyei0o4osTmUnMZbRDH7pIT4c4Fqos113bjsq95jscknc8x6x_wChj1Fb0Kd_iVE
 TR2ogcMx43th7xEmS0_tstKgIKfigjgFod4sPU05Gc7yPMckmBr_MRWq.HVZIlRGv5vSzm99iAqE
 cQ.qDzNyRdcXGZcSZoTQyJc1ujgkJX4neBMHlgSDzUs.oD6n0t9v7Akxq3uD1MjlOu2oH76I2N5R
 H5ud2ZPlxoznHhbCuozhXDyRmpRxIqnvx1GIAa05mwy1bv26Uzc3LQWNYpHvpic.a.gPVdCztVK3
 FCuFaYEOj9n0VIs4NC7pGZhrFRG410niIhGlKKXMLj35NVzbGGy6vXEypcVvKCDbNKRnfEmcZ4yg
 18RXMjt4V4kJhCrsdEkH3WGNmGV8yHsKyxeDPfUzXfvoY0APjdiaMkz6DwKPc8L3fU9O6MH04ODO
 _6MxDbw5qrFfqsrlLEgg.3XcCBWFrBknBQTpC8NowpL6Irn5Ql5hYOSSc9Ud0xqCFJPD7vy2Q9VI
 JvSt9314e3Sv2SBEJkUMbgUTlgBpz357zBXsWaEW0pKTdZMzOkThlRca8DKfmqrxWYnRxWXaWfmF
 WeatraFYpV9qOcK2CIwTmzIr5CQPnQaB8h.Thl6l3xnpGYEb2qDakWGtJk2pLja4RHdWPOQ--
X-Sonic-MF: <rubenru09@aol.com>
X-Sonic-ID: fb9aa69a-2d1e-4f1e-b6d9-b0d90b6f6c28
Received: from sonic.gate.mail.ne1.yahoo.com by sonic310.consmr.mail.gq1.yahoo.com with HTTP; Tue, 1 Jul 2025 03:09:26 +0000
Received: by hermes--production-ir2-858bd4ff7b-86wkp (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 6689a8ae3d4d560dea262125f11816eb;
          Tue, 01 Jul 2025 02:59:14 +0000 (UTC)
Message-ID: <270d7d993e7d16c7dedb7709274cbdb3c853bf09.camel@aol.com>
Subject: Re: [PATCH] drm/i915: replace DRM_DEBUG_SELFTEST with DRM_KUNIT_TEST
From: Ruben Wauters <rubenru09@aol.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen	
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Date: Tue, 01 Jul 2025 03:59:12 +0100
In-Reply-To: <20250701025426.262129-1-rubenru09@aol.com>
References: <20250701025426.262129-1-rubenru09.ref@aol.com>
	 <20250701025426.262129-1-rubenru09@aol.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mailer: WebService/1.1.24099 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On Tue, 2025-07-01 at 03:50 +0100, Ruben Wauters wrote:
> DRM_DEBUG_SELFTEST was replaced with DRM_KUNIT_TEST.
>=20
> This patch replaces the select in Kconfig.debug to use the
> replacement.
>=20
> Signed-off-by: Ruben Wauters <rubenru09@aol.com>
> ---
> =C2=A0drivers/gpu/drm/i915/Kconfig.debug | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/Kconfig.debug
> b/drivers/gpu/drm/i915/Kconfig.debug
> index 1852e0804942..b15b1cecb3aa 100644
> --- a/drivers/gpu/drm/i915/Kconfig.debug
> +++ b/drivers/gpu/drm/i915/Kconfig.debug
> @@ -50,7 +50,7 @@ config DRM_I915_DEBUG
> =C2=A0	select DRM_VGEM # used by igt/prime_vgem (dmabuf interop
> checks)
> =C2=A0	select DRM_DEBUG_MM if DRM=3Dy
> =C2=A0	select DRM_EXPORT_FOR_TESTS if m
> -	select DRM_DEBUG_SELFTEST
> +	select DRM_KUNIT_TEST
> =C2=A0	select DMABUF_SELFTESTS
> =C2=A0	select SW_SYNC # signaling validation framework
> (igt/syncobj*)
> =C2=A0	select DRM_I915_WERROR


(apologies I appear to have mistyped an email, I am sending it via a
reply with the correct email included, please let me know if you'd
rather I resend it)

Ruben Wauters
