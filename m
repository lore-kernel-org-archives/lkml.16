Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D871A83FB;
	Mon,  7 Apr 2025 13:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744033407; cv=none; b=O9auLiKBNb7CrBSqh5h8TSEbfUrj6J/tXkpIduCIb2V0/yK3ykv03hL+RlxKrmsiPVc5p/VA4fU2hL+v/cjl0ko0gbK6QWeEAvfFw5iYNF4YkvT5hxNBCTM0XkDIPNeUM6OSnOpzVL2cAtE02N+GG5Mk//RIATz049Fl/kROxG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744033407; c=relaxed/simple;
	bh=jrzILLsCIxZUTLE3MafGV/FTTLWLet8Gdk95AnmhE+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fPi3uvGgEsWj5Q1wSWnyrGTnzEexdYonjfDfglLwYOHQGdCh4HDj4H1RYn4j+239iANYUYYbuoyJNjcpfKvm0m25/FuckzcdOkMSOAEJC6Xs34WVVovXpOFJ/0DZCZf2FAytDWYFnOP66GGyMKzk34gwkdvXfSG3xQTT/BgS6vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu; spf=pass smtp.mailfrom=heusel.eu; dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b=OOLfnVJE; arc=none smtp.client-ip=212.227.126.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=heusel.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b="OOLfnVJE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heusel.eu;
	s=s1-ionos; t=1744033388; x=1744638188; i=christian@heusel.eu;
	bh=nxVX+/XG3otJuF4Layjw9CHGn3CFOF+qkjVmgD6saaE=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=OOLfnVJECo/p7+m5OhqZgTNtR1kA97QDNfTkZe5a4IuE8E6aGws3SnEP/JPEQHi1
	 vv/v3a0bKvTddAEo/iG3gRukP2eP+jNnPTGTUx7r/CNPW8qQC6XgRK2x9kOOkVGH2
	 oejqtLvDxjL0D87HMal4qqnwTZmm44cxxmcEx0qqlJD5Xx9FW4BgN4N0o59K1sggu
	 Xs2n2EMatsjRNxl6qGJPvWDA5bTAGIVkmNTLwOYTRXQ1KOUlUbMQXk5NozvX49oEK
	 GQpBpaEBgs0aRu0caXrd6Eiic7AwuaGte3FuQ+01uNIleZXlwPz8X0URCkaFVDpti
	 4AaVMsNSx4zKW3hVXA==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from localhost ([147.142.179.140]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MLA6k-1tjZ783ITC-00VwJa; Mon, 07 Apr 2025 15:43:08 +0200
Date: Mon, 7 Apr 2025 15:43:07 +0200
From: Christian Heusel <christian@heusel.eu>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>, 
	Patil Rajesh <Patil.Reddy@amd.com>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Hans de Goede <hdegoede@redhat.com>, "linux@frame.work" <linux@frame.work>, 
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Re: [REGRESSION][BISECTED] Firmware load error for TEE on Framework
 Desktop
Message-ID: <d77dc639-dd7c-4a48-ae0a-26829d6fcdca@heusel.eu>
References: <ae644428-5bf2-4b30-81ba-0b259ed3449b@heusel.eu>
 <BL1PR12MB5176333ACE3287786831B0749AAA2@BL1PR12MB5176.namprd12.prod.outlook.com>
 <195e5df0-d044-4d7a-afa1-4361c760c1f3@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4jdafsn3zhukglgv"
Content-Disposition: inline
In-Reply-To: <195e5df0-d044-4d7a-afa1-4361c760c1f3@amd.com>
X-Provags-ID: V03:K1:STRrzaZkDUer/XXZd+uC/hyiVVowrvzju+RynrANkb59pbujCSC
 CxUnBgGA/r9L0V/hehkVeOJ72O3uBzpkC+ppLrGpMuLy1JpcsGPs25gGMWf53gWk2f5Cou8
 qr0Tq+ABbrmet0fudZAqDsbjqiPJCxUwIkzSc7Q3U7ahsmar4mKNVRW6jxOrPxHfrAPedy+
 YkmsvPV6LIEqSahQQhRbA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ZVuUV60D3Rg=;yqnubyWrjx2j2LJVhr8jw702Gg9
 +qH6p6Y4EoIBNx2eLFjWd4i31DYA75jq7AV0zod3HhH3AQMXBiIwkncppW/NRiN6ZPzdRrzFA
 NLgoljokpVIdNBfdfdW5tpJI91OYoV+ZaLpR2wIwteMLauf4hqJOSs762BAAlLgABe0d4TDrN
 gS7Y2MBrjqNjRfs8tA2K3dt/eJBeV4Mma3gdQlx8Mlu5IlHwynqQeChcyml3E7hYEBa6vfjFO
 ubaX1mNfSQSaEXZ1Hk+DVxRGaDxRdDAcXkKDSCJ5/TMtNkEX8DbqZIdZup/bG0r43ShDh5u/W
 HbTpqK9/EtVX/gfAs4bBA0/81kMGAkRiVdu9UGDkdx21/YmRw0pARWj1qaKGi6rXeHf7/khtt
 /EkhVC76POF7/Sw32N38oXdYvCvmYVCPcJbsS7bd/gBUm5X65Yt54ZwWmbr91cIZIOa9HXKJp
 ojYipTFxdI74gqIOh9S/HhHqnwgPnCT2u0IL7oDR5h66u5nLs9wjH3kD1A7Ws5gT7RYMafzpV
 0KmOiBvZNYwgQQrVZEhFUxZiQ4EslMsjwc4pawpoSZdaH4eY/+3FvUqPhBBeBiI6tDZ0GDE8c
 Xa4w06FLlXCQQZciHTPiHCLhB72jekkGN7EoDWNlPSPQtfOkymx8QezTdAVuNEfueBzQLdAFN
 zqfgxelFMdpkv4/sO9Mh7o682DaYEuoOrN3z3iGCRVoQ8ufCO7Ps2ZWm9uLzsk9ivpQ1DfS66
 AmwcZa9auEmeTMph5hTsENS0LXcVaNkTmCvxhZ0Tnr/DGhEWmUppJZZxTQGLTHz1g+WLdbPMq
 uU4Yfbf/Q8oKynEuWBBHUuh4QOLrtrZEX2bAlChn32Rs1KF5k389G1yHTCgIBpUwFsdw77lhE
 XxFj3m3MRV0tLOWh5N+l8UVEQGLx2Ad+p8lUr5nErFq1loS62w1RTRiZHaT7K0kWGYSx+MaPC
 fTbNVcMp5arr0W8met+jGh22a6oyXsl9NANkhhdYSQmyatJGHeYQwt0lfxJIEPwaLnH/Gg4zw
 hNIfEyKFy/LQUu07Q+vRBKegesKFQ1TW38pTf7SsS5q1XokEZv+UxvI3LxR5Mo3hEWSg7VGUK
 cATTk4kujQtunRstkAmZX6VPCe4OBo7PcWxDmquFZ1az1GOxaRKt4GNKa6YkrZu9vqMGyGQtV
 Y21tIzNAHSWWRE+w8nQgIJIfKL+ehd3wPLfvRnwPppcKGUBIFjhQldjAz8sZFcMN/XFB3sytL
 sFJCd7NFpjrmSkNRl2V671urWdp3o+tgjRYJD/NSh4Qd6JTPzs/bCypWiYGLC0UAKPliZZtQw
 Tr0jpEZXJp+KwJ+MSmpKhmtra9mEvyUjctGJ/V2kUTXgLUFUDZOoiIRTXx3ixfDwXVJuCKB+b
 Tsaguz96j+33K0ulnmJT/xCfEZiWUED1IXRAeK+7uSvfsjQ9Ohj7ktNPQ6


--4jdafsn3zhukglgv
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [REGRESSION][BISECTED] Firmware load error for TEE on Framework
 Desktop
MIME-Version: 1.0

On 25/04/07 08:20AM, Mario Limonciello wrote:
> On 4/7/2025 1:36 AM, S-k, Shyam-sundar wrote:
> > Hi,

Hey Mario, hey Shyam,

> > The file "f29bb3d9-bd66-5441-afb88acc2b2b60d6.bin" is missing from
> > the "/lib/firmware/amdtee" folder, which is causing the issue. This
> > is because there have been some last-minute modifications to the TA
> > firmware, and as a result, the firmware has not yet been updated. I
> > will inform you once the updated TA firmware is available, so you
> > can provide your feedback at that time.
> >=20
> > Thanks,
> > Shyam
> >=20
>=20
> FWIW - this below error is noisy but should be totally harmless on the
> Framework desktop as well.  AFAIK - BIOS on FW desktop doesn't contain
> any PMF policies in the first place.

thanks for your answers, that's good to know! I guess we don't need an
urgent fix on the kernel side (or revert) then, let's just wait for the
firmware to land.

Cheers,
Chris

--4jdafsn3zhukglgv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEb3ea3iR6a4oPcswTwEfU8yi1JYUFAmfz1msACgkQwEfU8yi1
JYUmUA//c0ZaIlMqe/O+9XE2Ba1mvalQvUt6pAiGCphmMDpbnsy/bjYxdaiGjwC0
4d0jKuRii9fCQj8R4ZP1PftgltGO7sx7ny+YTl6vQf6iWxErRzEb841mTlURta9k
5MkIFjemha/WXH09YkdZ2AmmF4AUpiE6A4ZeANhEKTjYTFYkoe9lt43qs6RTJ9w0
Z/uRQ1cKwWEK5HrOOghyIGBCQ+XNmOJ0knPHbJPyKkz+Ah5Vi/a4R40rnx4UM8aU
BVgIRwiQibvzCOPaH3PnZNPxjyKh6sYuM21b3/6m5XMwD46vrOYFebxAt0H/2V+R
bfr80u8dIcBX6/HGlEvXYtBMUH+Dx6dzkxF08WMW4Q9bmU/1R7bEu5+3z9AsFuLP
Job1grXwk4ovK3I49u9uGueGapQfqRTjsz3qxJq7M12k0Hocu4gHJllyOgT4X1yP
/AU7m5qMcjt8pdk6pSdpdKw3PsQ2SEtZb+cWgrmcNJH5Xj7FuFdQBPKjJsd4yF3k
Aw+Q7Lxa9C748YFe9ILRnwS2RTFlL30KHZQMZ8LBSryd0b+torcxxjXlgTmNs3pM
iqgrN0YkZ6cRI2U8D6eYf7co3Enrimwsz7wcklJCb5N+PR23Wp8BmD/h0cxATqfs
3d+NLetyyNeaO+bnVSQRKbO8uIQlevSJtf5Cd/LL9Zo3iKzVtDA=
=ZEen
-----END PGP SIGNATURE-----

--4jdafsn3zhukglgv--
