Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9639230E83E
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 21:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750539722; cv=none; b=Wf8r0EAQCZGtl7BKKH892Dbe01/U6GaGZVlxv0N0+IbmCtCQ0lrhrj3NbuPJ5j9bXy9/bfwIk0hExZpvYz+FA8Nm+D8EzqymOxuNnZ1FVd5lgkMufRBiPhnlpUgFS74Po1DSRFxRXYR9Yaifgy+VCErRn5PjOA+lWxxwMfL/cSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750539722; c=relaxed/simple;
	bh=CWKocNmJtlgQBDkHUd8H3Y04xz9HO9H7TLpK3RRI7MY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ztd3MJWSkVXx6/BL2znkEwKDde/NZXbdLNO9QZqfWvtNO3vBPUcmTGHk67L5YBe+EyDs7mlYcSmKh0V54eIvagKKZ9RsMMX8O9dK2JbcZkvZIezQ1oOCf9prCGKeRLOaBUp3dsPMWMoAi5vOL3OoV1JNHAaDUmxcJsOtQXJWmYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=wIo7Usvd; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=sY9bux3M; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="wIo7Usvd";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="sY9bux3M"
Date: Sat, 21 Jun 2025 23:01:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750539718;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vYscUytm02mG7YCektXYT1S3617896cFR5+QSWvcyE4=;
	b=wIo7UsvdJcgUMRda0T4t0KB3sOCHJJ3YaDoXJu3UwVG4IkaRyY+dQpRJKgwOtE2BhkzRDz
	ogUF5BLrhXmmb6GMkom/AqZ+u1jKM5CcrN+KYRSRhpUMg4yEUNrjcAE9lxSv6uv5jBBXFw
	RhACwT9iJ2ixoOf6ps+PVDGgyomIy9D02ho9Bg0OKZeO60F4AoOw+kUASUVA+TWRA9iWxm
	mu5V2cV+ul1K+aro2s/b2MeZXktxkvaH1ZP1MCE1idNCRb1v+UM78y4fBPyWAx5XCkb48G
	eL/NDA2RHwis5RzbnQY8mXiu8Eb5nxHrvHSWLJPy0CphlpP+TE8ym18c932ckg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750539718;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vYscUytm02mG7YCektXYT1S3617896cFR5+QSWvcyE4=;
	b=sY9bux3MAQdbzLmX0ZtbCrFwBg9wCvrKLAWqX9j50szL7tUlxyDQ73FNnlHNUEaYctBbby
	3YysM86Rf3OtbXAw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Calvin Owens <calvin@wbinvd.org>
Cc: linux-kernel@vger.kernel.org, "Lai, Yi" <yi1.lai@linux.intel.com>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org
Subject: Re: [tip: locking/urgent] futex: Allow to resize the private local
 hash
Message-ID: <20250621210157.J4QMzB0C@linutronix.de>
References: <20250618160333.PdGB89yt@linutronix.de>
 <aFLuDoX9BGBUC3tW@mozart.vkv.me>
 <20250618170924.Z34OXf1E@linutronix.de>
 <aFMoDcWy-OzE3yoV@mozart.vkv.me>
 <aFNCHS-5LLywIAC7@mozart.vkv.me>
 <aFR8EuMg82aMCvjo@mozart.vkv.me>
 <20250620103110.xd5CEFDs@linutronix.de>
 <aFWuwdJUEUD8VcTJ@mozart.vkv.me>
 <aFYEpPIwhlL1WvR0@mozart.vkv.me>
 <aFZeHv72yPGovnRv@mozart.vkv.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aFZeHv72yPGovnRv@mozart.vkv.me>

On 2025-06-21 00:24:14 [-0700], Calvin Owens wrote:
> 
> I went back to the original GCC config, and set up yocto to log what it
> was doing over /dev/kmsg so maybe we can isolate the trigger.
> 
> I got a novel oops this time:

I think I got it:

Could you please try this:

diff --git a/include/linux/futex.h b/include/linux/futex.h
index 005b040c4791b..b37193653e6b5 100644
--- a/include/linux/futex.h
+++ b/include/linux/futex.h
@@ -89,6 +89,7 @@ void futex_hash_free(struct mm_struct *mm);
 static inline void futex_mm_init(struct mm_struct *mm)
 {
 	RCU_INIT_POINTER(mm->futex_phash, NULL);
+	mm->futex_phash_new = NULL;
 	mutex_init(&mm->futex_hash_lock);
 }
 

Sebastian
