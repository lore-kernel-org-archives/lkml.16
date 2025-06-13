Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28692E11C6;
	Fri, 13 Jun 2025 15:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749828850; cv=none; b=ODJPTmumzfVGd66gp4ubtLPihYvoVjibS0EVTUUc3gYHMq87o81vmU+piQszuMI6IrxO9H456JIQX43DHqKf7o4MY+2kLPPIfSnAkPDSk6ndRsvTp8crmi+YzYspZldgj4BEfhmfAayCsJrT42WnmMrQmxn1Xc/HHZiR41IytFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749828850; c=relaxed/simple;
	bh=ftUktIWQ3FpQ+oNWq9GjbTfGde+p4uG7iLxKXxZnMeg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=FF7t8D8+6fVmNZ2W3p2+3dPIIoS0btsJIov2vqjpFuH53jq/kKs9Xu1q+7wv/jU2bUin/x0brvt7iSxjl+QGVLcil9y/kcdCHWs9lHdYFj3xVEDOpACx9KmE91LcSkGtzm6bfSQqXDAcHfAOlLonuaIa59woKcXXk11R+QFQ08o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Qk//4p7P; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=SfGRvKSO; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Qk//4p7P";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="SfGRvKSO"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749828847;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ftUktIWQ3FpQ+oNWq9GjbTfGde+p4uG7iLxKXxZnMeg=;
	b=Qk//4p7Pe3ee5tQzv2DP0kCIu9gs47/kMgqEMHEB5VmmrmVvrqS27+Myn5Z6Rk3cObLRpJ
	sWQiPe7ZFPm0q4XjbnL3uVipcCZ7Rt4edDBwMGDOKB0LJ90FAwmYESDXKrzXVpVBvuZybb
	g0xzINxXqmmGQRMN19BKSzywUOVaAPhnXxtFf6TEvX00lC00z4Kzr10YPAR/xjoI9VtSsq
	0CXvmTrDysgu+SavVCQLeTJmNNHKq6qQK5o3RuOI/5qeYaW8KeSKRCEmBAS7AknAuzCy80
	MlFwxTntd52wy03m2jPjaTHP41BWmNuYgLypxGTxuzPssnd6jibdhCYw1hO2HA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749828847;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ftUktIWQ3FpQ+oNWq9GjbTfGde+p4uG7iLxKXxZnMeg=;
	b=SfGRvKSODKoa8qpc4nvk4dakrEGL44D3qm1o3/S5XU+7X5Wip5K5G4kEDIanl/giVAnCJH
	rgLLj2B+ihreNmAw==
To: Anup Patel <apatel@ventanamicro.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, "Rafael J .
 Wysocki" <rafael@kernel.org>, Mika Westerberg
 <mika.westerberg@linux.intel.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Uwe
 =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Len Brown <lenb@kernel.org>, Sunil V L
 <sunilvl@ventanamicro.com>, Rahul Pathak <rpathak@ventanamicro.com>,
 Leyfoon Tan <leyfoon.tan@starfivetech.com>, Atish Patra
 <atish.patra@linux.dev>, Andrew Jones <ajones@ventanamicro.com>, Samuel
 Holland <samuel.holland@sifive.com>, Anup Patel <anup@brainfault.org>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Anup Patel
 <apatel@ventanamicro.com>
Subject: Re: [PATCH v5 19/23] irqchip/irq-riscv-imsic-early: Export
 imsic_acpi_get_fwnode()
In-Reply-To: <20250611062238.636753-20-apatel@ventanamicro.com>
References: <20250611062238.636753-1-apatel@ventanamicro.com>
 <20250611062238.636753-20-apatel@ventanamicro.com>
Date: Fri, 13 Jun 2025 17:34:06 +0200
Message-ID: <87ikkzirkh.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Jun 11 2025 at 11:52, Anup Patel wrote:

> From: Sunil V L <sunilvl@ventanamicro.com>
>
> ACPI based loadable drivers which need MSIs will also need
> imsic_acpi_get_fwnode() to update the device MSI domain so
> export this function.
>
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>

Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
