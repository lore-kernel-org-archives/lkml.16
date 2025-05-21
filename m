Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0600184
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 22:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747865234; cv=none; b=lZkM8ri7YnczQKoiAmWjR+gIsRH3rKeheiDuJ+EIeEBW65FtMkh+dofkZi5YWwmSzXVlfVxd2txRQ0R3JfSpj3X8e1Hk/QhQw6R3W/9EcS+6dLAN7V7kJ9kxAguL5bKFpVihZThthaQangK4cs/2VrN6uiGiYYVumJK1C9xceiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747865234; c=relaxed/simple;
	bh=+rXzt+GT+lDXmT4oTPjPWoBd2sckGCcuhzdy67COaYk=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=a4JHqGVIprfIcyv54SKkpnLLLZkz1dQ6/C4E0qbHiHVTW+YTODHfuCQs9G7oz2NIhBR2NmHY4zcJlUP3Yo+EkYaEqlfCFa2SuPQbqprV3HMGY+rI+uA9PvoW+DYDKNlEHxNEqnsEUjRBNv21J16M8zjoPcYioD5ngX2t7Zz097s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=QMNxsJxv; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="QMNxsJxv"
Received: from [IPV6:2601:646:8081:9485:7c95:989f:44b3:e8c9] ([IPv6:2601:646:8081:9485:7c95:989f:44b3:e8c9])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 54LM6ruY2749864
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Wed, 21 May 2025 15:06:54 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 54LM6ruY2749864
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1747865215;
	bh=CjOo0zXmtel6t6DbXWTSAZVFq+1A5g1xldSWy3rsZAs=;
	h=Date:To:Cc:From:Subject:From;
	b=QMNxsJxvqBe7su4aMNKmnyKIMQw+dBUB94tjab+qwT92m2jHv6yZ73yF0+6CqpI3c
	 nhhlRP95hJcGpEWU3PyTVZwHUIVk6X+YVQPiciX2B6iYWGH93J8TFs4YBmkzfUxatM
	 WjC4eBspPqQXy1TgUI5y+iggXLxy1iBF54damzSa28hNuF8bqWpHgA6yQyG4KRZWVU
	 hWD/T4nci2WYUAsa9k8czOH4xo9KSJfLvJijY6XobVT/sWexgsCWEsqZGWZwAvkrcY
	 1hnL5jt2PwrlyPGSSmYep5C4T1DMkR/2hc2NNaG9u23qWYwZtF2fqgMXA9MT97hQiq
	 2F8Md6T42e7tw==
Message-ID: <fff293d0-1bf8-42de-adea-a7e7ee559777@zytor.com>
Date: Wed, 21 May 2025 15:06:47 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: gdb@sourceware.org
Cc: Andrew Burgess <aburgess@redhat.com>, Xin Li <xin3.li@intel.com>,
        Xin Li <xin@zytor.com>, LKML <linux-kernel@vger.kernel.org>
From: "H. Peter Anvin" <hpa@zytor.com>
Subject: Desired behavior from a gdb perspective for single-step (x86)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

With FRED x86 has the ability for the single step flag (TF) to trigger
immediately after a return to user space. By default, we do that that
when we return to user space after entering the kernel via a system call
instruction of some kind (syscall, sysenter, INT) so that from a user
space perspective, the system call appears as one single instruction (as
opposed to skipping over the following instruction, which is the
behavior with IRET.)

We did discover that to make it work properly in the case of the TF
being used without a debugger attached, we need to clear the
immediate-trap flag in the sigreturn handler, to avoid an infinite loop
where SIGTRAP is taken over and over again.

Our current thinking is that we will clear the trap-immediately bit in
sigreturn if TF is *not* set before sigreturn is called, and Xin
preparing a kernel patch to do that to fix the mentioned infinite loop.

What isn't entirely clear to me is how ptrace should play into all of
this, and specifically, what does gdb (or another debugger) *WANT* the
behavior to be. We have the opportunity to make it "better" than the IDT
behavior, so it would be good to hear what specific semantics you would
prefer to have.

Thanks!

	-hpa

