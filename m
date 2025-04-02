Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F27D1FECA0
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 17:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743615775; cv=none; b=uIFf6CPlez+zDh3GtLkSiyOgN0S66N7sfnIzP83/8MrOSnaEJ1b19vZ+vij2XBxUrFMXvlCzkU/NAojuT1MJI0GRijMOdCTa6z+TbpAzOQRU8ko8aK8uCKskG6YS+hhXqeigoF5TutP5pzKywEgzQNiCT0CIlGo61zKDiW9hgck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743615775; c=relaxed/simple;
	bh=rcrUkUCjB1xs0RhGIZDJqSoks92bVgXttXWRlrICL7w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OkuLPu0gmXuA/zVFpFSn5mqDzOZmtNJ2GKEe9c3MegemsUbVwJlykaTMhwrFtDvRQpAgNUQKX5Nu40NgwO+spfRjv2P14tcU/07qrlax8LCEdZeS7iGxQAdoDwLyEbqXr8OlWxJGbq8Bjo4mvMgpCJclTDAWaNoyT1/tak7jxKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ARt16fSB; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ARt16fSB"
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3d5e68418b5so839395ab.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 10:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743615773; x=1744220573; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lmnUjD6NKJR963XR8Ej2QuH8oZFh+mV0bkdDgwQtC1c=;
        b=ARt16fSBZBzqmG4Ob6rTcYWvRwEmSdqOHHI1how5mBQrcM9oEEPdbjw/7s9ffeu0/w
         zdqO2e7spY1vGoG/dhI1XyAlwOP/YrvxmfaOhbMoykQOwkmJKbUNPNaDJ9P68undSy/d
         DVVHsGY7JbS4PODBPw+KYthp8sLZGWlyVXnl5Avf8sLTXdCnGuFQmjyjb1s2W8dcme+b
         X0e8YFF4aTua10rx/81qa4FP6a4Ozn0vjJtw1I9zia6KjZYdJ7SXskeYcJHTbMLB8mI9
         xPvEFdDj08+rcQYqivpqO0FlHWBjmj+GFNJ/jhcO1AjqMfN7g10tjrBKwN9GGdZf9Gyf
         B8xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743615773; x=1744220573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lmnUjD6NKJR963XR8Ej2QuH8oZFh+mV0bkdDgwQtC1c=;
        b=cmMKU0wxGUfl0l/jzk9YgD5vZr1V6HOMclAOs+gFIcl6HzYpptrpyGkDR01dOYy5vS
         HnCSw6ZBpT/osOxOZtYvurtg0LtruaapUZKz1+dt6aWYUu2z37XpBmxWIDiQpjQun8Q+
         8HhTrL211zr4Td838ouECA4gG83530axekxx80/MQQwZVJOMLJl69WRPs0zBq9xHlU2/
         W/WARMHHGSQcOfWXRN0R9uHwsSgdoVBlnyOGipCXOjoHHvEzUOrMr4O518KECfMermRw
         PXxwEiBwwPW/ji+8I/zoOC1vnpo+MDBBHf/ngCzau/cN+gNrjmA8D3u1MntgupYv8oYr
         fN8Q==
X-Forwarded-Encrypted: i=1; AJvYcCX3Wl/LoSWfw587LgI4ReJw1i96PQ7RGmznka2TMaIHC38mpm2nGTAHOkrHKPoj7B+KD3IY2kKpxDMpXyM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKwkuFUQPaF/k5rdXBFW2BRf3x26ADhJ6k/bVWxwilK1aLC060
	DFrfi0Ncv7To71xVlYDtl+MGCenalyDMVQpd1giiyfVHCh71Zu8a
X-Gm-Gg: ASbGncvGWoe2Y/Tizu+p6Xw3wsyBXMPQFCJ31wGCUyUX1u8mEHKXXq5WzaDoJqm2/DX
	BQG6v9bXmJSbpYczV9k4P/kYurFpLz5xziVRzsKemXnt8zjfcbc+hp5JN7xQ+gL+rr6iGEw+cAx
	WwHS+dzMBWmW03xQqf/IDaQuryBkL7CKfhcZQE8X6N9ujAUVgeH6eX9xjmKT8nnxBKdSMVOinST
	qiMePStS6fJXFjWSAUF9tLK0j5phUbDzy7/oeT02UiVeV6OdvrPeLn1W9WvVN1a8v3p+lgca4UM
	Kz/hljCGIs6kRGazSsCKakD6PDU/GSweJml1O8h8ePdggxbVdfQ5PIplyw6wZ3NAh+dgMzfNMVw
	LhQ==
X-Google-Smtp-Source: AGHT+IEsoNgpLODjysSkI25oKJsaNZz7XSjHcm/Nhcv9gVki2+9S2pVoYAXgC+K6TNfR04N0YUf8TQ==
X-Received: by 2002:a05:6e02:3981:b0:3d3:d823:5402 with SMTP id e9e14a558f8ab-3d6d54a1420mr42397655ab.7.1743615773292;
        Wed, 02 Apr 2025 10:42:53 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 10:42:52 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com,
	gregkh@linuxfoundation.org,
	ukaszb@chromium.org,
	louis.chauvet@bootlin.com,
	linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org,
	intel-gvt-dev@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	daniel.vetter@ffwll.ch,
	tvrtko.ursulin@linux.intel.com,
	jani.nikula@intel.com,
	ville.syrjala@linux.intel.com,
	Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v3 40/54] drm-dyndbg: add DRM_CLASSMAP_USE to virtio_gpu
Date: Wed,  2 Apr 2025 11:41:42 -0600
Message-ID: <20250402174156.1246171-41-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250402174156.1246171-1-jim.cromie@gmail.com>
References: <20250402174156.1246171-1-jim.cromie@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

virtio_gpu has 10 DRM_UT_CORE debugs, make them controllable when
CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg that the module has
class'd debugs.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index 6a67c6297d58..3bc4e6694fc2 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -45,6 +45,8 @@ static const struct drm_driver driver;
 
 static int virtio_gpu_modeset = -1;
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 MODULE_PARM_DESC(modeset, "Disable/Enable modesetting");
 module_param_named(modeset, virtio_gpu_modeset, int, 0400);
 
-- 
2.49.0

