Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1AA2512EE;
	Mon, 23 Jun 2025 12:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750683409; cv=none; b=oXb/jSS4V5Gt7rUjD84dxtDxBdnZpNXasNO+rw5MZPtkK8mVL3+/fJ17/3D9nK+i+OGQtFxypY3WPxEk4OrrU68r9joONGLRsbHt9SYLT1nq6AHVhNcIb2XrM/zZe2YifKnnr+NkuSrw2zNoUxEm/8OJorZQam0jVtThhPpviTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750683409; c=relaxed/simple;
	bh=AN/fmMRmp199vwZFouxTxb9gbavJDOlWyfuWbGe5Y8A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VsEoa0zE68KCsuEbjptchnCEzM9wWCpRs65LLl5jsoM71B0x4nCMQcKvdvqXdHXyRlOWSjL8RU+GpTXqIV7hxldyol+8dHzwnsrjxn+WHNG4//gq2CuyoghMy1BYGsyAMDrTdHLsS6n15IEdotpuBUwDqEm9eY6xSSE3qQu3IYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jHPjRLu5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jHPjRLu5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59E8AC4CEF1;
	Mon, 23 Jun 2025 12:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750683409;
	bh=AN/fmMRmp199vwZFouxTxb9gbavJDOlWyfuWbGe5Y8A=;
	h=From:To:Cc:Subject:Date:From;
	b=jHPjRLu5+7OJ1P6bsAXyRqJ+0mJ8o67o14jKkyP5htkeVxnjSYyS1+d5UuppMIuXj
	 kI3qVnh2fprV5KEVamnUAj75MlMgx1lt+74x59mxrxFJGVc6dMn0JuBQRZUon7ep5F
	 saMvGzunJQJEPmeyWY6pfPI9aV+9D31zg+ERysTOB63g+1aFRiLCRQmaQJuPRc99Xa
	 QBy04+qYv5RsU4NayCOv3eWPzsqoyXl36bsU+4VHmOT5wFnouWleN1dq++xf/o0mR3
	 VbuZI3jH8PfkY3uVxd1xZ4MtikRnROg78rW9UaHSMKJNg26HwFTCZqJjig47uM96VK
	 yM/UMT3j6F9Eg==
From: Conor Dooley <conor@kernel.org>
To: sboyd@kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	pierre-henry.moussay@microchip.com,
	valentina.fernandezalanis@microchip.com,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/9] Redo PolarFire SoC's mailbox/clock devicestrees and related code
Date: Mon, 23 Jun 2025 13:56:14 +0100
Message-ID: <20250623-levitate-nugget-08c9a01f401d@spud>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5494; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=omk1CikIFivBf32iix8/b+9fYptZBC4DMf6e6vdMZ9Q=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDBmRfu+UlRaJzN+b06Qs+4B3wkE1nSePln3MULi+8v9r1 +IF4rkGHaUsDGIcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZhIqwPDf/eZwed3xWXuajF9 fK9y4w7VVrHt1tofDx3qmLAr2LRb6QvD/4CNvY+S/8y/Jdhz2yH07YoS/i8x5168V9+zdsqu2fp cOXwA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

Yo,

Stephen - I would really like to know if what I have done with the
regmap clock is what you were asking for (a there's a link to that below
to remind yourself). I've been trying to get you to look at this for a
while, even just to affirm that I am on the right track!

Cheers,
Conor.

v3 changes:
- drop simple-mfd (for now) from syscon node

v2 cover letter:

Here's something that I've been mulling over for a while, since I
started to understand how devicetree stuff was "meant" to be done.
There'd been little reason to actually press forward with it, because it
is fairly disruptive. I've finally opted to do it, because a user has
come along with a hwmon driver that needs to access the same register
region as the mailbox and the author is not keen on using the aux bus,
and because I do not want the new pic64gx SoC that's based on PolarFire
SoC to use bindings etc that I know to be incorrect.

Given backwards compatibility needs to be maintained, this patch series
isn't the prettiest thing I have ever written. The reset driver needs to
retain support for the auxiliary bus, which looks a bit mess, but not
much can be done there. The mailbox and clock drivers both have to have
an "old probe" function to handle the old layout. Thankfully in the
clock driver, regmap support can be used to identically
handle both old and new devicetree formats - but using a regmap in the
mailbox driver was only really possible for the new format, so the code
there is unfortunately a bit of an if/else mess that I'm both not proud
of, nor really sure is worth "improving".

