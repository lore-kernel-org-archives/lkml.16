Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD49D2222A2
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745907768; cv=none; b=THcxiOL7VRlfhrOVcO4fbq8YdXcRqqdKjCpLJQ2uEJ58FehzNd6wu66ILIf0eCbqERI+nWanT3qawRVIc84SKiKJ7f6E8sWS/zjCZMYJ/FnDUIoRxrrBl+RiMtzOPuFCXIrQjjrzMbh+VPQIDZ8xisAFncaTTdzuZ4uxNQ9/scY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745907768; c=relaxed/simple;
	bh=6kxxaR5LyDqrY0I0o5nuULRtHnYnVROSEl6iiVmCESc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=NcNrXtJhxcllAf1VqWj/Nr+Kg2FBtiTKdnUw1DESdup4Nwb9Cjjr/ZQv/sYGyu07UD2KlrPY0v54cvulC9zMSfqV9KdINxCvDzVn8Kfk3alIVw4BYSeADtzcfuHM6+pOHhxxBrlYmCYBXHwdSpCZw/iadhJdohSDHWf+wxGEnGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=hfCoNAtX; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=QUebiwN6; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="hfCoNAtX";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="QUebiwN6"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1745907764;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PfLmHnwY8ZXEOsYbbVJ97ixKv/+/pNFlWhDjGPZV0X0=;
	b=hfCoNAtXzAVfQidb26BP0lKQSh2195S7soqRj6KUUzf9DiZNJjsQI5GsDdC0iaQz7WVqrX
	GWX4zEc9F9sfXx+O9mBmWDLMVMe1FdYlYUhyFoiQExlc8uoFdhqk7HX52MXR7gW+LpDffQ
	ZyHhinw7Go1rN6dpWvd42wvuYMJUbKTKtXY8FFXFgqfMAUhye9oShUJxpIahq5nyZM3Khg
	l4g1okocmC2G1T4pwt53bgmiAOZTQn/pXawLGQduh1ld682nqJftGLk7Lrqd7lGp2ky6uh
	Rti1DRK4H7cAzNNry5vvONaclcPdjuX8+h4KPr2ohMI9qf+cAiU2NPI5hC3nEw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1745907764;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PfLmHnwY8ZXEOsYbbVJ97ixKv/+/pNFlWhDjGPZV0X0=;
	b=QUebiwN640dbdSwxBbXtKNIRo5ReVVztAjTPJCU7kxyTPXe2EAucUCM2oaHaxJtmI1m7Oy
	wGcTWG70DVjZZWDg==
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui
 <kernel@xen0n.name>, Peter Zijlstra <peterz@infradead.org>, Andy
 Lutomirski <luto@kernel.org>, Alexandre Ghiti <alexghiti@rivosinc.com>,
 Arnd Bergmann <arnd@arndb.de>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev
Subject: Re: [PATCH v6 0/4] entry: Move ret_from_fork() to C and inline
 syscall_exit_to_user_mode()
In-Reply-To: <aA_5IGGvXqB7v_EA@ghost>
References: <20250320-riscv_optimize_entry-v6-0-63e187e26041@rivosinc.com>
 <87frj613kz.ffs@tglx> <aA_5IGGvXqB7v_EA@ghost>
Date: Tue, 29 Apr 2025 08:22:44 +0200
Message-ID: <87a57zqyff.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Apr 28 2025 at 14:54, Charlie Jenkins wrote:
> On Fri, Mar 21, 2025 at 10:22:36PM +0100, Thomas Gleixner wrote:
>> 
>> This looks sane now. I've bookmarked it as post-merge window material.
>
> Has this been applied somewhere?

Thanks for the nudge. It indeed fell through the cracks. Tending to it
now.

Thanks,

        tglx
