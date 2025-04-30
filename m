Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D426C25A2D9;
	Wed, 30 Apr 2025 12:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746017530; cv=none; b=RKNnXj5bFcYI8Cfg5uH7hm3TgZKH+kjmPUIAVzimiBzT5zn4LTPxVLG+7aUfSH1+AOjCdL2KMqizYaqUvptrHf0eOMg63B0F8jo5Ocuki0PIenC1C3qwJVlvmAE+XkaDNFQaqbDoRiz3yQDrLfOlBhqCkl+QZJ9Blhu+dEaTcE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746017530; c=relaxed/simple;
	bh=2mgRmo7ZUZ+b2JVF2fEj5j6+byOEyeaHakpR+7P1dtI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SbyFJep3FcUTC5HXXkiHHF5M96ZwXBEDAhTOvBcNqKVLKC/fnsz9fqm8y9z4ggxgkzrRgKiNRj+Gupg2drSBSZPXnIb9EuJDaVJCnV6Q9uRtL3N8lOgFgW4MaiswKfnSPyc5ODB4sQVP6/qyoCSZM1/rcNqxQU9d0CsZ5R8wodw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=EzT+BuzM; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="EzT+BuzM"
Received: by mail.gandi.net (Postfix) with ESMTPA id E1611438A5;
	Wed, 30 Apr 2025 12:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746017526;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lbWeaCtUfSQsWSvVqV0dbxNBCCTOhnLxPnMp/aOhDgU=;
	b=EzT+BuzMhvktiaqZP3uvL5hx/cJggEaje099s7qIq/IkQVhzTsbpenNe9j7tpyUFQmOgkI
	wJTnuCisH7fwuhIG4RWO7rYHmzGPEjkMfVp3YmAEKI4TV+rO/YHdIZo4s89Bw3C7fo0ylY
	rc1ILBKY3J8caRSMQ3FmvkISus8Jy0nqeq5gzKab++vHIKOxOPzWOueORMkc0miNw7ERx0
	8lXz+Q8Woj2kfSVsXYl/URaGaj4VhizIwlcvrzb1J9gNqOFFYLSO0Hdvv4ylB413aRVkva
	24k58zZ+yfYDpCKilT+RgUN+nzRkoqK0AzrbSyTgwv8XuVbG0RfPBcOGxqWLMA==
From: Herve Codina <herve.codina@bootlin.com>
To: David Gibson <david@gibson.dropbear.id.au>,
	Andrew Davis <afd@ti.com>,
	Ayush Singh <ayush@beagleboard.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Herve Codina <herve.codina@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>
Cc: devicetree@vger.kernel.org,
	devicetree-compiler@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v2 0/7] of: overlay: Add support for export-symbols node feature
Date: Wed, 30 Apr 2025 14:51:44 +0200
Message-ID: <20250430125154.195498-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieeijeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomhepjfgvrhhvvgcuvehoughinhgruceohhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeevhedujeegkefgheffiedugeejffekhefhgffgfeegudevledvueffleelhfeiveenucffohhmrghinheplhhptgdrvghvvghnthhspdhkvghrnhgvlhdrohhrghdpghhithhhuhgsrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtrdhlohgtrghlughomhgrihhnpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduiedprhgtphhtthhopegurghvihgusehgihgsshhonhdrughrohhpsggvrghrrdhiugdrrghupdhrtghpthhtoheprghfugesthhirdgtohhmpdhrtghpthhtoheprgihuhhshhessggvrghglhgvsghorghrugdrohhrghdprhgtphhtthhopehgvggvrhhtsehlihhnuhigq
 dhmieekkhdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomh
X-GND-Sasl: herve.codina@bootlin.com

Hi,

At Linux Plumbers Conference 2024, we (me and Luca Ceresolli) talked
about issues we have with runtime hotplug on non-discoverable busses
with device tree overlays [1].

On our system, a base board has a connector and addon boards can be
connected to this connector. Both boards are described using device
tree. The base board is described by a base device tree and addon boards
are describe by overlays device tree. More details can be found at [2].

This kind of use case can be found also on:
  - Grove Sunlight Sensor [3]
  - mikroBUS [4]

One of the issue we were facing on was referencing resources available
on the base board device tree from the addon overlay device tree.

Using a nexus node [5] helps decoupling resources and avoid the
knowledge of the full base board from the overlay. Indeed, with nexus
node, the overlay need to know only about the nexus node itself.

For instance, suppose a connector where a GPIO is connected at PinA. On
the base board this GPIO is connected to the GPIO 12 of the SoC GPIO
controller.

The base board can describe this GPIO using a nexus node:
    soc_gpio: gpio-controller {
      #gpio-cells = <2>;
    };

    connector1: connector1 {
        /*
         * Nexus node for the GPIO available on the connector.
         * GPIO 0 (Pin A GPIO) is connected to GPIO 12 of the SoC gpio
         * controller
         */
        #gpio-cells = <2>;
        gpio-map = <0 0 &soc_gpio 12 0>;
        gpio-map-mask = <0xf 0x0>;
        gpio-map-pass-thru = <0x0 0xf>;
    };

The connector pin A GPIO can be referenced using:
  <&connector1 0 GPIO_ACTIVE_HIGH>

This implies that the overlay needs to know about exact label that
references the connector. This label can be different on a different
board and so applying the overlay could failed even if it is used to
describe the exact same addon board. Further more, a given base board
can have several connectors where the exact same addon board can be
connected. In that case, the same overlay cannot be used on both
connector. Indeed, the connector labels have to be different.

