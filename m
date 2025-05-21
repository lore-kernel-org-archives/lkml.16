Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AFE621D5B0
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 17:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747847112; cv=none; b=s0na5elvReU+eULlx9U4sqg5uzA/89rzuoy6f5dwJs1Hk4hAYpeMFsP+BtdkJ6gMo/d5bYnyqJ9Xx56AkfoFQu4kUwfoOtvynCNQxuBtRUsgEqfwVc4vDcM7ZfgaplnkW0f0h/R6Izu+rCT7hadFXvYByx1TRtt9NjPm6QBP6F4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747847112; c=relaxed/simple;
	bh=h9K08S4/SppBRJEIj4ASAYVF9uE7myCzmPGq+LngFAM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G4fW+PoWrJgZx3f1YwA7Ch7PxLx9/5r35FBSywhtkXt6et7FoW/UNAnPmWvS7GxY+Y8TBtaBwf3bGX8Rbh4TSOyDY9AGKLFEltZJNtpHLPV0fiNqohyU/UQKXy0wIP3MxUvETNR4Wv9AdH6/NzSMriJJcYKh3oDExqTNcENsejk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=gf8mQIyX; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="gf8mQIyX"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-30e57a37294so6642370a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 10:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1747847110; x=1748451910; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ADPBqv1nsQy1jMr9cHUjBrE8nBO9SxIHgR5hgX7pnl8=;
        b=gf8mQIyX3c5auSAlleQTKZSazjF7zedqcjS55Bo3wen6ZKzE05ItTH6uGFhLYV89lF
         YLepLHNMr3+ZEpKKB89YZbNUCuAND4fkLV8xdU57DVQb0W7FDCd6hiL+e9K9QhqFhO16
         gWtJ7xpmMgyB76pYnfYLLwk0HMR8EyFH+REzHxxCFm3zzIyK4Ah1t65Sw4oWXq7j2L1w
         M2pPN9sLiKLSbLYPZDLix9djggFx+hVp3iA/HlkD+3EFqMx3kpK5M6Xz9zKfuuxx4p/C
         B1B++RZzkeDRrUr/x993+zUEmZBfwebBXPh4RuERiHjLTtBMr0blzfB/Q8BlhzDQqcMk
         YQgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747847110; x=1748451910;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ADPBqv1nsQy1jMr9cHUjBrE8nBO9SxIHgR5hgX7pnl8=;
        b=EzN7e4VS6+pR1sKV8ja8diySxJzpq6OVOx9Zmvf5TLhOMGWi/xRKuHj/CaIS1btDsc
         lf9piGKUUKBvzhtBSyYYBBXvlCQOhvhF0RKB81BNfEShxl2Zhuqs5ntE6EK6RX9xXVoP
         +IiGvYLAi67tJaOB9e3ReUe5sRfzmezk1h9Cz1H0suvNzdNukdltEy9/DSro5ekBme3A
         zTmH8F6EdnfFSHWkhYmdvYP3lGkTUOtPsr9he1/sW0OVnqaCyxE/58DFWYl1LY0Kh/UT
         x8f7T+pKummMq0XLF5OQigKlQPC+qn7KLGPVWrPsKfZjQlIRjymP7YenvObBo/O/Wn1C
         0Qww==
X-Forwarded-Encrypted: i=1; AJvYcCXcPe/c28zomaP+PSzIh5uEkB/gNnH4Nh6ghlhy0F4autmyqBeCfr8mHQqTIEuFOj8pyJGYpDLogslImsk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMZuO1t+0GCprC4oaRMwqlc5lpJoWSOE6zHetJiidur3nAK6el
	3cwZR0EImxYReaaEzoHH5Ekd32kPubG6FJxd3z1R6hdrln45wsfWGufbPGiD6n/IrCE=
X-Gm-Gg: ASbGncsUsY3NNntWwRp8M1cWtIB0+has54oGNwjhN5QXaXD2r92bnZiQzrbU1qNJW41
	UEzwF/lkg3OXXBwWwhkskDxlp0YVbvi9ecxWOBU+P+YG9Nl25p5RKk+3ZlHP+quZWHU1nVPVrAN
	+1vTHGWRUaflbIYeInVIBFxG6XfRwUtrerBKCkmVP+7xd/EDnqu+ud6wzoQ7U60iFGukrhxXBZt
	izGwa+2JPUAjPtXe2ee4B7zCF5QP4sJ4Zs39oxGx4Gmj24JWRsFm2aaOUqTbGWjiFcG6CaLgWAy
	WwdWrpjwjjNc0AYuu8fcxkk1Ff5yDXFu7iW42YFqIjfuKMlQDwjmDgd9078=
