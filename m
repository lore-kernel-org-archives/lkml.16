Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A8318C932
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 16:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738945248; cv=none; b=H1y2nHWGAPgwU1M1w/hAaFKDmOUbUHdh9F3v31qN94pDjx4H4MKnfDsXM5k3Gi4n+X7aaDmcG1IkIXk+AHe9Tl5DvHWdNbzzNL93v+TAdt0YaJqg2bzjBcImjv48gj4+QbvAhFsGfOsqlBRk2jCZE1jSGMH4dTlVxqxOnV7Gx9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738945248; c=relaxed/simple;
	bh=yWRp054inoCg1j5o1hnrkV6ngQjA7+hHYhm0VHnZIzQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dSPC0YupnwTSzsM3Tu4QOyZdhSQD8y776Oc8hWtsatYy3jfm3vWHEYbvgn6LwRwUokK/nI1dj16w6zY3oCC2MYIipPcruSz8ahCYg3oU44gkjJKaZJ+k64umLVz1X9G7xHUPj7QyxmNv9UUZn9abyMm5RWA/tmbnVjOif+IMhj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=lPfFGX2k; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="lPfFGX2k"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4361e89b6daso15301835e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 08:20:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738945245; x=1739550045; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZaGa43r2JveY8ihF44rUo4WO7W9CMxjRpmYKl91QS2U=;
        b=lPfFGX2knhBGtGjHzVndRoSRYaSuT8FFqV6VwDtx5e33hwXjgubZWDibG4cbhHuXfC
         T8ZBRv9Kh98QPDgmOAc/mpk4JBa3OXA2cVnAiSYSGkumtGnX9b8QnV2g3MdDcHTLuvGt
         KK4bS+WIF3PMZx5DWH24Gwhr3maI3+BAATcKd20N7AepzbqL7eGEcb0NVlVpSzkV+0kE
         DCUK/kFGSkZHfFqD+dijg1iSity9pF92EowI04nxy+o958wiNzrFxhbMOe/msP0pMYLI
         iWMAtlL3erV8rlrSFAsg7DHnYuYJLojesAGr1ueyLEl6esM9gqegzd9tQNT5kUVbO2he
         aRjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738945245; x=1739550045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZaGa43r2JveY8ihF44rUo4WO7W9CMxjRpmYKl91QS2U=;
        b=j+m+CsRH8MeXKLxxcHXloTt23Fk7IRgMHfKfGeUwqBa9G5TjpJD589HibwICSdmWl6
         DcUe6Ne++Gv2PdR/ABCRY4WbqoMeR4VutmGOJrVYGt2mQJWqSAggcuPToVE9b6ncws93
         u0Fmy/R5z431YKbOEBXoXyqYmkdm4LOw/BGnDbiPpcEOyY/E5tFNHuTWofhZXBVXTNnz
         M6szd3wwrGO+vgF+6YyxwjgizszwJ0UBzOHGCDwz5Au7Os0P7QhOUxNr2ROlMxKdvus6
         M8yolhk/rA6/ZN7GlzvCwvK3ilnkmfUSW3h7vttLzTSCad+E6gT+wx5fuT2E2A/z/J6x
         0eiw==
X-Forwarded-Encrypted: i=1; AJvYcCXjeS5sorQfQM80k55WTKQLnLc79OcUUOJJfdygI6tBXXhYDRrfBnmxman5TzCsmEFWTajtiGq5CJbTozw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSrLBZAq4SZo79KkHcPeSyM5yEVgSh8qLQg+KCakFau3iANqqG
	EgJPBTxwXtkGNm5i4UlkmIybxYbYtmYjdJ5C60GqcTkz8IzVjoTjM4wrnDBJc3s=
X-Gm-Gg: ASbGnctYBmLtByKvpEnu+bAbT99jnAHF2L9hbv+6LV5eFYguq4dwc8z0jYZvesp0Bg4
	otJZ+nWaTUsCgmvyP0bfwtcNusfQJfdbqUWYxEQAD7PtgBuv6YDQpSpLayBXdxCDsl2cPa2T7D1
	06AjJJKJ1prCFz7QaT0pcQWYNXiqejTUMBIvGzH3IdwtSf83yADfxyNVi0Gc9vdWoEJI0FCOVA3
	ZRlsJrjzV7pyRH+LZYdEStHKGv9YZephqh9ROgY8OIW+SGkfEhqlP2BXe2q8tndS5MWrc1LF/Lj
	jKMlmDHUYBsQbVEGfPPgOgRQLGbTxxdOiz+/L6lE453nNkODhjfTYZ58vQ==
X-Google-Smtp-Source: AGHT+IEsxHTbv/ApYqI1Db4PbE3wHNdmjENh4/dQ6JTZy1CmXAHF/WRV8cibN7pL6QAb7qvzWGRwaQ==
X-Received: by 2002:a05:600c:6a88:b0:434:fbda:1f44 with SMTP id 5b1f17b1804b1-439249a4033mr32953915e9.19.1738945244744;
        Fri, 07 Feb 2025 08:20:44 -0800 (PST)
