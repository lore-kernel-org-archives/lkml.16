Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9DEC34CF9
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 07:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747293334; cv=none; b=eLlkOB0KXh064RlaGt5qIcIjS7PLdzxBTNDs5ptr0kRPIL3rduBy3wCxkdyU0l9zPvRiypWbX7B/5vpxOnX2V6uwJTZi8OcvLgbF3otTqXDXuHs1Y3kDozWduugHAVCVEwyuQl9HWNWIAJFrhG9wcM1KOkajkmagC2Mi7U4cuR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747293334; c=relaxed/simple;
	bh=qlh+kB3YovK9w5uTPzIUuljTu10BHoW6zgni0KrhuZY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Izu7oWBCZBBauWSvxjbT0mQzvrOS9qeVdlRfSJjaw2KAbhKJn/EChGJtV4P4nHpG3jOtOCLoekK6XI3cKNgYDe2Un7Z5tlYJW8qH4uJIIoqWBEsW8mRB//Fpy7HvkkJDlYQiQ7DhnPtiFJJ3qJWU5ylQN8Mu/+u+ifyJollTOCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xKuDpf0m; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xKuDpf0m"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-30ac268a8e0so1429419a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 00:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747293332; x=1747898132; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fNz4MAM7giVqZ1kIj91pZlfFRdZA2woN5u2lniAi+R0=;
        b=xKuDpf0mzG7diSHWerbhdw21qCiCky/s7+6nTpQzi6swB+UA0LiwDcVph0BqN6LQfZ
         Ir/ugie3DTYRqKDqQ0YAQ7BOKM2BdER/+oAwwnf0flYE7kR8bVCJF7jQ7iC0Ghl/QLQu
         DJ64gzL619aeIpWkBowQeN0pB7qIfdUz6yqD4atEooxp7wGxBO5ByapOFKCH9rqoGwSW
         lDRU9GY30uKMi5ekS6peGQlDheMEPg0vZOUcZyNs6bJalCqORjwrgHEUpz6ucNxtkn0x
         faRxIYve/+CLDhwXZQccRFQlgBdJ2A6jeXmkLgR526g99yAM+qb0zG38OIu96WnugqPT
         aChw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747293332; x=1747898132;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fNz4MAM7giVqZ1kIj91pZlfFRdZA2woN5u2lniAi+R0=;
        b=IxMVhCOQk7NE27ENdtRdRgx6eAGK7mXVkLK2ROAb5LrCQfcVQlt2IJONk/dkMznT0y
         FrYgdjWDGNxuFh4obkxZxGz0VramGFZqodegGsTBIlfZB48WMAjv8vnAlo995IrsN3pv
         VsCMCT4UScFghTnoR/BtZLYhOAPZxIBVS0Kwj+/IFJNXox6OTOasoogNV53cSJSqEyCR
         L0obAQBonhYrtA6azc2CgSSRVf5VqjIgVG3I3Nja7OUIXN7nmihLLJIbX3rFo2MerFQt
         VCmhUT3W3IKCm9BCcOodye7mbia4YnLgNSrtw8S24PM8+/C4v94WC8muoqN1aL5uoIkI
         Jifg==
X-Forwarded-Encrypted: i=1; AJvYcCWFQc4hzFlg2mtgAeZLEbe/D5QWczAEa+OrjTqerCBwcpQBTRktmzC5sr+429jh6asArVFIjJy3s54QNjY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6c43zxPZvL7HvpI2xHwwJJTYLw/PkHPByJlb2ORMSDCfuQWY/
	atT+rJglBOGJOeEawqZ0qWqOw8R90cROGXukTAB1YwXt3wpeJzLrRWx5EI8H5w==
X-Gm-Gg: ASbGnct+aM4xUz98wDvyWtZiwAcizqfNsYEHwKqcllIGoJCaxm72nNIaR+ge1J+xHNf
	LYpB8UTBy03+VV/nsHmarPlK9nc+/OO258IH6zPmVg4ImmoX30oBH12kbVj6YGEYRbb+xINwxJw
	cjFS3Qv0ofIBtD8nG0O0y1UMtMzTFYyOK808FVq65mRGfTL8/bTLGFZYb3yc2iX+4WFFcLVV31C
	VEpMzeLoHUCPgUmOBzcKBUhqxWUWvRqZJMRPIs8urdHeHpjXmMW/XwQl70zxLxCmJD7lvfJZ5cr
	wVHJV+S3LcAt1nYHX6i4Qyqkt1+y/KQoHtdSPXp4oTEEyF05MKyuUho+GcuPG1I79oMunCVDUUf
	+P6Cy3Y7jAIyu3KDbfqMDIUE=
X-Google-Smtp-Source: AGHT+IEp9eTd3hls9DgkDTgFMCjs1olsgJPSelhs5NIcds9k0dqlTrGcDISLk+XnoExwF4yOwHRgIQ==
X-Received: by 2002:a17:90b:5350:b0:302:fc48:4f0a with SMTP id 98e67ed59e1d1-30e4d99d77amr4167602a91.0.1747293331617;
        Thu, 15 May 2025 00:15:31 -0700 (PDT)
