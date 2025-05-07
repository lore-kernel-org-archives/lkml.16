Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D6728DEFA
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 17:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746640554; cv=none; b=O5eipD7rJsoXQd6jo037uDSNX3gaxud7hu057U0S0DSmthau26BANQbNdUtjlSKi01B2mpsfZeiPpwz1iMPz34L+efquSWYuPO+XxIdftVUzoZQ3/MLWdKKv/N9M8N08vnrDIfzfaHmE9pcr0miifTknuFuaekr37+GwipxBllA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746640554; c=relaxed/simple;
	bh=VAfblj0Tr88z74O7faMRLO5k7+WTYD/K9PTxlRLw0ig=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oW/6TaorUrbz2Pwst+EaXdUA25lKfJxi+Ex/lCqY3QpXUoswRW5iFVoiuM8lQtWkunHvj1B9sg3jRezesIOXGmeegihhqFf4bUQEc5i1I1GzQk8LuP4GQJBu2KBnfZY2LAOoFBnqbav3kRa1qpoDOAmhBzQDDK6l93dvHUs9R60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=KTz/pmCc; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="KTz/pmCc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=YIY43
	qYBD99OWzeg8wKW1sLnzHXeQ++VFJkFM35Tleg=; b=KTz/pmCckYv29InklcU2/
	Z5SijtOUfr0x6f17gNenc8TyLENfxnkm0q2f99p3n7EM4jU+2REV+JDmaykAoCjS
	ZxvW5HGCDrcsoNDO3mOXsj0owRXrT3asm5T88zQMmlXhUQLAsQB8vqcJUpGTdsrW
	uN0reg2sbpoOBD1WO7eiRQ=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wBXkbt1nhtoqgIsFA--.21859S4;
	Thu, 08 May 2025 01:55:17 +0800 (CST)
From: David Wang <00107082@163.com>
To: surenb@google.com,
	kent.overstreet@linux.dev,
	akpm@linux-foundation.org
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	David Wang <00107082@163.com>
Subject: [PATCH] alloc_tag: avoid mem alloc and iter reset when reading allocinfo
Date: Thu,  8 May 2025 01:55:00 +0800
Message-Id: <20250507175500.204569-1-00107082@163.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wBXkbt1nhtoqgIsFA--.21859S4
X-Coremail-Antispam: 1Uf129KBjvAXoW3Cr4fXF48CF4DWr47AF1kKrg_yoW8Jw15Xo
	ZrWrWvva97WFnxJF98CF1jqws8XrykC3Z3Arn3Xryavr98K3Z5Zr93Kr15X395JF1UCw18
	Wasakr1UGwn8J3s7n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjTR7KIEDUUUU
X-CM-SenderInfo: qqqrilqqysqiywtou0bp/xtbB0g1GqmgbmJWIvgABs6

---
The patch is not complete, just want to get feedbacks whether this
worth carrying on.
---
When reading /proc/allocinfo, for each read syscall, seq_file would
invoke start/stop callbacks. In start callback, a memory is alloced
to store iterator and the iterator would restart from beginning to
walk to its previous position.
Each seq_file read() takes at most 4096 bytes, even read with a larger
user space buffer, meaning read out /proc/allocinfo, tens of read
syscalls are needed. For example, a 306036 bytes allocinfo files need
76 reads:

$ sudo cat /proc/allocinfo  | wc
   3964   16678  306036

For those n=3964 lines, each read takes about m=3964/76=52 lines,
the iter would be rewinding:
 m    steps on 1st read,
 2*m  steps on 2nd read
 3*m  steps on 3rd read
...
 n  steps on the last read
totally, the iterator would be iterated O(n*n/m) times.
(Each read would take more time than previous one.)

To use a private data alloced when /proc/allocinfo is opened,
the n/m memory alloction could be avoid, and there is no need
to restart the iterator from very beginning everytime.
So only 1 memory allocation and n steps for iterating are needed.
(Only when module changed, the iterator should be invalidated and
restart.)

Timings before:
	$ time cat /proc/allocinfo  > /dev/null

	real	0m0.007s
	user	0m0.000s
	sys	0m0.007s
read-syscalls get slower and slower:
	read(3, "allocinfo - version: 1.0\n#     <"..., 131072) = 4085 <0.000062>
	...
	read(3, "           0        0 drivers/gp"..., 131072) = 4046 <0.000135>
	read(3, "           0        0 sound/core"..., 131072) = 4021 <0.000150>
	...

