Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E5227814A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 11:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750418505; cv=none; b=fFOXA6SzfdfYVbp/PcJsGYQRPf/3KwVs7X1JDEuP1yvCzCV4lQEHwFPrr/l1/xgxeVW/GhmB2c030Mx0s5sX5d1KPPRpfXDUxoVWuO/kQKrrOmO/qHT7anKzizNcLOGVnYOl8Ls59ofAdl914KJhpWKgyJV2BhKb7AA6FJXDw/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750418505; c=relaxed/simple;
	bh=+jnqxSwdMrH8eoIPwDQa6aa9kFxUgPsAHBTnMtsCrAA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=O8K4IpX6ZYEnjQm3sWk2gU4aMjvRXm8A09w7Iqx5G9ovJpjg8M65N+r1lKYRItXJj1FPgw6kGNnXudO6zqckHg0UN+AdQCzAg7jEhJhlsvM3rHvemU/opLN2O5NwHPa3r0PD0zDAhIs0/uUb4bKH0Z8UJdaKUHmlNH44FWV1gXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mcR2MIVT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mcR2MIVT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21814C4CEED;
	Fri, 20 Jun 2025 11:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750418504;
	bh=+jnqxSwdMrH8eoIPwDQa6aa9kFxUgPsAHBTnMtsCrAA=;
	h=From:To:Cc:Subject:Date:From;
	b=mcR2MIVTqOTB4LrJhDNZX76WQ5iiZL9H/6XqJATSjsNIbcYW91e/EFnwdWf4TKez6
	 N46r7kVtBGYYyLX4+WRw45ifOhhiiA5SrlmOLZpv1MS41cTv9EmM3KAhvxVa+pFdNt
	 22zpNqvwRs9Z/LDOknZAXnkgZlegE/Z+BTJG9K31l/x0NqlM+fdYgLV70kkLbz5rTe
	 maiOvej4oMZtBDkbmZSKv4trtrSoRcy6ZNlpv7t3CiiRdf6yGU1wrN7LrczPOpFcuN
	 voP7bOS4Hyei66YVjjLDzTFf3H5YvdCVve0rA6LN1NLbweXoajwsoHPFXSUgK3O1RY
	 G2rbk5QNsBMjg==
From: Arnd Bergmann <arnd@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Coiby Xu <coxu@redhat.com>,
	Baoquan He <bhe@redhat.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Eric Biggers <ebiggers@google.com>,
	Alexander Graf <graf@amazon.com>,
	Dave Vasilevsky <dave@vasilevsky.ca>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] crashdump: add CONFIG_KEYS dependency
Date: Fri, 20 Jun 2025 13:21:22 +0200
Message-Id: <20250620112140.3396316-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The dm_crypt code fails to build without CONFIG_KEYS:

kernel/crash_dump_dm_crypt.c: In function 'restore_dm_crypt_keys_to_thread_keyring':
kernel/crash_dump_dm_crypt.c:105:9: error: unknown type name 'key_ref_t'; did you mean 'key_ref_put'?

There is a mix of 'select KEYS' and 'depends on KEYS' in Kconfig,
so there is no single obvious solution here, but generally using 'depends on'
makes more sense and is less likely to cause dependency loops.

Fixes: 62f17d9df692 ("crash_dump: retrieve dm crypt keys in kdump kernel")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 kernel/Kconfig.kexec | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/Kconfig.kexec b/kernel/Kconfig.kexec
index e64ce21f9a80..2ee603a98813 100644
--- a/kernel/Kconfig.kexec
+++ b/kernel/Kconfig.kexec
@@ -134,6 +134,7 @@ config CRASH_DM_CRYPT
 	depends on KEXEC_FILE
 	depends on CRASH_DUMP
 	depends on DM_CRYPT
+	depends on KEYS
 	help
 	  With this option enabled, user space can intereact with
 	  /sys/kernel/config/crash_dm_crypt_keys to make the dm crypt keys
-- 
2.39.5

