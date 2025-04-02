Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8151B21BD
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 17:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743615738; cv=none; b=a1Nf5zSYE4eNfYDDb9m0cqk+L+fdxzt+nWDjopcS+kN9TawPIOYoasBv/X0inYYl20o/12CSNM+tuJzHCLS/1G2515UzD+SDOlb/0OL5Ze8X0jJjttYVuQdWWMxJUOplFQAFtLXvavyBue8buC4n63SvtgvO2VFDI9vwY8YC1RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743615738; c=relaxed/simple;
	bh=w+l1IxbKwn5+Odqn0uWbE42u8ngJlWpn+SjVKSxHY6M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qoJTLoySehjnKhQgDIgf9PbXYEn5DV1PE7tnpg8Ppxjw7V21HuU1RAr8P80Aw/xElg92pcsx5Ba03emAq4AuYuZ9YoT7eICm8nNJl24OYz06pfJ/KY7uq6TKaNHrhN8blMW6528ceG97yo8yvWJrS/gZwG5yEZY6hSDml0j0CsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iSkVZBjz; arc=none smtp.client-ip=209.85.166.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iSkVZBjz"
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3cf82bd380bso910485ab.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 10:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743615735; x=1744220535; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d8krvmT3hXiuiccuxDpOYGdDtTsrrIwxKLxWjX0uKEg=;
        b=iSkVZBjzb1QE2tuXv9Z+3zgKk5AAkxlVuzx+OZ5Wrxllh999UmJu7nK5RJe78ULCem
         lb5TU+R4o5dFefgP8w10gRwdOrw58wBmqIKtLdjTYopHsHSb6KnEoOFYqphE6MaNkyGd
         4QL5GpO6tq4VKwqh68WX9A1It1mwALwcPLRnwnlec6O4fbXNcoUO/snWrE8wPHxvqXcA
         TM2k+g2T7etOIRtW08+ugXHyHspIVLgpvs0FWvHTNofwEBygsKrPP6s6g1dYakzC/qSh
         jcDCVNFEdlCZvlhW3+9kQJlGlpPIIIyQQzYqDVtb109WehEECpBkUf9l+VUaJjb2juXf
         Cu5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743615735; x=1744220535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d8krvmT3hXiuiccuxDpOYGdDtTsrrIwxKLxWjX0uKEg=;
        b=QFFjGq5UbrDG0AbZVmmJHzTdrpBvcH2o/1kpSczCMHj+TFxR9ZsDE1dGzrQZ49nhsJ
         K+pEdSFm/qIVmh/qaXCFo5eElzBXNnBGwgYgzyBD0YijgFYMs/FgNeF9NbCPIxYhbM7m
         nZ/wa62NubNx3zfFtcejNHhvCKkyHMjQK3ZUs5jpOW6yJQHfiu610Ml5mbeSmiuZeqge
         U7PBM++edJ2Pb5lcRnFNq08zOttjm9wRsGqHOeC+T3NinHH6VMyWBVtriwIXKAAdlDrJ
         5zPVO9FnNx5soigroFP9PAk1RWMlKQcKzkcSKojKol4+jX5StSBpbC+xhlOQGnN6Qxus
         EIbw==
X-Forwarded-Encrypted: i=1; AJvYcCX9erTYk4G4lDnAxQvmIoH0ZmBCk0QGb8Bh/Jp0Bf8eW++G3n2sw+3rIqQFtNFtbDuUm1IRkZJoy0ROIU0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaPa807XxVFZVDOjEaDQ2ko5Op2BMmT5TFj+KTJVH0TEio/p4V
	tDwdW2uzxaFTI254r74vYrVFju25XQ9t3OipUPcoP6Asxhh/RuEH
