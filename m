Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37A822B585
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 11:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750333107; cv=pass; b=GVr5WxccCzwi/kPxV89ar3EaWT3z96zlxQVIhp7b+YwCNN2MZuFQALzs8QS1VUEtMSrst6jR2qdy33YeYXQlDgjAtgPz9uYv/aOO5jz3peTuC5CdhRbFv0mrYIKPMWhCwU3P7dQCJPZcntGrg38wac//lWD7bKPEM9CUT5q7Qms=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750333107; c=relaxed/simple;
	bh=05WBxAXTwL+RwIvUTTTwW6AMEzq9n03Wiv2XOwZj+7w=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=H/5Omu21djCKn6tY4butTzm4SMZSmnsDpBIu6IfB9YgDAY2CBKbADe4XhzqojhfYMuXVpzYPEUrDKhD7l1AtXh5PBZXAJnqiuPTrqp98mrtjYWjdT51NdC5tfUrl3wM/XUJojRxOXjvjKMDn1WTE2unHK4/WE1V7goocHwpjprY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.beauty; spf=pass smtp.mailfrom=linux.beauty; dkim=pass (1024-bit key) header.d=linux.beauty header.i=me@linux.beauty header.b=kbaTnhZX; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.beauty
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.beauty
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.beauty header.i=me@linux.beauty header.b="kbaTnhZX"
ARC-Seal: i=1; a=rsa-sha256; t=1750333097; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cBmjjXjgHAS0u2WFnjnpxEK1Xk9aoYeS/LSBjxme1vfvAUn5HZLssPx+MKA+eBgU1oInkypgFoJjZ7WlZqP08gyRWs6OD5X6PPb1bsAIeRNj2ptTS3hDCKSN7MAap/3P534uIHxRHkPZ7ugY6Yk73P1vDcgjK0UIRcF22nQtQm0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1750333097; h=Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=FguoU8zfXfkpzEG7gV2FAmavgT6Ky2sNnQ9ls42YIaM=; 
	b=Qd0R3vo1F4rduhJDrBKxoj249sd3Ae5PFh/39LRmcGlNdINJervYkG/xNiPXDYW8lChjs7fWqDbwE9o7N32e5DcdvJm+HhIjETuGiw/icPqzeRCKEWtvCr6oVLZdRWFpNGAM5X9jpA1H1Sf2lTFFZkPZO+wf9oC94pPGkcRev9A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=linux.beauty;
	spf=pass  smtp.mailfrom=me@linux.beauty;
	dmarc=pass header.from=<me@linux.beauty>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750333097;
	s=zmail; d=linux.beauty; i=me@linux.beauty;
	h=From:From:To:To:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=FguoU8zfXfkpzEG7gV2FAmavgT6Ky2sNnQ9ls42YIaM=;
	b=kbaTnhZXx7q3KCBKaB8babVYy/reKEfnwjyFhu9pYfroGedqYFcGpbF/oP7HJpG7
	+VYHpKifnn2SwPJWiwUIjx0tuFdMAzfjBIWiqwcdQUQY2eLjt3bJWMGNt/lWWF0XzA6
	MVmhNFncAnviPgt561e8iQf/saXu5gY5lITgr6So=
Received: by mx.zohomail.com with SMTPS id 1750333094292532.3166916558993;
	Thu, 19 Jun 2025 04:38:14 -0700 (PDT)
From: Li Chen <me@linux.beauty>
To: OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] fs: fat: Prevent fsfuzzer from dominating the console
Date: Thu, 19 Jun 2025 19:38:08 +0800
Message-ID: <20250619113809.274808-1-me@linux.beauty>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

From: Li Chen <chenl311@chinatelecom.cn>

fsfuzzer may make many invalid access for FAT-fs and generate many kmsg
like "FAT-fs (loop2): error, invalid access to FAT (entry 0x00000ccb)".

For platforms & os that enables hardware serial device whose speed are
slow, this may cause softlockup easily.

So let's ratelimit the error log.

