Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62E820C492
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 05:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744781832; cv=none; b=pOAcKdDS67RxSn8lfyRJS7YExvDn8+OBAIQ+PecpXbRm79ViST3XsGpQXly1+1fv6wxTyKOGlHCCXtc2XGNS8M3r91uONbqsgvk8ZF+24ClRH2yxBN9BWDAmPgCCcYdhudIERXe/JSJeUULhp+4IKwN7SP7Mj7TJaPg8XpBn72A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744781832; c=relaxed/simple;
	bh=waAEppq/JDEifGykp8W3jmBGjomu3kqI+SRnjliLf6k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cZdcrkVg0xkBiIB1THhao1aI0cz2LLfivUvXLSc1Zmn+pfVJxXAhtTKvwD0DHoQt+IGuqGwFAzZ4m1mmq5JdBc8kuXEN1yD/15D9GDvQNQ8KVA9pBY+qgqkje+4fXLefQsXUn8etGlEZZg9gARVGmw3NEutfLc7sPvpZZRyiImU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ALLLVnOq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ALLLVnOq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B78D7C4CEE2;
	Wed, 16 Apr 2025 05:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744781832;
	bh=waAEppq/JDEifGykp8W3jmBGjomu3kqI+SRnjliLf6k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ALLLVnOquNT1Lv2jA+YFURb/34wjyXJfllCHJNye5RbCB5+tb9p2YubbIb7CnIBA2
	 idyRSF/H/M9Fjo0/mXPzE+XV+nhJ6oGRzONfatRKoyUcvX/ZhCkzwLnyHgfFOTxTjc
	 m/dPW/e7A1iFijJCyKUhVeX7euhaGr6bWnH+Dw90u7MwzuSacooFC+sNeZDkPQKXJU
	 rwqEZ0nMDztwIaajNBaQrJAfxDX7AHDYCUTkSstRcy2So60JNSozYdTO2M5Uy12+gY
	 xYyZHrvlhfVqWvsAJPL8RWY8KZkY/iwWYwZduqFwJtU3U8wJrvVfHTZCSVL7bkNvwT
	 2kXbBXhDtrvkg==
Date: Wed, 16 Apr 2025 07:37:06 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Anil Gurumurthy <anil.gurumurthy@qlogic.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Sudarsana Kalluru <sudarsana.kalluru@qlogic.com>
Subject: Re: [PATCH 02/17] scsi: bfa: Rename 'timer_mod' to 'timer_module'
Message-ID: <Z_9CAqRECcOGTtm2@gmail.com>
References: <20250414102301.332225-1-mingo@kernel.org>
 <20250414102301.332225-3-mingo@kernel.org>
 <CAHk-=wgCFJ923gMqPYq5YrqUuLM3He-O7wvLfpvwNrySSK0vMw@mail.gmail.com>
 <Z_9AEaeUIdWi2vLS@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_9AEaeUIdWi2vLS@gmail.com>


* Ingo Molnar <mingo@kernel.org> wrote:

> 
> * Linus Torvalds <torvalds@linux-foundation.org> wrote:
> 
> > On Mon, 14 Apr 2025 at 03:23, Ingo Molnar <mingo@kernel.org> wrote:
> > >
> > > We'd like to introduce timer_mod() in the kernel, so make
> > > sure the namespace is clear.
> > 
> > No no, this is horribly wrong.
> 
> Yeah, that was a horrible script fail, I sent the updated -v2 patch 2 
> days ago (and it was updated in the Git tree then too):
> 
>   https://lore.kernel.org/all/Z_0oWnbcjsekHXJd@gmail.com/

Correction, my email reply is:

   https://lore.kernel.org/all/Z_zvpgKNKWVmEIFu@gmail.com/

Thanks,

	Ingo
