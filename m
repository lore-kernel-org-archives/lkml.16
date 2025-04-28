Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17DDD623
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 09:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745830969; cv=none; b=VysJW3lvEfmsU6/Cp8MAY8gfAo9MgsVSyiU7bQurXeqlmis4q1p0ojoGGqDdXTvfs5YQL03I5Ms0trt0zFN1jMjo2AeqvGd4Qktm540Vd3XQz+MdF7e8TBwkZuxyIZN5RuhuJd9gxBTOzt46zDm4cbgD960pICm7bwF67GONTNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745830969; c=relaxed/simple;
	bh=74/MbBqrMTTvhbuFjuW+LPkMaDWw9ien0D5I8o5xiIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KTwc52mAQ7tURJjZQwzVWyPyq03Il4SCA2xSXSpTXdvWJ1Ls6W3igGvym6e7aRDhONB3ITGX0jOK7PvILdluJX0ddKNjSUxxXtse9QdBnLSBMSDKLvVx6M3Niftq/sgr4Bc7ZYjfzlQrZmlHW/D6A1d6+JbqIjfT2NY1FRXbIx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OWMfoYl7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OWMfoYl7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745830965;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=M8kUgbIokMiz9Jw7VxennqbcBBMTM/mo00S7MGV/Zj4=;
	b=OWMfoYl7zRLYZt2RNnaPDwj1/BYSQjdJowzK9g4GlEhLa1l8pPwrv3qz0hA2KqHCBItLgq
	9b2WU4hGWK3mFins+MhuwkqECQvA+jk4pmJtjMsu3jiNX5ANuPo1meaVeaxsOfvpg4CQ+g
	8JczSR1PeAEc95/LYYAfp0LE2jztiCQ=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-214-NxD5FtKvNluML30Y0j8laQ-1; Mon, 28 Apr 2025 05:02:44 -0400
X-MC-Unique: NxD5FtKvNluML30Y0j8laQ-1
X-Mimecast-MFC-AGG-ID: NxD5FtKvNluML30Y0j8laQ_1745830963
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-224347aef79so65649985ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 02:02:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745830963; x=1746435763;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M8kUgbIokMiz9Jw7VxennqbcBBMTM/mo00S7MGV/Zj4=;
        b=Sfkq1Oy6RBM7ie68z/W0ag0RS8YVLdKLQuAKvYi39QXZ5vjvkBTOVrfvd4mEy1VtFZ
         oQMnH3giwrT9VLVaowZq8+9p8OxMuCF9VIS+BOZJ2wBoyHSHsROUeLHzLGCxlNuBJMkE
         yj5YtN5vxrXZj3qvbp287wYNFgbvS5mgaFNnxT7xLU8uTKY/Tx9791ZS1xcRIz9Xng5N
         c1ybyLxRQsboByKFo+QVzwL6MwxNbeWzBeih1+MEyrZHa7BYWL23CFX0AA9NC3RjJfRx
         mK3m2rJniC4BZCxJhFCV3TrHBJsRdPgUAilZKnNMWA6k2KkBaph60aHqsT3y6O0oT/zc
         M2cQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuZZvbWiqmXWp569QdFT7qmmcDNVtJqDDb1qqd7uuza2H2NAwICV2ErJnUTcBBuV+25Nz6dd9sVdqEOQ8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8x5I/Scq59KA6hlY/a2a22YW2AGDt3L0hoWbM3xH3iQXj2s3c
	qZSPYsDMJOEOH4oXUdjq+WN6r6VjUd8eMdaL1E6akpuuDMQZM3qhrqHAOdGtjfwnKGP8HlsMbAd
	BFYHJL6gNYn2oeUBaG/rkryXtFY/aSgORLhzz46rlvz8jyn8I5YkgLjC02/+R8A==
