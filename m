Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54177266B7D
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 08:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744102222; cv=none; b=p0QY0AU7K4QLzLpD5etsGUG4k3cV2OMkgt2bpWNqJUCOms16/Ic9KW/6DcUuYFy0zaNp0WWecgcPuXRaJ+XowlEvd98heB05w3uIM7LJfLBKKow8oRiymbTGBRTPEu+7PvyAuIoYCxUt1/behyhWD+1Ad0GYm3UY7rkGkbFeTdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744102222; c=relaxed/simple;
	bh=avMgGn/pTtLZSeKCpT9hwW1a88xyLVkaNFl7XK+czUU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Qj6D4orWCw1Bri9LP2L56GMIWkcCkSnyaeq3pJaEEBENwVkzRGZQAUagN11n2EXYtcOgKu0FZDMzamwIcvKpld9VqNHQY2qXnnU0V32wUjepIKaxr9fdDToAXS/r0n911k7dEShFnBacyEpQCpyr7Fvz3eNMbiopwNWh+KTqG3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=pyqc33Xq; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=G9/sCveF; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="pyqc33Xq";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="G9/sCveF"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744102219;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bZp+OhNejyHCuQQhwGdTjasqlIyuaV/QUDiCGaSjs6c=;
	b=pyqc33XqsbED9qj5v/g0msXVsu3bWKlBoEzoMQvtrl1883WlcZ3/z/QlcmSyV/s5Tp9oDX
	0Ao86Bkyq+bT87rvBew1D8o+4LzTXmTjF92JQbSMuxgNAkPlnI/dXQXMJiGIs/WQULj2s+
	eeHqTXMkmNk+X4aM2oTO0dL8MZRyCemn8FyNat7X6twgRFfceU1m1lk514L4N3uov7m+6j
	2MDVt5CU6ZFfndTwKcEQob4IgVGb7L/r3d/cUxVFe+RRwmA8zLf4IUu6qvRpyHL+Yl5YAd
	XJnguLivkpVv0B0KohEwwlAIX4xfX7JXYOZwqSnfGIPmNvGQVrtU8lsELNbi7w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744102219;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bZp+OhNejyHCuQQhwGdTjasqlIyuaV/QUDiCGaSjs6c=;
	b=G9/sCveFzHvpWwQqinX04+1f90tewMq4wFDoN+JZRjLmd/aqaYeCbvWiOt+lGUv7jSt59r
	5eYr0JaehdydHtCQ==
To: Petr =?utf-8?Q?Van=C4=9Bk?= <arkamar@atlas.cz>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [tip: x86/urgent] x86/acpi: Don't limit CPUs to 1 for Xen PV
 guests due to disabled ACPI
In-Reply-To: <20254861939-Z_S_-ybv1at7EdUO-arkamar@atlas.cz>
References: <20250407132445.6732-2-arkamar@atlas.cz>
 <174403706955.31282.7031075757256146451.tip-bot2@tip-bot2>
 <20254861939-Z_S_-ybv1at7EdUO-arkamar@atlas.cz>
Date: Tue, 08 Apr 2025 10:50:18 +0200
Message-ID: <87o6x7ujed.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 08 2025 at 08:19, Petr Van=C4=9Bk wrote:
> On Mon, Apr 07, 2025 at 02:44:29PM -0000, tip-bot2 for Petr Van=C4=9Bk wr=
ote:
>> The following commit has been merged into the x86/urgent branch of tip:
>>=20
>> Commit-ID:     8b37357a78d7fa13d88ea822b35b40137da1c85e
>> Gitweb:        https://git.kernel.org/tip/8b37357a78d7fa13d88ea822b35b40=
137da1c85e
>> Author:        Petr Van=C4=9Bk <arkamar@atlas.cz>
>> AuthorDate:    Mon, 07 Apr 2025 15:24:27 +02:00
>> Committer:     Thomas Gleixner <tglx@linutronix.de>
>> CommitterDate: Mon, 07 Apr 2025 16:35:21 +02:00
>>=20
>> x86/acpi: Don't limit CPUs to 1 for Xen PV guests due to disabled ACPI
>
> Thank you for accepting the patch.
>
> Out of curiosity, why did you remove the Cc: stable@vger.kernel.org
> trailer? I thought it should be backported as it is a regression.

Accidentally. Ooops.

The stable bot should pick it up nevertheless because of the Fixes tag
once it hit Linus tree. If it does not after a week or so, please send a
backport request to the stable folks.

Thanks,

        tglx
