Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B1E1F4607
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 13:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745416670; cv=none; b=G2HWZNo+nCzsDrHPB/c+7g0d53QOawIRqjxp1RXwAm7S4g39uxMrv9oKgsrDSOAad57EjVcskI1Tp625XJps4y1qF3fx0acGTfPhqndRgKwbmhn9kk5VVAUBT3rGsMT73WpM63psKTzevpqJF5/okKaFXTLLJ/I7J3icUC+8IpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745416670; c=relaxed/simple;
	bh=vnkLyf6k0QPFzQxJhCH4hV8rAcbflrSoaxIrZeMLXNE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KO1QcNpUxDeU6dswhJzHplCsjBSPzjhR478yjLjn+SLgqqFdcA33GtB5WMOuu6Kjq9ClO7w8zFT3KNPTj445HR8jzV06gwo0zL4T6TngZu+XgX88zusfg3BX4+pb/SVeC7g34JIIpJJVNzN4kvYa99tg3oEw3eUi2xjVKh/iz8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37715C4CEE2;
	Wed, 23 Apr 2025 13:57:49 +0000 (UTC)
Date: Wed, 23 Apr 2025 09:59:41 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Mykyta Yatsenko <mykyta.yatsenko5@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 mhiramat@kernel.org, andrii@kernel.org, kernel-team@meta.com,
 linux-kernel@vger.kernel.org, Mykyta Yatsenko <yatsenko@meta.com>, Kees
 Cook <keescook@chromium.org>
Subject: Re: [PATCH v2] maccess: fix strncpy_from_user_nofault empty string
 handling
Message-ID: <20250423095941.1cab813f@gandalf.local.home>
In-Reply-To: <08e3ec4c-4401-403e-9d81-5ee0abebba5c@gmail.com>
References: <20250422131449.57177-1-mykyta.yatsenko5@gmail.com>
	<20250422172011.feb243d2f7478c0e7109b74c@linux-foundation.org>
	<08e3ec4c-4401-403e-9d81-5ee0abebba5c@gmail.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 23 Apr 2025 12:37:46 +0100
Mykyta Yatsenko <mykyta.yatsenko5@gmail.com> wrote:

> > Does this fix any known runtime issue?  If so, please fully describe this?  
> Not that I'm aware of. The issue could be found when trying to copy empty
> user space string in BPF program (and relying on return value).There are 
> some usage of
> `strncpy_from_user_nofault` in tracing subsystem, but I'm not sure how to
> hit those code paths.
> >  

Although your patch found a bug in the tracing subsystem, this wasn't the
cause. It only cared if the read faulted or not. It was incorrectly
checking for zero as non fault when in reality, it needed to check >= 0.

With that fixed, it should work the same with or without this patch.

-- Steve
