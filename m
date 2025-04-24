Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A562147F6
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745485891; cv=none; b=BS1tIDagXTrkO5N6Zn7WBCU9ChNbfcHFV4C/pvOxSQJA2jy/2A28Wepme1pQN8mFMpeWINoip/t70cFunNTFFSkTV2KCgwy2GrFSRiE4SNPskf/itCcbakjWlGIN6YUwupnG02fliGJmP5Qm6+Nqm33S7h4Cx4Pq6QUgTvuXMDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745485891; c=relaxed/simple;
	bh=D0+QLnTTaA8BoAdM+fBMbb/li+nh5U0QU3E85OBSLLA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WvULyxKKSfBCEkPks3P8ykthEqMRHw6Wue7Y1pj/bh4McUh7Jr7UwD3e0fedmq6rENkgQbnwErWfCrqH7fCuOiQhhnVhB81ak5a0VZeZckT48StpMmocFV0pUp91WsPmKMEph4NhDtxz95eOeRB8d4usISpTdIl3djgLR3T/2yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=C4pPYpxS; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="C4pPYpxS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745485888;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S9HOt8K1x3ctE3BWSKA9qeH3oq86sKFq23Km/AG9m9c=;
	b=C4pPYpxS81l2+KLqeFQm4g4yMBZHyVwfuMI/F5XN+ibi31BSp0FoNlACl9HfHM7hnkdzen
	Am/hgIltRfMAUymhPA0rgNZBMQnZ4LYGUOUPKsT6yhaaltspawp/Y4z54iNhiGzjviQNn/
	X868ZzOsjY60UTc8tROdEyTNkS5rM9g=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-153-ZaE1gfTlOAeznCTMK1-aPw-1; Thu, 24 Apr 2025 05:11:26 -0400
X-MC-Unique: ZaE1gfTlOAeznCTMK1-aPw-1
X-Mimecast-MFC-AGG-ID: ZaE1gfTlOAeznCTMK1-aPw_1745485885
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-72a48b91fbbso180572a34.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 02:11:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745485885; x=1746090685;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S9HOt8K1x3ctE3BWSKA9qeH3oq86sKFq23Km/AG9m9c=;
        b=P8Q9Nb5TQQiFiXfaDaFmRxwlMtWKQceg0SYSxZxdf8ARHZWWfXGaUpblK8Ji8xw3O2
         CSZPRoFdhBH2eGgcKZXmOLYHr2rOwPTQbAZmpZyP7wX/UNyLSsiOFZ65+CpL6dMFpwsa
         ytQf+3aWn+UDXy7bxGRnYb1jwJhUVmE1qWVX3etutweMA4FKuOIBGWkSkFd8foQ/l/Kg
         2Q7ZS1UmLFe37Z9GU6gfGwcPpbIfxusiCC6j1AyVCsbb5wtUtLTCxIcG/gLZHqJDXMbx
         T929fAf8UO9cgRZzosLUDfnVuJ/i4ftf8jaZcMTUku1mNdxVi51HdDC6D4mQxjoYYTkS
         5QOw==
X-Forwarded-Encrypted: i=1; AJvYcCVTY9ZM1lBmXGV5dBa3tBpqAdigAWZ+sz/14ZbMhwvorkgbnzw+1NwY9i3DSGz4Qf/hS5BPBgYF1QbwHow=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUWHOcBj9pE69sbCJq1BvBopVsWt3qL8hsnGEA0sAgyTabfsHJ
	QmowzXco3HS/V23hhLKz2iCV6UX+SHOi96AL1Y/LBTE2kf/7BaeaLWSNnLK1DSnzVb74wVF0LFD
	ZzE4TFtWKwNT6EplNTJE4m8g0bzfNmzCFtdf02RWgi0yCEYfsrETRBrmeRWF7Sf/No38Isf93Lm
	L6UXcHlLdk+7TQKOCQejNrjRg6d7cXTEslyemc
