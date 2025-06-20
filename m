Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4981624DE;
	Fri, 20 Jun 2025 11:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750420494; cv=none; b=Hc1cF4EEhaYx3No0lvYndQC6j/zOvVQsGF4grmudxEx+zMnpwuGJk7a17srI/He1XpLBKf7wXzsr8kMuTNYaFRqbneeJrLFb0U1M39agctF8F+U2gP3hyNGCWeADBVJV2x8wFFC7PEmdZUEAbZnQik4jp4bPy1McTt9VWVZTRhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750420494; c=relaxed/simple;
	bh=MytoXtQaPni0it6yYWfCVADYD7ugpdiw/k3h63C1vWY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=heKeJV/WKca7df+28+/WXx804QmqMlNGTJQT9pUGBzuIt+GlF5+ph8knyRp5HN61GQ/ba8YiHIKbPEwqntNRD/6t8bc5Dp9VioWRThdVrvRPAlOaicJjIeDy1OAT/qzKGqvTYBSF7EjE1tkcdVE53YPM1PQRsH/H/cUhEuwGXa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e1EISdf3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e1EISdf3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 392EFC4CEE3;
	Fri, 20 Jun 2025 11:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750420493;
	bh=MytoXtQaPni0it6yYWfCVADYD7ugpdiw/k3h63C1vWY=;
	h=From:To:Cc:Subject:Date:From;
	b=e1EISdf30ogXbndk62n4Izr2YWrZM3Rm3uocJV3gtsMDXBTpGAw88BF6Sw/6AF5/o
	 Ncpb6lK4hn1het2/akrqXlchdX06wuHnfM4q4qv46l5TCZpUhrtwozy5O/OPCsJpe3
	 eNmEJ9bx1ThXmRTUdHqtO4WOV37m/W0ZqN/Qo0fSnd6z+795rhjmdieGPF/ls79+l9
	 fkzaUIA3/045nSrf9GWwBXo72GZ3SjXP+AtAI+PfpEyMDT5fY/lTD6Lw+O6F112eee
	 c3fkHcB14bDmXJwpPioEeBI8Vio0+k8WZkn383fySyf4ZdYh4KHIWlHoVBYSrV0VyB
	 spRWi52RDY6Sw==
From: Arnd Bergmann <arnd@kernel.org>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Pratap Nirujogi <pratap.nirujogi@amd.com>,
	Benjamin Chan <benjamin.chan@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	kernel test robot <lkp@intel.com>,
	Armin Wolf <W_Armin@gmx.de>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	Suma Hegde <suma.hegde@amd.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86/amd_isp4: prevent built-in configuration
Date: Fri, 20 Jun 2025 13:54:45 +0200
Message-Id: <20250620115448.202425-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Checking the module owner of the device only works when modules are
enabled, and the device is created from a module:

drivers/platform/x86/amd/amd_isp4.c:154:28: error: incomplete definition of type 'struct module'

Building the driver as a loadable module avoids the build failure,
though this should probably be fixed in a different way that still
works if the device was created from built-in code.

Fixes: 90b85567e457 ("platform/x86: Add AMD ISP platform config for OV05C10")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202506150313.UHoIoVhR-lkp@intel.com/
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/platform/x86/amd/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/amd/Kconfig b/drivers/platform/x86/amd/Kconfig
index 63e4bd985699..9e150500e37e 100644
--- a/drivers/platform/x86/amd/Kconfig
+++ b/drivers/platform/x86/amd/Kconfig
@@ -36,6 +36,7 @@ config AMD_WBRF
 config AMD_ISP_PLATFORM
 	tristate "AMD ISP4 platform driver"
 	depends on I2C && X86_64 && ACPI
+	depends on m
 	help
 	  Platform driver for AMD platforms containing image signal processor
 	  gen 4. Provides camera sensor module board information to allow
-- 
2.39.5

