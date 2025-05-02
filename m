Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4CFC18BC2F
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 01:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746148396; cv=none; b=CD6lbgh/neRA9KHB8/p6ZWD8qZzuH5f3vAWg4D4XqKUxql5gg1HwOtMO04QAqbnxZIuEEV3gc70lys61LNV80HiDcAi2BmZJmoI6n2mWsLEH88e3mWdDCl7Rwn2kocMLTeNQx3zJwAzP7omrmwM/JvC3uv+qTwljsVpyby4AEPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746148396; c=relaxed/simple;
	bh=+qVcrmIApyLmaXNuQTglnXxrm8JItDdXgdFkfg6wUnw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q5RzMesdekuvcrE9ab+UoHrs851GRrGxXs+5lKNrxTDcZEcRksXQioIeYqcl/PdbxEneHaO/XtUgp5NUgiTrQLpnAybFJxiJsDFiu+EPoDShHqLnTXU0uJ9bVphUcjLzTX+b1eK2vVVOQG4x6KgKr03TzQ4P5zSG+Nh4McNQXvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WRigVIHQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WRigVIHQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746148393;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FI+GXrx5MXDfidTwssNH3+yBW/jsE3sUkCXkCFCf894=;
	b=WRigVIHQYyeasMSzklXfXB8huWdULL9F1XQ7SQWxCcHx1SsW30cjxcA44hO8Wr6j5X7d3X
	cnwyQrHctfIkla827u/HN6zV/qRVZnwQSV6eUKTFGzcBL+4GAHU2OQXYFXMlanaCgqaYPQ
	A7llfGny0ugRtw/cM0KU3waBKWEITHc=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-248-uK_WRF4_NvedvDtsc6NFtA-1; Thu, 01 May 2025 21:13:12 -0400
X-MC-Unique: uK_WRF4_NvedvDtsc6NFtA-1
X-Mimecast-MFC-AGG-ID: uK_WRF4_NvedvDtsc6NFtA_1746148391
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-af59547f55bso909316a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 18:13:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746148391; x=1746753191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FI+GXrx5MXDfidTwssNH3+yBW/jsE3sUkCXkCFCf894=;
        b=HZJahQLLykIxYudvrWldifcoUGQ5KmtWwoaIrlKcL5fGxUWvKeIzz8xELcgQAlJF5b
         nBesHCzRl94ZQjeaOC7T4RYoblaJlFr/kIiXoQnYiHYnuBLs1i/usQsVOnbtonILpMbw
         fdzaXRJ9F8oPChvulMnv32UpaPBAI7EvigIRzmI5vu79U29jHT4p0D/vGFP+um4mEX7n
         TC6x8YeVZhX6FUO7Y6lqCbwLjYfYtBlnlezBfmfZW0t8cPlDsOnfcoy2btyHOB//hMKH
         D3JUJfEAbVmaKxQRUXCvfD37vW/8CCvGIg57iVLxjvI3Wi0fPJGt8oJI0zUGVOrANAtQ
         Um9w==
X-Forwarded-Encrypted: i=1; AJvYcCVXl2BVCGJK7crhtKESB7jumTv669dFw9+IcnAdAFZeY4iWOPvo82NKJKoxPRFAwl5Z9dbZJhscS5LgRzk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOUkPqHE0HMlh7f3JvuPqGfUqCu+lxtpf3G18ivZtGysmZ7Te3
	j7nHmlSG1+wxZ8nmgEAUOR5GXQiNVqOlv+V2jIpfePlpIGZGY8t0d7zJM0gEwP9uM/aDKhuViy8
	oeWnsT0Iul2SZ7I/zdmCCFZxV2taTWqCGFjjpTd+YsaOky/BcgfzXMOVuvZRSig==
X-Gm-Gg: ASbGncvWCOZpV/XNixfI2bd/Ts+HJITc45HJi7y/h4c5zfydggzMx2rspQXe81MinkK
	5h0k7Rlt1vYqzKsHHK1Jhs71ieaCP3FSWaR9KV+c93EIz1gcXqtp0K/YhIiUapWBhakrr4N5EsZ
	1ZY7KSCZVmUTXQUBIMjcmysQSKd29s/YDnfRcyPD/vG6+WxKu7yNJ6HD093G/rSpBZ1A7oTFxwE
	HNI8kNbzmsZczFasufc7i8Zu0IuYoBWSHTHhfrDs+HvnFmBAKa7SxxVYy4nzM85qZgqRUfWcBCa
	q20=
X-Received: by 2002:a05:6a20:d485:b0:1f5:72eb:8b3f with SMTP id adf61e73a8af0-20cdef3dd0bmr1473399637.24.1746148391424;
        Thu, 01 May 2025 18:13:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFedydzy7eFeNpzLzqKKw1fQGI2Jm/XlzKlKPwhgkEdBGZDZTrtlVKsxZROLBUauHe6nb4G+w==
X-Received: by 2002:a05:6a20:d485:b0:1f5:72eb:8b3f with SMTP id adf61e73a8af0-20cdef3dd0bmr1473355637.24.1746148391066;
        Thu, 01 May 2025 18:13:11 -0700 (PDT)
