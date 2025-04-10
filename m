Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5818A22D7A6;
	Thu, 10 Apr 2025 09:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744276808; cv=none; b=WmeMOrZeQFfHboaSV8IsQDRlVt9e7JdrOlAXkrK54Uxh5r4FxDDRZrMWd7XV15E5U0DQYpJKmFTDh64KjYq8Luprh3U35LgaTh8tJcXIxkiIaz5V7XyA1uMk31tjE86+ZD1sDe+0tr8p6bjt80wbXe5oxosMJOVVtYlaJ8AVQhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744276808; c=relaxed/simple;
	bh=1IRq0c3Owi/VgGPcWGzFtiuIsOh5P8FvJI4iLgTp2iM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=o8DaboaGkhFpPNbT1K026wzCpEXS8rypGXi+JuIDBl7EUjtVAHNIFnDh7la7apfE5/CfAE/taYuskAGAGJcCCGmYX3MpgvfOriPS0lYYtVTWFqABdrm2TtP9gwTrctJEYqh+ItZccL0wF+P+cAsJnNHX8HYmzi9X0Tj1hw8UahI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=A7yNQQta; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=VbKoGyMq; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="A7yNQQta";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="VbKoGyMq"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744276805;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XJhF12/fclwO6zAdWUTEZxX2hd6wFsf0dBXm6vlW0h8=;
	b=A7yNQQtazyb9XPUZRf0jJSzzrIHi51lf5CjAjz6d9YBB4IoqBfDRyA8tQEV2/lnF+omWdj
	ERVsVR/FZAFhAUXAxG7j+1Ig8+0zjZmINIMBQVpjU8LJQL561shJpy+DqqpDLoQTC6mJ9Z
	oJvjTnDQDqC7hUifRGCwy61wyiRiWnAK9RF3sq6iWRZOymOjLnjE3L9I84Tx8ONmHfrVBB
	//Ml62580CLywJmps4WxxNFHGe0DjKPPTsTed7CDJgBH1XBZPCkVOeyma4M0N8eiZPO9Qk
	oQAJCNQkDtgDkZhhMLq3GGfUqRGV45X0w/lx/M+yJ9LSOPfjCrWLTXWFY2oZTQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744276805;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XJhF12/fclwO6zAdWUTEZxX2hd6wFsf0dBXm6vlW0h8=;
	b=VbKoGyMqlmME3/WtdvAyQPq0vCnxLJSBQjkbb6Qvq41UuyGSc2qOEwX7EqHcg5BD5r3uzl
	2VmoSm5pfbpFg5Cg==
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Sascha Bischoff <sascha.bischoff@arm.com>, Timothy Hayes
 <timothy.hayes@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 22/24] irqchip/gic-v5: Add GICv5 ITS support
In-Reply-To: <Z/d8bP9GceSVpJAU@lpieralisi>
References: <20250408-gicv5-host-v1-0-1f26db465f8d@kernel.org>
 <20250408-gicv5-host-v1-22-1f26db465f8d@kernel.org> <87jz7ttb7l.ffs@tglx>
 <Z/d8bP9GceSVpJAU@lpieralisi>
Date: Thu, 10 Apr 2025 11:20:05 +0200
Message-ID: <878qo8tltm.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Apr 10 2025 at 10:08, Lorenzo Pieralisi wrote:
> On Wed, Apr 09, 2025 at 08:57:02PM +0200, Thomas Gleixner wrote:
> Anyway - as I mentioned in the cover letter, the current IWB driver
> design, (patch 23 - where the guard(mutex) bug is and more readl_poll_*
> boilerplate :), sorry), is a bit of a question (should I move it to
> DOMAIN_BUS_WIRED_TO_MSI with the fixed eventid caveat to solve somehow),
> or is it OK "as-is", treating it basically as an ITS hardcoded plugin ?

I'm not sure whether DOMAIN_BUS_WIRED_TO_MSI buys much, but OTOH from a
layering perspective it's more in line with the existing wire to MSI
implementations. Marc might have an opinion there :)

Thanks,

        tglx
