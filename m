Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7143E1E9B12
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 08:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743495165; cv=none; b=B6mF9UonWnqNm0HtCD9A7uJm0nf8xtBgIzM5VV1ngyQkEqk6WJQV2jmGhNFO0AjBVUkHaXslj+G30n5zPXaXKfLWgauCOLqH8RuquelbPsXA9p8KjHM7NeuYt50fiS1kx1K77l2kPUCTO2t7l9Btdx9wcsH/fWk8OUmXcselzzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743495165; c=relaxed/simple;
	bh=Q7BKqapfD6AxdJDkjzeoVlhT6jorL6pZj/n+hnRVzrc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SciPKocoImbGxVo7bY2vas1MuKVPCX3v0Fx/gsGgX2z75bjnqKAksaT2777opJh6Sl7p9er7qvkFWHsnrH/lP3rjp8GMsWopB1MLpVRPA2GKBvDEht0cbyU+CPqncb7p0MeyUKzAjyFl2SfvC4vFEOzUVUZPLOsqTKS4iqjmMZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at; spf=pass smtp.mailfrom=sigma-star.at; dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b=Pa9GrgQY; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sigma-star.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b="Pa9GrgQY"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so31622085e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 01:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1743495160; x=1744099960; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4p3P+1/911O4XZnCq9FVI9Zjtz1ACANtbEDZFOoYNIQ=;
        b=Pa9GrgQYV0vw/MfwYWGt780JsX0dxDwb9VSjc3BptMrPdypWT4MOTQYcdaT3hr6P75
         e/n7NqfsyvNP4qKvbeAiTncdMVIQetF1fw+5vIHEwx5FstZ2zwJY2z62y3fqzbLgNRkQ
         BZBLJGJhA+41MwCoPp/cMHJiVRqcP+w1BiRRTaHkE0/bGjYH0FtN2TkUd/MwIV0hCC7H
         WH/A/+tCRQmKYSxtktGwRw6c2ztmP0fBLaMVyNYOGwNJOuPqKJ5u/x6p+1LKXoIEpI1K
         g/QkvxSEoJyXiLNcr3+tKkiCNZnYHMFcwLJK9Nuq9Pkj8igyknuffjyiL7zw70j7YSU3
         fjBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743495160; x=1744099960;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4p3P+1/911O4XZnCq9FVI9Zjtz1ACANtbEDZFOoYNIQ=;
        b=PhZSVDh25YoRJ5+83bz4xu6xpiOgL3rf6vSq44bt/jx+1r2TOtYIzFAZ5zZnQoxCxj
         hrsjYa/XKuUNxh7EvMrIkqvLCHkQfoMakH4FRUIo2BqF0beEyF6L94514cQuWGlco+N6
         Eqrt6I/CJqAMqb7STJHyhqRQWWwc9bPGRmmem2ni3PsgSHL7dRASdNmHGcr7pcpgwqnb
         0dSxJsMKd1mnvOnz4xu+W5+adm5r4X0G1TLqsvlnabukGoU18fVzpZLuyb/9ogIWhajD
         ZMTf8J6DoUmXP2tk6KviVhtoQAw91JtHGVe4ZGRR2uasJRcxG9xQugr12rvDPpNBuLiH
         CdGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGrDFbM8LdszyJx5QFDz3uPDObcIuuE3g38g0gJTvSco3F0TrLRDLoYxnKWbjlZZnPXQQAnKG7EtxOjhk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKkf37hly78shiQ1C6NSS8/OriAPP7PRlsJyoHdsO7MclJQpv4
	p0xEeM4n1QjoLX8VchZ7v4ZTDBjiCEJdT9yYGd0ZcHy4XR9PE7VmwZAmJsl4GFA=
X-Gm-Gg: ASbGnct64xVAZuHttFE97JRsnquDv2yCHU/q3UgxOUoZAIcW/djoeTytrEx5ThhnvPa
	SyBmSZkbD1/ystPRieKqHI17OsbW4TT0EPELRp0UrDuZfLNsbBVFnRMX/5g+NpoMtJ/fQjRAF9N
	YkSjT6xaohKWnVVEnJa0JaXotTXAhc8XDIEaYJ1H/q/dqubrUu5uYWxbw2mtjkbWqI5pJ4D0rKk
	CgfJAD5jqXIkxh0IIxq5HJkl4sNERGVE/sG/vuS/VPLBNTZP0RHpgKzrRzvigxf4qNPjuf4/TXC
	zmr6CukJviYiADE3kqtYsb22mBpzOkrs/JugY9+R+U8AEl7cNoD570nBrSfOH5k5U9U=
X-Google-Smtp-Source: AGHT+IHPsofN0L3NqyV7NNJjLnBN+caNMjZHK7Rek25KHBJOQORDn/np2fxXKpMa9Y0VNxWPeQRZFw==
X-Received: by 2002:a05:600c:1912:b0:43d:fa5f:7d04 with SMTP id 5b1f17b1804b1-43dfa5f7d37mr109437685e9.16.1743495160467;
        Tue, 01 Apr 2025 01:12:40 -0700 (PDT)
Received: from [10.115.255.165] ([82.150.214.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d830f5f56sm195318935e9.26.2025.04.01.01.12.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 01:12:40 -0700 (PDT)
Message-ID: <9187e9a3-fb93-4927-b02f-7f41176f844d@sigma-star.at>
Date: Tue, 1 Apr 2025 10:12:38 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] net: dsa: mv88e6xxx: propperly shutdown PPU re-enable
 timer on destroy
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, andrew@lunn.ch, Julian.FRIEDRICH@frequentis.com,
 f.fainelli@gmail.com, olteanv@gmail.com, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, linux-kernel@vger.kernel.org,
 upstream+netdev@sigma-star.at
References: <20250113084912.16245-1-david.oberhollenzer@sigma-star.at>
 <20250114152729.4307e3a8@kernel.org>
Content-Language: en-US
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
In-Reply-To: <20250114152729.4307e3a8@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I did some further re-testing on the fix, regarding the the similar race
in remove() as well as the previous question regarding the locking and
cancellation order. V3 already expands on this, and the point still stands,
the nested timer+queue+trylock mechanism is somewhat tricky and I manage
to hit the race window with just cancel_work_sync(), without the lock or
a different order for tear down.

On 1/15/25 12:27 AM, Jakub Kicinski wrote:
> On Mon, 13 Jan 2025 09:49:12 +0100 David Oberhollenzer wrote:
>> @@ -7323,6 +7323,8 @@ static int mv88e6xxx_probe(struct mdio_device *mdiodev)
>>   		mv88e6xxx_g1_irq_free(chip);
>>   	else
>>   		mv88e6xxx_irq_poll_free(chip);
>> +out_phy:
>> +	mv88e6xxx_phy_destroy(chip);
>>   out:
>>   	if (pdata)
>>   		dev_put(pdata->netdev);
> 
> If this is the right ordering the order in mv88e6xxx_remove()
> looks suspicious. We call mv88e6xxx_phy_destroy() pretty early
> and then unregister from DSA. Isn't there a window where DSA
> callbacks can reschedule the timer?

yes, this does looks suspicious, mv88e6xxx_phy_destroy() should be done
after the switch is unregistered, otherwise it should logically cause
the same issue.

However, I did not manage to trigger this during testing, and this also
did not fix the original issue I saw, but I will fix the order in a
followup v4 patch.

Greetings,

David