Received: from localhost (089144193052.atnat0002.highway.a1.net. [89.144.193.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbde0ff44sm4891569f8f.76.2025.02.07.08.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 08:20:44 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	charlie@rivosinc.com,
	jesse@rivosinc.com,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 8/9] riscv: Implement check_unaligned_access_table
Date: Fri,  7 Feb 2025 17:19:48 +0100
Message-ID: <20250207161939.46139-19-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250207161939.46139-11-ajones@ventanamicro.com>
References: <20250207161939.46139-11-ajones@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define the table entry type and implement the table lookup to find
unaligned access types by id registers which is used to skip probing.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kernel/unaligned_access_speed.c | 91 +++++++++++++++++++++-
 1 file changed, 89 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
index f8497097e79d..bd6db4c42daf 100644
--- a/arch/riscv/kernel/unaligned_access_speed.c
+++ b/arch/riscv/kernel/unaligned_access_speed.c
@@ -12,6 +12,7 @@
 #include <linux/types.h>
 #include <asm/cpufeature.h>
 #include <asm/hwprobe.h>
+#include <asm/sbi.h>
 #include <asm/vector.h>
 
 #include "copy-unaligned.h"
@@ -230,11 +231,89 @@ static int __init lock_and_set_unaligned_access_static_branch(void)
 
 arch_initcall_sync(lock_and_set_unaligned_access_static_branch);
 
-static bool check_unaligned_access_table(void)
+/*
+ * An unaligned_access_table_entry maps harts (or collections of harts) to
+ * unaligned access types. @level is used to determine whether @marchid and/or
+ * @mimpid should to be considered. All (level, mvendorid, marchid, mimpid)
+ * tuples formed from each table entry must be unique.
+ */
+enum id_level {
+	LEVEL_VENDOR,
+	LEVEL_ARCH,
+	LEVEL_IMP,
+};
+struct unaligned_access_table_entry {
+	enum id_level level;
+	u32 mvendorid;
+	ulong marchid;
+	ulong mimpid;
+	long type;
+};
+
+static struct unaligned_access_table_entry unaligned_access_table_entries[] = {
+};
+
+/*
+ * Search unaligned_access_table_entries[] for the most specific match,
+ * i.e. if there are two entries, one with mvendorid = V and level = VENDOR
+ * and another with mvendorid = V, level = ARCH, and marchid = A, then
+ * a hart with {V,A,?} will match the latter while a hart with {V,!A,?}
+ * will match the former.
+ */
+static bool __check_unaligned_access_table(int cpu, long *ptr, int nr_entries,
+					   struct unaligned_access_table_entry table[])
 {
+	struct unaligned_access_table_entry *entry, *match = NULL;
+	u32 mvendorid = riscv_cached_mvendorid(cpu);
+	ulong marchid = riscv_cached_marchid(cpu);
+	ulong mimpid = riscv_cached_mimpid(cpu);
+	int i;
+
+	for (i = 0; i < nr_entries; ++i) {
+		entry = &table[i];
+
+		switch (entry->level) {
+		case LEVEL_VENDOR:
+			if (!match && entry->mvendorid == mvendorid) {
+				/* The match, unless we find an ARCH or IMP level match. */
+				match = entry;
+			}
+			break;
+		case LEVEL_ARCH:
+			if (entry->mvendorid == mvendorid && entry->marchid == marchid) {
+				/* The match, unless we find an IMP level match. */
+				match = entry;
+			}
+			break;
+		case LEVEL_IMP:
+			if (entry->mvendorid == mvendorid && entry->marchid == marchid &&
+			    entry->mimpid == mimpid) {
+				match = entry;
+				goto matched;
+			}
+			break;
+		}
+	}
+
+	if (match) {
+matched:
+		*ptr = match->type;
+		return true;
+	}
+
 	return false;
 }
 
+static bool check_unaligned_access_table(void)
+{
+	int cpu = smp_processor_id();
+	long *ptr = per_cpu_ptr(&misaligned_access_speed, cpu);
+
+	return __check_unaligned_access_table(cpu, ptr,
+					      ARRAY_SIZE(unaligned_access_table_entries),
+					      unaligned_access_table_entries);
+}
+
 static int riscv_online_cpu(unsigned int cpu)
 {
 	if (check_unaligned_access_table())
@@ -380,9 +459,17 @@ static int __init vec_check_unaligned_access_speed_all_cpus(void *unused __alway
 }
 #endif
 
+static struct unaligned_access_table_entry vec_unaligned_access_table_entries[] = {
+};
+
 static bool check_vector_unaligned_access_table(void)
 {
-	return false;
+	int cpu = smp_processor_id();
+	long *ptr = per_cpu_ptr(&vector_misaligned_access, cpu);
+
+	return __check_unaligned_access_table(cpu, ptr,
+					      ARRAY_SIZE(vec_unaligned_access_table_entries),
+					      vec_unaligned_access_table_entries);
 }
 
 static int riscv_online_cpu_vec(unsigned int cpu)
-- 
2.48.1

