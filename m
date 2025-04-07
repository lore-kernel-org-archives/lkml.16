Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2FC20E6F0
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 16:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744042561; cv=none; b=VG2HFkTJDP9xsUHazgSQn26nWJycAP6pPiDYMpwp3RtSNaOvk6QXOwAIj8GGZvGeFYnCvjZBN8FU67h+h2ct2a6cQ+2i71A0NbnPDiqoseOdPLQ7rA5wXpiwPOfObWJLas58tITO3IcCU1LZCHHN3n+wqF/LJt/3zasAYE+/FIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744042561; c=relaxed/simple;
	bh=91gvHqHPOc53Dp2GfJTatN6rIy4QHEKxxdSxnbSlPIE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tvFvp/tc9o6a37tngPNtR2BBqgZLDN5tJO1IkTY/6OryhdW4aXvin7C9qKREW4y1YpklX3bIRHEomjMYFjvHM0cFXe0hK3roig0/0eCN4yIvxpUNR5PI08pMloxHMPoCi6+PXvrg5TFlimNcYqWN2EWj+5Vynw7+Gp+SUshOSb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=NSRN+E5g; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=PBoLOEMW; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="NSRN+E5g";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="PBoLOEMW"
Date: Mon, 7 Apr 2025 18:15:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744042558;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Fz7uJL1ohohlWM7+X3g8H30ATSD/74W4U5rDjq4waLI=;
	b=NSRN+E5g5+jwx+N5XY/zz12Om/VKVUF3edsDzQtWC5giwU4RB4iXkPVDUty/FWN3c4FBX/
	fJLlfS1l/YN8hLq3orF4UfWRBEmK5UAY9Q5JrMXnMBW0AOeG9zhBAQstCPciFRSylugqCK
	TD7axi3dxCJXCph01xjwJk8IJ4XAVl6ban+oiRpDChFbu48bnR5A2sU5+bSoglyqzz/+re
	tAAUYR68o6HezHy96ENY4ZYYsY+btuRaOWWVFNsjAk+GmExdy0E+V1CNs0J8JxAvJ0L0CD
	3SnTViVsySaiwrk4JmpP2yst/Dfb+uUE5EGNSdquQNOhbOwRdoxkKnTSSRhwvg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744042558;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Fz7uJL1ohohlWM7+X3g8H30ATSD/74W4U5rDjq4waLI=;
	b=PBoLOEMW7TSEcMsEVK0hPwQWx9mMg8WNlxzo5dODVL0dOU2vApr4dYrsJ4uqOAwxv+HOPA
	Mw0Bt32k/JO4gEAw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Waiman Long <longman@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 00/21] futex: Add support task local hash maps,
 FUTEX2_NUMA and FUTEX2_MPOL
Message-ID: <20250407161557.bYYnmJSr@linutronix.de>
References: <20250312151634.2183278-1-bigeasy@linutronix.de>
 <0713a015-b8dc-49db-a329-30891a10378c@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <0713a015-b8dc-49db-a329-30891a10378c@linux.ibm.com>

On 2025-03-18 18:54:22 [+0530], Shrikanth Hegde wrote:
> I ran "perf bench futex all" as is. No change has been made to perf.
=E2=80=A6

I just posted v11
	https://lore.kernel.org/all/20250407155742.968816-1-bigeasy@linutronix.de/

this series extends "perf bench futex" with
- -b switch to specify number of buckets to use. Default is auto-scale,
  0 is global hash, everything is the number of buckets.
- The used buckets are displayed after the run
- -I switches freezes the used buckets so the get/ put can be avoided.
  This brings the invocations/sec back to where it was.

If you use the "all" instead of "hash" then the arguments are skipped.

I did not wire up the MPOL part. IMHO in order to make sense, the memory
allocation should based on the NUMA node and then the OP itself could be
based on the NUMA node.

Sebastian
