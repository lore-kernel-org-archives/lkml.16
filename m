Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BA4238166
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 21:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748639678; cv=none; b=GFv6NTB0C+G4Pao2YSyILgYQd9JApTxsVA5JT+3/2YRvDBgctZcqg8HW3P10uZ0LlQI80qOg6zMzipz9cII6cuY1s1THTpC/N0sbxeQIarQ2KJVOeAHKV6qnleY0Ze4M8V8mGDq/5EeM2OWWim5tj+6DVe2UWy5X0Ca7H/e4n9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748639678; c=relaxed/simple;
	bh=UVN5Ohry3L3WYdJ1pHnFQnXRqOA1MVq+uAKLCeKTEAo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pCWMmhRuCGKMauel7IY4X4iyXKWAymO/mrlD36/y1xy5kjU2AanYS5Rlyri9e1nZywdjPmf0HUmdZNFSq3Ji1g5SRgJ8y448vsI90wsiF2gSy6XFRUL4nDwOlIk/+YuEZob4P280jvVUqpGWlUCwZb4vELSi/D+aFJQIZHIzkfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OZmG6HV9; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OZmG6HV9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748639675;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4WS+08nhlV2WvmMYpXsg6mUntZyrMxoHBLo5IU6IzGM=;
	b=OZmG6HV9ocMJ/Lb3MQAxQjTe3v9w1F+f+BxkDzj5rHfihzbq6moD0X/kZ0XxYPFdfCda7r
	neiWf+uZ91hkrxemYb5qp3ueeHt8aKOMQi0Cbky0XSGoNNBUBjDdNOMRgzGh5KVvLXTl9m
	j7frqnCaK4R2IH4iNGr9qrlbJwAPkR0=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-488-ZERTgFPFNLKm7W_AXbw61w-1; Fri,
 30 May 2025 17:14:31 -0400
X-MC-Unique: ZERTgFPFNLKm7W_AXbw61w-1
X-Mimecast-MFC-AGG-ID: ZERTgFPFNLKm7W_AXbw61w_1748639670
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id F32241800360;
	Fri, 30 May 2025 21:14:29 +0000 (UTC)
Received: from laptop.mht.redhat.com (unknown [10.17.17.210])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1596030001B7;
	Fri, 30 May 2025 21:14:27 +0000 (UTC)
From: Charles Mirabile <cmirabil@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Charlie Jenkins <charlie@rivosinc.com>,
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	Charles Mirabile <cmirabil@redhat.com>
Subject: [PATCH v1 0/1] fix riscv runtime constant support
Date: Fri, 30 May 2025 17:14:21 -0400
Message-ID: <20250530211422.784415-1-cmirabil@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

I discovered that something broke basic booting on riscv64 for a nommu
kernel with a minimal configuration running on qemu between 6.13 and
current master. The symptom was that the kernel would hang and print
nothing instead of booting normally. I bisected my way to:

commit a44fb5722199 ("riscv: Add runtime constant support")

Analyzing in a debugger, I was able to conclude that the bug was occurring
due to an invalid pointer dereference in `__d_lookup_rcu` trying to access
`dentry_cache`. That variable was at 0x8040f480 but the upper half of the
actual pointer value it was trying to access was filled with garbage.

Looking at the disassembly I saw that in the patched instructions that a
`nop` instruction had replaced both the `lui` and the `addiw` that were
supposed to create the upper half of the pointer so the register was not
initialized. The code responsible for patching does not ensure that at
least one instruction is not replaced with a `nop` if `val` is zero.

To reproduce the bug the following minimal config and initrd can be used:

$ cat ../minimal.config
CONFIG_EXPERT=y
CONFIG_NONPORTABLE=y
CONFIG_KERNEL_UNCOMPRESSED=y
CONFIG_RISCV_M_MODE=y
CONFIG_PRINTK=y
CONFIG_TTY=y
CONFIG_SERIAL_8250=y
CONFIG_SERIAL_8250_CONSOLE=y
CONFIG_SERIAL_OF_PLATFORM=y
CONFIG_BLK_DEV_INITRD=y
CONFIG_BINFMT_ELF_FDPIC=y
CONFIG_POWER_RESET=y
CONFIG_POWER_RESET_SYSCON=y
CONFIG_POWER_RESET_SYSCON_POWEROFF=y
CONFIG_DEBUG_INFO_DWARF5=y
$ cat ../init.s
.text
.global _start
_start:
	li a0, 1
	la a1, .Lmsg
	lui a2, %hi(.Lmsglen)
	addi a2, a2, %lo(.Lmsglen)
	li a7, 64	  # __NR_write
	ecall
	li a0, 0xfee1dead
	li a1, 0x28121969
	li a2, 0x4321fedc # CMD_HALT
	li a7, 142	  # __NR_reboot
	ecall
	unimp
.data
.Lmsg:
.ascii "Hello!\n"
.Lmsglen = . - .Lmsg
$ mkdir ../rootfs
$ riscv64-linux-gnu-gcc -static -shared \
 -ffreestanding -nostdlib -march=rv64i -mabi=lp64 \
 ../init.s -o ../rootfs/init
$ cd ../rootfs && find . | cpio -co > ../rootfs.cpio && cd - >/dev/null
13 blocks
$ export CROSS_COMPILE=riscv64-linux-gnu- ARCH=riscv
$ make KCONFIG_ALLCONFIG=../minimal.config allnoconfig
$ make -j $(nproc)
...
  Kernel: arch/riscv/boot/Image is ready
$ qemu-system-riscv64 -cpu rv64,mmu=off -machine virt -bios none \
 -nographic -no-reboot -net none \
 -kernel arch/riscv/boot/Image -initrd ../rootfs.cpio
...
Run /init as init process
Hello!
reboot: Power down

On current master, nothing will be printed and the qemu command will just
hang (kill with control+a x), but with this patch it will boot normally.

Signed-off-by: Charles Mirabile <cmirabil@redhat.com>

Charles Mirabile (1):
  riscv: fix runtime constant support for nommu kernels

 arch/riscv/include/asm/runtime-const.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.49.0

