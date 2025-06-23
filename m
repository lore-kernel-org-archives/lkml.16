Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B649F155CBD
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 06:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750661100; cv=none; b=niPEdmJL7rKJmWRdvg+Ig7KK19Dp1yF1nQ1M3ckmJqw3koYr6a39RmrfUY7t54VsVK8NExfZ/6vcMlhtE8ePduHw9NsFrBbnnUwdMcd26Fj4tkJ3ZDRq7MxkP0XouzHqFIxhEgUeaUIesdsdewwxY8pZlFu+K8vCCNAugJ8jXn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750661100; c=relaxed/simple;
	bh=mG0ZFKhM/nBtFju2w5kydTvhmmvJKrUqQYrMK9O0+gQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cHxxybCeImVck/gKvZVLvrcSLPc3bwhW+0wtvYT39DEHbO2+jFW5ijYirocDfC8NCvvfI1zlejE6DYi982gUhit1OPS0R0RdADqnTPHUy5EB9ZMWe1miBMoDTw9PIdD1ly3be/EZcOyR/WdUWyLBDseMwv1Ub5XwCl64MWZuVwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=5HpkMIW4; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="5HpkMIW4"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-adfb562266cso684964566b.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 23:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750661096; x=1751265896; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rfv2PMTDIceIpvbq9xZVeanT080dZzydc/UXVnCEv1g=;
        b=5HpkMIW4x+vnSd0/LTmWt1NQmYTsLjWI3YfyEHX+dd8gcMoDzq+xif/ls1wPIJJUko
         0bge3vEVdGIIFkBhcqz79RUEgbLy9Vxv6mrhaAxvVqpnWtqiN8LGfUhQNI5+qsCQZAYp
         5gGUOE1VnbFu0yhnWFZjbNX+nrCSkhxq+vg5BUx3+5Lp816tVjm5JBQMydaFS1LUHx26
         r0n7Y16ZPQoZqibq1te8z9s6IPNRpKrCowWG9k2LjW0TQ5OrgWSnyR3zfxImP1jCr3oa
         9fN1GrAHDMjSMRvL4CC1SL+4EodFIOuR5VXodbp+ocWZT0GgZkFP7LYI3HmJqiBoNr/v
         3TLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750661096; x=1751265896;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rfv2PMTDIceIpvbq9xZVeanT080dZzydc/UXVnCEv1g=;
        b=r4Tgz8Q8zNd3JBhNdK0UyypRvMKlS3dbU/DqO0LbDY90bCx0FY6ibSgkikInUvquD+
         lvovlLzYVvWjK24vy5ME5kcHNkrWRnt6Utb6/l1msJOCIYXcSaK2XwYQqt9bfdO0C+jl
         cvU1p391FLBQ3Yk14dvYls9FpqeoqEiA2rYyvXBc0V0Sx/LHP1hzGp7pWawstSB+nY/H
         IwH84sO2Q+iD5QFbeBDzQQllfNgcrpvcgTh+XdxInyaL5tNOhjKTivQxYXuWctnvGNtU
         6phrw7kEJnN+D71O9JtG4q1sWErfpEXb5BDcA6VCAaegLZ3r4m9G58xfnC9ztMqr8Cn8
         6GyA==
X-Forwarded-Encrypted: i=1; AJvYcCV8UpoaAWPky7lVRjrHQWkvcZqG4ZI5eMUPvcx1biQQEbixEb1UUTjxT5KhCimYvtCTmV4Pcb7nH7goPX4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwD39+FvmJWu6ralKYrNtMx+HHTJrFeudRQ+dUXynrRZ5jL6R+c
	t0emSGDl6Pn2TnKhzhvEewtkf+eN6GMWYhw4NWo5wwr5Y9IHbacq18X+4OcEb6HL7Bk=
