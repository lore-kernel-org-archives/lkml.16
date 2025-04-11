Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF77195;
	Fri, 11 Apr 2025 00:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744330279; cv=none; b=R4cNMi1ZRIansUEBDtEBOPCKzxZgA1XWiudJ1INmSvV69/OE0tAOXJBwmZKPFCaFxXK8QLtx+Oq2w9FYXEKf3wdp+ubWFXn/2z7IjPgB1Uk1U1ZJ7LCvESOg0zryVpwFsezWY1cj3GMOTHu7DqahrAErah0uvHtA5TtUu9KYh+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744330279; c=relaxed/simple;
	bh=aggAFaWBF3eCJZ86xn4yYGPRoxoUau6duf4DQ4pIcf4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MoQTnnUWST01/IMiz5JS/vCA0tzl4p5oGCwaDxMUZjJFGu3BI3aQUnMDna1+QuqQxh9x3GeOuUFsD/HYUJQi09G91tQ63I5ivE0kDVXd5l0zrLHNUUDoVKSTrRGyGcSPPbV6zQL6uktQ/aKf7J+tfI4DRMvs9RBSaK0i8W+nJVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j8RyAtN/; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j8RyAtN/"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-af9065f0fc0so1067121a12.2;
        Thu, 10 Apr 2025 17:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744330275; x=1744935075; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=nxmDP5ivc7X/RIgjf4/pEbfV3hiDMFBXXLhfR29TU5o=;
        b=j8RyAtN/nHmdlFFwWXl+qN3sxFs6ZWkf7kXO9vzRJbbfYPo2POMKeUkWdHl+uU37Hp
         8mRB0AW/rx2aIVwlqDTRQG3wsTqUmS38/V6Yi5zA5bO1W2+CWnYHMZNQ+HxxZUU5Yi/t
         ckvFM3o5BD0zbg8ScPz5I3nZcPmqBdjBGqAsj1XhifsYexlhj93i9kW14G/O0mX7bTmg
         u1YN0esLWWBQjAa28zcSWpCyGm64g3S11ll2kH+B+zGhhEot4bEXx0bnyN38hdDTN0B6
         8MFXbDJOK68+gPDWHrdFZZ0eOSMxHd7CkhGkqwgD9ncwdIC0ooQRLfgo3UV9w14zYKoS
         nHrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744330275; x=1744935075;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nxmDP5ivc7X/RIgjf4/pEbfV3hiDMFBXXLhfR29TU5o=;
        b=mh8+ixWK5IPZ9SCfHNjDTTCu7hTa0lBDew4kpaW8vz2zhZiKP5wDaQW6nWwJlYGWmh
         c1Az8G+betRPNrIgnqoHf0wY2B86/zpJkDjFWDqkNw6rD9Mk+uoAISd3k6xmow2vXmCF
         QFHdvaU/zE1wVh6s+Df6kznSy4ABeL0qHxnfLA5zcwm9Y3BXHyfxJdqLHg2d3zcH5Qa8
         CFryAWZ1ARVQqy4q4Vy0sHHFtkfbysK4cMNyGUNMoc96wopZ9BtRwfY/cUzr4hkBwYaf
         RPGBVcI4Tpr72foobIEXh+UMk5QNdNMG8blJX6zx/t+wocjFC5L5wMhU7GMgQ2mXeVVD
         ed1w==
X-Forwarded-Encrypted: i=1; AJvYcCUtEXt1ja7MmzcEIumZT30nDRBDUPQ6iEm+3mCm2KDPIs6lzktk9vCnRFFyXV5+47wNL/l6NNCz0wEr1A==@vger.kernel.org, AJvYcCW7UkWGclPdKKU5m4jNqN/jiy0f/XB6VXT2OimGZmoWTgtQxmx8ZwnK/8dsTsCG4qnCsyvFZKDDRisJYa1z@vger.kernel.org
X-Gm-Message-State: AOJu0YxyfPQNpI8NW+d9/MBBIAnsSgikdC00KptOfvbq7mYbKdWB8TUI
	uIJxx2/Sxqay1Jtb8bw7kuBg8uX2jcPNUJWRfFmYx5GAIK8Vg3ENgycZCg==