and with the change:
	$ time cat /proc/allocinfo  > /dev/null

	real	0m0.004s
	user	0m0.000s
	sys	0m0.003s
7ms drop to 4ms, more friendly to monitoring tools.

Detailed strace stats before the change:
	$ sudo strace -T -e read cat /proc/allocinfo  > /dev/null
	read(3, "\177ELF\2\1\1\3\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0@>\2\0\0\0\0\0"..., 832) = 832 <0.000040>
	read(3, "allocinfo - version: 1.0\n#     <"..., 131072) = 4085 <0.000062>
	read(3, "        4096        1 arch/x86/k"..., 131072) = 4063 <0.000062>
	read(3, "           0        0 arch/x86/k"..., 131072) = 4029 <0.000061>
	read(3, "          64        1 kernel/wor"..., 131072) = 4064 <0.000061>
	read(3, "           0        0 kernel/sch"..., 131072) = 4041 <0.000051>
	read(3, "        4992       39 kernel/irq"..., 131072) = 4061 <0.000070>
	read(3, "           0        0 kernel/fut"..., 131072) = 4060 <0.000071>
	read(3, "           0        0 kernel/aud"..., 131072) = 4025 <0.000122>
	read(3, "        1536        3 kernel/tra"..., 131072) = 4014 <0.000064>
	read(3, "           0        0 kernel/tra"..., 131072) = 4079 <0.000067>
	read(3, "           0        0 kernel/tra"..., 131072) = 4035 <0.000072>
	read(3, "           0        0 kernel/bpf"..., 131072) = 4044 <0.000074>
	read(3, "           0        0 kernel/bpf"..., 131072) = 4061 <0.000063>
	read(3, "           0        0 ./include/"..., 131072) = 4084 <0.000063>
	read(3, "           0        0 kernel/eve"..., 131072) = 4084 <0.000071>
	read(3, "      278528       68 mm/memory."..., 131072) = 4068 <0.000070>
	read(3, "           0        0 mm/zswap.c"..., 131072) = 4091 <0.000082>
	read(3, "           0        0 mm/balloon"..., 131072) = 4039 <0.000083>
	read(3, "           0        0 fs/splice."..., 131072) = 4095 <0.000083>
	read(3, "           0        0 fs/binfmt_"..., 131072) = 4039 <0.000075>
	read(3, "         192        3 fs/proc/kc"..., 131072) = 4088 <0.000076>
	read(3, "           0        0 ipc/mqueue"..., 131072) = 4017 <0.000076>
	read(3, "           0        0 security/s"..., 131072) = 4075 <0.000072>
	read(3, "           0        0 security/s"..., 131072) = 4029 <0.000084>
	read(3, "           0        0 security/t"..., 131072) = 4053 <0.000076>
	read(3, "           0        0 security/a"..., 131072) = 4054 <0.000078>
	read(3, "           0        0 crypto/rsa"..., 131072) = 4046 <0.000081>
	read(3, "           0        0 crypto/asy"..., 131072) = 4079 <0.000081>
	read(3, "        1728        9 block/blk-"..., 131072) = 4034 <0.000084>
	read(3, "           0        0 io_uring/r"..., 131072) = 4044 <0.000085>
	read(3, "           0        0 lib/crypto"..., 131072) = 4056 <0.000363>
	read(3, "           0        0 lib/pldmfw"..., 131072) = 4079 <0.000091>
	read(3, "         384        6 drivers/pc"..., 131072) = 4091 <0.000098>
	read(3, "           0        0 drivers/vi"..., 131072) = 4068 <0.000093>
	read(3, "        4096        1 drivers/ac"..., 131072) = 4086 <0.000089>
	read(3, "       11040      230 drivers/ac"..., 131072) = 4001 <0.000090>
	read(3, "           0        0 drivers/ac"..., 131072) = 4030 <0.000094>
	read(3, "           0        0 drivers/dm"..., 131072) = 4031 <0.000094>
	read(3, "           0        0 drivers/xe"..., 131072) = 4085 <0.000097>
	read(3, "        4224       33 drivers/tt"..., 131072) = 4086 <0.000097>
	read(3, "           0        0 drivers/io"..., 131072) = 4038 <0.000097>
	read(3, "           0        0 drivers/io"..., 131072) = 4034 <0.000100>
	read(3, "          64        2 drivers/ba"..., 131072) = 4094 <0.000110>
	read(3, "           0        0 drivers/ba"..., 131072) = 4025 <0.000100>
	read(3, "           0        0 drivers/dm"..., 131072) = 4077 <0.000106>
	read(3, "           0        0 drivers/i2"..., 131072) = 4049 <0.000103>
	read(3, "           0        0 drivers/ed"..., 131072) = 4035 <0.000108>
	read(3, "           0        0 drivers/fi"..., 131072) = 4052 <0.000107>
	read(3, "           0        0 net/core/s"..., 131072) = 4057 <0.000119>
	read(3, "        5248       82 net/core/r"..., 131072) = 4050 <0.000110>
	read(3, "           0        0 net/core/d"..., 131072) = 4047 <0.000111>
	read(3, "           0        0 net/ethtoo"..., 131072) = 4059 <0.000112>
	read(3, "          32        1 net/ipv4/r"..., 131072) = 4052 <0.000116>
	read(3, "        1920       10 net/ipv4/i"..., 131072) = 4040 <0.000116>
	read(3, "           0        0 net/xfrm/x"..., 131072) = 4071 <0.000118>
	read(3, "           0        0 net/ipv6/i"..., 131072) = 4053 <0.000120>
	read(3, "           0        0 net/devlin"..., 131072) = 4064 <0.000120>
	read(3, "           0        0 lib/decomp"..., 131072) = 3996 <0.000123>
	read(3, "           0        0 drivers/vi"..., 131072) = 4043 <0.000121>
	read(3, "           0        0 drivers/us"..., 131072) = 4045 <0.000123>
	read(3, "           0        0 drivers/us"..., 131072) = 4020 <0.000126>
	read(3, "          64        1 drivers/sc"..., 131072) = 4043 <0.000128>
	read(3, "           0        0 drivers/ne"..., 131072) = 4094 <0.000130>
	read(3, "           0        0 drivers/hi"..., 131072) = 4025 <0.000132>
	read(3, "         672        6 fs/ext4/mb"..., 131072) = 4071 <0.000132>
	read(3, "           0        0 fs/autofs/"..., 131072) = 4038 <0.000134>
	read(3, "           0        0 fs/fuse/fi"..., 131072) = 4093 <0.000134>
	read(3, "           0        0 drivers/gp"..., 131072) = 4035 <0.000133>
	read(3, "           0        0 drivers/gp"..., 131072) = 4046 <0.000135>
	read(3, "           0        0 sound/core"..., 131072) = 4021 <0.000150>
	read(3, "           0        0 sound/core"..., 131072) = 4000 <0.000134>
	read(3, "        2048        1 drivers/vi"..., 131072) = 4078 <0.000138>
	read(3, "        3328      104 drivers/gp"..., 131072) = 4040 <0.000143>
	read(3, "           0        0 fs/overlay"..., 131072) = 4075 <0.000141>
	read(3, "           0        0 net/netfil"..., 131072) = 4061 <0.000139>
	read(3, "           0        0 net/xfrm/x"..., 131072) = 2022 <0.000129>
	read(3, "", 131072)                     = 0 <0.000114>

