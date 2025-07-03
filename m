Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0295B22173A
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 15:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751558353; cv=none; b=JgkEHiVMJDkq2HuqW9jhs+KLw0JVJ0fBhk+iQO6wJkk3k9+V96m8Dcj+v52X85++fUZps0rGlGfrT5/VES3vaAuxrBKpp6YYAWmzn390VJfly2s9F9kOU/TR7+v+CDO6HCKgJG8ZJ2xKrEhz6w8U1IlYox3wfVEarzPB95Cg1hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751558353; c=relaxed/simple;
	bh=S2/vYQejGHSatFM71+Ak2Ob/vzkp+bC05d6mwYbWB1U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N7xUNGubP+oxCjEHAWxPLLPC6pdB+soovglEEXi7Bv7AmoRYGgQRi0RuHh7issYiSf76zW6QzHuBLLii2ELPespVy0lYin+RQvpKVgahGLofa2dCwNtiHrfoo08X5+M+k7pG5vE6//wDS40NmLcZ4SBJM2ttHJo8lGZ2L33jXzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V6wu9wK0; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V6wu9wK0"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-735b2699d5dso57709a34.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 08:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751558351; x=1752163151; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TEShNNGw8YA9FF8iT3UXsWuzd6q34qlsvmUa14RxNng=;
        b=V6wu9wK0gRMuyz/Occhb5dLyeZTVbf8gSK2mIjOG81dLBCeYnLRnDyHzWM/XuDxoNH
         lGNKozMCfSZ9AtqDfgbfYTYlTOLxU1AXJ/d5B0N5DBl1LAv6c1zmpBdW6oLQ3RQbxuO9
         0LZtHWbse7DW0V/35Qj2aSRO86PZ4XMnxQ8a5srKdERMX8mPg6zq/OddbddP+aokdBZq
         endRMhg4td7kuHgWJd21BLTopxd3qdm2fXoojeRoJOgY+e8FctJ4rK86yb0Z+vY3IXho
         8yjJrIcfZHhmfGJX6nqjSB36aHPlXKX3mscncqimmFllqjOzi8+STVvd0M4L42xo4PYq
         Au6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751558351; x=1752163151;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TEShNNGw8YA9FF8iT3UXsWuzd6q34qlsvmUa14RxNng=;
        b=E+u7pMSbKc4Hcum6B/0MjJhRYPJJoyJeUeCW4ET8A7V7lbO4ogoRLYPAAkihS/rYZB
         zSYusUoeyEnEnquZtJCMz2BLNXvkisySsqtJTLf93gcOly2TPpacyaFW6wpyMHnbEEEr
         4i7e9jrlZCE7hbpwr9Wjqn/KaxwDbXiQ/aOIustSa68DFk8Z1t9OIvYkGJYnioZHqrPK
         YySK9IzEoBH9HdQaX71cSgWV6yZqnlWnegQtOaF6ND80vFhx4nlYBuYxGwJUgNGJK/8H
         CJ6Cn6URHYDJv/0cl5Rb1D/TcvMxY6Q4mfREFQOKszi8xvrNaXA4VTDxjHXHK3X7wKmZ
         EtKw==
X-Gm-Message-State: AOJu0Yymmbkk4ZDvm/ECg7fioJCfPxJ1w73L6nNoC8Mctc19BJj22GuL
	vv0UlGjb7HjiVlwyYwxvNDNvF/6td/BvJiwYuc3m6G9LKF0hP61ke6x/
X-Gm-Gg: ASbGncvEcOsYXCqQ3r2I0Oz5OJHFp16rVeOYaRZT2jyaKYh49ZBnijkwkhuVHu0ysi6
	iGm3JDe+dl8rXrto8qA+12jo9g6N1rRSR3KuuwyCVfeT3tunKc8SXahYSfQtsv5EFnVjV2Thcvq
	kGXeEOuabxl31wFtFXoeQm71Tpub8THyYJv/1uZiEJs8oYzdKarBhQ7cIp2SIjvcnuvtD7Vst3U
	whO788m0qjEKJw6YMZ8l3tr603/UreP7ObOMrk5y1xeWBT3IsVgNVs8R22Xyt9NNfcdEST6QIM6
	aXAJAGlc1mjzrsm4n7lMCKEeVznhaAEZa8e3MKrJiGff35UKAUAKIzreeFoESMyIeJ6qvuCFiiS
	RNW+Fme78SIbs029AowWcGl6LDdntQC+QZpI9kSSozIPgMg8=
