Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5AC1DF975
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 17:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743615780; cv=none; b=iQ2hZM4oIoG09bgbDB2oDSiFOUTQ9eUyyb/Y79gfvHK4jW0i1AvL9jwm/8JmlfEuqbrqphQ2YrRAiQ8BeojaOUDWSbWvRsR7mI2BatnETrM9ZC+4QERW+8ODFtJGfrdhpIosXrNPfu7DHIkDhTsTKzXCpy4qmIzryBO8HgreCGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743615780; c=relaxed/simple;
	bh=SMOgUl5f5Hv4lntfLvuEDqMGTbyJ1k0zKXfBEdqoVtE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ogo9mrBaCID5tD7f4ibljdN1nGGVLOEscHXyDXSUamIMEp1roTaAFqrOSyfIrKzIm4eFfihxXh9wx5onaHel8dMXdalJKcRFG3Dh3RLlHJymZP5Venc0dw2GIWWrPP9MYOqTf4YoLH5Z9OUMcZFInFjp3rohYKzd6AcGWT6HDyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bc9VsBzz; arc=none smtp.client-ip=209.85.166.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bc9VsBzz"
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3d59c8f0979so3700215ab.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 10:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743615778; x=1744220578; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tgy450ZES2ez3J/XkWzr8/KGFStO5bXfg+gAZCZdzzk=;
        b=Bc9VsBzz7lVoHldAp+lA1LEr2EPH4zDcFIOqzMb8ZzPJxrItzB4XlKjDpgxaRjQkEF
         Z7/a61Y5+lhLSWWt3uFEuU1o4QVST4HaLlyRAEvLhpzipNPEaWnVnHSZwpycxgZEKwGx
         aiTYMFYrgnUjGTX0F7rBtIcV1B1xT0oKv65mhvo9bIKxktYFV5bZFL6TCpIEbWvjemVq
         4iIEcK8g5+zyp1ChJht27v3Pd8HV8DwPVPbe+E0SenNhi3An6VGizGsdpZN+imIHa2AN
         MxeaWybAA+NchMKjxJ+GlL/xWUuy6iqYtAYJng90goLCXITYJTmG3AhIDCFPVIfwOV9c
         3Edw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743615778; x=1744220578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tgy450ZES2ez3J/XkWzr8/KGFStO5bXfg+gAZCZdzzk=;
        b=BTc8MQv5ntv/q/YCQ9L4Pqb/UtA1duNap2iJfVZ1SlxXjabcclt0NkEwGxsV7rX90H
         bFZ3G8ux/Pd0l4Ub0/0K+ZzN1uYBeEjRXQtV+dohOuDgtxAsFkjRUZofT0rl61Y4K/T6
         TogwvaiVjPrlCO8IzHEWVBJ4IJpBfnW+xZZIE+h+VpftYysToohW/uNbNfMjgX7GN204
         4+y8dE5bdyjCGYB5D0PQFzfqGvuPZryhmy8loj3VaKwQM8Pfuj5khfs8OLs14nptt+SA
         AKma7PNb13VZyHa10LlrjvlW8FUtNJvBQRIBxBqsuZIBQXAhnZjNKoUQD5rAeI3J0y9i
         PQKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsaM84j//UEBJpTcpaTjkc4plKQ42G21Djv9L4DSJmF67NyBxeHnXlzqkTwhOMjx1iqYVPAv98VJV+/b4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkJdflUwXgKwMvuVox3/j0SXk6V/Ula2P3sX/XjNjJXqCo1UoZ
	//ojytbN4JX1zOjWkZbAIhd4Gi/0cgsoH0QbYVHzDWfIVeQdSTFb
X-Gm-Gg: ASbGncuo/PMUSHnAaIcEXTt8BrOd9dz5TqJSHIJ2WnMCnIqiOL+S+/D4i3mfViGWnuk
	2CRXgHceEAbgI3J5TorohmvVJ9+48BvgFJwlGZ1JzDQalfplGH/Xfp7l5/SiNWTYirMYHKGaOd0
	3+82tJcuStU9a7EQB35+iuHNf8vF2UFe0NIkHn0Z/5BmgvnAxxE7r6d95FeWKxalpduUrN3CsgS
	yYphXnMUrKub73A64JSOM8v5GDiNL+e1g3nztR8p1hvLCSY2D6M2i8ZuRvXhDrZEzb7Cdji45ZK
	MI3a6oA15ujtO/dFUyO2vLa1BCo+F9+HOPeOAHXdCUzGNXBUkLgvZD2rCaHGdZioPtPA1yytckU
	Zcw==
X-Google-Smtp-Source: AGHT+IGOn5uIZhYGkruQeCbC1f+WjkFMEGOf33zX/XAEqkxeDsXMZ4VsYrJ+aFa+RIq7clpGvTTA5w==
X-Received: by 2002:a05:6e02:1d9d:b0:3d4:2acc:81fa with SMTP id e9e14a558f8ab-3d6dcb49685mr7363055ab.2.1743615778123;
        Wed, 02 Apr 2025 10:42:58 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 10:42:57 -0700 (PDT)
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
Subject: [PATCH v3 45/54] drm-dyndbg: add DRM_CLASSMAP_USE to radeon
Date: Wed,  2 Apr 2025 11:41:47 -0600
Message-ID: <20250402174156.1246171-46-jim.cromie@gmail.com>
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

radeon has some DRM_UT_* debugs, make them controllable when
CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg about its use of
the class'd debugs.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/radeon/radeon_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
index 267f082bc430..6eaac728e966 100644
--- a/drivers/gpu/drm/radeon/radeon_drv.c
+++ b/drivers/gpu/drm/radeon/radeon_drv.c
@@ -253,6 +253,8 @@ static const struct pci_device_id pciidlist[] = {
 };
 MODULE_DEVICE_TABLE(pci, pciidlist);
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 static const struct drm_driver kms_driver;
 
 static int radeon_pci_probe(struct pci_dev *pdev,
-- 
2.49.0

