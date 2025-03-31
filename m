Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC5A214815
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 20:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743453369; cv=none; b=Y29T11Dy27a037vVbGKhEChThNrjIdN94aIRyzUu6hMQq5EH3Nuhvu7oiMW2+RWWNj6NP1som8zv3dxVJ6RjnTsJyGiXV/3qOjA8HjNKdVGJN23BSqZx1fG8OLHDR2Q+9e2Bza93ukn34FMrPl4yGkUC1sWVlXz2kYESNYET/Kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743453369; c=relaxed/simple;
	bh=BXhMA2bVkkZjm52HzykHmpwFoPUimU5nv5H7zKIddTA=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=EJ5p7FLOkYL+SazAKPkKg9dQVmrxOD2yn18hF/DKqcJ0KdQn0Fh30nk4b13y4+iCQXAK0e+GWD8LPEeq1ZhGsh0lmus/yWGin/mNbRNJhz1gaEfQkcZpRd/5JfSR353rogvnzbe/669eCHfYr3b9oyGMOv9EJT38SLG0IcPrAIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jacekk.info; spf=pass smtp.mailfrom=jacekk.info; dkim=pass (2048-bit key) header.d=jacekk.info header.i=@jacekk.info header.b=EOOLVEuB; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jacekk.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jacekk.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jacekk.info header.i=@jacekk.info header.b="EOOLVEuB"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac29fd22163so818785466b.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 13:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jacekk.info; s=g2024; t=1743453364; x=1744058164; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MGYjw1uuKWmPyN4cu8oPBTHS2gSLPVA6sF7e2mS6NN8=;
        b=EOOLVEuBe5jrhPt03ieGH15EP9R1zZ3gCxu4afFpZHHqqKtEH5UVgX9xDgvtHlNgvh
         +VMseR8dAAqpljymg9RUg2utwJWI1E5GRB30l624pLXtVhihWRyaGr1eGdNQUkm8GdVA
         NHvCdwoQkwxoQnDyXO1UxFK0Vw+6taTkxXQIjd+lvLfAvhm+DLP6qOpEeD0ubmVJBPCE
         OI1vjxIXY8CIk860M/9SuMynogRoR6HHZdKGNKwaROBktyBkG5xSvChb80q2KULr7uZD
         Q8OlZ+R1h8BO+9XieAUxfNtfwC++gcZFd6p18/a2OGU61l3BmnkBH7Bf5N6gqebR2mSk
         64Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743453364; x=1744058164;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MGYjw1uuKWmPyN4cu8oPBTHS2gSLPVA6sF7e2mS6NN8=;
        b=hrDqUzK0cy+D0k7nIxu2xUx8ISJlTKDqlDxtDKzuSBmVjjOLEZL8G4ghDH0XEBnkeK
         r8ixJN3sKKW4IYay2od9jjRISxdcfqHwaB8U3zwx4KwqI4uQahiXJDoCgKX+PyPtA7rM
         C0l9T2tZOLEZs4a+Kl7mtG2X+2syKZV/EMJQwFP773qUPuXsysZcfCmDYPCORSNa7DiF
         6gAZJoydT9MtNTewQH3QbRFrDf/XbttnGRp/KLAIeHbbqjgTON/zNBbg/7zaGC3Z7f71
         xiR+szu31eAiXAIxId8ETASwZxaUa0qr9ETlqG4eYXQXFt8CjlxCmSCSavcHvFhrfY8K
         yxrg==
X-Forwarded-Encrypted: i=1; AJvYcCXsoT1UhCyJL2E/EqFTO8uf7RtvjIiRDsMo7nrUPz1nVXRohOyPx/58o9cHcU0zxiUGGs20Ckh/C2o2qkE=@vger.kernel.org
X-Gm-Message-State: AOJu0YylXyjNinVXr30wWs2l2Y0dCppxAPZyzNWy+ARhE4SIFO1Xqua6
	7yGnYxl2pK34/QiMUL9W8r9AZUekUDhkkEbNPTeioKatkz4ajJysJwMS7w/U1w==
X-Gm-Gg: ASbGncsHdqEDnExn+iE4V5wBLCNHS87/xtJLFnBfS3V4pMrDmwkG61VXF8y8JFIRlXQ
	oH/eJS8JnhbC9qgwA0cDn1ogcgFRT2YO6wSq/oIZOgnHJUyUTJAgmmQtNnkovgjC5ML4ChI+8qC
	fmq9AAGGaBYWaAsOeyz2fFS94bJ7f7w61IzvRBZzmDlHfUQT2xQofozdmqwGXFLEvQJCKC0aAYc
	9u2SAh+SsnCH+45up6wFFcxOj+LOcQuaI0xgrI8EDrHQ1fEzNW07jnDfDZykpn9epyePYIjYmTd
	oxYgwMgYVN078v0b2KvGR5OwwUYqOCyokHYEqMDI7GYDhjj0iH858LIPB8ql+/v1m2Ba1bMvpnC
	Unsguvg==
