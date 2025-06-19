Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F32B2110;
	Thu, 19 Jun 2025 13:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750338091; cv=none; b=sRCQm3tcw0Bj2aMMyLoUScZFV2I7X0aqt4wvmADI2f/KIb79niJWqNfqrkLRmYgraOx3vixB4D7oRuc0hgT6DSGjdi87ImP4hvCz64/oHbEXZuj/ijrHWJs66CtnFzjpAc9mCnff53DZ8sjPnj6WemPFDFPy9OdWI95gcZ2FAsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750338091; c=relaxed/simple;
	bh=SxhBGp+LSygljmyVRwqy+hrojpylf1AOL0MWscPeuRE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=MiR1tzCl6xfZ4Yd12RPAtbxfW4B/qMIc32d9PLnGs+nD6aOH5y+BW7K355nmtM31ThNpKTCima0KZ0P2XwZhH1YpHprZQjLmkX1Zn1e1DaeE6rTcuYPNsRFWw13gdNUqv32aH9rNEERZPRalsTizO6pidCvSV7Yj7+QcTnMAGb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XjzplcZa; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XjzplcZa"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2349f096605so11855045ad.3;
        Thu, 19 Jun 2025 06:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750338089; x=1750942889; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=x9pLxU1+jwh6zu49kl7HHBM0U8MxQbNxmcaRxDgxffY=;
        b=XjzplcZarUhcT4J4YexBzEkvsNzNan4AjHGzqNnLMElXJsZpEoWp0oqD50yHGFQ3Fg
         OyUqb0rqm0LsLO+I+CfvChCbGiAJx2OhdYPM2/YsExiTJiPr7AD0d8cHOmL3il/xMEIv
         WrFw5OWXPFSrb+vMbT1hItkcgHXGiEiJqHkiY8t/JkQGX4AdbfSF3tFwFWgVW4y3xK03
         xoxUaR77T0tW6lOiCSpvzW99maPGoFbDGAyGIDqNxCuEA5hYDTsGlmIXrhC+SIAyLps3
         ZYVFcGU00+i1BMgaDBKOyBfYeD9cLRESobgup50I+uw5jpIVAnoxZKZM277Q7qN9tdU2
         /ISg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750338089; x=1750942889;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x9pLxU1+jwh6zu49kl7HHBM0U8MxQbNxmcaRxDgxffY=;
        b=lOOFxAccQeh0WOJldCuxv9OHwPp3LoBYfPIKSlKGJqvbuHMdR4hkb6q73uRRGKnvOu
         D1OE4TFJfvsdBDfDqAvLXHHLpsZbLc+2GaXXnPCHqo7wnrnl/WWFM5i28UwourpE5ek6
         7xXAEEu4QpwEmNNpCIl8L97i+s2w70134qy0TFr7CQuv8jW5hYNFltu7uDc3GU721Tyb
         C7cXE+mBUIvb4zTymehlS5amnkhzMaMs4rOo70ruyAl8iA8JA4tR5DVOgeaSdF9Bhuzc
         xo23nsHkzcdDZ+8LUfNNkhflUXBu93NttmyCq3tmz+2GiCLC42vMJWC5dUhb1Lrvhm2d
         vJ8A==
X-Forwarded-Encrypted: i=1; AJvYcCWpj7BiqTvJoess9icKJDx6w4L/wtIwrz6pn1FDQonHGv8roDZeOeTS2M0DQtimjkPHdCZWH5UTz3RaLA==@vger.kernel.org, AJvYcCXbJZMFeqAlJXJoPnyXudkPzLzG9W4j2xwfGkmyrOi3xYdQCDo+BBP/Kd0W1OKjfbbhnOfzZHUdDNYfl55m@vger.kernel.org
X-Gm-Message-State: AOJu0YzhM5uRFZRYCojDLOkXfGx6PlEwBMpP5A3IGVj4FQXbdJpxTHgZ
	yW8NA+igktn8Zps+tVcSCHT18dsQd+kOmFsuis75r+x/umlIgpFt8My1
