Received: from sxb1plsmtpa01-04.prod.sxb1.secureserver.net (sxb1plsmtpa01-04.prod.sxb1.secureserver.net [92.204.81.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA19224258
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 05:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.204.81.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744005040; cv=none; b=lPJzH2gzFq+TuOxIB7HE+ofJ77tLk9twi7/2pJEvZnl9LS2k9UN9qwMpgYhLAjmtBINxr0G6AXtue4aOOnVaDP5tzG1FoWdciA6NfoEXuuZCfrUbsZf2I37CETYO5fg6l4KuwodVpOV1NXzN0LbgBLt36S+EKawCe//VXWyOcDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744005040; c=relaxed/simple;
	bh=qyEm1ZA4yiL/b1lEXBMroVsfG9cT3DHpkXGoKCl2Ppw=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=pOlyPCFq1p+ukjEgjStLn6Cg1i4OwF0fK7OJ4yU5BS3+i0nS8PXWmx0nmdfkAeIrg0cQ5qlKMVL0u1n3xZZa3zJGC8+/zbmyYY22s2zdwLR5+NT/3+cJNMQ3yvi3y9Q4PQKi2atGoiwYOH4n1bKJVl8MrEla4e7lARLlfrXXwIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squashfs.org.uk; spf=pass smtp.mailfrom=squashfs.org.uk; arc=none smtp.client-ip=92.204.81.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squashfs.org.uk
Received: from [192.168.178.95] ([82.69.79.175])
	by :SMTPAUTH: with ESMTPSA
	id 1f4tuKfifINjl1f4vuE9Mb; Sun, 06 Apr 2025 22:31:26 -0700
X-CMAE-Analysis: v=2.4 cv=NI8v+16g c=1 sm=1 tr=0 ts=67f3632f
 a=84ok6UeoqCVsigPHarzEiQ==:117 a=84ok6UeoqCVsigPHarzEiQ==:17
 a=IkcTkHD0fZMA:10 a=u6sYcmGwt8sEfABpyM8A:9 a=QEXdDO2ut3YA:10
X-SECURESERVER-ACCT: phillip@squashfs.org.uk
Message-ID: <2a13ea1c-08df-4807-83d4-241831b7a2ec@squashfs.org.uk>
Date: Mon, 7 Apr 2025 06:30:35 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: syzbot+65761fc25a137b9c8c6e@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org, phillip@squashfs.org.uk,
 squashfs-devel-owner@lists.sourceforge.net,
 squashfs-devel@lists.sourceforge.net, syzkaller-bugs@googlegroups.com,
 phillip.lougher@gmail.com
References: <67f1f6f6.050a0220.0a13.025a.GAE@google.com>
Subject: Re: [syzbot] [squashfs?] UBSAN: shift-out-of-bounds in
 squashfs_bio_read
Content-Language: en-US
From: Phillip Lougher <phillip@squashfs.org.uk>
In-Reply-To: <67f1f6f6.050a0220.0a13.025a.GAE@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfIM042gc/8JGCsd7GfE3sA190hiyYn41HftL2t7HhD8jU/qkoLtCZqDF90lN8wJOcPKl07Wi1+sGAwAQlbTQx3zgpXQL6HqfxJts/adOAEf1qR25kIpU
 NRZXPLUfj1bRszpEsdhBJ4f8Tbg6XRXgZD+Loh62vK/iF6LpL/OprcdFna+L6ByjLqex5N+hPGuWQKcy+9KXvpkRRtiBpZHgVU5il4afUdNzmX9C1Y8julWL
 QiVB8A1CwbaD6WMT6LQYjN1ySrv/ybH3szOl+0bP7ImaglxyiDZ5HWglZ6Mqrn7eI+rBE0LWK8Vg5vffjd6Uf30ihR7tIdmzeATslYypGVNZLVMjYsobUTkJ
 Kwxz52sWqF/i4+AwLLMbxNJl/YhCBzD0sUdpUPkMid1KdPzLg5BZaNiQrD9JroU1irflNFqUwSEwUFCynQW1tbPaV9lZCNY9t8bL520e1E4DkuiKSz00CZrb
 ab3UrmHmEdWRMB4Z81OjagXzJOmCootaFHc26fQx6z8u3kCYUqHyfM80GVg=

I have spent most of Sunday on this syzbot issue, because it is one of
those PITAs, which are difficult to reproduce, and are full of red
herrings.

Firstly, this issue has nothing to do with corrupted Squashfs
filesystems.  This is the because the failure occurs before the Squashfs
filesystem superblock has been read, and thus filesystem corruption
doesn't come into it.  Thus the source of the failure is elsewhere in
the obfusticated auto-generated C reproducer.

Digging deeper into the reproducer, it turns out the reproducer is
forking multiple processes which after mounting the Squashfs filesystem,
issues a LOOP_SET_BLOCK_SIZE(r0, 0x4c09, 0x8000) ioctl on loopback
device /dev/loop0.  Now, if this ioctl occurs at the same time another
process is in the process of mounting a Squashfs filesystem on
/dev/loop0, the failure occurs.   The ioctl has to be issued in the
early part of squashfs_fill_super() before the superblock has been read.
When this happens, the following code in squashfs_fill_super() fails.

----
msblk->devblksize = sb_min_blocksize(sb, SQUASHFS_DEVBLK_SIZE);
msblk->devblksize_log2 = ffz(~msblk->devblksize);
----

sb_min_blocksize() returns 0, which means msblk->devblksize is set to 0.

As a result, ffz(~msblk->devblksize) returns 64, and
msblk->devblksize_log2 is set to 64.

This subsequently causes the

UBSAN: shift-out-of-bounds in fs/squashfs/block.c:195:36
shift exponent 64 is too large for 64-bit type 'u64' (aka 'unsigned long long')

The fix is to check for a 0 return by sb_min_blocksize().

I'll send a patch tomorrow.

Phillip
