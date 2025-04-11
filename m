Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5832367A9
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 12:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744376138; cv=none; b=t+BuGoKek/hMWuywL5ugRZmMjGmMWMCxQhgBPhfCWiIRvXGBDR83mxg5nJWfkYORp8AxvVIlmpXyHGUOoE6VXQXH0p+JZwVc6RbL0oETW/tDLapGUXNoBaFRV3mDunVi0BH6lGSviS30cuZ292Cy3L62h+VZdWhXYJAYHhOMUdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744376138; c=relaxed/simple;
	bh=1JVVosuEJjtVUPPGOQoV/EL2ui4efcKyx8phzWVmkg0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=diWQH44kApqcyyg2PT2vPcSIyA/x9ZVIxSxlubPuuN6DFsfYigoWvXLl8+Yu1AMzzd6H/40JJI1F1HFNObp1v2LQdHJEQGM1+OTkDVakNy6LW/YsWL31XegdjiNZnwqL35CuLtHvpNimU+jpeQ0eiRhV5BoLs65eZv2fuqjWKaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t+BmnKnX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t+BmnKnX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D692C4CEE2;
	Fri, 11 Apr 2025 12:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744376137;
	bh=1JVVosuEJjtVUPPGOQoV/EL2ui4efcKyx8phzWVmkg0=;
	h=From:To:Cc:Subject:Date:From;
	b=t+BmnKnXy19PvUkWOcAzg7fOKFmhUnDU3SGCoUDWktvSqKtvbdhc85WCv2NbB5Kas
	 ekrTOe/NVtTDWP+OSothG7PvNErTvbyd3xa1H8+uMZ7NbwiJ6BrLs1eV9l/+6KnQHw
	 SJzItaX7lT0Hmzf9WqEBVCe7+5QSsRx6ZbTPTVZSDRHIskIuNrn/HeUYUr+tFGoPa/
	 w3nSpmDEXpZA9Unqzu8zLKJ2mL39xsuF4p20tWW2JM82fdQXFLXpuwyPUwuVy8U4+H
	 BFIhACQ1Rs+vq3PvT0oBE0zMPahH1LuxmHXCx5UJ68gvprFhbqMbKz+pDF0ZE6uwVa
	 P003fDMkZRMfw==
From: Arnd Bergmann <arnd@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Christian Brauner <brauner@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Jocelyn Falempe <jfalempe@redhat.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Jani Nikula <jani.nikula@intel.com>,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm: ttm: select CONFIG_SHMEM
Date: Fri, 11 Apr 2025 14:55:25 +0200
Message-Id: <20250411125532.1444682-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

ttm now directly calls into shmem code, which fails to build when
that is disabled at compile time.

ld.lld-21: error: undefined symbol: shmem_writeout
>>> referenced by ttm_backup.c
>>>               drivers/gpu/drm/ttm/ttm_backup.o:(ttm_backup_backup_page) in archive vmlinux.a

Select SHMEM here.

Fixes: fe75adffac33 ("ttm: Call shmem_writeout() from ttm_backup_backup_page()")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index b3bbb3f20b2a..831bd384f1fd 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -187,6 +187,7 @@ source "drivers/gpu/drm/display/Kconfig"
 config DRM_TTM
 	tristate
 	depends on DRM && MMU
+	select SHMEM
 	help
 	  GPU memory management subsystem for devices with multiple
 	  GPU memory types. Will be enabled automatically if a device driver
-- 
2.39.5

