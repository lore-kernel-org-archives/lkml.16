Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA455254B02
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 23:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744154743; cv=none; b=SLQHMb2RPpItP6cRnXEnVZpfkSxFpEn2qIaKcw1X5f7SMPHq+MT1hKjIIVeY448uhaUcOUkQ4clPU+ewYsgZijkeKOpKDFa1CkOt0JNn5rpe83NYPpdpYzBkr/VACW0sQpm53kOsAd8so+JXmzL2PkZZ3FGV8jHgDsZY9LA8HKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744154743; c=relaxed/simple;
	bh=KLuwg37HA9d35p6YPDfUzR6m5Ve1w96Q9p2SqO1gqJQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kvim9Vl9otK4XZ/WyKNy6oO/x9yp7MNkbiFHqMVhtvkkvz6GnTKGAQtvjkFBcEob+MmUlaty2h97Fm8CE5L33Uht7Zadjss1InjB7K9iRAZSRu2IeQVPC2Opvh1eNpNnpdXLX9HONv7ReOfiWkZom2sfvovF0T4R5DSmlg/QAVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=H9wrye1n; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="H9wrye1n"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2ff799d99dcso5850946a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 16:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744154741; x=1744759541; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P411XXh9tP6xKxZOeS+c/EGq9SgVAs4t8mf9P3YcEAY=;
        b=H9wrye1nkjn8UkQuXYhvKQB3LvUnfkV+Ax4cbaaU8Jsl1jTQWfsz54c1bSc+eh0tNU
         vogF3DH1DuPK8uLU4fW5seCxSpXasJGgCR7rwZwf377KE2Wmv/qlDhWPh+8atgC9zONb
         ssunVBVviudVG3+9uLi8ShdAHLvAXR259Jqva6V2D2+WbDJsdJLbAye8tGebUPDYZEOU
         FzrOZXHXNIy3yR2kQv1Mhw9q6vE4MHgUEx7W8SJ57RwWlKUy5WHvDqPx2rPXeOPVn0qL
         PGbsIO3ez6MendG9k9q3wPn6ZzQBnJ8WRUm5a/2PYqaq5WrsbBDylPVEYl0PVWO++9La
         iuKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744154741; x=1744759541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P411XXh9tP6xKxZOeS+c/EGq9SgVAs4t8mf9P3YcEAY=;
        b=uuniw9w2KlbVBlF56mLwju2uz4czM9N1Xl+hhAep2x19YJ3A30+efQ20CZtLX6dj0I
         Ql3jnMkzB99sPm/NP7GJqZnq7VwHsZOZCKw/NHq98dQKhriSg0pD94iJ3oRGtXulHFCg
         fiN0B96h89beG+oiZQsh9FELjCCQeRxYxe0Lln2YGtTJvT0SVAKay/0ypL+pWARDy1YE
         gONSieZM+t6o485gnKosx/T2LW8PgfRitX4gbpvKl9rmLAUwI1WO4sjW9rDPjrltrqUm
         p+zdzmg65TYxxQLfe8fkgP1A9Jn3hEh1xnWs3kwcosGNGiLlF98+403Ag0/IY6cpqGql
         jRkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNVXQYF416Np0TMvDJXbMhyE0Fl6HOWtqX6DltwfKky2AeZ+Oo2CGsQ4XyVKW0dTCINVcWzAPVqf5L67E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzexAAa7vzzgxsy81Re+MJwBoRiMvc9tk2gK6bhOEFgc81gRe78
	0rrjVeg9OsoDUXn18o8WmDPJLXvyhREaUpGLWtzDi3jDztKOYwlBQrBItnxdUA==