The series should be pretty splitable per subsystem, only the dts change
has some sort of dependency, but I'll not be applying that till
everything else is in Linus' tree, so that's not a big deal.

I don't really want this stuff in stable, hence a lack of cc: stable
anywhere here, since what's currently in the tree works fine for the
currently supported hardware.

AFAIK, the only other project affected here is U-Boot, which I have
already modified to support the new format.

I previously submitted this as an RFC, only to Lee and the dt list, in
order to get some feedback on the syscon/mfd bindings:
https://lore.kernel.org/all/20240815-shindig-bunny-fd42792d638a@spud/
I'm not really going to bother with a proper changelog, since that was
submitted with lots of WIP code to get answers to some questions. The
main change was "removing" some of the child nodes of the syscons.

And as a "real" series where discussion lead to me dropping use of the
amlogic clk-regmap support:
https://lore.kernel.org/linux-clk/20241002-private-unequal-33cfa6101338@spud/
As a result of that, I've implemented what I think Stephen was asking
for - but I'm not at all sure that it is..

CC: Conor Dooley <conor.dooley@microchip.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>
CC: pierre-henry.moussay@microchip.com
CC: valentina.fernandezalanis@microchip.com
CC: Michael Turquette <mturquette@baylibre.com>
CC: Stephen Boyd <sboyd@kernel.org>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: Jassi Brar <jassisinghbrar@gmail.com>
CC: Lee Jones <lee@kernel.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>
CC: Palmer Dabbelt <palmer@dabbelt.com>
CC: Philipp Zabel <p.zabel@pengutronix.de>
CC: linux-riscv@lists.infradead.org
CC: linux-clk@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Conor Dooley (9):
  dt-bindings: mfd: syscon document the control-scb syscon on PolarFire
    SoC
  dt-bindings: soc: microchip: document the simple-mfd syscon on
    PolarFire SoC
  soc: microchip: add mfd drivers for two syscon regions on PolarFire
    SoC
  reset: mpfs: add non-auxiliary bus probing
  dt-bindings: clk: microchip: mpfs: remove first reg region
  riscv: dts: microchip: fix mailbox description
  riscv: dts: microchip: convert clock and reset to use syscon
  clk: divider, gate: create regmap-backed copies of gate and divider
    clocks
  clk: microchip: mpfs: use regmap clock types

 .../bindings/clock/microchip,mpfs-clkcfg.yaml |  36 ++-
 .../devicetree/bindings/mfd/syscon.yaml       |   2 +
 .../microchip,mpfs-mss-top-sysreg.yaml        |  47 +++
 arch/riscv/boot/dts/microchip/mpfs.dtsi       |  34 ++-
 drivers/clk/Kconfig                           |   8 +
 drivers/clk/Makefile                          |   2 +
 drivers/clk/clk-divider-regmap.c              | 271 ++++++++++++++++++
 drivers/clk/clk-gate-regmap.c                 | 254 ++++++++++++++++
 drivers/clk/microchip/Kconfig                 |   4 +
 drivers/clk/microchip/clk-mpfs.c              | 151 ++++++----
 drivers/reset/reset-mpfs.c                    |  81 ++++--
 drivers/soc/microchip/Kconfig                 |  13 +
 drivers/soc/microchip/Makefile                |   1 +
 drivers/soc/microchip/mpfs-control-scb.c      |  45 +++
 drivers/soc/microchip/mpfs-mss-top-sysreg.c   |  48 ++++
 include/linux/clk-provider.h                  | 120 ++++++++
 16 files changed, 1023 insertions(+), 94 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-mss-top-sysreg.yaml
 create mode 100644 drivers/clk/clk-divider-regmap.c
 create mode 100644 drivers/clk/clk-gate-regmap.c
 create mode 100644 drivers/soc/microchip/mpfs-control-scb.c
 create mode 100644 drivers/soc/microchip/mpfs-mss-top-sysreg.c

-- 
2.45.2

