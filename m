Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9CB1220F28;
	Fri, 20 Jun 2025 19:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750447892; cv=none; b=OXWbahhsE4p4hHPj1dY78PZsJz7VyDYXSA84IECsGXRKLU54WrkZPqo0jXHxmBRJMYX9tUAxjdHxJ8vPiOZWQI9U1nKUWwAUTphKe5zbZ02QlUEveTIwu6WkDdiX9Kd20CSzvJyK3WcyVJpyd5hBgVkaQQO+Ss+k1FWk36+l0Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750447892; c=relaxed/simple;
	bh=jQA4hG/uM+YlIkruasoqokDrnbiba8InDRZ1ZHCknuw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=PdjUatwkzTMmE/QJKVSnoh+NViImvmnOMxFpi2GEcdqd+J/+pn5qiejdwIWNtBPdBjKVfvZPaRWw1XfWObUaawuuisk2TILBkH5XPy4aHcvfDVDrhTA9Gz/T7mhSqPpQgKkVf2lYH1aZDPUILKoVoWWXUtgmPM3bqyzreRjGFXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=b3ml1U1G; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=boEha1ki; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="b3ml1U1G";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="boEha1ki"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750447888;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GvtcQZDO3suQ8qW+ppaEep+NmtIaA6n6Fu//p+1dkeg=;
	b=b3ml1U1G5s4S65os7qBjooL6xKAyhvSx9aD54KK74ByJbA8vwown3JGrYKr0mWKwI9YSMR
	gtlLkZah1cRh5hJEYKyxpvnN6Hr5laTRGstzK6lg5eHV8TgCx8vebYhc++Mi4MVNfwuhpj
	ixJrcLRHGqZQ+0oo9GIBBA4UEAzBkfD5OoissdlUPC0pgZ2xVptTmXkOa140FRm0QNje3d
	ecfhhdwu59WmdZ75RrAFkB+j1A5b8sQI7raWjONKwQ/F/OpfOXx1Q7LdGXX/0nFQeK1kLu
	B9pQ5+yPnieS9sQa8w+fEslOwNWfdxYbHZAYzHFwoJrLlUjhvElvkHyVMnuj9w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750447888;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GvtcQZDO3suQ8qW+ppaEep+NmtIaA6n6Fu//p+1dkeg=;
	b=boEha1kiO8b7hgJcg6tNW5hjvJWGGVpT3ac4Oi5mGinPFHCDLJUJ5acUngD3TUePO8gTD+
	cYSdfTKh4wjfbWCA==
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, Chen Wang
 <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, Sunil V L
 <sunilvl@ventanamicro.com>, "Rafael J . Wysocki"
 <rafael.j.wysocki@intel.com>, Ryo Takakura <takakura@valinux.co.jp>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, sophgo@lists.linux.dev, Vladimir
 Kondratiev <vladimir.kondratiev@mobileye.com>
Subject: Re: [PATCH v3 1/7] riscv: helper to parse hart index
In-Reply-To: <20250612143911.3224046-2-vladimir.kondratiev@mobileye.com>
References: <20250609134749.1453835-1-vladimir.kondratiev@mobileye.com>
 <20250612143911.3224046-1-vladimir.kondratiev@mobileye.com>
 <20250612143911.3224046-2-vladimir.kondratiev@mobileye.com>
Date: Fri, 20 Jun 2025 21:31:27 +0200
Message-ID: <87v7oqp5v4.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Jun 12 2025 at 17:39, Vladimir Kondratiev wrote:
> ---
>  arch/riscv/include/asm/irq.h |  2 ++
>  arch/riscv/kernel/irq.c      | 34 ++++++++++++++++++++++++++++++++++
>  2 files changed, 36 insertions(+)

Can the RISCV folks please ack/review this one so this pile can go
through the irqchip tree?