The export-symbols node introduced by this current series solves this
issue.

The idea of export-symbols is to have something similar to the global
__symbols__ node but local to a specific node. Symbols listed in this
export-symbols are local and visible only when an overlay is applied on
a node having an export-symbols subnode.

Using export-symbols, our example becomes:
    soc_gpio: gpio-controller {
      #gpio-cells = <2>;
    };

    connector1: connector1 {
        /*
         * Nexus node for the GPIO available on the connector.
         * GPIO 0 (Pin A GPIO) is connected to GPIO 12 of the SoC gpio
         * controller
         */
        #gpio-cells = <2>;
        gpio-map = <0 0 &soc_gpio 12 0>;
        gpio-map-mask = <0xf 0x0>;
        gpio-map-pass-thru = <0x0 0xf>;

        export-symbols {
          connector = <&connector1>;
        };
    };

With that export-symbols node, an overlay applied on connector1 node can
have the symbol named 'connector' resolved to connector1. Indeed, the
export-symbols node available at connector1 node is used when the
overlay is applied. If the overlay has an unresolved 'connector' symbol,
it will be resolved to connector1 thanks to export-symbols.

Our overlay using the nexus node can contains:
   node {
      foo-gpio = <&connector 0 GPIO_ACTIVE_HIGH>;
   };
It used the GPIO 0 from the connector it is applied on.

A board with two connectors can be described with:
    connector1: connector1 {
        ...
        export-symbols {
          connector = <&connector1>;
        };
    };

    connector2: connector2 {
        ...
        export-symbols {
          connector = <&connector2>;
        };
    };

In that case, the same overlay with unresolved 'connector' symbol can be
applied on both connectors and the correct symbol resolution (connector1
or connector2) will be done.

This current series add support for the export-symbols node feature:
  - Patch 1 describes the export-symbols binding
  - Patches 2 to 6 prepare and add the support for the export-symbols
    feature
  - Patch 7 adds an unittest for the export-symbols feature

Compare to the previous iteration, the series has been rebased on
top of v6.15-rc1 and an compilation issue in unittest has been fixed.

Also it is worth noting the work already done by Ayush Singh related to
this topic on other repositories:
  - Add export-symbols in device-tree specification
      [PATCH v3] Add new `export-symbols` node [6]

  - Support for export-symbols in the device tree compiler
      [PATCH 0/3] Allow specifying target node in fdtoverlay [7]
      [PATCH] checks: Add support for export-symbols [8]

Best regards,
Hervé

[1] https://lpc.events/event/18/contributions/1696/
[2] https://lore.kernel.org/lkml/20240917-hotplug-drm-bridge-v4-0-bc4dfee61be6@bootlin.com/
[3] https://lore.kernel.org/lkml/20240702164403.29067-1-afd@ti.com/
[4] https://lore.kernel.org/lkml/20240627-mikrobus-scratch-spi-v5-0-9e6c148bf5f0@beagleboard.org/
[5] https://github.com/devicetree-org/devicetree-specification/blob/v0.4/source/chapter2-devicetree-basics.rst#nexus-nodes-and-specifier-mapping
[6] https://lore.kernel.org/all/20250411-export-symbols-v3-1-f59368d97063@beagleboard.org/
[7] https://lore.kernel.org/all/20250313-fdtoverlay-target-v1-0-dd5924e12bd3@beagleboard.org/
[8] https://lore.kernel.org/all/20250110-export-symbols-v1-1-b6213fcd6c82@beagleboard.org/

Changes v1 -> v2
  v1: https://lore.kernel.org/all/20241209151830.95723-1-herve.codina@bootlin.com/

  - All patches
    Add 'Tested-by: Ayush Singh <ayush@beagleboard.org>'

  - Patch 1
    Update the 'patternProperties' regexp

  - Patch 2 and 4
    Fix conflicts due to the rebase on top of v6.15-rc1

  - Patch 5
    Fix a typo in commit log

  - Patch 7
    Fix a compilation issue detected by a kernel test robot

Herve Codina (7):
  dt-bindings: Add support for export-symbols node
  of: resolver: Introduce get_phandle_from_symbols_node()
  of: resolver: Add export_symbols in of_resolve_phandles() parameters
  of: resolver: Add support for the export symbols node
  of: overlay: Add export_symbols_name in of_overlay_fdt_apply()
    parameters
  of: overlay: Add support for the export symbols node
  of: unittest: Add tests for export symbols

 .../devicetree/bindings/export-symbols.yaml   | 43 +++++++++++
 drivers/misc/lan966x_pci.c                    |  3 +-
 drivers/of/of_kunit_helpers.c                 |  2 +-
 drivers/of/of_private.h                       |  2 +-
 drivers/of/overlay.c                          | 30 +++++++-
 drivers/of/resolver.c                         | 75 ++++++++++++++----
 drivers/of/unittest-data/Makefile             |  5 ++
 .../unittest-data/overlay_export_symbols.dtso | 15 ++++
 .../of/unittest-data/testcases_common.dtsi    |  1 +
 .../unittest-data/tests-export-symbols.dtsi   | 30 ++++++++
 drivers/of/unittest.c                         | 77 +++++++++++++++++--
 include/linux/of.h                            |  6 +-
 12 files changed, 258 insertions(+), 31 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/export-symbols.yaml
 create mode 100644 drivers/of/unittest-data/overlay_export_symbols.dtso
 create mode 100644 drivers/of/unittest-data/tests-export-symbols.dtsi

-- 
2.49.0

