Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99BA810FD
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 21:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749417493; cv=none; b=fFXbzVagOkv/l497nphU2Q/a3Pvy1pFtgyQq12ODwvzc5EM66/NyibpQ7JC/2cbqbMAFA+MJ5mmfiNPHXU7OhAaIOelZkDh8fFc3x3PzahRHon4YxwSYilHEDB2TkE5h/HImJGM0obOznbmpllvS3NCDEl63CkdNd0KGFfIT6JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749417493; c=relaxed/simple;
	bh=l90xeamQ51uDiosUiP80MPsrWU+6pGkItQZUwGxCT+w=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=H4CuIQAnMpvoNN5u6MhMXALd7jGqceSdShiMIiYLGJ6Ib5/OGuuxoGpNq/rCxQEkM3k22rNCOPDCr9FnPAucxhTIbWzygOwBt8miVepP0dOhMN2oSjpf45ZPRvR/L0vla1Ziusf2h7u38DjhNE80uGCW1SYC6D8R+DlXy/gHh54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=GMId04DH; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="GMId04DH"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-acb5ec407b1so663530966b.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 14:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1749417487; x=1750022287; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=L7ovmnDHc5nmrVz/1GKpgrrCSsaUP5s1d2DeuH6+hfY=;
        b=GMId04DHkc4RgOzVZQuS4OIHUnt55ci5tJJ2lS9XKALl55vWVLgrAIYQRK/VJ1B32d
         cBu8Bq8Mxoza7rlFTxnYorUYnTRt0qMTVR4FeaoBe8z9KwnTvvNMOGV9I7lqhDFexpYh
         dz+bUMoZoTHVRN/kJUHp0J3O84NIA/JQnaaCw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749417487; x=1750022287;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L7ovmnDHc5nmrVz/1GKpgrrCSsaUP5s1d2DeuH6+hfY=;
        b=odLI6qeYC25F5P8sF7Amm3Y1kfcOiHaKHEXYoutZYpNBmx5oNAI5Z/sp2MV+GfSj/h
         S24Z+vjmzy8J8VkXDvYuj+VbYAaSX7MxZ9J5m1i9NgoZyMHgBVWwjElNX1rvnAdQCW9F
         oYKs4xN0vBrs03a5SOXpOiagV2u1FWR/8sfJeXWk2dVj60ekT2tN0VdexUOncadvRUgP
         M+axrvLogEaX23yygSXBUSUdRWZ/yxrz+hR4QaaCCsRYzghjplmet/IgYIgA+mU3BmF+
         xujLovKkBD1lL/SmSO7bbM1UOKdQn351vx7b3v4rlPmWMOe0oW+qBIs2y/W9EsN5BEPj
         J5Nw==
X-Gm-Message-State: AOJu0Yyuhvx4Jagqh1V0Vb2P07BeqEOKYuKN74S5IOlPwxDxoQfV3ykQ
	r+/J7Vyi6yxuriDfS971i5+Ddu46AbUz/rmOQBVYVW+D/pgwmYUjFeoM5UNneY6MytW10hLKJz9
	M+yNg
X-Gm-Gg: ASbGnctQpHeII+gL3M+CrR4pWTEScFUmBddg6+P3ud/g3S9CY+SM7qnUhokmfZpg55K
	B57v+69DdULi5jQJkvh8jBdzxjKPf/78EHOsbD2ah+ESZbFBPFoz2sp76LZr1P5cUpWTBPKmHQ8
	A0Hk1C4lH6WJ0AAcEyBous4kOZighc44w8RvPy9xPcIB8yZv6etKofu6Jram+Xzz+uJqkTU+MPY
	JQBl7lVJZfSJsUxD6A12uqKb336fQLSzwOPVd4OZss36E098k/dC1zujaJWZB49+eP0tQVOoLr9
	hGDBxDJ4q2thFrDJ1LrKlnnMsNCCtKRIjWZ8LF5u/eBbNJy7NEZ+ND0A6RLGH/sQEoz/MOoPgvD
	wCjD329JiSrhypZb9jGV4YF6v+g==
X-Google-Smtp-Source: AGHT+IGhkjcCBw/gIwg+LQdZK95vQFnSlRJmmXKVtavszuSLve1NgYZwubC908KQKdHxN+9avjCq5w==
X-Received: by 2002:a17:907:3e12:b0:ad2:425c:27ce with SMTP id a640c23a62f3a-ade1aa5d448mr993702366b.2.1749417487438;
        Sun, 08 Jun 2025 14:18:07 -0700 (PDT)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1db57610sm465473766b.52.2025.06.08.14.18.06
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Jun 2025 14:18:06 -0700 (PDT)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6077d0b9bbeso3831103a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 14:18:06 -0700 (PDT)
X-Received: by 2002:a05:6402:2551:b0:607:116e:108d with SMTP id
 4fb4d7f45d1cf-6077479d4b5mr8354701a12.21.1749417486228; Sun, 08 Jun 2025
 14:18:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 8 Jun 2025 14:17:49 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiiqYoM_Qdr3L15BqJUyRi6JjR02HSovwwz+BXy7DdVeA@mail.gmail.com>
