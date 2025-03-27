Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8EC242069
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 07:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743061398; cv=none; b=q/rGsjENve6o+sk5uzz9ABRHKUcausOKondkIbdRGw5YTsHAl94JY7axdec3XRZ91coBoq5FHm/aHNbPauGIpc4nLC8v2rWwx1eXjiGOOjRzSPWOkzwFV3tQ0rooellI6Pz+OOweerKPs5+mfUtfjN+vTw03JKRN3Mgs3IIi/1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743061398; c=relaxed/simple;
	bh=1T2IztYjpYMrnXiEDA0e2WWRCyGEj74rYCuxS1PYVuE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Dm9lr6gIkbYxt8ybGTI+I0po2YRoi2Rl1ZpOXHJ14NcelSmEcysTF9eI6ECgDPyMd3zFDS+FY4EuoZh8lIY6W07g4f47EnrWYuGfZiEsAHTmk3MjR0XlQj9OPD1OUtXJ2zfxuIlX4ChWkQ3gAKhv8/61/CWuAiUG5X1Um7RhMO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=lC+VDVIr; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=4A7q9m06; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="lC+VDVIr";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="4A7q9m06"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1743061393;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Yn42TF6bA4wOWEO008n291dLu9P1VXMHAyzVL6HRZK8=;
	b=lC+VDVIrpS8LCOtGMk+6dh1IiVr3xsp0RfTpeDEwSFt5LKezslsoX+nvhEXoExWyUsAzaN
	gcVv2l58vTIOcqn+NxBTegDDrNTXQ6buBp9TP453cS/F/LOLV/IzUpl3uH+fl4NARaI5sD
	xLeAn0Fde0YIBCrPIJekcxtZ90MaUfzceG9F/IEZSEHROiaP18JjnNro7na2RM0GfwTsIN
	gUwj3uH1C7D5PzLV9n2wkB6ujmPKWCoQsnHLy/tXX6AkKDhW9awV8TC9jcZrFDbNzcQSFg
	W6lR2eQD/Kb48Cr5FU7K9edIvEJc10zE/egmlidcYPrbbOU+60gzgiMRJtsmgw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1743061393;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Yn42TF6bA4wOWEO008n291dLu9P1VXMHAyzVL6HRZK8=;
	b=4A7q9m06PDOswOkWDyx1B9uRGp8c1TIdCLlHPyAdVne5P9q6d6uKLkREON5CEVoDCMx5Ns
	qFLuQP1nirR+WBCw==
To: Sasha Levin <sashal@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, x86@kernel.org
Subject: Re: [GIT pull] irq/urgent for v6.15-rc1
In-Reply-To: <Z-Sk41xJ-JIkoZt8@lappy>
References: <174301605628.1660948.615494869949872320.tglx@xen13.tec.linutronix.de>
 <Z-Sk41xJ-JIkoZt8@lappy>
Date: Thu, 27 Mar 2025 08:43:13 +0100
Message-ID: <87a596zzou.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Sasha!

On Wed, Mar 26 2025 at 21:07, Sasha Levin wrote:
> On Wed, Mar 26, 2025 at 08:08:16PM +0100, Thomas Gleixner wrote:
>>Thomas Gleixner (1):
>>      PCI/MSI: Handle the NOMASK flag correctly for all PCI/MSI backends
>
> I haven't bisected this, but I suspect that this commit is causing
> boot-time panics that are observed on LKFT. Note the line numbers are
> off by a bit.

I'm not sure which commit you are referring to, but the one which causes
this type of failure is:

  c3164d2e0d18 ("PCI/MSI: Convert pci_msi_ignore_mask to per MSI domain flag")

which is fixed by

  3ece3e8e5976 ("PCI/MSI: Handle the NOMASK flag correctly for all PCI/MSI backends")

i.e. this pull request.

> Full logs of the run are available at:
> https://qa-reports.linaro.org/lkft/sashal-linus-next/build/v6.13-rc7-16083-gc13edfd29c29/testrun/27775255/suite/log-parser-test/test/bug-bug-kernel-null-pointer-dereference-address/details/

TBH, and I know this is not your fault, this report page is a
masterpiece of bad engineering. It contains tons of useless information,
but fails to provide the most important basic data:

  1) There is no date of the failure

     Am I supposed to reverse engineer this out of this horrible user
     interface?

     I haven't even found a way to figure it out within a reasonable
     time. I just gave up.

  2) There is no useful reference to the actually used source tree and
     commit

     v6.13-rc7-16083-gc13edfd29c29 is _NOT_ a helpful reference as it
     suggests that this is a 6.13-rc7 based tree, but the log file says:
     Linux version 6.14.0

     sasha-linus-next at least gives a hint where to rumage, and 100
     clicks later I'm able to see what this is actually testing.

Seriously?

Thanks,

        tglx

