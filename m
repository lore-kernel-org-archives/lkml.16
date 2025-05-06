Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96EF21581F0
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 07:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746517122; cv=none; b=jUeq17zJENcBsyXcAFs92vBRLmI1QwDgSi7ljofuHhwhv853oizj7TOEEEnOqWk8JyE6jvuCCI3clACSjU1hrZ8x7e9Gto4JJQOdVfE9bdyehC5Fm3iadBrKKgC9dvX8vCnxT3Zi0OP5ZvvMj5HuE7rwpoYvzX2I+kGCHsIPFpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746517122; c=relaxed/simple;
	bh=xByka5h14B+w5El6Hkj798HvQ7FrJ5sMhMRNJhB9QIA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Ee7oDGhohH3kuL/r7OAGHjuc8xsQuSYcr4P2+VI+zmaz/rt31dzhZAcgDRP5m1oU/gsTc/BWCy/P5kxVRHJFpqa3TNWGq9KqVKXnTLZNxycZ0DXyS2mHNgZnS0Vvg25fAAReEouv7tpDq17UGvzsyKVCcvXXXCgWrkoih46t5K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=qNX6OlNr; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=GcoEX0hU; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="qNX6OlNr";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="GcoEX0hU"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746517112;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=J21E+R+9FyXa98btHMk4gDTQIPeK9fAVsfswg1uIiks=;
	b=qNX6OlNrbNz/106uHkRm/Oogx7L/ATXOKXNULrHV5oMPz/EqETEhqQXik79B6uKpRxGer7
	m4uzxm2u/vU2QaScS8HXNFdOn15A29985rUYNKxJlEgIYMZ2w1+H1ulFRmwAG4w/R4TGle
	YKATZD5GaPfs4/NpeES4MdSXrjy9A07JqqRJ6XrNJ4rHONUHOpSSOpoikeV4w7+jEnAgH3
	wDyctZ2oP7z+VQkI4AWVjUjMFfSSZoanIzDawlr6ZPBGpm/TeVkNuWvcroBCq5GBHqDbDj
	xUT3egzgSGYNncpVr2GHX29FoklcLoVilQE45pXYesGjB/QFnvKiuuztHb/aQw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746517112;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=J21E+R+9FyXa98btHMk4gDTQIPeK9fAVsfswg1uIiks=;
	b=GcoEX0hUKefceGwjO8kdQn1Zo2imgLEIYogfxjmB1jVL9zrjW9awLW1u2bvujo45XQjOxB
	UceKLzvVYcKcEsCw==
To: Alexey Charkov <alchark@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Alexey Charkov <alchark@gmail.com>
Subject: Re: [PATCH 1/5] irqchip: vt8500: Split up ack/mask functions
In-Reply-To: <20250424-vt8500-intc-updates-v1-1-4ab7397155b3@gmail.com>
References: <20250424-vt8500-intc-updates-v1-0-4ab7397155b3@gmail.com>
 <20250424-vt8500-intc-updates-v1-1-4ab7397155b3@gmail.com>
Date: Tue, 06 May 2025 09:38:32 +0200
Message-ID: <87ldranq87.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Apr 24 2025 at 22:35, Alexey Charkov wrote:

Please do not make up subject prefixes. See

https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#patch-submission-notes

and please read and follow _all_ of it.

Thanks,

        tglx