X-Gm-Gg: ASbGncubIK4Dux7AMgaLlxtJt9n5eOA77hhpW4Zjy75L3WO+AtdYkggWqD18l7aUFbI
	zS7AAQNtffCjzAothm+HvWDihMrIcAolE/D7i3bAjzxBn4TmXVh5xF/1CaPEa1QXqzllGC00OX+
	eGMn+EoyDr+ctkhCjms8NjvVbHnyeJ/iMwPZkmelr4AU2yx3fH13+9mLwZD8f4+Cot8JI8MyP58
	DUu2VLkA1Hh899pcR4prp9v8EZDjhwCQF7uYSt5Uwi6n7CwileY74DJdTv2wcDdZdD7HwTPzqzv
	DLU=
X-Received: by 2002:a17:903:2447:b0:22c:336f:cb54 with SMTP id d9443c01a7336-22dbf5f0ff2mr161824755ad.29.1745830963073;
        Mon, 28 Apr 2025 02:02:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFea8a1UJvVL7aa7XKEssck5WpqU/UQnVQt7spwDMdFstWIX2pY78pl0ptewWOvrwuMoyK5Ug==
X-Received: by 2002:a17:903:2447:b0:22c:336f:cb54 with SMTP id d9443c01a7336-22dbf5f0ff2mr161824305ad.29.1745830962625;
        Mon, 28 Apr 2025 02:02:42 -0700 (PDT)
Received: from localhost ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db50e7b2csm77203305ad.129.2025.04.28.02.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 02:02:42 -0700 (PDT)
Date: Mon, 28 Apr 2025 17:02:23 +0800
From: Coiby Xu <coxu@redhat.com>
To: Arnaud Lefebvre <arnaud.lefebvre@clever-cloud.com>
Cc: kexec@lists.infradead.org, Ondrej Kozina <okozina@redhat.com>, 
	Milan Broz <gmazyland@gmail.com>, Thomas Staudt <tstaudt@de.ibm.com>, 
	Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>, Kairui Song <ryncsn@gmail.com>, 
	Pingfan Liu <kernelfans@gmail.com>, Baoquan He <bhe@redhat.com>, Dave Young <dyoung@redhat.com>, 
	linux-kernel@vger.kernel.org, x86@kernel.org, Dave Hansen <dave.hansen@intel.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: Re: [PATCH v8 0/7] Support kdump with LUKS encryption by reusing
 LUKS volume keys
Message-ID: <ywhl4n5d4oa44a2nzu26sjdgs6k5xwdwidtmdfsik6v533rvuz@bnu3azjvzioa>
References: <20250207080818.129165-1-coxu@redhat.com>
 <kofi6m743pg6hrahjx3vj7efairnpiq5pqmgql2cwg6lnz2cmw@ntdymi2egzro>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <kofi6m743pg6hrahjx3vj7efairnpiq5pqmgql2cwg6lnz2cmw@ntdymi2egzro>

