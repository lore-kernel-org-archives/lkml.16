Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678D12C2ADF
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 12:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745929373; cv=none; b=lOcLdJppMif4vJn0biXPpeWs5HOa694/TAgSYXPlxN0L9NDDZXVWbXWeu1PaBb1ksv1lVSfgPYNABhEUhrNl/+N7/fHglbme8JsvRiA/Jd31KO+3yC4mSgb3rngYdH7mR6bdslCBNc/nmuF4bcdufQfI/Rhip8DUY1eJjpGAiHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745929373; c=relaxed/simple;
	bh=GrYJd51XKY4KnuFaHd8uMSBX4gV7fjjvH5Cr9rJSLow=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=W69Dy9JXX5smeSaRVuPahp6WURyB13E+4eDCG1iqkOLy0+HJauW1n/ARJa7Zorw5qk/kFLJPikHSTlvWj7I7w+uUpZrtxUdNODgcMzmJkQVA+K+wEqBgGiOAcey2XTBRkAbpTIeaJu++DPSQNneOjUM0Bh2//nfdutE22Byozzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=djKroR4b; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="djKroR4b"
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-86fbb48fc7fso2424114241.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 05:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745929370; x=1746534170; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Yq2aL/yhY7ArURC3WHDxvEHJit+YPJDem4Cn7Zdfp+w=;
        b=djKroR4b+xHp+f5jGNAX02cZxQ5FTQbxKECvTc+maK3D0l9UW+DJ+gelvtaommXFsG
         dnVfLSFNFS0ApxVelKFSeEcTZin9Hz294a7HYGbplGjErXprKP35ktLIY5T6OzRnYTD3
         9E9HLMDX6b9/xlVKhqGpehNzISqeZXXnhUrjdp35waUlyY2aDDnUpF7N1rg3fo8Do6zP
         cTx4M94Dx/bsDbVBKwDNQPMSt1QCdRa54RDYj8q8Rk8aYLE3JzJvMC4gjmMrzr+Nhy5S
         1e3mACOBYxzwyze+IwSZS9gDhRUONW70QBQtlzRqenodQykIiFiAyagAFnLxMB2qJUjO
         L4/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745929370; x=1746534170;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yq2aL/yhY7ArURC3WHDxvEHJit+YPJDem4Cn7Zdfp+w=;
        b=OfCsKlliGDk8hErYHn21A+kmQC26W8XkdwsrZxkCGZhFhqamRm5LAFS1/ppw6yI5w0
         cbrVs4yJkcH2E1RjaWr0qy5/QRXND6Vl5MobjF/3j4KXeT/BymUDduoA+Of/g+LnQzAc
         8+Cq6kOYpDSvGYSey9LMOoAWMGU7vGnUgqiBe2cA54LCRQYRoJI9nmr35IVoytu9Q0Hr
         65i61idgJOCM6WeBFklJkG3cJC4mMOsK3+SGirmy1ye8D4DR4mv7FcnmLJ01xbWfjGpZ
         DEB6tj5UQ3jW2+MyqIyiwrIWgErYHeyNjNaQa9owrhvhOj2sSgZ/tbb0gEg3Av9vTJpk
         cPSg==
X-Forwarded-Encrypted: i=1; AJvYcCXeQJQAdF6x5x736D6+ggrI8oPeR1mt3Tl7Mf0vrctrKcjowdRXlAkP5sWrBBgwYAAqVRR8R5lgmK840RA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQpQCOPMTqbVubdrDJ2KTM0kZJoMM/8rsKI9IW/WmKWPY+/W2v
	gsXmBxL4ILbygTX1dMmk6Hkxd7FM/MeTDfI3kZv0CFVWkWJzJn8f+Tqvhkc3CYVl4sPQMDqU/wP
	U6pq+2yARPrrkSG1D/u6SD2SUHRV9nMHR5B67Vw==
X-Gm-Gg: ASbGncsLxKCyyboV7lpCQeuZjr6pJx6BpGsF6t/7D0HO3lyitQIU5vHqHl/i93btDjq
	ooMEBlxFzANcqkp9wn00qXYktx9TSRkkKLKJBOMZGSXPVd6OLnW18lwhmDQ9d6qHg/eETuis1mp
	D+JkGwxd8tF4hpHMtuJ/BEVab82SukAAr8BEwvdzG8Rg5ez9d2pNd7Bw==
