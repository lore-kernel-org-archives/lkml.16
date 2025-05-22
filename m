Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D10C18858A
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 11:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747913645; cv=none; b=BrB4nZC9/I7B++tkK5fAl7Iy6p9nYRhCSktQ+g4BXlj9TC9SR/3XyCOw9b0F1EjUcX0uBvdJSXhsgWm5REuyDTXk94CstmVNe0QT+THq1DKSRRNi4vlQYrXfvJahSsDBQng6j6e7NL2ceuWOBsX7kWeF+MGWoFuwzZn9ol94Vaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747913645; c=relaxed/simple;
	bh=LKBdJyBEeOKk3mSV4DbWxhdvh4KBqzKLCTq6vzY9+pY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=lzMsuSYjY0P4glrlxZOeDM8DJn2TrN18i2kL2d4ejWQqX3fkeIeUp9sSegvtqhxG0g3j2L5tSZ3w/nSDAIku7pyU7OTMoOWedEO91nQCSb02ibyDk8BGADBkAsIHpTFCFfcIhs2BBQotDwDUeWe1lzXePrien2VtFL9ubrxZz/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BgUPlPTJ; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BgUPlPTJ"
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-87bee00b392so3589723241.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 04:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747913642; x=1748518442; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DGeSFvY4X/gs3ZuZJnzwUSq8AR9zZ6DlTAB4m9/z13c=;
        b=BgUPlPTJjpsWcQnemJd7kbFhW4uLG4tCXVGLtLdeJDfnPVl0MH6DD8L3u3nGcZXEUE
         h5/SzVQv1fTw3rkyyCKzQzrsgstSkDb9MAT1r27qzOd1Yc0nMM7H4MfoG3fxQXLeP3JR
         dSmXb61AUnBUbMKQxWCTjWn6lRKIJpWzXpwDOuCZH1zV6jVBup/BECUX7Kz7d5ssafSU
         ikbfdRjm/PWUwmi8buQhh6eriOjNTyoMHnXyPfnxOf3xSH6+hIX6S8MhOUpKB5Bc7buK
         FcGHONM00Y1ZHWi+2PqqQ509NMwEVcnft28K9Vg8+3eD4gYK05LRBQCLjve0J21MCJ8P
         ZVYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747913642; x=1748518442;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DGeSFvY4X/gs3ZuZJnzwUSq8AR9zZ6DlTAB4m9/z13c=;
        b=puoGNlXp3St5YlNl+w0DZALrhg8kI/eg2FvqHTvDZYpZzXaYA+FaC+UBuu39yOVIaj
         nNMcHt5M1pGYAxme5KSnNw3s4+7M1I6//jOa1XH3COdRWc6waUyHkr7n+chOUsm1mo1M
         E+TgWN4rcInqj6LpB9W9QfTpma+ZAy6et7AaF5Dw87jxmQL3HQpGKcTkZ+CGCKaoYszl
         4T+prGQHBXHKWkzY1tdNnPk/HyriaHV+0cJPDw6hcaCBmhq/AwrObcVJEUhGn0TGJjyZ
         K8p24MtuYi+uW7KeR8/q5VE44moEc1LF2eOA2qif7GnFSxjivNWKMz8eKIayL2Evmcfr
         809w==
X-Gm-Message-State: AOJu0YzGC1ttmJMlhtoI2ynnG/I72YitHaf5ION+wCN+Mil2Heox6Ip1
	zwCveALvuVO9rN6zahmPe/2Qf2ACjgwSpXBnDIVQp47whDhW0hq5MFC9rPhhgdVNr6KQTTX8ZWZ
	FiY4xVUR/x9yF7rXcrj4zVEwCFSV5xJyl9DgC+9+fiXDALi37SbSc0DI=
X-Gm-Gg: ASbGncuNLnyizUt0CYUwSFsd6CGmVptg8CUi/9YakSPezsu59z3DyFg7MW6uUZDk1XJ
	fDvmWvX5uaPB/qVPlSe7dEt/Uzdzkcf5n1UHfWmIu2yvXf5FzKxTp1orzZIPzrWLxL8Ed3K/SYI
	8Xsml3k3hDgg41tj0DnKo+LDTZY1Vsfaw5C4X9DvYoNHv/K0VD14G51NHvt+RN8jDKTg==
X-Google-Smtp-Source: AGHT+IGJbsnLiEs6VQO7SxgWXWv0+DcnUHWUPEbNg/CdpXYrxhqBuvk3DYHNBXnm8JoBHxCckCezPLOQCXOVD2zCq6M=
X-Received: by 2002:a05:6122:2529:b0:520:9688:d1bb with SMTP id
 71dfb90a1353d-52dba7b6301mr23967455e0c.2.1747913641840; Thu, 22 May 2025
 04:34:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 22 May 2025 17:03:50 +0530