X-Gm-Gg: ASbGnctiTLXD6bC5I3gnkDEVcji0nGjrszMsN0WzfmpSJzg3Jlb1EN2LA87PK+dB77b
	KXU3tcAm/r0snUl3KBr5rYTUaXUQGdCmOaANANrBIpfIt/mFJjYvEvjfGWovDVcxOD7131jYK1P
	NxD9ZozAkfsp0VVIxwG92fi9derU3c+2Fu1cQrMjaAOHhQ2P/GGMT/5l5bzAeaf4GCebKxl3AqC
	qQ9dV09Gy9Zg+cBrSBrL6FPh/WA9WIy7aBrKmI4C4TYDm/Dlb3PJQYX/TLLs14FmkIlfP0IpVuv
	L9RjWzWHBPVSBzJbrS0eN/QZUUmRya8hxelCj3r3hSi/r9TyhSRi4/HoIZd6ZdHpbYI1WBRieqG
	U/0Mrtpaj2w==
X-Google-Smtp-Source: AGHT+IF9ozNozcEFD4AY8UaNsfqRMujNJK7qdpQ0MPYPXtpgegTgLnYRb1rqoIe2L+hZrQFNYEqiiw==
X-Received: by 2002:a17:90b:56c6:b0:2fc:3264:3657 with SMTP id 98e67ed59e1d1-306dba63685mr1778738a91.0.1744154741086;
        Tue, 08 Apr 2025 16:25:41 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297866cd1dsm106403815ad.159.2025.04.08.16.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 16:25:40 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 2/7] staging: gpib: Removing gpib_interface_list_t
Date: Tue,  8 Apr 2025 23:25:30 +0000
Message-ID: <20250408232535.187528-3-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408232535.187528-1-matchstick@neverthere.org>
References: <20250408232535.187528-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removing gpib_interface_list_t to adhere to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/common/gpib_os.c     | 10 +++++-----
 drivers/staging/gpib/include/gpib_types.h |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
index 684faa0c4547..3fb369caf17e 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -826,9 +826,9 @@ static int board_type_ioctl(gpib_file_private_t *file_priv,
 
 	for (list_ptr = registered_drivers.next; list_ptr != &registered_drivers;
 	     list_ptr = list_ptr->next) {
-		gpib_interface_list_t *entry;
+		struct gpib_interface_list *entry;
 
-		entry = list_entry(list_ptr, gpib_interface_list_t, list);
+		entry = list_entry(list_ptr, struct gpib_interface_list, list);
 		if (strcmp(entry->interface->name, cmd.name) == 0) {
 			int i;
 			int had_module = file_priv->got_module;
@@ -2026,7 +2026,7 @@ void init_gpib_descriptor(gpib_descriptor_t *desc)
 
 int gpib_register_driver(struct gpib_interface *interface, struct module *provider_module)
 {
-	struct gpib_interface_list_struct *entry;
+	struct gpib_interface_list *entry;
 
 	entry = kmalloc(sizeof(*entry), GFP_KERNEL);
 	if (!entry)
@@ -2057,9 +2057,9 @@ void gpib_unregister_driver(struct gpib_interface *interface)
 		}
 	}
 	for (list_ptr = registered_drivers.next; list_ptr != &registered_drivers;) {
-		gpib_interface_list_t *entry;
+		struct gpib_interface_list *entry;
 
-		entry = list_entry(list_ptr, gpib_interface_list_t, list);
+		entry = list_entry(list_ptr, struct gpib_interface_list, list);
 		list_ptr = list_ptr->next;
 		if (entry->interface == interface) {
 			list_del(&entry->list);
diff --git a/drivers/staging/gpib/include/gpib_types.h b/drivers/staging/gpib/include/gpib_types.h
index 66a1a1676f2b..4be7cfce539f 100644
--- a/drivers/staging/gpib/include/gpib_types.h
+++ b/drivers/staging/gpib/include/gpib_types.h
@@ -209,11 +209,11 @@ static inline void init_gpib_pseudo_irq(struct gpib_pseudo_irq *pseudo_irq)
 }
 
 /* list so we can make a linked list of drivers */
-typedef struct gpib_interface_list_struct {
+struct gpib_interface_list {
 	struct list_head list;
 	struct gpib_interface *interface;
 	struct module *module;
-} gpib_interface_list_t;
+};
 
 /* One struct gpib_board is allocated for each physical board in the computer.
  * It provides storage for variables local to each board, and interface
-- 
2.43.0

