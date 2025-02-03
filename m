Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED1F17C2
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 00:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738542436; cv=none; b=qtbGXDTR0cW72h6Ia07DzoITK5y0eXw2KoeVoHnQl36JCIWgBMqsctUSxXet2N9z9ifa22N3Tpxczlm36PkmYyyE8MTz0lrV1UxLjNsUsM3dUZ7XwXuiWmOW0ieeyJl5Twr8l0wXECQGwQJJIpZGwbW9UDTPIvV4xlvR2HDD62Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738542436; c=relaxed/simple;
	bh=7YK2f3ZOZK3xBDTdYU+KVjIaKpEJWc7yVBKZai6lyJk=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=dIk8lFDZmGcDOQTPcuaWpWQ4JOhFlQVG9Hxn8+KsDF5k/PfMWaRq2cNnRNH1rHCbw9N1VBlatUEuonSk95SwPNwa5uHjlNs7rvWg2kOOU4l/8njErzPP7Q4rtzMbr29fZCmlWNXdUZDzC5D86Nl95I0SEy6UjAa2WuGMqvmDpv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=SZDuy7ul; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="SZDuy7ul"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ab6ed8a3f6aso549286466b.2
        for <linux-kernel@vger.kernel.org>; Sun, 02 Feb 2025 16:27:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1738542432; x=1739147232; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gzeMTX54+GgflXYifh4U86Lvz49xOOXYr95A+NMUbhM=;
        b=SZDuy7ulT5F5ys3+jS9CoThElzcYLUPWNPJSgKpOWXTkecHT+oL+135WXuZxBIXiiW
         qEMhgycZt45859NbrMppZ4pFqnz2ngdnWJ1GDrwa0AP7Zsa1LxPXqNNeW2zBapNaudEo
         MmuDWHw9HXzmtlxfVjDAgyKQ9R51plK8ly+Kw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738542432; x=1739147232;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gzeMTX54+GgflXYifh4U86Lvz49xOOXYr95A+NMUbhM=;
        b=ttOCE6GiO1dEPM0HUObcFybpaq0b6YHB9s9f4qFvW+a84ZEJau+hJpRUZRR8GxSu2D
         i9w6znpnNMd2qT46lYDr6XlihGniZ+ppSFxOMFhIu20uycnwSdMQQWkZSl8yzqu48R3z
         uUnPLe08MuP65Ff2NPBp3BJv67++/UDdU2z9zHTviBA2h1tW0y5fP4c6mPui5kPyTDHh
         7Yvkx2oluqXfIqHwnsCdGpxdOcvIJE6Rwvpg6QDXNpOmj7NTwez6UujQkFxPq8oJ+lXx
         QWoBWzUqvjDQunZrjagYfOERtXuKOae4SElExA41BSuvuun3NkCt5kzuUFETj1HENJTN
         eRiA==
X-Gm-Message-State: AOJu0YwtRw86KZIMGSRWsUBqio1UXoiArw/ak/bfvyrmGIWv5a/VlnDz
	37kRvbYE/I0F6ClVoXeUhQ7AHf7NAOVRbACpRLSdGNSQNqCf+/O5EPbnfQuU6L9TW84UkgwVKz1
	MjTU=
X-Gm-Gg: ASbGncvKydNJ4tZLKc/aAgZ6xAjmmGdtV4W3zwJcjLwwX4awU2Ayivps9V/wK74ZBH0
	xmfHpM4Kztb15wYMhLofCEy7nFF8jvp7OjFw1kbMuYTYWoWuFh+m7fM0BhYuC5KY2C2S7N46zDO
	gD/lb0oTrxpXgwP9sWgsyJZ8mSeYucBiItYs2XOCp0ZP5JmzmbMYlAnzq59pxLsu5k3sXwt+dFM
	nMeNpsv38pC+IP3gZqghNUAegd7xT7N/T3eg3aH9cyhnSm/NVAnXPG1SpXd+QO0WNOqDFKlX41l
	yc3T8FF3GTOMNxpBCsxgqK0RnOt7Lp5WlVxHbsk8PJB/ewFcoXdK02dag29vpobuag==
