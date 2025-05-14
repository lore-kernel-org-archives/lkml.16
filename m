Received: from h8.fbrelay.privateemail.com (h8.fbrelay.privateemail.com [162.0.218.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FDB129A78
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 10:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.0.218.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747216949; cv=none; b=buao3oJQaCGwpZmVWUitVRcM6veuV/8X83OtuEtISwsaosQwFw/NcOjGlUFr+X4Rlk7oKzAhocR0aVa8XbnxJ75jNSPfFRoOV1JA2on/tAPeIAQcwMoxtkXIOz+msK3ADY+uYpwhspSu8qAUnrw29Lo0/vpXatgvJN7Bvr35cgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747216949; c=relaxed/simple;
	bh=LMjrgo6nnRT1Si/xieM+szRblaLay1q8zZ96Ll/EHaI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a/5wK8nzfyw+x4wNyC5z5xSQUTKZX9kdNHzvqEBrERBFg2kRPzkkPo9hk/wRcrBu3+yDa7ZWSnh+M9xiuH6pElA2CFOaSb+wLY2aSg+1TnMO5m82jpZCKxlpcMssXEhWSus2srHw1Oxhf2udKvDJQxqF9LxFdhsKf2MvYxICNkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kenogo.org; spf=pass smtp.mailfrom=kenogo.org; dkim=pass (2048-bit key) header.d=kenogo.org header.i=@kenogo.org header.b=DhEs2zck; arc=none smtp.client-ip=162.0.218.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kenogo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kenogo.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kenogo.org header.i=@kenogo.org header.b="DhEs2zck"
Received: from MTA-11-4.privateemail.com (mta-11.privateemail.com [198.54.118.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by h7.fbrelay.privateemail.com (Postfix) with ESMTPSA id 4Zy85h0qP9z2xBV
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 06:02:16 -0400 (EDT)
Received: from mta-11.privateemail.com (localhost [127.0.0.1])
	by mta-11.privateemail.com (Postfix) with ESMTP id 4Zy85X0vnxz3hhbw;
	Wed, 14 May 2025 06:02:08 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=kenogo.org; s=default;
	t=1747216928; bh=LMjrgo6nnRT1Si/xieM+szRblaLay1q8zZ96Ll/EHaI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DhEs2zckBEi+dZXm/0TCGNAzZGkLZMg04oBnWs5jxw29zoKNvz4y9fd8fKNiY01Nk
	 s/JxGnajt8Wq4BGhIZ3+G+utglsjdyykCC7sYPso7mvWUH5P2ivQyzGlsIsyOVcviZ
	 bBkhGYfEKaD6iHmV2HJV4CLpVN96m5PFxneteS3BCEl6kildCvc7mb4WItcR1/bVad
	 nzUu3om2cxujKZQRP7VSk9aAtHbWvmUxMG7U/P3DkVaAAYIWvKHIl5i1K2F9GTyEKB
	 CEc5YW797P/LGFTnOc0QHtBbAz7fS5LioMexSeyjvLWCb4NMzSnqPUepK5n00hP44b
	 LLtaTv66+VSXA==
Received: from [100.115.92.203] (unknown [89.186.158.1])
	by mta-11.privateemail.com (Postfix) with ESMTPA;
	Wed, 14 May 2025 06:02:01 -0400 (EDT)
Message-ID: <2bae6a59-b6da-40dc-99bb-46a098cdd6cb@kenogo.org>
Date: Wed, 14 May 2025 12:01:58 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ntp: Adjustment of time_maxerror with 500ppm instead of 15ppm
To: Miroslav Lichvar <mlichvar@redhat.com>, John Stultz <jstultz@google.com>
Cc: tglx@linutronix.de, zippel@linux-m68k.org, mingo@elte.hu,
 linux-kernel@vger.kernel.org
References: <4a6f1494-c6fe-4f66-a376-b6389538ef9f@kenogo.org>
 <CANDhNCpQLN0j5KBp9OB4LB-YJGCCexFG+v5Zax2wwBn-3Tv3Tw@mail.gmail.com>
 <aCG4El4aub9TEKWo@localhost>
Content-Language: en-US
From: Keno Goertz <contact@kenogo.org>
In-Reply-To: <aCG4El4aub9TEKWo@localhost>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP

Hey,

On 5/12/25 10:57, Miroslav Lichvar wrote:
> This 500 ppm increment goes all way back to the original nanokernel
> implementation by David Mills, on which IIRC was based the Linux and
> other systems' timekeeping code:
> https://www.eecis.udel.edu/~mills/ntp/html/kern.html
> 
> I think the idea to use MAXFREQ (reported as tolerance in timex) was
> to cover the case when the clock is not synchronized at all with the
> frequency offset set to any value in the +/- 500 ppm range. The Linux
> adjtimex also allows setting the tick length, which gives it a much
> wider range of +/-10% adjustment, so that is not fully covered.
> 
> Changing the hardcoded rate to 15 ppm to match RFC5905 doesn't seem
> like a good idea to me. The kernel doesn't know how well the clock is
> synchronized and I'm sure in some cases it would be too small.

Thank you for these insights!

The site you linked references this RFC, which describes the kernel 
model for timekeeping as used by the Linux kernel.

https://www.rfc-editor.org/rfc/rfc1589.html

Just skimming this document really helped my understanding of what's 
going on.  It also includes a more accurate description of time_maxerror:

> This variable establishes the maximum error of the indicated
> time relative to the primary synchronization source in
> microseconds. For NTP, the value is initialized by a
> ntp_adjtime() call to the synchronization distance, which is
> equal to the root dispersion plus one-half the root delay. It
> is increased by a small amount (time_tolerance) each second to
> reflect the clock frequency tolerance. This variable is
> computed by the synchronization daemon and the kernel, but is
> otherwise not used by the kernel.

In RFC 1589, time_tolerance is set to MAXFREQ by default and can be 
changed by the kernel.  The Linux kernel does a hard-coded adjustment of 
time_maxerror with MAXFREQ instead.

A quick fix would be to change the misleading docstring of time_maxerror:

> Maximum error in microseconds holding the NTP sync distance
> (NTP dispersion + delay / 2)

I think something like this is clearer:

Maximum error in microseconds.  The NTP daemon sets this to the root 
synchronization distance (root dispersion + delay / 2).  It is then 
incremented by MAXFREQ each second to reflect the clock frequency tolerance.

Best regards
Keno

