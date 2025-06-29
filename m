Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F8A87DA95
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 16:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=163.172.96.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751213309; cv=none; b=rG/wHis4eww/uJoxcnSJGvPXhZOELFb9a1DqV3iHq57Ht9mAptysinnWESjRwiwMYlDp/xp2J4JFBeVbvg8rOz1fuSeXBdhyq5YPKrIY467+xnxepqBTlU2UbvRBe5/eYykqKwdDCox4EV605kdFVixC6hVzsfkXau96Pmxl8ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751213309; c=relaxed/simple;
	bh=47N4KLG6oqzqBOEJCiz5EcsJZklYxeeKZAnYPRcr1Lk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aNBYPi1DJxrqnwIcsp85Gby7zot3at6lO6nYfrVoKdoVO/6RtzREH0neCMVRvK58aZaFPF0FAiErT2HbncF0c/McMkCBWIizbDtjtvE7Q1DoRBSR4/AvwX2sCjfpTOvi9w8ktSEzWBAOyAIeKGJ6lBI3KhGuo/XkVtWby+Wsa0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; arc=none smtp.client-ip=163.172.96.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 55TG8NAi002113;
	Sun, 29 Jun 2025 18:08:23 +0200
Date: Sun, 29 Jun 2025 18:08:23 +0200
From: Willy Tarreau <w@1wt.eu>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] tools/nolibc: move FD_* definitions to sys/select.h
Message-ID: <20250629160823.GA2302@1wt.eu>
References: <20250622071958.GA3384@1wt.eu>
 <07f5fdb4-2c5c-4723-b12a-abdb0c9f33b7@t-8ch.de>
 <20250623025618.GA29015@1wt.eu>
 <20250629084628.GA7992@1wt.eu>
 <d8d9ab91-0617-468e-a82d-9f271c5e6a7f@t-8ch.de>
 <20250629092552.GA30947@1wt.eu>
 <029f24fa-3512-4736-94a0-e158c158cc8e@t-8ch.de>
 <20250629094048.GA26861@1wt.eu>
 <20250629151006.GA16826@1wt.eu>
 <e2513e72-5949-463d-a950-0778609141d7@t-8ch.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e2513e72-5949-463d-a950-0778609141d7@t-8ch.de>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Sun, Jun 29, 2025 at 05:54:02PM +0200, Thomas Weißschuh wrote:
> I saw the same issue, but only because of the changes to types.h.
> And these should not be necessary in the first place.

You mean fd_set definition ? It's solely a matter of includes ordering
in fact, since it depends on FD_SETSIZE.

> The below works nicely for me:

OK. Do you prefer that we take that one or just a stub ? I'm personally
fine with both.

Thanks!
Willy
