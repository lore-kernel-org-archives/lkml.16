Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18666226CFD;
	Wed, 16 Apr 2025 20:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744835139; cv=none; b=s5WHdND0DJwZs8FZMmQS1fRYdYAFnaMjGO49qcBCiSlDYRQH288FxBntGzFPXPCTWa9I2BXLyIMLJOvm8kAiB8pH5M9ALE1ksas/ZzTuboXtTWYPZkELN+oOyTAVg1sGabtKDVHgqVKIALKN9uQui4GRALk+vqREmS7LLB4Aw08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744835139; c=relaxed/simple;
	bh=uJjIX4nC+xXVxRR3bEJVGojCt9+X4z6MXrjrvgod4sg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GQabQk1J2sGK7Sow0FLAhz6V8mPg42PvMNksbyTAdLdfVL0LHotKrL0Kjz0PenhM9tZKK5UcORwZ+0TkU/AMhKRCgMj5Wzl9yCXvgysK1g20LdwoHCkzN3nj+YuqJcflhmA3j2BfANDyRevTrkz6/AWjdadxCMYnyCYPDEkq6kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bWmCR0U1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bWmCR0U1"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8377BC4CEE2;
	Wed, 16 Apr 2025 20:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744835138;
	bh=uJjIX4nC+xXVxRR3bEJVGojCt9+X4z6MXrjrvgod4sg=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=bWmCR0U1PBKF8OmHfEWIjH3cUBdKGvswqvMdKLR1Yu0DMWaR2/TaKITQOlziaCCua
	 4NMbXgNvCrUaXWzaGmbBdu6FahqlGubzUN0sTo63HMcaLhyRe12BZCC71FxoOwNvIo
	 CN4a1hYUQaesiLA8ldZe7rzd54OKv+97CD7sKo0ndFspVxQTEbrwsemUoXrbDh6USr
	 no09XZC7t+PbNQKggPY/0eKR6CwF70ad3DWN8UtUA1BGPvlu4IyKxMQH3SQOb0OO01
	 D24UXznA6bZBUeUS8KDM9InAnkZBuBH+Xx8bUte+1vzB5SoM7FObqqejQN9Kr251W7
	 VJjbxz8CrlK/A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 734C8C369C7;
	Wed, 16 Apr 2025 20:25:38 +0000 (UTC)
From: Janne Grunau via B4 Relay <devnull+j.jannau.net@kernel.org>
Subject: [PATCH 0/4] Apple Display Pipe driver fixes
Date: Wed, 16 Apr 2025 22:25:26 +0200
Message-Id: <20250416-drm_adp_fixes-v1-0-772699f13293@jannau.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADYSAGgC/x3LQQqAIBBG4avErBMyrEVXiQhzfmsWmShEIN09a
 fnxeIUykiDT1BRKuCXLFSp025A7bNihhKup7/qhM3pUnM7Vcly9PMhK282zAcN5UH1iwh/qMi/
 v+wEFYswQXwAAAA==
X-Change-ID: 20250416-drm_adp_fixes-1abfd4edecfe
To: Sasha Finkelstein <fnkl.kernel@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Neal Gompa <neal@gompa.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, asahi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2395; i=j@jannau.net;
 s=yk2024; h=from:subject:message-id;
 bh=uJjIX4nC+xXVxRR3bEJVGojCt9+X4z6MXrjrvgod4sg=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhgwGIfu4ybVGnVciuBPqD8kurrZxPqa9bPP0H2vWLQpJX
 mm6Yqt7RykLgxgXg6yYIkuS9ssOhtU1ijG1D8Jg5rAygQxh4OIUgIkEcTD8s7x+IGfxKy3DCWHZ
 M6YxP41YLjDdkYuv4MuFEg6JdD2NCIY/3K928jteerD0249/t/rEnk788vPc5aizck3evtuDT50
 6ww0A
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-Endpoint-Received: by B4 Relay for j@jannau.net/yk2024 with auth_id=264
X-Original-From: Janne Grunau <j@jannau.net>
Reply-To: j@jannau.net

While looking at a suspend issue in the Asahi downstream kernel I
noticed several issues in the the ADP driver. This series fixes those
issue.

The root cause of the issue was that the device is unexpectedly powered
down on suspend. The driver relies on initialization done by the boot
loader and can not bring the device up from reset. The change in [1]
annotates the power-domain as always on on devices with touchbars. This
is preferable to driver changes since keeps the device powered on if the
adpdrm module is not available during boot.

The device comes out of reset firing interrupts with a rate of 60Hz even
if vblank interrupts are disabled. This itself is not an issue.
The event_lock outside of the irq handler is locked with spin_lock()
resulting in a deadlock if the irq fires while the lock is held and
processed on the same CPU core. This happens eventually and results in a
soft-locked CPU. [Patch 1/4] "drm: adp: Use spin_lock_irqsave for drm
device event_lock" addresses this.

In addition I noticed that the driver does not use drm_crtc_vblank_on()
and instead enables HW vblank interrupts in probe(). This may have been
done to avoid errors from drm_crtc_vblank_get() after crtc reset. 
drm_crtc_vblank_reset() intentionally leaves struct drm_vblank_crtc in
state where drm_crtc_vblank_get() cannot enable vblank interrupts.
Handle this case explictly in [Patch 2/4] "drm: adp: Handle
drm_crtc_vblank_get() errors".

[Patch 3/4] "drm: adp: Enable vblank interrupts in crtc's
.atomic_enable" then uses the expected drm_crtc_vblank_on() call to
enable vblank interrupts.

[Patch 4/4] "drm: adp: Remove pointless irq_lock spinlock" removes an
unnecessary spinlock protecting the irq handler from itself.

[1] https://lore.kernel.org/asahi/20250416-arm64_dts_apple_touchbar-v1-1-e1c0b53b9125@jannau.net/

---
Janne Grunau (4):
      drm: adp: Use spin_lock_irqsave for drm device event_lock
      drm: adp: Handle drm_crtc_vblank_get() errors
      drm: adp: Enable vblank interrupts in crtc's .atomic_enable
      drm: adp: Remove pointless irq_lock spin lock

 drivers/gpu/drm/adp/adp_drv.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250416-drm_adp_fixes-1abfd4edecfe

Best regards,
-- 
Janne Grunau <j@jannau.net>