X-Gm-Gg: ASbGncvmT75vMS1ytninFkryRJZY08g1bfQ2Zx5A0KBryjvsrHgilF3oywZSOaQsbCO
	whdXJBr3cOFqcuWxi5nYlaPLzJDva1afua08KNOnU2T8sk6atw2DmqfoqxDJKtKGiOeE=
X-Received: by 2002:a05:6871:7406:b0:2c8:234d:971b with SMTP id 586e51a60fabf-2d96e6aa4ebmr380756fac.9.1745485885525;
        Thu, 24 Apr 2025 02:11:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFK7qUeJJwQjklraK2nHiUwpH65h8T9xweuQl27N0LwRhvIakqeaQOVUhg1tEDsLwCPFdAeBvDc3b678FCalLc=
X-Received: by 2002:a05:6871:7406:b0:2c8:234d:971b with SMTP id
 586e51a60fabf-2d96e6aa4ebmr380751fac.9.1745485885149; Thu, 24 Apr 2025
 02:11:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250415072724.3565533-1-peter.chen@cixtech.com>
In-Reply-To: <20250415072724.3565533-1-peter.chen@cixtech.com>
From: Enric Balletbo i Serra <eballetb@redhat.com>
Date: Thu, 24 Apr 2025 11:11:00 +0200
X-Gm-Features: ATxdqUE5d3FPvXzpICK8B6GZkItGWuDz2HbxbB6ClXETUq4KFHFcvwKgyIo7a18
Message-ID: <CALE0LRsnuAfaXWPvZAktRk-RKkbhv9DAvdfAfg-AwbMbPynsig@mail.gmail.com>
Subject: Re: [PATCH v6 00/10] arm64: Introduce CIX P1 (SKY1) SoC
To: Peter Chen <peter.chen@cixtech.com>
Cc: soc@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de, 
	jassisinghbrar@gmail.com, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	cix-kernel-upstream@cixtech.com, maz@kernel.org, kajetan.puchalski@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peter,

On Tue, Apr 15, 2025 at 9:30=E2=80=AFAM Peter Chen <peter.chen@cixtech.com>=
 wrote:
>
> Cixtech P1 (internal name sky1) is high performance generic Armv9 SoC.
> Orion O6 is the Arm V9 Motherboard built by Radxa. You could find brief
> introduction for SoC and related boards at:
> https://radxa.com/products/orion/o6#overview
>
> In this series, we add initial SoC and board support for Kernel building.
> Patch 1-2: add dt-binding doc for CIX and its sky1 SoC
> Patch 3-4: add Arm64 build support
> Patch 5-7: add CIX mailbox driver which needs to support SCMI clock proto=
col.
> Patch 8-9: add initial dts support for SoC and Orion O6 board

Many thanks for these patches, with these I was able to run the latest
mainline kernel on boot to the console on my Orion O6 board. I think
others already tested just wanted to point out if you can keep me in
the loop, thanks.

If you feel is useful you can add:

Tested-by: Enric Balletbo i Serra <eballetb@redhat.com>

Thanks,
  Enric

> Patch 10: add MAINTAINERS entry
>
> Currently, to run upstream kernel at Orion O6 board, you need to
> use BIOS released by Radxa, and add "clk_ignore_unused=3D1" at bootargs.
> https://docs.radxa.com/en/orion/o6/bios/install-bios
>
> Changes for v6:
> - Rebase to v6.15-rc2
> - Add mailbox driver
> - Add device tree description for uart, mailbox and scmi firmware (for cl=
ock).
>
> Changes for v5:
> - Patch 5: Delete pmu-spe node which need to refine, and add it in future
> - Patch 6: Refine MAINTAINERS for all CIX SoC and adding code tree locati=
on
>
> Changes for v4:
> - Move add MAINTAINERS entry patch to the last, and add two dts files ent=
ry in it.
> - Add three Krzysztof Kozlowski's Reviewed-by Tags
> - For sky1.dtsi, makes below changes:
>         - Add ppi-partition entry for gic-v3 node, and let pmu-a520 and p=
mu-a720's interrupt entry
>         get its handle
>         - Remove gic-v3's #redistributor-regions and redistributor-stride=
 properties
