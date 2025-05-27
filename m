Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C104F19882B
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 18:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748371657; cv=none; b=LDqjhcg1Abal9l5NNxaxMifdD1PqWUYYAvAGPl20ONOoECEi0+5Fq/cZ13d3yFKhVAk07i3hoAErVquinMWQMak7IiBoYBNORFc8A1VMxLKhGXXN8F6D4sjVQH6OJ3UziItraMWaTVk/Yd+VClj7YyqsTjmk3GZiPfMV+oEFSws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748371657; c=relaxed/simple;
	bh=27XZ0ncka+9sgvsFzQFq1MSnT9vqykeLWN6NJ7tRGsw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hlrGN5p8LJ02KGfpM4S8phHciy96KkZT8CUQpFAO9K95KlfGMqbP85botnSigBIIsIsTA+SxGiSEs/LcfzbCTBVz1+rns9kA2svaa5mMMYijK3HoGdaXTY0XtM7YKeAoEFKBTMM8pWBJcXXCjOSyCIvqkAAus8sh5puraG6u4c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=UQUXr4Ov; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="UQUXr4Ov"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4b6M7m0Svdz9slq;
	Tue, 27 May 2025 20:47:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1748371652;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HylYXFVXbo+AYXT7+hRP+ilvdtV5tsWctk+rU40tcGQ=;
	b=UQUXr4Ov8/vXnNSxxGYQpXvf1wwi9oxGuwjyWPJCO9B0jlHkdFxL1hhnN4tLOCVs1612u8
	pyMNQRFhdf0/Zyapzfe8+lxDk4hIYYOHzXCrQ3MHGxDTLcS0MwATMd5MnjJX5fDT8QherE
	QiDbxTAgTQxTu2DBY/6wYslMfUdaSHnYdnX7fdM9JcqVqN6ZnwYtmw1L3AQsXbkkcbzti/
	m4Assn1ogB6I2j+GXmonR5YYLhgBM91OngDg/CvTkht0unq6MLygjGKRxh5AyVqcV8UdWd
	fOSHsoA+lsmWKdOrUMpG8BAX3zDUMgKza3j6hqyFxT1v7q6Gj1maLuC3LvdSRg==
Date: Tue, 27 May 2025 20:47:28 +0200
From: Erhard Furtner <erhard_f@mailbox.org>
To: Srikar Dronamraju <srikar@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: WARNING: CPU: 12 PID: 44394 at
 arch/powerpc/kernel/process.c:437 giveup_all+0x90/0x1d0 (v6.14.8, Talos II)
Message-ID: <20250527204728.63d538f8@yea>
In-Reply-To: <aDV8iWe2nWX9JuvV@linux.ibm.com>
References: <20250526205537.2f1bccec@yea>
	<aDV8iWe2nWX9JuvV@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 7fc04b3d1829eac27be
X-MBO-RS-META: kh18wz1on4gm1mc4dztn5zsatdbp7s7r

On Tue, 27 May 2025 14:19:13 +0530
Srikar Dronamraju <srikar@linux.ibm.com> wrote:

> > Getting these from time to time when I run the machine for longer periods building:
> > 
> > [...]
> > ------------[ cut here ]------------
> > WARNING: CPU: 12 PID: 44394 at arch/powerpc/kernel/process.c:437 giveup_all+0x90/0x1d0  
> 
> Its a warning with says that the task's userspace MSR register has
> VSX set but not the VEC or FP.
> 
> Were you building the kernel or were you building something else.
> Can you paste the command you attempted?

I was doing an 'emerge -e @world' in Gentoo Linux and probably building a kernel in another shell. Noticed it only in the logs on the next day so I can't tell exactly which command triggered the issue.

But I will pay closer attention from now on.

> If this is happening with only the recent kernel and working with a previous
> kernel, do you happen to know the previous kernel version.
> In which case, is there a possibility of doing a git bisect?

I think I have not seen this in v6.13, certainly not in v6.12.

As I get this only from time to time bisecting will be hard. For that purpose I have yet to find a way to trigger it more reliably. But I'll take your hints and try!

Regards,
Erhard
