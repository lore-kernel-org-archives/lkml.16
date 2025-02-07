Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0620F235C0B
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 08:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738915732; cv=none; b=tOGOKfglPocGWcyEBiLiZ1rbqSOeM4bhTBHx6qirVCNSGARpfEjEIogb5Z22pDYVtn32kC6tTW4Jz9hngVCbI6LuqFI8ogwwzjwbLdUB7qFn7WKuLRu9LptWjeeHZNlGZefFjEOpJ41jxoLudPyDuKYr6Oe+ft/0OLEDD7NvxLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738915732; c=relaxed/simple;
	bh=qYgiaxK7DTCswsumKXpFE8Gz/6JnFk7H5/sd6l23VF8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gHf8LKKvyB3kO/BHEMv9KDn+E7KwwwCQsMG/ZfBFNZDqAoqf6I7GAzTdKAK9IM9SQjiIKoKTPUx522WTsbXOGGXqglr0ZxlIjXPPzULV+Wrtoeoy1OZUwNY9Oc3BzD6PhwtVl2HaWBQ5hxHspoxrNpQrXJtJwySb1itlkPSVxiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RVZnCOgx; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RVZnCOgx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738915730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K4HLB2l94cxI2U1OdfZtSwsiylrY7VkACKgIHY5nsyc=;
	b=RVZnCOgxyFfxBHAz0RquP52KqPe5OuQip5dzWQeSFtuV6OJ4fSRXw875RFyKHL1iaJ6EfJ
	JQAPeJjsejRkx6MW5M8t0r3erH2B0KMr56yKbCtrWXb4M1FIl10P6oONoyGGizJncnJvFv
	Wu/7pIrHiuwW1pAaGMuG8tWrHRHr/hQ=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-47-oTHE66I8P1229Y-QLvhDSg-1; Fri, 07 Feb 2025 03:08:48 -0500
X-MC-Unique: oTHE66I8P1229Y-QLvhDSg-1
X-Mimecast-MFC-AGG-ID: oTHE66I8P1229Y-QLvhDSg
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-21f4f0570e2so18158715ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 00:08:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738915723; x=1739520523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K4HLB2l94cxI2U1OdfZtSwsiylrY7VkACKgIHY5nsyc=;
        b=rFmImsr4P8SxiLfS5vd7Jic+pW+32Vyt4EENMWRziqRCT9wWfmlTAH483GDk2kpt31
         juH02pdIuwncoEjYFYOgsLJxQHMSxrjJxedQ1cdVUnUtcrpRls3yZlVPrbHoR//jg6HI
         20B0k1QSrHTT2sO3fktHyxDl6F3PEUfB0lKq8AjuGPOPPnMjPYZdfJOyd6HLLxnsZVA2
         fq9vPPujiV8/G2gVE3XOFsJ2f+RNbFhb0k5pJfsN4/jYCc22HGkkvIo+pXXAq9nnHV6T
         PJFtQAx4lwDmVRDGJqaZ6JXlcAEqV/5h7NvUSB6MolCCgAERDy5VzfvAe75UBX3kaf4l
         lOug==
X-Forwarded-Encrypted: i=1; AJvYcCXtHaCEu8KvDk+1Ao5WxX/jsN1CIgbRpMFZzy2eBALrOzQvu8d4JC0dI+KAc8kGTCcnw1xYftlx817PT1Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCZsY2hgjJeE6w9i21p6MyZolo0RBIMgrg/HuveZN/yKYJe/AE
	rI/rBRkgAoknVZ2H3+1CT9AcN21o6/PNDxQJSC0Dtd1S5fbg+SSbunDTdJFQFHQlR3abdPfvRtb
	irmwOej+tNpwrqHA0+EG0x7L07lctPMsVnJixteJ19pt9XeM4kOQ8zYqfZDUNLQ==
X-Gm-Gg: ASbGncu/tf+mFXomUjOmQ1yr/XLzOzcLRewitgtF9UlYeO4yg/qSg8ehcoqW9gTy0gT
	rG7jNra3lZj7OjN56oyKiEVyzhrdHIfN8uE3puYmSASLEIYWneyUUKMY9FCnJnlhiGkVZ03xKMV
	cy1GS1e+zRzdPp7jXOvTjq/op59TWD49E5zT+O7oBjRJ34xsCuEEIi73FzACnkwtvV+PClfBeVZ
	KNuFk0Fci08ryukB1UaGIMrWiqkiU8rr9rZik2Zi3zgi8UdJm8VyKC5UZlql+jj7oCiRRwL
X-Received: by 2002:a17:903:28d:b0:211:ce91:63ea with SMTP id d9443c01a7336-21f4e6f449amr40652875ad.15.1738915723420;
        Fri, 07 Feb 2025 00:08:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEG/Nl/sdNxE3d9AYSZmlVVB64Sgy2HwYPMVzmQGwxFjzAN+7LrOpduVERhXyu9f9J9OA/vpQ==
