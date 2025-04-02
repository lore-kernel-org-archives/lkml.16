Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B996A1BD9F0
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 17:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743615739; cv=none; b=sQwJDl9hCtISz3X/Zac2OpHdwF3JjiYqqKAkdUMh6G/BBO93NwRn/K8ChnaH9b0XKL7bdCXfckVT6wrj+76aIKcg9XfRhcbO4gtYlphWJf4epQlUWaWVM064wTw1C3h10qoIJyV/ILPx+sbfGITWd/MZsBLJa35Uc/rYRshuvoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743615739; c=relaxed/simple;
	bh=zHwD8qJIhMBYJsra/FIeWdTmZLdVjzCQ82XUZP2dzho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mLtbdZV4daCtFam2r8uCvv9sfVzwLb3wovpz2tYXR+5VKZ27nT/n0+/aE4IcPBEJdqheClmiu7v7nQFjVaRdbiQHafGBw4P69IyWYZhbtXM5XTohsophtOQqShPI6XQDPt/+Sbrcp8Kl0CBe2DAGNwskBWWMO1+Zlk4LF2xxykY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H069XsLy; arc=none smtp.client-ip=209.85.166.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H069XsLy"
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-85db3475637so36356339f.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 10:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743615737; x=1744220537; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H1TeeGBRsVeJpwNeUJAZV2+uEOIfDic0oDGxOSg3WSs=;
        b=H069XsLyEf4BinbpRa8m9JUv901Q3LzhGkJEFPaVeyzU4I1u93TeELIpKMgOlALcfc
         4SGbOMEAf2XPnOj814yQOyWu089Bw/+zLGlqOz6wItjr3QZtCZI5s5Mxj0gQjJ6e0p5z
         Jdq0schn+USpbRk6HLiyDBhKbE/Rd7yLOeyus3OkhY3o4UgfgnkLqq/lTHtYUsmaMts/
         i7UeBYKpDbQpO0AVQnDU6o6hmxyFTcpf6O/6pEX59BTaMI1eZHEm+5qQfB25ICXQb10d
         WFva5H+bHqXlxUdePR3YumC+v2jLVy64ZAaeub33xoAruQHqE2BS4RKb7IFgMS8cRYG5
         nrDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743615737; x=1744220537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H1TeeGBRsVeJpwNeUJAZV2+uEOIfDic0oDGxOSg3WSs=;
        b=MRFn14dw7/97tMyeD9OsEFxf2gf84FDegfklXYCtd9ILlb9gtg2reNzXyv7zOlxCbF
         Dgc9ONjJaQ67LqL9IpdhzzdjlSv9BCQdima2eyIKF3earb5Otjh83VT6J3q0d9/avypX
         nIQs7dliw0iIF3Mcank3MudfKWZYH2dvqMVA5uM3RSXMpNh92IayJlkFyURgJZibcBKK
         7jqPf4AfqeuYvgty4yRZ4G97L1yc+FWhUw2rqL2poN/Gh+Z5zrI3+D1WZtvH8W4Dkfwv
         cy+gSowv3mPDTHHTLS4eRYPCygdAw+P9kXd49euK1Pm6S9gO8emvbDNqvZV3SbmIfUgv
         ENwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSSKtdz9N5Bujlim2irBROTAoYOUu9iVTTCdOohF1Za6xAMvfvhoe6fYalrYNXiUC6fFDE4ab6r0KnVrs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSDWsb5MzmHzzj0UoHCVNzEqV/d/QdEBUtBPFpZKfKNPBw2mnK
	JmaerhFpJbjGOpPOW2favHYPGu8kBY1tHebINg0KDeNgWVXYjiFv
X-Gm-Gg: ASbGncu7oZj+xCP/ZgaMpQx7fWOSAxqIOj5+PJG/QN6Jw7gz0BKg597imv4Ea2gt0Dw
	3ZlWREOBQDNiRmH6PZLGFDxVcUQQhgeB4uxuEo0fjLNlMl/lp/NSnVt40RLRTUgZyVs4LCH0s6B
	en+Qhhw3hasX7qymhIh7TpIbzIxUoZE8oNCzvusV+HzjigL/tJfVhm2tiVv7Ae9VdgoiZMGE+z9
	85/uo9a7L5RZXoi3PIKdZWYV+1jFG+aPa1p9oPsh3m65rAFNjNgjizMmQqukfwdcK3qn3eDhdHo
	Oaqv1CiaALjo2i97zpQBz0OhKaXf2GV30P/b/ynPXl/YDLusLNg524WFUfiWV1CwqWhu35jWTB9
	voA==
X-Google-Smtp-Source: AGHT+IHivBONAricuMwjJKELjLZ3cw6bOgdRVYxu5GWLbo1Ajc6qDwx3gLg2XMoo3ny+fW96GOp9Jg==
X-Received: by 2002:a05:6e02:1d9d:b0:3d4:2acc:81fa with SMTP id e9e14a558f8ab-3d6dcb49685mr7330155ab.2.1743615736716;
        Wed, 02 Apr 2025 10:42:16 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 10:42:16 -0700 (PDT)
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
Subject: [PATCH v3 04/54] test-dyndbg: fixup CLASSMAP usage error
Date: Wed,  2 Apr 2025 11:41:06 -0600
Message-ID: <20250402174156.1246171-5-jim.cromie@gmail.com>
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

commit 6ea3bf466ac6 ("dyndbg: test DECLARE_DYNDBG_CLASSMAP, sysfs nodes")

A closer look at test_dynamic_debug.ko logging output reveals a macro
usage error:

lib/test_dynamic_debug.c:105 [test_dynamic_debug]do_cats =p "LOW msg\n" class:MID
lib/test_dynamic_debug.c:106 [test_dynamic_debug]do_cats =p "MID msg\n" class:HI
lib/test_dynamic_debug.c:107 [test_dynamic_debug]do_cats =_ "HI msg\n" class unknown, _id:13

107 says: HI is unknown, and 105,106 have a LOW/MID and MID/HI skew.

DECLARE_DYNDBG_CLASSMAP() _base arg must equal the enum's 1st value,
in this case it was _base + 1.  This leaves HI class un-selectable.

NB: the macro could better validate its arguments.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Tested-by: Louis Chauvet<louis.chauvet@bootlin.com>
---
 lib/test_dynamic_debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
index 77c2a669b6af..396144cf351b 100644
--- a/lib/test_dynamic_debug.c
+++ b/lib/test_dynamic_debug.c
@@ -75,7 +75,7 @@ DD_SYS_WRAP(disjoint_bits, p);
 DD_SYS_WRAP(disjoint_bits, T);
 
 /* symbolic input, independent bits */
-enum cat_disjoint_names { LOW = 11, MID, HI };
+enum cat_disjoint_names { LOW = 10, MID, HI };
 DECLARE_DYNDBG_CLASSMAP(map_disjoint_names, DD_CLASS_TYPE_DISJOINT_NAMES, 10,
 			"LOW", "MID", "HI");
 DD_SYS_WRAP(disjoint_names, p);
-- 
2.49.0

