Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2B8200BA1
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 17:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743615782; cv=none; b=m3k7iO6iDgFD4n4suSj8foMr9ekv71mWpKPjbmfAuTNFhQ4GZwMz8CwlnOrWW+gTKn2KwPEuvosqjaGIiHC6EchUOjYQzazS9rBGEEQowYnojxlAX9JtGS5JjHuGdX98Lgx+sKZ/sScKd7/kE9jtCdzOrZ0KasuhfwAeKUP0tqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743615782; c=relaxed/simple;
	bh=SjSejjyZ/55nTJ9bgxnHE6PQ8OHS1Xh0Xc0rMHnptQc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L4Ch2sntrufCWshDCJkgiUnzI4C8ICP5//6QqFGK2eX2SgP4V2veMxBCebqlQlEoJXJnHJK4Kx+iaRwSBG7z9jdxxcolStxi/1FR4fHAZI5N7rb0f5JKSJqYN076aE1DFDBLqwfR5KZcgPbqF64NSya8rOBCNLnlMfX9zfIvUjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H7m0kKhU; arc=none smtp.client-ip=209.85.166.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H7m0kKhU"
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-85b3f92c8dfso541839f.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 10:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743615780; x=1744220580; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JhoA9XaTmEGFO/43twqabJw5GWuyyTcgJpDDhp+La9k=;
        b=H7m0kKhU+SfsDs3TeHOXEGZvzByoS8n51ySi+4muthzrJkCrK+DrQBjJfYOmA7Gm6Z
         JnTHBgFjjAyw/kOdX92jOd07OEN+HxfOSYunmwjkyeGprgU3uDUxPRlzPWP6J5E7eQYQ
         YbBry6Frz2It3pSnnDY4tF9ztkojm1xuwVD/NczrarWjv+L3WJzpfdblzdCEoypA1mCi
         Gi/o0nL6KogmZ2KUJ7Jn8oCrkApnPEkpck/sn/F8expXAkrHHZW3aXQbUuYIenc38xPy
         jiGsc72paYlDQsy+i37rxhCGZpSWbZ7+rV+H8A0jGWuPRPHw5uiApS1xhJzLDuI1Y6MP
         lcrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743615780; x=1744220580;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JhoA9XaTmEGFO/43twqabJw5GWuyyTcgJpDDhp+La9k=;
        b=mPXMQedN70fpqJ2Pe1fxeYYt8pGBUAmaWwhLmyj9HmodKWNaolWzPrC2GSdV1jIfj/
         dj8K9yE1dBdTc6OXqJjafOZPt3/CfdxNmjcb9WG0bOoCrM9j69HnF/adwe4KZjdx3J96
         kIl7Jz5DgV7M0zHBycDTIEgXyuz0bb3ygAS2lAB4oEGmji7XagcXWttBkLNfmfW6+jeo
         LnnlN99ol44qNnBO51wMn0n2DC1zkHpb8gdUsNpSgdX09ur6NseC4e72y5e64FyizOYh
         aiIa4kz1oJFHwSw88zH39h+tuhgc0bCQ5StNQ3prFM1S3flm2JvToQJlfOSiQf38oSdT
         dLyA==
X-Forwarded-Encrypted: i=1; AJvYcCWRtWrfh9pLFUjVrAjiSS4s+R3D+If9rQzPwhQN/ijSW4pirTipd4CUq0WdMHESqlglDmjtjkumLoDAWoA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7vHT9aQJPUL4oS8v+2eIlHMQ4EwdTmOW4emyJVhw98aDsmMO/
	mmPN2u+d4z8Vz7/qigUws0F83Uv6nkIj38CE0E7S9IyEbAz6lKJV
X-Gm-Gg: ASbGncsj3jDxO/+bCkrwLPFe8J0vR7lEtZ1qd87qbLJ8y+fyVr4QwGKbRHB0Ibm8XqD
	jzNJi7U3w0f1YzESRvuG73kb0TNj4fM/l4upuUUwh+jBHYtS8f7doXk7Ocw7wk7XNZP2UFPFDV6
	belLqgyKzWzArV3lBC9rjndrgt5a4dVzXeSY4CcRRh32/C9P5+JdczvhSjLdqJBoHtYno5wLPaf
	J4vK//4/94/K6gvLFYbCezOAKB+wIkFFe25Ijom9E/OMIib4nmgMfRriIuu5vWVllwbtCbWrjd5
	1eWym/gGHzr1lUKrUid8FZeaFGtwYkPVJn+GC+bZXZkm/CpLxd0UTg3LXtU4cTCfmRgMpK4soZ7
	XJg==
X-Google-Smtp-Source: AGHT+IFlUifTRIdBdJrWmohJtGkz5j2ZAgmAXuJf+hqwzf5FhiZ9fS2SCZmP2KeBUmNu/DQKgqx/aQ==
X-Received: by 2002:a05:6e02:1787:b0:3d5:893a:93ea with SMTP id e9e14a558f8ab-3d5e0934a71mr183638485ab.13.1743615779885;
        Wed, 02 Apr 2025 10:42:59 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 10:42:59 -0700 (PDT)
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
Subject: [PATCH v3 47/54] drm-dyndbg: add DRM_CLASSMAP_USE to vkms driver
Date: Wed,  2 Apr 2025 11:41:49 -0600
Message-ID: <20250402174156.1246171-48-jim.cromie@gmail.com>
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

The vkms driver has a number of DRM_UT_* debugs, make them
controllable when CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg
that the module uses them.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index e0409aba9349..4b9da64661fb 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -39,6 +39,8 @@
 
 static struct vkms_config *default_config;
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 static bool enable_cursor = true;
 module_param_named(enable_cursor, enable_cursor, bool, 0444);
 MODULE_PARM_DESC(enable_cursor, "Enable/Disable cursor support");
-- 
2.49.0

