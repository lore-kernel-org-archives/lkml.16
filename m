Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963631A83EE
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 08:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738915724; cv=none; b=PL1MPnI3t0nU6Dv1d4erDEn1iaqKend+S9QjSSzDJbLrFre5ufUsATNvw41gjZAJNTTC2UQX4zFPKiGH+DnDkLSKHhfTzOK0S1HL7KHJ9o/6J+NnFBtW2tL6UWn52Le5w3dZ8xVnP25xKSLwLfQv65L5nPxN3bkz0/zeT2ysWUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738915724; c=relaxed/simple;
	bh=wGo8awM55P1fixHWH0T9+mtru3yxo+FWs1KGiEg7kzU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hYMxWN1NEXj+cU9airmZUkuJVLdEg5Tai9ZLPNyX39kecMH3OszVckcgFeZtxbpY7/dKQCdFCukIYkSnzIYA1g0XWIkd14IkUDPgrFUi2ftFQb1910hPamIrxklGcq9a5C9Y1Ld+XX5wNOlfBoWtvA80GJF8XuUXsb/0m+dDq6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ff8Dlq1h; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ff8Dlq1h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738915721;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wiArPs1+avBHMZbi2nWrtxJACPoRgCcLG1Yosqozl6w=;
	b=Ff8Dlq1hOudSjVMSUdLRumVtv/hv8oG0vmbkm1yHAS/co+Zc1rrzdhhld0h2pyvVxJDoWq
	IJhJO4Suf+UDDDqfUT2xQ53XSiy/56e+lV9KIikBuK8K/3rIXLVXLNuSLzBVGshFrr3hZh
	mGwiRkqjXj85zBxjxovcX7CdXv7Bmuk=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-45-83xlJHViPgSBR5uUmx-bHw-1; Fri, 07 Feb 2025 03:08:40 -0500
X-MC-Unique: 83xlJHViPgSBR5uUmx-bHw-1
X-Mimecast-MFC-AGG-ID: 83xlJHViPgSBR5uUmx-bHw
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-21f0d8b7647so55058115ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 00:08:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738915714; x=1739520514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wiArPs1+avBHMZbi2nWrtxJACPoRgCcLG1Yosqozl6w=;
        b=MA7PI4qEWJthwxAkbRoiEaK+IkvE81xV7/oyYuk6D5zJRM+sceRP6MtnhaZzPA6isd
         TmwsMEvi3lnJ4HmggQjgro43e+4zgLiT2QvQQHQd68Gmebd1mtdxZ905tLLJj/DfIp1w
         5ZC0hbEZQLPA3dozfUhwjLErku/Cs8+VJBWiqc9LdVElROxjxMPfc1KWXsWvTt9vLrcb
         M02EUUX6RSm3o6x0jlcXDYFOfieWva0JNQ/XirqgNuTIIYqIGTzJAMbuR+AwZWYpBbxn
         nhqPAoUxMfQj4C245mGjN6PF+IaPzOFzCLVfMAwSnjmuR9IA7uNxaKrHftvjj9yZbppf
         AOrg==
X-Forwarded-Encrypted: i=1; AJvYcCW1DZgMNOb1tJA1KzhpmGvpDyvpzQTpm9+Zj0y6wpKdGG2/qiSKaytZJbMTFgHesT1OOEkzs9seX9Dx95A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzrw0gD5xbBGWOYQrZl1St91hIT5m6rolf4j3r0AQ/vDL4OZqC7
	xJek7d3j5jxRvGns4NdQSCd1YPYC4WdlIugMuEuGEsHwl3uHi3w2VZhtGgMLbyNFOVQJs0bY8l4
	rOknYB51ukhxDzJpowmk2jP93Tf7wAXpnAhaZo0Pj56EFIlqWSjx+YFTcm56uEA==
X-Gm-Gg: ASbGncv6Illyu6pfTjrioPrH3HalRtXkBPpZHc8Hpwz9/gtMEb8L62HIIKQ+Rm+dQ/Z
	76GAFIy3u+dL34aFVxdv5ywdfnFduZmaTy/rnJ1Ym7buxY6x+FIdOYaYl89mihO1DTKfuTm8EhS
	pyc4ys7n1X1l/JfFbDLIr6fq7r+wWTpf6b+5BKMh6AP9yUzQg5adGFP5P6oe49baRubgZ6dlmg9
	eLBHAnmOWe/nRf3KVLuZEM8fROihVMW6evSUTiGki6vG6g74yVTiqfhb13MkM7QsuzbxoqJ
