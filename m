Received: from h5.fbrelay.privateemail.com (h5.fbrelay.privateemail.com [162.0.218.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE051E1DE8
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 19:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.0.218.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746819850; cv=none; b=mfLrMD3ZdqZggwYQmtjG9WeFoEmXpeOpIePlDFpTkhaEa0W6/JO3AqP3yVirEev55IEd7lyLRcbTCkFdMjgkUdqFJcqXH/ZhBA5n7Q9tMx/H8QfvXoSxolrhOgbQC37B26KEJZhzrzknkxuaQjvuN6sJGlh1+jq4Y26XtSSeKj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746819850; c=relaxed/simple;
	bh=KLLVOUeBCibDY4KhYwgwtIdy91vQuI+qQGgCU3OAQLU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HmgbtJ0GNfxRrLX5Zked9uzgcOEY80ZdyuqpTnNm6Sj8xRCIUEHjkybVdMf78/3IGWFhvOBX3UMde2Doa8BQPxxTVfQEjNRJKrIOSkMGrQaWp53qfvDpdJRMF9bR0+tFwj5/QR+iutHDfk/qRbMiqkZDptcD7O1SQv0LsqfvyUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kenogo.org; spf=pass smtp.mailfrom=kenogo.org; dkim=pass (2048-bit key) header.d=kenogo.org header.i=@kenogo.org header.b=R9G0RMKX; arc=none smtp.client-ip=162.0.218.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kenogo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kenogo.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kenogo.org header.i=@kenogo.org header.b="R9G0RMKX"
Received: from MTA-05-3.privateemail.com (mta-05.privateemail.com [198.54.127.60])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by h5.fbrelay.privateemail.com (Postfix) with ESMTPSA id 4ZvK9f0K6Qz2xMx
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 19:40:54 +0000 (UTC)
Received: from mta-05.privateemail.com (localhost [127.0.0.1])
	by mta-05.privateemail.com (Postfix) with ESMTP id 4ZvK9T5BSDz3hhVp;
	Fri,  9 May 2025 15:40:45 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=kenogo.org; s=default;
	t=1746819645; bh=KLLVOUeBCibDY4KhYwgwtIdy91vQuI+qQGgCU3OAQLU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=R9G0RMKX+2S8wQK1kSuKHOTc7fdqVFIWbWWmm8VxQp5PpS7R7kjk83Fzng50oFtVO
	 Cr5olttVRJxKuIEVkS3Cdfw5azpYIBQvNrGWa3m/q/hBAUzMlcHIIVhldM74JKrVZT
	 w16eI0Douk9siMHCkCEFALfxTqJmpSOPc4AxiTknHQ2pieuH0mk6D6BxErmXJKUpFm
	 LCeyFInJ8PhOSbtchiRSNeyYqNSPWvoAneS/5oU5AL52FQyrfEqHjkAoBERWBpOIuo
	 hv2yNV2Qm6beV5dPMO7HEY2MmvzO4G0ZCPsa8InCJ0DcNatNHhD2JHAO87tLuRr63z
	 6JWVDfAym3ZKw==
Received: from [IPV6:2a01:599:80c:8378:216:3eff:fe8a:ca6a] (tmo-117-72.customers.d1-online.com [80.187.117.72])
	by mta-05.privateemail.com (Postfix) with ESMTPA;
	Fri,  9 May 2025 15:40:34 -0400 (EDT)
Message-ID: <e598eaa0-3b3b-4c16-9d7c-ff35dd150baa@kenogo.org>
Date: Fri, 9 May 2025 21:40:31 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ntp: Adjustment of time_maxerror with 500ppm instead of 15ppm
To: John Stultz <jstultz@google.com>
Cc: tglx@linutronix.de, zippel@linux-m68k.org, mingo@elte.hu,
 linux-kernel@vger.kernel.org, Miroslav Lichvar <mlichvar@redhat.com>
References: <4a6f1494-c6fe-4f66-a376-b6389538ef9f@kenogo.org>
 <CANDhNCpQLN0j5KBp9OB4LB-YJGCCexFG+v5Zax2wwBn-3Tv3Tw@mail.gmail.com>
Content-Language: en-US
From: Keno Goertz <contact@kenogo.org>
In-Reply-To: <CANDhNCpQLN0j5KBp9OB4LB-YJGCCexFG+v5Zax2wwBn-3Tv3Tw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP

Hey!

On 5/8/25 21:45, John Stultz wrote:
> Have you tried a patch introducing PHI (likely setting it to 15000 as
> MAXFREQ is represented as nsec/sec) and using it instead of MAXFREQ in
> the calculation? Do you see any behavioral change in fixing it, or is
> this just a reporting  correctness issue?

I haven't tried a patch, but I couldn't find any place in the kernel 
itself that uses time_maxerror.  So I wouldn't expect behavioral changes 
within the kernel.  Of course, user space applications may depend on the 
values returned by the adjtimex system call.

In fact, I only noticed this behavior in the first place because I am 
writing a distributed time-stamping program and the maxerror reported by 
libc's ntp_gettime (which calls adjtimex on Linux) just felt way too large.

I'm curious to hear what Miroslav might know about other user space 
applications that take an interest in this value.

Best regards
Keno
