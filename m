Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B286717BD9;
	Wed, 14 May 2025 06:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747203105; cv=none; b=BqefIFM/TbFnf/4snEObH3WN1MHNC5hnI9PuaGk43BEv0Wke5EHHjrJMeAzUpNDr8tbokBgcp9tQDN/4ONDakW5/Yepa/1TffmzEX8TbzkA/WMmbKRmxyq2Nwexu4MipasfniL0W1Xn2iWgTPKeRk+3rU7mcUqsCyECTDXaqJ2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747203105; c=relaxed/simple;
	bh=iNU6ZFsalzDyKnD1IiR2gOQH8W45WCdfKMygp0FZwTM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=odqwkwZV1y27LOF65A/5zUVB2KasnJkZXblIcEsluYQK/8/GShKqc6RKvX4b5fuMBBjlfYaeM3xONgbCrW2pE555o3Q5apmKlJliLo8RbI/7nTeySeidiWJoHamh7KHFe5D/RMaz/fOxaX+D9mTXFwwLlV24okcs6J7p8I3PPjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Lc0qU0rS; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=C2OiZVCH; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Lc0qU0rS";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="C2OiZVCH"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747203101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GrmuZxfTRtnulKtYxDhvbAWRofpg2amaJKto0xOSi+w=;
	b=Lc0qU0rSmQcbXtw4owpu6pzK25+krkMKrLZyG56MaIWscwY6bb2B3DL1D0Go5WcHfge3Eu
	lxCfp+yp+is7I1rPQ5Trvd31rARtPHZ07F59xFhHL+yj2m797Zb/mdtOcQ16X/rjYfOgQm
	gUcnyVdLyDgwu+dWmK7C75h68G2tWFYRa9beXzIksHVeBQlY3Md3CJ8pp5e/Po7FJFPuDR
	ipa7VfzEPE1bz7UQfsB4Belz/2neN9lMtO8qS5+zq0KnNBf/+vcboujXcl13uEZmv/dLuN
	FPoyPw0i1d9+kAgpqOQ5Q6JCzil0jxXT++q6lS4GDes8VGRnGHx3odqCadgtew==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747203101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GrmuZxfTRtnulKtYxDhvbAWRofpg2amaJKto0xOSi+w=;
	b=C2OiZVCHMpU2C9yqUWM5qSKvMGi0RNuyEKmGWPyIoH5DN1wK9Os+Zam2W96Ax+YZ+akqLW
	wVXux8PF6QLeJJCw==
To: Eric Biggers <ebiggers@kernel.org>, linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, linux-spdx@vger.kernel.org
Subject: Re: [PATCH] lib/crc32: add SPDX license identifier
In-Reply-To: <20250514052409.194822-1-ebiggers@kernel.org>
References: <20250514052409.194822-1-ebiggers@kernel.org>
Date: Wed, 14 May 2025 08:11:40 +0200
Message-ID: <87bjrvk9gj.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, May 13 2025 at 22:24, Eric Biggers wrote:

> From: Eric Biggers <ebiggers@google.com>
>
> lib/crc32.c and include/linux/crc32.h got missed by the bulk SPDX
> conversion because of the nonstandard explanation of the license.
> However, crc32.c clearly states that it's licensed under the GNU General
> Public License, Version 2.  And the comment in crc32.h clearly indicates
> that it's meant to have the same license as crc32.c.  Therefore, apply
> SPDX-License-Identifier: GPL-2.0-only to both files.
>
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
