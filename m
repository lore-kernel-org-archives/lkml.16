Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922F52512E0
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 19:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745953950; cv=none; b=AGnHPQ2qCWBesKmnItO2mL9GtDItRc0WHUe+axjecWXdHlvF12uMRR3YOsJKCNGf65f16+5NdLNAGYsN+bm5lBNPkWoVLM7h+0dCX4yTVOwY8t8XiePKyMdwkDvEwPu9sa9NDMLJpYFHgPr5InUpTxTGjSFpFmHF9EH78iDXzYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745953950; c=relaxed/simple;
	bh=TmP+Zws8ZbQStA888ASp5wXT/Trji0b5e7cTOy5iFkE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DcHMgwJxRlrRgdr1fbGIu0MGt6yTKvlgvb8QVH+OfG+ImxY7QW/s1yn+ZgXRoCWMhDrZwhl2ENWnLWUqfKXRGiVKLNDuzfmHlVFs9wz+taMJ7p8HfpR78FLPlz6AwsN9BP2UgK04xSJaLGpyhLZqv93l68pT6/pxDrdMnsypKxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=GBPLmYhO; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="GBPLmYhO"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-73bf5aa95e7so5466627b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 12:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1745953948; x=1746558748; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fn1/tyAIEND90Rv56YKsi6L2woLewFiYtRkzSAQCZUk=;
        b=GBPLmYhOFpDS25ZcZvoccdvV4kL07JeD3bCf0VhjvnPf2jNzFe6iTnovTHY2/ChId3
         7OXTjGJ4/3jqT5QklhL5o1GWjqbhdDBZbZf8BylgncgN+9BsAoKuQOBQX24CxVaGaRdg
         KfeqAQgFlqEQ61n0Fp0Gy/NQjGM/i1eAR0N0kuSxGF/2IbRFyWFht4THPEY/edE3LSKm
         A92falmM8BCfBxRSNA6KxOdpIJJeh7rW1aXmoePCV4Ac2RhqPnz5FvSLMkTg/DcdVwMB
         O1VDoGGdNEHokArZudZFRDkmGbYms/alOtd6vJTbncpn8gbCPsdz+TKhIxg36MPy7GVR
         2KoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745953948; x=1746558748;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fn1/tyAIEND90Rv56YKsi6L2woLewFiYtRkzSAQCZUk=;
        b=M3oCeytjBKoJQXowQiCMEDMdt+AqYI3VC12r6pheN6DdsZLEmvPcQB3Ii74fXXpgjl
         F3sNuHM+DPb927pZpNyw+jwlzK5mZKjtaOa8LEixrkQKs1in6r/Bmtip5y/jhn5bbFEN
         JdRcmE7EsiIDFFjCuinhTsHDa6muGi2VpfujRDFSlnf2H7tQVWoapLyomLnMWBQoOnA+
         D/76sE0Lt2jZPAm4lzW8FLhlN5PckxFqL1UJJqewOPNq7SoAQoHH2wlUAzS7E/IS/jue
         5beKAY0S0nS9pbFrGbl9rPWOIuakXNxV/Z2pEBFH0itpPkPo9KOrb1iSMdYEaTiWB/Al
         ihNA==
X-Forwarded-Encrypted: i=1; AJvYcCWGyrZdgeLoUlcg4/57OhIzw6L/B1tNpd1ut54m5c3bZQZxIBQLKbdGBbFl1VBd6cAtZTWlN4WM0IFF4sI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRtGdwGeCifM/qlnaz65KAN8DCAtRZQaKaVBNKY8NY9FDwFJ57
	jWbOz3a5TQQfytla5owdWN4ZizMV1nackgANRiQgI7/mtvxVJJuqnVzOJetnXbB9S6NKWEQxwDZ
	3vA==
