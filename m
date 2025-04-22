Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3545A1F09A1
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 20:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745352713; cv=none; b=o+xwJobPFsSb1jqLu7BZVlcUJ8rnNmG2b194oPPBRaxETwM5Qx6Tp1Yimi62H62YasWYk/lfAmF30RcTNj3TZSoYwqPuQWv8DpeDAB8OUaMhndsIWbCFUrOWt2eRaqU94USeaHIIHWG0JKjRmEDNEryXJBYKd0FWjNlA0y2v3b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745352713; c=relaxed/simple;
	bh=I8sz60M1M9oOtCtN2+sZHYaUApjCHjfAGo/MZt8Q9L4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hu+INwY+VQm5VU+t8Ug66DtQmhDR3srsXVdFsqJaMVCp1lAIddbt2v9hMMgVmg2MBJ71kN8m5P4R3Z9oLU8tWwGDWKp9/KR7oPKhmxO/Hl2r2sqE6Ld1LD7YX9qEoscX9iPOuYUGAP+ocFdAzz1XtfGEbzfA1weVK6ej9pP6eW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jhQAXMPL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jhQAXMPL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5B0CC4CEE9;
	Tue, 22 Apr 2025 20:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745352712;
	bh=I8sz60M1M9oOtCtN2+sZHYaUApjCHjfAGo/MZt8Q9L4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jhQAXMPLP+RtYthK1b6dB9VvR30R1xQmmkhPNGs6KvhQrUc2yIFxPk0OynGUz9FRi
	 KHaOqJqHg6DG9vdsr4flkSJd42KzCpBO3BIn4Gv9l8s+42+HifPUm1vr0C6ajPYobi
	 fxXBzl/Jp4boqLiTRVd5GLYCL9x/92c+1EJykftTYqykpyyLmLLnDBxHBuJnocALpG
	 ozNQYVtCzL0f7IlxClL3nEPoM+6OV75U33uk0QaeYOas8SnQrxYsh88BiRpTsMXMt2
	 3DMlcjySeebtAq79+0THV4XDWKXiThtpwvLEfW8d2gX+Rx/qufPRenGLEJa3Bpt7ph
	 zxhPxvFF9ktTg==
Date: Tue, 22 Apr 2025 22:11:48 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org, Andy Lutomirski <luto@amacapital.net>,
	Dave Hansen <dave@sr71.net>, Brian Gerst <brgerst@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Chang S . Bae" <chang.seok.bae@intel.com>
Subject: Re: question about switch_fpu_prepare/switch_fpu_finish
Message-ID: <aAf4BNLmpMV7I_My@gmail.com>
References: <20250409211127.3544993-1-mingo@kernel.org>
 <20250422170059.GB1676@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422170059.GB1676@redhat.com>


* Oleg Nesterov <oleg@redhat.com> wrote:

> I must have missed something, but I can't understand this logic, it
> seems unnecessarily complicated today.
> 
> 1. Now that switch_fpu_finish() doesn't load the FPU state, I think it
>    can be folded into switch_fpu_prepare().

Agreed.

> 2. But the main question is that I fail to understand why
>    __switch_to() -> switch_fpu_finish() uses the "next" task to set
>    TIF_NEED_FPU_LOAD.
> 
>    I think that set_tsk_thread_flag(prev_p, TIF_NEED_FPU_LOAD) makes
>    more sense.
> 
>    Just in case, note that fpu_clone() sets TIF_NEED_FPU_LOAD, so
>    we should not worry about the 1st __switch_to(next_p).
> 
> IOW, can you explain why the (untested) patch below could be wrong?

I think your patch should work.

> We can even remove the PF_KTHREAD check in switch_fpu_prepare(), kthreads
> should never clear TIF_NEED_FPU_LOAD...

Agreed.

Thanks,

	Ingo
