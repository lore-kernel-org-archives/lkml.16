Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649931953A1
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 10:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.85.9.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743590464; cv=none; b=O6K7rjEs04uWJ3YsysH8Vt6VvEayVw0u2akc+bvJbZYA3pVJVB5uvGwT2PloAYkeLZltfeH/sKxWp4lCxdLBS70F/WUSCG89+WxrkyHrhkLftVhnm9OL6gQJZ5sW5deHDg290LSs8cSSocDPXcLSpbWh1Gl7IWfupfI4mT9K7Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743590464; c=relaxed/simple;
	bh=B9CNIaH3ZPMGnrvYBrjRMpRBqVe60LjCjyRpg6E8+A0=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version; b=TMBPhsCJlFMfrurWatg9Mkq1CeRyZP2cnqgiFfr5PxI+fyUULEAp5hLPKIyI4T36ZuznYSyOdbsTcPxRwq9mNq8iy+DxxSfIZTBVWvWvBfnw7BpL0X1IOpW8FbC8FAlRRT2afQfk/Ars1o/FrQ7F48Z5Kmoq+7Puk2JWo8noHzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu; spf=pass smtp.mailfrom=irl.hu; arc=none smtp.client-ip=95.85.9.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=irl.hu
Received: from [192.168.2.19] (51b692a2.dsl.pool.telekom.hu [::ffff:81.182.146.162])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 0000000000080C4C.0000000067ED1436.00082B78; Wed, 02 Apr 2025 12:40:54 +0200
Message-ID: <ed09edb167e74167a694f4854102a3de6d2f1433.camel@irl.hu>
Subject: amdgpu_dm_connector_mode_valid regression
From: Gergo Koteles <soyer@irl.hu>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
  amd-gfx@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>,
  Alex Deucher <alexander.deucher@amd.com>,
  Mario Limonciello <mario.limonciello@amd.com>,
  Alex Hung <alex.hung@amd.com>,
  Harry Wentland <harry.wentland@amd.com>
Date: Wed, 02 Apr 2025 12:40:53 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

While playing with
https://lore.kernel.org/all/61c3df83ab73aba0bc7a941a443cd7faf4cf7fb0.174319=
5250.git.soyer@irl.hu/

I found a regression that prevented some EDID DTDs from being selected
in some specific cases.

This is the first bad commit:
b255ce4 ("drm/amdgpu: don't change mode in
amdgpu_dm_connector_mode_valid()")

I think the problem is that decide_crtc_timing_for_drm_display_mode()
function tries to copy the crtc information from the preferred mode,
but that's not filled yet if the first one is the preferred one and
it's not the one with the maximum refresh rate.

amdgpu_dm_connector_mode_valid()
create_validate_stream_for_sink()
create_stream_for_sink()
decide_crtc_timing_for_drm_display_mode(&mode, preferred_mode, scale)

It works if I call
drm_mode_set_crtcinfo((struct drm_display_mode *)mode, 0) before=20
create_validate_stream_for_sink()
in amdgpu_dm_connector_mode_valid()

or=20

if I comment out the decide_crtc_timing_for_drm_display_mode() in
create_stream_for_sink()

but a better fix than these can be imagined :)

more information:
https://gitlab.freedesktop.org/drm/amd/-/issues/4085

Regards,
Gergo

