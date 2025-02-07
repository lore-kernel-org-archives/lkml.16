Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B631D6DB5
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 09:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738919158; cv=none; b=gFUk9RqDlenYyFjoViAodRBAYs+Yevj5Y3cnKj9VWTxfWh4+uRhIux+iZmLnZ7uHn5rYop50g1/hAQQcrX0HkOd1DBk1bD1T2Xxcw5DTLyiVfRA6ReN8jPjFJQmKywXR+GyhQBNoHoOpY7IRe89TqnJdpvjz9GHU+b8tCHQQNek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738919158; c=relaxed/simple;
	bh=Bf7NP5KLXoTsPBgeqjhyz/LCPYCYkQlCpcUXIngCj4c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D36Lkcc5KALSBj2m38jYkiR7FpNbcKmsTprLX87HxJwr8XKLo+bh8Cdg5wZSoyLpVZrOzXLiwmGb3VOy0AYwtaAy9LjNmYHmPb8dfo1bxuUF2BBUlRY+npVCr8V9rH66YxcXOrQse2IohDr0rii1Jof05x9Yxd5UWvfbnuVuE0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Nfpnpu/8; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Nfpnpu/8"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-436345cc17bso12854025e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 01:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738919155; x=1739523955; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iq7b25tIL8xaIsUgtb5pGAAYzp+vmpGNFUg3aI9reGw=;
        b=Nfpnpu/8oAaktmOxP/Y6x3yEXoj293fSc7T3RSAl0/TvLqjs4CqOWGAPRztA6FQ4JD
         4FuB+RLraT3UcYAsctr8D48A58XUJ91rkfQOOuf7QydDC3DofRkwryEEvToTT+xTLrJM
         7GbLBbK52DPs5v8ItSa7+9VAQZ9nAkqouDAenlmqW2BJeY0CqHuVEuOCVP6afqWncDWn
         wVipWwyIsxMCvjsm15cvX6a1C07PnoA22f+T/Hl/IFby3k3dNiF3c2LitN+EboAvOxmu
         IeAV54evbqHoX21pTAKCOMI9/+SNo00GYLXgJz30f9X8UGqBymSWoVa1Owa24YEjT5nr
         QKew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738919155; x=1739523955;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Iq7b25tIL8xaIsUgtb5pGAAYzp+vmpGNFUg3aI9reGw=;
        b=IPQxPGpFC17kja5S4Gz/jch8NRwJQjh7kno/wvjhq3xdFsHM6Zju0cn2O4Uf7EKEF1
         I9OYA0b34LBmr64CZW9M4j71SgfbjdIKWh8fjF18s4zwt7zyLlAA0x4qKFdUWmgzDrQJ
         fdeoKZq4O8Ll/fNn35nA6LhuX9GYsQydndUWlhe56XiltaMUSe+ejnDvCpBX2C7zTEoI
         k18ZepkefJmykzGFes3uSGp7vARCCb9KXsHnxfXPTFSU8drGM5ExricKoLYbeS8zkApK
         lKpjgaZE5qtN2Shois1hOoskZEhb0bXz9/TugwI7ZbCZd4XKj1frzJsyYVBYtsNBSdiA
         SUlg==
X-Forwarded-Encrypted: i=1; AJvYcCWeNOS56JoqxHf2Vz2nhfwG1G7vAyi4ml8M1YQe9OOJOX0P+4gUzI1LIUnDU2mnMoLljquiy0BCKRTvwkw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJYEJa4ACLHzjjiXunm4Cx7213w6j5CnwYRUof3Ib70WOrDEgx
	s3qJxeTLOoEl2gMLoZDcbA/Srbg/D2Dw1zklL9mymSYm01UpXjKFVLtsx7Pbug==
X-Gm-Gg: ASbGnct2kBoyvt9kJdOoRRRAbXI5PrP6C9NoqAfAb6BRaoRprq3uwQNK8j67hKyNAVP
	rWvp8HhXnLMt6ic++TbT6okR8cUjO7VyiedaNIZ6GpS4eHfKjZqu0tKcNUcBL2m21nXb+zIMsS8
	mKvgLI7Ekwag+v19s6SbVteKahYjx18bT4Yy9hVlUs9oGhtE9owOPZNN3CKH/yelkO9i9L7OgkZ
	BCkZcSzAkM9lgX9jITKIhiTGga4qjhOJT67KzmE60G5aYyxQHoKyu20tLH/tZa7GcVClEVm5vF2
	gE1Y7TiF+U+XzTsM
