Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F44A1DE4FB
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 04:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748577813; cv=none; b=DwXsq90uHdDxqXnYKBwpv2N+HUItM6sYv/EXTi7yKnm7lSIYcp83BryJagXen8OImcLKxAMDH/w/F9/dNghfyMeY01D+j96nQAaomxYu9i2lqiawzBQFmGL4z9nWvrYp31RNjZXD6970n2jZ9l7Px2yOjQpyJ1gZ1G3+GJDbDaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748577813; c=relaxed/simple;
	bh=CD0obRXJmMo/kbz+YuICHAhtmHJJZY0oVXFlpKVP8Mk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mvJmso6ZZo8vp5JbCDmyuYAhm7yo9B7aZ81YjJj+ugSpuVT6kGmNWO2mIz0XRImlwzJrqazAO4AuX4Ga0suxxTeU6QbpXY7agmkGmA8r0DaNBUsTY7ffq8d/z2GNCu9FfWTASjg9VPkW4qRIxexKxElPgk0/uysiQQu9RJA5YjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=KsSOHvCz; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="KsSOHvCz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1748577803;
	bh=CD0obRXJmMo/kbz+YuICHAhtmHJJZY0oVXFlpKVP8Mk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KsSOHvCzRobiX0n6rDkyru5ujpYXFEKrCq5x1wSNS5+CQAU4qUBEra3NXdG69ptoD
	 2Qm+OP/iHc7K6wc7kjyl1ODjByYje3uDSC1jbCqFJNUExEjUffTtmDEPvTDwO6INdl
	 xizgi+5pA8lhtnCcxheE6JfhfsAQn6SFpfq4q7uE=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Fri, 30 May 2025 05:54:35 +0200
Subject: [PATCH v3 1/6] const_structs.checkpatch: add bin_attribute
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250530-sysfs-const-bin_attr-final-v3-1-724bfcf05b99@weissschuh.net>
References: <20250530-sysfs-const-bin_attr-final-v3-0-724bfcf05b99@weissschuh.net>
In-Reply-To: <20250530-sysfs-const-bin_attr-final-v3-0-724bfcf05b99@weissschuh.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748577802; l=693;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=CD0obRXJmMo/kbz+YuICHAhtmHJJZY0oVXFlpKVP8Mk=;
 b=alnqOyt/k01FWMuh4m7FSLenjWDB+J4/iEAp0Z4jVDzX8+XJgIRn5rNjSs9XhHpT2cSj3AwSB
 xPmavmeQe8aAD47dqFw2utCWYR/IycQxDCQTnu1Zpur0nZVhPLGQAnL
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Now that the sysfs core can handle "const struct bin_attribute", make
sure that new usages of the struct already enter the tree as const.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 scripts/const_structs.checkpatch | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/const_structs.checkpatch b/scripts/const_structs.checkpatch
index e8609a03c3d8b5be4ec05eeda83c47ffc3feb646..6eb94fddc338a211a2aac9cb6e4cd9d15c4b4a6c 100644
--- a/scripts/const_structs.checkpatch
+++ b/scripts/const_structs.checkpatch
@@ -1,6 +1,7 @@
 acpi_dock_ops
 address_space_operations
 backlight_ops
+bin_attribute
 block_device_operations
 bus_type
 clk_ops

-- 
2.49.0

