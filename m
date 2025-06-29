Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4A81A2544
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 05:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751174779; cv=none; b=W81yhizT2FIkbn/mokGN2SesyOl95OiCCSb8AulS6XSOj5u7ZTer0J+rbuEtbRWzPsDbYrRO/NcmLpgNGO5IhhEQOzpA8CP5On/8Axkjgk6huk8AY+jVtf+KWj5ReHi8z2tWHjslW+Q/Nll6hgVNUxnNAahkXamE/ILVYYySJh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751174779; c=relaxed/simple;
	bh=axgjOipNhsQwsfFExnvVSYdlVFYrEP8GxSu6z0dPl4s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=M9j7b0bASLi1ElafTazZxQHb/bLXKfd4TrK320p2Eu1o1XHbiUj0OGxtiiK2Eum9F4l7z2DnSH3KQc0sCgvSAlstjbH+WGJJYJ6wmooXpq29+E2efdIc8TZuMIyTGycrKE/WJzkAp0y4SlL+yilv5PuRgThBt1biXwKFLSWWCu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=XPJEVI72; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="XPJEVI72"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1751174775;
	bh=axgjOipNhsQwsfFExnvVSYdlVFYrEP8GxSu6z0dPl4s=;
	h=From:Subject:Date:To:Cc:From;
	b=XPJEVI723bVY+ruMXIUY9I2xUfpKKcn4Yp+0cgNKCHRA5aXFQy6mnVi8aF4BSctzA
	 fWiQNuEX5HXDiX7b8+GhgEEC9uIL1/LnHXwXBAyczpzYNBRaGZm3Xe88WX1jdJ1RRn
	 e96OMv3Gbi1Yy74RLjzWCebBxVyiJOexPRltByYc=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH v2 0/7] sysfs: prepare the constification of struct
 attribute
Date: Sun, 29 Jun 2025 07:26:01 +0200
Message-Id: <20250629-sysfs-const-attr-prep-v2-0-9ec5fe39083f@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAGnOYGgC/3WNQQ6CMBBFr0Jm7Zi2KSquuIdhgWWwsymkU6uEc
 HcriUuX7yX//RWEIpPAtVohUmbhKRQwhwqc78ODkIfCYJSpldYWZZFR0E1BEvYpRZwjzUiN1ba
 5mMHZEcq2yJHfe/fWFfYsaYrLfpP11/6Kpz/FrFGhrulshntvjarbF7GIOP/0x0AJum3bPuLGv
 FS/AAAA
X-Change-ID: 20250114-sysfs-const-attr-prep-e9414982dc4f
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751174775; l=1787;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=axgjOipNhsQwsfFExnvVSYdlVFYrEP8GxSu6z0dPl4s=;
 b=hPQ+JR+cfLaPh92ynVBx7leBCMKiTs2rWFcSSfmc695ym5hw6aiEdceNZCQgLrDok0L6Jti8s
 2zGxFRxXQ2TD8SD8UvyEGEyFwKZhh10pHCXlUFevesBJdTJ4eAGQ/KT
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

The migration of 'struct attribute' and its related structures and
macros are more complicated than those for 'struct bin_attribute'.
Mostly because they are all shared by various custom attribute types.
Introduce some initial utilities to support the migration.
These are enough to migrate some specialized attributes atomically or
those which don't use 'struct attribute' in their callbacks stepwise.

The big outstanding problems are 'struct device_attribute' and
'struct kobj_attribute'. These are used everywhere and I'm not yet sure
about a migration plan.

Based on driver-core-next.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Changes in v2:
- Rebase onto driver-core-next
- Simplify attribute macro definitions
- +Cc Danilo
- Link to v1: https://lore.kernel.org/r/20250116-sysfs-const-attr-prep-v1-0-15e72dba4205@weissschuh.net

---
Thomas Weißschuh (7):
      sysfs: attribute_group: allow registration of const attribute
      sysfs: transparently handle const pointers in ATTRIBUTE_GROUPS()
      sysfs: introduce __SYSFS_FUNCTION_ALTERNATIVE()
      sysfs: attribute_group: enable const variants of is_visible()
      samples/kobject: add is_visible() callback to attribute group
      samples/kobject: constify 'struct foo_attribute'
      sysfs: simplify attribute definition macros

 fs/sysfs/group.c               | 10 +++++++--
 include/linux/sysfs.h          | 48 +++++++++++++++++++++++++-----------------
 samples/kobject/kset-example.c | 44 ++++++++++++++++++++++++++------------
 3 files changed, 67 insertions(+), 35 deletions(-)
---
base-commit: c79cbde9b7bc7a650af96269588518950e3c2441
change-id: 20250114-sysfs-const-attr-prep-e9414982dc4f

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>

