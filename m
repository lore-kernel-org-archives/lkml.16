Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E4818787A
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 08:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738915708; cv=none; b=A3G0lu3m58H5EPcxAxmfQtpu8wC3ZRNIQZu6VjMppI+Q8eHwuL/DyYjJgIxVEaZeaJGxu7yoDYC06HAuZCZC+9rMS7xk++m+3koes6oXpBOfZRwAUzvSq7OX6oJ3uFf4vqiCin9xAhamMjxxXB/jkICx+OKdHsOABOG5u80UIqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738915708; c=relaxed/simple;
	bh=mpEGSt07RZX2dImxOdP3Ux00SlbEfCvE97g8B4BOtbI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZLZanoZJbJQe/BobWBUtHNkdw9Dl1g9R0O8FoChjJcomWURtPhUjGstBFrfkWhU0bDVkQlwYqgsA/SU2EzQ1DsqHgz8N3FwNmxA7626YLIqh0uYqI6cPcwsacarojqIesiv5sZPQC7+HCYNhz2yE2PQp/T48NBvOHOiBbpIKOgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=d34MHLLG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="d34MHLLG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738915705;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ujwHAC9Gef4mfu/Xct48Iff5HJOsHCZbGuw9OkujCjQ=;
	b=d34MHLLG73CNGlENe/VrpK0YPEcNJ0XIW9OkyI5Wlp3Ub03ygqz4w/V8Uv82ZRdOErYKs8
	CRk+8M+kXJGoFEI3U2KPjH3B0V2r/NIBgnnLQpGHw78DTyCs33QHbpjv3aSOxBOQus4mRY
	oLLPYcnNkvmogOPijdB7CP1U7BuLJKk=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-541-B-pL0NxmO-aXNOI8mLfidQ-1; Fri, 07 Feb 2025 03:08:23 -0500
X-MC-Unique: B-pL0NxmO-aXNOI8mLfidQ-1
X-Mimecast-MFC-AGG-ID: B-pL0NxmO-aXNOI8mLfidQ
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2f2a9f056a8so3743252a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 00:08:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738915703; x=1739520503;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ujwHAC9Gef4mfu/Xct48Iff5HJOsHCZbGuw9OkujCjQ=;
        b=mjKizuH74IkruqdUNXtPZvsy0dlOH3BEc3m/GalYzFqxSwl6lNLaWUdUQgG1PGuFnz
         NqQ2bE+PvC6Vmvsq6lPB8eYJOnB3YuDu19FWCgMCObIJlLqG0POCi8y4Yy6leXrt20zA
         ZU+lWOL6mKb5Lzl2DvOnQcGHIEevknAVsxv1Wd1yPPXG7OpP+hI+ua4kTkOtwBFqwZTT
         4vlfsDlBdRvUlc51IIMfoEXqezOgEj77BnIVmjNLJkBrMyFa4jMZxEzHuiwlyGybpwNM
         AGidldb8Gso2e3+MxaPJcbGHWtAge9/CAA/x5Z4UZVHE7MRPhPuDLXC6X1OkxeDaF8Nk
         XtSw==
X-Forwarded-Encrypted: i=1; AJvYcCV+hJOLDcc0a1Eu4a6JFIEe/ibKTZpvyvb7z9CuY9jk83NAv+gUr0/vYLwMbpuBcVv5ZFrDLgRlajbBjp4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2nVf+lKc2ad10b36QdLAYsAZl9g7patHkXnoGn9UefIWDhjy0
	sj3BHEH5i/0J6SujOAuGgiuYZKVIAwyB5ev0AawozZLiiv2R6InsgqOml7V9/Fuf2Ew/Aq2G7J1
	UyT5Oyu1CvIxYRVGy6IQov8KHdb7mlbPaSeKCLcLmSuHr8FZCSSCbtDA7urvdPA==
X-Gm-Gg: ASbGnctIPmR5MuMJXtckysNtOhj4aCg/ndLMrwy46g3MY6PqjSfDZQCs1efW9RWWc1g
	tZPLpo9cTEYGA1L5z21lndiqFBfK3D/RUO1NFaxH5in78OFpEo3LRG3Z5T4ny3Cw3MdBDZZY4pV
	XaP/Eum+Vb5FUGiF4W+S+G8DeT4vDv7GSZse3UX5QRGYfIfLAUXEELNge8x6Jeg6d4MoC5MCyoE
	84cMsxm0QBKZRhymNWFxWls9jivvRypm+5rXJF78Uwgy90byR09ybFNcA3ejPLOM9ABfddk
X-Received: by 2002:a17:90b:6cd:b0:2ee:7698:e565 with SMTP id 98e67ed59e1d1-2fa23f6e5e6mr3552905a91.8.1738915702787;
        Fri, 07 Feb 2025 00:08:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHKWnies4K7LMdP6LpPEhh/kOCHXwNY2ZTzMPyRp7Jqt2AusQjptIPz38owJporr+hd1jPRJg==
X-Received: by 2002:a17:90b:6cd:b0:2ee:7698:e565 with SMTP id 98e67ed59e1d1-2fa23f6e5e6mr3552868a91.8.1738915702365;
        Fri, 07 Feb 2025 00:08:22 -0800 (PST)
Received: from localhost ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa15ab5b26sm2032584a91.20.2025.02.07.00.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 00:08:21 -0800 (PST)
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
	Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: [PATCH v8 0/7] Support kdump with LUKS encryption by reusing LUKS volume keys
Date: Fri,  7 Feb 2025 16:08:08 +0800
Message-ID: <20250207080818.129165-1-coxu@redhat.com>
X-Mailer: git-send-email 2.48.1
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


Coiby Xu (7):
  kexec_file: allow to place kexec_buf randomly
  crash_dump: make dm crypt keys persist for the kdump kernel
  crash_dump: store dm crypt keys in kdump reserved memory
  crash_dump: reuse saved dm crypt keys for CPU/memory hot-plugging
  crash_dump: retrieve dm crypt keys in kdump kernel
  x86/crash: pass dm crypt keys to kdump kernel
  x86/crash: make the page that stores the dm crypt keys inaccessible

 Documentation/admin-guide/kdump/kdump.rst |  32 ++
 arch/x86/kernel/crash.c                   |  26 +-
 arch/x86/kernel/kexec-bzimage64.c         |  11 +
 arch/x86/kernel/machine_kexec_64.c        |  22 ++
 include/linux/crash_core.h                |   7 +-
 include/linux/crash_dump.h                |   2 +
 include/linux/kexec.h                     |  34 ++
 kernel/Kconfig.kexec                      |  10 +
 kernel/Makefile                           |   1 +
 kernel/crash_dump_dm_crypt.c              | 459 ++++++++++++++++++++++
 kernel/kexec_file.c                       |   3 +
 11 files changed, 604 insertions(+), 3 deletions(-)
 create mode 100644 kernel/crash_dump_dm_crypt.c


base-commit: bb066fe812d6fb3a9d01c073d9f1e2fd5a63403b
-- 
2.48.1

