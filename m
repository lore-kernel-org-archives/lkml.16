Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7CB4254874
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 17:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747329074; cv=none; b=ieFbVXwWApLiYXOm7CBGNsbfnHnnRulTx+LX/OdPisg7LQ2TkJtkBn3RiYlGiXgrnOsTnC6RGDeHCo77iMaE0bXTYBErHbFS24AqEO68NOLTUKu2JfdIMAOlLKh0bzMZmDBhkTd0wQDh7nZ+EeIsJ5AhZqvSE6UispMtCi3YKMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747329074; c=relaxed/simple;
	bh=S66ui8RplR1hUsEfL2yiUULr7ReEi7voeyYmjYi8kQM=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tepu4i6f7wzBT55o87Do9vkbtOd46PGu69aKzQt0BI3E44neyEGh9u1PtUxPXsUWBil8iuX4BlCfIq/pCUaoKO8o4PSYS1hmmoxGisbr21w62/6yT5WtS3coPbfdjoVxQTtXBF+NLA70Q74wuPW1CmgaBc6V5T96eOVvzjvAAls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=ROl/X5K2; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="ROl/X5K2"
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 655163F830
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 17:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1747329069;
	bh=JtByJyVo62jw0XHnA95uqk/ce1yHYsp6TEnfnoc5j1w=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=ROl/X5K2DjNGRQGG39gm7pLDB+ZrOl6W+kl2UTHPPjAw5LcYeGOjLInbmAARgjMUh
	 Gu4LIIF5zwLAkVsxmC5WcrOKRkRwfk0KeUxBA4Hw2T8bq/fxpXfVGembzWJc6bWO0u
	 dCSCK1VEjZfenCn48ZhLSFtVWVDOyVaS1CCmlAhyP7TIRf4a569pDsy7S9qOLtzoft
	 qo0TDxHxs4FSyr1cyqNjISjHPWa1QHfRZlEiIK4RX7Xb7V4SVJn4ZRchdCHVXjlmQ3
	 p9u0o/Zk4CF47ZzYiYstfsdFltfD9BBvTVfztlrZ8NWXtqzkt6Xl1+id8X+c+Lv4Kd
	 8aHwcJDoX2Urg==
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-52a7458ad5aso317713e0c.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 10:11:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747329067; x=1747933867;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JtByJyVo62jw0XHnA95uqk/ce1yHYsp6TEnfnoc5j1w=;
        b=O6dyaevCZhxqNnL28pML3cdsqed4t+jTxyvyQebC0E71d+I0SMDq7nEec2RMU4Z2wD
         MlTgcs/TDAC7deTaqrTykce3j3DGm44EgBp9DxrAO3sJIeEKX/4w6VeKqfxj/vbUZLqB
         YqQeo8S5yLI2N4ze2JDtFcpiWc2uoFH491DSxP+CR86aVG0Rvi26mFcAVUlaNOiGG+iK
         2SK9DoBon4UAFPtLtVt311+e9xeiEd4jvIvxU416R0brdOg5z4cvgGCJXtyZaEBw0iU5
         350OjnbD0Pi1afRSiIBwHfhX0UOjsHIHH5TED2pecPqFJgaHfZJKbN5t5EN7L+PKTQal
         y4iw==
X-Gm-Message-State: AOJu0YypwaV2GZtKpzxMIy84Sf1teUfei3Iz4pLyyGuPODOhuAkTVwGg
	NhUZeSN9HyAdKZTaX5fxu8XhV2aiV2z2Fo//wbUvAGfjtbcRg4t7dmo3aVC1Jn4K03iZXk/o0+Q
	zAFZvpujSGDC+M3CbypXnWejzjybM6si0C9EvqQQ2sTRjVXN5nM35S0ZKlJJ9VBtOmT6TOFfUBd
	2PUX8Z5BZ94PwlzY8HUiLmQMqmOPHNCHaZACaMEpK2g7RJr1ekpO8jLUoe2TY9rKRsizp/yvj8
X-Gm-Gg: ASbGnculQu3E+OBtiItHzLcVFLIKya5Y9tn48B8R+OCqh1UB694foIAjNxC+9LoGYRt
	3vyr0nX0LhZfdAqlkcBpPQVLJfinD3wufVxwifdsMlIIq6dLRNb1DMKR37H+MLOgYlpBF9Q==
