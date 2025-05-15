Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3221E7C03;
	Thu, 15 May 2025 21:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747343289; cv=none; b=Ylcc0HLG/yoe8a7oU3o+w1lKhUzO5IqGknrRDsrPF+OhVhet50NMrzIbfN3mev9WeCgTYZo5hyD5ZENfQPoH9zGeHPFm/VKvsMpzOrXpqeghziuh97IIVe0Xmc/UaWkOAnBggetkN1y0u3/FEEWExJlPunDFq0qQoAyNX2/HsPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747343289; c=relaxed/simple;
	bh=clLFMoksIZjNzvckYS4V6zrVwO38O0rMAgR70yMkijA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KZKp5oKWkMRT5SJMFGLxWRqiWTqg0OBATrzHbjutB6TCPF0gPqXwy2UNzvFWREl2mMtd7MqH1gHFKh7NKHDIerg0w6y00cMKdhqRDGabIAv2LArKyVSYIBFT/eqeyUkQUI5Y8vWYTSHfmOgVUKIL+T4bkvvNhhTHexpanApkAGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Clmeb4uT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Clmeb4uT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E239C4CEE7;
	Thu, 15 May 2025 21:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747343288;
	bh=clLFMoksIZjNzvckYS4V6zrVwO38O0rMAgR70yMkijA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Clmeb4uTuUoYuH0AbeKx01O7wbV7atelt5sPUVLtMQlmZNY9fWKflAUDChDEj15jo
	 OdUwbrCu9AcLRAmlTEvkiYub/mlV1jA3h+PuHuXKffbtm9ntxcVUvzRw1tOYFM4caf
	 pwqD/DCBc0ctZ3NBledLEFEKy1ouu0abfrmNNBUthyW2xQcZau3/ZOUuwhyZfCRmVC
	 A3ww5zeM4/8oqNLfps7CbAJ+Z+ER2PLY767qcIE0rVv7NqLEyJJgmzh0m6maT6hNlQ
	 tFIM+s18wCrE3PMdAdHdtk36XZNUglbdwuoAC1OdJn/pApYiJcbcRzH1svbfTIN66x
	 XDNiLU16AAWLQ==
From: Conor Dooley <conor@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	E Shattow <e@freeshell.de>
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 0/4] riscv: dts: starfive: jh7110-common: Sync downstream U-Boot changes
Date: Thu, 15 May 2025 22:08:00 +0100
Message-ID: <20250515-stretch-posted-2327312fa5fd@spud>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250502103101.957016-1-e@freeshell.de>
References: <20250502103101.957016-1-e@freeshell.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=953; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=29OFmuara6JO+ssHbYgrp1f7OLZ7r4ICupGKHqCK92g=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDBlq4Ru7p73/cGeVMB/nzDmigYb9AqcdLhesvTEji/nn5 V2bLslFdZSyMIhxMMiKKbIk3u5rkVr/x2WHc89bmDmsTCBDGLg4BWAilgcY/uc4MDIG769ZxKKe WvTJrMtNTUVS4h4TK4+fTfil3HUx/owMC9nPuDLtrFok0ZHjZ/N6/S6230ntc0IUWF3ePHL2OVn JDwA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

On Fri, 02 May 2025 03:30:40 -0700, E Shattow wrote:
> U-Boot boot loader has adopted using the Linux dt-rebasing tree for dts
> with StarFive VisionFive2 board target (and related JH7110 common boards).
> Sync the minimum changes from jh7110-common.dtsi needed for boot so these
> can be dropped from U-Boot.
> 
> Changes since v2:
> 
> [...]

Applied to riscv-dt-for-next, thanks!

[1/4] riscv: dts: starfive: jh7110-common: add CPU BUS PERH QSPI clocks to syscrg
      https://git.kernel.org/conor/c/724a6718ce21
[2/4] riscv: dts: starfive: jh7110-common: qspi flash setting read-delay 2 cycles max 100MHz
      https://git.kernel.org/conor/c/59404dceb303
[3/4] riscv: dts: starfive: jh7110-common: add eeprom node to i2c5
      https://git.kernel.org/conor/c/635918111453
[4/4] riscv: dts: starfive: jh7110-common: bootph-pre-ram hinting needed by boot loader
      https://git.kernel.org/conor/c/d50108706a63

Thanks,
Conor.
