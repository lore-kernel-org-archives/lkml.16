Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9334A21
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 20:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743971590; cv=none; b=st9+fgCfsT0QELTpMJOmTEwUzVvhyzldlM+RZ99taWZgmm7uh5jWKzx5rpIEen9sZ0x/G5/AO3D3MmYSNGUFMvRvHc5mR8NbxNHdho63SFCcqhw4bWnYwiQs1XOc9C0RtlxI09GqnhEjbLiRDb8owhxjRpghXPVxmYaxBRwZTgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743971590; c=relaxed/simple;
	bh=l8YCi9eC+05fJ3/d71q5RMPrvv8LuNEQgShFfVnGq8A=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=h6Vf6XX+5xO2Zxomhhtp1TDb/JsNPyPp3F7affLoVwPVWfzhx8vnB+Jl0hhpqWAHZmoYmxndTfipA+6LrFng2OhIMT1IneABACWiTgkPH5ZImTOdW2Sd3ZHhtgywmV8muf6FZtiVhcyjIAlqWExWgWOiIVKr6xhwoMy68VmaniM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=KBzOmo26; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="KBzOmo26"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5e8be1bdb7bso6031883a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Apr 2025 13:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1743971586; x=1744576386; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MdEz55kNzHYFdi4q/uZdp9TDHMU6DyDhEK4cbQUpqJE=;
        b=KBzOmo26bYJZJIEdh0BBSZgTsO9hOsLi+vswvxNEwhCY6qJqDW9Fr1ztTijwMLVAQQ
         lmYOPsE180Z3u8043yoE0zDJrZbfNjiS78VIl5aUd21K4fOLvJXx6GkwUHQuaeBt/rSI
         iKi8FDCa5nL1VCWjZ9kN6NFTPPX3dZsowTotk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743971586; x=1744576386;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MdEz55kNzHYFdi4q/uZdp9TDHMU6DyDhEK4cbQUpqJE=;
        b=J7SflyR9od+CghmWdmQOkp+RJhvHkoXtW0Srg7K6W9jjpb2q6iOsHOS11+vGNeTYTv
         6StcHpBoZWvvpOmGLtr2NByMpXSf05fxNr46YRchYEPvj/w3r1+ESOoLp/6xQrzFcSNm
         LV2s8suZQA6mTLC2C72OUW6DRSG0qry4udAZm8PUE6GCMa0Sbdz6sjk25ocUS0rZqw5R
         kJXc2aVUq2VpdZExTEl1nfStLCf1t/YRkh1LblYJjMPUAZ9WhZlayAXtf+j8i2p2CuNk
         OhA8atSvk/oCBRoxWCMthsah1ytaCZxSLv7nxXM5fIBWNKOJyD9sri+8vocg80NypAnU
         CIYA==
X-Gm-Message-State: AOJu0Yyy3BzbFH2defdQ6w9ahnaR5PcAQVtasVgn1cUxYlpDnDAwA6gV
	77rnGxhAZnYJ1GNZswwA9J3RyDRoSI+oyPDoKo33d5o3NN+B91yNjA8yLAKRpqNBeWRV05y4Ghm
	2zUo=
X-Gm-Gg: ASbGncttkDu9+GMEMPlWGovOHdeIjPPfUyepa+N2tfmPEaYld8gEUIaPG5PWyUtaLmV
	jbqHkvCBwjAoPvrFwqOKoSNzqQb+MTemzj3Oc/b6hErzwBp+4oNgiJfIq6wlHiBD4kNCeUbsrTt
	gfbZcGsBik266ACkH8VyJlVH/77Ld7/jc3N8qhbBeYPOjbRl79xMeXH3duXONUy3po1cSj3O16o
	pY/atZvdQdU11NX2zffGCnwd1wRnKFKJy2g3cbWuKehTiXItmnnWIg4qfV/nV6M+W64TMmiAjwe
	mChzzzRNiH1yO8BAcnA2mkKLKAKCNeVueOymrW654aZ19wJ7F/PKRciy6p/vH7lbYqpSiY61HUw
	EzRCD+DXAcnSFSd3rZoE=