X-Google-Smtp-Source: AGHT+IG1foGJ84MD+zQ/lmC0lf25a4A1O8Mjh6gi/WRCCBweasP65i1aWgvEDMrml/CThD3jrUf5V076u9Sg/kAOKns=
X-Received: by 2002:a05:6102:f10:b0:4c3:858:f07c with SMTP id
 ada2fe7eead31-4da7fb1c567mr2062378137.14.1745929370205; Tue, 29 Apr 2025
 05:22:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 29 Apr 2025 17:52:38 +0530
X-Gm-Features: ATxdqUFc4BsNDxT2oaRuPsP-hPGeKeTHemw9R5--p6VRqU_UGw_8nm8jkn9vK6g
Message-ID: <CA+G9fYut=1TFvFUvkRPizj97v-JGyg0kKW7aH9XjPbss_Rwg1g@mail.gmail.com>
Subject: next-20250428: warning mm page_counter.c page_counter_cancel page_counter_cancel
To: linux-mm <linux-mm@kvack.org>, open list <linux-kernel@vger.kernel.org>, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>, 
	Cgroups <cgroups@vger.kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Johannes Weiner <hannes@cmpxchg.org>, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Regression while booting the Linux next-20250428 the following kernel warnings
on the arm, arm64 and x86_64.

Regression Analysis:
 - New regression? Yes
 - Reproducibility? Yes

First seen on the next-20250428.
Good: next-20250424
Bad:  next-20250428

