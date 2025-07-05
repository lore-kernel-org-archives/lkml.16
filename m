Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89C2249EB
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 20:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751747422; cv=none; b=sIL8rbDswW6Ez4NFWnDKvPWTXOzvevXzOv+sbtmS7L0x2MmgY1rE/n0tp90KlTSYjOKSx7+N6VTk1nCIpzt78KLjDP9V69h9gvZEX4V++cqDSnTJcBt5F4mMdno2rF7ouNu7Z+OKFc0PQ3uZjzqHTXamKSbCKxoZPJBWpIT9+8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751747422; c=relaxed/simple;
	bh=DFBYQgwxJe+Sr6M8YUsANn4AuzR0hDxBilYEr0AEd5k=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=gmrhOKshu83RMnVi5beAUQtBTk3dlhE+1WwQ+2Msp18Pdw+ZIOe7stxfgecIqWxrnGcWNRxMTLS+YlJyrJ6DUIHggYSpCNuUkQ4jEjUJMl6XKUFYgs1K011IEIWzLKyUfIdOcu/H4jWDt3g1LXpdDHwdtS8L+DT7K6PT/gmQo9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aepqf5UZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aepqf5UZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1325FC4CEE7;
	Sat,  5 Jul 2025 20:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751747421;
	bh=DFBYQgwxJe+Sr6M8YUsANn4AuzR0hDxBilYEr0AEd5k=;
	h=Date:From:To:cc:Subject:From;
	b=aepqf5UZV967KPTf5cz51UelnsRec+Qru+BPATOdc9mrM/0XAyBOBq92ogSGCZwU+
	 3RNl5piiechptQXRjerexdeeBQ5Zmqdfm/nY2N0E1z1+vfIJYCE6bkC+N/M2vAvjSy
	 8rk2vCmSkgOsY2PqFxKJyMCyARzqbWssftrqy+hcz/RdyiAdmodXvfYcWXRVapXorx
	 jY80MadSk/sGYEu7fB4xrmILUX55rLcv5dBUu4wem2Uf6/W9Tk8oSQ9DK5p9bgqZ8g
	 sLJC/uZqsc61v0fJvsuQSB+4dUWP5T7OVhfzJmA8cz+wYgkK4x97dfnX3eU8ALHL3i
	 7NXK8Ktqwt3bQ==
Date: Sat, 5 Jul 2025 22:30:18 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
cc: linux-kernel@vger.kernel.org, Benjamin Tissoires <bentiss@kernel.org>
Subject: [GIT PULL] HID fixes
Message-ID: <77r6soqn-3s01-8863-0n17-1699qp728038@xreary.bet>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Linus,

please pull from

  git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git tags/hid-for-linus-2025070502

to receive HID subsystem fixes, namely:

=====
- Memory corruption fixes in hid-appletb-kbd driver (Qasim Ijaz)
- New device ID in hid-elecom driver (Leonard Dizon)
- Fixed several HID debugfs contants (Vicki Pfau)
=====

Thanks.

----------------------------------------------------------------
Leonard Dizon (1):
      HID: elecom: add support for ELECOM HUGE 019B variant

Qasim Ijaz (2):
      HID: appletb-kbd: fix memory corruption of input_handler_list
      HID: appletb-kbd: fix slab use-after-free bug in appletb_kbd_probe

Vicki Pfau (1):
      HID: Fix debug name for BTN_GEAR_DOWN, BTN_GEAR_UP, BTN_WHEEL

 drivers/hid/hid-appletb-kbd.c | 14 +++++++++-----
 drivers/hid/hid-debug.c       |  4 ++--
 drivers/hid/hid-elecom.c      |  6 ++++--
 drivers/hid/hid-ids.h         |  3 ++-
 drivers/hid/hid-quirks.c      |  3 ++-
 5 files changed, 19 insertions(+), 11 deletions(-)

-- 
Jiri Kosina
SUSE Labs