X-Google-Smtp-Source: AGHT+IGmOQ0dYuUZqV0ho9bWhCeI93hp1eGUhMitjDKWzyprEMoZZbsgh4LqP8uUT7lEUGTHh5DBTQ==
X-Received: by 2002:a17:906:f85b:b0:ac7:3912:5ea5 with SMTP id a640c23a62f3a-ac739125f39mr828851266b.58.1743453364249;
        Mon, 31 Mar 2025 13:36:04 -0700 (PDT)
Received: from ?IPV6:2a0a:2300:1:1fe:e2e5:1eb0:886e:bbbf? ([2a0a:2300:1:1fe:e2e5:1eb0:886e:bbbf])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac71967fc5fsm677464866b.141.2025.03.31.13.36.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 13:36:03 -0700 (PDT)
From: Jacek Kowalski <jacek@jacekk.info>
X-Google-Original-From: Jacek Kowalski <Jacek@jacekk.info>
Message-ID: <a6d71bdc-3c40-49a1-94e5-369029693d06@jacekk.info>
Date: Mon, 31 Mar 2025 22:36:02 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Intel-wired-lan] [PATCH] e1000e: add option not to verify NVM
 checksum
To: "Lifshits, Vitaly" <vitaly.lifshits@intel.com>,
 Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <c0435964-44ad-4b03-b246-6db909e419df@jacekk.info>
 <9ad46cc5-0d49-8f51-52ff-05eb7691ef61@intel.com>
Content-Language: en-US, pl
In-Reply-To: <9ad46cc5-0d49-8f51-52ff-05eb7691ef61@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

> Are you certain that the UEFI FW corrupts the checksum each time, or is 
> it just that the system left the factory with incorrect checksum?

I'm quite far from that device at the moment, but from what I remember:

- when I forced the NVM update path in the driver, the device would work,
- after the reboot the checksum was invalid again.

I'll experiment a little more and get back to you. Specifically I'll try 
to dump the NVM contents before and after running 
e1000e_update_nvm_checksum and after a reboot.

Maybe the "shadow RAM" was correctly updated, but the change was 
(silently?) not persisted due to the security change you mention:

> From what we know, the Latitude E5420 is 11th Gen Intel CPU (Tiger Lake).
> Starting from this generation, a security change makes it impossible for 
> software to write to the I219 NVM.


> From a technical perspective, your patch looks correct. However, if the 
> checksum validation is skipped, there is no way to distinguish between 
> the simple checksum error described above, and actual NVM corruption, 
> which may result in loss of functionality and undefined behavior.

The distinction between checksum error and corruption will be performed 
by sufficiently privileged user, who must set the properly marked flag 
in the driver in order to do so. Is it more "insecure" than disabling 
NVM write protection (flag above)?

Note that I am not the only one with this issue...

Precision 7560 (also 11th gen):
https://www.dell.com/community/en/conversations/precision-mobile-workstations/precision-7560-e1000e-module-error-the-nvm-checksum-is-not-valid/647f9784f4ccf8a8dea83444

Latitude 5420 (same as mine):
https://forums.linuxmint.com/viewtopic.php?t=412046
https://bbs.archlinux.org/viewtopic.php?id=269606
https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2102113
https://community.tanium.com/s/question/0D5RO00000Chk2S0AR/tanium-provision-dell-latitude-5420-onboard-nic

EVGA Z590 mainboard:
https://www.linux.org/threads/getting-intel-i219-v-to-work-in-debian-12.45761/

I am quite sure that Dell nor other manufacturers won't do anything with 
it...

I'm also interested in how the Windows driver works around such an issue.


 > This means, that if there is any functional issue with the network
 > adapter on a given system, while checksum validation was suspended by
 > the user, we will not be able to offer support

Is completely non functional adapter (as mine) covered by this support 
promise?


Wrapping up: if nothing else works, what would you see as a possible way 
forward?

1. This flag.

2. Option to override the checksum value (compare with a given value 
rather than ignoring it completely).

3. Option to force NVM update (provided that my tests will show that it 
works - even if only until a reboot).

-- 
Best regards,
   Jacek Kowalski

