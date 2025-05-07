Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF904288C31;
	Wed,  7 May 2025 13:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746625366; cv=none; b=Y2QAIr0bTViDSMXaUssP36VcZ3bsRanx4zY04J+1GrttePBVoMclAamlrxVpCnSPU1TB6OhoN+LIbQfZi0ZGURpYrbkmaHtodQcIDWWu74Kn07vTy2v3FpO0G454B3jQxKuPZ54KkTz/krbt+8HhB+bjHnRBHk4KVR017E/4kHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746625366; c=relaxed/simple;
	bh=N8KXT+l+D+lLX+vY9DktI9wLlLwQ03ofPvB1zg8b/f0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=S3/YtZdnP+xo/TJuul8PDkehIQ26TmWMrbaRue6GUVzc0yf8ZZKdA5qEvyx4Xs/VKQqLLpvjU1v+5nIY4TcVWBwhSWrJE65NnzW/Vgi5afBItmQV9gW6UfD6vzcEMFyQkZC12JMdviQDIyFRF4LENVnjUqfLVY3ExmsKbqBzrHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=shOSxWFZ; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=NXcqGGel; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="shOSxWFZ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="NXcqGGel"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746625362;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+78+2+2l+vz4thd4fzsZIiDpYheZnEoUC6X/M8JFQ+I=;
	b=shOSxWFZela5XBLLbauvJz9BG7m+vqSD0Gy+bN4oCEnkdqUNvURj+ZqKa26k7Yhx050RTI
	y0evKBTwX+2HhVBFGikRYaSMpFzbdf3qCBFhZ1aVeYmp1HL+Rlqj0fwMh+IoUxTiZejTt0
	V7HSXvo9DwC8S7pe0MzLSkm4/IJZFFe4UEOT58nZIam9xY6vye2DF0uvNTN4uRiZ0h8CSi
	jwN6IqfZ+a1Ebi5yyxkwOsY2lE9ZI3J1lKOTngOD0rDvtVTg7ylZPDQhznHloukop+QMK+
	XqDCXf1o9eFcrQA7mNGJOMqVjHA6v1ycMdgcbWUdmxfrLlgm0j64iwqgWzw2wQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746625362;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+78+2+2l+vz4thd4fzsZIiDpYheZnEoUC6X/M8JFQ+I=;
	b=NXcqGGelg10I9lqrw8our10jEDm1FPuD5NTxtrDwGvSU2XzWT6j6WMq8MIDa9K547nbkqR
	SlQVWlkvvexVEABw==
To: Marc Zyngier <maz@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Sascha Bischoff
 <sascha.bischoff@arm.com>, Timothy Hayes <timothy.hayes@arm.com>, "Liam R.
 Howlett" <Liam.Howlett@oracle.com>, Mark Rutland <mark.rutland@arm.com>,
 Jiri Slaby <jirislaby@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 20/25] irqchip/gic-v5: Add GICv5 PPI support
In-Reply-To: <86a57ohjey.wl-maz@kernel.org>
References: <20250506-gicv5-host-v3-0-6edd5a92fd09@kernel.org>
 <20250506-gicv5-host-v3-20-6edd5a92fd09@kernel.org> <87zffpn5rk.ffs@tglx>
 <86a57ohjey.wl-maz@kernel.org>
Date: Wed, 07 May 2025 15:42:42 +0200
Message-ID: <87ecx0mt9p.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, May 07 2025 at 10:14, Marc Zyngier wrote:
> On Tue, 06 May 2025 16:00:31 +0100,
> Thomas Gleixner <tglx@linutronix.de> wrote:
>> 
>> How does this test distinguish between LEVEL_LOW and LEVEL_HIGH? It only
>> tests for level, no? So the test is interesting at best ...
>
> There is no distinction between HIGH and LOW, RISING and FALLING, in
> any revision of the GIC architecture.

Then pretending that there is a set_type() functionality is pretty daft
