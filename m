Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2DE92116FB;
	Wed,  9 Apr 2025 20:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744230356; cv=none; b=hPK6ASeX4oKCPgvbP7XKsl5iKLxNUNUp/JMJZZToAfHqMnJRRyA/w4LhLEG/tAd6nzYXrTsLOFxIPyZZ3sNM9ikhiFksyB6wxMskWoNhUykt37HxeYXMBw/iaxhU9D6uW95Sa6zspdGjMvRfyXHorU0wijLrEkZmmCmemFip+po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744230356; c=relaxed/simple;
	bh=TBcrm+nnno6fSkJwnAU4+w+ZXLzvOFMD0XXZV7NIdB0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=RtDko/V7pLadlvWyrHpxoamLlVUHdtZo4FWhv8OsApPLaMABOJ952DFP97x5oHIl0HH4396Vr5ZGP+MGS8F0OeayH8Ak/H2WoY4lKeul4HUQirq5GJEbm02U8kgk1x1Hql9rFjDfvcR6wyTo8pil7fO4VkbpDtMb+skcFA5NTS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=NxGI2Hei; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=f55uKGnw; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="NxGI2Hei";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="f55uKGnw"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744230352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jX7UwbTFq4MDr+4yUCjoMR+NhYvyl7m3Cb4/7T+oT5Y=;
	b=NxGI2HeijQ6yixBjNQIswa8i+haKPv9Pb6KANvfV7JwmmvvVCOPj4FnvJzfDM+kpKfVzJg
	p83NlBtDa8kItJzxrCtKXnHNPYC6K2W41p9tnO7C71O4U6rCE3pfKcqJtUgnUWXfeXakU3
	NwEWU+5fR0Yq2HpOzXQ4D6c/qzM4/UYHVoilB+/yLIduwk7niQeE8DgmhcM9fClX6MplZ1
	W6X/rq+7aEfO3WwsTBXdI3AlVVzCPCcs3RwVSGkJkEIAH3A5q3xwfpHrTiF2W5oRQuDkpr
	M8+JlWeWHQm0oaA0tJXMVzB823tLU0Pfoq2/5Le6nkzKGIG7ZSB1IrTtysQgwA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744230352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jX7UwbTFq4MDr+4yUCjoMR+NhYvyl7m3Cb4/7T+oT5Y=;
	b=f55uKGnwXOWUYbDpIFrKzPoAcWRzIJiCfqLRi3MHwbN3yQAsNJ0bpvO5UOdvHuVBx6aI7H
	FoBVpDpM6dPodlBg==
To: "Bird, Tim" <Tim.Bird@sony.com>, Gon Solo <gonsolo@gmail.com>, Duje
 =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ricardo Ribalda
 <ribalda@chromium.org>, "linux-spdx@vger.kernel.org"
 <linux-spdx@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: spdxcheck: python git module considered harmful (was RE:
 [PATCH] scripts/spdxcheck: Limit the scope of git.Repo)
In-Reply-To: <MW5PR13MB5632440E0CA2EABD11B79F3CFDB42@MW5PR13MB5632.namprd13.prod.outlook.com>
References: <20250225-spx-v1-1-e935b27eb80d@chromium.org>
 <12647854.O9o76ZdvQC@radijator> <Z_Tgp8L_8goc63K1@pampelmuse>
 <Z_TtXaRnaU1zXbXv@pampelmuse> <Z_T8OiLQzKDGhOJs@pampelmuse>
 <MW5PR13MB5632E13F8F5B0B2B6DE3D16CFDB52@MW5PR13MB5632.namprd13.prod.outlook.com>
 <871pu2usq7.ffs@tglx>
 <MW5PR13MB5632440E0CA2EABD11B79F3CFDB42@MW5PR13MB5632.namprd13.prod.outlook.com>
Date: Wed, 09 Apr 2025 22:25:51 +0200
Message-ID: <87h62xt73k.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Tim!

On Wed, Apr 09 2025 at 17:44, Tim Bird wrote:
>> From: Thomas Gleixner <tglx@linutronix.de>
>> On Tue, Apr 08 2025 at 17:34, Tim Bird wrote:
>> And yes, it ignores not yet tracked files, but if you want to check
>> them, then it's easy enough to commit them temporarily or provide a
>> dedicated file target to the tools, which ignores git.
>
> OK.  Yes. That's an easy workaround.

Actually spdxcheck supports that already:

   scripts/spdxcheck.py path/to/file

>> Good luck for coming up with a clever and clean solution for that!
>
> I thought about various solutions for this, but each one I came up
> with had other drawbacks.  If it was just a matter of separating 
> *.[chS] files from ELF object files, that would be easy to deal with.
> But we put SPDX headers on all kinds of files, and there are lots
> of other types of files generated during a build that are not just
> ELF objects.  And build rules change over time.  So even if I made
> a comprehensive system today to catch build-generated outliers,
> the solution would probably need constant updating and tweaking, which
> IMHO makes it a no-go.

I'm glad that I'm not the only one who came to this conclusion :)

>> Just for the record: I rather wish that people would contribute to
>> eliminate the remaining 17% (15397 files) which do not have SPDX
>> identifiers than complaining about the trivial to solve short-comings of
>> the tool, which was written to help this effort and to make sure that it
>> does not degrade.
>
> I agree with this.  Analyzing where the headers are missing is interesting.
> But it's more important to just fix the missing ones.
> I'll spend more of my time working on missing headers,
> rather than on tools to analyze and report them.

Very appreciated.

Thanks,

        tglx
