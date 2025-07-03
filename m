Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC37813B2A4
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 13:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751550498; cv=none; b=Mk6feiPzHWOQbWvskH4yxBpRGwVVdE3b/J5J4ZDYMeRuWyWTXzbIM0iehudJCUSXMm60Str4ikOGq0TEmH3qqyKDGeGtOYYR0DGdxZ9bIlVxdArzWB7KKzzc5c8Ze9tzb7zCYqHH1xtYZg3bB0BPWEb6wHWbBVN3sfxlO94EL3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751550498; c=relaxed/simple;
	bh=EfnLWETl1J5M1bL6Y29tMN98S/aXdjr4ysoydW1po4A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P8ZhcDQb/rTEig1vJSpCdCxVMf05MindYSqT3YHhN+P2lLE5S/ywNJsfr+OThhopvNVD3D6viz340bXpJWr/rWL7VIbhga6CM8xsMDc/wkRtQEPDBSUHqosI1WYt6VZEOPnrfOVp6pQo/z3FzhMGfnRwDiGoFmIDQKm3RfIAjfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OqJ4aGtr; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OqJ4aGtr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751550495;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XJrMtFaBP2BGL6npOuum/zHAyGQyeC3LXV3nbl5mRq8=;
	b=OqJ4aGtrJpU+r3avD6ExMNRT1cMO0/T+YtkeXn8j1T+O8/0H4txcrOmrpWc7c9t7lPGuBF
	I6iVfbngRYwH4BRFQWMv9sNAd3C3SEditp0DBIT0JXe0MCnnw4io/zMlwCZ0X3Z64gtBHE
	NCa/PhnfA9GuDsLXuB185IvpWFU9KZM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-589-qe1Zl4-6NaGiN_CDCrzS_Q-1; Thu, 03 Jul 2025 09:48:14 -0400
X-MC-Unique: qe1Zl4-6NaGiN_CDCrzS_Q-1
X-Mimecast-MFC-AGG-ID: qe1Zl4-6NaGiN_CDCrzS_Q_1751550494
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a6df0c67a6so3708198f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 06:48:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751550493; x=1752155293;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XJrMtFaBP2BGL6npOuum/zHAyGQyeC3LXV3nbl5mRq8=;
        b=SN46wA+LBufVYDTWBwnBbKuULlRoY3jvzePtfovqNESwpbVfe+8W/Kls4RnkVR+LDx
         21yFwJqApDCsMSv4huPWCBEIBIFEdc+AVb8eKR3HmrrIxPQM7FsWOFI6vL8DUZo2ryY9
         0/u3UW9p+HEX1U3QcK5plwPuB3GmiiKmqXW16LyTgWgVKy6FXC2e6NlOSyyShRsm8scf
         oIBmwTGmXEEaIcfc0iOKNGyDrdfYXWfDhp9ZJ1guDrI9tMPyXCKcR/0whmhCujuW7nug
         2iKcO48320y67E+ihq/aRo/CCxe4olklW3Ey5+wbOPVRcq5oSn8odFsZ04lGTsQChnZj
         +uzg==
X-Forwarded-Encrypted: i=1; AJvYcCXDpbUYqVuIs4Be7fU/XfddyQ7vZwDNhwTA/UlZCwP2OK3cWwCfqzxjEBVHw7M3LC3hQwNBSC4ZVxUnA3Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbcygKepRQyfK8APBBcGlVpwPTt1Cxeb/6PtOWbSL1PldYEPbe
	iBvcitUBtSsHc8DB+wvBpIavll+iIzFfqqbEz8TtkK9VBkBu9zMdCLQ/VW3pCw13kT3AjceX5ZP
	vl5C9CCKOJv/zxlDUsdcoudYQZ21BsC54duwiXv+DPstrxkcN5QBFOD4KXv1VAb4V6g==
