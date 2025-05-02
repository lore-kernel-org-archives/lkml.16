Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D3B2F50
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 01:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746148380; cv=none; b=qCV0XsNzZ1+Lh43w2hEd1YKmZzGBkDv9qYPFp/8rr0ywi4agalYZB0/iDdKyJhuhrU1stK5HNiKLZtbZYHX2Cpe1FW+skgYiqVnzmR62owRYe/KixgFRiIwUBJ/14SARo299PHPoTQYW6KRUXo+0B8UgpXTwszQggIDYutMd9Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746148380; c=relaxed/simple;
	bh=QGxgNMJ39+wBybwIZQFP8sRCbG6S4A5FmtK/YXpKQJs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Y7+NkIpywRA6SIlx9vGCPajKTpnHKkH9sTE3BEC0Pyec/JK9OBTBWl7+0r8ZI7G7kfAoPYDemFDFYCU+nc5S/g7jj8hHhzIo8XfkiYdtpdwxgSs41v4qsuKv/wQn9lFZqurhKPyqSNeP7RfokWbFZUm3pCwl9LelvDQ2leWqrCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PAkqPZ7f; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PAkqPZ7f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746148377;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZdB2iAYsLEMWGX01ZWdAK4tZP43EQ5jwSW7YSmWaI0Q=;
	b=PAkqPZ7fCk8IRjvJIprEKvuwyj2Jj+L1ayNNYVnFVEtvttqYEZw+gWA+qp44kQQptw1mkx
	XWeY08hGoA41mLU3V/2zrg73ANrRV28EAwjZpwvoxS798QDa9/d8mzitbR6Ep7f565y4P/
	VQQF1pYcVcj6cDKqRhmhb028U9ko09g=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-580-oiWAowznPjW_4hikMOwBFQ-1; Thu, 01 May 2025 21:12:56 -0400
X-MC-Unique: oiWAowznPjW_4hikMOwBFQ-1
X-Mimecast-MFC-AGG-ID: oiWAowznPjW_4hikMOwBFQ_1746148375
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7395095a505so1194880b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 18:12:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746148375; x=1746753175;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZdB2iAYsLEMWGX01ZWdAK4tZP43EQ5jwSW7YSmWaI0Q=;
        b=WZSxcqIKbaJ6AHJletF63oewzqb+hcTBpm/d0jBJNErtHwAIP1fKtuZckUpgahLQcw
         27HB2u5l14OtTDAmfuWVMrIj8y3c9Icky96/pD+nd2WKN399+b/GnkXoaMEkHKS+gNvi
         0GE9f2lrfkUib9bdDO51A8LqIPgfIIHe4NbDepHZ+n9CGe8PmtkLzziX0Dx8LQomZ6gX
         BhVYQYKazEScfk7IAWoGjijAQ1SRvt7DBA5VnE7M2sUUFzno934A+XnddAzQJU5wn9YW
         NP1PcEZWgdUBmXc9M1+tM6F/8bZF0F+5dNKmoqoQBB4sZig6iA9AQ+hPkp9y8m9ccJJc
         ICnA==
X-Forwarded-Encrypted: i=1; AJvYcCWP0TJBIbmebc31G4O9PdfBwEmbf6+b1orEZcFPko6iVV348yDf5gsm+JQsW/u/uazIuaYzZzCxYDFH9A4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYDw/SK/NcsUPP2NR/SzkRm+hvc3MdMdfzZ2rG9Af/5acBPs16
	s44y/Q7DvrWlJ0cr07SJdDNxpNsessZavqOPBvUXFVOmdHUSQTd0NofGoWnioOF0clsC+0VmZ56
	iYwYXIzL6/AG61WYJ09KtKAZQiNVp3EZAaAuvWFMz8v9KDMA5o0wl1vpemlbing==
X-Gm-Gg: ASbGncte1oh3oQDz2KSu/T+eMUn8jrN54zlFHrknuaXMQldlQuU2qv4wS5SksNHYahf
	xQJBH8o2uwTmFWot4aj+OYmnfmVOJRdYG0D46qRcbvUg1A5N4C5xfIz63ZVjRC6pgzKCmU5cEb+
	v1e91iXPPOQ5pF4gC9NS5wc7ppQwyrc5cX4rjRUt/W59RMOdvlftfguPrjDbq3HiAD77uu0BoPS
	5ZCUuHIiUrkIgqGVhVviTpRiZbUjNtAGAjD1tKEotc9nVE/Nb6jvCXULSUdc/VQxBRDBBpL/vlg
	tTI=
X-Received: by 2002:a05:6a20:6f90:b0:1f5:7280:1cf2 with SMTP id adf61e73a8af0-20cde85980bmr1225137637.12.1746148374911;
        Thu, 01 May 2025 18:12:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSxO1yQtZUfQyFCea8I1FD+G6Q91ehxHY0Xg5z4Eo/7nqFrIpfK6ZevCPz4aXvgEOcz5JQiQ==
