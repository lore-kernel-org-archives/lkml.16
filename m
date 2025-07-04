Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819F41DDC23
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 19:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751656835; cv=none; b=loGavd3R9XYnjPQtMI5kWZq0Uxc6JZmeI29wDcBdmEXVZyjifm1Q4cngEeK1X6SrUZwxaVXHgC5f+rgtIDjG0tdfSRoj4Xvpxsz7XTIAmiN/WvEISgpN5s6PT4u7Ohwj34Wypj6S50PnzEwK8/za2l1izaOl0vqqvi72ZeyyMBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751656835; c=relaxed/simple;
	bh=/piTliE2W/Kuaq6jpjwYvKYrD3Rh+ImN+qJS2zvt8Gw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C0js/0wPft4Il2LbpEE0frcvjvKlgrTslcTxa3YXG6T1fQpn63BQXAKRfhjRb12BTRcpaJ6M8vPTfKzj6mEjjHdG42+mddfrUBSJAwwmDEa8LMC3U2S2K5zJOkii0Pm9MMK/vaZQPeE4Lhn4TZ/imsRj84kBMD+WWzRkSizeLIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=F4ulFDGP; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="F4ulFDGP"
Received: from wse-pc.fritz.box (pd9e59880.dip0.t-ipconnect.de [217.229.152.128])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id CECFC2FC00A2;
	Fri,  4 Jul 2025 21:20:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1751656823;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hfOhpq8fyOjaZ56cdFC/wn/8XOnBTOc0qDrbyCqpV9k=;
	b=F4ulFDGP6WyMJHaMAse7nkNMyECngO4ZXyITARDd188ZhSZYDkUaic7mBEfNfE+5w3UK3f
	O4nqweDNvunSUChrr9HOLaD7ySmR4jX05FFg4NwEJwn5MZCak+lzNdV1RabvS0/t60YlLJ
	XsBK6FnA9G9xEzTP1ZtiFnum+E80sX4=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Werner Sembach <wse@tuxedocomputers.com>,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/1] drm/i915/display: Avoid unsupported 300Hz output mode on a TUXEDO device
Date: Fri,  4 Jul 2025 21:03:45 +0200
Message-ID: <20250704192007.526044-1-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RFC because I'm not sure if this is the right approach.

The flicker manifests ever few seconds 1-3 black frames in quick
succession.

On windows 300Hz can not be selected for the iGPU, but the panel advertises
it.

A cleaner solution would probably to go over the pixel clock, but for this
device there is only one 300Hz mode in the panels edid and that is at the
nativ resolution. Chroma subsampling was not tested as linux afaik offers
no way to easily enforce it for intel gpus.

Tim Guttzeit (1):
  drm/i915/display: Avoid unsupported output mode with 300Hz on TUXEDO
    device

 drivers/gpu/drm/i915/display/intel_dp.c     |  5 ++++
 drivers/gpu/drm/i915/display/intel_quirks.c | 30 +++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_quirks.h |  1 +
 3 files changed, 36 insertions(+)

-- 
2.43.0