And with this change:
$ sudo strace -T -e read cat /proc/allocinfo  > /dev/null
read(3, "\177ELF\2\1\1\3\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0@>\2\0\0\0\0\0"..., 832) = 832 <0.000018>
read(3, "allocinfo - version: 1.0\n#     <"..., 131072) = 4085 <0.000066>
read(3, "        4096        1 arch/x86/k"..., 131072) = 4063 <0.000062>
read(3, "           0        0 arch/x86/k"..., 131072) = 4029 <0.000062>
read(3, "          64        1 kernel/wor"..., 131072) = 4064 <0.000064>
read(3, "           0        0 kernel/sch"..., 131072) = 4041 <0.000046>
read(3, "        4992       39 kernel/irq"..., 131072) = 4061 <0.000053>
read(3, "           0        0 kernel/fut"..., 131072) = 4060 <0.000054>
read(3, "           0        0 kernel/aud"..., 131072) = 4025 <0.000053>
read(3, "        1536        3 kernel/tra"..., 131072) = 4014 <0.000051>
read(3, "           0        0 kernel/tra"..., 131072) = 4079 <0.000050>
read(3, "           0        0 kernel/tra"..., 131072) = 4035 <0.000051>
read(3, "           0        0 kernel/bpf"..., 131072) = 4044 <0.000053>
read(3, "           0        0 kernel/bpf"..., 131072) = 4061 <0.000053>
read(3, "           0        0 ./include/"..., 131072) = 4084 <0.000052>
read(3, "           0        0 kernel/eve"..., 131072) = 4084 <0.000072>
read(3, "      286720       70 mm/memory."..., 131072) = 4068 <0.000071>
read(3, "           0        0 mm/zswap.c"..., 131072) = 4091 <0.000056>
read(3, "           0        0 mm/balloon"..., 131072) = 4039 <0.000056>
read(3, "           0        0 fs/splice."..., 131072) = 4095 <0.000076>
read(3, "           0        0 fs/binfmt_"..., 131072) = 4039 <0.000075>
read(3, "         192        3 fs/proc/kc"..., 131072) = 4088 <0.000057>
read(3, "           0        0 ipc/mqueue"..., 131072) = 4017 <0.000055>
read(3, "           0        0 security/s"..., 131072) = 4075 <0.000046>
read(3, "           0        0 security/s"..., 131072) = 4029 <0.000045>
read(3, "           0        0 security/t"..., 131072) = 4053 <0.000050>
read(3, "           0        0 security/a"..., 131072) = 4054 <0.000060>
read(3, "           0        0 crypto/rsa"..., 131072) = 4046 <0.000181>
read(3, "           0        0 crypto/asy"..., 131072) = 4079 <0.000051>
read(3, "        1728        9 block/blk-"..., 131072) = 4034 <0.000070>
read(3, "           0        0 io_uring/r"..., 131072) = 4044 <0.000078>
read(3, "           0        0 lib/crypto"..., 131072) = 4066 <0.000067>
read(3, "           0        0 arch/x86/l"..., 131072) = 4085 <0.000066>
read(3, "        7168        7 drivers/pc"..., 131072) = 4090 <0.000066>
read(3, "           0        0 drivers/vi"..., 131072) = 4063 <0.000065>
read(3, "        1024        1 drivers/ac"..., 131072) = 4094 <0.000067>
read(3, "           0        0 drivers/ac"..., 131072) = 4023 <0.000063>
read(3, "        2048        2 drivers/ac"..., 131072) = 4020 <0.000066>
read(3, "           0        0 drivers/dm"..., 131072) = 4094 <0.000067>
read(3, "           0        0 drivers/xe"..., 131072) = 4087 <0.000068>
read(3, "        1024        1 drivers/tt"..., 131072) = 4093 <0.000056>
read(3, "           0        0 drivers/io"..., 131072) = 4037 <0.000044>
read(3, "           0        0 drivers/io"..., 131072) = 4095 <0.000061>
read(3, "           0        0 drivers/ba"..., 131072) = 4045 <0.000059>
read(3, "           0        0 drivers/ba"..., 131072) = 4011 <0.000057>
read(3, "           0        0 drivers/ma"..., 131072) = 4087 <0.000064>
read(3, "           0        0 drivers/i2"..., 131072) = 4028 <0.000059>
read(3, "           0        0 drivers/ed"..., 131072) = 4048 <0.000080>
read(3, "           0        0 drivers/fi"..., 131072) = 4082 <0.000054>
read(3, "           0        0 net/core/s"..., 131072) = 4091 <0.000068>
read(3, "           0        0 net/core/f"..., 131072) = 4041 <0.000053>
read(3, "          20        1 net/sched/"..., 131072) = 4054 <0.000051>
read(3, "           0        0 net/ethtoo"..., 131072) = 4045 <0.000051>
read(3, "           0        0 net/ipv4/r"..., 131072) = 4040 <0.000051>
read(3, "        2048        1 net/ipv4/f"..., 131072) = 4056 <0.000050>
read(3, "           0        0 net/xfrm/x"..., 131072) = 4053 <0.000056>
read(3, "        3072        6 net/ipv6/i"..., 131072) = 4095 <0.000060>
read(3, "           0        0 net/devlin"..., 131072) = 4094 <0.000064>
read(3, "           0        0 lib/decomp"..., 131072) = 4023 <0.000063>
read(3, "        2048        2 drivers/us"..., 131072) = 4053 <0.000062>
read(3, "           0        0 drivers/us"..., 131072) = 4011 <0.000068>
read(3, "           0        0 drivers/in"..., 131072) = 4092 <0.000059>
read(3, "          64        1 drivers/sc"..., 131072) = 4067 <0.000064>
read(3, "           0        0 drivers/ne"..., 131072) = 4059 <0.000067>
read(3, "           8        1 drivers/hi"..., 131072) = 4050 <0.000052>
read(3, "         256        1 fs/ext4/mb"..., 131072) = 4024 <0.000070>
read(3, "           0        0 fs/autofs/"..., 131072) = 4082 <0.000070>
read(3, "           0        0 fs/fuse/in"..., 131072) = 4074 <0.000054>
read(3, "           0        0 drivers/gp"..., 131072) = 4066 <0.000063>
read(3, "           0        0 drivers/gp"..., 131072) = 4091 <0.000052>
read(3, "           0        0 drivers/gp"..., 131072) = 4029 <0.000064>
read(3, "           0        0 drivers/gp"..., 131072) = 4094 <0.000062>
read(3, "         128        2 sound/core"..., 131072) = 4069 <0.000068>
read(3, "          64        1 sound/pci/"..., 131072) = 4074 <0.000069>
read(3, "         384        4 net/bridge"..., 131072) = 4021 <0.000054>
read(3, "           0        0 net/netfil"..., 131072) = 4084 <0.000050>
read(3, "           0        0 net/xfrm/x"..., 131072) = 1513 <0.000047>
read(3, "", 131072)                     = 0 <0.000030>

