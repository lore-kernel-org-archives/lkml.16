Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1060D135A63
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 05:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745301411; cv=none; b=LSNX4bSwUJrUoPc7m4ZgTcnLQqgoDkeyvATqLIfl2KFPhancEdYcKBdfmOfxf92ejt+bBa7muIDBTTfIaa8A5Lpei5Dxd/e6WQbyzsHCAzMVL+juHwPGazBg6svR23a1bu8jgNv8nnETD5XXgiHHzPd9vRCXfhPHNFT6RdfKDnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745301411; c=relaxed/simple;
	bh=mBBQmtdwIYph+KkrpOX45x9p0FdDg5s24YDJBMuHDpE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NKUmcg5jsPxf2qi0+unz0wjK4RdXuS7gP4VvRJ14xQWalWkfkIlK/a8GCzIEqVq45KmTSJYVHSlp6FIg1ghKYV8o8MTkhCMPcvMAg4I5UUIuzi1+JDayd9RoR1LXUbB1TLoPYiXnqkkLs+I3Ii4534EeHzUB33ysrOWsqFEB1Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qY298o3F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qY298o3F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 272DBC4CEE9;
	Tue, 22 Apr 2025 05:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745301410;
	bh=mBBQmtdwIYph+KkrpOX45x9p0FdDg5s24YDJBMuHDpE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qY298o3F+FJwgEIByjkV4qSBzk7QWdW8NPuYnhbJedTW8wO3cJhkS1NcwTaD/cGyH
	 oWC/VG7Po76ilKVUFZjszon5ijKslnn0pgSks++TgSfL65lzOjFSZ6LfRlP+YZC0NY
	 Tzlmf0Tddl6Lk3t6vzx6WNR1y35o1pB0KH2UZt780drlWFu71FuB/66jdUQo14/tzg
	 IZOYKvZn4xgmWMmMMU2nPysvdoUiZjgbCKm3Ns/4EK6CWLBsdRUn3F/gCpaj6hhUMS
	 jvOfKcamYsN2J+wan200gwKp/yZG8JbaDAnvu1gZE6MFsEw6fyZGuWT4jdRAYio4DD
	 /4MhyR9AN8CAw==
Date: Tue, 22 Apr 2025 08:56:42 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, Andy Shevchenko <andy@kernel.org>,
	Arnd Bergmann <arnd@kernel.org>, Borislav Petkov <bp@alien8.de>,
	Juergen Gross <jgross@suse.com>, "H . Peter Anvin" <hpa@zytor.com>,
	Kees Cook <keescook@chromium.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: Re: [PATCH 02/29] x86/boot/e820: Simplify e820__print_table() a bit
Message-ID: <aAcvmqyP5Jq2Quyl@kernel.org>
References: <20250421185210.3372306-1-mingo@kernel.org>
 <20250421185210.3372306-3-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421185210.3372306-3-mingo@kernel.org>

On Mon, Apr 21, 2025 at 08:51:42PM +0200, Ingo Molnar wrote:
> Introduce 'entry' for the current table entry and shorten
> repetitious use of e820_table->entries[i].
> 
> Signed-off-by: Ingo Molnar <mingo@kernel.org>
> Cc: Andy Shevchenko <andy@kernel.org>
> Cc: Arnd Bergmann <arnd@kernel.org>
> Cc: David Woodhouse <dwmw@amazon.co.uk>
> Cc: H. Peter Anvin <hpa@zytor.com>
> Cc: Kees Cook <keescook@chromium.org>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> Cc: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>  arch/x86/kernel/e820.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/x86/kernel/e820.c b/arch/x86/kernel/e820.c
> index 4a81f9e94137..b1a30bca56cd 100644
> --- a/arch/x86/kernel/e820.c
> +++ b/arch/x86/kernel/e820.c
> @@ -204,12 +204,14 @@ void __init e820__print_table(char *who)
>  	int i;
>  
>  	for (i = 0; i < e820_table->nr_entries; i++) {
> +		struct e820_entry *entry = e820_table->entries + i;
> +
>  		pr_info("%s: [mem %#018Lx-%#018Lx] ",
>  			who,
> -			e820_table->entries[i].addr,
> -			e820_table->entries[i].addr + e820_table->entries[i].size - 1);
> +			entry->addr,
> +			entry->addr + entry->size-1);

nit: entry->size - 1

>  
> -		e820_print_type(e820_table->entries[i].type);
> +		e820_print_type(entry->type);
>  		pr_cont("\n");
>  	}
>  }
> -- 
> 2.45.2
> 

-- 
Sincerely yours,
Mike.
