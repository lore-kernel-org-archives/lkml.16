Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27807262FCC;
	Wed, 25 Jun 2025 14:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750861225; cv=none; b=eMj9b6KYYo4rhSGKr6lQsa118sP4wyoWnp0MDAWB4yF1Xia2f5W2o0KeYlsSUS91h+6nedM7SznwRJh6GG5relcqPxgvFitzbpG+gBHmXvKHXIM7hljLrKkOkDFfLu2JrN0Z0Gk4RELVlPeOJcu0vlWtBQ+O2dNIQBWosdX9gA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750861225; c=relaxed/simple;
	bh=XI1jG0gcUgMn8BE5KHPYwrweZDiJUDaxAzFwWhchMG8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Z0ptHBt1M5WRGfL2OQ7/IvxmXmolcpObRLTGzKEK7nB7qL6YnY5E/5RmUAE4j/UiQpNFuleuqHemy7MoJGKqKa+zYMzv78OuQd8cI0X9M0fQs6gfqilMIxOyKURCMyD1gfU4X2m81L/xshxm+d0QnRFi8YrmAyHu+gt9p4ainIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VSPYLxlE; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VSPYLxlE"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a52878d37aso993146f8f.2;
        Wed, 25 Jun 2025 07:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750861220; x=1751466020; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/9vON1dGvMkjcvJECy6dH9S+/xZ6c3lb5QxJ1y0UWbs=;
        b=VSPYLxlEmcB4rPR2SGtnUij1PY/cEbdknfsNIjOQGhgT33L0npItop6HYoJOq6kUe4
         IevbpB0EI9MEpED4lVtIB11sp1Od2AEGK/3Ijf3fOl/OBdGvgjBzMhecWYXVBrC0Kxmr
         lOp2HaSOzrvEbOk6xf/CPRmUUZSBLz0rj8pHCGuwS7e5zLE74RPrH1S55VdnfDFvHrMg
         xG10FJFeo/rgF6+OTuLMUxZO9cte6STfKmdCGZrAg29yklkCH93qmLzNDZNAsxxCCaTX
         F8rqe0rqCvmqy+2Dmsz6h6FATNX053W1cQbgXOX4sFGTBg9ZqTkqRWkJQW9gvvU6EKZY
         OaFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750861220; x=1751466020;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/9vON1dGvMkjcvJECy6dH9S+/xZ6c3lb5QxJ1y0UWbs=;
        b=bJANcMENwalWuBrysA99Av6lMwEjgTBljd2qxIq4L+0PXWkY5wYjVv32G6uUzAFDdn
         Z1Ucgh6BJpv6mV+OyEnZwAFTD2DlwitIDaeEcvik4SDiwgpW9yjAyHBvjSMZA/yKs2lM
         BvmltmQuMcVPtDfw6vOjOS6ulzccsgOXdoaQSwVrE1M/G3Dy7IHdYB2ilKhRXnsBQfgm
         0/afjErEuZSIuK5d+QUR0mZQUInLMLXFNe821Ra86DXASY5FwJM90dAgmOKeR5apM70S
         dubRS+OvbXPMiV+BskeqFmUF0ZDbabkNREcHIHUtaQHP0r9+AyFMdn3AVkEzKr9Zm6LO
         poHw==
X-Forwarded-Encrypted: i=1; AJvYcCUDFdaqyLXhCzQZ2jn/2g1hs8mRV643jZkFBobXS9npnOpPyhLU3Ss22SNU6I8XwEl3QU8eu40tWNI5JLFg@vger.kernel.org, AJvYcCXl0QntsiSllNw6OPvlaj7LS2uoe5mEJ3kP9yP4+9oa7f7WEzI9f68o04/ifjmEi/FzDITPvHN3SXo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1HNuP9PgyVCGZgPRgk7t1PXCTjussaB26y2ox8iGdGRZTnjmC
	Z+kW1xb5MYv3LjdICts/Pe0JlLu0nBHYpv+T0pSBWR9++nrh00awU3g=