X-Google-Smtp-Source: AGHT+IF6Z/dk0nu9QR9bqm7ZfyhLGdmP/Ctied8N4XP5aQQGHlCimkxuS2nhi0Dj3OoeccjBeYB/dQ==
X-Received: by 2002:a05:6402:2b92:b0:5ee:486:9d4a with SMTP id 4fb4d7f45d1cf-5f0db8a1225mr5896810a12.33.1743971585661;
        Sun, 06 Apr 2025 13:33:05 -0700 (PDT)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f087ed19e7sm5639207a12.20.2025.04.06.13.33.04
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Apr 2025 13:33:04 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ac2af2f15d1so496787966b.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Apr 2025 13:33:04 -0700 (PDT)
X-Received: by 2002:a17:907:2d2b:b0:ac3:47b1:d210 with SMTP id
 a640c23a62f3a-ac7e76519bcmr447923366b.39.1743971583688; Sun, 06 Apr 2025
 13:33:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 6 Apr 2025 13:32:47 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgv_rS5dT8QY7Yh3V5UGup4BLHYToXNKWoH3C9+3YhY9w@mail.gmail.com>
X-Gm-Features: ATxdqUFYtQQvrKaRDdMoFfpCKWccFlAgBbHxrUXbiR8PJ58hUXbjMzthwWSoFHo
Message-ID: <CAHk-=wgv_rS5dT8QY7Yh3V5UGup4BLHYToXNKWoH3C9+3YhY9w@mail.gmail.com>
Subject: Linux 6.15-rc1
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It's been two weeks, and the merge window is now over.

As expected, this was one of the bigger merge windows, almost
certainly just because we had some pent-up development due to the
previous releases being impacted by the holiday season.

That said, while it's bigger than normal, it's not some kind of
record-breaking thing: we've had bigger releases, although not many.
The really big releases tend to be due to some long-running major
development being finally merged after many years, and this is not
that: this is just the "regular" kind of big.

It's big in both number of commits and in lines changed. The stats
look fairly normal, with - once again - another AMD GPU register
header file drop adding a ton of lines and standing out. But while
that is a big chunk in itself, it doesn't dominate the diff - there's
a lot of changes all over.

As always, below is the high-level "this is what I merged" view, which
gives a flavor of what's been going on, although it's obviously
colored by how certain subsystems send in their development in more
digestible and separate chunks, while other subsystems are less
granular. So while it gives some idea of what's been going on, you'd
need to look at the git tree to drill down into the particulars.

But at a high level it all looks very normal, with two thirds of the
patch being driver updates, and the rest being a fairly random mix of
the usual architecture updates, filesystems, core kernel (scheduling,
timers, MM, networking), and misc infrastructucture (devicetree
bindings, more rust infrastructure, zstd update, you name it).

Let's hope that despite the fairly sizable drop of new code, this
release ends up going as smoothly as the previous ones.

Yeah, right...

               Linus

---

Al Viro (1):
    dcache fixes

Alex Williamson (1):
    VFIO updates

Alexandre Belloni (2):
    i3c updates
    RTC updates

Alexei Starovoitov (4):
    bpf updates
    bpf relisient spinlock support
    bpf try_alloc_pages() support
    bpf fixes

Andreas Gruenbacher (1):
    gfs2 updates

Andrew Morton (5):
    MM updates
    non-MM updates
    MM hotfixes
    more MM updates
    more non-MM updates

Andy Shevchenko (1):
    auxdisplay updates

Ard Biesheuvel (1):
    EFI updates

Arnd Bergmann (6):
    SoC devicetree updates
    SoC driver updates
    SoC defconfig updates
    SoC arm platform updates
    asm-generic updates
    more SoC driver updates

Bartosz Golaszewski (1):
    gpio updates