Boot regression: warning mm page_counter.c page_counter_cancel
page_counter_cancel

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Boot error
[   10.441535] ------------[ cut here ]------------
[   10.446229] page_counter underflow: -188 nr_pages=252
[   10.451349] WARNING: CPU: 6 PID: 1 at mm/page_counter.c:60
page_counter_cancel (mm/page_counter.c:60 (discriminator 1))
[   10.459534] Modules linked in: ip_tables x_tables venus_enc
venus_dec videobuf2_dma_contig xhci_pci_renesas lontium_lt9611
hci_uart mcp251xfd leds_qcom_lpg btqca can_dev qcom_spmi_adc5
qcom_spmi_temp_alarm qcom_pbs snd_soc_sdm845 btbcm qcom_vadc_common
led_class_multicolor snd_soc_rt5663 msm rtc_pm8xxx ath10k_snoc ocmem
snd_soc_qcom_sdw venus_core snd_soc_qcom_common qcom_stats qcom_camss
drm_exec qcom_pon videobuf2_dma_sg snd_soc_rl6231 gpu_sched
drm_dp_aux_bus ath10k_core drm_display_helper ath phy_qcom_qmp_combo
drm_client_lib slim_qcom_ngd_ctrl v4l2_mem2mem videobuf2_memops
soundwire_bus reset_qcom_pdc mac80211 bluetooth slimbus coresight_stm
aux_bridge qcom_q6v5_mss videobuf2_v4l2 camcc_sdm845 i2c_qcom_geni
qrtr pwrseq_core qcom_rng videobuf2_common typec spi_geni_qcom
phy_qcom_qmp_usb gpi qcom_q6v5_pas icc_osm_l3 stm_core
phy_qcom_qmp_ufs qcom_pil_info ufs_qcom qcrypto cfg80211 pdr_interface
qcom_q6v5 phy_qcom_qmp_pcie rfkill qcom_pdr_msg lmh qcom_sysmon
qcom_common icc_bwmon qcom_glink_smem llcc_qcom qcom_wdt
[   10.459765]  display_connector drm_kms_helper mdt_loader drm
qmi_helpers backlight socinfo rmtfs_mem
[   10.559700] CPU: 6 UID: 0 PID: 1 Comm: systemd Not tainted
6.15.0-rc4-next-20250428 #1 PREEMPT
[   10.568491] Hardware name: Thundercomm Dragonboard 845c (DT)
[   10.574213] pstate: 604000c5 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   10.581250] pc : page_counter_cancel (mm/page_counter.c:60 (discriminator 1))
[   10.586857] lr : page_counter_cancel (mm/page_counter.c:60 (discriminator 1))
[   10.586863] sp : ffff80008005bb70
[   10.586866] x29: ffff80008005bb70 x28: 0000000000000001 x27: 0000000000000000
[   10.586874] x26: 0000000000001020 x25: 0000000000000000 x24: 0000000000000000
[   10.586881] x23: 0000000000000001 x22: ffff18d1ca7e0000 x21: ffff18d23d526c98
[   10.621717] x20: 00000000000000fc x19: ffff18d1ca7e0100 x18: 0000000000000000
[   10.629990] x17: 00000000ffffffff x16: ffffd654f92e26e8 x15: 0000000000001e00
[   10.638261] x14: ffff18d1ca717e5f x13: 0000000000000003 x12: 0000000000000000
[   10.646512] x11: 0000000000000003 x10: ffffd654fbb70060 x9 : ffffd654f934fb70
[   10.654747] x8 : ffff80008005b8e8 x7 : ffffd654fbb18060 x6 : 00000000ffffefff
[   10.662959] x5 : 0000000000000338 x4 : 0000000000000000 x3 : 0000000000000000
[   10.671161] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff18d1c0340000
[   10.679369] Call trace:
[   10.682861] page_counter_cancel (mm/page_counter.c:60 (discriminator 1)) (P)
[   10.688408] page_counter_uncharge (mm/page_counter.c:183 (discriminator 3))
[   10.693761] drain_stock (mm/memcontrol.c:1872 (discriminator 2))
[   10.698235] refill_stock (mm/memcontrol.c:1951)
[   10.702916] obj_cgroup_uncharge_pages
(include/linux/cgroup_refcnt.h:78 mm/memcontrol.c:2747)
[   10.708692] refill_obj_stock (mm/memcontrol.c:3020)
[   10.713761] __memcg_slab_free_hook (include/linux/rcupdate.h:839
include/linux/percpu-refcount.h:330
include/linux/percpu-refcount.h:351 include/linux/memcontrol.h:772
include/linux/memcontrol.h:769 mm/memcontrol.c:3175)
[   10.719300] kmem_cache_free (mm/slub.c:4642 mm/slub.c:4744)
[   10.724272] __fput (fs/file_table.c:479)
[   10.728448] fput_close_sync (fs/file_table.c:571)
[   10.733321] __arm64_sys_close (fs/open.c:1584 fs/open.c:1566 fs/open.c:1566)
[   10.738281] invoke_syscall (arch/arm64/include/asm/current.h:19
arch/arm64/kernel/syscall.c:54)
[   10.743012] el0_svc_common.constprop.0
(include/linux/thread_info.h:135 (discriminator 2)
arch/arm64/kernel/syscall.c:140 (discriminator 2))
[   10.748742] do_el0_svc (arch/arm64/kernel/syscall.c:152)
[   10.753056] el0_svc (arch/arm64/include/asm/irqflags.h:82
(discriminator 1) arch/arm64/include/asm/irqflags.h:123 (discriminator
1) arch/arm64/include/asm/irqflags.h:136 (discriminator 1)
arch/arm64/kernel/entry-common.c:165 (discriminator 1)
arch/arm64/kernel/entry-common.c:178 (discriminator 1)
arch/arm64/kernel/entry-common.c:745 (discriminator 1))
[   10.757199] el0t_64_sync_handler (arch/arm64/kernel/entry-common.c:763)
[   10.762556] el0t_64_sync (arch/arm64/kernel/entry.S:600)
[   10.767176] ---[ end trace 0000000000000000 ]---

## Source
* Kernel version: next-20250428
* Git tree:  https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Git sha: 33035b665157558254b3c21c3f049fd728e72368
* Git describe: next-20250428
* Project details:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250428/
* Architectures: arm arm64 x86_64
* Toolchains: gcc-13
* Kconfigs: lkftconfig

## Build
* Build log: https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250428/testrun/28248589/suite/log-parser-boot/test/exception-page_counter-underflow-nr_pages/log
* Build history:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250428/testrun/28249370/suite/log-parser-boot/test/exception-page_counter-underflow-nr_pages/history/
* Build details:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250428/testrun/28248589/suite/log-parser-boot/test/exception-page_counter-underflow-nr_pages/details/
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2wMJhkoqsfGMLyMeRk5Ud2YIB2D/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2wMJhkoqsfGMLyMeRk5Ud2YIB2D/config

--
Linaro LKFT
https://lkft.linaro.org
