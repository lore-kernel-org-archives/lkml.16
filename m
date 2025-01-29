Received: from minute.unseen.parts (minute.unseen.parts [139.162.151.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623A31917FB;
	Wed, 29 Jan 2025 19:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.162.151.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738180797; cv=none; b=fG9WltVsdJVZa0y3MXAXOnO79rYmoh2g90n8ZBevyaXmKRIQ5jHi1RPjOuB+rDhe+eNI4OH3Kb6YmhSFeDwSipiQbD5iJTdiHgeou+NxpjvL6mArmbcTP57H4J32/xoJ5Lm/aDZcJ8sgwduP2HTa4GGc5DRnimEK9vupW4xfzSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738180797; c=relaxed/simple;
	bh=I+bKN7s9uBkWpMU0jsE0H60Wc8zpOjDztmgKixc0nvk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d+dfxEGXJpdA18W5drTZqcyvUiTM1WRnxmHcWgS8S9m7Uo6hS/ZeeI/Tob5jW8rzcAvEeyO6vUFlYfhhmVR5JXBbEYeK6ZL3JNvr9SLyzOydsXCtxwq0RzV/cd+YrdP2Q8Twm0Zi71XCbBKP/BRCNDkZ+2MYPlm1gZEqHL8MtQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=unseen.parts; spf=pass smtp.mailfrom=unseen.parts; dkim=pass (2048-bit key) header.d=unseen.parts header.i=@unseen.parts header.b=Syv6ljJh; arc=none smtp.client-ip=139.162.151.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=unseen.parts
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=unseen.parts
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=unseen.parts header.i=@unseen.parts header.b="Syv6ljJh"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=unseen.parts; s=sig; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=9BxaBo5Og8VoUk5VDcjNkNZjrnEBrbEZy9fdgk00MRg=; b=Syv6ljJhlkac3RLHXRSLoNAtne
	Z6XJ0xqAr+T0LlAz+8WzyifFkquGVgzYKd+GnNMzH6VPfWlNHqoM/3LB0oH4dWyDGCyqqG17qx+5P
	B0e9YJQEkfcrIF61CYk+ceBWfE0Cr32Ki8BBSgHYaaW7PbstD8t505IY9DYyub3fuAe3ygBhxJ/Gn
	hNxS47tNpjxnW1dJdfL1ieKJ9ZIK0l8pEROCJCuYb+7nk902IbI56DxQqSngU4ai25phUmVu/VqPH
	9K4ECjzbwSC1DqDrSxew9oG1NMX8g41TsEAj/nQF6ZnQQcCsBU8eXTMQolFgbEZFm25gd0kQ6uiDh
	mXCIu1IA==;
Received: from minute.unseen.parts ([139.162.151.61]:52232 helo=minute)
	by minute.unseen.parts with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <ink@unseen.parts>)
	id 1tdEDq-00087Z-13;
	Wed, 29 Jan 2025 20:59:38 +0100
Date: Wed, 29 Jan 2025 20:59:36 +0100
From: Ivan Kokshaysky <ink@unseen.parts>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>, Oleg Nesterov <oleg@redhat.com>,
	Al Viro <viro@zeniv.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Magnus Lindholm <linmag7@gmail.com>, linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] alpha/uapi: do not expose kernel-only stack frame
 structures
Message-ID: <Z5qIqHmpxnRpXC35@minute>
References: <20250129094312.27399-1-ink@unseen.parts>
 <20250129094312.27399-2-ink@unseen.parts>
 <284bc1ed837f0994114534ae7e3d4f6cc0d64f4e.camel@physik.fu-berlin.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <284bc1ed837f0994114534ae7e3d4f6cc0d64f4e.camel@physik.fu-berlin.de>

On Wed, Jan 29, 2025 at 07:32:11PM +0100, John Paul Adrian Glaubitz wrote:
> Hi Ivan,
> 
> On Wed, 2025-01-29 at 10:43 +0100, Ivan Kokshaysky wrote:
> > Parts of asm/ptrace.h went into UAPI with commit 96433f6ee490
> > ("UAPI: (Scripted) Disintegrate arch/alpha/include/asm") back in 2012.
> > At first glance it looked correct, as many other architectures expose
> > 'struct pt_regs' for ptrace(2) PTRACE_GETREGS/PTRACE_SETREGS requests.
> > On Alpha, however, these requests have never been implemented;
> > 'struct pt_regs' describes internal kernel stack frame which has
> > nothing to do with userspace. Same applies to 'struct switch_stack',
> > as PTRACE_GETFPREG/PTRACE_SETFPREG are not implemented either.
> > 
> > Move this stuff back into internal asm, where we can ajust it
> > without causing a lot of confusion about possible UAPI breakage.
...
> This seems to break the build for the bpf tool on alpha:
> 
> In file included from libbpf.c:36:
> /build/reproducible-path/linux-6.13~rc7/tools/include/uapi/linux/bpf_perf_event.h:14:28: error: field ‘regs’ has incomplete type
>    14 |         bpf_user_pt_regs_t regs;
>       |                            ^~~~
> 

Good catch, thanks!

I wonder if bpftool ever worked properly on Alpha. Will check...

Ivan.
