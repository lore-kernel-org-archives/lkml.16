Received: from forward501d.mail.yandex.net (forward501d.mail.yandex.net [178.154.239.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF241230996;
	Tue, 24 Jun 2025 12:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750768754; cv=none; b=mV1Kpri6Y7/uQMDEFWTBwHlKDzL+DobN+0FLOwpgwC906Nh2Q5SBk3X58ixa172lrFxB21vZ8bS9wAM/in8cgw4/2k0FiKTLn7dV1osMqWQ6jgZ5WOW7dRhMnAWcBYPVHGPySVGZi5KJo5jIuqVPk81XI88+6JFHNnTtBrFJBwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750768754; c=relaxed/simple;
	bh=IiZvAA3FleTUiDWA3EVVuuyPPqVxWqgsxdcovX1m2xg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kSVg86QDW3+lZQ5KmKi9nD+xbsRFys3w05PGKtJ7vbF/F1bSQUR9nJQk8YeNl2iNtadk1XCF5a7FTbiMb6G4ZCyzg17SVjhaqdc6ddI24938iriHjKX3FcNzTmUrkISh2z4nk0XWWXAF2jLTlA3OS+8wvNEUHTC3AalTlVWZpbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=PKF81/DS; arc=none smtp.client-ip=178.154.239.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="PKF81/DS"
Received: from mail-nwsmtp-smtp-production-main-81.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-81.klg.yp-c.yandex.net [IPv6:2a02:6b8:c42:832b:0:640:fda5:0])
	by forward501d.mail.yandex.net (Yandex) with ESMTPS id 0F5F661A1F;
	Tue, 24 Jun 2025 15:31:10 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-81.klg.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id 4VSEOs8LaeA0-juFvfTtH;
	Tue, 24 Jun 2025 15:31:08 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1750768269;
	bh=KUzUZlPWU3SLSvntobllY0hRQ6erceKcqtakC8llS30=;
	h=Cc:Message-ID:Subject:Date:References:To:From:In-Reply-To;
	b=PKF81/DS5QIdXChUVJRELAbFDbbjMSk6Zhd0TJmV3md1Art5XzZuq8Ua3WNksVxHD
	 /J327gmOHntnzMqVRBcj5qtBasPiJajsEXHfyOAp8XHJykcWm3KaT5fa3pl6MpjB7G
	 qu4FRG7y6EK6KCXMxCq/0f4G4TIjcObdueQ6IBgI=
Authentication-Results: mail-nwsmtp-smtp-production-main-81.klg.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
Date: Tue, 24 Jun 2025 15:31:02 +0300
From: Onur <work@onurozkan.dev>
To: "Benno Lossin" <lossin@kernel.org>
Cc: "Boqun Feng" <boqun.feng@gmail.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <ojeda@kernel.org>,
 <alex.gaynor@gmail.com>, <gary@garyguo.net>, <a.hindborg@kernel.org>,
 <aliceryhl@google.com>, <tmgross@umich.edu>, <dakr@kernel.org>,
 <peterz@infradead.org>, <mingo@redhat.com>, <will@kernel.org>,
 <longman@redhat.com>, <felipe_life@live.com>, <daniel@sedlak.dev>,
 <bjorn3_gh@protonmail.com>, <simona@ffwll.ch>, <airlied@gmail.com>,
 <dri-devel@lists.freedesktop.org>, <lyude@redhat.com>
Subject: Re: [PATCH v5 2/3] implement ww_mutex abstraction for the Rust tree
Message-ID: <20250624153102.3961f377@nimda.home>
In-Reply-To: <DAUM8B2ZUMFQ.25R95W7IDAEHM@kernel.org>
References: <20250621184454.8354-1-work@onurozkan.dev>
	<20250621184454.8354-3-work@onurozkan.dev>
	<DASY7BECFRCT.332X5ZHZMV2W@kernel.org>
	<aFlQ7K_mYYbrG8Cl@Mac.home>
	<DATYHYJVPL3L.3NLMH7PPHYU9@kernel.org>
	<aFlpFQ4ivKw81d-y@Mac.home>
	<DAU0ELV91E2Q.35FZOII18W44J@kernel.org>
	<aFmKsE_nJkaVMv0T@tardis.local>
	<DAUARTYJ118U.YW38OP8TRVO3@kernel.org>
	<20250624083437.1e50d54c@nimda.home>
	<DAUM8B2ZUMFQ.25R95W7IDAEHM@kernel.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 24 Jun 2025 10:20:48 +0200
"Benno Lossin" <lossin@kernel.org> wrote:

> On Tue Jun 24, 2025 at 7:34 AM CEST, Onur wrote:
> > Should we handle this in the initial implementation or leave it for
> > follow-up patches after the core abstraction of ww_mutex has landed?
> 
> Since you're writing these abstractions specifically for usage in
> drm, I think we should look at the intended use-cases there and then
> decide on an API.
> 
> So maybe Lyude or Dave can chime in :)
> 
> If you (or someone else) have another user for this API that needs it
> ASAP, then we can think about merging this and improve it later. But
> if we don't have a user, then we shouldn't merge it anyways.

I don't think this is urgent, but it might be better to land the basic
structure first and improve it gradually I think? I would be happy to
continue working for the improvements as I don't plan to leave it as
just the initial version.

I worked on the v5 review notes, but if we are going to consider
designing a different API, then it doesn't make much sense to send a v6
patch before finishing the design, which requires additional people in
the topic. That would also mean some of the ongoing review discussion
would be wasted.

---

Regards,
Onur