X-Gm-Gg: ASbGncvn29qogqp2RKOrqimFV0NxSDBNOlNqznyzg5e918f04hwLenxQZeMQn4wBMMB
	GGRFjcm/8vp2BmnrsQDcM+NGrDbxajTNmdfEvyYwojlLn+edkkA06oBOiLgI+XEjm9nmaLEGklE
	+H3CkTXSnWExg9l+z75Rojws8agU9ELoRDq9jflTPoimETTz8Ve9ym1T8xG9Y+HDfwqYvqGyxBA
	L7QPhFBkmQB+msaVRY0QwMqyCNnRAG+1ENs7t6BOVQYJOUfiqjPaWI4WAbWGX5oa2VAdM8VG9Oz
	WK8MW0OsXKP18LkLKlOVAUtIfdDB+iF+i3tfsR7XZgbJkVEWWglGIQl9Wi/y5wJD2N5Hj7wdvwo
	ZSSrBaM5CCrfklrCvNRaDXSYBRQvA7qN9
X-Google-Smtp-Source: AGHT+IEIK4HYmI0KuUkjMGJQo8hgJeoSxD4CTOsQVO12rPi+l3/A1YCQcq/euCV+EvS2bfnw4by8Eg==
X-Received: by 2002:a17:906:d260:b0:add:deb0:8b64 with SMTP id a640c23a62f3a-ae0579df1e2mr988741966b.24.1750661096075;
        Sun, 22 Jun 2025 23:44:56 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae053ee4ce9sm659258266b.69.2025.06.22.23.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 23:44:55 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v2 0/5] Add interconnent support for simpledrm/simplefb
Date: Mon, 23 Jun 2025 08:44:44 +0200
Message-Id: <20250623-simple-drm-fb-icc-v2-0-f69b86cd3d7d@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANz3WGgC/22NywrCMBBFf6XM2pEk9hVX/od0UZOJHbBNSSQoJ
 f9uLC5dngP33A0iBaYI52qDQIkj+6WAOlRgpnG5E7ItDEqoRrSyw8jz+iC0YUZ3QzYGe1230jS
 N1vIEZbcGcvzam9eh8MTx6cN7v0jya381Jf7UkkSBVitZK+pdV7uLGzmsk1/oaPwMQ875A5p80
 rS2AAAA
X-Change-ID: 20250617-simple-drm-fb-icc-89461c559913
To: Hans de Goede <hdegoede@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>, Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750661095; l=1324;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=mG0ZFKhM/nBtFju2w5kydTvhmmvJKrUqQYrMK9O0+gQ=;
 b=I+KJQKTokZRRzCjESYV5r3Vrrf+Epv1ziNUE8LuNep5eK0MjSPosyfeoDYv8RZeU6jY5CZxTZ
 xhHsZM5KA+7B8Jq8+WQNHdc3VT7AJpG+u0BOirf4OMNaxUxiruPXKC5
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Some devices might require keeping an interconnect path alive so that
the framebuffer continues working. Add support for that by setting the
bandwidth requirements appropriately for all provided interconnect
paths.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v2:
- Sort the headers before adding the new interconnect header, in
  separate commits.
- Use the correct #if guards for new interconnect code
- Pick up tags
- Link to v1: https://lore.kernel.org/r/20250620-simple-drm-fb-icc-v1-0-d92142e8f74f@fairphone.com

---
Luca Weiss (5):
      dt-bindings: display: simple-framebuffer: Add interconnects property
      drm/sysfb: simpledrm: Sort headers correctly
      drm/sysfb: simpledrm: Add support for interconnect paths
      fbdev/simplefb: Sort headers correctly
      fbdev/simplefb: Add support for interconnect paths

 .../bindings/display/simple-framebuffer.yaml       |  3 +
 drivers/gpu/drm/sysfb/simpledrm.c                  | 85 ++++++++++++++++++++-
 drivers/video/fbdev/simplefb.c                     | 89 +++++++++++++++++++++-
 3 files changed, 173 insertions(+), 4 deletions(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250617-simple-drm-fb-icc-89461c559913

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