On Thu, Apr 24, 2025 at 02:08:55AM +0200, Arnaud Lefebvre wrote:
>On Fri, Feb 07, 2025 at 04:08:08PM +0800, Coiby Xu wrote:
>>LUKS is the standard for Linux disk encryption, widely adopted by users,
>>and in some cases, such as Confidential VMs, it is a requirement. With
>>kdump enabled, when the first kernel crashes, the system can boot into
>>the kdump/crash kernel to dump the memory image (i.e., /proc/vmcore)
>>to a specified target. However, there are two challenges when dumping
>>vmcore to a LUKS-encrypted device:
>>
>>- Kdump kernel may not be able to decrypt the LUKS partition. For some
>>  machines, a system administrator may not have a chance to enter the
>>  password to decrypt the device in kdump initramfs after the 1st kernel
>>  crashes; For cloud confidential VMs, depending on the policy the
>>  kdump kernel may not be able to unseal the keys with TPM and the
>>  console virtual keyboard is untrusted.
>>
>>- LUKS2 by default use the memory-hard Argon2 key derivation function
>>  which is quite memory-consuming compared to the limited memory reserved
>>  for kdump. Take Fedora example, by default, only 256M is reserved for
>>  systems having memory between 4G-64G. With LUKS enabled, ~1300M needs
>>  to be reserved for kdump. Note if the memory reserved for kdump can't
>>  be used by 1st kernel i.e. an user sees ~1300M memory missing in the
>>  1st kernel.
>>
>>Besides users (at least for Fedora) usually expect kdump to work out of
>>the box i.e. no manual password input or custom crashkernel value is
>>needed. And it doesn't make sense to derivate the keys again in kdump
>>kernel which seems to be redundant work.
>>
>>This patch set addresses the above issues by making the LUKS volume keys
>>persistent for kdump kernel with the help of cryptsetup's new APIs
>>(--link-vk-to-keyring/--volume-key-keyring). Here is the life cycle of
>>the kdump copies of LUKS volume keys,
>>
>>1. After the 1st kernel loads the initramfs during boot, systemd
>>   use an user-input passphrase to de-crypt the LUKS volume keys
>>   or TPM-sealed key and then save the volume keys to specified keyring
>>   (using the --link-vk-to-keyring API) and the key will expire within
>>   specified time.
>>
>>2. A user space tool (kdump initramfs loader like kdump-utils) create
>>   key items inside /sys/kernel/config/crash_dm_crypt_keys to inform
>>   the 1st kernel which keys are needed.
>>
>>3. When the kdump initramfs is loaded by the kexec_file_load
>>   syscall, the 1st kernel will iterate created key items, save the
>>   keys to kdump reserved memory.
>>
>>4. When the 1st kernel crashes and the kdump initramfs is booted, the
>>   kdump initramfs asks the kdump kernel to create a user key using the
>>   key stored in kdump reserved memory by writing yes to
>>   /sys/kernel/crash_dm_crypt_keys/restore. Then the LUKS encrypted
>>   device is unlocked with libcryptsetup's --volume-key-keyring API.
>>
>>5. The system gets rebooted to the 1st kernel after dumping vmcore to
>>   the LUKS encrypted device is finished
>>
>>After libcryptsetup saving the LUKS volume keys to specified keyring,
>>whoever takes this should be responsible for the safety of these copies
>>of keys. The keys will be saved in the memory area exclusively reserved
>>for kdump where even the 1st kernel has no direct access. And further
>>more, two additional protections are added,
>>- save the copy randomly in kdump reserved memory as suggested by Jan
>>- clear the _PAGE_PRESENT flag of the page that stores the copy as
>>  suggested by Pingfan
>>
>>This patch set only supports x86. There will be patches to support other
>>architectures once this patch set gets merged.
>>
>
>I'm not sure what's the problem here but I can reliably trigger a kernel
>panic on a qemu VM + custom kernel (compiled from
>bb066fe812d6fb3a9d01c073d9f1e2fd5a63403b + your patches).

Hi Arnaud,

Thanks for testing the patches, finding this issue and also sharing the
details to reproduce it!

>
>When I configure the crash configfs and call kexec in a systemd service
>using ExecStart=, the panic occurs when I start the service:
>
>~ # cat /etc/systemd/system/my-kexec.service
>[Unit]
>Description=kexec loading for the crash capture kernel
>
>[Service]
>Type=oneshot
>ExecStart=/usr/bin/mkdir /sys/kernel/config/crash_dm_crypt_keys/mykey
>ExecStart=/usr/bin/echo cryptsetup:mykey >/sys/kernel/config/crash_dm_crypt_keys/mykey/description
>ExecStart=/usr/host/bin/kexec --debug --load-panic /linux-hv --initrd /crash-initrd
>KeyringMode=shared

Can you try putting the above commands into a script e.g.
/usr/local/bin/my-kexec.sh and then using
ExecStart=/usr/local/bin/my-kexec.sh
so I can be more sure that I've reproduced your issue?