X-Received: by 2002:a17:903:28d:b0:211:ce91:63ea with SMTP id d9443c01a7336-21f4e6f449amr40652485ad.15.1738915723069;
        Fri, 07 Feb 2025 00:08:43 -0800 (PST)
Received: from localhost ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa09a184cdsm2738670a91.13.2025.02.07.00.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 00:08:42 -0800 (PST)
From: Coiby Xu <coxu@redhat.com>
To: kexec@lists.infradead.org
Cc: Ondrej Kozina <okozina@redhat.com>,
	Milan Broz <gmazyland@gmail.com>,
	Thomas Staudt <tstaudt@de.ibm.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Kairui Song <ryncsn@gmail.com>,
	Pingfan Liu <kernelfans@gmail.com>,
	Baoquan He <bhe@redhat.com>,
	Dave Young <dyoung@redhat.com>,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	Dave Hansen <dave.hansen@intel.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Vivek Goyal <vgoyal@redhat.com>
Subject: [PATCH v8 5/7] crash_dump: retrieve dm crypt keys in kdump kernel
Date: Fri,  7 Feb 2025 16:08:13 +0800
Message-ID: <20250207080818.129165-6-coxu@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250207080818.129165-1-coxu@redhat.com>
References: <20250207080818.129165-1-coxu@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Crash kernel will retrieve the dm crypt keys based on the dmcryptkeys
command line parameter. When user space writes the key description to
/sys/kernel/config/crash_dm_crypt_key/restore, the crash kernel will
save the encryption keys to the user keyring. Then user space e.g.
cryptsetup's --volume-key-keyring API can use it to unlock the encrypted
device.

Signed-off-by: Coiby Xu <coxu@redhat.com>
---
 include/linux/crash_core.h   |   1 +
 include/linux/crash_dump.h   |   2 +
 kernel/crash_dump_dm_crypt.c | 133 +++++++++++++++++++++++++++++++++++
 3 files changed, 136 insertions(+)

diff --git a/include/linux/crash_core.h b/include/linux/crash_core.h
index 2e6782239034..d35726d6a415 100644
--- a/include/linux/crash_core.h
+++ b/include/linux/crash_core.h
@@ -36,6 +36,7 @@ static inline void arch_kexec_unprotect_crashkres(void) { }
 
 #ifdef CONFIG_CRASH_DM_CRYPT
 int crash_load_dm_crypt_keys(struct kimage *image);
+ssize_t dm_crypt_keys_read(char *buf, size_t count, u64 *ppos);
 #else
 static inline int crash_load_dm_crypt_keys(struct kimage *image) {return 0; }
 #endif
diff --git a/include/linux/crash_dump.h b/include/linux/crash_dump.h
index 2f2555e6407c..dd6fc3b2133b 100644
--- a/include/linux/crash_dump.h
+++ b/include/linux/crash_dump.h
@@ -15,6 +15,8 @@
 extern unsigned long long elfcorehdr_addr;
 extern unsigned long long elfcorehdr_size;
 
+extern unsigned long long dm_crypt_keys_addr;
+
 #ifdef CONFIG_CRASH_DUMP
 extern int elfcorehdr_alloc(unsigned long long *addr, unsigned long long *size);
 extern void elfcorehdr_free(unsigned long long addr);
diff --git a/kernel/crash_dump_dm_crypt.c b/kernel/crash_dump_dm_crypt.c
index e4e0cc1c3399..993d9e08d774 100644
--- a/kernel/crash_dump_dm_crypt.c
+++ b/kernel/crash_dump_dm_crypt.c
@@ -3,6 +3,7 @@
 #include <linux/keyctl.h>
 #include <keys/user-type.h>
 #include <linux/crash_dump.h>
+#include <linux/cc_platform.h>
 #include <linux/configfs.h>
 #include <linux/module.h>
 
@@ -28,6 +29,61 @@ static size_t get_keys_header_size(size_t total_keys)
 	return struct_size(keys_header, keys, total_keys);
 }
 
