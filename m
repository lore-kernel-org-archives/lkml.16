Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B371E9B0B
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 07:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745999829; cv=none; b=gA96aTej76TH73w/iMB1I3mU9gcOYZ04lzMLshwQHaB8NhSGhJ6S8bccOB8i6wotQ+T5cvBerCqzaSky0NEQxqEhzaWaRcL5PTbFVW4+Eo3+vyAYdYvyYqXO5+IeTNSFP1yh3kaAqHnF5ftlWuGj6oh7aEJxpy2mPfRo6kcT9NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745999829; c=relaxed/simple;
	bh=25yNZEN7dDtpmdjFY4m4KJFrrJUhrrx3jxXXSHZGJxU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k5pvcUG3+NS03YH4cH6TI6AhmCp5W+lIxoVyK1yf+Ek/qFgWqLIf/xyMFrRk408aA4AXOU6VSQiAuYssznfnEnJgx4xgkG40jLwh8df1w4vYAdTzqgWOHI7aHgW53p1Yfrf0KHqYlkfXeJaAdRsGeexiPGTtohzBigEBluuzmKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=aEW4C+QL; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=fVSOgbcY; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="aEW4C+QL";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="fVSOgbcY"
Date: Wed, 30 Apr 2025 09:57:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1745999826;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=toytAj/veEzmRd9jRr6xKEUHjrwAvubS2ClIjN5hiKs=;
	b=aEW4C+QL3uo/km3pzlB8vPJmANLKGQ+YtVoDtMBqsb3Q0r0Zzx7+cLwOW3kRFZYIUotj29
	6rrVv5QCL174zj7glivk4VcVQGXsUHYJ4u51dBCYt2tiP5HnZr+QYX4TUi+uXlsPo/VYiT
	Pgfuv6qWbM2loAKJ6/7zvGOy0krafwTjkHSGkeC2mp6aRzgqG8oPVeMDWEV6vp1MXLrUjs
	WjrJPR3X7fHKRB7h0E0wwjhmjG06nAUBKk2q0y6rdNuxi+FrBtuejPYJIOITfPTGt+Qi2v
	M8ev5kgBS1XStwAQoIP/stX4qIDBguscGb0Bw3XqVHMVIsX7CHgJKcosXwKZpg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1745999826;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=toytAj/veEzmRd9jRr6xKEUHjrwAvubS2ClIjN5hiKs=;
	b=fVSOgbcYSHklMfNonKJENAOqA39ELXq+KIAkzOI6Xnm4pUVizxgUk0R+UT/KFQ3pq0kuY0
	oqkJLRsZVuJ5kBBw==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Jan Stancek <jstancek@redhat.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Nam Cao <namcao@linutronix.de>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, Andy Lutomirski <luto@kernel.org>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] vdso: Reject absolute relocations during build
Message-ID: <20250430095411-349b13bf-a3c7-4968-9f97-551a1ded1696@linutronix.de>
References: <20250429-vdso-absolute-reloc-v1-0-987a0afd10b5@linutronix.de>
 <20250429-vdso-absolute-reloc-v1-2-987a0afd10b5@linutronix.de>
 <CAASaF6yGT0pDythQ9nTcn5=MHmLYD=gCNVc6dFXhWUO_iXJXqA@mail.gmail.com>
 <87selqp0j8.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87selqp0j8.ffs@tglx>

On Wed, Apr 30, 2025 at 09:32:27AM +0200, Thomas Gleixner wrote:
> On Tue, Apr 29 2025 at 17:17, Jan Stancek wrote:
> > On Tue, Apr 29, 2025 at 2:56 PM Thomas Weißschuh
> > <thomas.weissschuh@linutronix.de> wrote:
> >>
> >> +# Also validate that no absolute relocations are present in the object files themselves.
> >>  quiet_cmd_vdso_check = VDSOCHK $@
> >>        cmd_vdso_check = if $(READELF) -rW $@ | grep -v _NONE | grep -q " R_\w*_"; \
> >>                        then (echo >&2 "$@: dynamic relocations are not supported"; \
> >> +                            rm -f $@; /bin/false); fi && \
> >> +                      if $(READELF) -rW $(filter %.o, $(real-prereqs)) | grep -q " R_\w*_ABS"; \
> >> +                      then (echo >&2 "$@: absolute relocations are not supported"; \
> >>                              rm -f $@; /bin/false); fi
> >
> > Should this check only some sections? I'm getting lot of matches on
> > debuginfo related sections:
> 
> Hmm. All architecture VDSO Makefiles have -fPIC in CFLAGS except for
> arm64, which only adds it in arm64/kernel/vdso32/Makefile but not in
> arm64/kernel/vdso/Makefile. Confused.

Unfortunately -fPIC does not help. It generates code that is sufficiently
position independent for regular DSOs, but not the vDSO.

See also https://gcc.gnu.org/bugzilla/show_bug.cgi?id=120002#c5
