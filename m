Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5FA5283FD5
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 17:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748368666; cv=pass; b=likrF/vY9Iywfd9liRX1l/wk07AiPPCf/8XDPfAblUqbjBew4CkNd9KQyaixQXZMDvmtE5dBRSBKaR4le4v3hYmXrbQPPX5C/fFK0NsyJ8Vb7hcV2MK2M28gX0KWeWeoJg+aYLt09+qst4XZeZn8/A8qMohb1KCnOmizE3gHxOk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748368666; c=relaxed/simple;
	bh=8oln4KSc34OGLinw2kMwU6yp/vNUjyOTYrkSQc0cf4Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=cnw1XKFlwkzC5pllxFVP6lRuwkSgKZ5FTcuYNzjDAiHVpziNUouEhNLSSvGjQDYyRysOw+4z7a6wP1z9ULewbgTbERjxVzIx+wpe+vhbtaAZBMS9jctEA+DvJROi7mhnMtFaktgF5R9sm0ph4lwWoVt9h0UWdlmkL3yKEKruhqE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=j2tzrQxn; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="j2tzrQxn"
ARC-Seal: i=1; a=rsa-sha256; t=1748368639; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gwimHX9XqzeAJDV/zd+IG2XotyVOfgpoSFdyDymnqce/jOWmhbKNIuPxpjcFO5rH/pzYe5lebBOjcmdonq4WxhZP31O+wzWAY+rtIKdJqrsgouDsCIkthzHR0MhVRgqByo4KhSSoMlFI9W6VRRAcTYsiu0euHhSjMu3vEucV37g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1748368639; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=7OBjMWrGupcnVDTaEb5cuQtbsmhKT5VhtasjdYvma1c=; 
	b=KTz/4RTR+GPXPQ6GFBj5YCsFNtutQu2OTAZhv6PgPaCw5JUhc+S3W3vsbngGClPBH4GIOYP+0iPH4Xn8yNdm/pkwhheB+kVOWJjS481mVUGua3xEpMU1qwN9GqtNsmH8k+VnpqOf6VC5jmHAdvjd+/wT/htNeqHsAq6pHTxda7E=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1748368639;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Cc:Cc:Reply-To;
	bh=7OBjMWrGupcnVDTaEb5cuQtbsmhKT5VhtasjdYvma1c=;
	b=j2tzrQxnd8q/Flz5vlvRYcqQG9j3dXhpLQafbRRF+MgASy7c6HbzsT9iB564Pt+z
	A7/20CypbDY6aN8ZokIY8Jf6zr2sbkhs8k8JjO2BD09EQDW6Jgn6tpods2VhDgmeG/u
	xkD/R7foxz+zJZH5GZ6NpB4D9rumyxsPGlgoAYYs=
Received: by mx.zohomail.com with SMTPS id 1748368637146989.7128297385533;
	Tue, 27 May 2025 10:57:17 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Tue, 27 May 2025 19:57:08 +0200
Subject: [PATCH] drm/connector: only call HDMI audio helper plugged cb if
 non-null
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250527-hdmi-audio-helper-remove-fix-v1-1-6cf77de364d8@collabora.com>
X-B4-Tracking: v=1; b=H4sIAPP8NWgC/zWNQQ6CMBQFr0L+2p/UCmq4imFR2qf8xFJsCyEh3
 N1G4nJmMbNRQhQkaquNIhZJEsYC51NFdjDjCyyuMGmlG9XoGw/OC5vZSeAB7wmRI3xYwE9Zub7
 02jqFa303VBJTRNG//KM7OOIzl0s+JPUmgW3wXnJbjVgz/0/U7fsX7BcHQ58AAAA=
X-Change-ID: 20250527-hdmi-audio-helper-remove-fix-43b2cd0e648a
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2

On driver remove, sound/soc/codecs/hdmi-codec.c calls the plugged_cb
with NULL as the callback function and codec_dev, as seen in its
hdmi_remove function.

The HDMI audio helper then happily tries calling said null function
pointer, and produces an Oops as a result.

Fix this by only executing the callback if fn is non-null. This means
the .plugged_cb and .plugged_cb_dev members still get appropriately
cleared.

Fixes: baf616647fe6 ("drm/connector: implement generic HDMI audio helpers")
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/display/drm_hdmi_audio_helper.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_audio_helper.c b/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
index 05afc9f0bdd6b6f00d74223a9d8875e6d16aea5f..ae8a0cf595fc6fb11eecd820c7e8c5b75a746e18 100644
--- a/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
@@ -103,7 +103,8 @@ static int drm_connector_hdmi_audio_hook_plugged_cb(struct device *dev,
 	connector->hdmi_audio.plugged_cb = fn;
 	connector->hdmi_audio.plugged_cb_dev = codec_dev;
 
-	fn(codec_dev, connector->hdmi_audio.last_state);
+	if (fn)
+		fn(codec_dev, connector->hdmi_audio.last_state);
 
 	mutex_unlock(&connector->hdmi_audio.lock);
 

---
base-commit: 502d44c1a440c5f428f50f02e58cd5633454ea8d
change-id: 20250527-hdmi-audio-helper-remove-fix-43b2cd0e648a

Best regards,
-- 
Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

