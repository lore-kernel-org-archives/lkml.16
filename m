Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7082701D7
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 13:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745588907; cv=none; b=ePrl7fagaTEu/2Ni8IjaD/gbYYuHJTbB3cf1qSKHtnuQd3fIQHyuLiBXnVGEt/XwI1+XuyLagzsubXF7ZhLxQ3gHOxirQYqLWufW6tbx7r1JBuP2bbwgjWE/+rqB3PE6+0uq2S1yaR7zpVTSsQHk8ejjzuYF/sPq0LEJeHu+dNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745588907; c=relaxed/simple;
	bh=cj+oLYXcGKiacpS0bjb4XmtjQb/UzGDwSDUPuRVTJ3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BXzLGvq0ax9ThEBhzENPgxf8y2/BTmGt9IKRgBr97oquzrFdVcGHsqa/rROLEBlYLpuQMwqC1mqdH4owaL7mijQ9GsUrB2FcBefeeq684rIF7ChXVQDpoSf2iZYfZX/CWCAU0guhKq1Sq+7ttU0/fV7g3lsyJITNy8qvPuXLiec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=j7auycRP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="j7auycRP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2758C4CEE4;
	Fri, 25 Apr 2025 13:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1745588907;
	bh=cj+oLYXcGKiacpS0bjb4XmtjQb/UzGDwSDUPuRVTJ3Q=;
	h=Date:From:To:Cc:Subject:From;
	b=j7auycRPQlQXE5pXWWEELeWcZO5LYe0PYPhtzuw4QUiwBKHFles7atKiwMFvFfUdt
	 Ag4FkZCaAL0g3zC4nwZfXvViPnRRE7jRUvpmfv2J/5/QzguYBnI/Q3iEjCdveFf4ag
	 bXeOYaP85a3fRkQGnE9gCg044pTVdLmN1VkLNlLs=
Date: Fri, 25 Apr 2025 15:48:24 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Subject: [GIT PULL] Char/Misc driver fixes for 6.15-rc4
Message-ID: <aAuSqCDdwHmRt4QZ@kroah.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git tags/char-misc-6.15-rc4

for you to fetch changes up to 4d239f447f96bd2cb646f89431e9db186c1ccfd4:

  firmware: stratix10-svc: Add of_platform_default_populate() (2025-04-15 18:23:02 +0200)

----------------------------------------------------------------
Char/Misc driver fixes for 6.15-rc4

Here are some small char/misc driver fixes to resolve reported problems
for 6.15-rc4.  Included in here are:
  - misc chrdev region range fix reported by many people
  - nvmem driver fixes and dt updates
  - mei new device id and fixes
  - comedi driver fix
  - pps driver fix
  - binder debug log fix
  - pci1xxxx driver fixes
  - firmware driver fix

All of these have been in linux-next for over a week with no reported
issues.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

----------------------------------------------------------------
Akhil P Oommen (1):
      dt-bindings: nvmem: qfprom: Add X1E80100 compatible

Alexander Usyskin (1):
      mei: me: add panther lake H DID

Barnabás Czémán (1):
      dt-bindings: nvmem: Add compatible for MS8937

Carlos Llamas (1):
      binder: fix offset calculation in debug log

Dmitry Baryshkov (5):
      dt-bindings: nvmem: fixed-cell: increase bits start value to 31
      nvmem: core: fix bit offsets of more than one byte
      nvmem: core: verify cell's raw_len
      nvmem: core: update raw_len if the bit reading is required
      nvmem: qfprom: switch to 4-byte aligned reads

Hans de Goede (2):
      mei: vsc: Fix fortify-panic caused by invalid counted_by() use
      mei: vsc: Use struct vsc_tp_packet as vsc-tp tx_buf and rx_buf type

Haoxiang Li (1):
      mcb: fix a double free bug in chameleon_parse_gdd()

Heiko Stuebner (4):
      nvmem: rockchip-otp: Move read-offset into variant-data
      dt-bindings: nvmem: rockchip,otp: add missing limits for clock-names
      dt-bindings: nvmem: rockchip,otp: Add compatible for RK3576
      nvmem: rockchip-otp: add rk3576 variant data

Ian Abbott (1):
      comedi: jr3_pci: Fix synchronous deletion of timer

Lorenzo Stoakes (1):
      intel_th: avoid using deprecated page->mapping, index fields

Mahesh Rao (1):
      firmware: stratix10-svc: Add of_platform_default_populate()

Raag Jadav (1):
      pps: generators: tio: fix platform_set_drvdata()

Rengarajan S (2):
      misc: microchip: pci1xxxx: Fix Kernel panic during IRQ handler registration
      misc: microchip: pci1xxxx: Fix incorrect IRQ status handling during ack

Rudraksha Gupta (1):
      dt-bindings: nvmem: Add compatible for MSM8960

Sricharan Ramabadhran (1):
      dt-bindings: nvmem: Add compatible for IPQ5018

Thadeu Lima de Souza Cascardo (1):
      char: misc: register chrdev region with all possible minors

 .../bindings/nvmem/layouts/fixed-cell.yaml         |  2 +-
 .../devicetree/bindings/nvmem/qcom,qfprom.yaml     |  4 +++
 .../devicetree/bindings/nvmem/rockchip,otp.yaml    | 25 ++++++++++++++
 drivers/android/binder.c                           |  2 +-
 drivers/char/misc.c                                |  2 +-
 drivers/comedi/drivers/jr3_pci.c                   |  2 +-
 drivers/firmware/stratix10-svc.c                   | 14 ++++++--
 drivers/hwtracing/intel_th/Kconfig                 |  1 +
 drivers/hwtracing/intel_th/msu.c                   | 31 ++++-------------
 drivers/mcb/mcb-parse.c                            |  2 +-
 drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gpio.c    |  8 +++--
 drivers/misc/mei/hw-me-regs.h                      |  1 +
 drivers/misc/mei/pci-me.c                          |  1 +
 drivers/misc/mei/vsc-tp.c                          | 40 ++++++++++++----------
 drivers/nvmem/core.c                               | 40 +++++++++++++++++-----
 drivers/nvmem/qfprom.c                             | 26 ++++++++++----
 drivers/nvmem/rockchip-otp.c                       | 17 +++++++--
 drivers/pps/generators/pps_gen_tio.c               |  2 +-
 18 files changed, 151 insertions(+), 69 deletions(-)