X-Received: by 2002:a17:902:e552:b0:219:cdf1:a0b8 with SMTP id d9443c01a7336-21f4e70becemr33812685ad.30.1738915714416;
        Fri, 07 Feb 2025 00:08:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEOy2GKcmqR9hVKPcRIgrcrNltxpouvX9yK078gbyYuEyZ9aHqEHHcHMDTXf7Funzs6C/FVgQ==
X-Received: by 2002:a17:902:e552:b0:219:cdf1:a0b8 with SMTP id d9443c01a7336-21f4e70becemr33812455ad.30.1738915714085;
        Fri, 07 Feb 2025 00:08:34 -0800 (PST)
Received: from localhost ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3650cd10sm24776065ad.31.2025.02.07.00.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 00:08:33 -0800 (PST)
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
	Vivek Goyal <vgoyal@redhat.com>,
	Eric Biederman <ebiederm@xmission.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCH v8 3/7] crash_dump: store dm crypt keys in kdump reserved memory
Date: Fri,  7 Feb 2025 16:08:11 +0800
Message-ID: <20250207080818.129165-4-coxu@redhat.com>
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

When the kdump kernel image and initrd are loaded, the dm crypts keys
will be read from keyring and then stored in kdump reserved memory.

Assume a key won't exceed 256 bytes thus MAX_KEY_SIZE=256 according to
"cryptsetup benchmark".

Signed-off-by: Coiby Xu <coxu@redhat.com>
---
 include/linux/crash_core.h   |   6 +-
 include/linux/kexec.h        |   4 ++
 kernel/crash_dump_dm_crypt.c | 128 +++++++++++++++++++++++++++++++++++
 3 files changed, 137 insertions(+), 1 deletion(-)

diff --git a/include/linux/crash_core.h b/include/linux/crash_core.h
index 44305336314e..2e6782239034 100644
--- a/include/linux/crash_core.h
+++ b/include/linux/crash_core.h
@@ -34,7 +34,11 @@ static inline void arch_kexec_protect_crashkres(void) { }
 static inline void arch_kexec_unprotect_crashkres(void) { }
 #endif
 
-
+#ifdef CONFIG_CRASH_DM_CRYPT
+int crash_load_dm_crypt_keys(struct kimage *image);
+#else
+static inline int crash_load_dm_crypt_keys(struct kimage *image) {return 0; }
+#endif
 
 #ifndef arch_crash_handle_hotplug_event
 static inline void arch_crash_handle_hotplug_event(struct kimage *image, void *arg) { }
diff --git a/include/linux/kexec.h b/include/linux/kexec.h
index 61269e97502a..ec7504ba80e9 100644
--- a/include/linux/kexec.h
+++ b/include/linux/kexec.h
@@ -398,6 +398,10 @@ struct kimage {
 	void *elf_headers;
 	unsigned long elf_headers_sz;
 	unsigned long elf_load_addr;
+
+	/* dm crypt keys buffer */
+	unsigned long dm_crypt_keys_addr;
+	unsigned long dm_crypt_keys_sz;
 };
 
 /* kexec interface functions */
diff --git a/kernel/crash_dump_dm_crypt.c b/kernel/crash_dump_dm_crypt.c
index 62a3c47d8b3b..00dc6a3f71ca 100644
--- a/kernel/crash_dump_dm_crypt.c
+++ b/kernel/crash_dump_dm_crypt.c
@@ -1,14 +1,62 @@
 // SPDX-License-Identifier: GPL-2.0-only
+#include <linux/key.h>
+#include <linux/keyctl.h>
 #include <keys/user-type.h>
 #include <linux/crash_dump.h>
 #include <linux/configfs.h>
 #include <linux/module.h>
 
 #define KEY_NUM_MAX 128	/* maximum dm crypt keys */
+#define KEY_SIZE_MAX 256	/* maximum dm crypt key size */
 #define KEY_DESC_MAX_LEN 128	/* maximum dm crypt key description size */
 
 static unsigned int key_count;
 
