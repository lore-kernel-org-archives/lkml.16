Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D374213AA2D
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 22:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747002278; cv=none; b=PVUEEU0L1fT5qfZC0xZsZ50xUOLgdI/9m6TcyPD0b58VybqF1keKy2MwurAz5D6nVEjcasA2kIR+PXb9j3evAzLCzuP50AxTfe0aZu0o7zW9H7f+Zz5Zo6YAyQ6OD0gYsYJkYNvEONYMA5gElc1AFeVE+Iuny/XvNj1mmcUhxwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747002278; c=relaxed/simple;
	bh=w8dNR1pV7hCBX6dGsF70iDrBPGgCn3bdB5ARyC08dKw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=mUzr7/igq+D1dbyMqtau48hrPT0lnM9mqX/VntXNcMjINHm6tCzIRI232TcD3PL/jRxlshx6XRo9OC8sWvxrivpZca4sCzoaah8zzozwwPkX6RKmNlaSDy4W4GzOCH/JRhs0YoynMqSxPVZNnfjzqvHBlq69ZFygGH7NxVO0erU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=NRSNefHC; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="NRSNefHC"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ac34257295dso655832266b.2
        for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 15:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1747002273; x=1747607073; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LSBolwA+AXOLDL8URBR7/zSm3gjtIgXvjKahdC8WIi4=;
        b=NRSNefHCjAIH4pgzoSpAqwcNELDgb40YrfDdBkPTeEaW5jV+9MsbXLWsTTb4yzn8ie
         9mfVZCHz1RdKcI7Sbkqs0xF12iYeX+AB88j6wejBQcm9Z0DNzdGInSjYOjNEkpvMgSRs
         lEJ8fWTW9xyRDLjLqsBnuNSOcPZnBrYbeGYQM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747002273; x=1747607073;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LSBolwA+AXOLDL8URBR7/zSm3gjtIgXvjKahdC8WIi4=;
        b=dwrDAcoN/RfxCmN55Ac/BuXH4YDMUd9UUJwq3wPyZkmNQDIAIOmaxqpHhC+XUce70W
         NoJ+5zwkBFtoKOF1SHvwuSSxMomsHhdlrSV6iTeyNUf6lSVlKYUGZ6KmjO8AWOV83vu/
         coPOQabq6TnhyWQquxB+f4wwqXIEQUMVCHmOD1OElKqMig93Bmf0rk7PyuwoUGvkYu/v
         J0pE4wsK/2t4h3DCKroboIlWUvJomdc028CPfqBvGRhm55AuLolo2bzZwTs3Zx6n7jf3
         cIgXZx1cvfFbEQid1VQKRb708R1OdcRP2M+EP0Ffd01xqJrwJb9aPdDAA6E0hIJ+xCsx
         fb4g==
X-Gm-Message-State: AOJu0Yyc10TCT470kM4iHKMX2/3VRqxQemMLcBvOEygCnW4/i5jyyPu3
	TdsePinJbgulBTk6H4040KMZ5mYN4g/rULR5WxIIeyqGH5dwyUJd5AAzZsnJHAR7sktnj7fvpNP
	uA4M=
X-Gm-Gg: ASbGncvczsjGMieaxY9/fMXA55vvilOHRQEo8X7Oo4EKepXICrGapKtXMRzCbCewaRy
	X16BwMwZRourdl4OiwPw/zjxe0nor+yxJJ9uO4Gxz9QP6arsnaO+LpyaSIMlbyv/yc6aZ8S80cX
	fwo6t8XOHVWQNuMPRTA1p1mwaqvXEvR5kv2jRPf74MxHq8ESmsk2cpfSXP9vfgZ89o7LFiCR088
	NuTY/T+vl90aaA1+K7/e8rIH/0WqY0DR8o9A30gbzGpIFuCqf+MjRuv9qc9+fkAPKfOLHMJb1av
	2pWZn/mIfmOUdDhEYQpiHM7e6Tslq1OBQpuB9X/y+d2nwEi+VVxPoGrwR0G6zW2mdHfyP3yAIUI
	JSCj0dUg59tTwLHDuvlLPR5N50w==
