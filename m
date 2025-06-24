Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153B62CCC1
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 23:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750809001; cv=none; b=YnaF0LzeZqQok4Osx4rAIyGvAlQD+pOGJVND6EMS3SPZYQeoew/3Obv7uniO8dXP1PeorQuKz8TG6GHtoyFC85vQfQ4+nxadp5cuG1VRyAatKbujPrfSka2gTKTqhy7zxFchGW78FHnE4ygt3rRkDa9PV97HQ63WAE6NisivMpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750809001; c=relaxed/simple;
	bh=8Fh13sXotQGiATFHFtPGnvZUNJMgWfHnrJ1k2/bm2Mk=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=eHWSXDnCICHAYVLdI0A712ySac5dN1w21Qv9X6okR81XEyU/Iy6cZn5y/STKjwLzssM7axJvlLDgL3UxJiLoB6unSpMR39cF4Ke/r1FU68MP43wp4WYRCHqf6NVtwc15FKUoBBp7r6S+1b909ykPE02qdFB17fTW9LOQCF6Bjw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=T5lahQgj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="T5lahQgj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87F5BC4CEE3;
	Tue, 24 Jun 2025 23:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1750809000;
	bh=8Fh13sXotQGiATFHFtPGnvZUNJMgWfHnrJ1k2/bm2Mk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=T5lahQgjFzPp7LvVTOBSGRfiPEFTSLdkNd7Syk9WB3ZMuPPTaRtAxbrTzuash3rer
	 L4MoOppF18l2tkrf62UdE0Yb6+J4ahcF8+2xVSE4lrZxsqtjL58Odzn2cSedFBMEK/
	 0xoBJSsgWXBRbMZBKAGq8ICTB+rWP3M2DCp4DP5o=
Date: Tue, 24 Jun 2025 16:50:00 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-kernel@vger.kernel.org, Jan Kiszka <jan.kiszka@siemens.com>,
 Kieran Bingham <kbingham@kernel.org>, Tony Ambardar
 <tony.ambardar@gmail.com>, Stephen Brennan <stephen.s.brennan@oracle.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Thomas Gleixner
 <tglx@linutronix.de>
Subject: Re: [PATCH v2] scripts/gdb: Fix interrupts.py after maple tree
 conversion
Message-Id: <20250624165000.ecf2a00a55fd267befa6fdb4@linux-foundation.org>
In-Reply-To: <20250624032751.1094840-1-florian.fainelli@broadcom.com>
References: <20250624032751.1094840-1-florian.fainelli@broadcom.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 23 Jun 2025 20:27:45 -0700 Florian Fainelli <florian.fainelli@broadcom.com> wrote:

> In commit 721255b9826b ("genirq: Use a maple tree for interrupt
> descriptor management"), the irq_desc_tree was replaced with a
> sparse_irqs tree using a maple tree structure.
> 
> A new module (mapletree.py) is added whose mtree_load() implementation
> is largely copied after the C version and uses the same variable and
> intermediate function names wherever possible to ensure that both the C
> and Python version be updated in the future.

butbutbut.  What is actually being "fixed" here?  The above contains no
description of any problem.