The log as below:
[11916.242560] FAT-fs (loop2): error, invalid access to FAT (entry 0x00000ccb)
[11916.254485] FAT-fs (loop2): error, invalid access to FAT (entry 0x00000ccb)
[11916.266388] FAT-fs (loop2): error, invalid access to FAT (entry 0x00000ccb)
[11916.278287] FAT-fs (loop2): error, invalid access to FAT (entry 0x00000ccb)
[11916.290180] FAT-fs (loop2): error, invalid access to FAT (entry 0x00000ccb)
[11916.302068] FAT-fs (loop2): error, invalid access to FAT (entry 0x00000ccb)
[11916.313962] FAT-fs (loop2): error, invalid access to FAT (entry 0x00000ccb)
[11916.325848] FAT-fs (loop2): error, invalid access to FAT (entry 0x00000ccb)
[11916.337732] FAT-fs (loop2): error, invalid access to FAT (entry 0x00000ccb)
[11916.349619] FAT-fs (loop2): error, invalid access to FAT (entry 0x00000ccb)
[11916.361505] FAT-fs (loop2): error, invalid access to FAT (entry 0x00000ccb)
[11916.373391] FAT-fs (loop2): error, invalid access to FAT (entry 0x00000ccb)
[11916.385272] FAT-fs (loop2): error, invalid access to FAT (entry 0x00000ccb)
[11916.397144] FAT-fs (loop2): error, invalid access to FAT (entry 0x00000ccb)
[11916.409025] FAT-fs (loop2): error, invalid access to FAT (entry 0x00000ccb)
[11916.420909] FAT-fs (loop2): error, invalid access to FAT (entry 0x00000ccb)
[11916.432791] FAT-fs (loop2): error, invalid access to FAT (entry 0x00000ccb)
[11916.444674] FAT-fs (loop2): error, invalid access to FAT (entry 0x00000ccb)
[11916.456558] FAT-fs (loop2): error, invalid access to FAT (entry 0x00000ccb)
[11916.468446] FAT-fs (loop2): error, invalid access to FAT (entry 0x00000ccb)
[11916.480352] watchdog: BUG: soft lockup - CPU#58 stuck for 26s! [cat:2446035]
[11916.480357] Modules linked in: ...
[11916.480503] CPU: 58 PID: 2446035 Comm: cat Kdump: loaded Tainted: ...
[11916.480508] Hardware name: vclusters VSFT5000 B/VSFT5000 B, BIOS ...
[11916.480510] pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[11916.480513] pc : console_emit_next_record+0x1b4/0x288
[11916.480524] lr : console_emit_next_record+0x1ac/0x288
[11916.480525] sp : ffff80009bcdae90
[11916.480527] x29: ffff80009bcdaec0 x28: ffff800082513810 x27: 0000000000000001
[11916.480530] x26: 0000000000000001 x25: ffff800081f66000 x24: 0000000000000000
[11916.480533] x23: 0000000000000000 x22: ffff80009bcdaf8f x21: 0000000000000001
[11916.480535] x20: 0000000000000000 x19: ffff800082513810 x18: ffffffffffffffff
[11916.480538] x17: 0000000000000002 x16: 0000000000000001 x15: ffff80009bcdab30
[11916.480541] x14: 0000000000000000 x13: 205d353330363434 x12: 32545b5d36343438
[11916.480543] x11: 652820544146206f x10: 7420737365636361 x9 : ffff800080159a6c
[11916.480546] x8 : 69202c726f727265 x7 : 545b5d3634343836 x6 : 342e36313931315b
[11916.480549] x5 : ffff800082513a01 x4 : ffff80009bcdad31 x3 : 0000000000000000
[11916.480551] x2 : 00000000ffffffff x1 : 0000000001b9b000 x0 : ffff8000836cef00
[11916.480554] Call trace:
[11916.480557]  console_emit_next_record+0x1b4/0x288
[11916.480560]  console_flush_all+0xcc/0x190
[11916.480563]  console_unlock+0x78/0x138
[11916.480565]  vprintk_emit+0x1c4/0x210
[11916.480568]  vprintk_default+0x40/0x58
[11916.480570]  vprintk+0x84/0xc8
[11916.480572]  _printk+0x68/0xa0
[11916.480578]  _fat_msg+0x6c/0xa0 [fat]
[11916.480593]  __fat_fs_error+0xf8/0x118 [fat]
[11916.480601]  fat_ent_read+0x164/0x238 [fat]
[11916.480609]  fat_get_cluster+0x180/0x2c8 [fat]
[11916.480617]  fat_get_mapped_cluster+0xb8/0x170 [fat]

Signed-off-by: Li Chen <chenl311@chinatelecom.cn>
Reviewed-by: Bin Lai <laib2@chinatelecom.cn>
---
 fs/fat/misc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/fat/misc.c b/fs/fat/misc.c
index c7a2d27120bab..75c2b59fbd532 100644
--- a/fs/fat/misc.c
+++ b/fs/fat/misc.c
@@ -23,8 +23,10 @@ void __fat_fs_error(struct super_block *sb, int report, const char *fmt, ...)
 	struct fat_mount_options *opts = &MSDOS_SB(sb)->options;
 	va_list args;
 	struct va_format vaf;
+	static DEFINE_RATELIMIT_STATE(fat_err_rs, DEFAULT_RATELIMIT_INTERVAL,
+								  DEFAULT_RATELIMIT_BURST);
 
-	if (report) {
+	if (report && __ratelimit(&fat_err_rs)) {
 		va_start(args, fmt);
 		vaf.fmt = fmt;
 		vaf.va = &args;
-- 
2.49.0