X-Gm-Features: AX0GCFtSCgYqJ4DIx7aBYasl5Fn7O0cdPMbzP9_1i-16I3AQxqaq6AnURSC8yEM
Message-ID: <CAHk-=wiiqYoM_Qdr3L15BqJUyRi6JjR02HSovwwz+BXy7DdVeA@mail.gmail.com>
Subject: Linux 6.16-rc1
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

So it's Sunday afternoon, and we all know what that means by now: the
merge window is closed, rc1 has been cut and pushed out, and we're all
supposed to start testing (and fixing) all the new code.

I think we had a fairly normal merge window, although I did get the
feeling that there were a few more "late straggler" pull requests than
usual.  Not to a huge degree, but there was definitely an upward bump
at the end of the second week.

But on the whole, all the stats look pretty normal: about half the
diff is driver updates (all over, although as usual gpu and networking
account for a fairly large chunk of it).

On the non-driver front, it looks like basically one third arch
updates, one third documentation and tooling (perf tool and
selftests), and one third "the rest".

That last part is where all the core changes go: filesystems, core
kernel and MM, networking etc. Typically not huge changes, but often
some of the more important ones. Although maybe that "more important"
comment just shows my personal biases.

Anyway, mergelog below giving at least an approximate high-level feel
for what I've merged this time around. The full shortlog is as always
much too big. We had just under 13k non-merge commits, and closer to a
thousand merges. And 1783 unique author names...

                      Linus

---

Al Viro (4):
    mount propagation fix
    UFS updates
    automount updates
    mount fixes

Alex Williamson (1):
    VFIO updates

Alexandre Belloni (2):
    i3c updates
    RTC updates

Alexei Starovoitov (2):
    bpf updates
    bpf fixes

Andreas Gruenbacher (2):
    gfs2 updates
    gfs2 fix

Andreas Hindborg (1):
    configfs updates

Andrew Morton (5):
    MM updates
    non-MM updates
    more MM updates
    misc fixes
    more MM updates

Anna Schumaker (1):
    NFS clent updates

Ard Biesheuvel (1):
    EFI updates

Arnaldo Carvalho de Melo (1):
    perf tools updates

Arnd Bergmann (6):
    SoC driver updates
    ARM SoC updates
    SoC defconfig updates
    SoC devicetree updates
    sophgo SoC devicetree updates
    compiler version requirement update

Bartosz Golaszewski (1):
    gpio updates

Bjorn Andersson (2):
    remoteproc updates
    rpmsg updates

Bjorn Helgaas (1):
    pci updates

Borislav Petkov (5):
    x86 resource control updates
    EDAC updates
    mtrr update
    AMD SEV update
    EDAC fix

Carlos Maiolino (1):
    xfs updates

Casey Schaufler (1):
    smack update

Christian Brauner (12):
    vfs directory lookup updates
    final writepage conversion
    vfs mount api conversions
    misc vfs updates
    vfs freezing updates
    vfs mount updates
    pidfs updates
    coredump updates
    iomap updates
    vfs selftests updates
    vfs fixes
    netfs updates

Chuck Lever (1):
    nfsd updates

Corey Minyard (1):
    IPMI updates

Damien Le Moal (1):
    ata updates

Dan Williams (1):
    trusted security manager (TSM) updates

Dave Airlie (2):
    drm updates
    drm fixes

Dave Hansen (1):
    Intel software guard extension (SGX) updates

Dave Jiang (1):
    Compute Express Link (CXL) updates

David Kleikamp (1):
    jfs updates

David Sterba (2):
    btrfs updates
    btrfs fix

David Teigland (1):
    dlm updates

Dmitry Torokhov (1):
    input updates

Eric Biggers (2):
    fscrypt update
    CRC updates

Fan Wu (1):
    IPE update

Gao Xiang (1):
    erofs updates

Geert Uytterhoeven (1):
    m68k updates

Greg KH (6):
    driver core updates
    LICENSES update
    staging driver updates
    char / misc / iio driver updates
    tty/serial updates
    USB / Thunderbolt updates

Greg Ungerer (1):
    m68knommu updates

Guenter Roeck (1):
    hwmon updates

Heiko Carstens (2):
    s390 updates
    more s390 updates

Helge Deller (2):
    fbdev updates
    parisc updates

Herbert Xu (3):
    crypto updates
    crypto fix
    crypto fixes

Huacai Chen (1):
    LoongArch updates

