Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A0BF23A984
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 14:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748875846; cv=none; b=Ug/JzHJZTJfqHYTI/su0BeaiA+Hl9WigRLfjOKreBXTwbLVmntFyK8eu/XMCTZuewf7nVAuHhTKeUvwspPoCS4z7hnf6b/bFwD+DKRiAaSIV7ShQdTHaX7oVt8zzu/Ckou781Wi1PoAykzdRa3pnxhq0d6TvAM6GO97+0rSmFSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748875846; c=relaxed/simple;
	bh=6y+70lBXEmn3g303IJEQ6ZE4RmL1J1x90nFTmaJnrSE=;
	h=Message-ID:Date:From:To:Cc:Subject; b=TcYQ3/uQ2XdSuvM8BYXgy0/iHFSbEnWcCO6xwxlvS6tm0oYUNRuiZVjfysQvl56s8KEi1PWOD6GgZgC+8vxYTGN/cvanqG7zNO1lPekY7FSWwcQSbAzDM2HB4zMnDU11qZCEy5WpwAdK1SX0dt5ltLCZeuPpQH1PVU5LzKu1JMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ciTBUIs8; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ciTBUIs8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Subject:Cc:To:From:Date:Message-ID:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=6y+70lBXEmn3g303IJEQ6ZE4RmL1J1x90nFTmaJnrSE=; b=ciTBUIs8i8Xnf1vYsurT0qTji/
	CqYrLUNSY9ZBgclUu7PjE3/Yo8S9P+5w2Mg0+8/JQIVhgfbudFyWEsg6OnR/VUgDFJiL3wg5oDmbd
	JVDSfim3TflHfrNmzWGE96F4iTyOT+6te1zQlIn1p0AZBImJqBbpG62DFaLziNMpFu+Tv62NTlvJ4
	9DnUo/VdDYdh1eylsgr2TAJ6WlBs2ytuYPOhs358XRzuOAaRmk8bvAdUiAFPRGVGS34td7BfhhCSs
	EqjUdB3bLQ8GGqnIxDLb05TG6KI1ASFBmxx5O2sKxfP3Nsl64z3AmxB4YjLw4RcjLcBPpsBjxnwgt
	91L+jnGw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM6Ul-000000011NA-3KCV;
	Mon, 02 Jun 2025 14:50:35 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id 05D2F3005AF; Mon,  2 Jun 2025 16:50:35 +0200 (CEST)
Message-ID: <20250602144201.301974933@infradead.org>
User-Agent: quilt/0.66
Date: Mon, 02 Jun 2025 16:42:01 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
 peterz@infradead.org,
 kees@kernel.org,
 acarmina@redhat.com,
 jpoimboe@kernel.org,
 mark.rutland@arm.com,
 torvalds@linuxfoundation.org
Subject: [RFC 0/8] x86: Mad WARN() hackery
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Hi,

I've been annoyed at how WARN() works for quite some time, and Alessandro has
been trying to make it even worse.

This is an attempt at making WARN() generate less crap for the most common
cases. It is somewhat magical, but appears to be working for the simple cases
I've tried. Specifically, it moves the __warn_printf() into the exception for
the case of 3 or less arguments.

This would hopefully allow Allesandro to put the kunit hackery in report_bug()
and not spread it around all the WARN() sites like he does now.