X-Gm-Gg: ASbGncsKGl+kq76OmvjhxoSdkr0uNGoP/kjUY7Rjxr87MhPS8MieTHSTgzFGIRgzqwG
	Vaf8CvLdNPPsevurPxJqqt4n9RLoWo2ksEvMAccKBmp/2invrvZ8dS08ag+JeJcOqZ6NPXba2yC
	2YHzyLlc7pjlZSXBHPnuX/l5pAe6fZd6GpN/IaKnnIF9NiXpp1yckYkrefHHMLDM/DncdTi9z+C
	WgEm23w9IjTfL9hiEa1wLNuIfSe0TeStL9lnKRXtXyAe7YxS2TH37v8XLd/R65RLN9hq0CWW/rL
	sbWH4tHcHJIl3Pf/8V8LP7ulevM+uZIYPpUVAZyB2tN/x/aAS3J2eV7ZVxFKmKUOkYGW8N32QsG
	ON5vmvdylPASM
X-Google-Smtp-Source: AGHT+IFfosceATDKvJJ46yRHWVuAnvPMdP3MQ3uyX0/XQ3xbrKDap7g3FuGUZOEfht1KRhM3yUM73Q==
X-Received: by 2002:a05:6e02:1a09:b0:3d4:3c21:ba71 with SMTP id e9e14a558f8ab-3d6d5543888mr41235455ab.18.1743615734827;
        Wed, 02 Apr 2025 10:42:14 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 10:42:14 -0700 (PDT)
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
Subject: [PATCH v3 02/54] docs/dyndbg: update examples \012 to \n
Date: Wed,  2 Apr 2025 11:41:04 -0600
Message-ID: <20250402174156.1246171-3-jim.cromie@gmail.com>
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

commit 47ea6f99d06e ("dyndbg: use ESCAPE_SPACE for cat control")
changed the control-file to display format strings with "\n" rather
than "\012".  Update the docs to match the new reality.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Tested-by: Louis Chauvet<louis.chauvet@bootlin.com>
---
-v2 fix missed \012's
---
 .../admin-guide/dynamic-debug-howto.rst       | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index 7c036590cd07..4ac18c0a1d95 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -38,12 +38,12 @@ You can view the currently configured behaviour in the *prdbg* catalog::
 
   :#> head -n7 /proc/dynamic_debug/control
   # filename:lineno [module]function flags format
-  init/main.c:1179 [main]initcall_blacklist =_ "blacklisting initcall %s\012
-  init/main.c:1218 [main]initcall_blacklisted =_ "initcall %s blacklisted\012"
-  init/main.c:1424 [main]run_init_process =_ "  with arguments:\012"
-  init/main.c:1426 [main]run_init_process =_ "    %s\012"
-  init/main.c:1427 [main]run_init_process =_ "  with environment:\012"
-  init/main.c:1429 [main]run_init_process =_ "    %s\012"
+  init/main.c:1179 [main]initcall_blacklist =_ "blacklisting initcall %s\n"
+  init/main.c:1218 [main]initcall_blacklisted =_ "initcall %s blacklisted\n"
+  init/main.c:1424 [main]run_init_process =_ "  with arguments:\n"
+  init/main.c:1426 [main]run_init_process =_ "    %s\n"
+  init/main.c:1427 [main]run_init_process =_ "  with environment:\n"
+  init/main.c:1429 [main]run_init_process =_ "    %s\n"
 
 The 3rd space-delimited column shows the current flags, preceded by
 a ``=`` for easy use with grep/cut. ``=p`` shows enabled callsites.
@@ -59,10 +59,10 @@ query/commands to the control file.  Example::
 
   :#> ddcmd '-p; module main func run* +p'
   :#> grep =p /proc/dynamic_debug/control
-  init/main.c:1424 [main]run_init_process =p "  with arguments:\012"
-  init/main.c:1426 [main]run_init_process =p "    %s\012"
-  init/main.c:1427 [main]run_init_process =p "  with environment:\012"
-  init/main.c:1429 [main]run_init_process =p "    %s\012"
+  init/main.c:1424 [main]run_init_process =p "  with arguments:\n"
+  init/main.c:1426 [main]run_init_process =p "    %s\n"
+  init/main.c:1427 [main]run_init_process =p "  with environment:\n"
+  init/main.c:1429 [main]run_init_process =p "    %s\n"
 
 Error messages go to console/syslog::
 
-- 
2.49.0

