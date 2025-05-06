Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5B524A04F
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 08:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746521408; cv=none; b=CExN9/tR6Cew7zYz4f3+zgOtT0SekvOBnAIwlWrLitwK0+ItOP8v4ZrnNDxlgyX6e/vezef/iXV4XaWgHsDvsRKGcxAzjCiwxFE8P0gKTXkcp5efGepc1QBCdS/gva+ysTlw2NGtel8U2YRpHhTJOZdAp8ICtqEiPOBUBDIpVhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746521408; c=relaxed/simple;
	bh=62tgzI+V+izexYGzHdOBEqRAAShO9hKkzpQS6v6zIR8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q1JQHiXjTLsc6XOZ5r92g03xPCgD6xjEOYpHgYh355zxmc06nnTw1tBBgn1j9/KugiSTVRhHO88/fJUfgqqfIbmMSGVP/WG3GVvnPi9qyea3YR7pe/rTgD2PKQ7QOshUupGQhHkWWz9DZl0LzzFyyGGQsZYIWBtSxKuiGrvajnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=MPCeexLh; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=6LwVSFdu; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="MPCeexLh";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="6LwVSFdu"
Date: Tue, 6 May 2025 10:50:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746521405;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=62tgzI+V+izexYGzHdOBEqRAAShO9hKkzpQS6v6zIR8=;
	b=MPCeexLhJWkMmPRI/2FW7QSp9Xy4r7MSINEBZDZ+mt5xmqk9yuX8XEsiJciA7dWJk8WSpe
	mHomaL7/a5atR+A6qX3Oh5wF2sswU056N7X/CGucXWncOyqhmS5CZgyG8tNoWjjNy2wy1D
	VEikomh9keeT42o5UUl4+IyBPyTB1ksInZ0ky1UahclDgJaljZrbQCl/RzIARw7p24HIDW
	SL8KCpm2aZwFFXUoKSjvVzJL7IGYgj2xDqSpHPm8Enm2Ic+0n2Fn2SHKCp69ahTiEexbrQ
	YSEeESVqZzxgfoO23qShecDl7Ojr2qdBQbfyp4vK15uYNzbGYlaQOyx64Xd6uQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746521405;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=62tgzI+V+izexYGzHdOBEqRAAShO9hKkzpQS6v6zIR8=;
	b=6LwVSFduYaAkkrb/Y5bF/DaLo+k8M+TT6euJYC4jIxDFgqK/mpWXGnQKVIwm1nGdlpImwb
	VZbiO29cZaz+woDQ==
From: "Ahmed S. Darwish" <darwi@linutronix.de>
To: Ingo Molnar <mingo@kernel.org>
Cc: Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	John Ogness <john.ogness@linutronix.de>, x86@kernel.org,
	x86-cpuid@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 19/26] x86/cacheinfo: Use scanned CPUID(0x4)
Message-ID: <aBnNPEQvAQ6FhcKE@lx-t490>
References: <20250506050437.10264-1-darwi@linutronix.de>
 <20250506050437.10264-20-darwi@linutronix.de>
 <aBnEBbDATdE2LTGU@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBnEBbDATdE2LTGU@gmail.com>

On Tue, 06 May 2025, Ingo Molnar wrote:
>
> Could you please split this patch into two parts, first one does the
> mechanical propagation of the cpuinfo_x86 pointer down the function,
> the second one does functional changes?
>

Makes sense, will do.

Thanks,
Ahmed
