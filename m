Received: from smtp.smtpout.orange.fr (smtp-27.smtpout.orange.fr [80.12.242.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0712475C2
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 17:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746464612; cv=none; b=X0C8lKzZNMNUC7NCv6JIBI2ue3xXNT1UGS3yL4OtsLnOUvoyeBh1SWW4lFykyddbYzH+EKw0RujvFtzLA/lkw7dntHw0RXIJmjNZMMkAYQPJ0BLkjelXm0NASg4djsbNBW+h7J4JaWIV7CP79m9Q6QRUdl3uy8ty7ywOl/0NyyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746464612; c=relaxed/simple;
	bh=O8rOdQGd3Qx25ktSEiI9XBLByA8iYv7K7x8QfZ7aXm4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mYQAW3uHYx4oF2tRNTjDLSOvhraT8bBOITsoWWOVG7xyO8FTteS3KRLT+cmgyPfOngYLdIOAwPyk4xjFrx4jbuALLGs+33kaljW6gzxGRbFrx4iwVjUzr1CqEg3muk5yvH0o+42C1rTajQDbUCbUcrkmtX2Qa/qvB6Qbom7UYS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=PJoNYaOk; arc=none smtp.client-ip=80.12.242.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="PJoNYaOk"
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id BzCjukjVgnnhRBzCjuPOCm; Mon, 05 May 2025 19:02:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1746464532;
	bh=WvsrgFA+w+aYl14yXnX6A0AN1m8LCt/V06vhbcxA7PA=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=PJoNYaOkJlHxJzmZEp3gtHI28+qoZi5Tq3TeIQ40ZwPWXEaX356XZ8oYAUGEaYMhJ
	 tkRCRGTCTpupYCV1IzXiQXJHiM2eBWvNfiswKqHTfvtqoHeE88NKKJBI/XEo25v+3r
	 l4PHmQwfILHx0sowK3JF4gjKp1vyjazmZAgy9UV/9ZAdcl3B98AbCUabPjgaN+L7F1
	 fj20q8sS+UO/QoUGMyrzvJ/L4GZR3fkLB5FVtjHBFYTI8yYeW2EKCz86hXWZmlTwMj
	 0tdefDRLb0PAt22IkqU2cMZ5qR0oMn60/NIpYK2JSTvylqSoiPWx8r0fGHroNIvzK7
	 hiDST/WDKPf2Q==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Mon, 05 May 2025 19:02:12 +0200
X-ME-IP: 90.11.132.44
Message-ID: <fb94c25d-80af-41c5-a4b7-230dcd0f1d64@wanadoo.fr>
Date: Mon, 5 May 2025 19:02:09 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] locking/mutex: Mark devm_mutex_init() as __must_check
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>,
 Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>,
 Will Deacon <will@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
References: <20250505-must_check-devm_mutex_init-v5-1-92fa4b793c6e@weissschuh.net>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20250505-must_check-devm_mutex_init-v5-1-92fa4b793c6e@weissschuh.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 05/05/2025 à 09:59, Thomas Weißschuh a écrit :
> Even if it's not critical, the avoidance of checking the error code
> from devm_mutex_init() call today diminishes the point of using the devm
> variant of it. Tomorrow it may even leak something. Enforce all callers
> checking the return value through the compiler.
> 
> As devm_mutex_init() itself is a macro, it can not be annotated
> directly. Annotate __devm_mutex_init() instead.
> Unfortunately __must_check/warn_unused_result don't propagate through
> statement expression. So move the statement expression into the argument
> list of the call to __devm_mutex_init() through a helper macro.
> 
> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Hi,

	git grep ^[^=]*devm_mutex_init

returns:
	 drivers/leds/leds-lp8860.c

Based on -next, it would break.

Should it be patched first?

CJ