Bjorn Andersson (2):
    hwspinlock updates
    remoteproc updates

Bjorn Helgaas (1):
    pci updates

Boqun Feng (2):
    RCU updates
    RCU fix

Borislav Petkov (5):
    x86 speculation mitigation updates
    x86 resource control updates
    EDAC updates
    RAS update
    EDAC documentation fix

Carlos Maiolino (1):
    xfs updates

Casey Schaufler (1):
    smack updates

Catalin Marinas (2):
    arm64 updates
    arm64 fixes

Christian Brauner (21):
    vfs mount API updates
    misc vfs updates
    vfs eventpoll updates
    vfs mount updates
    vfs pipe updates
    vfs pidfs updates
    vfs iomap updates
    vfs overlayfs updates
    vfs async dir updates
    vfs sysv removal
    vfs nsfs updates
    vfs mount namespace updates
    vfs pagesize updates
    vfs ceph updates
    vfs initramfs updates
    vfs afs updates
    vfs orangefs updates
    vfs file handling updates
    vfs rust updates
    tasklist_lock optimizations
    vfs fixes

Chuck Lever (1):
    nfsd updates

Daniel Thompson (1):
    kgdb updates

Dave Airlie (2):
    drm updates
    drm fixes

Dave Hansen (1):
    x86 TDX updates

Dave Jiang (1):
    Compute Express Link (CXL)  updates

David Kleikamp (1):
    jfs updates

David Sterba (1):
    btrfs updates

David Teigland (1):
    dlm updates

Dmitry Torokhov (1):
    input updates

Dominique Martinet (1):
    9p updates

Eric Biggers (4):
    fsverity updates
    fscrypt updates
    CRC updates
    CRC fixes

Fan Wu (1):
    ipe update

Gao Xiang (1):
    erofs updates

Geert Uytterhoeven (1):
    m68k updates

Greg KH (6):
    driver core updatesk
    char / misc / IIO driver updates
    char/misc fixes
    staging driver updates
    tty/serial driver updates
    USB / Thunderbolt updates

Greg Ungerer (1):
    m68knommu updates

Guenter Roeck (1):
    hwmon updates

Helge Deller (2):
    fbdev updates
    parisc updates

Herbert Xu (3):
    crypto updates
    crypto fix
    crypto fix

Huacai Chen (1):
    LoongArch updates

Ilpo J=C3=A4rvinen (2):
    x86 platform drivers updates
    x86 platform driver fixes

Ingo Molnar (17):
    locking updates
    objtool updates
    scheduler updates
    performance events updates
    core x86 updates
    x86 build updates
    x86 boot code updates
    x86/fpu updates
    x86 cleanups
    x86 SEV updates
    x86 platform updates
    misc locking fixes and updates
    misc x86 fixes and updates
    objtool fixes
    x86 fixes
    scheduler fixes
    perf event fix

Ira Weiny (1):
    libnvdimm updates

Jaegeuk Kim (1):
    f2fs updates

Jakub Kicinski (3):
    networking updates
    networking fixes
    networking fixes

James Bottomley (1):
    SCSI updates

Jan Kara (1):
    ext2, udf, and isofs updates

Jarkko Sakkinen (1):
    tpm updates

Jason Gunthorpe (3):
    fwctl subsystem
    rdma updates
    iommufd updates

Jassi Brar (1):
    mailbox updates

Jens Axboe (7):
    io_uring updates
    block updates
    io_uring zero-copy receive support
    io_uring epoll support
    more io_uring updates
    more io_uring updates
    more block updates

Jiri Kosina (1):
    HID updates

Joel Granados (1):
    sysctl updates

Joerg Roedel (1):
    iommu updates

Johannes Berg (1):
    UML updates

John Paul Adrian Glaubitz (1):
    sh updates

Jon Mason (1):
    ntb fixes

Jonathan Corbet (1):
    documentation updates

Juergen Gross (1):
    xen updates