X-Received: by 2002:a05:6122:8c0f:b0:525:aecb:6306 with SMTP id 71dfb90a1353d-52dba970130mr818023e0c.11.1747329067033;
        Thu, 15 May 2025 10:11:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHcaUH2N5muwkVDiIxEHWItA30nxiMYoNCDf2Wv2idVAmWCRr+uin/5sa1AilKtPRZiwiaH2QNVjHO7L9k7ddY=
X-Received: by 2002:a05:6820:1841:b0:608:3ee9:13a4 with SMTP id
 006d021491bc7-609f37a4c25mr127767eaf.5.1747329055811; Thu, 15 May 2025
 10:10:55 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 15 May 2025 10:10:55 -0700
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 15 May 2025 10:10:55 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20250502103101.957016-1-e@freeshell.de>
References: <20250502103101.957016-1-e@freeshell.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Thu, 15 May 2025 10:10:55 -0700
X-Gm-Features: AX0GCFsMRCnrUVPh4GyhcmqGXz7TGDQn2DvhmQZjDAp9e_FqEd74NBSnaFQLito
Message-ID: <CAJM55Z_ebHvpf=G9fMGctkPbAtVd6yco6joRNVbzcAtiEzD=ag@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] riscv: dts: starfive: jh7110-common: Sync
 downstream U-Boot changes
To: E Shattow <e@freeshell.de>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

E Shattow wrote:
> U-Boot boot loader has adopted using the Linux dt-rebasing tree for dts
> with StarFive VisionFive2 board target (and related JH7110 common boards).
> Sync the minimum changes from jh7110-common.dtsi needed for boot so these
> can be dropped from U-Boot.
>
> Changes since v2:
>
> - 1/5 -> 1/4: Do not replace assigned CPU core or PLL0 clock when adding new
>   assignments. Adjust patch name and commit message accordingly.
> - 2/5 -> 2/4: Detail reason for qspi setting changes in commit message
> - 3/5 -> Drop uart0 clock-frequency patch
> - 4/5 -> 3/4: Add reviewed by tag (no change)
> - 5/5 -> 4/4: Follow dts coding style sort order. Add bootph-pre-ram hint
>   for mmc interfaces
>
> Note: mmc boot source modes of JH7110 loader on mask ROM are deprecated as
> of StarFive JH7110 User Guide 1.2 revision. The loader expects data within
> range of LBA 0 and LBA 1 in conflict with GUID Partition Table.
>
> SD Card and eMMC boot media are prepared as follows:
>
> # GPT partition SD Card or eMMC as
> # 1: Secondary Program Loader @ 0x200000
> # 2: Main payload area for use by SPL
> # 3: EFI System Partition
> sgdisk --clear \
>   --new=1:2M:+2M --typecode=1:2E54B353-1271-4842-806F-E436D6AF6985 \
>   --new=2:4M:+4M --typecode=2:5B193300-FC78-40CD-8002-E86C45580B47 \
>   --new=3:8M:+100M --typecode=3:EF00 /dev/sdX
>
> # Write offset value in bytes of loader 'backup section' SPL as part1 @ 2M
> python3 <<-EOF
> with open("/dev/sdX", "r+b") as f:
>   f.seek(0x0004)
>   f.write((0x200000).to_bytes(4, "little"))
> EOF
>
> # Write invalid CRC to trigger 'Main section boot fail,use backup section'
> python3 <<-EOF
> with open("/dev/sdX", "r+b") as f:
>   f.seek(0x0290)
>   f.write((0x5A5A5A5A).to_bytes(4, "little"))
> EOF

This series looks good to me now. Thank you.

/Emil

>
> E Shattow (4):
>   riscv: dts: starfive: jh7110-common: add CPU BUS PERH QSPI clocks to
>     syscrg
>   riscv: dts: starfive: jh7110-common: qspi flash setting read-delay 2
>     cycles max 100MHz
>   riscv: dts: starfive: jh7110-common: add eeprom node to i2c5
>   riscv: dts: starfive: jh7110-common: bootph-pre-ram hinting needed by
>     boot loader
>
>  .../boot/dts/starfive/jh7110-common.dtsi      | 31 ++++++++++++++++---
>  1 file changed, 27 insertions(+), 4 deletions(-)
>
>
> base-commit: ebd297a2affadb6f6f4d2e5d975c1eda18ac762d
> --
> 2.49.0
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
