Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805841862
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 05:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744608896; cv=none; b=ED9ZmF7xjZH3P5Jq82UlOOrjMPqnA4aZsx7KKaaZBCzQXwQfQb5U+dUMJi5834witGz4UL+Tdy5lkl3SJq6Ic0wnyltud7Re7eJuZg8JX31CjZaa4oaYTqITEctJ38cW3F6UNBYzViYKr1KyJALr+4kRe88QvEe6od+YPXBqNs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744608896; c=relaxed/simple;
	bh=RBHWsa/lYY2TzfGGGmu9sF7ys+yTQ+QL84nu8ilvsHI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VBOmM9jVg2V4Ou/Bk2PQ3Mn3BA8a0ZQ5KQkhlGYWl9RO8bgMAl3DcFiIMVES5bpx6DPOSjNNlcP50DYEkySnULRKOGvxcsgENVl7geYP2/VZYxJU60AhpLZ5NsGx/IyD01qCh4JUUAzkclnsI3QG6lYnoBkzyRYzKna4ulWcqik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r1JmwAHV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r1JmwAHV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62872C4CEEA;
	Mon, 14 Apr 2025 05:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744608895;
	bh=RBHWsa/lYY2TzfGGGmu9sF7ys+yTQ+QL84nu8ilvsHI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r1JmwAHVlaNDRKobUkCOHhQTmRvKptLMvewXTjJIm/TpEHLl/CMOU3d9eu5jf7pGH
	 3bNTVBwKh5NyEAdh0YVVkd4ZTseFRKLWzdMlgtk2tZgap+1JBRmTtjl3fWUlaBeV7d
	 Im90rpwiQWnf+tBuyC27FbyltNg+luDdT+dq+wUnXqtTqKzCnovWqZfHRf6555mYeX
	 fc1ckyCDBQBfk3aZlbyViiHlc25oDut1+CRVHxL/LlPnxWjRIJkKohHPSxHj4/etb/
	 933WFYCrW3sgXGu5S5CbbShpkP0RDVSFG7sq48hl0IIknQ0RGGlyJAwYW1XXdd1FgH
	 +PwyNFPuA69RQ==
Date: Mon, 14 Apr 2025 07:34:48 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Ankur Arora <ankur.a.arora@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
	torvalds@linux-foundation.org, akpm@linux-foundation.org,
	bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com,
	mingo@redhat.com, luto@kernel.org, peterz@infradead.org,
	paulmck@kernel.org, rostedt@goodmis.org, tglx@linutronix.de,
	willy@infradead.org, jon.grimm@amd.com, bharata@amd.com,
	raghavendra.kt@amd.com, boris.ostrovsky@oracle.com,
	konrad.wilk@oracle.com
Subject: Re: [PATCH v3 0/4] mm/folio_zero_user: add multi-page clearing
Message-ID: <Z_yeeOAVqOdg82pA@gmail.com>
References: <20250414034607.762653-1-ankur.a.arora@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414034607.762653-1-ankur.a.arora@oracle.com>


* Ankur Arora <ankur.a.arora@oracle.com> wrote:

> Ankur Arora (4):
>   x86/clear_page: extend clear_page*() for multi-page clearing
>   x86/clear_page: add clear_pages()
>   huge_page: allow arch override for folio_zero_user()
>   x86/folio_zero_user: multi-page clearing

These are not how x86 commit titles should look like. Please take a 
look at the titles of previous commits to the x86 files you are 
modifying and follow that style. (Capitalization, use of verbs, etc.)

Thanks,

	Ingo