X-Gm-Gg: ASbGncvREaJAgfsJiocWABvhGH8DoeymcemR6f87csl/QA6SH1uwD5BWaYR1FLg2ZUV
	+DoI+8rCQgdsKhai2r53yIT2bqmiTI3g6F0ZqMoM+HKfWQ14B57Eh58OZfYoQfWGtO7+87g7lv7
	KY/G/hJNKBSrmVcc16U6hUcVv01BUuEuAS5vptwFjZFWXCTf9c1E8D/zDgefYIsZZg+VaJR8YCg
	ORfeVaqB+HBRAFlPep1rpE3B/4bPojMssm1LrxYlvkoLgfglJPxWY3LoI1ZHL2ssmVEqm3VdYx8
	yGZcFUIPtDx8YmoXXunVFGWv8rQANpXIIHfoibQtiRIA5GWcz3v1Xp6SUFBqVAhPGzI=
X-Received: by 2002:a05:6000:290d:b0:3a5:2848:2445 with SMTP id ffacd0b85a97d-3b1fe6b5ae9mr6007913f8f.16.1751550493333;
        Thu, 03 Jul 2025 06:48:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFd2kcIWtwK91F48hm7gSXrDxg3r7yvE33vIqHRfIQfbCwGMDKd3QlGq6N3EMfPF5sDl04JmA==
X-Received: by 2002:a05:6000:290d:b0:3a5:2848:2445 with SMTP id ffacd0b85a97d-3b1fe6b5ae9mr6007887f8f.16.1751550492828;
        Thu, 03 Jul 2025 06:48:12 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:270a:b10:5fbf:faa5:ef2b:6314? ([2a0d:3344:270a:b10:5fbf:faa5:ef2b:6314])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7e7098sm18357751f8f.4.2025.07.03.06.48.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 06:48:12 -0700 (PDT)
Message-ID: <4cab9be0-3516-454f-883b-7a999994c447@redhat.com>
Date: Thu, 3 Jul 2025 15:48:10 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [patch V2 0/3] ptp: Provide support for auxiliary clocks for
 PTP_SYS_OFFSET_EXTENDED
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
Cc: netdev@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 Christopher Hall <christopher.s.hall@intel.com>,
 John Stultz <jstultz@google.com>, Frederic Weisbecker <frederic@kernel.org>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>,
 Miroslav Lichvar <mlichvar@redhat.com>,
 Werner Abt <werner.abt@meinberg-usa.com>,
 David Woodhouse <dwmw2@infradead.org>, Stephen Boyd <sboyd@kernel.org>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Kurt Kanzenbach <kurt@linutronix.de>, Nam Cao <namcao@linutronix.de>,
 Antoine Tenart <atenart@kernel.org>
References: <20250701130923.579834908@linutronix.de>
 <faca1b8e-bd39-4501-a380-24246a8234d6@redhat.com> <87ecuxwic0.ffs@tglx>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <87ecuxwic0.ffs@tglx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/3/25 2:48 PM, Thomas Gleixner wrote:
> On Thu, Jul 03 2025 at 12:27, Paolo Abeni wrote:
>> On 7/1/25 3:26 PM, Thomas Gleixner wrote:
>>> Merge logistics if agreed on:
>>>
>>>     1) Patch #1 is applied to the tip tree on top of plain v6.16-rc1 and
>>>        tagged
>>>
>>>     2) That tag is merged into tip:timers/ptp and the temporary CLOCK_AUX
>>>        define is removed in a subsequent commit
>>>
>>>     3) Network folks merge the tag and apply patches #2 + #3
>>>
>>> So the only fallout from this are the extra merges in both trees and the
>>> cleanup commit in the tip tree. But that way there are no dependencies and
>>> no duplicate commits with different SHAs.
>>>
>>> Thoughts?
>>
>> I'm sorry for the latency here; the plan works for me! I'll wait for the
>> tag reference.
> 
> No problem. Rome wasn't built in a day either :)
> 
>> Could you please drop a notice here when such tag will be available?
> 
> Here you go:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git ktime-get-clock-ts64-for-ptp
> 
> I merged it locally into net-next, applied the PTP patches on top and
> verified that the combination with the tip timers/ptp branch, which has
> the tag integrated and the workaround removed, creates the expected
> working result.

I had to wrestle a bit with the script I use - since the whole thing was
a little different from my usual workflow - but it's in now, hoping I
did not mess badly with something.

/P

