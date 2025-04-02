Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09F6204C36
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 17:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743615789; cv=none; b=Sgj9Xhlo/QyDuRGTL6UiFv2A8kfgwCC+Lm8pLHPewjmLA6Qyme23+4wgWuStTPsC72S45WnUYheKORmRe851MhYTVDfT8Nh8W7FrdHMWndJgzPipVNpm07wf2Jp2KNGwr0A0Vxlr4HlL0mDhdlBZI3qlRPHTuX+rGMaH1u+y2EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743615789; c=relaxed/simple;
	bh=2hj07UwdhkVjVMyzWoCwFWPShBiCLBIyGVcsL78LCFs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uFuEfw4boQWazZT4P0z2cwwDuMJUxyBrbS6cJSm4TzkOpM6G7cH3qwaoUGaWL37JEhe90s24ooa9gO7VT7qZrTKqA0oJBAYyxtp7LN0dFYN9MwnKtbv5nYWHc/XkV/BHGXvBp7hkA6+e0d34DXz7p2LwITQfyzml54iHsEm+HK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NykwBUYs; arc=none smtp.client-ip=209.85.166.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NykwBUYs"
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-85da5a3667bso588439f.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 10:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743615785; x=1744220585; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/+QMYU6kMnFOETa/gyjW3XwbPIpROUU0JSPdCI4eHHw=;
        b=NykwBUYs0P1Tz61qhf0CFYOCZLu3IFyOUAvkedKo+6f4SIbuEhRAfT/EJrMs++GKnn
         6zfLr7DJTY+f3gGp1dd2td7WhVwIKv8X2r9RcfFiCLDde8CUkfGncAMrfE46q5MNaaLp
         Do6/wDircetaktyl2ffqeHdrD0xwDmBijlXpLqaAV8XMBx5tSoXnAlI0ZXrtI7zrgyt0
         uSn43J6/2Efj4jA2ns1DN/9rx5AKaicgT5pzCJ5YacFvbDmrLdGzOXqfLKfh/ahtCY4g
         wzWbsJ7StaBEpRbeplYuX6L+yKaS4glxM+DHw+dex03XoKa+wowgV5uv4aMZtDnUXarV
         Y4sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743615785; x=1744220585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/+QMYU6kMnFOETa/gyjW3XwbPIpROUU0JSPdCI4eHHw=;
        b=GGVA7Xll5TkiTkKxGrBsm4SmWu62m4xg02PkfyjRX2D2RslSH3SgUh30opIBmtOm6t
         vaV98PY2T4PfbMyq1ioPa2iOj+Y9EqT3qSMNnHFONgnCh7MjXtoqfpoPhG7EwgLk/his
         qApoajYgBP13qShbmWdBAsaJ/iaKK/X8OvmQt0hTv9BHlwo+NLxPsItJSk/sVdQ+VfU7
         2KfTRs7oZgpA2Q+hS+6Ca3X8GRTHw4GIbmbDxMbWuREBrdpL0HqNGBA6MB9s70ynZvn9
         DK2KKSHAC8oWshLNWRXcoWaaFF1cac2KY3k3VdEPyf+d+qL+6knCtGoQS++F+/6JJrD2
         fd7A==
X-Forwarded-Encrypted: i=1; AJvYcCW4GVfzXTwofqXcL7Zty7bLDkjyFYkyKry31A53DXR38jaVOWfmj9a7j8CpzKJh82vG9hXIXCTABdWXFIY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtdfhFcIGnIBy6qI0ZRklUE/6gxBRV6iTZtutOE73I5yGnQwX9
	qbmi9RipnbQxAL+nuPBd/7QNq4ASJNTBGREwFeZeXXZDjCoJL1pY
X-Gm-Gg: ASbGnctcqd25820yZ2MfN6/Vnb20Rkp9KGvRplKzWE4J1u/NE6TB837Suk0U7IqaPs+
	zJQ+zhFpvvIH3j7+Q5pFafDN3FxJcgD8L7wOOIIO3DRNftu0sSAv5qU5rlT2Sva9jILaFSVs8vD
	6Qz14mcudEvA1RF4XO9C7NZIv3Dvd8J9gvwVg27dM6T4YLR8k4XFD4WKC0Ca3mwzif4i4FFGn6t
	G89t6KjgcteE/sivxhgDughxyaj3WdO70TQJYhJbGLh4nF6TCkXSNlIKbiQ8WTkY1YIWU6w5JHv
	LN65mZQ4SdA9HsU5R5VrzW8aSof5tiUT30JDUwsrb/CvwqrewuF6csQ4QFAMxxtgnc3V8eLzvOi
	niQ==
X-Google-Smtp-Source: AGHT+IH6nE+1RRyptl+hnFIsnD98qBIE2DJ5GwLkp49MBABtaplmtxYAgbpkZKesyp6M7QVsZiqFPg==
X-Received: by 2002:a05:6e02:144a:b0:3d2:aa73:7b7a with SMTP id e9e14a558f8ab-3d5e0939424mr211440705ab.12.1743615785077;
        Wed, 02 Apr 2025 10:43:05 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 10:43:04 -0700 (PDT)
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
Subject: [PATCH v3 53/54] drm: restore CONFIG_DRM_USE_DYNAMIC_DEBUG un-BROKEN
Date: Wed,  2 Apr 2025 11:41:55 -0600
Message-ID: <20250402174156.1246171-54-jim.cromie@gmail.com>
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

Time for some thorough CI.

Also, the previous 18 patches could perhaps be replaced by a single
invocation of DYNDBG_CLASSMAP_USE, from a C-file linked into all drm
drivers & helpers.  I didn't find such a file, nor a drm-client
linkage item in the Makefile.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/Kconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index fbef3f471bd0..c7d6adbe17eb 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -53,8 +53,7 @@ config DRM_DEBUG_MM
 
 config DRM_USE_DYNAMIC_DEBUG
 	bool "use dynamic debug to implement drm.debug"
-	default n
-	depends on BROKEN
+	default y
 	depends on DRM
 	depends on DYNAMIC_DEBUG || DYNAMIC_DEBUG_CORE
 	depends on JUMP_LABEL
-- 
2.49.0

