Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A3C1E492
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 07:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743407856; cv=none; b=u/xs7iZurGwAXwD8wMUm3LaE+R+fcoRtSLP8YapaHoh3jfhSlnmdo8tB65CWrMHl6v/nKG8Ym70kBX+6duvpgbPU5cUn0Zow2ueCAwMxoI/foXDyR3/wppitBtWXddQJd6pB366LIswxL0UcG6c0fmF+jeEGUr/BcMEEM709WJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743407856; c=relaxed/simple;
	bh=ztdKylfaOPR2bWLuffoCWs6msMuBIoQC05CVlmj9hAU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=nLRcJ5OIiXgTUbtHppvxUptA6zNONPijCRMu3jhPg1fwQMRTOj7B+b37cnjgQ/kKg6FDW40e6MmyA79pj+4LCz3sVu24hiz/CF43YjESsqQVfqBjKYYALs8Aesw4JMtOu8yqaC/q02YQrnd2dSvC3ZlGeG/qWXg2AP735DO6ct4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=PgLlqdib; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="PgLlqdib"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=In-Reply-To:References:To:From:Subject:Cc:Message-Id:Date:
	Content-Type:Content-Transfer-Encoding:Mime-Version:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=WbNaBMRffd1cuETaW84fUJxr1cT/KME73I7nEiQPdMM=; b=PgLlqdibyFcOyQhgFTfYDgJvaW
	qtYnHqxmpTj3zZm1Artv8boPsbA+PH47grvkmcb7iicuiD3xlVNA3acx0q5swg12alMpk4IgYOQyS
	WSKNa0AYxtZhGCrUx/qFkj8vJa8UH2ioUlPfEmGr8hj8b3UQi9F6q6KteUHOY+JVA9Wt6Yj9UZUsu
	XpokjDiIWSMzM1CqkTOC3G3b5hKbp3fqJhHR0zuy5yi7I8BdZfrYcogii/2Y8T3SL6JFZNRe+szmq
	exMGajXE1vhTyrFFKp2mlKTSXQWU5/fdNkiRBBY9cGu6nXbQ9BapuckgFhCVAshgEvuyopsGZ/pQd
	0iCjd6sw==;
Received: from i59f7adb6.versanet.de ([89.247.173.182] helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1tzA1I-0096Bo-B1; Mon, 31 Mar 2025 09:57:20 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 31 Mar 2025 09:57:17 +0200
Message-Id: <D8UAHZY0DJ19.18319MPVM5SPC@igalia.com>
Cc: <linux-arm-kernel@lists.infradead.org>, <will@kernel.org>,
 <linux-kernel@vger.kernel.org>, <kernel-dev@igalia.com>
Subject: Re: [PATCH] arm64: Don't call NULL in do_compat_alignment_fixup
From: "Angelos Oikonomopoulos" <angelos@igalia.com>
To: "Catalin Marinas" <catalin.marinas@arm.com>
X-Mailer: aerc 0.20.1
References: <20250326133521.13637-1-angelos@igalia.com>
 <Z-bzOrF-4lSykkgJ@arm.com>
In-Reply-To: <Z-bzOrF-4lSykkgJ@arm.com>

On Fri Mar 28, 2025 at 8:06 PM CET, Catalin Marinas wrote:
> On Wed, Mar 26, 2025 at 02:35:21PM +0100, Angelos Oikonomopoulos wrote:
>> do_alignment_t32_to_handler only fixes up alignment faults for specific
>> instructions; it returns NULL otherwise. When that's the case, signal to
>> the caller that it needs to proceed with the regular alignment fault
>> handling (i.e. SIGBUS).
>
> Did you hit this in practice? Which instruction triggered the alignment
> fault that was not handled by do_alignment_t32_to_handler()? Standard
> LDR/STR should not trigger unaligned accesses unless you have some
> device memory mapped in user space.

Yah, I've hit this in practice. The offending instruction was an ldrex
to an unaligned address, while running 32-bit code on an "Ampere(R)
Altra(R) Processor Q80-30 CPU @ 3.0GHz". Fixing the unaligned access in
the program is one thing, but this resulted in multiple oopses in CI.

>>  #define REGMASK_BITS(i)	(i & 0xffff)
>> =20
>> -#define BAD_INSTR 	0xdeadc0de
>> +#define BAD_INSTR	0xdeadc0de
>
> Unrelated change (white space I guess), please drop it, not worth
> fixing.

That snuck past me in an amend, will send a v2.

Thanks,
Angelos