X-Gm-Gg: ASbGncvQXiTDmw2XbPr0oC+LPw/85dEQlEb49g4//6XCwkD2AwiN/Tol1rK7xBxzBHf
	68jYFp5MGJhVXkEaa1AZ4ap5Yd9xIEdisSmgtSZ7e1HGKjRPC4AeG2VxWoEXpoNaj9yNOutIaSx
	wuKNZ36/G4EpMqwl1EUPUStL7v9L5MZQMztJlXAe2pFxHOP2x0CCxSIDFqUeSZwGJuSjful1t2G
	ZhpiEijCJkzOuyheU3dQt8WB1lICd6QbowjmZgdHyzxceNUHkhP9vhxnPQEs0DLtaI32fVM6tev
	SDvkpfzAa+HaPOkHKpBUmngRh66vHk1CgaaFB4+DDczWDca9ldKMfLZgChpU6z+H0Ckl8keYjWA
	cyWugvypg3igQWA==
X-Google-Smtp-Source: AGHT+IHjkGr5xd0SlPLHoHkd3QeG6UorjHGZ2OnrmyY4lxVAafef/Fxq+HBDi6nFioWGcfVnQq4p+A==
X-Received: by 2002:a17:90b:55c7:b0:2ee:a583:e616 with SMTP id 98e67ed59e1d1-308236335d0mr1454594a91.9.1744330275324;
        Thu, 10 Apr 2025 17:11:15 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b9039bsm37152735ad.94.2025.04.10.17.11.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 17:11:14 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <e921d037-9be2-43f1-9469-4f27a0575a60@roeck-us.net>
Date: Thu, 10 Apr 2025 17:11:13 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hwmon: max34451: Work around lost page
To: "Torreno, Alexis Czezar" <AlexisCzezar.Torreno@analog.com>,
 "William A. Kennington III" <william@wkennington.com>
Cc: Jean Delvare <jdelvare@suse.com>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20250401220850.3189582-1-william@wkennington.com>
 <20250408011006.1314622-1-william@wkennington.com>
 <7cc91dea-c24c-4948-9916-8cad865d023e@roeck-us.net>
 <PH0PR03MB6351903275DC93C9C543B096F1B42@PH0PR03MB6351.namprd03.prod.outlook.com>
 <PH0PR03MB63516D1BCA80A50B0C3E029EF1B72@PH0PR03MB6351.namprd03.prod.outlook.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <PH0PR03MB63516D1BCA80A50B0C3E029EF1B72@PH0PR03MB6351.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/10/25 16:59, Torreno, Alexis Czezar wrote:
>>> [External]
>>>
>>> On Mon, Apr 07, 2025 at 06:10:06PM -0700, William A. Kennington III wrote:
>>>> When requesting new pages from the max34451 we sometimes see that
>>>> the firmware responds with stale or bad data to reads that happen
>>>> immediately after a page change. This is due to a lack of clock
>>>> stretching after page changing on the device side when it needs more
>>>> time to complete the operation.
>>>>
>>>> To remedy this, the manufacturer recommends we wait 50us until the
>>>> firmware should be ready with the new page.
>>>>
>>>> Signed-off-by: William A. Kennington III <william@wkennington.com>
>>>
>>> Applied to hwmon-next.
>>>
>>> Alexis: Do you happen to know if the new revision of MAX34451 still
>>> has this problem ? Also, it would be nice to get some feedback if the
>>> patch covers all affected devices.
>>>
>>
>> I unfortunately am not aware of this. Let me see if can get an answer from the
>> engr of the part.
> 
> To follow up, here's the exact response I got.
> 
> - This is not an issue with the part. As the fix mentions, "the manufacturer
> recommends we wait 50us until the firmware should be ready with the new page".
> Compliant with I2C/SMBus spec, some parts require a longer idle time for the
> bus to be free before receiving the next command, in this situation it is normal to
> recommend a longer idle time in between commands. It's more related to the
> part's inner timing and architecture.
> 
> So I guess no specific changes related to this was made for later versions so the
> patch here should cover all.
> 

Ok. Thanks a lot for looking into this!

Guenter

