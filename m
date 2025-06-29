Received: from hz.preining.info (hz.preining.info [95.216.25.247])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6CC2576
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 17:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.216.25.247
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751218674; cv=none; b=s2ac4tvDcxEpsRaIHk5cQIBWBNKxYElgNIxSidCH23IQzEbXpke2GN5Fq0QrqV3GqMWhxaw6RAtrwo7yUe2MED07RyNSMlqmb0y9GShN7DwSDNZveN0HlqChzjUSD6pKl2KlHEpc46Tw4tpoceOjqjJJ7l69EubwxgvsJEXctBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751218674; c=relaxed/simple;
	bh=dQesGOrVMHlJrYhEmVu52cbOfiK3+2ftifCzKgz10fY=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eneBSCUhfj9T7xrvZXbQBahML14yxMa2ADQrldeKDi9h0XuLDIH49sPCzZuh1Aw4pTKYP/bihhBC8C8U7yGc9I6E0VplTFGDPadz66cIxlLGtaIbrluZhOH+9vCOB2UZSkFI/05Et8kA46R5/TDeOBFwlfj5s6UnULKRYkKnYxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=preining.info; spf=pass smtp.mailfrom=preining.info; dkim=pass (2048-bit key) header.d=preining.info header.i=@preining.info header.b=aGQbMjVq; arc=none smtp.client-ip=95.216.25.247
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=preining.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=preining.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=preining.info header.i=@preining.info header.b="aGQbMjVq"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=preining.info; s=201909; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=WIZTmtN4Knc1agfqNyDVemZ1MDl7RphjYCJ8WxNLHg4=; b=aGQbMjVqE5F9PZS8FBaW1REXif
	0ac/5E+rsZeOBIsGuy0p1Y1iy88zjAaMlI84Ieya4JIPTsyuuWAKSS/bckj8z9jgZ5zRBr+SqBVPI
	5yFyNSB/5atbJaP8mfWrK0p3FWLnt1CEUS2dHEZlxBt0vG8CcKGDtUv8SxkBz7LvBTfnAwosavcPk
	Ci6MbuOiuyKkO94neao3mXfzUfSkifM8W88m+umrapdF7cwYJvcVTGvChAe3TQCoYFy1ND/jmGLww
	SVvGegDgPiyp/0mztqZyQbKo2paAgEraRbLy0LS6+dcinFvc//DEaZyCDjiHZq6HI/9a3bt3NAY50
	A9LJTC8A==;
Received: from [193.32.29.227] (helo=fettsack.preining.info)
	by hz.preining.info with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <norbert@preining.info>)
	id 1uVvGt-000zMO-2E
	for linux-kernel@vger.kernel.org;
	Sun, 29 Jun 2025 16:52:51 +0000
Received: by fettsack.preining.info (Postfix, from userid 1000)
	id E4C071F948D4; Sun, 29 Jun 2025 18:52:49 +0200 (CEST)
Date: Sun, 29 Jun 2025 18:52:49 +0200
From: Norbert Preining <norbert@preining.info>
To: linux-kernel@vger.kernel.org
Subject: Lenovo P1 suspend to ram regression
Message-ID: <aGFvYQFhGi_ytgDB@fettsack>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Dear all,

(please Cc, thanks)

since some time, probably some kernel revisions, my Lenovo P1 Gen6
goes to sleep (suspend to ram), but produces considerable heat even
in sleep mode. Not surprising, it also drops battery level within
short time.

I am not sure where to report this bug, as well as which information I
can provide. 

Kernel is 6.15.4-zen2-1-zen on Arch Linux

From the dmesg:

[    0.000000] DMI: LENOVO 21FV002EUS/21FV002EUS, BIOS N3ZET48W (1.35 ) 02/25/2025

The supported sleep state seems to only be s2sleep:

❯ cat /sys/power/mem_sleep
[s2idle]


Around suspend:
[47798.668789] PM: suspend entry (s2idle)
[47798.795045] Filesystems sync: 0.126 seconds
[47798.931393] Freezing user space processes
[47798.933739] Freezing user space processes completed (elapsed 0.002 seconds)
[47798.933743] OOM killer disabled.
[47798.933744] Freezing remaining freezable tasks
[47798.935141] Freezing remaining freezable tasks completed (elapsed 0.001 seconds)
[47798.935143] printk: Suspending console(s) (use no_console_suspend to debug)
[47798.953325] cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: Asserting Reset
[47798.953498] CoreFreq: Suspend(0:1:19)
[47799.413769] ACPI: EC: interrupt blocked
[47805.654440] thinkpad_acpi: undocked from hotplug port replicator
[47807.218125] NVRM: rm_power_source_change_event: rm_power_source_change_event: Failed to handle Power Source change event, status=0x11
[67168.670527] ACPI: EC: interrupt unblocked
[67169.622762] spd5118 10-0050: PM: dpm_run_callback(): spd5118_resume [spd5118] returns -6
[67169.622773] spd5118 10-0050: PM: failed to resume async: error -6
[67169.622816] spd5118 10-0052: PM: dpm_run_callback(): spd5118_resume [spd5118] returns -6
[67169.622828] spd5118 10-0052: PM: failed to resume async: error -6
[67169.635622] i915 0000:00:02.0: [drm] GT0: GuC firmware i915/adlp_guc_70.bin version 70.44.1
[67169.635628] i915 0000:00:02.0: [drm] GT0: HuC firmware i915/tgl_huc.bin version 7.9.3
[67169.644108] nvme nvme0: 20/0/0 default/read/poll queues
[67169.650551] i915 0000:00:02.0: [drm] GT0: HuC: authenticated for all workloads
[67169.651715] i915 0000:00:02.0: [drm] GT0: GUC: submission enabled
[67169.651717] i915 0000:00:02.0: [drm] GT0: GUC: SLPC enabled
[67169.652243] i915 0000:00:02.0: [drm] GT0: GUC: RC enabled
[67169.654296] CoreFreq: SoC_SKL_VTD: request_mem_region 0xfed90000


What other information can I provide to debug this issue.

Thanks for any pointer, and please Cc.

Norbert

--
DI Dr Norbert Preining                        https://www.preining.info
arXiv / Cornell University   +   IFMGA Guide   +   TU Wien  +  TeX Live
GPG: 0x860CDC13   fp: F7D8 A928 26E3 16A1 9FA0 ACF0 6CAC A448 860C DC13