Kees Cook (5):
    execve updates
    lib kunit selftest move
    hardening updates
    seccomp updates
    tiny pstore update

Kent Overstreet (3):
    bcachefs updates
    more bcachefs updates
    more bcachefs updates

Konstantin Komarov (1):
    ntfs3 updates

Lee Jones (3):
    MFD updates
    LED updates
    backlight updates

Len Brown (1):
    turbostat updates

Linus Walleij (1):
    pin control updates

Madhavan Srinivasan (1):
    powerpc updates

Mark Brown (4):
    regulator updates
    spi updates
    regmap updates
    spi fixes

Masahiro Yamada (1):
    Kbuild updates

Masami Hiramatsu (1):
    probes updates

Mauro Carvalho Chehab (1):
    media updates

Michael Ellerman (1):
    more powerpc updates

Michael Tsirkin (1):
    virtio updates

Micka=C3=ABl Sala=C3=BCn (1):
    landlock updates

Miguel Ojeda (2):
    Rust updates
    Rust fix

Mike Marshall (1):
    orangefs update

Miklos Szeredi (1):
    fuse updates

Mikulas Patocka (1):
    device mapper updates

Mimi Zohar (1):
    ima updates

Miquel Raynal (1):
    mtd updates

Namhyung Kim (1):
    perf tools updates

Namjae Jeon (1):
    exfat updates

Nick Terrell (1):
    zstd updates

Niklas Cassel (1):
    ata updates

Palmer Dabbelt (1):
    RISC-V updates

Paolo Bonzini (1):
    kvm updates

Paul McKenney (3):
    nolibc updates
    kernel memory model updates
    stop-machine update

Paul Moore (2):
    lsm updates
    selinux updates

Petr Mladek (3):
    printk updates
    livepatching updates
    more printk updates

Petr Pavlu (1):
    modules updates

Rafael Wysocki (6):
    ACPI updates
    power management updates
    thermal control updates
    more thermal control updates
    more ACPI updates
    power management fix

Rob Herring (1):
    devicetree updates

Russell King (1):
    ARM and clkdev updates

Sebastian Reichel (2):
    power supply and reset updates
    HSI update

Serge Hallyn (1):
    capabilities update

Shuah Khan (2):
    Kselftest updates
    kunit updates

Stephen Boyd (1):
    clk updates

Steve French (4):
    smb client updates
    smb server updates
    smb server fixes
    more smb client updates

Steven Rostedt (10):
    tracing / sorttable updates
    ftrace updates
    latency tracing updates
    tracing updates
    tracing tooling updates
    ktest update
    tracing documentation fix
    ring-buffer updates
    tracing fixes
    ring-buffer updates

Takashi Iwai (2):
    sound updates
    sound fixes

Takashi Sakamoto (1):
    firewire update

Ted Ts'o (1):
    ext4 updates

Tejun Heo (4):
    workqueue update
    cgroup updates
    sched_ext updates
    sched_ext fixes

Thomas Bogendoerfer (1):
    MIPS updates

Thomas Gleixner (12):
    irq updates
    MSI irq updates
    irq driver updates
    futex update
    timer core updates
    timer cleanups
    VDSO infrastructure updates
    MSI irq fix
    clocksource/event updates
    timer fix
    more irq updates
    timer cleanups

Trond Myklebust (1):
    NFS client updates

Tzung-Bi Shih (1):
    chrome platform updates

Ulf Hansson (2):
    MMC updates
    pmdomain updates

Uwe Kleine-K=C3=B6nig (1):
    pwm updates

Vasily Gorbik (2):
    s390 updates
    more s390 updates

Vinod Koul (4):
    soundwire updates
    phy updates
    dmaengine updates
    soundwire fix

Vlastimil Babka (1):
    slab updates

Wei Liu (1):
    hyperv updates

Wim Van Sebroeck (1):
    watchdog updates

Wolfram Sang (1):
    i2c updates

Yury Norov (1):
    bitmap updates