X-Google-Smtp-Source: AGHT+IHUvUwY3Oc+NwT/K92O2T6d81R01al7qhTdH+lU8ICm8+WaP2aAdCfqFqy14keOtMF6cjhcXw==
X-Received: by 2002:a17:907:7ea0:b0:aca:a688:fb13 with SMTP id a640c23a62f3a-ad219057ff1mr1140299566b.36.1747002272347;
        Sun, 11 May 2025 15:24:32 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2197bd2a8sm527722566b.145.2025.05.11.15.24.31
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 May 2025 15:24:31 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5fbee929e83so6188373a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 15:24:31 -0700 (PDT)
X-Received: by 2002:a05:6402:239c:b0:5fc:a51c:149 with SMTP id
 4fb4d7f45d1cf-5fca51c13acmr7103172a12.15.1747002270786; Sun, 11 May 2025
 15:24:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 11 May 2025 15:24:14 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgkt+h_UJKE7Lx=b=ixt=ryZ_fXRqMjJYURYVK-3g-k+g@mail.gmail.com>
X-Gm-Features: AX0GCFt6WTFnUmIefdEn1qOMW0nYoOnJRCS35WEYaOYLxyFYUtDNQkSoUfklkeM
Message-ID: <CAHk-=wgkt+h_UJKE7Lx=b=ixt=ryZ_fXRqMjJYURYVK-3g-k+g@mail.gmail.com>
Subject: Linux 6.15-rc6
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Another week, another rc.

Everything still looks fairly normal - we've got a bit more commits
than we did in rc5, which isn't the trend I want to see as the release
progresses, but the difference isn't all that big and it feels more
like just the normal noise in timing fluctuation in pull requests of
fixes than any real signal.

So I won't worry about it. We've got another two weeks to go in the
normal release schedule, and it still feels like everything is on
track.

