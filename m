Received: from smtp134-24.sina.com.cn (smtp134-24.sina.com.cn [180.149.134.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45201FBEB3
	for <linux-kernel@vger.kernel.org>; Sat, 22 Feb 2025 10:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=180.149.134.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740219123; cv=none; b=FnGdtuqC+t8rk8bvwm34xS9arXog2jBPwZmnTisoSfZXgoTG5RIRN5VB2dMjQdJlw4kBWr+6BCI4NoJ9XJT7m5iEEzRprBP89qTYCAo7pGRJoPSg385TU5H0BR4Oe8fMuoOCwH5TFzJYVfShNTZsFFY+9xsbCEQK2pe9rqjwROk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740219123; c=relaxed/simple;
	bh=7tMaY0qjFfucRjyIq28BzfX8Vk4s2TgQk4x6NAdNKBU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gvwqSS13B3dGBgKkjirBri3cZe0dG4mSXQ/N9Eb5P/H21DSMjle+U7cbnmrVab1wZMOkWAcSTNxY/zra0cEBcPhdgRWDdptTU4uy4l/tjzWxWCa2Vy0J0aKwqZdmA6VE3DnittBQVtScA/59F5VKYRj0D5kQb7kDnLOBvFl74V0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; arc=none smtp.client-ip=180.149.134.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([113.88.49.91])
	by sina.com (10.185.250.21) with ESMTP
	id 67B9A2BA00007633; Sat, 22 Feb 2025 18:11:11 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 1280493408230
X-SMAIL-UIID: 299E5C4C5BBC49EDB9DFC345876752EC-20250222-181111-1
From: Hillf Danton <hdanton@sina.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Matthew Wilcox <willy@infradead.org>,
	Byungchul Park <byungchul@sk.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	conduct@kernel.org
Subject: Re: [RFC PATCH v12 00/26] LUF(Lazy Unmap Flush) reducing tlb numbers over 90%
Date: Sat, 22 Feb 2025 18:10:59 +0800
Message-ID: <20250222101100.2531-1-hdanton@sina.com>
In-Reply-To: <2025022230-jurist-unfasten-c024@gregkh>
References: <20250220052027.58847-1-byungchul@sk.com> <20250220103223.2360-1-hdanton@sina.com> <20250220114920.2383-1-hdanton@sina.com> <Z7c0BTteQoZKcSmJ@casper.infradead.org> <20250220232503.2416-1-hdanton@sina.com> <20250221230556.2479-1-hdanton@sina.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, 22 Feb 2025 08:16:09 +0100 Greg KH <gregkh@linuxfoundation.org>
> On Sat, Feb 22, 2025 at 07:05:26AM +0800, Hillf Danton wrote:
> > On Thu, 20 Feb 2025 18:44:12 -0500 Steven Rostedt <rostedt@goodmis.org>
> > > On Fri, 21 Feb 2025 07:25:02 +0800 Hillf Danton <hdanton@sina.com> wrote:
> > > > > I'll tell you what would happen in my home town. If someone said
> > > > > that to a co-worker, they would likely be terminated.
> > > > >   
> > > > Interesting, I want to know if the three words, rape, pregnancy and WTK,
> > > > could be used before judge in your hometown court by anyone like your lawyer.
> > > 
> > > This isn't a court. And there's no reason to use the word "rape" in a
> > > technical conversation on the Linux kernel mailing list. Perhaps a person
> > > reading this was a victim of rape. How do you think that would make them
> > > feel? Welcomed to our community? Absolutely not. Which is why it's totally
> > > unacceptable.
> > > 
> > There are NAK victims. Did you nak more than twice a week, Steve?
> 
> This is not the way to work with your fellow developers in the community
> to express disagreements.
>
No comment because you are free to express disagreements.

> I would recommend following up with an apology.
> 
It would take some time for me to opt to follow/ignore what you recommended.