>
>[Install]
>WantedBy=default.target
>
>
>Starting the service:
>
>~ # systemctl start my-kexec.service
>kexec_file: kernel: 00000000ace85dcc kernel_size: 0x16e3000
>crash_core: Crash PT_LOAD ELF header. phdr=00000000d08940fa
>vaddr=0xffff888000100000, paddr=0x100000, sz=0x700000 e_phnum=11
>p_offset=0x100000
>crash_core: Crash PT_LOAD ELF header. phdr=00000000304ef570
>vaddr=0xffff888000808000, paddr=0x808000, sz=0x3000 e_phnum=12
>p_offset=0x808000
>crash_core: Crash PT_LOAD ELF header. phdr=000000000275e248
>vaddr=0xffff88800080c000, paddr=0x80c000, sz=0x5000 e_phnum=13
>p_offset=0x80c000
>crash_core: Crash PT_LOAD ELF header. phdr=000000004e47ca09
>vaddr=0xffff888000900000, paddr=0x900000, sz=0xa5700000 e_phnum=14
>p_offset=0x900000
>crash_core: Crash PT_LOAD ELF header. phdr=00000000e56c8350
>vaddr=0xffff8880b6000000, paddr=0xb6000000, sz=0x7d51018 e_phnum=15
>p_offset=0xb6000000
>crash_core: Crash PT_LOAD ELF header. phdr=0000000099d67ff3
>vaddr=0xffff8880bdd51018, paddr=0xbdd51018, sz=0x27440 e_phnum=16
>p_offset=0xbdd51018
>crash_core: Crash PT_LOAD ELF header. phdr=00000000461a2f21
>vaddr=0xffff8880bdd78458, paddr=0xbdd78458, sz=0xbc0 e_phnum=17
>p_offset=0xbdd78458
>crash_core: Crash PT_LOAD ELF header. phdr=0000000058149b54
>vaddr=0xffff8880bdd79018, paddr=0xbdd79018, sz=0x9a40 e_phnum=18
>p_offset=0xbdd79018
>crash_core: Crash PT_LOAD ELF header. phdr=000000001e30ff2c
>vaddr=0xffff8880bdd82a58, paddr=0xbdd82a58, sz=0xdbc5a8 e_phnum=19
>p_offset=0xbdd82a58
>crash_core: Crash PT_LOAD ELF header. phdr=00000000e67a9768
>vaddr=0xffff8880bec00000, paddr=0xbec00000, sz=0xaed000 e_phnum=20
>p_offset=0xbec00000
>crash_core: Crash PT_LOAD ELF header. phdr=000000005909c4c6
>vaddr=0xffff8880bf9ff000, paddr=0xbf9ff000, sz=0x453000 e_phnum=21
>p_offset=0xbf9ff000
>crash_core: Crash PT_LOAD ELF header. phdr=00000000473d74ef
>vaddr=0xffff8880bfe58000, paddr=0xbfe58000, sz=0x64000 e_phnum=22
>p_offset=0xbfe58000
>crash_core: Crash PT_LOAD ELF header. phdr=00000000abde8123
>vaddr=0xffff888100000000, paddr=0x100000000, sz=0x23f000000 e_phnum=23
>p_offset=0x100000000
>crash_core: Crash PT_LOAD ELF header. phdr=00000000bda3e0bf
>vaddr=0xffff88843f000000, paddr=0x43f000000, sz=0x1000000 e_phnum=24
>p_offset=0x43f000000
>kexec: Loaded ELF headers at 0x33f000000 bufsz=0x1000 memsz=0xe1000
>BUG: kernel NULL pointer dereference, address: 0000000000000000
>#PF: supervisor read access in kernel mode
>#PF: error_code(0x0000) - not-present page
>PGD 0 P4D 0
>Oops: Oops: 0000 [#1] SMP NOPTI
>CPU: 5 UID: 0 PID: 3812 Comm: kexec Not tainted 6.14.0-rc1+ #20
>Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 2025.02-6
>04/08/2025
>RIP: 0010:sized_strscpy+0x71/0x150
>Code: b9 80 80 80 80 80 80 80 80 48 c1 e8 03 48 8d 1c c5 08 00 00 00 31 c0 eb
>11
>48 89 34 07 48 83 c0 08 48 39 d8 0f 84 83 00 00 00 <49> 8b 34 00 4a 8d 14 1e 49
>89 f2 49 f7 d2 4c 21 d2 4c 8d 14 07 4c
>RSP: 0018:ffffc9000420fc68 EFLAGS: 00010246
>RAX: 0000000000000000 RBX: 0000000000000080 RCX: 0000000000000080
>RDX: 0000000000000080 RSI: 0000000000000000 RDI: ffff8881030ec808
>RBP: ffff888109724000 R08: 0000000000000000 R09: 8080808080808080
>R10: ffffc9000420fc78 R11: fefefefefefefeff R12: ffffc90004219000
>R13: ffff888104a80000 R14: 0000000000000008 R15: 0000000000000000
>FS:  00007f09ea73f740(0000) GS:ffff88843fc80000(0000) knlGS:0000000000000000
>CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>CR2: 0000000000000000 CR3: 0000000120760002 CR4: 0000000000772ef0
>PKRU: 55555554
>Call Trace:
> <TASK>
> ? __die+0x23/0x60
> ? page_fault_oops+0x177/0x510
> ? _prb_read_valid+0x2e7/0x370
> ? exc_page_fault+0x6f/0x130
> ? asm_exc_page_fault+0x26/0x30
> ? sized_strscpy+0x71/0x150
> crash_load_dm_crypt_keys+0x1bc/0x370
> bzImage64_load+0x41b/0xa30
> __do_sys_kexec_file_load+0x2af/0x8a0
> do_syscall_64+0x4b/0x110
> entry_SYSCALL_64_after_hwframe+0x76/0x7e
>RIP: 0033:0x7f09ea848d6d
>Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 89 f8 48 89 f7 48
>89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01
>c3 48 8b 0d 6b 70 0d 00 f7 d8 64 89 01 48
>RSP: 002b:00007fff8cf979e8 EFLAGS: 00000206 ORIG_RAX: 0000000000000140
>RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f09ea848d6d
>RDX: 0000000000000001 RSI: 0000000000000004 RDI: 0000000000000003
>RBP: 0000000000000003 R08: 000000000000000a R09: 00007fff8cf97a10
>R10: 000055de70eee9a0 R11: 0000000000000206 R12: 0000000000000003
>R13: 00007fff8cf97d08 R14: 000055de4c336448 R15: 0000000000000004
> </TASK>
>CR2: 0000000000000000
>---[ end trace 0000000000000000 ]---
>RIP: 0010:sized_strscpy+0x71/0x150
>Code: b9 80 80 80 80 80 80 80 80 48 c1 e8 03 48 8d 1c c5 08 00 00 00 31 c0 eb
>11 48 89 34 07 48 83 c0 08 48 39 d8 0f 84 83 00 00 00 <49> 8b 34 00 4a 8d 14 1e
>49 89 f2 49 f7 d2 4c 21 d2 4c 8d 14 07 4c
>RSP: 0018:ffffc9000420fc68 EFLAGS: 00010246
>RAX: 0000000000000000 RBX: 0000000000000080 RCX: 0000000000000080
>RDX: 0000000000000080 RSI: 0000000000000000 RDI: ffff8881030ec808
>RBP: ffff888109724000 R08: 0000000000000000 R09: 8080808080808080
>R10: ffffc9000420fc78 R11: fefefefefefefeff R12: ffffc90004219000
>R13: ffff888104a80000 R14: 0000000000000008 R15: 0000000000000000
>FS:  00007f09ea73f740(0000) GS:ffff88843fc80000(0000) knlGS:0000000000000000
>CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>CR2: 0000000000000000 CR3: 0000000120760002 CR4: 0000000000772ef0
>PKRU: 55555554
>Kernel panic - not syncing: Fatal exception
>Kernel Offset: disabled
>
>
>Calling a script that does the same thing works fine and loads the keys
>correctly:
>
>[Service]
>ExecStart=/root/kexec.sh
>
>~ # cat /root/kexec.sh
>#!/bin/bash
>
>mkdir /sys/kernel/config/crash_dm_crypt_keys/mykey
>echo cryptsetup:mykey > /sys/kernel/config/crash_dm_crypt_keys/mykey/description
>/usr/host/bin/kexec --debug --load-panic /linux-hv --initrd /crash-initrd
>
>If that's any help, my crypttab:
>
>~ # cat /etc/crypttab
>root UUID=8001fca4-2e54-48e9-9235-031c19fc6e36 none luks,link-volume-key=@u::%logon:cryptsetup:mykey
>
>If you can't reproduce, I can help track this. Just let me know if you need
>any help.
>

-- 
Best regards,
Coiby