X-Google-Smtp-Source: AGHT+IH5FlEBgBhpIaKFt/ZqP/tgTMkpBf8AOBXDeEu9TZyI2338VGdq/Pc/ytgRQkhJH2aRJWXKWQ==
X-Received: by 2002:a17:90b:55cc:b0:30e:4bb3:2533 with SMTP id 98e67ed59e1d1-30e830ebd4cmr36089630a91.10.1747847109762;
        Wed, 21 May 2025 10:05:09 -0700 (PDT)
Received: from sunil-laptop ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f365f7a43sm3872992a91.47.2025.05.21.10.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 10:05:09 -0700 (PDT)
Date: Wed, 21 May 2025 22:35:00 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: syzbot <syzbot+2cae92ded758083f5bde@syzkaller.appspotmail.com>,
	aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	paul.walmsley@sifive.com, syzkaller-bugs@googlegroups.com,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	linux-acpi@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Jiri Kosina <jkosina@suse.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [syzbot] riscv/fixes test error: can't ssh into the instance (2)
Message-ID: <aC4HvHXJf17NAOzG@sunil-laptop>
References: <682b0412.a70a0220.3849cf.00b1.GAE@google.com>
 <8368aa6d-e5a9-4136-8eb6-c059bc888979@ghiti.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8368aa6d-e5a9-4136-8eb6-c059bc888979@ghiti.fr>