Received: from ?IPV6:2600:1700:4570:89a0:f74c:a163:fe37:3c0f? ([2600:1700:4570:89a0:f74c:a163:fe37:3c0f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e3345f4ecsm2803723a91.27.2025.05.15.00.15.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 00:15:31 -0700 (PDT)
Message-ID: <4245c9da-cb81-4494-93c6-224883057410@google.com>
Date: Thu, 15 May 2025 00:15:29 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usb: typec: tcpm: Use configured PD revision for
 negotiation
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Cosmo Chou <chou.cosmo@gmail.com>
Cc: badhri@google.com, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, cosmo.chou@quantatw.com
References: <20250513130834.1612602-1-chou.cosmo@gmail.com>
 <aCNLeX1k34BSgPOV@kuha.fi.intel.com> <aCNOOXcAuA_1B-0Z@kuha.fi.intel.com>
 <CAOeEDyuFmFqacy1N8TtpuJRdv-3K2f1DzXNwR1MpyNn4Nrug7A@mail.gmail.com>
 <aCRQbRCHFdFOCNw2@kuha.fi.intel.com>
From: Amit Sunil Dhamne <amitsd@google.com>
Content-Language: en-US
In-Reply-To: <aCRQbRCHFdFOCNw2@kuha.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Heikki,

On 5/14/25 1:12 AM, Heikki Krogerus wrote:
> On Tue, May 13, 2025 at 10:14:32PM +0800, Cosmo Chou wrote:
>> On Tue, May 13, 2025 at 04:50:49PM +0300, Heikki Krogerus wrote:
>>> On Tue, May 13, 2025 at 04:39:09PM +0300, Heikki Krogerus wrote:
>>>> On Tue, May 13, 2025 at 09:08:34PM +0800, Cosmo Chou wrote:
>>>>> Initialize negotiated_rev and negotiated_rev_prime based on the port's
>>>>> configured PD revision (rev_major) rather than always defaulting to
>>>>> PD_MAX_REV. This ensures ports start PD communication using their
>>>>> appropriate revision level.
>>>>>
>>>>> This allows proper communication with devices that require specific
>>>>> PD revision levels, especially for the hardware designed for PD 1.0
>>>>> or 2.0 specifications.
>>>>>
>>>>> Signed-off-by: Cosmo Chou <chou.cosmo@gmail.com>
>>>>> ---
>>>>> Change log:
>>>>>
>>>>> v2:
>>>>>   - Add PD_CAP_REVXX macros and use switch-case for better readability.
>>>>>
>>>>> ---
>>>>>  drivers/usb/typec/tcpm/tcpm.c | 29 +++++++++++++++++++++++++----
>>>>>  1 file changed, 25 insertions(+), 4 deletions(-)
>>>>>
>>>>> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
>>>>> index 8adf6f954633..48e9cfc2b49a 100644
>>>>> --- a/drivers/usb/typec/tcpm/tcpm.c
>>>>> +++ b/drivers/usb/typec/tcpm/tcpm.c
>>>>> @@ -313,6 +313,10 @@ struct pd_data {
>>>>>     unsigned int operating_snk_mw;
>>>>>  };
>>>>>
>>>>> +#define PD_CAP_REV10       0x1
>>>>> +#define PD_CAP_REV20       0x2
>>>>> +#define PD_CAP_REV30       0x3
>>>>> +
>>>>>  struct pd_revision_info {
>>>>>     u8 rev_major;
>>>>>     u8 rev_minor;
>>>>> @@ -4665,6 +4669,25 @@ static void tcpm_set_initial_svdm_version(struct tcpm_port *port)
>>>>>     }
>>>>>  }
>>>>>
>>>>> +static void tcpm_set_initial_negotiated_rev(struct tcpm_port *port)
>>>>> +{
>>>>> +   switch (port->pd_rev.rev_major) {
>>>>> +   case PD_CAP_REV10:
>>>>> +           port->negotiated_rev = PD_REV10;
>>>>> +           break;
>>>>> +   case PD_CAP_REV20:
>>>>> +           port->negotiated_rev = PD_REV20;
>>>>> +           break;
>>>>> +   case PD_CAP_REV30:
>>>>> +           port->negotiated_rev = PD_REV30;
>>>>> +           break;
>>>>> +   default:
>>>>> +           port->negotiated_rev = PD_MAX_REV;
>>>>> +           break;
>>>>> +   }
>>>>> +   port->negotiated_rev_prime = port->negotiated_rev;
>>>>> +}
>>>> Do we need this? Couldn't you just add one to rev_major?
>>>>
>>>>         port->negotiated_rev = port->pd_rev.rev_major + 1;
>>>>         port->negotiated_rev_prime = port->pd_rev.rev_major + 1;
>>>>
>>>> Or am I missing something?
>>> Sorry, I mean minus one :-)
>>>
>>>         port->negotiated_rev = port->pd_rev.rev_major - 1;
>>>         port->negotiated_rev_prime = port->pd_rev.rev_major - 1;

The only reason I asked for macros is that in the case of Spec Revision
for header, the value for PD 3.0 is 0x2, PD 2.0 is 0x1 & so on. While
for PD max revisions, it's the exact values. Having a clear distinction
may be easier to follow. If you want to go with the +/- approach you can
add a comment stating the above. 

I don't have a hard opinion on either approach :).

Thanks,

Amit

>>>
>>> --
>>> heikki
>> It seems to be the PATCH v1:
>> https://lore.kernel.org/all/20250508174756.1300942-1-chou.cosmo@gmail.com/
>>
>> if (port->pd_rev.rev_major > 0 && port->pd_rev.rev_major <= PD_MAX_REV + 1) {
>>         port->negotiated_rev = port->pd_rev.rev_major - 1;
>>         port->negotiated_rev_prime = port->pd_rev.rev_major - 1;
>> } else {
>>         port->negotiated_rev = PD_MAX_REV;
>>         port->negotiated_rev_prime = PD_MAX_REV;
>> }
> Okay, sorry I missed that. I still don't like the extra definitions,
> but I don't have any better idea (I guess macro is not an option?).
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>
> thanks,
>
