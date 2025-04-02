Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB0F23909F
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 12:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.85.9.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743595252; cv=none; b=mKF2RBITSWN3je9tUXg8OmKLAuyWPlx2pNWnoMSzibCMBRfgf2TWV37hr5PV6rGxP11YTTnDhYmfp6lO9WL9dS66mmC3A7f7JlXZWMzfb+nq9wzij9Vz8uUaZwrHVTa4yNWLyhfJzXa9TPNXfcNHTzTCS8QELaApTLnnx3khoNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743595252; c=relaxed/simple;
	bh=K4CFr5Q5Gzdci0CwXG+m8c0146foXbafb6sR+10Pf+U=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CZyrHvFJJZxA54+b3yv7dVFcHmzbpMHbFssHowOsHnbcHxUmmuMp5GBr+DqkdEeRcQ1hup2JQgCC2XBtxfzMJhc6QxDu6smaGHt63SWjZV9hUIydNI8GJE3A76hGeJ45TJLNc90qd5nP9ZW940DG3o5IdDPWhl1SVbXre+Ov2KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu; spf=pass smtp.mailfrom=irl.hu; arc=none smtp.client-ip=95.85.9.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=irl.hu
Received: from [192.168.2.19] (51b692a2.dsl.pool.telekom.hu [::ffff:81.182.146.162])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 0000000000080D7C.0000000067ED26F0.00082F7D; Wed, 02 Apr 2025 14:00:48 +0200
Message-ID: <8963a409dd575e040e5f07e4ad5e9c1d26b421f2.camel@irl.hu>
Subject: Re: amdgpu_dm_connector_mode_valid regression
From: Gergo Koteles <soyer@irl.hu>
To: Dmitry Baryshkov <lumag@kernel.org>
Cc: regressions@lists.linux.dev, dri-devel@lists.freedesktop.org,
  linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
  Hans de Goede <hdegoede@redhat.com>,
  Alex Deucher <alexander.deucher@amd.com>,
  Mario Limonciello <mario.limonciello@amd.com>,
  Alex Hung <alex.hung@amd.com>,
  Harry Wentland <harry.wentland@amd.com>
Date: Wed, 02 Apr 2025 14:00:47 +0200
In-Reply-To: <ed09edb167e74167a694f4854102a3de6d2f1433.camel@irl.hu>
References: <ed09edb167e74167a694f4854102a3de6d2f1433.camel@irl.hu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

to: Dmitry's new address
cc: regressions

On Wed, 2025-04-02 at 12:40 +0200, Gergo Koteles wrote:
> Hi,
>=20
> While playing with
> https://lore.kernel.org/all/61c3df83ab73aba0bc7a941a443cd7faf4cf7fb0.1743=
195250.git.soyer@irl.hu/
>=20
> I found a regression that prevented some EDID DTDs from being selected
> in some specific cases.
>=20
> This is the first bad commit:
> b255ce4 ("drm/amdgpu: don't change mode in
> amdgpu_dm_connector_mode_valid()")
>=20
> I think the problem is that decide_crtc_timing_for_drm_display_mode()
> function tries to copy the crtc information from the preferred mode,
> but that's not filled yet if the first one is the preferred one and
> it's not the one with the maximum refresh rate.
>=20
> amdgpu_dm_connector_mode_valid()
> create_validate_stream_for_sink()
> create_stream_for_sink()
> decide_crtc_timing_for_drm_display_mode(&mode, preferred_mode, scale)
>=20
> It works if I call
> drm_mode_set_crtcinfo((struct drm_display_mode *)mode, 0) before=20
> create_validate_stream_for_sink()
> in amdgpu_dm_connector_mode_valid()
>=20
> or=20
>=20
> if I comment out the decide_crtc_timing_for_drm_display_mode() in
> create_stream_for_sink()
>=20
> but a better fix than these can be imagined :)
>=20
> more information:
> https://gitlab.freedesktop.org/drm/amd/-/issues/4085
>=20
> Regards,
> Gergo
>=20