X-Google-Smtp-Source: AGHT+IH3XSWyuRx4s4rWAzGyVmRCzIl6dx+V/4MhE8t8BbqVL+X1lePf0vai1om3aMrYs1aq7sCYNw==
X-Received: by 2002:a05:6830:370c:b0:73a:e90d:5c95 with SMTP id 46e09a7af769-73b4cd6cd74mr5712699a34.26.1751558351027;
        Thu, 03 Jul 2025 08:59:11 -0700 (PDT)
Received: from [192.168.1.7] (syn-067-048-091-116.res.spectrum.com. [67.48.91.116])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73c9f7351cbsm10537a34.7.2025.07.03.08.59.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 08:59:10 -0700 (PDT)
Message-ID: <893b1fd8-9f34-4118-9c53-05a1295850fd@gmail.com>
Date: Thu, 3 Jul 2025 10:59:10 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 0/5] shut down devices asynchronously
To: Christoph Hellwig <hch@lst.de>
Cc: linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Martin Belanger <Martin.Belanger@dell.com>,
 Oliver O'Halloran <oohall@gmail.com>, Daniel Wagner <dwagner@suse.de>,
 Keith Busch <kbusch@kernel.org>, Lukas Wunner <lukas@wunner.de>,
 David Jeffery <djeffery@redhat.com>, Jeremy Allison <jallison@ciq.com>,
 Jens Axboe <axboe@fb.com>, Sagi Grimberg <sagi@grimberg.me>,
 linux-nvme@lists.infradead.org, Nathan Chancellor <nathan@kernel.org>,
 Jan Kiszka <jan.kiszka@seimens.com>, Bert Karwatzki <spasswolf@web.de>
References: <20250625201853.84062-1-stuart.w.hayes@gmail.com>
 <20250703114656.GE17686@lst.de>
Content-Language: en-US
From: stuart hayes <stuart.w.hayes@gmail.com>
In-Reply-To: <20250703114656.GE17686@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/3/2025 6:46 AM, Christoph Hellwig wrote:
> On Wed, Jun 25, 2025 at 03:18:48PM -0500, Stuart Hayes wrote:
>> Address resource and timing issues when spawning a unique async thread
>> for every device during shutdown:
>>    * Make the asynchronous threads able to shut down multiple devices,
>>      instead of spawning a unique thread for every device.
>>    * Modify core kernel async code with a custom wake function so it
>>      doesn't wake up threads waiting to synchronize every time the cookie
>>      changes
> 
> Given all these thread spawning issues, why can't we just go back
> to the approach that kicks off shutdown asynchronously and then waits
> for it without spawning all these threads?
> 

If you mean for drivers to have an extra call like shutdown_start() 
that's called for all devices before waiting for any of them to finish, 
it seems like that would just push the work of spawning a shutdown 
thread onto the individual drivers (unless they just had a single 
command they issue to the device that takes all the time), and 
synchronization might be more of an issue since shutdown_start() could 
be called on a device before that device's children or dependents have 
finished shutting down.

With the async shutdown code from this patch set in place, any driver 
can be fully enabled to shut down devices asynchronously with no work 
other than setting a flag to allow it, and no device will start shutting 
down until its children and dependents have finished.

I think the main issue in the previous version of this patch was just 
that it was taking too long on smaller systems to spawn a thread for 
every single device shutdown, when most or all of those devices were 
shutting down synchronously anyway. This version of the patch solves 
that issue... it should only spawn on the order of roughly 2N threads on 
systems with N async shutdown devices, and it improves the kernel async 
code to make synchronizing to a cookie faster, too.

