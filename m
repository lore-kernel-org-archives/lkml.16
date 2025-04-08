Received: from sxb1plsmtpa01-11.prod.sxb1.secureserver.net (sxb1plsmtpa01-11.prod.sxb1.secureserver.net [188.121.53.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8517124C09B
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 04:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.121.53.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744086402; cv=none; b=DsPPuyCDhz+Pb9i5ke2DTPFilCOfCtv5nqT95sSo/SIrQWZwjw5CugSb/sog/r9BNOaIUIW00GbZZW/r29vnaVNyT62UJPDDvop9t06gMuNtolm3wfDdfwQA3+imvRW7qrKv9CDg0+ko4uo4H5b6Kfg/l4ZFReCUQic30lR9YkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744086402; c=relaxed/simple;
	bh=UzuV/AjhpXBleB5NLOztvE7OS8zrhXG6Lxp8DshM15U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vw3XhxYuJZOP7osMtbTs5D2zjBAfwWaCQoWKsAuY5y5q+CinIoieb7ZJhM4ZwQFwaPUAjZJYrimC80ByQ8BFU+XSMZf2wjKr3QTXifAQZGDl4aULwdzjsF+rugPo4v5DBf1IgEJNd7JsbP36nTuwJnW0fIexULfuq25tIw1/LxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squashfs.org.uk; spf=pass smtp.mailfrom=squashfs.org.uk; arc=none smtp.client-ip=188.121.53.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squashfs.org.uk
Received: from [192.168.178.95] ([82.69.79.175])
	by :SMTPAUTH: with ESMTPSA
	id 20QJuoRE2oGJS20QLu2IJY; Mon, 07 Apr 2025 21:18:58 -0700
X-CMAE-Analysis: v=2.4 cv=A9SWP7WG c=1 sm=1 tr=0 ts=67f4a3b3
 a=84ok6UeoqCVsigPHarzEiQ==:117 a=84ok6UeoqCVsigPHarzEiQ==:17
 a=IkcTkHD0fZMA:10 a=VwQbUJbxAAAA:8 a=TieKIuElshfLa7FaqJMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-SECURESERVER-ACCT: phillip@squashfs.org.uk
Message-ID: <129d4f39-6922-44e9-8b1c-6455ee564dda@squashfs.org.uk>
Date: Tue, 8 Apr 2025 05:18:05 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [squashfs?] UBSAN: shift-out-of-bounds in
 squashfs_bio_read
To: syzbot+65761fc25a137b9c8c6e@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org, squashfs-devel-owner@lists.sourceforge.net,
 squashfs-devel@lists.sourceforge.net, syzkaller-bugs@googlegroups.com,
 phillip.lougher@gmail.com, Luis Chamberlain <mcgrof@kernel.org>
References: <67f1f6f6.050a0220.0a13.025a.GAE@google.com>
 <2a13ea1c-08df-4807-83d4-241831b7a2ec@squashfs.org.uk>
Content-Language: en-US
From: Phillip Lougher <phillip@squashfs.org.uk>
In-Reply-To: <2a13ea1c-08df-4807-83d4-241831b7a2ec@squashfs.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfGE8bUnGjcLYUEYUFnE1digrUscMj8xkIdWUdEFjNBEikMOPckN6nMJ0AO0Ls+42hZzAfWoRygr2tbJAsWpCWsIHA5iks5fG9L6RBHZSUohcJUnaaArh
 T19VmDmx20WB93dE2LUc2vDBqz4I6+37hBV81ZUir8RX6K3Z2nKEdLfGcXuydbtT3xeqGnSGyWep1yJZQaYBi6E6eKQNtu6+ogTg1BoDOts6UQLlVZctMhWq
 lvIak6Vlk9Cezu4xywEpa+/t7XkCRCnAVYe5weqx9X+wpQ7BDThGFfAmN75jCirogNaZq637suM5DKEI7YtnxmXm0ueJkP88un9m/9cIO3KhTOW4t35scjXS
 1urR6u+LWhftN3Ewb2nwJzqFdarDAbhuMUCgsrvP+NXJT/4BYP8TeE8p7zh2W5x07DEyO5tWxo9SHHSk6cY8SSQtpAtS49cL9opv2AykPYxyNshuhobu9wpT
 p03vISfFa0HXP6cnrshr0/7W5K4oArbF5N0IEw==

On 07/04/2025 06:30, Phillip Lougher wrote:

> Digging deeper into the reproducer, it turns out the reproducer is
> forking multiple processes which after mounting the Squashfs filesystem,
> issues a LOOP_SET_BLOCK_SIZE(r0, 0x4c09, 0x8000) ioctl on loopback
> device /dev/loop0.  Now, if this ioctl occurs at the same time another
> process is in the process of mounting a Squashfs filesystem on
> /dev/loop0, the failure occurs.   The ioctl has to be issued in the
> early part of squashfs_fill_super() before the superblock has been read.
> When this happens, the following code in squashfs_fill_super() fails.
> 
> ----
> msblk->devblksize = sb_min_blocksize(sb, SQUASHFS_DEVBLK_SIZE);
> msblk->devblksize_log2 = ffz(~msblk->devblksize);
> ----
> 
> sb_min_blocksize() returns 0, which means msblk->devblksize is set to 0.

CC'ing Luis Chamberlain <mcgrof@kernel.org>

Doing some more digging, what has changed to cause this failure, is a
post 6.14 change in the behaviour of the LOOP_SET_BLOCK_SIZE ioctl.

Doing a git bisect, prior to commit 47dd67532303803a87f43195e088b3b4bcf0454d
Author: Luis Chamberlain <mcgrof@kernel.org>
block/bdev: lift block size restrictions to 64k

Attempts to set the loopback device block size to 0x8000 (32768) failed.
After the above commit, such attempts succeed.  Having done so, this
causes the above sb_min_blocksize(sb, SQUASHFS_DEVBLK_SIZE) to fail.

This may be an unanticipated side effect of the change.

Checking the kernel code six filesystems fail to check the return
result of sb_min_blocksize (isofs, gfs2, exfat, fat, squashfs and xfs),
and so will be affected by this change.

But notwithstanding the above, the failure to check the return result of
sb_min_blocksize() in Squashfs is a bug, and I will send a patch that
fixes this and the syzbot exploit.  Hopefully this will be tomorrow.

Phillip

> 
> As a result, ffz(~msblk->devblksize) returns 64, and
> msblk->devblksize_log2 is set to 64.
> 
> This subsequently causes the
> 
> UBSAN: shift-out-of-bounds in fs/squashfs/block.c:195:36
> shift exponent 64 is too large for 64-bit type 'u64' (aka 'unsigned long long')
> 
> The fix is to check for a 0 return by sb_min_blocksize().
> 
> I'll send a patch tomorrow.
> 
> Phillip