+struct dm_crypt_key {
+	unsigned int key_size;
+	char key_desc[KEY_DESC_MAX_LEN];
+	u8 data[KEY_SIZE_MAX];
+};
+
+static struct keys_header {
+	unsigned int total_keys;
+	struct dm_crypt_key keys[] __counted_by(total_keys);
+} *keys_header;
+
+static size_t get_keys_header_size(size_t total_keys)
+{
+	return struct_size(keys_header, keys, total_keys);
+}
+
+static int read_key_from_user_keying(struct dm_crypt_key *dm_key)
+{
+	const struct user_key_payload *ukp;
+	struct key *key;
+
+	kexec_dprintk("Requesting key %s", dm_key->key_desc);
+	key = request_key(&key_type_logon, dm_key->key_desc, NULL);
+
+	if (IS_ERR(key)) {
+		pr_warn("No such key %s\n", dm_key->key_desc);
+		return PTR_ERR(key);
+	}
+
+	ukp = user_key_payload_locked(key);
+	if (!ukp)
+		return -EKEYREVOKED;
+
+	if (ukp->datalen > KEY_SIZE_MAX) {
+		pr_err("Key size %u exceeds maximum (%u)\n", ukp->datalen, KEY_SIZE_MAX);
+		return -EINVAL;
+	}
+
+	memcpy(dm_key->data, ukp->data, ukp->datalen);
+	dm_key->key_size = ukp->datalen;
+	kexec_dprintk("Get dm crypt key (size=%u) %s: %8ph\n", dm_key->key_size,
+		      dm_key->key_desc, dm_key->data);
+	return 0;
+}
+
 struct config_key {
 	struct config_item item;
 	const char *description;
@@ -130,6 +178,86 @@ static struct configfs_subsystem config_keys_subsys = {
 	},
 };
 
+static int build_keys_header(void)
+{
+	struct config_item *item = NULL;
+	struct config_key *key;
+	int i, r;
+
+	if (keys_header != NULL)
+		kvfree(keys_header);
+
+	keys_header = kzalloc(get_keys_header_size(key_count), GFP_KERNEL);
+	if (!keys_header)
+		return -ENOMEM;
+
+	keys_header->total_keys = key_count;
+
+	i = 0;
+	list_for_each_entry(item, &config_keys_subsys.su_group.cg_children,
+			    ci_entry) {
+		if (item->ci_type != &config_key_type)
+			continue;
+
+		key = to_config_key(item);
+
+		strscpy(keys_header->keys[i].key_desc, key->description,
+			KEY_DESC_MAX_LEN);
+		r = read_key_from_user_keying(&keys_header->keys[i]);
+		if (r != 0) {
+			kexec_dprintk("Failed to read key %s\n",
+				      keys_header->keys[i].key_desc);
+			return r;
+		}
+		i++;
+		kexec_dprintk("Found key: %s\n", item->ci_name);
+	}
+
+	return 0;
+}
+
+int crash_load_dm_crypt_keys(struct kimage *image)
+{
+	struct kexec_buf kbuf = {
+		.image = image,
+		.buf_min = 0,
+		.buf_max = ULONG_MAX,
+		.top_down = false,
+		.random = true,
+	};
+	int r;
+
+
+	if (key_count <= 0) {
+		kexec_dprintk("No dm-crypt keys\n");
+		return -ENOENT;
+	}
+
+	image->dm_crypt_keys_addr = 0;
+	r = build_keys_header();
+	if (r)
+		return r;
+
+	kbuf.buffer = keys_header;
+	kbuf.bufsz = get_keys_header_size(key_count);
+
+	kbuf.memsz = kbuf.bufsz;
+	kbuf.buf_align = ELF_CORE_HEADER_ALIGN;
+	kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
+	r = kexec_add_buffer(&kbuf);
+	if (r) {
+		kvfree((void *)kbuf.buffer);
+		return r;
+	}
+	image->dm_crypt_keys_addr = kbuf.mem;
+	image->dm_crypt_keys_sz = kbuf.bufsz;
+	kexec_dprintk(
+		"Loaded dm crypt keys to kexec_buffer bufsz=0x%lx memsz=0x%lx\n",
+		kbuf.bufsz, kbuf.memsz);
+
+	return r;
+}
+
 static int __init configfs_dmcrypt_keys_init(void)
 {
 	int ret;
-- 
2.48.1