Received: from localhost ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fa82b68c1sm222557a12.37.2025.05.01.18.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 18:13:10 -0700 (PDT)
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
	Vivek Goyal <vgoyal@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org (open list:DOCUMENTATION)
Subject: [PATCH v9 4/8] crash_dump: reuse saved dm crypt keys for CPU/memory hot-plugging
Date: Fri,  2 May 2025 09:12:38 +0800
Message-ID: <20250502011246.99238-5-coxu@redhat.com>
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

When there are CPU and memory hot un/plugs, the dm crypt keys may need
to be reloaded again depending on the solution for crash hotplug
support. Currently, there are two solutions. One is to utilizes udev to
instruct user space to reload the kdump kernel image and initrd,
elfcorehdr and etc again. The other is to only update the elfcorehdr
segment introduced in commit 247262756121 ("crash:
add generic infrastructure for crash hotplug support").

For the 1st solution, the dm crypt keys need to be reloaded again. The
user space can write true to
/sys/kernel/config/crash_dm_crypt_key/reuse so the stored keys can be
re-used.

For the 2nd solution, the dm crypt keys don't need to be reloaded.
Currently, only x86 supports the 2nd solution. If the 2nd solution
gets extended to all arches, this patch can be dropped.

Signed-off-by: Coiby Xu <coxu@redhat.com>
Acked-by: Baoquan He <bhe@redhat.com>
---
 Documentation/admin-guide/kdump/kdump.rst |  4 ++
 kernel/crash_dump_dm_crypt.c              | 52 +++++++++++++++++++++--
 2 files changed, 52 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/kdump/kdump.rst b/Documentation/admin-guide/kdump/kdump.rst
index b74d3bed8fff..e25edaa8e533 100644
--- a/Documentation/admin-guide/kdump/kdump.rst
+++ b/Documentation/admin-guide/kdump/kdump.rst
@@ -570,6 +570,10 @@ encrypted disk volume. User space can interact with
     cat /sys/kernel/config/crash_dm_crypt_keys/count
     2
 
+    # To support CPU/memory hot-plugging, re-use keys already saved to reserved
+    # memory
+    echo true > /sys/kernel/config/crash_dm_crypt_key/reuse
+
 2. Load the dump-capture kernel
 
 3. After the dump-capture kerne get booted, restore the keys to user keyring
diff --git a/kernel/crash_dump_dm_crypt.c b/kernel/crash_dump_dm_crypt.c
index fb25f55f1512..5f4a62389150 100644
--- a/kernel/crash_dump_dm_crypt.c
+++ b/kernel/crash_dump_dm_crypt.c
@@ -28,6 +28,20 @@ static size_t get_keys_header_size(size_t total_keys)
 	return struct_size(keys_header, keys, total_keys);
 }
 
+static void get_keys_from_kdump_reserved_memory(void)
+{
+	struct keys_header *keys_header_loaded;
+
+	arch_kexec_unprotect_crashkres();
+
+	keys_header_loaded = kmap_local_page(pfn_to_page(
+		kexec_crash_image->dm_crypt_keys_addr >> PAGE_SHIFT));
+
+	memcpy(keys_header, keys_header_loaded, get_keys_header_size(key_count));
+	kunmap_local(keys_header_loaded);
+	arch_kexec_protect_crashkres();
+}
+
 static int read_key_from_user_keying(struct dm_crypt_key *dm_key)
 {
 	const struct user_key_payload *ukp;
@@ -150,8 +164,36 @@ static ssize_t config_keys_count_show(struct config_item *item, char *page)
 
 CONFIGFS_ATTR_RO(config_keys_, count);
 
+static bool is_dm_key_reused;
+
+static ssize_t config_keys_reuse_show(struct config_item *item, char *page)
+{
+	return sprintf(page, "%d\n", is_dm_key_reused);
+}
+
+static ssize_t config_keys_reuse_store(struct config_item *item,
+					   const char *page, size_t count)
+{
+	if (!kexec_crash_image || !kexec_crash_image->dm_crypt_keys_addr) {
+		kexec_dprintk(
+			"dm-crypt keys haven't be saved to crash-reserved memory\n");
+		return -EINVAL;
+	}
+
+	if (kstrtobool(page, &is_dm_key_reused))
+		return -EINVAL;
+
+	if (is_dm_key_reused)
+		get_keys_from_kdump_reserved_memory();
+
+	return count;
+}
+
+CONFIGFS_ATTR(config_keys_, reuse);
+
 static struct configfs_attribute *config_keys_attrs[] = {
 	&config_keys_attr_count,
+	&config_keys_attr_reuse,
 	NULL,
 };
 
@@ -238,10 +280,12 @@ int crash_load_dm_crypt_keys(struct kimage *image)
 		return -ENOENT;
 	}
 
-	image->dm_crypt_keys_addr = 0;
-	r = build_keys_header();
-	if (r)
-		return r;
+	if (!is_dm_key_reused) {
+		image->dm_crypt_keys_addr = 0;
+		r = build_keys_header();
+		if (r)
+			return r;
+	}
 
 	kbuf.buffer = keys_header;
 	kbuf.bufsz = get_keys_header_size(key_count);
-- 
2.49.0