X-Received: by 2002:a05:6a20:6f90:b0:1f5:7280:1cf2 with SMTP id adf61e73a8af0-20cde85980bmr1225112637.12.1746148374610;
        Thu, 01 May 2025 18:12:54 -0700 (PDT)
Received: from localhost ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fa85e4f0esm296457a12.61.2025.05.01.18.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 18:12:54 -0700 (PDT)
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
	Arnaud Lefebvre <arnaud.lefebvre@clever-cloud.com>
Subject: [PATCH v9 0/8] Support kdump with LUKS encryption by reusing LUKS volume keys
Date: Fri,  2 May 2025 09:12:34 +0800
Message-ID: <20250502011246.99238-1-coxu@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

LUKS is the standard for Linux disk encryption, widely adopted by users,
and in some cases, such as Confidential VMs, it is a requirement. With 
kdump enabled, when the first kernel crashes, the system can boot into
the kdump/crash kernel to dump the memory image (i.e., /proc/vmcore) 
to a specified target. However, there are two challenges when dumping
vmcore to a LUKS-encrypted device:

 - Kdump kernel may not be able to decrypt the LUKS partition. For some
   machines, a system administrator may not have a chance to enter the
   password to decrypt the device in kdump initramfs after the 1st kernel
   crashes; For cloud confidential VMs, depending on the policy the
   kdump kernel may not be able to unseal the keys with TPM and the
   console virtual keyboard is untrusted.

 - LUKS2 by default use the memory-hard Argon2 key derivation function
   which is quite memory-consuming compared to the limited memory reserved
   for kdump. Take Fedora example, by default, only 256M is reserved for
   systems having memory between 4G-64G. With LUKS enabled, ~1300M needs
   to be reserved for kdump. Note if the memory reserved for kdump can't
   be used by 1st kernel i.e. an user sees ~1300M memory missing in the
   1st kernel.

Besides users (at least for Fedora) usually expect kdump to work out of
the box i.e. no manual password input or custom crashkernel value is
needed. And it doesn't make sense to derivate the keys again in kdump
kernel which seems to be redundant work.

This patch set addresses the above issues by making the LUKS volume keys
persistent for kdump kernel with the help of cryptsetup's new APIs
(--link-vk-to-keyring/--volume-key-keyring). Here is the life cycle of
the kdump copies of LUKS volume keys,

 1. After the 1st kernel loads the initramfs during boot, systemd
    use an user-input passphrase to de-crypt the LUKS volume keys
    or TPM-sealed key and then save the volume keys to specified keyring
    (using the --link-vk-to-keyring API) and the key will expire within
    specified time.

 2. A user space tool (kdump initramfs loader like kdump-utils) create
    key items inside /sys/kernel/config/crash_dm_crypt_keys to inform
    the 1st kernel which keys are needed.

 3. When the kdump initramfs is loaded by the kexec_file_load
    syscall, the 1st kernel will iterate created key items, save the
    keys to kdump reserved memory.

 4. When the 1st kernel crashes and the kdump initramfs is booted, the
    kdump initramfs asks the kdump kernel to create a user key using the
    key stored in kdump reserved memory by writing yes to
    /sys/kernel/crash_dm_crypt_keys/restore. Then the LUKS encrypted
    device is unlocked with libcryptsetup's --volume-key-keyring API.

 5. The system gets rebooted to the 1st kernel after dumping vmcore to
    the LUKS encrypted device is finished

After libcryptsetup saving the LUKS volume keys to specified keyring,
whoever takes this should be responsible for the safety of these copies
of keys. The keys will be saved in the memory area exclusively reserved
for kdump where even the 1st kernel has no direct access. And further
more, two additional protections are added,
 - save the copy randomly in kdump reserved memory as suggested by Jan
 - clear the _PAGE_PRESENT flag of the page that stores the copy as
   suggested by Pingfan

This patch set only supports x86. There will be patches to support other
architectures once this patch set gets merged.

v9
 - check whether key description is set before copying it to resolve the
   issue where the kernel crashes because user space tries to load kdump
   kernel/initrams before writing key description(s) as found by Arnaud
 - take the new kernel parameter dmcryptkeys into consideration when
   checking cmlind buffer size [Arnaud]
 - make CONFIG_CRASH_DM_CRYPT depends on CONFIGFS_FS [Arnaud]
 - update documentation and message logs to indicate logon keys other
   than user keys are accepted
 - bring back __set_memory_prot
 - add Acked-by tag from Baoquan
 - rebase onto 6.15.0-rc4+

v8
 - improve documentation [Randy]
 - rebase onto 6.14.0-rc1

v7
 - Baoquan
   - differentiate between failing to get dm crypt keys and no dm crypt keys
   - add code comments, change function name and etc. to improve code readability
 - add documentation for configfs API [Dave]
 - fix building error found by kernel test robot

v6
 - Baoquan
   - support AMD SEV
   - drop uncessary keys_header_size
   - improve commit message of [PATCH 4/7]
 
 - Greg
   - switch to configfs
   - move ifdef from .c to .h files and rework kexec_random_start
   - use tab instead of space for appended code comment
 
 - Process key description in a more flexible way to address problems
   found by Ondrej
 - improve cover letter
 - fix an compilation error as found by kernel test robot 

