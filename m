Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7035C19E990;
	Mon,  9 Jun 2025 07:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749452974; cv=none; b=celPk+5vxpfICcAB/BbsaPvCo23PiTwmHOvoqf32yrfAelqSJg/2snp/3SleCl9kb6m5thRGaclHEcWg2S7RUx1VSPej1bTDz0I00fn4SzvotHxsr5bgAdVmpmiky/z7TjHZtojLXaLnGeJ1PGUUgIwjGeKnjklZkez5SydPvAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749452974; c=relaxed/simple;
	bh=FMGMgzGZXi6F8dKlhMKoEgr1PY7zRLEf9nZdkeQ88xo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=emmDeTsjDMJ6fsPjvNCtc+T2430h4Hwlxt4lrJe4Lgcc659KFCh2hNSjXNJ2JnrFuP6nTENty2C7RfxwiGNYEJMaRaSd9Esz2XHdQLa/ntqH3xLC84cBv42xnpzOl1zwFxjsQRrXBI6S69//84gwv6prKWunT1sQ53Gg4lbQqaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=DiXklsIH; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="DiXklsIH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1749452969; x=1750057769; i=markus.elfring@web.de;
	bh=97rwl5tQ9kVnE87DvY09ZWlkxcPn81NrBCP78VTLnE8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=DiXklsIHJVh1r2U3/aWMRFKaEibfOJWK6l2plIFmw9A5rZ5BmrHupDvVMyiYvdW9
	 LTnwn1s0BR8IT81kUTgyPywQR+A8GKYKUSvuGn9UQ63ZhKaXEXAS6bQTDYK/So7C9
	 Jo+Pp/Iyfw6aIBiZCBFjN0uNiBZ1s6mrHWvlJQqRdRzNNzhqlMUEj4WSGPiW1TiMa
	 Effyc04rEYeoZqCDqRq18ALySELxeOnXh3gmFKRjUtv/B+wyNwOzqa5FoLwH0nbWI
	 JhUaOx48KIjFHDGwKjTFg/X2cT7rRXq5fw+b2+rnz4qODjoBsq3vSKaYvwFJ7sZSi
	 8BrovvhvYafiPG6mnw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.233]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MPaMQ-1uArff0iZe-00WLGy; Mon, 09
 Jun 2025 09:09:29 +0200
Message-ID: <da489521-7786-4716-8fb8-d79b3c08d93c@web.de>
Date: Mon, 9 Jun 2025 09:09:11 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2] drm/amd/display: Fix exception handling in
 dm_validate_stream_and_context()
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Alex Hung <alex.hung@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Dominik Kaszewski <dominik.kaszewski@amd.com>,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Hersen Wu <hersenxs.wu@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Mario Limonciello <mario.limonciello@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Roman Li <roman.li@amd.com>,
 Simona Vetter <simona@ffwll.ch>, Stylon Wang <stylon.wang@amd.com>,
 Tom Chung <chiahsuan.chung@amd.com>, Wayne Lin <Wayne.Lin@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 cocci@inria.fr, Melissa Wen <mwen@igalia.com>
References: <f9303bdc-b1a7-be5e-56c6-dfa8232b8b55@web.de>
 <e6656c83-ee7a-a253-2028-109138779c94@web.de>
 <ea0ff67b-3665-db82-9792-67a633ba07f5@web.de>
 <32674bac-92c2-8fc7-0977-6d2d81b3257f@amd.com>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <32674bac-92c2-8fc7-0977-6d2d81b3257f@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6WzgLsEkjsIjvTLIR4U7D19tKLt5E132l1qOf077lk/8aBWo85M
 nU3Ja69SBe97sd2HOryn91M/B2ySJ4DQMB1pKp+WqJdHeX1XnMAM466bE+BSE1QcSIKgtCE
 YwOjS7ShwfKaDWo1DzT6c95H/Dvas3gfxrqPWDYtkAMDvSOh6OyJi0hkyQqvrAsDXY1gqb4
 QN7cyJ9awZ5WsysmdpKcg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:y0k/sSibveY=;ESAXnnwwFanhSHIz8fDPov5gqBO
 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
 /7Hs+M4OURCeJalENzUT4TnG0VDeg==

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 9 Jun 2025 08:21:16 +0200

The label =E2=80=9Ccleanup=E2=80=9D was used to jump to another pointer ch=
eck despite of
the detail in the implementation of the function =E2=80=9Cdm_validate_stre=
am_and_context=E2=80=9D
that it was determined already that corresponding variables contained
still null pointers.

1. Thus return directly if
   * a null pointer was passed for the function parameter =E2=80=9Cstream=
=E2=80=9D
     or
   * a call of the function =E2=80=9Cdc_create_plane_state=E2=80=9D failed=
.

2. Use a more appropriate label instead.

3. Delete two questionable checks.

4. Omit extra initialisations (for the variables =E2=80=9Cdc_state=E2=80=
=9D and =E2=80=9Cdc_plane_state=E2=80=9D)
   which became unnecessary with this refactoring.


This issue was detected by using the Coccinelle software.

Fixes: 5468c36d6285 ("drm/amd/display: Filter Invalid 420 Modes for HDMI T=
MDS")
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--

V2:
* The change suggestion was rebased on source files of
  the software =E2=80=9CLinux next-20250606=E2=80=9D.

* Recipient lists were adjusted accordingly.


 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 20 ++++++++-----------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/g=
pu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 78816712afbb..f8aa1c541678 100644
=2D-- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -7473,19 +7473,19 @@ static enum dc_status dm_validate_stream_and_conte=
xt(struct dc *dc,
 						struct dc_stream_state *stream)
 {
 	enum dc_status dc_result =3D DC_ERROR_UNEXPECTED;
-	struct dc_plane_state *dc_plane_state =3D NULL;
-	struct dc_state *dc_state =3D NULL;
+	struct dc_plane_state *dc_plane_state;
+	struct dc_state *dc_state;
=20
 	if (!stream)
-		goto cleanup;
+		return dc_result;
=20
 	dc_plane_state =3D dc_create_plane_state(dc);
 	if (!dc_plane_state)
-		goto cleanup;
+		return dc_result;
=20
 	dc_state =3D dc_state_create(dc, NULL);
 	if (!dc_state)
-		goto cleanup;
+		goto release_plane_state;
=20
 	/* populate stream to plane */
 	dc_plane_state->src_rect.height  =3D stream->src.height;
@@ -7522,13 +7522,9 @@ static enum dc_status dm_validate_stream_and_contex=
t(struct dc *dc,
 	if (dc_result =3D=3D DC_OK)
 		dc_result =3D dc_validate_global_state(dc, dc_state, DC_VALIDATE_MODE_O=
NLY);
=20
-cleanup:
-	if (dc_state)
-		dc_state_release(dc_state);
-
-	if (dc_plane_state)
-		dc_plane_state_release(dc_plane_state);
-
+	dc_release_state(dc_state);
+release_plane_state:
+	dc_plane_state_release(dc_plane_state);
 	return dc_result;
 }
=20
=2D-=20
2.49.0