Ilpo J=C3=A4rvinen (1):
    x86 platform drivers updates

Ilya Dryomov (1):
    ceph updates

Ingo Molnar (9):
    locking updates
    objtool updates
    scheduler updates
    perf events updates
    core x86 updates
    x86 cleanups
    x86 debug updates
    x86 vdso updates
    x86 build updates

Jaegeuk Kim (1):
    f2fs updates

Jakub Kicinski (1):
    networking fixes

James Bottomley (2):
    SCSI updates
    SCSI fixes

Jan Kara (2):
    fsnotify updates
    ext2 and isofs updates

Jarkko Sakkinen (1):
    tpm updates

Jason Gunthorpe (1):
    rdma updates

Jassi Brar (1):
    mailbox updates

Jens Axboe (4):
    block updates
    io_uring updates
    io_uring fixes
    more block updates

Jiri Kosina (1):
    HID updates

Joel Fernandes (1):
    RCU updates

Joel Granados (1):
    sysctl updates

Joerg Roedel (1):
    iommu updates

Johannes Berg (1):
    UML updates

John Paul Adrian Glaubitz (1):
    sh updates

Jonathan Corbet (1):
    documentation updates

Juergen Gross (1):
    xen updates

Kees Cook (3):
    seccomp updates
    hardening updates
    hardening fixes

Kent Overstreet (2):
    bcachefs updates
    more bcachefs updates

Konstantin Komarov (1):
     ntfs updates

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

Marek Szyprowski (1):
    dma-mapping updates

Mark Brown (5):
    regmap updates
    regulator updates
    spi updates
    regulator fix
    more spi updates

Masahiro Yamada (1):
    Kbuild updates

Masami Hiramatsu (1):
    bootconfig updates

Mauro Carvalho Chehab (1):
    media updates

Max Filippov (1):
    xtensa updates

Michael Tsirkin (1):
    virtio updates

Michal Simek (1):
    microblaze update

Miguel Ojeda (1):
    Rust updates

Mike Marshall (1):
    orangefs update

Miklos Szeredi (2):
    fuse updates
    overlayfs update

Mikulas Patocka (1):
    device mapper updates

Mimi Zohar (1):
    integrity updates

Miquel Raynal (1):
    MTD updates

Namjae Jeon (1):
    exfat updates

Palmer Dabbelt (1):
    RISC-V updates

Paolo Abeni (1):
    networking updates

Paolo Bonzini (2):
    kvm updates
    more kvm updates

Paul McKenney (2):
    rate-limit updates
    lkmm updates

Paul Moore (3):
    lsm update
    selinux updates
    audit updates

Petr Pavlu (1):
    module updates

Rafael Wysocki (6):
    thermal control updates
    ACPI updates
    power management updates
    more power management updates
    ACPI fixes
    power management fixes

Richard Weinberger (1):
    JFFS2 and UBIFS fixes

Rob Herring (1):
    devicetree updates

Russell King (1):
    ARM fixes

Sebastian Reichel (1):
    power supply and reset updates

Shuah Khan (2):
    Kselftest updates
    kunit updates

Simona Vetter (1):
    more drm fixes

Stafford Horne (1):
    OpenRISC updates

Stephen Boyd (1):
    clk updates

Steve French (3):
    smb client updates
    smb server updates
    more smb client updates

Steven Rostedt (5):
    tracing tools updates
    tracing updates
    ring-buffer updates
    tracing fixes
    more tracing fixes

Takashi Iwai (2):
    sound updates
    sound fixes

Ted Ts'o (1):
    ext4 updates

Tejun Heo (5):
    workqueue updates
    cgroup updates
    sched_ext updates
    cgroup fix
    sched_ext fixes

Tetsuo Handa (1):
    tomoyo update

Thomas Bogendoerfer (1):
    MIPS updates

Thomas Gleixner (13):
    core entry code updates
    irq core updates
    irq controller updates
    irq cleanups
    MSI updates
    timer cleanups
    clocksource updates
    timer core updates
    irq fix
    x86 perf fix
    timer fix
    x86 fixes
    timer cleanup

Thomas Wei=C3=9Fschuh (1):
    nolibc updates

Tzung-Bi Shih (1):
    chrome-platform updates

Ulf Hansson (2):
    pmdomain updates
    MMC updates

Uwe Kleine-K=C3=B6nig (2):
    pwm updates
    pwm fixes

Vinod Koul (3):
    soundwire updates
    phy updates
    dmaengine updates

Vlastimil Babka (1):
    slab updates

Wei Liu (1):
    hyperv updates

Will Deacon (2):
    arm64 updates
    arm64 fixes

Wim Van Sebroeck (1):
    watchdog updates

Wolfram Sang (1):
    i2c updates

Yury Norov (1):
    bitmap updates