X-Gm-Features: AX0GCFtzEJs9Bbmdmso8fUZrPhaT8RISCJO_gw9JWsj28tBX2Q1W6x07evlClyA
Message-ID: <CA+G9fYvxyha0sgEsc8h9FGT2=NOtMq676KtmDCyBsb54X+axHA@mail.gmail.com>
Subject: LTP-tracing: WARNING: at kernel/trace/trace_functions_graph.c:1005 print_graph_entry
To: open list <linux-kernel@vger.kernel.org>, 
	Linux trace kernel <linux-trace-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"

Regressions while running LTP tracing on Linus tree master 6.15.0-rc7
on arm64 Dragonboard 845c and Dragonboard 410c the following kernel
warnings were noticed.

Also noticed intermittently from Linux next-20250410 till next-20250521
on the arm, arm64 and x86_64 devices.

Regressions found on Dragonboard 845c and Dragonboard 410c
 - LTP tracing

Regression Analysis:
 - New regression? Yes
 - Reproducible? Intermittent

Test regression: Dragonboard 845c WARNING trace_functions_graph.c
print_graph_entry

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Test log (64k PAGE size boot and test log)

tee /lava-166778/0/tests/0_ltp-tracing/automated/linux/ltp/output/LTP_tracing.out
Host information
System: Linux
Node: runner-j1aldqxs-project-40964107-concurrent-0
Kernel Release: 6.15.0-rc7
Kernel Version: #1 SMP PREEMPT @1747826135
Machine Architecture: aarch64
Processor:
Temporary directory: /scratch/kirk.root/tmp6l2lrw3o
Connecting to SUT: host
Starting suite: shardfile
ftrace_regression01: pass  (0.975s)
ftrace_regression02: [   24.865534] /usr/local/bin/kirk[769]: starting
test ftrace_regression02 (ftrace_regression02.sh)
pass  (1.037s)

