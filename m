Received: from h8.fbrelay.privateemail.com (h8.fbrelay.privateemail.com [162.0.218.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3741B1DED52
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 09:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.0.218.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746609327; cv=none; b=elwkQ6+DT+RApmuZ77l5IZzPCJKsX9qIi5CnFzEFcvbOMa9xyuUh/lIV+5Bnw+O068MkZHhcP1TpY2gHg8BZlOF8/S/jeh8zpMQgfgzOh8fVKgw0LligG5NKkHaxlieMPPkdghzLZCpZnfagMs4AnrD5RvfJ28ZXaJEHNIKzvCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746609327; c=relaxed/simple;
	bh=egT0yKlCDwoRHqLe+MRwanT0SawFfp6yH1Bs4mtm8UE=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=jhdXNDvD61ZhoMRpnRnoxZ7aJWf23O7BrFlm0E7knUVDtXPgnB3uA7zYqxDmDYC60m/1sLi1fI0o4FzAwaBue11foSsFbNb+tQT1CiIqY0BADrH/IxKERgD1JSzXFTA96VmSNHUlxtGNMujtq4bIlaPvMqjGS45Q9BesnMjBcKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kenogo.org; spf=pass smtp.mailfrom=kenogo.org; dkim=pass (2048-bit key) header.d=kenogo.org header.i=@kenogo.org header.b=biZnOZNI; arc=none smtp.client-ip=162.0.218.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kenogo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kenogo.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kenogo.org header.i=@kenogo.org header.b="biZnOZNI"
Received: from MTA-08-4.privateemail.com (mta-08.privateemail.com [198.54.118.215])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by h7.fbrelay.privateemail.com (Postfix) with ESMTPSA id 4ZsqNp613zz2xFV
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 05:15:22 -0400 (EDT)
Received: from mta-08.privateemail.com (localhost [127.0.0.1])
	by mta-08.privateemail.com (Postfix) with ESMTP id 4ZsqNf65Dwz3hhVf
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 05:15:14 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=kenogo.org; s=default;
	t=1746609314; bh=egT0yKlCDwoRHqLe+MRwanT0SawFfp6yH1Bs4mtm8UE=;
	h=Date:To:From:Subject:From;
	b=biZnOZNIx4HeYWxnfWP5ZlETzlGzf0Qj6yKKxbspsW0WCW6c8anQsDF6iG4QfsjmZ
	 PpQnJ3xv2d8xp0d10nZdqaG9TnD8ow0kSFecKHbPS2uPJxGuDAQewSft+XLV7y6C+X
	 n2ZNf0RxdOk8FfhkYAkGZjA3k1IbbSi5vKkdIKLqpB1UaqeAhWQeUd0f5T2fUcN2Iv
	 +wGNnSyDKQGrV4vnOdRPgdogprgJmvf7vv3F7JabyTz1XrvOgHKkSSRqc3mccaeqZB
	 wus3hqN5OQvu0Ga+oIMO422mdayHpeddLW3PDQSscJLKWd9K8ysgrCNL5i0hb8pBTQ
	 +ElspbD+MvFCg==
Received: from [100.115.92.203] (nat-141-76-8-190.dip.tu-dresden.de [141.76.8.190])
	by mta-08.privateemail.com (Postfix) with ESMTPA
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 05:15:14 -0400 (EDT)
Message-ID: <fed2cedc-0458-4dfe-9e14-6d64be618165@kenogo.org>
Date: Wed, 7 May 2025 11:15:12 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-kernel@vger.kernel.org
From: Keno Goertz <contact@kenogo.org>
Subject: ntp: Adjustment of time_maxerror with 500ppm instead of 15ppm
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP

Hello,

I've been looking into the kernel's NTP code and found what I understand 
to be a deviation from NTP as standardized by RFC 5905.  The 
documentation of this part of the kernel is pretty sparse, so there may 
be some motivation behind this that I don't know of.  Perhaps someone 
with more knowledge can explain this.

The doc string of `struct ntp_data` states that `time_maxerror` holds 
the "NTP sync distance (NTP dispersion + delay / 2)".

ntpd indeed sets this value to what RFC 5905 calls the "root 
synchronization distance" LAMBDA.

In RFC 5905, this LAMBDA increases over time because the root dispersion 
increases at a rate of PHI, which is set to 15ppm.  Running

$ ntpq -c "rv 0 rootdisp"

a couple of times confirms that the root dispersion reported by ntpd 
increases with this rate.  Consequently, so does the root 
synchronization distance LAMBDA.

However, the function `ntp.c:second_overflow()` instead increases the 
value of `time_maxerror` with the rate MAXFREQ, which is set to 500ppm.

This leads to standard library functions like ntp_gettime() reporting 
much bigger values of `maxerror` than ntpd is working with.  This can be 
confirmed by running

$ adjtimex -p

a couple of times.

MAXFREQ *can* be found in the reference implementation of RFC 5905 and 
is also set to 500ppm there, but it is used in a different context: 
MAXFREQ is an upper bound for the local clock's frequency offset, while 
PHI is an upper bound for the frequency drift of a clock synchronized 
with NTP.

At least this is my understanding.  Can someone explain this?

Best regards
Keno