X-Gm-Gg: ASbGncv0aEAPMPQ/ww2z8sRsvSusLtzLlKv95P9KpJBLRExtkSScSlRorcNppnA0xoT
	J2w+7R0Q8mbQTcaY4liI0eh8KbY+m1/5wwy5DJtIdhhGjx6S045cuGnk6uFWVPW+Lk7z81rJoJb
	Fph2FMbXUpLe0tpBpqJv2k5FOxus6KnOVimwgtv9/lPHSxb2Om/5JsxwbuT3bJBQatfGC1TAeX+
	L9tWzIdOE6Cw1+JI4BvuX/fJPo68Bi73fAyu3LOl9FbsopEXebtWGbCLxOVuTs4khDEtm3gEoTG
	CDYVxU7PQmxwqNSLnVtZexFshB8HGWDbAyi5nVnCOE6suU3vqK9HR3xO6V19Cn58rDpjJ7DSCmg
	ZZdnttqNp3MopK7YMInAGtPLwnXpyPA==
X-Google-Smtp-Source: AGHT+IExKmVRAcB2BIQk0Tiz0yV1jrl455+NoIq0GGuCVbtrrAEBjnKls/muvZbgMkVCBW7qY5olpw==
X-Received: by 2002:a05:6000:3103:b0:3a6:d30e:6fd3 with SMTP id ffacd0b85a97d-3a6ed6624bdmr1076430f8f.10.1750861220033;
        Wed, 25 Jun 2025 07:20:20 -0700 (PDT)