ftrace-stress-test: [   25.946741] /usr/local/bin/kirk[769]: starting
test ftrace-stress-test (ftrace_stress_test.sh 90)
[   35.063437] Scheduler tracepoints stat_sleep, stat_iowait,
stat_blocked and stat_runtime require the kernel parameter
schedstats=enable or kernel.sched_schedstats=1
[   35.063795] Scheduler tracepoints stat_sleep, stat_iowait,
stat_blocked and stat_runtime require the kernel parameter
schedstats=enable or kernel.sched_schedstats=1
[   97.866749] ------------[ cut here ]------------
[   97.871613] WARNING: CPU: 6 PID: 13314 at
kernel/trace/trace_functions_graph.c:1005 print_graph_entry
(kernel/trace/trace_functions_graph.c:1005 (discriminator 1)
kernel/trace/trace_functions_graph.c:1229 (discriminator 1))
[   97.882169] Modules linked in: snd_soc_hdmi_codec ax88179_178a
usbnet fuse ip_tables x_tables venus_enc venus_dec mcp251xfd
videobuf2_dma_contig snd_soc_sdm845 xhci_pci_renesas can_dev
lontium_lt9611 msm snd_soc_rt5663 leds_qcom_lpg ath10k_snoc
snd_soc_qcom_sdw hci_uart rtc_pm8xxx ocmem qcom_pbs btqca
snd_soc_qcom_common drm_exec ath10k_core qcom_spmi_adc5 btbcm
qcom_spmi_temp_alarm qcom_vadc_common ath led_class_multicolor
gpu_sched qcom_stats snd_soc_rl6231 mac80211 drm_dp_aux_bus
drm_display_helper qcom_pon drm_client_lib reset_qcom_pdc
soundwire_bus cfg80211 qcom_camss videobuf2_dma_sg bluetooth
videobuf2_memops venus_core phy_qcom_qmp_combo v4l2_mem2mem aux_bridge
coresight_stm videobuf2_v4l2 camcc_sdm845 pwrseq_core videobuf2_common
i2c_qcom_geni qcom_rng typec qcom_q6v5_mss phy_qcom_qmp_usb ufs_qcom
spi_geni_qcom phy_qcom_qmp_ufs qcrypto gpi qrtr rfkill stm_core
qcom_wdt phy_qcom_qmp_pcie lmh icc_osm_l3 slim_qcom_ngd_ctrl slimbus
pdr_interface qcom_pdr_msg qcom_q6v5_pas qcom_pil_info qcom_q6v5
qcom_sysmon
[   97.884162]  qcom_common icc_bwmon llcc_qcom qcom_glink_smem
mdt_loader display_connector drm_kms_helper qmi_helpers drm backlight
socinfo rmtfs_mem
[   97.989673] CPU: 6 UID: 0 PID: 13314 Comm: cat Not tainted
6.15.0-rc7 #1 PREEMPT
[   97.997392] Hardware name: Thundercomm Dragonboard 845c (DT)
[   98.003243] pstate: a0400005 (NzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   98.010424] pc : print_graph_entry
(kernel/trace/trace_functions_graph.c:1005 (discriminator 1)
kernel/trace/trace_functions_graph.c:1229 (discriminator 1))
[   98.015043] lr : print_graph_entry
(kernel/trace/trace_functions_graph.c:604
kernel/trace/trace_functions_graph.c:1225)
[   98.019659] sp : ffff80008fd8fb10
[   98.023126] x29: ffff80008fd8fb70 x28: ffff124e013d5700 x27: ffff124e013d5720
[   98.030552] x26: ffffdb1ef470098c x25: 0000000000000001 x24: ffff124e013d5700
[   98.037984] x23: ffff124e18cac000 x22: 0000000000000696 x21: 00000000fefefefe
[   98.045410] x20: ffff124e18ca8000 x19: ffff124e18caa090 x18: 0000000000000000
[   98.052835] x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
[   98.060265] x14: 0000000000000001 x13: 0000000000000001 x12: 000003dd0200000b
[   98.067696] x11: ffffdb1ef713c5f0 x10: 0000000000000020 x9 : ffffdb1ef462ac10
[   98.075126] x8 : 0000000000000020 x7 : 0000000000000001 x6 : 0000000000000029
[   98.082552] x5 : ffff124e18caa094 x4 : ffffdb1ef6754af6 x3 : 0000000000000001
[   98.089979] x2 : ffffdb1ef713b208 x1 : ffff372f84970000 x0 : ffffffdfbf6bd8e0
[   98.097407] Call trace:
[   98.099979] print_graph_entry
(kernel/trace/trace_functions_graph.c:1005 (discriminator 1)
kernel/trace/trace_functions_graph.c:1229 (discriminator 1)) (P)
[   98.104598] print_graph_function_flags
(kernel/trace/trace_functions_graph.c:1423)
[   98.109654] print_graph_function (kernel/trace/trace_functions_graph.c:1467)
[   98.114005] print_trace_line (kernel/trace/trace.c:4347)
[   98.118091] tracing_read_pipe (kernel/trace/trace.c:3840
kernel/trace/trace.c:6686)
[   98.122358] vfs_read (fs/read_write.c:568)
[   98.125734] ksys_read (fs/read_write.c:713) (F)
[   98.129555] __arm64_sys_read (fs/read_write.c:720) (F)
[   98.133903] invoke_syscall.constprop.0
(arch/arm64/include/asm/syscall.h:61 arch/arm64/kernel/syscall.c:54)
(F)
[   98.139146] do_el0_svc (arch/arm64/kernel/syscall.c:139
arch/arm64/kernel/syscall.c:151) (F)
[   98.142968] el0_svc (arch/arm64/include/asm/irqflags.h:82
(discriminator 1) arch/arm64/include/asm/irqflags.h:123 (discriminator
1) arch/arm64/include/asm/irqflags.h:136 (discriminator 1)
arch/arm64/kernel/entry-common.c:165 (discriminator 1)
arch/arm64/kernel/entry-common.c:178 (discriminator 1)
arch/arm64/kernel/entry-common.c:745 (discriminator 1)) (F)
[   98.146615] el0t_64_sync_handler (arch/arm64/kernel/entry-common.c:763)
[   98.151144] el0t_64_sync (arch/arm64/kernel/entry.S:600)
[   98.154966] ---[ end trace 0000000000000000 ]---
Restarting SUT: host
dynamic_debug01: [  123.083214] /usr/local/bin/kirk[769]: starting
test dynamic_debug01 (dynamic_debug01.sh)


## Source
* Kernel version: 6.15.0-rc7
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/torvalds/linux.git
* Git sha: 4a95bc121ccdaee04c4d72f84dbfa6b880a514b6

## Build
* Test log: https://lkft-staging.validation.linaro.org/scheduler/job/166778#L6126
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2xP3N7qYnNfT17IiSMUStDcHHHG/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2xP3N7qYnNfT17IiSMUStDcHHHG/config

--
Linaro LKFT
https://lkft.linaro.org
