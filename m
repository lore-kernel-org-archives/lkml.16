Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E98B80B;
	Thu, 22 May 2025 14:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747925068; cv=none; b=bwx5Ch9JHZgHStM4ZVt2qnJA8O79wDDk8Q+vU5L9ZT9/KBzVWFCHgAx0DQrWwL8FgrJN1bz5I5MGiP4K1ezXwrr4loEDtOyPHO3NMxISQX0eezhY0arIWUoxdoVpkGjPRXh7Fx5PVmyEjyoowNRNTiTEHIBPq+/heKJc6Ac8dzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747925068; c=relaxed/simple;
	bh=NRmEVrSXUud61bv4B9E47LlieBBKw07Sw2puRK7v1VY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=g+97e3thmggcglK0p4vn47hNGqNHhahc46t1HyRfXMZha7XMkQczcvxJH6fWArtXlhXVNL5JB6iYEvgUoXAilw+5VYXcOHiFwsnjdwJyMxhtmt9jeTaPLoR5cBogXisQ7FSQvelP7GnIoieqlkfmXexonw+CDyKXJsxISv51F6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HBhXkQYm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HBhXkQYm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70D8BC4CEE4;
	Thu, 22 May 2025 14:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747925067;
	bh=NRmEVrSXUud61bv4B9E47LlieBBKw07Sw2puRK7v1VY=;
	h=From:To:Cc:Subject:Date:From;
	b=HBhXkQYmZUS/P1fkwRw0KSKBrdtQzUX5tFmZvUb5CPqkxtJ0BeYOdUgW2L2JmRpFL
	 gLkyZNApgB5ygMkm9MaETPr2r12rYW0fRxokQnuDnjef+T4vNNmKo029wnucF4nqau
	 rvh6xOlt9PY+KsyVeLUr2X0q8GKLcknTIkrmBnXaO5f82ieSrneK9wJ6okaVizMkMW
	 P9t+a2SAN62g3AqCjmAB09wknjoNaE91dihb6amh+GqTAPGd346dYY+X8+ElCRZudg
	 XQxBlJM5y0UL0fdq+QYZ9BxRJ3h2N818r/PjNQTMofrFHAaL4YtzhL07RQE5wjMWQV
	 Y+0EB3eTLrSng==
From: Arnd Bergmann <arnd@kernel.org>
To: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Suma Hegde <suma.hegde@amd.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Carlos Bilbao <carlos.bilbao@kernel.org>,
	Yazen Ghannam <yazen.ghannam@amd.com>,
	"Borislav Petkov (AMD)" <bp@alien8.de>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86/amd/hsmp: fix building with CONFIG_HWMON=m
Date: Thu, 22 May 2025 16:38:49 +0200
Message-Id: <20250522144422.2824083-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

When CONFIG_HWMON is built as a loadable module, the HSMP drivers
cannot be built-in:

ERROR: modpost: "hsmp_create_sensor" [drivers/platform/x86/amd/hsmp/amd_hsmp.ko] undefined!
ERROR: modpost: "hsmp_create_sensor" [drivers/platform/x86/amd/hsmp/hsmp_acpi.ko] undefined!

Enforce that through the usual Kconfig dependnecy trick.

Fixes: 92c025db52bb ("platform/x86/amd/hsmp: Report power via hwmon sensors")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/platform/x86/amd/hsmp/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/x86/amd/hsmp/Kconfig b/drivers/platform/x86/amd/hsmp/Kconfig
index d6f7a62d55b5..2911120792e8 100644
--- a/drivers/platform/x86/amd/hsmp/Kconfig
+++ b/drivers/platform/x86/amd/hsmp/Kconfig
@@ -12,6 +12,7 @@ menu "AMD HSMP Driver"
 config AMD_HSMP_ACPI
 	tristate "AMD HSMP ACPI device driver"
 	depends on ACPI
+	depends on HWMON || !HWMON
 	select AMD_HSMP
 	help
 	  Host System Management Port (HSMP) interface is a mailbox interface
@@ -29,6 +30,7 @@ config AMD_HSMP_ACPI
 
 config AMD_HSMP_PLAT
 	tristate "AMD HSMP platform device driver"
+	depends on HWMON || !HWMON
 	select AMD_HSMP
 	help
 	  Host System Management Port (HSMP) interface is a mailbox interface
-- 
2.39.5

