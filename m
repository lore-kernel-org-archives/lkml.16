Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51A120B1EA
	for <linux-kernel@vger.kernel.org>; Fri, 14 Feb 2025 09:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739525830; cv=none; b=Nrcv9IrcvY7kk1TQogWYoH+8r5yn7uKElxOeDo6PeP6wbRwBSiIcpte0t2GwhLHsqi0IlzAaZ/ZnGBTMfs8C3IRv2eW9s+ZIL2hwHfekL18HsaSaaT5LDe/Sj2NL+rbE3FZwUX7eCUJyjaEfSK7jYTr0jjqg3k1fqIFqP9LTmgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739525830; c=relaxed/simple;
	bh=C36Hk0vdfiBT1Qwd0ce4cmV/SSAbVEs3+H/35Y0ePHA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gfy59C/9aqSao3quDAmhnPaC/x2oI8OsdVvdrIrvFUI6xorjmkux4h9rmeVFMROQ9w+ES/0sW3gHa2Yul2yNAZJq8OI1JWCJMGPLtXQCnZvy5pKNds3Jb+k8V8Cwbs/gSY93GH9HYks4hfCRPTPD7fzGQ8ycUZF93WD4a3a618U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=qjh/QZgM; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="qjh/QZgM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=C36Hk0vdfiBT1Qwd0ce4cmV/SSAbVEs3+H/35Y0ePHA=; b=qjh/QZgMzIyqybLyhapCS12NsX
	qEuSJB7iTB9Gnm/pr314F6+PTG3NZJaA927qipz/viewSEMxr36vMxAz0Cx1woX5HyjFv+maFXkrO
	MvEyBoy7y1JL2AT9oYphLwPxSJVr7l4RzwxaWE9ev1WdcuwJYtcuYGq2nN6aeJYgPrX4kJsDOzNFX
	aSUoZ4lJuzMFZnGIJXGJe7yqDV5S7BTHYeUoo9wd/ulSBW5gB9mAW1yH01OnA2XIuye9B7IeBky48
	ykyDm7SnnE+UXGSEQD+oXCgPIXc07qj2WVa32B5W1GV7g15ZobD+ix13ZOxZyk+ua/qDEM0+MygLP
	rsWgeJlg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tis7s-00000001DQR-2WIC;
	Fri, 14 Feb 2025 09:36:48 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 2FA3B3002F0; Fri, 14 Feb 2025 10:36:48 +0100 (CET)
Date: Fri, 14 Feb 2025 10:36:48 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Rik van Riel <riel@surriel.com>
Cc: Brendan Jackman <jackmanb@google.com>, x86@kernel.org,
	linux-kernel@vger.kernel.org, bp@alien8.de,
	dave.hansen@linux.intel.com, zhengqi.arch@bytedance.com,
	nadav.amit@gmail.com, thomas.lendacky@amd.com, kernel-team@meta.com,
	linux-mm@kvack.org, akpm@linux-foundation.org, jannh@google.com,
	mhklinux@outlook.com, andrew.cooper3@citrix.com
Subject: Re: [PATCH v11 00/12] AMD broadcast TLB invalidation
Message-ID: <20250214093648.GC21726@noisy.programming.kicks-ass.net>
References: <20250213161423.449435-1-riel@surriel.com>
 <CA+i-1C3DRvustO9eH4PFyASD_SRoR4iv22BMfvu9BSKDK_SFLw@mail.gmail.com>
 <5d6130a40f173e341306faca897a0e42f8cd5a20.camel@surriel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5d6130a40f173e341306faca897a0e42f8cd5a20.camel@surriel.com>

On Thu, Feb 13, 2025 at 03:02:40PM -0500, Rik van Riel wrote:

> Peter, do you prefer a v12, or should
> additional small fixes and improvements
> just be sent in follow-up patches at
> this point?

I think I'm mostly okay at this point, but DaveH was wanting to have a
look at this thing. Dave did you get around to reading one of these
recent versions, wdyt?