X-Gm-Gg: ASbGnctjM8xifoSqzhuX79ZTl894fTMeGuq9vOYGILh3BQWXyvlp4jRuAgsLdebTD/T
	XKDMiyVm+T4cddUFEgIZVkEU3bnQu+Ze4VIr6hQeZWfqv7IrU72rZHcS9rLcenqMNFJT/Oxo8lk
	DUR4IdMLu3yrj6N5deY+BI2h8+oyVFQ5muOoXQ87jU613hqgk0RAowSXLmUiWm/7ai1awdMBhzF
	DfldN1bYNL7O2drHdA71lkQIp2TT0k5mPbTBTj7gTwv93Up/i60PSkxhmpwcFUQ5MsBCB7rCPEm
	+JJDgFMDQSvE4q7NcFeDGMBPFoSURvCAlkVMxhwGxRddlxVnTI9ZexnVI04q5e+Hpu6v1dXr2xI
	eN1pTaU3acFGblN7SEdH3OFNz8TnI1bYj8Yg=
X-Google-Smtp-Source: AGHT+IHuuLIjXyPZyJ7MM5V4JSpVmO9iI/QmZwAy+brms/faK6wWgf31EsgUt4DJ1y5F1I/mjAqqSg==
X-Received: by 2002:a17:902:f790:b0:234:a033:b6f6 with SMTP id d9443c01a7336-2366b3a959dmr297305675ad.31.1750338089214;
        Thu, 19 Jun 2025 06:01:29 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365de78565sm119163335ad.124.2025.06.19.06.01.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 06:01:28 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <61233ba1-e5ad-4d7a-ba31-3b5d0adcffcc@roeck-us.net>
Date: Thu, 19 Jun 2025 06:01:27 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [hwmon?] KMSAN: uninit-value in get_temp_cnct
To: Marius Zachmann <mail@mariuszachmann.de>,
 syzbot <syzbot+3bbbade4e1a7ab45ca3b@syzkaller.appspotmail.com>,
 jdelvare@suse.com, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
References: <685392a0.050a0220.216029.0168.GAE@google.com>
 <145b2916-830b-4654-84e6-3d5c356c6283@roeck-us.net>
 <fe5fe144dea8665f96b943e9abe58fc8be536d69.camel@mariuszachmann.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <fe5fe144dea8665f96b943e9abe58fc8be536d69.camel@mariuszachmann.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/19/25 01:01, Marius Zachmann wrote:
> Am Mittwoch, dem 18.06.2025 um 22:56 -0700 schrieb Guenter Roeck:
>> On 6/18/25 21:31, syzbot wrote:
>>> Hello,
>>>
>>> syzbot found the following issue on:
>>>
>>> HEAD commit:    4774cfe3543a Merge tag 'scsi-fixes' of
>>> git://git.kernel.or..
>>> git tree:       upstream
>>> console output:
>>> https://syzkaller.appspot.com/x/log.txt?x=10e3f10c580000
>>> kernel config:
>>> https://syzkaller.appspot.com/x/.config?x=61539536677af51c
>>> dashboard link:
>>> https://syzkaller.appspot.com/bug?extid=3bbbade4e1a7ab45ca3b
>>> compiler:       Debian clang version 20.1.6
>>> (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian
>>> LLD 20.1.6
>>> userspace arch: i386
>>>
>>> Unfortunately, I don't have any reproducer for this issue yet.
>>>
>>
>> It doesn't need one: The problem will be seen if the data returned
>> from the
>> power supply is shorter than expected. In the example below, the
>> problem will
>> be seen if less than NUM_TEMP_SENSORS+1 data bytes were received.
>> One possible fix would be to record the returned data length in
>> ccp_raw_event()
>> and to have each caller of send_usb_cmd() check if the returned
>> amount of data
>> is sufficient.
>>
>> Guenter
> 
> The device should always return the same number of bytes.

The term is "should". That doesn't mean it always _does_ return the
expected number of bytes, only that it is expected to do so.

> I could zero-initialize the buffer at allocation. Then there should
> be no uninitialized values.

As long as the values are usable, sure. That would not really fix the
protocol error, though, it would just hide it.

> Also I could check the number of returned bytes in send_usb_cmd()
> instead of having each caller checking it, and return -EIO if
> it is not correct?
> 

Yes, that would be an even better fix, though I would suggest to return
-EPROTO in that case to distinguish it from an actual i/o error.

Thanks,
Guenter

