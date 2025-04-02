Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F47149C7D
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 14:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.85.9.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743604511; cv=none; b=EX1FDGl9wK/MyCPsDLo4ksOy5QqfdpRytUjpJL8Bz+az20K0e+xBcHe7D1sZnEXk7HPSw0M6GA+5714UB8HOovw7anRrHb/fxz5n3HOru5+J7ub+NNJ320wnZZ5IZoxUHY1S9xa72c2SpuXnIG3Zut51knNwpkNt+0MDvXI6BZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743604511; c=relaxed/simple;
	bh=1t238q/aUujicZvFuDiQRuF4dfz4RMW/gKJbofRPYbk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eYt+VITLRd0oqXtPFN3qlXoShEns7g7qdeBPhowBaBs0TzTFSaE+R5zjxaj/qz6pUuiJ9QAbXzvLuNjCbFOv58IKQpck6ORsocfMx7ck7VgO+ENj1nnLqZlfZvdjQxZKAYOHihwxs/5aFAPHv2jI6/pXs1xsBmB8nnhGjZ3fRJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu; spf=pass smtp.mailfrom=irl.hu; arc=none smtp.client-ip=95.85.9.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=irl.hu
Received: from [192.168.2.19] (51b692a2.dsl.pool.telekom.hu [::ffff:81.182.146.162])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 0000000000080D7C.0000000067ED4B1A.00083746; Wed, 02 Apr 2025 16:35:06 +0200
Message-ID: <e323219b52cda1891a55d12ad77a2b34edc8688b.camel@irl.hu>
Subject: Re: amdgpu_dm_connector_mode_valid regression
From: Gergo Koteles <soyer@irl.hu>
To: Dmitry Baryshkov <dbaryshkov@gmail.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>, regressions@lists.linux.dev,
  dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
  amd-gfx@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>,
  Alex Deucher <alexander.deucher@amd.com>,
  Mario Limonciello <mario.limonciello@amd.com>,
  Alex Hung <alex.hung@amd.com>,
  Harry Wentland <harry.wentland@amd.com>
Date: Wed, 02 Apr 2025 16:35:05 +0200
In-Reply-To: <CALT56yPd-xfd=47xRxrCk4F3jib4Ti7kg8pRXy-gVAQpbOc=pw@mail.gmail.com>
References: <ed09edb167e74167a694f4854102a3de6d2f1433.camel@irl.hu>
	 <8963a409dd575e040e5f07e4ad5e9c1d26b421f2.camel@irl.hu>
	 <CALT56yPd-xfd=47xRxrCk4F3jib4Ti7kg8pRXy-gVAQpbOc=pw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Dmitry,

On Wed, 2025-04-02 at 16:36 +0300, Dmitry Baryshkov wrote:
> > >=20
> > > It works if I call
> > > drm_mode_set_crtcinfo((struct drm_display_mode *)mode, 0) before
> > > create_validate_stream_for_sink()
> > > in amdgpu_dm_connector_mode_valid()
> > >=20
> > > or
> > >=20
> > > if I comment out the decide_crtc_timing_for_drm_display_mode() in
> > > create_stream_for_sink()
> > >=20
> > > but a better fix than these can be imagined :)
>=20
> Would it help if you force recalculate_timings to be true if
> (drm_mode->crtc_clock =3D=3D 0)
>=20

Yes, it works with that one.

But the code would start to become quite untraceable.
duplicate mode in amdgpu_dm_connector_mode_valid()
call drm_mode_set_crtcinfo() in amdgpu_dm_connector_mode_valid()
duplicate mode in create_stream_for_sink()
overwrite ctrc in decide_crtc_timing_for_drm_display_mode()
if crtc_clock =3D=3D 0 call drm_mode_set_crtcinfo() again in
create_stream_for_sink()=20

saved_mode is never used after this, so I can't add the condition here
        if (recalculate_timing)
                drm_mode_set_crtcinfo(&saved_mode, 0);

This commit is related, I think:
1101185 ("drm/amd/display: fix the ability to use lower resolution
modes on eDP")

Regards,
Gergo

---
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index bae83a129b5f..83c8c81d4015 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6984,6 +6984,9 @@ create_stream_for_sink(struct drm_connector
*connector,
        if (recalculate_timing)
                drm_mode_set_crtcinfo(&saved_mode, 0);
=20
+       if (mode.crtc_clock =3D=3D 0)
+               drm_mode_set_crtcinfo(&mode, 0);
+
        /*
         * If scaling is enabled and refresh rate didn't change
         * we copy the vic and polarities of the old timings
--