On Mon, May 19, 2025 at 06:35:15PM +0200, Alexandre Ghiti wrote:
> On 5/19/25 12:12, syzbot wrote:
> > Hello,
> > 
> > syzbot found the following issue on:
> > 
> > HEAD commit:    01534f3e0dd7 Merge tag 'riscv-fixes-6.15-rc6' of ssh://git..
> > git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git fixes
> > console output: https://syzkaller.appspot.com/x/log.txt?x=158796f4580000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=2c32351e59d854b7
> > dashboard link: https://syzkaller.appspot.com/bug?extid=2cae92ded758083f5bde
> > compiler:       riscv64-linux-gnu-gcc (Debian 12.2.0-13) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
> > userspace arch: riscv64
> > 
> > Downloadable assets:
> > disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/a741b348759c/non_bootable_disk-01534f3e.raw.xz
> > vmlinux: https://storage.googleapis.com/syzbot-assets/4ca1cbb891a9/vmlinux-01534f3e.xz
> > kernel image: https://storage.googleapis.com/syzbot-assets/5fb1db315d47/Image-01534f3e.xz
> > 
> > IMPORTANT: if you fix the issue, please add the following tag to the commit:
> > Reported-by: syzbot+2cae92ded758083f5bde@syzkaller.appspotmail.com
> > 
> > 
> > 
> > ---
> > This report is generated by a bot. It may contain errors.
> > See https://goo.gl/tpsmEJ for more information about syzbot.
> > syzbot engineers can be reached at syzkaller@googlegroups.com.
> > 
> > syzbot will keep track of this issue. See:
> > https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> > 
> > If the report is already addressed, let syzbot know by replying with:
> > #syz fix: exact-commit-title
> > 
> > If you want to overwrite report's subsystems, reply with:
> > #syz set subsystems: new-subsystem
> > (See the list of subsystem names on the web dashboard)
> > 
> > If the report is a duplicate of another one, reply with:
> > #syz dup: exact-subject-of-another-report
> > 
> > If you want to undo deduplication, reply with:
> > #syz undup
> > 
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
> 
> 
> So we hit the following warning:
> 
> [   33.466472][    C6] WARNING: CPU: 6 PID: 1 at fs/sysfs/group.c:131
> internal_create_group+0xa22/0xdd8
> [   33.471115][    C6] Modules linked in:
> [   33.475123][    C6] CPU: 6 UID: 0 PID: 1 Comm: swapper/0 Not tainted
> 6.15.0-rc6-dirty #3 PREEMPT
> [   33.476075][    C6] Hardware name: riscv-virtio,qemu (DT)
> [   33.476615][    C6] epc : internal_create_group+0xa22/0xdd8
> [   33.477194][    C6]  ra : internal_create_group+0xa22/0xdd8
> [   33.477696][    C6] epc : ffffffff80dd956c ra : ffffffff80dd956c sp :
> ffffffc600087b50
> [   33.478048][    C6]  gp : ffffffff89a659e0 tp : ffffffd681688000 t0 :
> ffffffc600087a80
> [   33.478377][    C6]  t1 : 1ffffff8c0010f78 t2 : ffffffff89b70a80 s0 :
> ffffffc600087cc0
> [   33.478690][    C6]  s1 : ffffffc600087c40 a0 : 0000000000000000 a1 :
> 0000000000000000
> [   33.478990][    C6]  a2 : 0000000000000002 a3 : ffffffff80dd956c a4 :
> 0000000000000000
> [   33.479291][    C6]  a5 : ffffffd681689000 a6 : fffffffff1f1f1f1 a7 :
> ffffffff80dd8b4a
> [   33.479602][    C6]  s2 : dfffffff00000000 s3 : ffffffff86a381a0 s4 :
> ffffffc600087dc0
> [   33.479967][    C6]  s5 : 0000000000000002 s6 : 0000000000000000 s7 :
> 0000000000000000
> [   33.480327][    C6]  s8 : 1ffffffff136df40 s9 : ffffffff89b6fa00 s10:
> 1ffffff8c0010fa4
> [   33.480673][    C6]  s11: ffffffff87bece20 t3 : 0000000000000000 t4 :
> fffffffef10e33b2
> [   33.481019][    C6]  t5 : fffffffef10e33b3 t6 : ffffffd68aabf2f8
> [   33.481326][    C6] status: 0000000200000120 badaddr: ffffffff80dd956c
> cause: 0000000000000003
> [   33.481962][    C6] [<ffffffff80dd956c>]
> internal_create_group+0xa22/0xdd8
> [   33.482681][    C6] [<ffffffff80dd9944>] sysfs_create_group+0x22/0x2e
> [   33.483136][    C6] [<ffffffff86289d82>] platform_profile_init+0x74/0xb2
> [   33.483555][    C6] [<ffffffff80061860>] do_one_initcall+0x198/0xa9e
> [   33.484158][    C6] [<ffffffff8620293e>] kernel_init_freeable+0x6d8/0x780
> [   33.484689][    C6] [<ffffffff8609fe54>] kernel_init+0x28/0x24c
> [   33.485208][    C6] [<ffffffff860c2542>] ret_from_fork+0xe/0x18
> [   33.485885][    C6] irq event stamp: 950699
> [   33.486072][    C6] hardirqs last  enabled at (950699):
> [<ffffffff80a6182c>] kasan_quarantine_put+0x1a8/0x208
> [   33.486710][    C6] hardirqs last disabled at (950698):
> [<ffffffff80a61726>] kasan_quarantine_put+0xa2/0x208
> [   33.487398][    C6] softirqs last  enabled at (950420):
> [<ffffffff801533a6>] handle_softirqs+0x98e/0x119c
> [   33.487930][    C6] softirqs last disabled at (950413):
> [<ffffffff80153fd6>] __irq_exit_rcu+0x2e8/0x53c
> 
> Because we don't have acpi enabled and then acpi_kobj is null
> (https://elixir.bootlin.com/linux/v6.15-rc6/source/fs/sysfs/group.c#L131).
> 
> The following patch fixes it, but not sure this is the right way, let me
> know if I should send it, it would be nice to have it in 6.15:
> 
> diff --git a/drivers/acpi/platform_profile.c
> b/drivers/acpi/platform_profile.c
> index ffbfd32f4cf1b..afbe4705d3e7a 100644
> --- a/drivers/acpi/platform_profile.c
> +++ b/drivers/acpi/platform_profile.c
> @@ -688,6 +688,9 @@ static int __init platform_profile_init(void)
>  {
>         int err;
> 
> +       if (acpi_disabled)
> +               return -ENOTSUPP;
> +
>         err = class_register(&platform_profile_class);
>         if (err)
>                 return err;
> 
Looks good to me. But I think Arnd/Rafael are better to confirm this.
I think HID driver enabling CONFIG_ACPI_PLATFORM_PROFILE can cause this
issue on both arm and riscv when they boot the same ACPI enabled kernel
with DT.

Thanks,
Sunil

