Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A05224B26
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 20:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746735381; cv=none; b=TdIdDGuHM0qUyY/FI0Fbko9EDrIIq5xINxJjV29y9gx5vwbahywEwzmMzmUzg8swqDQXN0OoCLpGnHDZUQRI5+bkSEypaarxpUAfvZLMQdStmNROH0C5K/3j142y7TGKBf3/g/gBOP+g3bPY88Jfpa5GHmvrQCglJks/T4k7Rp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746735381; c=relaxed/simple;
	bh=p8Zcxo4J4pFBBrvBfeq2+pMemDmGv98U3CWVoFFZLvg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qx8NAixeWogS3f2I2grTmIoyhSmxee2iIKuxpPHzS6MvimVcNwVFT1LLv02YcdVe1ZEv81gsaUFlHaA0c4w6mgF6CaLQXSxCJvRiH+S+jNV+EM9fLkraAT43xy3byLnXhIkHSnHAFZOeboYxMgFgjeW7Vzl02pqz1oF0Dv5EqbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=iGPsW/gP; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="iGPsW/gP"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=C8UHkk2am11YMFz//N35jiF4QHsdGKv/t5svYIOY4L0=; b=iGPsW/gP5qFCnQFlt3LW9WuoQK
	kRnjrBA9clzkoUsUqWXb13Au06Cz8YsRUfAUIVlRANJfYEscjSqDRxzXoY/GERvPQM/fkjgyZe1z3
	DDBc9FCbYx4p5F4jMnRa0zCAMk+sjrJ4yoj0Lu10Uxr+204lEg5hLU6PsP8r/9W2TsuHUfyy8ErIF
	qrq4lsJ8AYwWtawI6XRHY6B6DueF/KdXBHOhXeH9Sd/1YCwCICyl5cCU3Yfj7Ydu2HQz+tT75Lmg4
	CJ2r7PoXnJr6mB0L6mk5xvtRUF9fcOrf509hc8WrMScznI/WwDkwkvAXmFfMYsh0874SfGT2f8jrK
	6E6EdXlQ==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <carnil@debian.org>)
	id 1uD7ek-006l47-Q2; Thu, 08 May 2025 20:15:47 +0000
Received: by eldamar.lan (Postfix, from userid 1000)
	id A6B1DBE2DE0; Thu, 08 May 2025 22:15:45 +0200 (CEST)
Date: Thu, 8 May 2025 22:15:45 +0200
From: Salvatore Bonaccorso <carnil@debian.org>
To: Larry Wei <larryw3i@yeah.net>, 1103397@bugs.debian.org
Cc: Ben Hutchings <ben@decadent.org.uk>, TonyWWang-oc@zhaoxin.com,
	"Chang S. Bae" <chang.seok.bae@intel.com>,
	Lyle Li <LyleLi@zhaoxin.com>, tglx@linutronix.de, mingo@redhat.com,
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
	hpa@zytor.com, aruna.ramakrishna@oracle.com, pbonzini@redhat.com,
	levymitchell0@gmail.com, attofari@amazon.de,
	linux-kernel@vger.kernel.org, CobeChen@zhaoxin.com,
	TimGuo@zhaoxin.com, LeoLiu-oc@zhaoxin.com
Subject: Re: Bug#1103397: linux-image-amd64: Kernel Panic:
  copy_fpstate_to_sigframe crashes.
Message-ID: <aB0Q8S47iNeD1GOM@eldamar.lan>
References: <4ac9f677-699e-4ef1-b160-9f1c6fe8e820@yeah.net>
 <c566339b-d8d3-4f74-a3b8-8f373fbe3f47@yeah.net>
 <174486226753.86424.3234605951040281675.reportbug@zx2>
 <8bcebb19-17f6-47e6-976a-0c9560795cd7@yeah.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8bcebb19-17f6-47e6-976a-0c9560795cd7@yeah.net>
X-Debian-User: carnil

Hi Larry Wei, hi Ben,

For context this is about https://bugs.debian.org/1103397, and which
Ben did forward in
https://lore.kernel.org/regressions/dddb6b8d56e3f28b914e1e243f948457d53149ce.camel@decadent.org.uk/T/

On Thu, May 08, 2025 at 03:12:31AM +0800, Larry Wei wrote:
> Thank you all,
> 
> I have pulled the newest `linux-next` changes and compiled it, my laptop
> boots well now! https://linux-hardware.org/?probe=271fabb7a4 , but it still
> prints some `WARNING` information at startup:
> https://linux-hardware.org/?probe=271fabb7a4&log=dmesg . May this output is
> useful for you maintainers.
> 
> And, thank you all again.

Going thorough the bugs I notice there was a related upstream
discussion/patch relating to ae6012d72fa6 ("x86/pkeys: Ensure updated
PKRU value is XRSTOR'd")  in the following:

https://lore.kernel.org/all/20250102075419.2559-1-TonyWWang-oc@zhaoxin.com/

There were some followups, but discussion ended on 18.01.2025.

Did this felt through the cracks?

Regards,
Salvatore