X-Google-Smtp-Source: AGHT+IHjg39cHYRfAZs5h7xh3F52b5IIB0tvoWF71DlTXF7ssWT50c12AnbMdCwukmPeL5RlxQosug==
X-Received: by 2002:a17:906:c143:b0:ab6:597a:f5d7 with SMTP id a640c23a62f3a-ab6cfce750fmr2268995366b.24.1738542431559;
        Sun, 02 Feb 2025 16:27:11 -0800 (PST)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com. [209.85.218.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab702d70c8fsm436304766b.161.2025.02.02.16.27.10
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Feb 2025 16:27:11 -0800 (PST)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-aaeef97ff02so605377766b.1
        for <linux-kernel@vger.kernel.org>; Sun, 02 Feb 2025 16:27:10 -0800 (PST)
X-Received: by 2002:a17:907:3ea8:b0:ab6:efd6:3292 with SMTP id
 a640c23a62f3a-ab6efd637a3mr1428236566b.0.1738542430308; Sun, 02 Feb 2025
 16:27:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 2 Feb 2025 16:26:53 -0800
X-Gmail-Original-Message-ID: <CAHk-=wicYNCkEgH06w0mpR+GJhJ_ywe0BLTTFXBAj1+y0dqe4Q@mail.gmail.com>
X-Gm-Features: AWEUYZlXnvhvu2f4hQW_uPbom7U2QPI3mufFWi5ir3dJ9ZC1_PUglw-OxOjLa3o
Message-ID: <CAHk-=wicYNCkEgH06w0mpR+GJhJ_ywe0BLTTFXBAj1+y0dqe4Q@mail.gmail.com>
Subject: Linux 6.14-rc1
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Two weeks have passed, and the merge window is over.

This is actually a _tiny_ merge window, and that's ok. The holidays
clearly meant that people did less development than during a normal
cycle, and that then shows up as a much smaller-than-average release.
I really felt like this year we got the whole holiday season release
timing right, and this is just another sign of that.

Of course, "tiny" for us still means that there's half a million lines
changed, and more than 10k commits in there - but only barely. In
fact, not counting merges there's only something like 9.3k commits. So
the shortlog is still much too large to post - it's really "tiny" only
when compared to our normal releases.

Aside from the size, the stats otherwise look fairly normal: pretty
much exactly half of the diff is drivers, with the rest being a pretty
normal mix of arch updates, filesystem code, tooling and
documentation. And all the usual changes spread all over.

Let's hope that a small release also ends up meaning smooth sailing
during the stabilization phase. That's obviously guaranteed, but
fingers crossed...

            Linus

---

Al Viro (3):
    vfs d_revalidate updates
    hostfs fix
    misc vfs cleanups

Alex Williamson (1):
    vfio updates

Alexander Gordeev (3):
    s390 updates
    more s390 updates
    s390 fixes

Alexandre Belloni (2):
    i3c updates
    RTC updates

Alexei Starovoitov (1):
    bpf updates

Andreas Gruenbacher (1):
    gfs2 updates

Andreas Larsson (1):
    sparc updates

Andrew Morton (3):
    non-MM updates
    MM updates
    misc fixes

Andy Shevchenko (1):
    auxdisplay updates

Anna Schumaker (1):
    NFS client updates

Ard Biesheuvel (1):
    EFI updates

Arnd Bergmann (5):
    SoC arm platform code updates
    new SoC support
    SoC devicetree updates
    SoC driver updates
    SoC defconfig updates

Bartosz Golaszewski (3):
    gpio updates
    power sequencing updates
    gpio fixes

Bjorn Andersson (1):
    remoteproc updates

Bjorn Helgaas (2):
    pci updates
    pci fix

Borislav Petkov (8):
    x86 RAS updates
    EDAC updates
    x86 CPU speculation update
    x86 resource control updates
    x86 microcode loader updates
    x86 SEV updates
    x86 cpuid updates
    misc x86 updates

Brian Cain (1):
    hexagon updates

Carlos Maiolino (1):
    XFS updates

Casey Schaufler (1):
    smack update

Christian Brauner (10):
    vfs netfs updates
    /proc/kcore updates
    misc vfs updates
    pidfs updates
    cred refcount updates
    pid_max namespacing update
    vfs mount updates
    vfs libfs updates
    vfs direct-io updates
    afs updates

Chuck Lever (1):
    nfsd updates

Corey Minyard (1):
    ipmi updates

Damien Le Moal (1):
    ata updates

Daniel Thompson (1):
    kgdb updates

Dave Airlie (2):
    drm updates
    drm fixes

Dave Hansen (1):
    x86 TDX updates

Dave Jiang (1):
    Compute Express Link (CXL) updates

David Sterba (1):
    btrfs updates

David Teigland (1):
    dlm updates

Dmitry Torokhov (1):
    input updates

Eric Biggers (2):
    CRC updates
    CRC cleanups

Frederic Weisbecker (1):
    kthread updates

Gao Xiang (1):
    erofs updates

Geert Uytterhoeven (1):
    m68k updates

Greg KH (6):
    USB / Thunderbolt driver updates
    staging driver updates
    Char/Misc/IIO driver updates
    tty / serial driver updates
    driver core and debugfs updates
    debugfs fix

Greg Ungerer (1):
    m68knommu update

Guenter Roeck (1):
    hwmon updates

Helge Deller (2):
    fbdev updates
    parisc architecture updates

Herbert Xu (1):
    crypto updates

Huacai Chen (1):
    LoongArch updates

Ilpo J=C3=A4rvinen (1):
    x86 platform driver updates

Ilya Dryomov (1):
    ceph updates

Ingo Molnar (8):
    locking updates
    objtool updates
    performance events updates
    x86 cleanups
    scheduler updates
    x86 boot updates
    x86 fix
    x86 mm updates

Jaegeuk Kim (1):
    f2fs updates

Jakub Kicinski (1):
    networking fixes

James Bottomley (1):
    SCSI updates

Jan Kara (3):
    inotify update
    isofs update
    fsnotify pre-content notification support

Jarkko Sakkinen (2):
    keys updates
    TPM update

Jason Gunthorpe (2):
    iommufd updates
    rdma updates

Jassi Brar (1):
    mailbox updates

Jens Axboe (4):
    block updates
    io_uring updates
    more io_uring updates
    more block updates

Jiri Kosina (1):
    HID updates

Joel Granados (1):
    sysctl table constification

Joerg Roedel (1):
    iommu updates

John Paul Adrian Glaubitz (1):
    sh updates

Jonathan Corbet (2):
    Documentation updates
    documentation fixes

Juergen Gross (1):
    xen updates

Kees Cook (6):
    execve updates
    pstore updates
    hardening updates
    AT_EXECVE_CHECK
    hardening fixes
    AT_EXECVE_CHECK selftest fix

Kent Overstreet (2):
    bcachefs updates
    bcachefs fixes

Konstantin Komarov (1):
    ntfs3 fixes

Lee Jones (2):
    mfd updates
    LED updates

Len Brown (1):
    turbostat updates

Linus Walleij (1):
    pin control updates

Madhavan Srinivasan (2):
    powerpc updates
    powerpc fixes

Mark Brown (5):
    regmap updates
    regulator updates
    spi updates
    spi fix
    regulator fixes

Masahiro Yamada (1):
    Kbuild updates

Masami Hiramatsu (2):
    probes updates
    bootconfig fix

Mauro Carvalho Chehab (2):
    media updates
    media fix

Max Filippov (1):
    xtensa updates

Michael Tsirkin (1):
    virtio updates

Micka=C3=ABl Sala=C3=BCn (1):
    landlock updates

Miguel Ojeda (1):
    rust updates

Mike Marshall (1):
    orangefs fix

Miklos Szeredi (1):
    fuse updates

Mikulas Patocka (1):
    device mapper updates

Mimi Zohar (1):
    integrity updates

Miquel Raynal (1):
    MTD updates

Namhyung Kim (2):
    perf-tools updates
    perf tools fixes

Niklas Cassel (1):
    more ata updates

Palmer Dabbelt (1):
    RISC-V updates

Paolo Abeni (1):
    networking updates

Paolo Bonzini (1):
    kvm updates

Paul McKenney (2):
    CSD-lock update
    stop_machine update

Paul Moore (4):
    lsm updates
    selinux updates
    audit update
    audit fix

Petr Mladek (2):
    printk updates
    livepatching updates

Petr Pavlu (1):
    modules updates

Rafael Wysocki (5):
    power management updates
    ACPI updates
    thermal control updates
    more power management updates
    ACPI fixes

Richard Weinberger (2):
    UBI and UBIFS updates
    UML updates

Rob Herring (1):
    devicetree updates

Russell King (1):
    ARM updates

Sebastian Reichel (1):
    power supply and reset updates

Serge Hallyn (1):
    capabilities updates

Shuah Khan (3):
    kselftest updates
    kunit updates
    nolibc updates

Simona Vetter (1):
    drm fixes

Stafford Horne (1):
    OpenRISC updates

Stephen Boyd (1):
    clk updates

Steve French (3):
    smb server updates
    smb client updates
    more smb client updates

Steven Rostedt (9):
    trace ring-buffer updates
    ftrace updates
    scipts/sorttable updates
    ktest updates
    tracing updates
    fgraph updates
    trace fing buffer fix
    runtime verifier and osnoise fixes
    rv and tools/rtla updates

Takashi Iwai (2):
    sound updates
    sound fixes

Takashi Sakamoto (1):
    firewire updates

Tejun Heo (1):
    sched_ext updates

Tetsuo Handa (1):
    tomoyo updates

Thomas Bogendoerfer (2):
    MIPS updates
    MIPS fix

Thomas Gleixner (2):
    timer and timekeeping updates
    interrupt subsystem updates

Tzung-Bi Shih (2):
    chrome platform updates
    chrome platform firmware updates

Uladzislau Rezki (1):
    RCU updates

Ulf Hansson (2):
    MMC updates
    pmdomain updates

Uwe Kleine-K=C3=B6nig (2):
    pwm updates
    pwm fixes

Vinod Koul (3):
    dmaengine updates
    phy updates
    soundwire updates

Vlastimil Babka (1):
    slab updates

Wei Liu (1):
    hyperv updates

Will Deacon (2):
    arm64 updates
    KVM/arm64 updates

Wim Van Sebroeck (1):
    watchdog updates

Wolfram Sang (2):
    i2c updates
    i2c fixes

Yury Norov (1):
    bitmap updates
