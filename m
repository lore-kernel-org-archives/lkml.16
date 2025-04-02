Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067E91FF7A5
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 17:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743615779; cv=none; b=kqFjB+JJsFFGVva3NAgPq2146OEBTrSDQuLzDdAYGQoP+VWNvfROF/uU8xcm8XsuR3msAFwtZ5aVcTL/zstbc4WypkTsOKAQ3AjflTUTel0/as8UQJEP/o5ZcxqE49gQD5X2qn9Q/oCNQmN5dS4AR02LtKPb4HLKpL9gtH4Zqng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743615779; c=relaxed/simple;
	bh=8uJoalDz4gUJ4A+Uu9pLqeleSfN8jtRQc+WX9rk4RaY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VoOGgQztrxS9440snArzvuueUPvSiQacBoLKVT8+ZjKhesrHosYRv/CMv4XmSNpC9ygg0xshVR9bhINnXP49QRu+Vt4n7lKboIcwL+Bnzpfiowp2ekJXvYYImXmiXxua24XDUyUR6AZzjG2IMTGrl6rl6u6NhMejR515zkHpUs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=apPb7lAT; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="apPb7lAT"
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3ce87d31480so493805ab.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 10:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743615776; x=1744220576; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mR3GZQ988EXrhdMWSVSfrBHjk8VugzTeXVmkAtrRrJY=;
        b=apPb7lATbPmPJLS/ETVL25SZN4v+ahzKEOBsLxQ4TWyHyt+Da9f7CoMW6zuYMPTihq
         //fE6MAfs72Lq7keRed6M9xziX1WxCTkdUmnEGPFOHdTJTXm57r2DYyskkLZD/xSuz2/
         JoxNiDSS0oJp8gJyPufmhNwvwu9ogmNOMKyVlWNU/yQqxxMqbqINEOmmwCUJkNO8tGlE
         jK82LQ20JS2Ifi1kQKuzLIGZOVP1Um3gccbD8jE/WIyxhc11v/Kd6a6KiZbPnDDLChmZ
         3rMYZXAGacwYfCfNp3LTotenCyjNsVd13UptV+PmqqEPxtD5D+PwCezvEmF+OgYzj7wC
         0TeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743615776; x=1744220576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mR3GZQ988EXrhdMWSVSfrBHjk8VugzTeXVmkAtrRrJY=;
        b=xQv3BvnpYWbEuIbynPlqVeLuOisuJCatZ6Iia8O86JVefQkhZPyq9b1Z7jJ6ICHSud
         X+sDcMnhCLteICHp9hG64KfL/FkMrmwy0/0rXx5meei03PBSYQG8XtCVa/GnJ0nPQXxJ
         bbSvzO9prOl7pfsZH9UNo1ChXzFqEQtz6WdSCxUIGdr9rLHy5JFkIVsc8sfziKM/VRvp
         Qs7XhufSlkQhKqHvMGfNwpqLU9NzwNyDfW7MccyR7DztQ4wAs7zUpJuh7oeKanHzpK7X
         uw4vRpXpeQDyBx15iIy1dka6EexQn6q/GKkv9FJ+NHUwpR0YvVAGwObSvuPyZsWtR2BE
         ocRA==
X-Forwarded-Encrypted: i=1; AJvYcCXCmybx9qpkKBTU5LxxLW0R8JlXnL7dz9bwLDwBq3MvlXceHSa8S5BBMj33xEBdt5jKDNaRiYRXtXj9k/4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTT9pfLsF3JzyjmwpfdRQ3I1q/InMneUoUJVAFwP2KzyrvDmk6
	i05dpuFQvFeGUfODbSrQwoKjGE0oHYQKXPWaubEecb30bcXevRN3
X-Gm-Gg: ASbGncvcXfkzmF5doDbOcLqzU1xahdtksT+qm7zyMcAyiqirXF0aVOXO5KtY7sCPr/N
	gYZfxBHMOUtBpVM2GlFkNK48mbwv3jxVc31thbPMr6RFLNPm6LMVgqkAGcsajTZswsrqn9DwUMF
	oWIhVVGD2wM3cfkH50oaeBuGcz94gkN4BQ183VqK6fNRVrAYiftTcb/BzEBqxU1hrEdzvyyU/UI
	jSYewqKbUPL9l+k2rPqPltHnEao4JHr9bXW9NkIABs4BCJJJ/h5pXNWyvbq7+RaOsl0Af3VyWl+
	jV4Ngy7aKx0LS2cKfG3nrQHF5dRdbAtRn0DZ/U24tcSmMF8a5SAje8f+J3oKrFn+TqZJI0iP4PK
	XgA==
X-Google-Smtp-Source: AGHT+IGz0mzs+hYYK7NGp1ygOapy1Xtg2pb7btBR9FttZE3xaY/IeRPzMzWa7VzATtwuhacGo5/EtA==
X-Received: by 2002:a05:6e02:c:b0:3d1:a34b:4d01 with SMTP id e9e14a558f8ab-3d5e09090famr201390495ab.8.1743615776107;
        Wed, 02 Apr 2025 10:42:56 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 10:42:55 -0700 (PDT)
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
Subject: [PATCH v3 43/54] drm-dyndbg: add DRM_CLASSMAP_USE to etnaviv
Date: Wed,  2 Apr 2025 11:41:45 -0600
Message-ID: <20250402174156.1246171-44-jim.cromie@gmail.com>
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

etnaviv has 5 DRM_UT_CORE debugs, make them controllable when
CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg that the module has
class'd debugs as well as plain-old pr_debug()s

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index 3e91747ed339..70759b7d338f 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -25,6 +25,8 @@
 #include "etnaviv_mmu.h"
 #include "etnaviv_perfmon.h"
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 /*
  * DRM operations:
  */
-- 
2.49.0

