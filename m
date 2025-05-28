Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65267288C3B
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 14:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748441138; cv=none; b=AEyW1abXBAuo6xX37kf0ysTmU9r5wYljGGPqR7cPzbDlm37ZVd//hN5wdAUkc5vKHlpHvKjMrSNBHry88TCJL/K+TEzhE7/ahQBcMtpqourxWdF6KHbQOVtSe8WqgIW57YspEY6LP2xekjGUjhLP3VqeysYo+S/o55QBWdkydLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748441138; c=relaxed/simple;
	bh=MMMc1QOoouxBif3/5VRy4IB5iB739EPi4BNzKnIooWs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eZbjYU1d5aUslbUldnivw5Ivxg0xe0bUgVhy1Z5vmxb0qJ+RfRxTuu8vHIZPW0WyWSaHmrG01c+3LoNxd/s1LYP29AKWZiLI92FJOrP0pbGBqMn3g6k49KXoZvXNMRVWWb9ez8C3LKBVRn+tRQO4TRDrR4WBGRTSCXya1xe3E58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JA8PK0FI; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JA8PK0FI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748441138; x=1779977138;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MMMc1QOoouxBif3/5VRy4IB5iB739EPi4BNzKnIooWs=;
  b=JA8PK0FI/Nh8+WCxBqr8ABvyK91hiW3WcX0291dk3L65booDeBETGoyb
   QKzY/oV+izI3xE2FCr9ejvJK+s65RaTkhOEbIHarvUS7Bs8CRHAkhHiuD
   xZWcrtR4oXM6s0ba5OpKtqTED1fnOYr1Z5Bz9WrOMzXb5EtLiVeNHUCqo
   oO8t3k5Et2wQ/DU5JINY9FGRxvNW56KgKDVf0otuwXDD5Bpxvgps9FB9U
   1b5Es1Ou723pYW4g2gmpUCwA1eaQYGN10CfH7h0ZyfsFkCB4h+nhKu/Jb
   YXYQdoXX7FChgmQbWEav4B3k+DkQcG/zkubff3eoPwp3llHUJk/k0/vxF
   A==;
X-CSE-ConnectionGUID: JuWbkWqYRe6a8gN94PTV5w==
X-CSE-MsgGUID: ig/UulcrQsKf7OuuDcurjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="61525082"
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; 
   d="scan'208";a="61525082"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 07:05:37 -0700
X-CSE-ConnectionGUID: 8Hpll7dLRSWzEu7/btNDWw==
X-CSE-MsgGUID: GwSQwc13RTCEFQVNzrx0EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; 
   d="scan'208";a="143239011"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 07:05:32 -0700
From: Alexander Usyskin <alexander.usyskin@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Karthik Poosa <karthik.poosa@intel.com>,
	Raag Jadav <raag.jadav@intel.com>
Cc: Reuven Abliyev <reuven.abliyev@intel.com>,
	Oren Weil <oren.jer.weil@intel.com>,
	linux-mtd@lists.infradead.org,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Alexander Usyskin <alexander.usyskin@intel.com>
Subject: [PATCH v11 05/10] mtd: intel-dg: align 64bit read and write
Date: Wed, 28 May 2025 16:51:10 +0300
Message-ID: <20250528135115.2512429-6-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250528135115.2512429-1-alexander.usyskin@intel.com>
References: <20250528135115.2512429-1-alexander.usyskin@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GSC NVM controller HW errors on quad access overlapping 1K border.
Align 64bit read and write to avoid readq/writeq over 1K border.

Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
 drivers/mtd/devices/mtd_intel_dg.c | 35 ++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/mtd/devices/mtd_intel_dg.c b/drivers/mtd/devices/mtd_intel_dg.c
index 6d971fb77938..97e1dc1ada5d 100644
--- a/drivers/mtd/devices/mtd_intel_dg.c
+++ b/drivers/mtd/devices/mtd_intel_dg.c
@@ -246,6 +246,24 @@ static ssize_t idg_write(struct intel_dg_nvm *nvm, u8 region,
 		len_s -= to_shift;
 	}
 
+	if (!IS_ALIGNED(to, sizeof(u64)) &&
+	    ((to ^ (to + len_s)) & GENMASK(31, 10))) {
+		/*
+		 * Workaround reads/writes across 1k-aligned addresses
+		 * (start u32 before 1k, end u32 after)
+		 * as this fails on hardware.
+		 */
+		u32 data;
+
+		memcpy(&data, &buf[0], sizeof(u32));
+		idg_nvm_write32(nvm, to, data);
+		if (idg_nvm_error(nvm))
+			return -EIO;
+		buf += sizeof(u32);
+		to += sizeof(u32);
+		len_s -= sizeof(u32);
+	}
+
 	len8 = ALIGN_DOWN(len_s, sizeof(u64));
 	for (i = 0; i < len8; i += sizeof(u64)) {
 		u64 data;
@@ -303,6 +321,23 @@ static ssize_t idg_read(struct intel_dg_nvm *nvm, u8 region,
 		from += from_shift;
 	}
 
+	if (!IS_ALIGNED(from, sizeof(u64)) &&
+	    ((from ^ (from + len_s)) & GENMASK(31, 10))) {
+		/*
+		 * Workaround reads/writes across 1k-aligned addresses
+		 * (start u32 before 1k, end u32 after)
+		 * as this fails on hardware.
+		 */
+		u32 data = idg_nvm_read32(nvm, from);
+
+		if (idg_nvm_error(nvm))
+			return -EIO;
+		memcpy(&buf[0], &data, sizeof(data));
+		len_s -= sizeof(u32);
+		buf += sizeof(u32);
+		from += sizeof(u32);
+	}
+
 	len8 = ALIGN_DOWN(len_s, sizeof(u64));
 	for (i = 0; i < len8; i += sizeof(u64)) {
 		u64 data = idg_nvm_read64(nvm, from + i);
-- 
2.43.0

