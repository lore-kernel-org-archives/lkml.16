Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC3822B5A3
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 12:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748002272; cv=none; b=F6sw0xzr4F+RUa+eMpvsltxV05VySbyG2+UpzUzpNrI/x/y1Y2zMQcDPyKBvrFLFaKTlKhDqFUwLvurgwJsLr7wydOAX0FwDfj9/vvrfuOOmlo+0W/A7bJoapBK18LHLOZE4EngUb5SfTrBJrf4QUzNVznSm22Y41uLxCc4fkEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748002272; c=relaxed/simple;
	bh=aDKI+p/ZlbRQU1u90jpP1eyQ8h3STH7Fz6X3AROiakY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fJ0gEZFYRipIXden+qWABS/RYBSjqBPQ41+0PCpa3XpVVBn+MKbEb1qNj93MTUodCsbvqdwTS7yAJl1GK/hGgIqtMga5oS5QpdnP2P71VLdHsG6xpgmbmIqed0fqkkUoiGI5e5hHoE9mIcMw9CUnieUnAyKwRbVu+Zxz3ZKs6ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WgimYB9D; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WgimYB9D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BB5AC4CEEA;
	Fri, 23 May 2025 12:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748002272;
	bh=aDKI+p/ZlbRQU1u90jpP1eyQ8h3STH7Fz6X3AROiakY=;
	h=From:To:Cc:Subject:Date:From;
	b=WgimYB9DtUbjjTKdh32U5igkcazwQD/n3hQWTwBwzlnGVW5deS+5QUPjMiAXR5kSW
	 UE3HEkAdL5D7foWfnLqSUU9qFuBpWxHnI9sWzqvvwqijRzdjkTfQw8KO5UpBtCjxtM
	 D/IyZiTtn/mQAp+bfCu55V2mZeedlGB7JBOP2mgSQaCgLyaOxy1xXrhO657fvhn5dA
	 Ebt0zRhZsIVfCXInxqjVpzw9IuxBPTvKgA+UX2Yv1mQegBVW7IoBa6PJnuaNlfZAlW
	 Wv6dY4sHsQRe86MOpJ7cmEsrZuEmgpZaT56ZuDLeHpQ5UvEm/O73hLho5wO/m9Q6f1
	 M3ea+MQRwkHpQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Matthew Brost <matthew.brost@intel.com>,
	Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
	Imre Deak <imre.deak@intel.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Michael J. Ruhl" <michael.j.ruhl@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/xe/vsec: fix CONFIG_INTEL_VSEC dependency
Date: Fri, 23 May 2025 14:10:46 +0200
Message-Id: <20250523121106.2231003-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The XE driver can be built with or without VSEC support, but fails to link as
built-in if vsec is in a loadable module:

x86_64-linux-ld: vmlinux.o: in function `xe_vsec_init':
(.text+0x1e83e16): undefined reference to `intel_vsec_register'

The normal fix for this is to add a 'depends on INTEL_VSEC || !INTEL_VSEC',
forcing XE to be a loadable module as well, but that causes a circular
dependency:

        symbol DRM_XE depends on INTEL_VSEC
        symbol INTEL_VSEC depends on X86_PLATFORM_DEVICES
        symbol X86_PLATFORM_DEVICES is selected by DRM_XE

The problem here is selecting a symbol from another subsystem, so change
that as well and rephrase the 'select' into the corresponding dependency.
Since X86_PLATFORM_DEVICES is 'default y', there is no change to
defconfig builds here.

Fixes: 0c45e76fcc62 ("drm/xe/vsec: Support BMG devices")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/xe/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index beddd153c28c..c870b680431c 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -2,6 +2,8 @@
 config DRM_XE
 	tristate "Intel Xe Graphics"
 	depends on DRM && PCI && (m || (y && KUNIT=y))
+	depends on INTEL_VSEC || !INTEL_VSEC
+	depends on INTEL_PLATFORM_DEVICES || !(X86 && ACPI)
 	select INTERVAL_TREE
 	# we need shmfs for the swappable backing store, and in particular
 	# the shmem_readpage() which depends upon tmpfs
@@ -29,7 +31,6 @@ config DRM_XE
 	select INPUT if ACPI
 	select ACPI_VIDEO if X86 && ACPI
 	select ACPI_BUTTON if ACPI
-	select X86_PLATFORM_DEVICES if X86 && ACPI
 	select ACPI_WMI if X86 && ACPI
 	select SYNC_FILE
 	select IOSF_MBI
-- 
2.39.5

