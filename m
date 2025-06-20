Received: from mail.parknet.co.jp (mail.parknet.co.jp [210.171.160.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF058801
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 03:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.171.160.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750389368; cv=none; b=Kvrbxob/fHY/U/sJng10k9pO5HOPmJqU//TTTbiO6F28RGNHB2ArBHqvAZRdW2COD+iqPA1bCXsx632uyyb+v2gk7rxrp0QcK9gptim3RbDAts/OzXx07vFONbZ3yR99pLV6UXiKuRaQ+kKjcDXge+QyiOF0aiZyKGOKCkD0x6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750389368; c=relaxed/simple;
	bh=O2GvBgg/BxYhZTydzvibsdx6k/2knZD4ueSDzAgPU9A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ag6AuA/QsZxxDHw0tUuciDXUzqM1q2AxCAk5Y12PMQBDXAV4EV1SoFrg6tSuimJkkrPzjCr1lsEwda0AEmXW+dSex8kBjHL3EoK/fXHdNKyIJpG1dzt7eXmxHc7gGx/Itn2nR6oYj/IYFRqIf9AV4GbIoH0703aEo/f6XqS2wOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.parknet.co.jp; spf=pass smtp.mailfrom=parknet.co.jp; dkim=pass (2048-bit key) header.d=parknet.co.jp header.i=@parknet.co.jp header.b=Cs6G+hpC; dkim=permerror (0-bit key) header.d=parknet.co.jp header.i=@parknet.co.jp header.b=KRB4Yd3X; arc=none smtp.client-ip=210.171.160.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.parknet.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=parknet.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=parknet.co.jp header.i=@parknet.co.jp header.b="Cs6G+hpC";
	dkim=permerror (0-bit key) header.d=parknet.co.jp header.i=@parknet.co.jp header.b="KRB4Yd3X"
Received: from ibmpc.myhome.or.jp (server.parknet.ne.jp [210.171.168.39])
	by mail.parknet.co.jp (Postfix) with ESMTPSA id 9A38E26F75D5;
	Fri, 20 Jun 2025 12:16:01 +0900 (JST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=parknet.co.jp;
	s=20250114; t=1750389361;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lIT+A3Ph7WWNHmUmXCYqK/z9hZmbl30OP3CAfbAILAo=;
	b=Cs6G+hpCngjQibUcMvGhq4nhxa8WyNCTrpv/fXFJMFmBT1SbLKD692Tp/N4nDe3B7FH+t2
	VgMlrRpa0F+xMFbDpOkBUFIz8Ubg6x8ydxY484GYCxAews3PCVRBgOC3Ieaxpo4tJRbdwl
	tsLe8VtGkIH/qzm3tClYmqDGFoH05a6bwtZR9DHtvoDpU7XrBB5fYBuzOHUPtJmmtLHRmV
	4Ytl1aUH9Uk6xNIi9aNv8Dld9qMc+85Mm4BQBIOFHHC8b6GAgkx6ZtalexsK3DI1tqvod/
	cpeQq07RjgwKzQDXauxQiRUtPgtQH4nq2KdITqldSTmvVLPoWBfHGpGm+6CuRA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=parknet.co.jp;
	s=20250114-ed25519; t=1750389361;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lIT+A3Ph7WWNHmUmXCYqK/z9hZmbl30OP3CAfbAILAo=;
	b=KRB4Yd3XBAYdBQ+0uAr+BEFTGapXvRN6F3esGVC+eKOqMUBZ+cUrUUDLTaSBOxJFxeAU0p
	HclfnHrOch+bVTBg==
Received: from devron.myhome.or.jp (foobar@devron.myhome.or.jp [192.168.0.3])
	by ibmpc.myhome.or.jp (8.18.1/8.18.1/Debian-6) with ESMTPS id 55K3G0ro013301
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 20 Jun 2025 12:16:01 +0900
Received: from devron.myhome.or.jp (foobar@localhost [127.0.0.1])
	by devron.myhome.or.jp (8.18.1/8.18.1/Debian-6) with ESMTPS id 55K3G0jf040331
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 20 Jun 2025 12:16:00 +0900
Received: (from hirofumi@localhost)
	by devron.myhome.or.jp (8.18.1/8.18.1/Submit) id 55K3FxZK040330;
	Fri, 20 Jun 2025 12:15:59 +0900
From: OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Li Chen <me@linux.beauty>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2] fs: fat: Prevent fsfuzzer from dominating the console
In-Reply-To: <20250620020231.9292-1-me@linux.beauty>
References: <20250620020231.9292-1-me@linux.beauty>
Date: Fri, 20 Jun 2025 12:15:59 +0900
Message-ID: <87a563w1ao.fsf@mail.parknet.co.jp>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Li Chen <me@linux.beauty> writes:

> From: Li Chen <chenl311@chinatelecom.cn>
>
> fsfuzzer may make many invalid access for FAT-fs and generate many kmsg
> like "FAT-fs (loop2): error, invalid access to FAT (entry 0x00000ccb)".
>
> For platforms & os that enables hardware serial device whose speed are
> slow, this may cause softlockup easily.
>
> So let's ratelimit the error log.
>
> The log as below:
> [11916.242560] FAT-fs (loop2): error, invalid access to FAT (entry 0x00000ccb)
> [11916.254485] FAT-fs (loop2): error, invalid access to FAT (entry 0x00000ccb)
> [11916.266388] FAT-fs (loop2): error, invalid access to FAT (entry 0x00000ccb)
> [11916.278287] FAT-fs (loop2): error, invalid access to FAT (entry 0x00000ccb)
> [11916.290180] FAT-fs (loop2): error, invalid access to FAT (entry 0x00000ccb)
> [11916.302068] FAT-fs (loop2): error, invalid access to FAT (entry 0x00000ccb)
> [11916.313962] FAT-fs (loop2): error, invalid access to FAT (entry 0x00000ccb)
> [11916.325848] FAT-fs (loop2): error, invalid access to FAT (entry 0x00000ccb)
> [11916.337732] FAT-fs (loop2): error, invalid access to FAT (entry 0x00000ccb)
> [11916.349619] FAT-fs (loop2): error, invalid access to FAT (entry 0x00000ccb)
> [11916.361505] FAT-fs (loop2): error, invalid access to FAT (entry 0x00000ccb)
> [11916.373391] FAT-fs (loop2): error, invalid access to FAT (entry 0x00000ccb)
> [11916.385272] FAT-fs (loop2): error, invalid access to FAT (entry 0x00000ccb)
> [11916.397144] FAT-fs (loop2): error, invalid access to FAT (entry 0x00000ccb)
> [11916.409025] FAT-fs (loop2): error, invalid access to FAT (entry 0x00000ccb)
> [11916.420909] FAT-fs (loop2): error, invalid access to FAT (entry 0x00000ccb)
> [11916.432791] FAT-fs (loop2): error, invalid access to FAT (entry 0x00000ccb)
> [11916.444674] FAT-fs (loop2): error, invalid access to FAT (entry 0x00000ccb)
> [11916.456558] FAT-fs (loop2): error, invalid access to FAT (entry 0x00000ccb)
> [11916.468446] FAT-fs (loop2): error, invalid access to FAT (entry 0x00000ccb)
> [11916.480352] watchdog: BUG: soft lockup - CPU#58 stuck for 26s! [cat:2446035]
> [11916.480357] Modules linked in: ...
> [11916.480503] CPU: 58 PID: 2446035 Comm: cat Kdump: loaded Tainted: ...
> [11916.480508] Hardware name: vclusters VSFT5000 B/VSFT5000 B, BIOS ...
> [11916.480510] pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [11916.480513] pc : console_emit_next_record+0x1b4/0x288
> [11916.480524] lr : console_emit_next_record+0x1ac/0x288
> [11916.480525] sp : ffff80009bcdae90
> [11916.480527] x29: ffff80009bcdaec0 x28: ffff800082513810 x27: 0000000000000001
> [11916.480530] x26: 0000000000000001 x25: ffff800081f66000 x24: 0000000000000000
> [11916.480533] x23: 0000000000000000 x22: ffff80009bcdaf8f x21: 0000000000000001
> [11916.480535] x20: 0000000000000000 x19: ffff800082513810 x18: ffffffffffffffff
> [11916.480538] x17: 0000000000000002 x16: 0000000000000001 x15: ffff80009bcdab30
> [11916.480541] x14: 0000000000000000 x13: 205d353330363434 x12: 32545b5d36343438
> [11916.480543] x11: 652820544146206f x10: 7420737365636361 x9 : ffff800080159a6c
> [11916.480546] x8 : 69202c726f727265 x7 : 545b5d3634343836 x6 : 342e36313931315b
> [11916.480549] x5 : ffff800082513a01 x4 : ffff80009bcdad31 x3 : 0000000000000000
> [11916.480551] x2 : 00000000ffffffff x1 : 0000000001b9b000 x0 : ffff8000836cef00
> [11916.480554] Call trace:
> [11916.480557]  console_emit_next_record+0x1b4/0x288
> [11916.480560]  console_flush_all+0xcc/0x190
> [11916.480563]  console_unlock+0x78/0x138
> [11916.480565]  vprintk_emit+0x1c4/0x210
> [11916.480568]  vprintk_default+0x40/0x58
> [11916.480570]  vprintk+0x84/0xc8
> [11916.480572]  _printk+0x68/0xa0
> [11916.480578]  _fat_msg+0x6c/0xa0 [fat]
> [11916.480593]  __fat_fs_error+0xf8/0x118 [fat]
> [11916.480601]  fat_ent_read+0x164/0x238 [fat]
> [11916.480609]  fat_get_cluster+0x180/0x2c8 [fat]
> [11916.480617]  fat_get_mapped_cluster+0xb8/0x170 [fat]
>
> Signed-off-by: Li Chen <chenl311@chinatelecom.cn>

Looks good.

Acked-by: OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>

Thanks.

> ---
> Changelog:
> v2: use fat_fs_error_ratelimit instead as suggested by OGAWA Hirofumi
>
>  fs/fat/fatent.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/fat/fatent.c b/fs/fat/fatent.c
> index 1db348f8f887a..a7061c2ad8e4d 100644
> --- a/fs/fat/fatent.c
> +++ b/fs/fat/fatent.c
> @@ -356,7 +356,7 @@ int fat_ent_read(struct inode *inode, struct fat_entry *fatent, int entry)
>  
>  	if (!fat_valid_entry(sbi, entry)) {
>  		fatent_brelse(fatent);
> -		fat_fs_error(sb, "invalid access to FAT (entry 0x%08x)", entry);
> +		fat_fs_error_ratelimit(sb, "invalid access to FAT (entry 0x%08x)", entry);
>  		return -EIO;
>  	}

-- 
OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
