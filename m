Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F7CA19DF41
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 01:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746148401; cv=none; b=fUFLnAYgl4fUNYJs4UpK1eW5LS4+U1Rlj6G13ICnARILQfUHYdeZ5FBUHh1QVBgD50Qh/MkguFKyJxcC7FeFxsd+TAh4TEA+jqUR/YbUReryUm2t4XeuLrwbvaN7EqfhN7I4pjFfbU662wBBErjBOt/QAOgStAyJxh3ZRt9Jlbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746148401; c=relaxed/simple;
	bh=dOZvp6u+kyYhS9ZUG/GSP3M5qxYsSBxf5L2SkRc5vR8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UsV+drR7HhWg4d9ry0JemsU2bp0a5M42Dec/sFPy4+CBz6SbPqwt8Ovm+2XyzYSH/JfyHEPioSAw8DbHxxeWoWOHoZPF0TNDjpeZRlKz195Hai2IWdz80kn2boGACe6C1nzzcaA0BnrGuD76pmfx7/j9tOf4zOpFz6XRZ6uuYjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=T1JIioQn; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="T1JIioQn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746148398;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1MajVo0eN+bOY/uhsAvuKiRsP8lMRdWSlIoFJzdsFWA=;
	b=T1JIioQnk2M+7ps3ZHN16j9K4LzG4jzUdXIXOz2BOOAOgwPCLxiueP15pIXFI3o7pKNfTU
	4+/cGIpTxT00qWjNxYVBlFrBOf3hcpqrusIBSk9QBs132ZsDHy6sQLaulyDoDIe6r584Df
	350zBxS1jsReU+pTwR6xjYjr/DKOUZE=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-68-DKVi9EH7NpOVYtjnEocxRg-1; Thu, 01 May 2025 21:13:17 -0400
X-MC-Unique: DKVi9EH7NpOVYtjnEocxRg-1
X-Mimecast-MFC-AGG-ID: DKVi9EH7NpOVYtjnEocxRg_1746148396
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7369c5ed395so1827240b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 18:13:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746148395; x=1746753195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1MajVo0eN+bOY/uhsAvuKiRsP8lMRdWSlIoFJzdsFWA=;
        b=IUuZ6XRSA/ZmkBNRscL2egdAcF614YHOIkdCKBlqpNI71tMsibGwuUc2IO4y14P1UR
         Kdf+cJdXJLrZ/f5j4QVVgO3VRTqmunpG4IiwvZOJJVuOuOnpPQI1xdwgw0N6OJwQhGO1
         kdWsiiKKCwKSXYk4H+W0NlwY7RwnuHiRuEKTqXS5s4KuGn5kOSvdlD5VELvG1gJ4HwFF
         XINwL6WTCWEOYb0NOLgHEQIVaQDaO7MHHA0QSmOH6tWQIINCSK7qCFGQR0/x72G9xUpG
         JXJNXJL6EyPKHELy8bm2RI0BqC+GlIAnHhKSboxK3qcmDhO9mYkJKPFJP27Gmyxtn1zz
         +hxg==
X-Forwarded-Encrypted: i=1; AJvYcCVnJ40Ns+TgqJrBXnw+HWIv5hhFpvkwI5ZCl32WViCfXDB2HHoKwZdnPweqAJ0hrrhdgjaKJmCmaaENMRY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yykml2FJWZ/Am2wZhEOqv/MCZrEaqUxYSpWZNbL4DEtCRsEKc/u
	DMn5R2mpcNdnG2rwjayCQGwGexe61BGvJmRv9RFhsL84dOuCeUq4DM76wD0InUkMf6X9TKM8rLO
	QcWtiVTeQ9vr6tHOPybVbjUB40Z49k3LxCumjNXhwCtf5ZFhnFP/8nHhEEBJh/Q==
X-Gm-Gg: ASbGnctXQdE1mMb9csOS64U7/0LKFf8N32LAOmdVnFP74+QGdPgGBfCbV3YeauQV8CA
	3KaqVnJl38jWTGwtXAq6GPo9POn3OIextU5IQ7oRmIYeIWiYzfqf5JHhP3VxpsJ9LuAP/c45+T8
	gRoA2wYYYWzGF7ng4lsAXfUFGTOHozVqbkTuvbEeRDeEsOwObCC2o6VBVlRV5ORk6mduQCvJDQ0
	uykCux8YB2wcISjABLVao7RRWT9NXsJVzWbmAh8y5EkAtzzfpZDzHLkKeXqeNGFCB3UQZg7kpDd
	CTU=
X-Received: by 2002:a05:6a21:9996:b0:1f5:5614:18d3 with SMTP id adf61e73a8af0-20cde374c45mr1332899637.8.1746148395570;
        Thu, 01 May 2025 18:13:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4p97v8it9sU5P5Sp05N+A9sBa8f61f+FHOAD5ZIDeBPK7a45C8c4sAtjySQ38fIl40uqCOQ==
X-Received: by 2002:a05:6a21:9996:b0:1f5:5614:18d3 with SMTP id adf61e73a8af0-20cde374c45mr1332865637.8.1746148395168;
        Thu, 01 May 2025 18:13:15 -0700 (PDT)
Received: from localhost ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fa8609193sm298494a12.72.2025.05.01.18.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 18:13:14 -0700 (PDT)
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
	Arnaud Lefebvre <arnaud.lefebvre@clever-cloud.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vivek Goyal <vgoyal@redhat.com>
Subject: [PATCH v9 5/8] crash_dump: retrieve dm crypt keys in kdump kernel
Date: Fri,  2 May 2025 09:12:39 +0800
Message-ID: <20250502011246.99238-6-coxu@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250502011246.99238-1-coxu@redhat.com>
References: <20250502011246.99238-1-coxu@redhat.com>
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
Acked-by: Baoquan He <bhe@redhat.com>
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
index 5f4a62389150..401423ba477d 100644
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
@@ -311,6 +439,11 @@ static int __init configfs_dmcrypt_keys_init(void)
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
2.49.0

