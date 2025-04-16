Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F55E1A8F9E
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 08:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744793124; cv=none; b=fbzOsaJRQVjI5oR4cVtP7Mu7GFh91ooKf9PFFUZwNBpZqZCOQXf7I+BnkDdeMg9D9HjgsFVlfgCqgckku8yBrzb9XOT5dF8PW+N8rr++MQL3Z1/XQJ5MozBr17XejeN+Zas1jCaNjVABOZoQ3b35hlJoVxxjzOfyM5De6gGUaj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744793124; c=relaxed/simple;
	bh=7U0tMRP3cRkwaU9kSWjymsTfcQX3Lo9MnZcTIGj2fAQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L3TaWm9Eyq4/6dA4OqtDxzeSqY0WDiNCfj95Lx++nxdCq8iwGunYjQcXH8NSeUXsQbm75AelZ+L1uY9oPBYZsT8hRE3aWfgy8TL1zYht8aq1qadxm9FCfwZVK/X+F77PO3U9wT438iNJPx7Eo1g2B80P36hwL6AeBreELRSpKik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=IOtaqNiy; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="IOtaqNiy"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cfecdd8b2so52851695e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 01:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744793120; x=1745397920; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rm7tG3FOphdGA/j+BS+chZSTAKzpNK7JzyptgTuNxfM=;
        b=IOtaqNiyPnKatFuTBgU+NF331pQrlZI6EsXwn46HKd2FQJFa2t8llUrb86VYcRz9at
         u2QgFXMnsWhXVmZnsmQ6la616pV4Bn7rHOaXdPe0XGEW9sutQmnDVJTZyksXYr9Tc2f8
         hZkPTYugzgfvm8CXyhzLSjVcS5fJCjmcbLHmCv67aS22SIznTETduWmCKVoDvL/hFzFc
         pirwnfTywGp5lMLoP6lRQpwKzMi5rrkhRLbcNZljMCOihXt0HoTSI72li8gBnbJ+o8Tx
         fwpYkDdEY6QffzFYnmF+lQqWmURZbdZRG1c/CHPnbCQdjQZX5Fgg8WgJx0JLuPGJfo/e
         9Zew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744793120; x=1745397920;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rm7tG3FOphdGA/j+BS+chZSTAKzpNK7JzyptgTuNxfM=;
        b=dgqe8UfCtdWJhr1Xz3pVgPyGBn/MUvYqQYI+S1/E88M4NchUxmVQZQJMHJiTb0dP3p
         Ts2rE8ZRN3d2t59QKIb74whaPjMeJu7EN7kKwkjNcd4USFK3hhmH1666bqo3WWMo94nX
         trGOjk//FtgjXluS4iRZt+eSp/Z8N18R0JPQUFeXj3JCCXCerVGgx11usBleA/x5VNPk
         QVX5pTvwFekrU6oPn9YQ4LQYoXLX2a7ZRF07q2vSWxl46fJFYW2IVsPlLaMTwXiRH/TV
         ABl2dc418aPxXBSvDgWn+EJPHP9EtGWclLjPHUdEl3RnuVSeOf8+lHzUFFC5thRFtB1X
         jX0w==
X-Forwarded-Encrypted: i=1; AJvYcCW7kuhdDawDi53X+GUaPcfspjnL/8V1+AQ9h9PQnQx822bQCtk/ZDGSbwXQJdpBb7kjb42TAS0lGvJpM7k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx36QRQQA1CajuMsYwfA1D7ugyZ6XoUYyPoyjqvszFW83sLwDxk
	WPNCAWIDJzdekQpjMaeNMjDi6wvGdGOFzqJLFKXn9tSJuoe8z4uC59Bd3Bu/fAo=
X-Gm-Gg: ASbGncvAaFPm5mfuumz+jEk6ROJPvxvPjAP2cmHsMj6ojum5dvFIzKex+UxJ9EP5kdB
	lxJoLfHwlLEBrLN0KfqrCc0b5I9W3H9halyc9vmPtURpgNVW1yjQF0acTL7HV1+hqXsUsPac0mq
	P18MQh3pVFek/hi3EaoTQoBEjS0Cp07oArt0/HWoyWLB3AretPHQErevJYcHx7h42uahctB/Dyh
	W2YCi/wvH2dbBMy9n3Gq3tlzLeheJ4Axh5SvPKjE2/CPkLlR+4ZOVub5emvUPfT7d3rlIYHx493
	MKI7lDLpzqeoucm2VScHPAaq8vtcxnDqjJpnWb+1JJUMJ9qK0qGt9595SWTrfYIylreTCIdOeUf
	K9wY7q4cbnkRlXphWhw==
X-Google-Smtp-Source: AGHT+IFy5QK43QuY6+hL98yAwj/BBHMpOeHx21JKXIFx4oqw7yW/szR2O/SwGayufdYEXrjfYcb8Wg==
X-Received: by 2002:a05:600c:1912:b0:43c:fee3:2bce with SMTP id 5b1f17b1804b1-4405d6ab5f5mr8481255e9.26.1744793120203;
        Wed, 16 Apr 2025 01:45:20 -0700 (PDT)
Received: from ?IPV6:2001:a61:1350:fd01:ac0d:cf4f:2906:b446? ([2001:a61:1350:fd01:ac0d:cf4f:2906:b446])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b4d3453sm14290285e9.16.2025.04.16.01.45.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 01:45:20 -0700 (PDT)
Message-ID: <e23e72d7-e50b-4a16-b47d-5dcd7cf49641@suse.com>
Date: Wed, 16 Apr 2025 10:45:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usb: core: warn if a GFP zone flag is passed to
 hcd_buffer_alloc()
To: Petr Tesarik <ptesarik@suse.com>, Oliver Neukum <oneukum@suse.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250320154733.392410-1-ptesarik@suse.com>
 <20250325134000.575794-1-ptesarik@suse.com>
 <2025041110-starch-abroad-5311@gregkh> <20250414090216.596ebd11@mordecai>
 <522b3049-8e7f-41d4-a811-3385992a4d46@suse.com>
 <20250416094807.2545efd8@mordecai>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20250416094807.2545efd8@mordecai>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16.04.25 09:48, Petr Tesarik wrote:

> Oh, I do, and that's precisely why these GFP flags are no good. The
> address (and other) constraints imposed by different buses may not
> (and often do not) match any existing memory zone.

True. So we currently have a non-portable series of flags.
It would we better if we passed a hypothetical 'struct mem_constraint*'.
But we don't for now.

> However, zone address ranges are determined statically at compile time,
> or latest at boot time (e.g. arm64). It's too late to adjust the limits
> when you hotplug a more constrained bus at run-time. And I haven't even
> mentioned bus bridges which add a non-zero offset to the address...

Yes. Hence the only time somebody would pass a flag like that would be
on very arch specific code. That means that such a developer would be on
his or her own. Hence I'd say the simplest solution is just to do nothing.

	Regards
		Oliver

