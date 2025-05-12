Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90603297119
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 18:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747075578; cv=none; b=cNUvs2OK/1yZwy7KzKR4+dHnNP4W9FaX9NTpDZOkzbww4P1Hy9OZPK1obelgojLyiJ/kyRD8GNF6oLDwPI0zE+XnMfAyXgILxWm/8dtGACcmDe2U8+UJsU8hPb81OWxvc+t5ACD+XazGpE6EoEweQAigqJIGW+reJxzuH+Q/ybA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747075578; c=relaxed/simple;
	bh=2WtX/JASXsoHtVy54B6OW2IXDBzRlFLPbYQ1/IE9l30=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=EIWlCVx2l2y6izaExlptVWDwFW8y2bFKEXqX10YOIisH9/HtAJGAyWOQ/Kf42zudqD53ZNzA/uecDVO+sW9cB0aEw0w9JmncX29Q8japBNpumYon2KkApk8hRpuUiK/Jo7zh+TfnaxL2ElC1P0R7n2IxM7OAkgl9mhSf0kiGfc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=QUDY2qiw; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=RjAUd/0k; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="QUDY2qiw";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="RjAUd/0k"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747075573;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QgkKtt2m6ip+njKFIPiUxvZoJwWMNpWdYXXziFn05AI=;
	b=QUDY2qiwkUtrnJxlrwX4pVuiinaAK+xnqMbHi6lmpC+oONYxc1MD0HbYqP1Fjc7X98claX
	GuYZ13eZOfbVwj1xKdj6TE65CJbXHDvxkkIJBUUO2jS1LhBRPjNhBlZDSMH0wdc0HY4nXA
	OZU8OXY1xq8GMrJ5Q51dPqT2aJ3h0ohpViTUFN2KJLnFEOX/6bpcUK8ZSd7/C4to2o5+dS
	WvTHNFZo+dJn1kehrulmR//ZFSVgetiHRjI5kdUGhRtlJoG4wGOX9NTU5KiQ0RiSjAqi+d
	vntc6qBIRx3DKXMq51TqTLBTxqeqZi0/s1lGRrHJOvQMDfBAgKyUDj54MuLB+A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747075573;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QgkKtt2m6ip+njKFIPiUxvZoJwWMNpWdYXXziFn05AI=;
	b=RjAUd/0kxFpNMmmZYd8Bkma4W7377Bwy2qQJoqSPucE0GOyhVdcSSD2RTVIj5Rh984EQCx
	F2AFyDvEZhJCvkBA==
To: Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Sascha Bischoff
 <sascha.bischoff@arm.com>, Timothy Hayes <timothy.hayes@arm.com>
Subject: Re: [PATCH 1/4] genirq/msi: Add .msi_teardown() callback as the
 reverse of .msi_prepare()
In-Reply-To: <86tt5pg6ur.wl-maz@kernel.org>
References: <20250511163520.1307654-1-maz@kernel.org>
 <20250511163520.1307654-2-maz@kernel.org> <87h61plx64.ffs@tglx>
 <86tt5pg6ur.wl-maz@kernel.org>
Date: Mon, 12 May 2025 20:46:12 +0200
Message-ID: <878qn1llaj.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, May 12 2025 at 16:57, Marc Zyngier wrote:
> On Mon, 12 May 2025 15:29:39 +0100,
> Thomas Gleixner <tglx@linutronix.de> wrote:
>> > +static void msi_domain_ops_teardown(struct irq_domain *domain,
>> > +				    msi_alloc_info_t *arg)
>> 
>> No line break required.
>
> You mean...
>
>> 
>> > +{
>> > +}
>> > +
>> >  static void msi_domain_ops_set_desc(msi_alloc_info_t *arg,
>> >  				    struct msi_desc *desc)
>
> ... not like this?

Right. That was written before we went to 100 characters line length.