>         - Change gic-v3's #interrupt-cells as 4, and change all interrupt=
 specifiers accordingly
>         - Remove "arm,no-tick-in-suspend" for timer due to global counter=
 is at always-on power domain
>         - Remove timer's clock frequency due to firmware has already set =
it
>
> Changes for v3:
> - Patch 1: Add Krzysztof Kozlowski's Acked-by Tag
> - Patch 2: Add Krzysztof Kozlowski's Reviewed-by Tag
> - Patch 6: Fix two dts coding sytle issues
>
> Changes for v2:
> - Pass dts build check with below commands:
> make O=3D$OUTKNL dt_binding_check DT_SCHEMA_FILES=3Dvendor-prefixes.yaml
> make O=3D$OUTKNL dt_binding_check DT_SCHEMA_FILES=3Darm/cix.yaml
> make O=3D$OUTKNL CHECK_DTBS=3Dy W=3D1 cix/sky1-orion-o6.dtb
> - Re-order the patch set, and move vendor-perfixes to the 1st patch.
> - Patch 4: Ordered Kconfig config entry by alpha-numerically
> - Patch 5: Corrects the Ack tag's name
> - Patch 6: see below.
> 1) Corrects the SoF tag's name
> 2) Fix several coding sytle issues
> 3) move linux,cma node to dts file
> 4) delete memory node, memory size is passed by firmware
> 5) delete uart2 node which will be added in future patches
> 6) Improve for pmu and cpu node to stands for more specific cpu model
> 7) Improve the timer node and add hypervisor virtual timer irq
>
> Fugang Duan (1):
>   arm64: Kconfig: add ARCH_CIX for cix silicons
>
> Gary Yang (1):
>   dt-bindings: clock: cix: Add CIX sky1 scmi clock id
>
> Guomin Chen (2):
>   dt-bindings: mailbox: add cix,sky1-mbox
>   mailbox: add CIX mailbox driver
>
> Peter Chen (6):
>   dt-bindings: vendor-prefixes: Add CIX Technology Group Co., Ltd.
>   dt-bindings: arm: add CIX P1 (SKY1) SoC
>   arm64: defconfig: Enable CIX SoC
>   arm64: defconfig: enable CIX mailbox
>   arm64: dts: cix: add initial CIX P1(SKY1) dts support
>   MAINTAINERS: Add CIX SoC maintainer entry
>
>  .../devicetree/bindings/arm/cix.yaml          |  26 +
>  .../bindings/mailbox/cix,sky1-mbox.yaml       |  71 ++
>  .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>  MAINTAINERS                                   |  11 +
>  arch/arm64/Kconfig.platforms                  |   6 +
>  arch/arm64/boot/dts/Makefile                  |   1 +
>  arch/arm64/boot/dts/cix/Makefile              |   2 +
>  arch/arm64/boot/dts/cix/sky1-orion-o6.dts     |  39 ++
>  arch/arm64/boot/dts/cix/sky1.dtsi             | 335 ++++++++++
>  arch/arm64/configs/defconfig                  |   2 +
>  drivers/mailbox/Kconfig                       |  10 +
>  drivers/mailbox/Makefile                      |   2 +
>  drivers/mailbox/cix-mailbox.c                 | 632 ++++++++++++++++++
>  include/dt-bindings/clock/sky1-clk.h          | 279 ++++++++
>  14 files changed, 1418 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/cix.yaml
>  create mode 100644 Documentation/devicetree/bindings/mailbox/cix,sky1-mb=
ox.yaml
>  create mode 100644 arch/arm64/boot/dts/cix/Makefile
>  create mode 100644 arch/arm64/boot/dts/cix/sky1-orion-o6.dts
>  create mode 100644 arch/arm64/boot/dts/cix/sky1.dtsi
>  create mode 100644 drivers/mailbox/cix-mailbox.c
>  create mode 100644 include/dt-bindings/clock/sky1-clk.h
>
> --
> 2.25.1
>
>

