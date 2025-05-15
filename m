Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4070221C163
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 16:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747325704; cv=none; b=dWRdejV93Tw6myvEhY9J0eANkdodubiGgWbMhOjOzGfSGElPJcazzcwW4tnjLYZDY/Zr+tK1W9NGphZrnbv+f28IU/EUGqF+86S7zPNdYlLq55TmIs9YhC2YDo8kvQ/s35SnrfHp29cLLDxBULavqbGSSNva8DgGBDJcXrOimjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747325704; c=relaxed/simple;
	bh=+4RMrwmLoDPf8fz5gANER9Tx8xvz6e4tfrbfap08qDU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZbpmmtqrU3z6ZTRih4vsB0Ybd08pZ+HGHadM1NaBKLt41m+hUbvExCivHNwGolhCPtzwAEfHM9YdIoDD8WlZc5Astbc2cRt9PIOrR6CaHR2AQuVOZuloYYDk6pZsF137/FQWPkCIKBkGxwpyaCnrRLDiRdpzpyE44DFPsbMh5os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u3ohZsmG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u3ohZsmG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA954C4CEEB;
	Thu, 15 May 2025 16:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747325703;
	bh=+4RMrwmLoDPf8fz5gANER9Tx8xvz6e4tfrbfap08qDU=;
	h=Date:From:To:Cc:Subject:From;
	b=u3ohZsmG9f1BZmhxfVuc72DDLExfPzHyUuHdj3ephx3RbAk9Jqm9dGweD+ndwkx16
	 hKLiAS7SMzicCZF4ULcb+xQmBcnj2hJM+bl70eozjqOqENoJ27DquGpcQo3X2yrItT
	 7bsRZOGt9giioOCDu4iBZUGqZsWrMmZgDfFLDmI/a0athYxH//HKQDLL3fvJ1B6IpQ
	 NOckTttuTEnZXBCsNVybZ1LHghsRkG13fZboiFMypjPkRWwRxtBgD9je0lTayK434V
	 tjiyYdSt4a82wXmRaJhZlEesCwPKnuex0brcCaqy4pRdv17sd0ODZ7uubyaQQiCagA
	 tsibLHpn5sWWw==
Date: Thu, 15 May 2025 18:15:00 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>
Subject: [GIT PULL] HID fixes for 6.15
Message-ID: <regsgbllbtki5tyqbk3evkergys42lnuvle4t4t3rtnnogi7ki@ezutqcj2p4bu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

please pull from

  git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git tags/hid-for-linus-2025051501

to receive HID subsystem fixes that should land in 6.15 final.

Both Jiri and I have been too busy over this cycle, so the fixes piled
up a bit. However, the last fix can be triggered easily if you unplug a
HID device with LEDs (like a Logitech unifying receiver), thus sending
all of this and not postponing for the next cycle.

=====
- few potential memory leaks in the wacom driver (Qasim Ijaz)
- AMD SFH fixes when there is only one SRA sensor (Mario Limonciello)
- HID-BPF dispatch UAF fix that happens on removal of the Logitech DJ
  receiver (Rong Zhang)
- various minor fixes and usual device ID additions
=====

Thanks.

----------------------------------------------------------------
hid-for-linus-2025051501

----------------------------------------------------------------
Aditya Garg (1):
      HID: hid-appletb-kbd: Fix wrong date and kernel version in sysfs interface docs

Henry Martin (1):
      HID: uclogic: Add NULL check in uclogic_input_configured()

Jiapeng Chong (1):
      HID: hid-steam: Remove the unused variable connected

Mario Limonciello (2):
      HID: amd_sfh: Fix SRA sensor when it's the only sensor
      HID: amd_sfh: Avoid clearing reports for SRA sensor

Milton Barrera (1):
      HID: quirks: Add ADATA XPG alpha wireless mouse support

Peter Hutterer (1):
      HID: bpf: fix BTN_STYLUS for the XP Pen ACK05 remote

Qasim Ijaz (4):
      HID: thrustmaster: fix memory leak in thrustmaster_interrupts()
      HID: wacom: handle kzalloc() allocation failure in wacom_wac_queue_flush()
      HID: wacom: fix memory leak on size mismatch in wacom_wac_queue_flush()
      HID: wacom: fix shift OOB in kfifo allocation for zero pktlen

Rong Zhang (1):
      HID: bpf: abort dispatch if device destroyed

 Documentation/ABI/testing/sysfs-driver-hid-appletb-kbd |  4 ++--
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c          | 12 ++++++++----
 drivers/hid/bpf/hid_bpf_dispatch.c                     |  9 +++++++++
 drivers/hid/bpf/progs/XPPen__ACK05.bpf.c               |  1 +
 drivers/hid/hid-ids.h                                  |  4 ++++
 drivers/hid/hid-quirks.c                               |  2 ++
 drivers/hid/hid-steam.c                                |  2 --
 drivers/hid/hid-thrustmaster.c                         |  1 +
 drivers/hid/hid-uclogic-core.c                         |  7 ++++---
 drivers/hid/wacom_sys.c                                | 11 ++++++++++-
 10 files changed, 41 insertions(+), 12 deletions(-)