v5
 - Baoquan
   - limit the feature of placing kexec_buf randomly to kdump (CONFIG_CRASH_DUMP)
   - add documentation for added sysfs API 
   - allow to re-send init command to support the case of user switching to
     a different LUKS-encrypted target
   - make CONFIG_CRASH_DM_CRYPT depends on CONFIG_DM_CRYPT
   - check if the number of keys exceed KEY_NUM_MAX
   - rename (struct keys_header).key_count as (struct keys_header).total_keys
     to improve code readability
   - improve commit message
   - fix the failure of calling crash_exclude_mem_range (there is a split
     of mem_range)
   - use ret instead of r as return code
 
 - Greg
   - add documentation for added sysfs API 
   - avoid spamming kernel logs 
   - fix a buffer overflow issue
   - keep the state enums synced up with the string values
   - use sysfs_emit other than sprintf
   - explain KEY_NUM_MAX and KEY_SIZE_MAX
   - s/EXPORT_SYMBOL_GPL/EXPORT_SYMBOL/g
   - improve code readability
 
 - Rebase onto latest Linus tree


v4
- rebase onto latest Linus tree so Baoquan can apply the patches for
  code review
- fix kernel test robot warnings

v3
 - Support CPU/memory hot-plugging [Baoquan]
 - Don't save the keys temporarily to simplify the implementation [Baoquan]
 - Support multiple LUKS encrypted volumes
 - Read logon key instead of user key to improve security [Ondrej]
 - A kernel config option CRASH_DM_CRYPT for this feature (disabled by default)
 - Fix warnings found by kernel test robot
 - Rebase the code onto 6.9.0-rc5+

v2
 - work together with libscryptsetup's --link-vk-to-keyring/--volume-key-keyring APIs [Milan and Ondrej]
 - add the case where console virtual keyboard is untrusted for confidential VM
 - use dm_crypt_key instead of LUKS volume key [Milan and Eric]
 - fix some code format issues
 - don't move "struct kexec_segment" declaration
 - Rebase the code onto latest Linus tree (6.7.0)

v1
 - "Put the luks key handling related to crash_dump out into a separate
   file kernel/crash_dump_luks.c" [Baoquan]
 - Put the generic luks handling code before the x86 specific code to
   make it easier for other arches to follow suit [Baoquan]
 - Use phys_to_virt instead of "pfn -> page -> vaddr" [Dave Hansen]
 - Drop the RFC prefix [Dave Young]
 - Rebase the code onto latest Linus tree (6.4.0-rc4)

RFC v2
 - libcryptsetup interacts with the kernel via sysfs instead of "hacking"
   dm-crypt
   - to save a kdump copy of the LUKS volume key in 1st kernel
   - to add a logon key using the copy for libcryptsetup in kdump kernel [Milan]
   - to avoid the incorrect usage of LUKS master key in dm-crypt [Milan]
 - save the kdump copy of LUKS volume key randomly [Jan]
 - mark the kdump copy inaccessible [Pingfan]
 - Miscellaneous
   - explain when operations related to the LUKS volume key happen [Jan]
   - s/master key/volume key/g
   - use crash_ instead of kexec_ as function prefix
   - fix commit subject prefixes e.g. "x86, kdump" to x86/crash

Coiby Xu (8):
  kexec_file: allow to place kexec_buf randomly
  crash_dump: make dm crypt keys persist for the kdump kernel
  crash_dump: store dm crypt keys in kdump reserved memory
  crash_dump: reuse saved dm crypt keys for CPU/memory hot-plugging
  crash_dump: retrieve dm crypt keys in kdump kernel
  Revert "x86/mm: Remove unused __set_memory_prot()"
  x86/crash: pass dm crypt keys to kdump kernel
  x86/crash: make the page that stores the dm crypt keys inaccessible

 Documentation/admin-guide/kdump/kdump.rst |  32 ++
 arch/x86/include/asm/set_memory.h         |   1 +
 arch/x86/kernel/crash.c                   |  26 +-
 arch/x86/kernel/kexec-bzimage64.c         |  21 +
 arch/x86/kernel/machine_kexec_64.c        |  22 +
 arch/x86/mm/pat/set_memory.c              |  13 +
 include/linux/crash_core.h                |   7 +-
 include/linux/crash_dump.h                |   2 +
 include/linux/kexec.h                     |  34 ++
 kernel/Kconfig.kexec                      |  11 +
 kernel/Makefile                           |   1 +
 kernel/crash_dump_dm_crypt.c              | 464 ++++++++++++++++++++++
 kernel/kexec_file.c                       |   3 +
 13 files changed, 634 insertions(+), 3 deletions(-)
 create mode 100644 kernel/crash_dump_dm_crypt.c


base-commit: b4432656b36e5cc1d50a1f2dc15357543add530e
-- 
2.49.0

