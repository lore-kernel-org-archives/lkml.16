Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFEC02741A3
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 22:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745964665; cv=none; b=sgNuTMPHFlf5bebciBIbafBlYQSAiiq5E6Z/yY5UO/yd85YQb/r6+o3zYszzvhWNpxmUsgHI7WkyevtyTFNBFBYYpPzi3MceCvz18xi16IRpnC0LyusB9Nhnw/OvfnrfYnGY73Ln7ifIyLAg6JRsRwopMMHazj6LRUyjkFL9WdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745964665; c=relaxed/simple;
	bh=EHxrW5+M59gFfmAJH6ASgy3nRIK4N00qyyGpOKbGERc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LSZEMy3/jSvi8bP+KhoPfYY71Kq8ZX/oMVY2FAy3TTXqU2bUFnV+lFfoDwiOlwoiZqf2qfAprbtS2GSds4asbnBN8IrGCeV2BLYtYpHfNr0HJGxTma50+yhiJSIuQm3cnRw5fXTNhA7Wki2Mgp9E918eLZjmM69pwXsinjkUkHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Qn29krBL; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Qn29krBL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=UYPWLYPYgvmF8T81o4dpet2IMGEB9HwrOlbhEd4fYeU=; b=Qn29krBLvTiM9LRdXoRXXbTwyY
	2KrqI2T5VZQ8vgWbP12BLJbmMd/HuggEKBHZlj1yMz0RVRQkJoS3UrGdBw9fiVA7+/bPOXA4R7AqE
	F9YwC0oYkbiwyQiBZS6jRQuFjqH34pFaRJnlStB7XYE2pmt1oj0TzEdxwjzfB8moRVCnfv3QziMus
	ENZH2EaNv+G7ALTIe2+wpbQVinCpzYKK/lW87Vm1+JAhUbc+VIe4Z2N9mjXQ7FqCYxTKHMUbgr0fY
	LXP0Swo352LSOcj7JF4B4H8IbXMLfgL32g8TYxhI9g3L7bKaUTfuY+VX0JTRGT8R+UZaAPiGtbTaq
	7Isx8TTg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9tAA-0000000DXHC-07GT;
	Tue, 29 Apr 2025 22:10:51 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 8AAEF30057C; Wed, 30 Apr 2025 00:10:49 +0200 (CEST)
Date: Wed, 30 Apr 2025 00:10:49 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Carlos Bilbao <bilbao@vt.edu>
Cc: Andrew Morton <akpm@linux-foundation.org>, carlos.bilbao@kernel.org,
	tglx@linutronix.de, seanjc@google.com, jan.glauber@gmail.com,
	pmladek@suse.com, jani.nikula@intel.com,
	linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
	takakura@valinux.co.jp, john.ogness@linutronix.de, x86@kernel.org
Subject: Re: [PATCH v3 0/2] Reduce CPU consumption after panic
Message-ID: <20250429221049.GG4439@noisy.programming.kicks-ass.net>
References: <20250429150638.1446781-1-carlos.bilbao@kernel.org>
 <20250429133941.063544bb4731df0ef802440c@linux-foundation.org>
 <20250429210650.GD4439@noisy.programming.kicks-ass.net>
 <433c6561-353e-4752-b9cf-155e49e62e63@vt.edu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <433c6561-353e-4752-b9cf-155e49e62e63@vt.edu>

On Tue, Apr 29, 2025 at 03:32:56PM -0500, Carlos Bilbao wrote:

> Yes, the machine is effectively dead, but as things stand today,
> it's still drawing resources unnecessarily.
> 
> Who cares? An example, as mentioned in the cover letter, is Linux running

Ah, see, I didn't have no cover letter, only akpm's reply.

> in VMs. Imagine a scenario where customers are billed based on CPU usage --
> having panicked VMs spinning in useless loops wastes their money. In shared
> envs, those wasted cycles could be used by other processes/VMs. But this
> is as much about the cloud as it is for laptops/embedded/anywhere -- Linux
> should avoid wasting resources wherever possible.

So I don't really buy the laptop and embedded case, people tend to look
at laptops when open, and get very impatient when they don't respond.
Embedded things really should have a watchdog.

Also, should you not be using panic_timeout to auto reboot your machine
in all these cases?

In any case, the VM nonsense, do they not have a virtual watchdog to
'reap' crashed VMs or something?
