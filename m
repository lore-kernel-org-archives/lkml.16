Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1D51DE2DB
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 17:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743615741; cv=none; b=CRzK4zpy+q/9AQbGQjU1ZsS/Er3rvGzxuXjuuHbpbyyq/lMiCnMrdP/9hx4RZjpuG27Z726IR1uaq4o0i3mp7SZ+Qsz4KLDJZgspuelMVBiWZKWQO4HmaudcLRZs1X2w4lDc7aZgzbVJQCdMhPv9wM7/ksKl3fA5OcyfOi0h5oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743615741; c=relaxed/simple;
	bh=owZYpNR2pwuDCcONhl7AIBARkXlaRrZAKNrUgbc8WNU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=stPXhLYQvnNSqIP0M3DdIqXPhGQBHfjB5PfT+fpW4KCNLnZW5ZWpQo7McrxyM30poQHd2LxiDaIw4vzmSXyyiS11QYvmLMTmKA8PK0gE7O+SbK3I3NbB5+YxvphwPWiWtJzIqMpBJ1kydsWam5m/Z0lTKc1kLEU7Krm74LiNPbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EvGt603w; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EvGt603w"
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3d5e43e4725so474695ab.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 10:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743615739; x=1744220539; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F1MDFYF/EJ2a7UGqvWTU6dzs01F9Q8UeZTgbtP6X+58=;
        b=EvGt603wwSw3iDJ54DeckZkTN6fEB/P/J2k6UtILVW9p2O59g+ywnF7eYg4ks7VeKC
         lROHscyqFg0e3XY9BXePVroCjsjT51fw9EMd2Myp5b7dc4n2DvHXehkcxMcazCJEv2Z5
         ri/fndm5GM1Jpd3dySHvc1HVBlkOkeXHeDAeXJ2BsTDBBsY3PXuuIA6vBR6MEAVEt+Hw
         g0r9ZXAm1i8GeQ1KMm4MhDu1uF7i70zEaxWiezLtkjMw2els9MGcryWYSKPbqlLk9QwV
         0tbKC5nMEr7MgyiLeRt69pOHO0JCgWBFCkkiY+V8CuRVmEvuS1Kyt6miEpBauKc/Khqw
         0Aeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743615739; x=1744220539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F1MDFYF/EJ2a7UGqvWTU6dzs01F9Q8UeZTgbtP6X+58=;
        b=jLpz4iQwluKd8m9qx111RxDAirc2xMbOlVOfjGn5Ig8kXLSjeJJE1gCPHfAM01EwRm
         9fUcUFQVXZuEKRQPl4RjnIgFvQ8DJM9lzOtu1tUGhnhVsV24DC9Xq721FEWyxageCxKY
         emADRjPXPchtcDTSpVqCD7Ref9KLo5Qds7tHu6pTpDKdWCZNYuoWc73dImzZxLnpqOnS
         7p4Kb7lJQ1UD/vtc5LrocFBh0rH2U//qC1rPEhWMxMbb/d9E5pbAtK0GcBFCzTBgXS/A
         tnDfsWo1Lr/292J2Jy6SOcKlaDgAhL2dR2dbWH2DeiZumZ9AKi3w82GvjCCPAIzQIdeU
         4w1w==
X-Forwarded-Encrypted: i=1; AJvYcCUSomvDdV0DhRsC/G4qZ4Zll5MCgekCtMva5y3GutH/w/Ab9IkCB0pMyvF5Qb+rkpmrLafqHuDmPHXZiw4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLFB3XDTj1L3T/+kcFHFMsnWmsc4/IPXTHzD4I3Qfl0igCyXSX
	gQHlAOvA3cEGQod9+EeXR5t2o695pslSgFt86nmK4PpVwiBlWLKvPuObDhBg
X-Gm-Gg: ASbGncvS9rEr4Gd/z778llsYXvTm0yVQU0EunHHOtWFpJ1P1Ks2IOgdMmAL+yOfmmrF
	+SQajv5ihQ5fK1UFClnd0AstLWabE8lg8DdmEtugP3w+rzDQL5Sez76lg9DchrqKBbrOxfec99N
	Y7e57mZJ4Jl6GpYkp+goJr08ezVkIZtX9ql4VxTGBm3ulsZie6T87uy4mtu5jjwd8bUWt7IbP78
	zudZPVgxLXgtdBJXbSBuSHu0SjtVgVKC3sypw6f6efxOSJcCfC2cMdpRd3In8E/f+paVEeJEbgE
	rW2O/5WGyCkVg7Wud0+L+J+IT6l6xeXlTPa6UxnPPlhgdjpgcLTtx3gn8Lphwun54u24rRC77z9
	9aw==
X-Google-Smtp-Source: AGHT+IFVWQtukqjbox+/BI8jH/gu5QsbtgxbaxR6JpDzTl89/ZDWJ5DbXCocb+GVCPq2mu6sIVRlLQ==
X-Received: by 2002:a05:6e02:1c26:b0:3d4:414c:6073 with SMTP id e9e14a558f8ab-3d6d548b68cmr40322985ab.8.1743615739132;
        Wed, 02 Apr 2025 10:42:19 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 10:42:18 -0700 (PDT)
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
Subject: [PATCH v3 06/54] dyndbg: make ddebug_class_param union members same size
Date: Wed,  2 Apr 2025 11:41:08 -0600
Message-ID: <20250402174156.1246171-7-jim.cromie@gmail.com>
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

struct ddebug_class_param keeps a ref to the state-storage of the
param; make both class-types use the same unsigned long storage type.

ISTM this is simpler and safer; it avoids an irrelevant difference,
and if 2 users somehow get class-type mixed up (or refer to the wrong
union member), at least they will both see the same value.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 include/linux/dynamic_debug.h | 2 +-
 lib/dynamic_debug.c           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index ff44ec346162..b9afc7731b7c 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -124,7 +124,7 @@ struct _ddebug_info {
 struct ddebug_class_param {
 	union {
 		unsigned long *bits;
-		unsigned int *lvl;
+		unsigned long *lvl;
 	};
 	char flags[8];
 	const struct ddebug_class_map *map;
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 147540c57154..55df35df093b 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -799,7 +799,7 @@ int param_get_dyndbg_classes(char *buffer, const struct kernel_param *kp)
 
 	case DD_CLASS_TYPE_LEVEL_NAMES:
 	case DD_CLASS_TYPE_LEVEL_NUM:
-		return scnprintf(buffer, PAGE_SIZE, "%d\n", *dcp->lvl);
+		return scnprintf(buffer, PAGE_SIZE, "%ld\n", *dcp->lvl);
 	default:
 		return -1;
 	}
-- 
2.49.0