+unsigned long long dm_crypt_keys_addr;
+EXPORT_SYMBOL_GPL(dm_crypt_keys_addr);
+
+static int __init setup_dmcryptkeys(char *arg)
+{
+	char *end;
+
+	if (!arg)
+		return -EINVAL;
+	dm_crypt_keys_addr = memparse(arg, &end);
+	if (end > arg)
+		return 0;
+
+	dm_crypt_keys_addr = 0;
+	return -EINVAL;
+}
+
+early_param("dmcryptkeys", setup_dmcryptkeys);
+
+/*
+ * Architectures may override this function to read dm crypt keys
+ */
+ssize_t __weak dm_crypt_keys_read(char *buf, size_t count, u64 *ppos)
+{
+	struct kvec kvec = { .iov_base = buf, .iov_len = count };
+	struct iov_iter iter;
+
+	iov_iter_kvec(&iter, READ, &kvec, 1, count);
+	return read_from_oldmem(&iter, count, ppos, cc_platform_has(CC_ATTR_MEM_ENCRYPT));
+}
+
+static int add_key_to_keyring(struct dm_crypt_key *dm_key,
+			      key_ref_t keyring_ref)
+{
+	key_ref_t key_ref;
+	int r;
+
+	/* create or update the requested key and add it to the target keyring */
+	key_ref = key_create_or_update(keyring_ref, "user", dm_key->key_desc,
+				       dm_key->data, dm_key->key_size,
+				       KEY_USR_ALL, KEY_ALLOC_IN_QUOTA);
+
+	if (!IS_ERR(key_ref)) {
+		r = key_ref_to_ptr(key_ref)->serial;
+		key_ref_put(key_ref);
+		kexec_dprintk("Success adding key %s", dm_key->key_desc);
+	} else {
+		r = PTR_ERR(key_ref);
+		kexec_dprintk("Error when adding key");
+	}
+
+	key_ref_put(keyring_ref);
+	return r;
+}
+
 static void get_keys_from_kdump_reserved_memory(void)
 {
 	struct keys_header *keys_header_loaded;
@@ -42,6 +98,47 @@ static void get_keys_from_kdump_reserved_memory(void)
 	arch_kexec_protect_crashkres();
 }
 
+static int restore_dm_crypt_keys_to_thread_keyring(void)
+{
+	struct dm_crypt_key *key;
+	size_t keys_header_size;
+	key_ref_t keyring_ref;
+	u64 addr;
+
+	/* find the target keyring (which must be writable) */
+	keyring_ref =
+		lookup_user_key(KEY_SPEC_USER_KEYRING, 0x01, KEY_NEED_WRITE);
+	if (IS_ERR(keyring_ref)) {
+		kexec_dprintk("Failed to get the user keyring\n");
+		return PTR_ERR(keyring_ref);
+	}
+
+	addr = dm_crypt_keys_addr;
+	dm_crypt_keys_read((char *)&key_count, sizeof(key_count), &addr);
+	if (key_count < 0 || key_count > KEY_NUM_MAX) {
+		kexec_dprintk("Failed to read the number of dm-crypt keys\n");
+		return -1;
+	}
+
+	kexec_dprintk("There are %u keys\n", key_count);
+	addr = dm_crypt_keys_addr;
+
+	keys_header_size = get_keys_header_size(key_count);
+	keys_header = kzalloc(keys_header_size, GFP_KERNEL);
+	if (!keys_header)
+		return -ENOMEM;
+
+	dm_crypt_keys_read((char *)keys_header, keys_header_size, &addr);
+
+	for (int i = 0; i < keys_header->total_keys; i++) {
+		key = &keys_header->keys[i];
+		kexec_dprintk("Get key (size=%u)\n", key->key_size);
+		add_key_to_keyring(key, keyring_ref);
+	}
+
+	return 0;
+}
+
 static int read_key_from_user_keying(struct dm_crypt_key *dm_key)
 {
 	const struct user_key_payload *ukp;
@@ -211,6 +308,37 @@ static const struct config_item_type config_keys_type = {
 	.ct_owner = THIS_MODULE,
 };
 
+static bool restore;
+
+static ssize_t config_keys_restore_show(struct config_item *item, char *page)
+{
+	return sprintf(page, "%d\n", restore);
+}
+
+static ssize_t config_keys_restore_store(struct config_item *item,
+					  const char *page, size_t count)
+{
+	if (!restore)
+		restore_dm_crypt_keys_to_thread_keyring();
+
+	if (kstrtobool(page, &restore))
+		return -EINVAL;
+
+	return count;
+}
+
+CONFIGFS_ATTR(config_keys_, restore);
+
+static struct configfs_attribute *kdump_config_keys_attrs[] = {
+	&config_keys_attr_restore,
+	NULL,
+};
+
+static const struct config_item_type kdump_config_keys_type = {
+	.ct_attrs = kdump_config_keys_attrs,
+	.ct_owner = THIS_MODULE,
+};
+
 static struct configfs_subsystem config_keys_subsys = {
 	.su_group = {
 		.cg_item = {
@@ -306,6 +434,11 @@ static int __init configfs_dmcrypt_keys_init(void)
 {
 	int ret;
 
+	if (is_kdump_kernel()) {
+		config_keys_subsys.su_group.cg_item.ci_type =
+			&kdump_config_keys_type;
+	}
+
 	config_group_init(&config_keys_subsys.su_group);
 	mutex_init(&config_keys_subsys.su_mutex);
 	ret = configfs_register_subsystem(&config_keys_subsys);
-- 
2.48.1

