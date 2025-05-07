Received: from h8.fbrelay.privateemail.com (h8.fbrelay.privateemail.com [162.0.218.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8546521B9F1
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 11:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.0.218.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746617319; cv=none; b=mAHmOEWRieH418wx+ldtQWb6+iGtOIxaT0BH26kRqXz/ar+h8E+umEK0HjaZnhD5oDxQs5VUMcYlS0b9PXYb5M7EM8pA1NhCmYxPk0XHZXe0UHeD42vWmjeG9aJsZl1GmwFrgoN28g7Yw7y9/9kV9ccd21FQalJ1Phfh6JZipcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746617319; c=relaxed/simple;
	bh=egT0yKlCDwoRHqLe+MRwanT0SawFfp6yH1Bs4mtm8UE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=DpxVPK8fFU4YMqyWDbVYmxtZQa/KzcDwxOYSSUOL44X1FJbgGKWJ7x9pBMxkIhvf72XR4Pw76kwWKB1VjwvxIe8fEFgCr1VxrMHj2wMBC0AY1BH3TPsCwo8I+osSIr5/vBd4DBVTVLQ0zvyHuo95oMfMZdGCG/kdzwlsDphamEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kenogo.org; spf=pass smtp.mailfrom=kenogo.org; dkim=pass (2048-bit key) header.d=kenogo.org header.i=@kenogo.org header.b=hQMXLtzp; arc=none smtp.client-ip=162.0.218.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kenogo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kenogo.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kenogo.org header.i=@kenogo.org header.b="hQMXLtzp"
Received: from MTA-06-4.privateemail.com (mta-06.privateemail.com [198.54.118.213])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by h7.fbrelay.privateemail.com (Postfix) with ESMTPSA id 4ZstLW12g8z2xYX
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 07:28:35 -0400 (EDT)
Received: from mta-06.privateemail.com (localhost [127.0.0.1])
	by mta-06.privateemail.com (Postfix) with ESMTP id 4ZstLM0C3Vz3hhV4;
	Wed,  7 May 2025 07:28:27 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=kenogo.org; s=default;
	t=1746617307; bh=egT0yKlCDwoRHqLe+MRwanT0SawFfp6yH1Bs4mtm8UE=;
	h=Date:From:Subject:To:Cc:From;
	b=hQMXLtzpQ8F1/5AlOQ9NnBIwI6XEF5hYqiBU7jLQZ90qrzqOtKThqifHMu0hsoXn+
	 F8As0IZyd46yfiU8+E2Yv45wzg6yJMn2KwnrQHkmqgBZMsAWz14+cUDmkQaGoPGgIi
	 QgATDJSStFaEnCNxXInBrxeMvCDNhWP0A3lIE2b+1IJcsFQL7BKvak54/GvWaFQMN9
	 /hcZ7ZfHRGfzB67+jRWnCbjMMlUN8M7/BX/SuaqilqyAjOt0aB5wn3vteW8RppXfQx
	 uXTfzRUcISbmof/raian06v6sRXdul8AIZxaP9HPWPSsCD0a2hp+RE9U78aA12PlU4
	 UOtUtJNIdA75A==
Received: from [100.115.92.203] (nat-141-76-8-158.dip.tu-dresden.de [141.76.8.158])
	by mta-06.privateemail.com (Postfix) with ESMTPA;
	Wed,  7 May 2025 07:28:21 -0400 (EDT)
Message-ID: <4a6f1494-c6fe-4f66-a376-b6389538ef9f@kenogo.org>
Date: Wed, 7 May 2025 13:28:18 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Keno Goertz <contact@kenogo.org>
Subject: ntp: Adjustment of time_maxerror with 500ppm instead of 15ppm
To: tglx@linutronix.de, zippel@linux-m68k.org, mingo@elte.hu,
 john.stulz@linaro.org
Content-Language: en-US
Cc: linux-kernel@vger.kernel.org
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