X-Gm-Gg: ASbGnct9nwvPgvPQpeWTdifVvwzZf6OTjIlTvn2AZqpa163Zjmyox3x2i2+SdM7GkZY
	x0oODa598NQsEsVDtqZzJlZa45mq07peOuv3Yms4Rtqar6huA/fSOSTOdu6AMPdE7sf2D4E6n4T
	vu0W/GD2pWrdkWYHBtvPAhoOQ9XQS2PgeEdDfGq1BVUHGxE3VGzIt+UIOYvlM+yW92HmIEISpJX
	ksh2+y+ITOtlEgJyYlvKLLhA4ygcZYykOS5a2SDtCyYZ2uEC2rsCir2thQ8vYALoWu68ozVzVoz
	HHCaGE8p5I9vnjXhb6cHAi2AXdsbKopBjMQjAEXREyPnekA=
X-Google-Smtp-Source: AGHT+IEn4lLGuZKlFp3oHQAQSCSkap7FF6WdimLoYoidSj52xLdEPVumCOz6MFUMeJSivKh00HA63A==
X-Received: by 2002:a05:6a00:1383:b0:73e:359:acf4 with SMTP id d2e1a72fcca58-74038781123mr656396b3a.0.1745953947644;
        Tue, 29 Apr 2025 12:12:27 -0700 (PDT)
Received: from [172.16.116.85] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74039a30dcasm21577b3a.112.2025.04.29.12.12.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 12:12:26 -0700 (PDT)
Message-ID: <f9a825fc-5b12-4099-8f18-3604a96354b0@beagleboard.org>
Date: Wed, 30 Apr 2025 00:42:09 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] of: overlay: Add support for export-symbols node
 feature
To: Herve Codina <herve.codina@bootlin.com>, Andrew Davis <afd@ti.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Saravana Kannan <saravanak@google.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241209151830.95723-1-herve.codina@bootlin.com>
Content-Language: en-US
From: Ayush Singh <ayush@beagleboard.org>
In-Reply-To: <20241209151830.95723-1-herve.codina@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/9/24 20:48, Herve Codina wrote:

