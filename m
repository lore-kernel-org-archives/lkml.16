Received: from ombertech.com (ombertech.com [74.48.158.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65587EED8
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 02:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.48.158.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743818992; cv=none; b=fWgSzxtlACfUF7xwuZEDYY3zHe2c7r16s5qpxk6O1IsdJ+64O94/v/jfp49ciF7R7QxZGGzrAVpYPxWgo4CWTLY/Fek4oo0tYcyKtSS3jMsxWtAFFNTWjgsswX+3JFdqTsLAy7SS+WV15WUReg4chjDa/u+GgGYJvyZUgJ7Ee/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743818992; c=relaxed/simple;
	bh=Mi0wOvC1D34aKNLV9iycWbVPaivaA/gFewasr9abd58=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=OjKHYv4B4VVPP7UPdeX+ikCMaPl/YbfF28C89ocGMy5bxYYsQgM5IrZUDTxwvR95tpP13+iaXaJOfs+P45uoXHyRlzMxvDQIp48FuDYprfphpNx2kSx92uIxxRJhgAc4scjNWP9ANg6SkgrMykXvyeYmFczckT36mnNRxCrbwmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ombertech.com; spf=pass smtp.mailfrom=ombertech.com; dkim=pass (2048-bit key) header.d=ombertech.com header.i=@ombertech.com header.b=j1Y8K2sO; arc=none smtp.client-ip=74.48.158.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ombertech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ombertech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ombertech.com header.i=@ombertech.com header.b="j1Y8K2sO"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ombertech.com; s=2022;
	t=1743818258; bh=Mi0wOvC1D34aKNLV9iycWbVPaivaA/gFewasr9abd58=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=j1Y8K2sOpdVvmFb2pZtvcdaZHhOgoE68iKt2lbKA6XDLCQrTjhExS7tWMbMFu1r9r
	 mlSsAMgRmeqtdjv/4Bd3SeDD1T1SQSUoG7ZIc+wk/bFL+y25W/SxVrnUwVlRHrjTms
	 iJCdTnoLgp1xia8vPGfHWzVE7Z480vYAYt3dgPRHESfYCIot78jJPBNhbE1Izemxbv
	 FdLXkulBW1XAg9aSQL/B7VAYgKTqU9nkRZtnlohTuYpJWbSEe9wnT+fdZCXAPe+40N
	 xrwAOGlkTRXcb7lt4LQW4viKdJw7KuiIYuZwU4p1vDfoGrcD0p4nINCjr4EsCz8iC9
	 DAtDTefooYn7A==
Received: from 192.168.1.100 (unknown [1.145.245.115])
	by ombertech.com (Postfix) with ESMTPSA id 227C85BE68;
	Sat,  5 Apr 2025 01:57:36 +0000 (UTC)
Date: Sat, 5 Apr 2025 13:03:06 +1100
From: Kevin Koster <lkml@ombertech.com>
To: Oerg866 <oerg866@googlemail.com>
Cc: linux-kernel@vger.kernel.org, Borislav Petkov <bp@alien8.de>, Thomas
 Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Dave Hansen
 <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>
Subject: Re: [PATCH] x86/microcode: Fix crashes on early 486 CPUs due to
 usage of 'cpuid'.
Message-Id: <20250405130306.ca9822c1f27db119cc973603@ombertech.com>
In-Reply-To: <CANpbe9Wm3z8fy9HbgS8cuhoj0TREYEEkBipDuhgkWFvqX0UoVQ@mail.gmail.com>
References: <CANpbe9Wm3z8fy9HbgS8cuhoj0TREYEEkBipDuhgkWFvqX0UoVQ@mail.gmail.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 19 Oct 2024 08:29:04 +0200
Oerg866 <oerg866@googlemail.com> wrote:

> Starting with v6.7-rc1, the kernel was no longer able to boot on early
> i486-class CPUs.

Thanks for this patch! It solves my problem with kernel 6.12.11
rebooting at start-up on 486 CPUs, which had me puzzled. (tested on
AM486DX2-66 and CX486DX4-100)

Is there a reason why the patch wasn't accepted? I've proposed using it
for the Tiny Core Linux distro's x86 kernel builds, which target 486DX
and later CPUs.