X-Google-Smtp-Source: AGHT+IH/l6ilaMZUOvNHQ9D0Lj0QVtowlI2c2qGJSp+o15wlnCV+KElNEwIXUyY+Ti6xytWfjmZwAg==
X-Received: by 2002:a5d:6d07:0:b0:38c:5bfa:a93b with SMTP id ffacd0b85a97d-38dc90e27a3mr1422541f8f.2.1738919154531;
        Fri, 07 Feb 2025 01:05:54 -0800 (PST)
Received: from elver.google.com ([2a00:79e0:9c:201:fad3:ca37:9540:5c99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390daf451fsm85323975e9.28.2025.02.07.01.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 01:05:53 -0800 (PST)
Date: Fri, 7 Feb 2025 10:05:47 +0100
From: Marco Elver <elver@google.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Bart Van Assche <bvanassche@acm.org>, Will Deacon <will@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nathan Chancellor <nathan@kernel.org>, Kees Cook <kees@kernel.org>,
	Jann Horn <jannh@google.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 00/33] Compile-time thread-safety checking
Message-ID: <Z6XM6zjK3mtqYfan@elver.google.com>
References: <20250206175114.1974171-1-bvanassche@acm.org>
 <CANpmjNOsf1RnYJuZ7pmWVYNqVYMYe+eTL0vhDKU5sLihR9fN-g@mail.gmail.com>
 <90c7a807-b0a0-4b42-866f-f74c5d1c62e5@acm.org>
 <20250207084223.GX7145@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207084223.GX7145@noisy.programming.kicks-ass.net>
User-Agent: Mutt/2.2.12 (2023-09-09)

On Fri, Feb 07, 2025 at 09:42AM +0100, Peter Zijlstra wrote:
> On Thu, Feb 06, 2025 at 10:34:09AM -0800, Bart Van Assche wrote:
> 
> > I'm looking forward to the feedback from others about what their opinion
> > is about how to enable thread-safety checking in the Linux kernel.
> 
> So Bart's patches are rather SHOUTING A LOT:-(, which I find really
> jarring to look at.
> 
> Also, however much I despise the sparse thing, that is something we
> already have some of, so we might as well adapt that.
> 
> But I should probably go read up on the whole clang feature first. 
> 
> I've seen both have a __guarded_by() variant for structure members, can
> you stack those?
> 
> Eg. perf has locking where a structure has both a raw_spinlock_t and a
> mutex and modification requires holding both, but holding either is
> sufficient for reading.

Yes, you can add multiple guarded_by. But it's just going to enforce
that you need to hold both locks before you access the member. If you
want the rules to be more complex, the best way to express that is with
some helpers. E.g. something like this (tested on top my series)

--- a/lib/test_capability-analysis.c
+++ b/lib/test_capability-analysis.c
@@ -479,3 +479,53 @@ static void __used test_local_lock_guard(void)
 	{ guard(local_lock_irqsave)(&test_local_lock_data.lock); this_cpu_add(test_local_lock_data.counter, 1); }
 	{ guard(local_lock_nested_bh)(&test_local_lock_data.lock); this_cpu_add(test_local_lock_data.counter, 1); }
 }
+
+struct some_data {
+	spinlock_t lock;
+	struct mutex mtx;
+	int counter __var_guarded_by(&lock) __var_guarded_by(&mtx);
+};
+
+static void some_data_read_lock_via_lock(struct some_data *d)
+	__acquires(&d->lock) __acquires_shared(&d->mtx)
+{
+	spin_lock(&d->lock);
+	__acquire_shared(&d->mtx);
+}
+
+static void some_data_read_unlock_via_lock(struct some_data *d)
+	__releases(&d->lock) __releases_shared(&d->mtx)
+{
+	__release_shared(&d->mtx);
+	spin_unlock(&d->lock);
+}
+
+static void some_data_read_lock_via_mtx(struct some_data *d)
+	__acquires(&d->mtx) __acquires_shared(&d->lock)
+{
+	mutex_lock(&d->mtx);
+	__acquire_shared(&d->lock);
+}
+
+static void some_data_read_unlock_via_mtx(struct some_data *d)
+	__releases(&d->mtx) __releases_shared(&d->lock)
+{
+	__release_shared(&d->lock);
+	mutex_unlock(&d->mtx);
+}
+
+static void __used foo_1(struct some_data *d)
+{
+	some_data_read_lock_via_lock(d);
+	(void)d->counter;
+	// d->counter++;  // error, because mtx only held shared
+	some_data_read_unlock_via_lock(d);
+}
+
+static void __used foo_2(struct some_data *d)
+{
+	some_data_read_lock_via_mtx(d);
+	(void)d->counter;
+	// d->counter++;  // error, because lock only held shared
+	some_data_read_unlock_via_mtx(d);
+}