> Hi,
>
> At Linux Plumbers Conference 2024, we (me and Luca Ceresolli) talked
> about issues we have with runtime hotplug on non-discoverable busses
> with device tree overlays [1].
>
> On our system, a base board has a connector and addon boards can be
> connected to this connector. Both boards are described using device
> tree. The base board is described by a base device tree and addon boards
> are describe by overlays device tree. More details can be found at [2].
>
> This kind of use case can be found also on:
>    - Grove Sunlight Sensor [3]
>    - mikroBUS [4]
>
> One of the issue we were facing on was referencing resources available
> on the base board device tree from the addon overlay device tree.
>
> Using a nexus node [5] helps decoupling resources and avoid the
> knowledge of the full base board from the overlay. Indeed, with nexus
> node, the overlay need to know only about the nexus node itself.
>
> For instance, suppose a connector where a GPIO is connected at PinA. On
> the base board this GPIO is connected to the GPIO 12 of the SoC GPIO
> controller.
>
> The base board can describe this GPIO using a nexus node:
>      soc_gpio: gpio-controller {
>        #gpio-cells = <2>;
>      };
>
>      connector1: connector1 {
>          /*
>           * Nexus node for the GPIO available on the connector.
>           * GPIO 0 (Pin A GPIO) is connected to GPIO 12 of the SoC gpio
>           * controller
>           */
>          #gpio-cells = <2>;
>          gpio-map = <0 0 &soc_gpio 12 0>;
>          gpio-map-mask = <0xf 0x0>;
>          gpio-map-pass-thru = <0x0 0xf>;
>      };
>
> The connector pin A GPIO can be referenced using:
>    <&connector1 0 GPIO_ACTIVE_HIGH>
>
> This implies that the overlay needs to know about exact label that
> references the connector. This label can be different on a different
> board and so applying the overlay could failed even if it is used to
> describe the exact same addon board. Further more, a given base board
> can have several connectors where the exact same addon board can be
> connected. In that case, the same overlay cannot be used on both
> connector. Indeed, the connector labels have to be different.
>
> The export-symbols node introduced by this current series solves this
> issue.
>
> The idea of export-symbols is to have something similar to the global
> __symbols__ node but local to a specific node. Symbols listed in this
> export-symbols are local and visible only when an overlay is applied on
> a node having an export-symbols subnode.
>
> Using export-symbols, our example becomes:
>      soc_gpio: gpio-controller {
>        #gpio-cells = <2>;
>      };
>
>      connector1: connector1 {
>          /*
>           * Nexus node for the GPIO available on the connector.
>           * GPIO 0 (Pin A GPIO) is connected to GPIO 12 of the SoC gpio
>           * controller
>           */
>          #gpio-cells = <2>;
>          gpio-map = <0 0 &soc_gpio 12 0>;
>          gpio-map-mask = <0xf 0x0>;
>          gpio-map-pass-thru = <0x0 0xf>;
>
>          export-symbols {
>            connector = <&connector1>;
>          };
>      };
>
> With that export-symbols node, an overlay applied on connector1 node can
> have the symbol named 'connector' resolved to connector1. Indeed, the
> export-symbols node available at connector1 node is used when the
> overlay is applied. If the overlay has an unresolved 'connector' symbol,
> it will be resolved to connector1 thanks to export-symbols.
>
> Our overlay using the nexus node can contains:
>     node {
>        foo-gpio = <&connector 0 GPIO_ACTIVE_HIGH>;
>     };
> It used the GPIO 0 from the connector it is applied on.
>
> A board with two connectors can be described with:
>      connector1: connector1 {
>          ...
>          export-symbols {
>            connector = <&connector1>;
>          };
>      };
>
>      connector2: connector2 {
>          ...
>          export-symbols {
>            connector = <&connector2>;
>          };
>      };
>
> In that case, the same overlay with unresolved 'connector' symbol can be
> applied on both connectors and the correct symbol resolution (connector1
> or connector2) will be done.
>
> This current series add support for the export-symbols node feature:
>    - Patch 1 describes the export-symbols binding
>    - Patches 2 to 6 prepare and add the support for the export-symbols
>      feature
>    - Patch 7 adds an unittest for the export-symbols feature
>
> Best regards,
> Hervé
>
> [1] https://lpc.events/event/18/contributions/1696/
> [2] https://lore.kernel.org/lkml/20240917-hotplug-drm-bridge-v4-0-bc4dfee61be6@bootlin.com/
> [3] https://lore.kernel.org/lkml/20240702164403.29067-1-afd@ti.com/
> [4] https://lore.kernel.org/lkml/20240627-mikrobus-scratch-spi-v5-0-9e6c148bf5f0@beagleboard.org/
> [5] https://github.com/devicetree-org/devicetree-specification/blob/v0.4/source/chapter2-devicetree-basics.rst#nexus-nodes-and-specifier-mapping
>
> Herve Codina (7):
>    dt-bindings: Add support for export-symbols node
>    of: resolver: Introduce get_phandle_from_symbols_node()
>    of: resolver: Add export_symbols in of_resolve_phandles() parameters
>    of: resolver: Add support for the export symbols node
>    of: overlay: Add export_symbols_name in of_overlay_fdt_apply()
>      parameters
>    of: overlay: Add support for the export symbols node
>    of: unittest: Add tests for export symbols
>
>   .../devicetree/bindings/export-symbols.yaml   | 43 ++++++++++
>   drivers/misc/lan966x_pci.c                    |  3 +-
>   drivers/of/of_kunit_helpers.c                 |  2 +-
>   drivers/of/of_private.h                       |  2 +-
>   drivers/of/overlay.c                          | 30 ++++++-
>   drivers/of/resolver.c                         | 80 ++++++++++++++-----
>   drivers/of/unittest-data/Makefile             |  5 ++
>   .../unittest-data/overlay_export_symbols.dtso | 15 ++++
>   .../of/unittest-data/testcases_common.dtsi    |  1 +
>   .../unittest-data/tests-export-symbols.dtsi   | 30 +++++++
>   drivers/of/unittest.c                         | 76 ++++++++++++++++--
>   include/linux/of.h                            |  6 +-
>   12 files changed, 259 insertions(+), 34 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/export-symbols.yaml
>   create mode 100644 drivers/of/unittest-data/overlay_export_symbols.dtso
>   create mode 100644 drivers/of/unittest-data/tests-export-symbols.dtsi
>
Tested for pocketbeagle2 connector [0]


[0]: https://github.com/Ayush1325/linux/tree/b4/beagle-cape


Tested-by: Ayush Singh <ayush@beagleboard.org>

