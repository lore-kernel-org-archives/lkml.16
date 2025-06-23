Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD7019CCEC
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 09:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750670917; cv=none; b=FkTK94qeryWPdAgZbVAJvp6IxShJwLwoLocYsmP6KpKF4N1jQjul2wzajBwnd/h6/v+We/zUFAlM0WirQW7SSOdWe0hIDKE0TE78CCCVa0a62d6K7ZaaXqj0rMgsApsADpXdBhFi6YMVjf8KYlKszSPtFnJgPrR+j51ryRIM19M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750670917; c=relaxed/simple;
	bh=oTTb1P3+SbaWFugd7Kj7cJ4THFSP1C9qjAukg/YaqwU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sbWwA3n1CIA1Aeb5QeD7u1xK8YO9QyRKaHOORox5NyUdMM2nA3qJDQ/5pRp1SC5zj1wucFG6HeeLtio6Zbjf81YunUglGa05MmxET0VEzgvXmm3JfY2tpWmAH3bMXeldP2f7iXF+XrC7OSPTaAmGQVhusdHLeAL5AF+YgVbXA0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=dOJW9RNY; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ImYI6ydk; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="dOJW9RNY";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ImYI6ydk"
Date: Mon, 23 Jun 2025 11:28:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750670913;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=Xhhp2tP3LkJhQSrcaszxj6Ld96KgaNYUUFlD/62Ak+A=;
	b=dOJW9RNYEURdL7c8dcdx6CmsHu7k/a2yMLaLRVvIP/2jEPLrd+tbNfuXjedfDUC0paEAql
	F8g96ZrF5+NEwQyPXJQ24GhIc1zMoE/q6WG+fFYPydBrUeS0gudk4LKg1sWkkbNoMKD5UC
	q/k96pGQO8ysFAM/ubBU8Bq8K3epgMFGuYXmdqHxacFHWsRY2fBJe7KudMTM9MCJlx15X6
	vAu3Y2RkkSrjsFUEiqMaTlKLJhD6Q4zAOXCoq/DapBNwuNdodrQlpJwqj6McYl3wuedZmZ
	o4Aa92+Uo7IgBvXAh4LrVAHM7B7L7MnhSR+6ZQlqqeJJNhKIZelGPSqLanxh8g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750670913;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=Xhhp2tP3LkJhQSrcaszxj6Ld96KgaNYUUFlD/62Ak+A=;
	b=ImYI6ydklqpx6prnzeqgUzQJVfi2Kbe3chmjPz+wypvvO7TT46Dn3GzMwkbbZjITO1tY9k
	XDVz8+wb4YurQcDQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: linux-kernel@vger.kernel.org
Cc: Boqun Feng <boqun.feng@gmail.com>, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Waiman Long <longman@redhat.com>, Will Deacon <will@kernel.org>
Subject: Improving mutex_init() optimisation for !lockdep
Message-ID: <20250623092832.nmgJY7V5@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi,

while looking at the assembly of something else I stumbled upon
code that originated from mutex_int() on a !LOCKDEP kernel.
We have this macro:

| #define mutex_init(mutex)                                               \
| do {                                                                    \
|         static struct lock_class_key __key;                             \
|                                                                         \
|         __mutex_init((mutex), #mutex, &__key);                          \
| } while (0)

and the compiler computed an offset for __key and an offset and storage
for #mutex. These two arguments aren't used by __mutex_init() but the
compiler can't know that.
If I remove these two arguments on a x86-64 defconfig, I see:

|    text     data     bss      dec     hex filename
| 29753523 8033942 1306232 39093697 25485c1 vmlinux.before
| 29748880 8021654 1306168 39076702 254435e vmlinux.after
|     4643   12288      64    16995  0x4263 diff in bytes

That is 4KiB in text and 12KiB in data. I don't know why we lost 64
bytes in BSS.

Any objections in redoing this to save some bytes?

Sebastian