Signed-off-by: David Wang <00107082@163.com>
---
 lib/alloc_tag.c | 30 +++++++++++-------------------
 1 file changed, 11 insertions(+), 19 deletions(-)

diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
index 25ecc1334b67..ec83cf798209 100644
--- a/lib/alloc_tag.c
+++ b/lib/alloc_tag.c
@@ -45,21 +45,17 @@ struct allocinfo_private {
 static void *allocinfo_start(struct seq_file *m, loff_t *pos)
 {
 	struct allocinfo_private *priv;
-	struct codetag *ct;
 	loff_t node = *pos;
 
-	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
-	m->private = priv;
-	if (!priv)
-		return NULL;
-
-	priv->print_header = (node == 0);
+	priv = (struct allocinfo_private *)m->private;
 	codetag_lock_module_list(alloc_tag_cttype, true);
-	priv->iter = codetag_get_ct_iter(alloc_tag_cttype);
-	while ((ct = codetag_next_ct(&priv->iter)) != NULL && node)
-		node--;
-
-	return ct ? priv : NULL;
+	if (node == 0) {
+		priv->print_header = true;
+		priv->iter = codetag_get_ct_iter(alloc_tag_cttype);
+		codetag_next_ct(&priv->iter);
+	}
+	// TODO: need to check iter is valid, or rewinding it.
+	return priv->iter.ct ? priv : NULL;
 }
 
 static void *allocinfo_next(struct seq_file *m, void *arg, loff_t *pos)
@@ -76,12 +72,7 @@ static void *allocinfo_next(struct seq_file *m, void *arg, loff_t *pos)
 
 static void allocinfo_stop(struct seq_file *m, void *arg)
 {
-	struct allocinfo_private *priv = (struct allocinfo_private *)m->private;
-
-	if (priv) {
-		codetag_lock_module_list(alloc_tag_cttype, false);
-		kfree(priv);
-	}
+	codetag_lock_module_list(alloc_tag_cttype, false);
 }
 
 static void print_allocinfo_header(struct seq_buf *buf)
@@ -249,7 +240,8 @@ static void __init procfs_init(void)
 	if (!mem_profiling_support)
 		return;
 
-	if (!proc_create_seq(ALLOCINFO_FILE_NAME, 0400, NULL, &allocinfo_seq_op)) {
+	if (!proc_create_seq_private(ALLOCINFO_FILE_NAME, 0400, NULL, &allocinfo_seq_op,
+				     sizeof(struct allocinfo_private), NULL)) {
 		pr_err("Failed to create %s file\n", ALLOCINFO_FILE_NAME);
 		shutdown_mem_profiling(false);
 	}
-- 
2.39.2