Received: from localhost (238.red-80-39-144.dynamicip.rima-tde.net. [80.39.144.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e805eeffsm4744517f8f.34.2025.06.25.07.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 07:20:19 -0700 (PDT)
From: Xose Vazquez Perez <xose.vazquez@gmail.com>
To: 
Cc: Xose Vazquez Perez <xose.vazquez@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	DOC ML <linux-doc@vger.kernel.org>,
	KERNEL ML <linux-kernel@vger.kernel.org>
Subject: [PATCH] MAINTAINERS: standardize git.kernel.org URLs
Date: Wed, 25 Jun 2025 16:20:16 +0200
Message-ID: <20250625142017.237949-1-xose.vazquez@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

replace https: with git:, delete trailing /, and identify repos as "git"

Cc: Jonathan Corbet <corbet@lwn.net> (maintainer:DOCUMENTATION)
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: DOC ML <linux-doc@vger.kernel.org> (open list:DOCUMENTATION)
Cc: KERNEL ML <linux-kernel@vger.kernel.org> (open list)
Signed-off-by: Xose Vazquez Perez <xose.vazquez@gmail.com>
---
 MAINTAINERS | 50 +++++++++++++++++++++++++-------------------------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index efb51ee92683..23840fc19199 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1796,7 +1796,7 @@ W:	apparmor.net
 B:	https://gitlab.com/apparmor/apparmor-kernel
 C:	irc://irc.oftc.net/apparmor
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/jj/linux-apparmor
-T:	https://gitlab.com/apparmor/apparmor-kernel.git
+T:	git https://gitlab.com/apparmor/apparmor-kernel.git
 F:	Documentation/admin-guide/LSM/apparmor.rst
 F:	security/apparmor/
 
@@ -2830,7 +2830,7 @@ M:	Nicolas Ferre <nicolas.ferre@microchip.com>
 M:	Claudiu Beznea <claudiu.beznea@tuxon.dev>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Supported
-T:	git https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git
 F:	arch/arm64/boot/dts/microchip/
 
 ARM/Microchip (AT91) SoC support
@@ -3927,7 +3927,7 @@ W:	https://github.com/linux-audit
 Q:	https://patchwork.kernel.org/project/audit/list
 B:	mailto:audit@vger.kernel.org
 P:	https://github.com/linux-audit/audit-kernel/blob/main/README.md
-T:	git https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/audit.git
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/audit.git
 F:	include/asm-generic/audit_*.h
 F:	include/linux/audit.h
 F:	include/linux/audit_arch.h
@@ -6357,7 +6357,7 @@ M:	Eric Biggers <ebiggers@kernel.org>
 R:	Ard Biesheuvel <ardb@kernel.org>
 L:	linux-crypto@vger.kernel.org
 S:	Maintained
-T:	git https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git crc-next
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git crc-next
 F:	Documentation/staging/crc*
 F:	arch/*/lib/crc*
 F:	include/linux/crc*
@@ -6376,7 +6376,7 @@ M:	Paul Moore <paul@paul-moore.com>
 R:	Serge Hallyn <sergeh@kernel.org>
 L:	linux-security-module@vger.kernel.org
 S:	Supported
-T:	git https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/lsm.git
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/lsm.git
 F:	include/linux/cred.h
 F:	kernel/cred.c
 F:	Documentation/security/credentials.rst
@@ -6409,8 +6409,8 @@ M:	Jason A. Donenfeld <Jason@zx2c4.com>
 M:	Ard Biesheuvel <ardb@kernel.org>
 L:	linux-crypto@vger.kernel.org
 S:	Maintained
-T:	git https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git libcrypto-next
-T:	git https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git libcrypto-fixes
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git libcrypto-next
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git libcrypto-fixes
 F:	arch/*/lib/crypto/
 F:	lib/crypto/
 
@@ -7396,7 +7396,7 @@ M:	Oded Gabbay <ogabbay@kernel.org>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
 C:	irc://irc.oftc.net/dri-devel
-T:	git https://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/accel.git
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/accel.git
 F:	Documentation/accel/
 F:	drivers/accel/
 F:	include/drm/drm_accel.h
@@ -9237,7 +9237,7 @@ M:	Christian Brauner <brauner@kernel.org>
 R:	Jan Kara <jack@suse.cz>
 L:	linux-fsdevel@vger.kernel.org
 S:	Maintained
-T:	git https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
 F:	fs/*
 F:	include/linux/fs.h
 F:	include/linux/fs_types.h
@@ -9799,7 +9799,7 @@ M:	Jaegeuk Kim <jaegeuk@kernel.org>
 L:	linux-fscrypt@vger.kernel.org
 S:	Supported
 Q:	https://patchwork.kernel.org/project/linux-fscrypt/list/
-T:	git https://git.kernel.org/pub/scm/fs/fscrypt/linux.git
+T:	git git://git.kernel.org/pub/scm/fs/fscrypt/linux.git
 F:	Documentation/filesystems/fscrypt.rst
 F:	fs/crypto/
 F:	include/linux/fscrypt.h
@@ -9845,7 +9845,7 @@ M:	Theodore Y. Ts'o <tytso@mit.edu>
 L:	fsverity@lists.linux.dev
 S:	Supported
 Q:	https://patchwork.kernel.org/project/fsverity/list/
-T:	git https://git.kernel.org/pub/scm/fs/fsverity/linux.git
+T:	git git://git.kernel.org/pub/scm/fs/fsverity/linux.git
 F:	Documentation/filesystems/fsverity.rst
 F:	fs/verity/
 F:	include/linux/fsverity.h
@@ -13596,7 +13596,7 @@ R:	Günther Noack <gnoack@google.com>
 L:	linux-security-module@vger.kernel.org
 S:	Supported
 W:	https://landlock.io
-T:	git https://git.kernel.org/pub/scm/linux/kernel/git/mic/linux.git
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mic/linux.git
 F:	Documentation/admin-guide/LSM/landlock.rst
 F:	Documentation/security/landlock.rst
 F:	Documentation/userspace-api/landlock.rst
@@ -13959,7 +13959,7 @@ M:	Stephen Rothwell <sfr@canb.auug.org.au>
 L:	linux-next@vger.kernel.org
 S:	Supported
 B:	mailto:linux-next@vger.kernel.org and the appropriate development tree
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
 
 LIS3LV02D ACCELEROMETER DRIVER
 M:	Eric Piel <eric.piel@tremplin-utc.net>
@@ -14063,7 +14063,7 @@ F:	security/loadpin/
 LOCKDOWN SECURITY MODULE
 L:	linux-security-module@vger.kernel.org
 S:	Odd Fixes
-T:	git https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/lsm.git
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/lsm.git
 F:	security/lockdown/
 
 LOCKING PRIMITIVES
@@ -16431,7 +16431,7 @@ F:	drivers/power/reset/at91-sama5d2_shdwc.c
 MICROCHIP SOC DRIVERS
 M:	Conor Dooley <conor@kernel.org>
 S:	Supported
-T:	git https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git
 F:	Documentation/devicetree/bindings/soc/microchip/
 F:	drivers/soc/microchip/
 
@@ -20072,7 +20072,7 @@ M:	Uwe Kleine-König <ukleinek@kernel.org>
 L:	linux-pwm@vger.kernel.org
 S:	Maintained
 Q:	https://patchwork.ozlabs.org/project/linux-pwm/list/
-T:	git https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git
 F:	Documentation/devicetree/bindings/gpio/gpio-mvebu.yaml
 F:	Documentation/devicetree/bindings/pwm/
 F:	Documentation/driver-api/pwm.rst
@@ -20705,7 +20705,7 @@ RANDOM NUMBER DRIVER
 M:	"Theodore Ts'o" <tytso@mit.edu>
 M:	Jason A. Donenfeld <Jason@zx2c4.com>
 S:	Maintained
-T:	git https://git.kernel.org/pub/scm/linux/kernel/git/crng/random.git
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/crng/random.git
 F:	Documentation/devicetree/bindings/rng/microsoft,vmgenid.yaml
 F:	drivers/char/random.c
 F:	include/linux/random.h
@@ -20964,7 +20964,7 @@ M:	Bjorn Andersson <andersson@kernel.org>
 M:	Mathieu Poirier <mathieu.poirier@linaro.org>
 L:	linux-remoteproc@vger.kernel.org
 S:	Maintained
-T:	git https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git rproc-next
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git rproc-next
 F:	Documentation/ABI/testing/sysfs-class-remoteproc
 F:	Documentation/devicetree/bindings/remoteproc/
 F:	Documentation/staging/remoteproc.rst
@@ -20977,7 +20977,7 @@ M:	Bjorn Andersson <andersson@kernel.org>
 M:	Mathieu Poirier <mathieu.poirier@linaro.org>
 L:	linux-remoteproc@vger.kernel.org
 S:	Maintained
-T:	git https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git rpmsg-next
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git rpmsg-next
 F:	Documentation/ABI/testing/sysfs-bus-rpmsg
 F:	Documentation/staging/rpmsg.rst
 F:	drivers/rpmsg/
@@ -21360,7 +21360,7 @@ M:	Conor Dooley <conor@kernel.org>
 L:	linux-riscv@lists.infradead.org
 S:	Maintained
 Q:	https://patchwork.kernel.org/project/linux-riscv/list/
-T:	git https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git
 F:	arch/riscv/boot/dts/canaan/
 F:	arch/riscv/boot/dts/microchip/
 F:	arch/riscv/boot/dts/sifive/
@@ -22188,7 +22188,7 @@ R:	Changwoo Min <changwoo@igalia.com>
 L:	sched-ext@lists.linux.dev
 S:	Maintained
 W:	https://github.com/sched-ext/scx
-T:	git://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext.git
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext.git
 F:	include/linux/sched/ext.h
 F:	kernel/sched/ext*
 F:	tools/sched_ext/
@@ -22421,7 +22421,7 @@ S:	Supported
 Q:	https://patchwork.kernel.org/project/linux-security-module/list
 B:	mailto:linux-security-module@vger.kernel.org
 P:	https://github.com/LinuxSecurityModule/kernel/blob/main/README.md
-T:	git https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/lsm.git
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/lsm.git
 F:	include/linux/lsm/
 F:	include/linux/lsm_audit.h
 F:	include/linux/lsm_hook_defs.h
@@ -22443,7 +22443,7 @@ W:	https://github.com/SELinuxProject
 Q:	https://patchwork.kernel.org/project/selinux/list
 B:	mailto:selinux@vger.kernel.org
 P:	https://github.com/SELinuxProject/selinux-kernel/blob/main/README.md
-T:	git https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/selinux.git
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/selinux.git
 F:	Documentation/ABI/removed/sysfs-selinux-checkreqprot
 F:	Documentation/ABI/removed/sysfs-selinux-disable
 F:	Documentation/admin-guide/LSM/SELinux.rst
@@ -23584,7 +23584,7 @@ F:	drivers/staging/
 STANDALONE CACHE CONTROLLER DRIVERS
 M:	Conor Dooley <conor@kernel.org>
 S:	Maintained
-T:	git https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git
 F:	Documentation/devicetree/bindings/cache/
 F:	drivers/cache
 
@@ -23708,7 +23708,7 @@ F:	include/dt-bindings/power/starfive,jh7110-pmu.h
 STARFIVE SOC DRIVERS
 M:	Conor Dooley <conor@kernel.org>
 S:	Maintained
-T:	git https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git
 F:	Documentation/devicetree/bindings/soc/starfive/
 
 STARFIVE STARLINK PMU DRIVER
-- 
2.50.0