The changes here are all the usual ones, with drivers accounting for
about half (gpu and networking leading the charge as usual, but
there's a healthy mix of other minor driver fixes too). The rest being
a fairly even mixture of architecture fixes (kvm and devicetree stands
out), filesystems (ocfs2, btrfs, bcachefs, smb, erofs), core
networking, and various random other stuff.

In unrelated news: I finally gave up on my attempt at using a quieter
low-profile keyboard: I gave it half a year thinking I'd get used to
it, but I'm back to the noisy clackety-clack of clicky blue cherry
switches. It seems I need the audible (or perhaps tactile) feedback to
avoid the typing mistakes that I just kept doing.

I'm not sure why I even tried, since it's not like I'm in some office
where the noise of my keyboard can disturb others.

I mention this only in case people have reacted to my typos. Or maybe
it's just me, and I'm just conveniently blaming the keyboard.

Anyway, going forward, I will now conveniently blame autocorrect since
I can't blame the keyboard. Just FYI.

                  Linus

---

Aaron Lu (1):
      block: remove test of incorrect io priority level

Aditya Garg (3):
      Input: synaptics - enable InterTouch on Dynabook Portege X30L-G
      Input: synaptics - enable InterTouch on TUXEDO InfinityBook Pro 14 v5
      Input: synaptics - enable InterTouch on Dell Precision M3800

Ahmad Fatoum (1):
      arm64: dts: imx8mp: configure GPU and NPU clocks in nominal DTSI

Al Viro (4):
      __legitimize_mnt(): check for MNT_SYNC_UMOUNT should be under mount_l=
ock
      do_umount(): add missing barrier before refcount checks in sync case
      do_move_mount(): don't leak MNTNS_PROPAGATING on failures
      fix IS_MNT_PROPAGATING uses

Alex Deucher (7):
      Revert "drm/amd: Stop evicting resources on APUs in suspend"
      drm/amdgpu: fix pm notifier handling
      drm/amdgpu/hdp4: use memcfg register to post the write for HDP flush
      drm/amdgpu/hdp5: use memcfg register to post the write for HDP flush
      drm/amdgpu/hdp5.2: use memcfg register to post the write for HDP flus=
h
      drm/amdgpu/hdp6: use memcfg register to post the write for HDP flush
      drm/amdgpu/hdp7: use memcfg register to post the write for HDP flush

Alex Hung (1):
      drm/amd/display: Remove unnecessary DC_FP_START/DC_FP_END

Alex Williamson (1):
      vfio/pci: Align huge faults to order

Alexander Duyck (8):
      fbnic: Fix initialization of mailbox descriptor rings
      fbnic: Gate AXI read/write enabling on FW mailbox
      fbnic: Add additional handling of IRQs
      fbnic: Actually flush_tx instead of stalling out
      fbnic: Cleanup handling of completions
      fbnic: Improve responsiveness of fbnic_mbx_poll_tx_ready
      fbnic: Pull fbnic_fw_xmit_cap_msg use out of interrupt context
      fbnic: Do not allow mailbox to toggle to ready outside
fbnic_mbx_poll_tx_ready

Alexandre Ghiti (1):
      scripts: Do not strip .rela.dyn section

Alexey Charkov (1):
      usb: uhci-platform: Make the clock really optional

Andi Shyti (1):
      MAINTAINERS: Remove entry for Seth Heasley

Andrei Kuchynski (2):
      usb: typec: ucsi: displayport: Fix deadlock
      usb: typec: ucsi: displayport: Fix NULL pointer access

Andrew Lunn (1):
      dt-bindings: net: ethernet-controller: Add informative text
about RGMII delays

Angelo Dureghello (1):
      iio: adc: ad7606: fix serial register access

Antonios Salios (1):
      can: m_can: m_can_class_allocate_dev(): initialize spin lock on
device probe

Arnd Bergmann (4):
      media: vivid: fix FB dependency
      media: i2c: lt6911uxe: Fix Kconfig dependencies:
      media: cec: tda9950: add back i2c dependency
      Input: stmpe-ts - use module alias instead of device table

Aurabindo Pillai (1):
      drm/amd/display: more liberal vmin/vmax update for freesync

Austin Zheng (1):
      drm/amd/display: Call FP Protect Before Mode Programming/Mode Support

Boris Burkov (1):
      btrfs: handle empty eb->folios in num_extent_folios()

Borislav Petkov (AMD) (1):
      x86/microcode: Consolidate the loader enablement checking

Christian Bruel (6):
      arm64: dts: st: Adjust interrupt-controller for stm32mp25 SoCs
      arm64: dts: st: Use 128kB size for aliased GIC400 register
access on stm32mp25 SoCs
      arm64: dts: st: Adjust interrupt-controller for stm32mp21 SoCs
      arm64: dts: st: Use 128kB size for aliased GIC400 register
access on stm32mp21 SoCs
      arm64: dts: st: Adjust interrupt-controller for stm32mp23 SoCs
      arm64: dts: st: Use 128kB size for aliased GIC400 register
access on stm32mp23 SoCs

Cl=C3=A9ment L=C3=A9ger (3):
      riscv: misaligned: factorize trap handling
      riscv: misaligned: enable IRQs while handling misaligned accesses
      riscv: misaligned: use get_user() instead of __get_user()

Cong Wang (2):
      sch_htb: make htb_deactivate() idempotent
      selftests/tc-testing: Add a test case to cover basic HTB+FQ_CODEL cas=
e

Cosmin Ratiu (1):
      net: Lock netdevices during dev_shutdown

Cristian Marussi (2):
      firmware: arm_scmi: Balance device refcount when destroying devices
      firmware: arm_scmi: Fix timeout checks on polling path

Dan Carpenter (2):
      KVM: x86: Check that the high 32bits are clear in
kvm_arch_vcpu_ioctl_run()
      dm: add missing unlock on in dm_keyslot_evict()

Daniel Golle (1):
      net: ethernet: mtk_eth_soc: reset all TX queues on DMA free

Daniel Wagner (1):
      nvme: unblock ctrl state transition for firmware update

Daniele Ceraolo Spurio (1):
      drm/xe/gsc: do not flush the GSC worker from the reset path

Dave Hansen (1):
      x86/mm: Eliminate window where TLB flushes may be inadvertently skipp=
ed

Dave Penkler (3):
      usb: usbtmc: Fix erroneous get_stb ioctl error returns
      usb: usbtmc: Fix erroneous wait_srq ioctl return
      usb: usbtmc: Fix erroneous generic_read ioctl return

Dave Stevenson (1):
      staging: bcm2835-camera: Initialise dev in v4l2_dev

David Lechner (8):
      iio: adc: ad7380: disable offload before using SPI bus
      iio: adc: ad7606: check for NULL before calling sw_mode_config()
      iio: adc: ad7380: fix event threshold shift
      iio: imu: inv_mpu6050: align buffer for timestamp
      iio: chemical: sps30: use aligned_s64 for timestamp
      iio: chemical: pms7003: use aligned_s64 for timestamp
      iio: imu: adis16550: align buffers for timestamp
      iio: pressure: mprls0025pa: use aligned_s64 for timestamp

David Wei (1):
      tools: ynl-gen: validate 0 len strings from kernel

Dmitry Antipov (1):
      module: ensure that kobject_put() is safe for module type kobjects

Dmitry Torokhov (1):
      Input: synaptics - enable SMBus for HP Elitebook 850 G1

Eelco Chaudron (1):
      openvswitch: Fix unsafe attribute parsing in output_userspace()

Feng Jiang (1):
      drm: Fix potential overflow issue in event_string array

Feng Tang (1):
      selftests/mm: compaction_test: support platform with huge mount of me=
mory

Frank Wunderlich (1):
      net: ethernet: mtk_eth_soc: do not reset PSE when setting FE

Frank van der Linden (1):
      mm/hugetlb: copy the CMA flag when demoting

Gabriel Krisman Bertazi (1):
      io_uring/sqpoll: Increase task_work submission batch size

Gabriel Shahrouzi (4):
      staging: iio: adc: ad7816: Correct conditional logic for store mode
      iio: adis16201: Correct inclinometer channel resolution
      staging: axis-fifo: Correct handling of tx_fifo_depth for size valida=
tion
      staging: axis-fifo: Remove hardware resets for user errors

Gao Xiang (1):
      erofs: ensure the extra temporary copy is valid for shortened bvecs

Gary Bisson (1):
      Input: mtk-pmic-keys - fix possible null pointer dereference

Gavin Guo (1):
      mm/huge_memory: fix dereferencing invalid pmd migration entry

Geert Uytterhoeven (1):
      media: platform: synopsys: VIDEO_SYNOPSYS_HDMIRX should depend
on ARCH_ROCKCHIP

Gerald Schaefer (1):
      s390/dcssblk: Fix build error with CONFIG_DAX=3Dm and CONFIG_DCSSBLK=
=3Dy

Goldwyn Rodrigues (1):
      btrfs: correct the order of prelim_ref arguments in btrfs__prelim_ref

Guenter Roeck (1):
      x86: disable image size check for test builds

Guillaume Nault (2):
      gre: Fix again IPv6 link-local address generation.
      selftests: Add IPv6 link-local address generation tests for GRE devic=
es.

Gustavo Silva (1):
      iio: imu: bmi270: fix initial sampling frequency configuration

Hans Verkuil (1):
      media: i2c: lt6911uxe: add two selects to Kconfig

Heiko Carstens (2):
      s390/entry: Fix last breaking event handling in case of stack corrupt=
ion
      s390: Update defconfigs

Heming Zhao (1):
      ocfs2: fix the issue with discontiguous allocation in the global_bitm=
ap

Hongbo Li (2):
      MAINTAINERS: erofs: add myself as reviewer
      erofs: remove unused enum type

Hugo Villeneuve (1):
      Input: cyttsp5 - ensure minimum reset pulse width

Imre Deak (1):
      drm/i915/dp: Fix determining SST/MST mode during MTP TU state computa=
tion

Jacek Lawrynowicz (2):
      accel/ivpu: Increase state dump msg timeout
      accel/ivpu: Fix pm related deadlocks in cmdq ioctls

Jakub Kicinski (4):
      virtio-net: don't re-enable refill work too early when NAPI is disabl=
ed
      virtio-net: free xsk_buffs on error in virtnet_xsk_pool_enable()
      net: export a helper for adding up queue stats
      virtio-net: fix total qstat values

Jan Kara (3):
      ocfs2: switch osb->disable_recovery to enum
      ocfs2: implement handshaking with ocfs2 recovery thread
      ocfs2: stop quota recovery before disabling quotas

Jason Andryuk (2):
      xenbus: Allow PVH dom0 a non-local xenstore
      xenbus: Use kref to track req lifetime

Jens Axboe (2):
      io_uring: always arm linked timeouts prior to issue
      io_uring: ensure deferred completions are flushed for multishot

Jim Lin (1):
      usb: host: tegra: Prevent host controller crash when OTG port is used

Johan Hovold (1):
      i2c: omap: fix deprecated of_property_read_bool() use

Johannes Berg (2):
      um: fix _nofault accesses
      wifi: iwlwifi: add support for Killer on MTL

Johannes Thumshirn (1):
      block: only update request sector if needed

John Ernberg (1):
      xen: swiotlb: Use swiotlb bouncing if kmalloc allocation demands it

Jonas Gorski (11):
      net: dsa: b53: allow leaky reserved multicast
      net: dsa: b53: keep CPU port always tagged again
      net: dsa: b53: fix clearing PVID of a port
      net: dsa: b53: fix flushing old pvid VLAN on pvid change
      net: dsa: b53: fix VLAN ID for untagged vlan on bridge leave
      net: dsa: b53: always rejoin default untagged VLAN on bridge leave
      net: dsa: b53: do not allow to configure VLAN 0
      net: dsa: b53: do not program vlans when vlan filtering is off
      net: dsa: b53: fix toggling vlan_filtering
      net: dsa: b53: fix learning on VLAN unaware bridges
      net: dsa: b53: do not set learning and unicast/multicast on up

Jonathan Cameron (5):
      iio: temp: maxim-thermocouple: Fix potential lack of DMA safe buffer.
      iio: accel: adxl355: Make timestamp 64-bit aligned using aligned_s64
      iio: adc: dln2: Use aligned_s64 for timestamp
      iio: adc: ad7768-1: Fix insufficient alignment of timestamp.
      iio: adc: ad7266: Fix potential timestamp alignment issue.

Jozsef Kadlecsik (1):
      netfilter: ipset: fix region locking in hash types

Julian Anastasov (1):
      ipvs: fix uninit-value for saddr in do_output_route4

Kairui Song (2):
      btrfs: open code folio_index() in btree_clear_folio_dirty_tag()
      mm, swap: fix false warning for large allocation with !THP_SWAP

Karol Wachowski (1):
      accel/ivpu: Correct mutex unlock order in job submission

Kees Cook (3):
      input/joystick: magellan: Mark __nonstring look-up table
      btrfs: compression: adjust cb->compressed_folios allocation type
      mm: vmalloc: support more granular vrealloc() sizing

Kelsey Maes (1):
      can: mcp251xfd: fix TDC setting for low data bit rates

Kent Overstreet (10):
      bcachefs: thread_with_stdio: fix spinning instead of exiting
      bcachefs: Improve want_cached_ptr()
      bcachefs: Ensure proper write alignment
      bcachefs: Add missing barriers before wake_up_bit()
      bcachefs: fix hung task timeout in journal read
      bcachefs: Call bch2_fs_start before getting vfs superblock
      bcachefs: journal_shutdown is EROFS, not EIO
      bcachefs: Filter out harmless EROFS error messages
      bcachefs: Ensure superblock gets written when we go ERO
      bcachefs: Don't aggressively discard the journal

Kevin Baker (1):
      drm/panel: simple: Update timings for AUO G101EVN010

Konstantin Shkolnyy (2):
      s390/configs: Enable VDPA on Nvidia ConnectX-6 network card
      s390/configs: Enable options required for TC flow offload

Krzysztof Kozlowski (3):
      iio: accel: fxls8962af: Fix wakeup source leaks on device unbind
      iio: adc: qcom-spmi-iadc: Fix wakeup source leaks on device unbind
      iio: imu: st_lsm6dsx: Fix wakeup source leaks on device unbind

Lance Yang (1):
      mailmap: add entries for Lance Yang

Linus Torvalds (1):
      Linux 6.15-rc6

Lizhi Xu (1):
      loop: Add sanity check for read/write_iter

Lode Willems (1):
      Input: xpad - add support for 8BitDo Ultimate 2 Wireless Controller

Lorenzo Bianconi (1):
      net: airoha: Add missing field to ppe_mbox_data struct

Lorenzo Stoakes (4):
      MAINTAINERS: add reverse mapping section
      MAINTAINERS: add core mm section
      MAINTAINERS: add mm THP section
      tools/testing/selftests: fix guard region test tmpfs assumption

Lothar Rubusch (1):
      iio: accel: adxl367: fix setting odr for activity time update

Luca Ceresoli (1):
      iio: light: opt3001: fix deadlock due to concurrent flag access

Lukasz Czechowski (1):
      usb: misc: onboard_usb_dev: fix support for Cypress HX3 hubs

Madhavan Srinivasan (1):
      selftests/mm: fix build break when compiling pkey_util.c

Manuel Fombuena (1):
      Input: synaptics - enable InterTouch on Dynabook Portege X30-D

Marc Kleine-Budde (3):
      can: mcp251xfd: mcp251xfd_remove(): fix order of unregistration calls
      can: rockchip_canfd: rkcanfd_remove(): fix order of unregistration ca=
lls
      can: mcan: m_can_class_unregister(): fix order of unregistration call=
s

Marc Zyngier (5):
      KVM: arm64: Force HCR_EL2.xMO to 1 at all times in VHE mode
      KVM: arm64: Prevent userspace from disabling AArch64 support at
any virtualisable EL
      KVM: arm64: selftest: Don't try to disable AArch64 support
      KVM: arm64: Properly save/restore HCRX_EL2
      KVM: arm64: Kill HCRX_HOST_FLAGS

Marco Crivellari (3):
      MIPS: Fix idle VS timer enqueue
      MIPS: Move r4k_wait() to .cpuidle.text section
      MIPS: rename rollback_handler with skipover_handler

Mark Tinguely (1):
      ocfs2: fix panic in failed foilio allocation

Mathias Nyman (1):
      xhci: dbc: Avoid event polling busyloop if pending rx transfers
are inactive.

Matthew Brost (1):
      drm/xe: Add page queue multiplier

Mattijs Korpershoek (2):
      dt-bindings: mediatek,mt6779-keypad: Update Mattijs' email address
      MAINTAINERS: .mailmap: update Mattijs Korpershoek's email address

Max Kellermann (1):
      fs/erofs/fileio: call erofs_onlinefolio_split() after bio_add_folio()

Ma=C3=ADra Canal (1):
      drm/v3d: Add job to pending list if the reset was skipped

Meghana Malladi (3):
      net: ti: icssg-prueth: Set XDP feature flags for ndev
      net: ti: icssg-prueth: Fix kernel panic during concurrent Tx queue ac=
cess
      net: ti: icssg-prueth: Report BQL before sending XDP packets

Michael Riesch (1):
      MAINTAINERS: add exclude for dt-bindings to imx entry

Michael-CY Lee (1):
      wifi: mac80211: fix the type of status_code for negotiated TID
to Link Mapping

Michal Pecio (1):
      usb: xhci: Don't trust the EP Context cycle bit when moving HW dequeu=
e

Miguel Ojeda (5):
      objtool/rust: add one more `noreturn` Rust function for Rust 1.87.0
      rust: allow Rust 1.87.0's `clippy::ptr_eq` lint
      rust: clean Rust 1.88.0's `unnecessary_transmutes` lint
      rust: clean Rust 1.88.0's warning about
`clippy::disallowed_macros` configuration
      rust: clean Rust 1.88.0's `clippy::uninlined_format_args` lint

Mikael Gonella-Bolduc (1):
      Input: cyttsp5 - fix power control issue on wakeup

Mikhail Lobanov (1):
      KVM: SVM: Forcibly leave SMM mode on SHUTDOWN interception

Mohsin Bashir (3):
      selftests: drv: net: fix test failure on ipv6 sys
      selftests: drv: net: avoid skipping tests
      selftests: drv: net: add version indicator

Mostafa Saleh (1):
      KVM: arm64: Fix memory check in host_stage2_set_owner_locked()

Nam Cao (1):
      riscv: Fix kernel crash due to PR_SET_TAGGED_ADDR_CTRL

Naman Jain (2):
      uio_hv_generic: Fix sysfs creation path for ring buffer
      Drivers: hv: Make the sysfs node size for the ring buffer dynamic

Namjae Jeon (1):
      ksmbd: prevent rename with empty string

Niklas Schnelle (2):
      s390/pci: Fix missing check for zpci_create_device() error return
      s390/pci: Fix duplicate pci_dev_put() in disable_slot() when PF
has child VFs

Norbert Szetei (1):
      ksmbd: prevent out-of-bounds stream writes by validating *pos

Nylon Chen (1):
      riscv: misaligned: Add handling for ZCB instructions

Nysal Jan K.A. (1):
      selftests/mm: fix a build failure on powerpc

Oliver Hartkopp (1):
      can: gw: fix RCU/BH usage in cgw_create_job()

Oliver Neukum (1):
      USB: usbtmc: use interruptible sleep in usbtmc_read

Oscar Salvador (1):
      mm,mm_init: Mark set_high_memory as __init

Paul Aurich (1):
      smb: client: Avoid race in open_cached_dir with lease breaks

Paul Chaignon (2):
      bpf: Scrub packet on bpf_redirect_peer
      bpf: Clarify handling of mark and tstamp by redirect_peer

Pawel Laszczak (2):
      usb: cdnsp: Fix issue with resuming from L1
      usb: cdnsp: fix L1 resume issue for RTL_REVISION_NEW_LPM version

Pawe=C5=82 Anikiel (1):
      x86/Kconfig: make CFI_AUTO_DEFAULT depend on !RUST or Rust >=3D 1.88

Peter Xu (1):
      mm/userfaultfd: fix uninitialized output field for -EAGAIN race

Petr Van=C4=9Bk (1):
      mm: fix folio_pte_batch() on XEN PV

Prashanth K (3):
      usb: gadget: f_ecm: Add get_status callback
      usb: gadget: Use get_status callback to set remote wakeup capability
      usb: dwc3: gadget: Make gadget_wakeup asynchronous

Przemek Kitszel (1):
      ice: use DSN instead of PCI BDF for ice_adapter index

Qu Wenruo (2):
      btrfs: avoid NULL pointer dereference if no valid csum tree
      Revert "btrfs: canonicalize the device path before adding it"

RD Babiera (1):
      usb: typec: tcpm: delay SNK_TRY_WAIT_DEBOUNCE to SRC_TRYWAIT transiti=
on

Radim Kr=C4=8Dm=C3=A1=C5=99 (1):
      KVM: RISC-V: reset smstateen CSRs

Richard Zhu (1):
      arm64: dts: imx95: Correct the range of PCIe app-reg region

Rob Herring (Arm) (1):
      arm64: dts: morello: Fix-up cache nodes

Roman Li (1):
      drm/amd/display: Fix invalid context error in dml helper

Ruijing Dong (1):
      drm/amdgpu/vcn: using separate VCN1_AON_SOC offset

Ryusuke Konishi (1):
      nilfs2: fix deadlock warnings caused by lock dependency in init_nilfs=
()

Samuel Holland (1):
      riscv: Disallow PR_GET_TAGGED_ADDR_CTRL without Supm

Sean Christopherson (2):
      KVM: x86/mmu: Prevent installing hugepages when mem attributes
are changing
      KVM: SVM: Set/clear SRSO's BP_SPEC_REDUCE on 0 <=3D> 1 VM count trans=
itions

Sean Heelan (1):
      ksmbd: Fix UAF in __close_file_table_ids

Sebastian Andrzej Siewior (1):
      clocksource/i8253: Use raw_spinlock_irqsave() in
clockevent_i8253_disable()

Sebastian Ott (1):
      KVM: arm64: Fix uninitialized memcache pointer in user_mem_abort()

Shuicheng Lin (2):
      drm/xe: Release force wake first then runtime power
      drm/xe: Add config control for svm flush work

Silvano Seva (2):
      iio: imu: st_lsm6dsx: fix possible lockup in st_lsm6dsx_read_fifo
      iio: imu: st_lsm6dsx: fix possible lockup in st_lsm6dsx_read_tagged_f=
ifo

Simon Xue (1):
      iio: adc: rockchip: Fix clock initialization sequence

Stanislav Fomichev (1):
      net: add missing instance lock to dev_set_promiscuity

Steve French (1):
      smb3 client: warn when parse contexts returns error on
compounded operation

Sudeep Holla (1):
      firmware: arm_ffa: Skip Rx buffer ownership release if not acquired

S=C3=A9bastien Szymanski (1):
      ARM: dts: opos6ul: add ksz8081 phy properties

Tejas Upadhyay (1):
      drm/xe/tests/mocs: Hold XE_FORCEWAKE_ALL for LNCF regs

Thomas Gleixner (1):
      timekeeping: Prevent coarse clocks going backwards

Thomas Hellstr=C3=B6m (2):
      drm/ttm: Fix ttm_backup kerneldoc
      drm/ttm: Remove the struct ttm_backup abstraction

Thomas Wei=C3=9Fschuh (1):
      arm64: vdso: Work around invalid absolute relocations from GCC

Thorsten Blum (2):
      MIPS: CPS: Fix potential NULL pointer dereferences in cps_prepare_cpu=
s()
      MIPS: Fix MAX_REG_OFFSET

Tom Lendacky (2):
      KVM: SVM: Update dump_ghcb() to use the GHCB snapshot fields
      memblock: Accept allocated memory before use in memblock_double_array=
()

Tudor Ambarus (1):
      dm: fix copying after src array boundaries

Ulf Hansson (1):
      Input: hisi_powerkey - enable system-wakeup for s2idle

Uwe Kleine-K=C3=B6nig (1):
      mailmap: map Uwe's BayLibre addresses to a single one

Veerendranath Jakkam (1):
      wifi: cfg80211: fix out-of-bounds access during multi-link
element defragmentation

Vicki Pfau (4):
      Input: xpad - fix two controller table values
      Input: xpad - fix Share button on Xbox One controllers
      Input: xpad - add support for several more controllers
      Input: xpad - fix xpad_device sorting

Vinay Belgaumkar (1):
      drm/i915/slpc: Balance the inc/dec for num_waiters

Wang Zhaolong (1):
      ksmbd: fix memory leak in parse_lease_state()

WangYuli (1):
      Input: sparcspkr - avoid unannotated fall-through

Wayne Chang (1):
      usb: gadget: tegra-xudc: ACK ST_RC after clearing CTRL_RUN

Wayne Lin (5):
      drm/amd/display: Shift DMUB AUX reply command if necessary
      drm/amd/display: Fix the checking condition in dmub aux handling
      drm/amd/display: Remove incorrect checking in dmub aux handler
      drm/amd/display: Copy AUX read reply data whenever length > 0
      drm/amd/display: Fix wrong handling for AUX_DEFER case

Will McVicker (1):
      platform: Fix race condition during DMA configure at IOMMU probe time

Wojciech Dubowik (1):
      arm64: dts: imx8mm-verdin: Link reg_usdhc2_vqmmc to usdhc2

Yan Zhao (1):
      KVM: x86/mmu: Check and free obsolete roots in kvm_mmu_reload()

Yeoreum Yun (1):
      arm64: cpufeature: Move arm64_use_ng_mappings to the .data
section to prevent wrong idmap generation

Zhang Lixu (3):
      iio: hid-sensor-prox: Restore lost scale assignments
      iio: hid-sensor-prox: support multi-channel SCALE calculation
      iio: hid-sensor-prox: Fix incorrect OFFSET calculation
