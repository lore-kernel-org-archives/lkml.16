Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEAE818FC72
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 17:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738948420; cv=none; b=ieygZqdhFJkolSKg+YqqgZCr18enZcaPbuICjHvxsWsI+9itoA2ahjw5fd2JqQ/tyV/R2TbszudkNFW6Cu66GWQxa4CI69yZOY4FBq7gb71zpHd5Lun8bHIt4sx14sX18tvLQ6tCU+sqih4K9SJioqylPILizPOS3J/0DpoZkkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738948420; c=relaxed/simple;
	bh=BLOWmoRmbHy/gnuzM8xwn2yz4ukNppwSyIISh/gH96A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cfQrNyhyyCQcRb2RrVWZ6YWGBuLhbHNpBNMR07Z1T4gmrg80fu8Rfg+px53cgco36vR6cTgmpzqhm0ZWpYbINPc+UUpKRuBuo62GO1Fz2EP6QAPzUBCkPtjPSNPiwete41XVvDl5VMyI1O4CfVdrF7kqUf+wdMVjKkYrU4TE++o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q6WnmTFG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q6WnmTFG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738948417;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4xExkY7a9dfcmWWKsnQJ8PF5WnPHcZhnPPJN0QoVJGQ=;
	b=Q6WnmTFGyeD8WNs5t40Hr0KYCXV3/dqrmA/9TvFL6O8PvE0MH0kgNVKIZi3/kEuQXjJyVp
	AmvKyIb1jDM01H1PW7d3l397427haJyNoCSp6GM988LyKXw0WC2KfuJG9a+nknzXdIiXg7
	H7UFyiQJZ6O36HCzcuMVzvlg1kOOXVo=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-30-lWTQJmZvMEu_PbDpAjM1_g-1; Fri, 07 Feb 2025 12:13:35 -0500
X-MC-Unique: lWTQJmZvMEu_PbDpAjM1_g-1
X-Mimecast-MFC-AGG-ID: lWTQJmZvMEu_PbDpAjM1_g
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6dadae92652so46372846d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 09:13:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738948414; x=1739553214;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4xExkY7a9dfcmWWKsnQJ8PF5WnPHcZhnPPJN0QoVJGQ=;
        b=AZtv/vZAbU5zs9uU0m+2F0+rimjp+3biOPR0lctV7V5awWfpWzYt0jhPMWr7JwFU6y
         whiZGnLVrfdC6lznYJ+zpEHZaC7il+538YfQME5pESN8LIYSHRuflWgNvDByNFop1WAr
         TdPifjtH7twDC+CKmHKfnKLwFm8B4a99UtPsNPxesYwnYoJa0lmDJKzns02g4jCxGdan
         k+U4amyjCFJFO0Lls8EQhwf8jRRXiyOlBoF9lwldgjg1k5v+TdAIJ3xTJxUSiCAOBXSA
         RkAKVyVLsngaaWA0N6tg2oiX1CnY1EIpRdDL1EpOfeeKyPYv/2ER8s7kpZeIdV5pa2on
         11MQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQ8WYJkilXeUbyguvKeQ9k9aHuQu/VaSwrc3qTW30hSIZOq+pwOypDq/5skQ6FSDdR1wMGtB5ljLZnOp8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzV5I+cEMMofuPg3h/7W1bQ0XvectxmsY0MQne9H1+K2DcCn2uw
	VP/nDMf51KsIyP37tTnMF0k2dTpUI1rAoWhm3M2NIHfKmBm215mRZkJlMiVXKg4qWmxhBY7Nbaa
	bdIUM2yruh0qpoMb3XrvmFb9bTez94gtjPSfY0juNGKcOkw/DjIRNN1bGOTcY+Q==
X-Gm-Gg: ASbGncvhR0LovwszWeASnpDhXvnlgeJQVzFmZ0EpYAd2kGwaWA7dqBYz+yc9DiUcpND
	pcT6aBqBbWcISNItpbP4B8ew2zQsh1bNJypDgaiCnRvmUdrP+EoUkA04FPzyMxPXVR3vPoY3MiL
	/EPONK+ueDyPFTW1irJ4737z1DFeKMBiECxZKo1gn9yUIiGQa7xnxAsD+jB9L+I4lKYQQbfXQfM
	X4JiunHTly89oGWrk5TC61xew3IEjCW7+3uUcUG8+XE3xEqDX33JC9gV5gVfErAXeko+RKKXu9I
	JRM1
X-Received: by 2002:a05:6214:2526:b0:6e4:34ed:c571 with SMTP id 6a1803df08f44-6e445674b58mr67413566d6.27.1738948414584;
        Fri, 07 Feb 2025 09:13:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEmRysRMMAuZgbKXJBfFfQlbWetjxagGtq3aooaiwcNUXxsKgWhnuH6aSZCDZB6CMm/i/IdTA==
X-Received: by 2002:a05:6214:2526:b0:6e4:34ed:c571 with SMTP id 6a1803df08f44-6e445674b58mr67413256d6.27.1738948414309;
        Fri, 07 Feb 2025 09:13:34 -0800 (PST)
Received: from [10.26.1.94] ([66.187.232.136])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e44150c6e9sm14437056d6.6.2025.02.07.09.13.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 09:13:33 -0800 (PST)
Message-ID: <9241eff1-0c2d-4c82-a77d-cb8b67cab6f9@redhat.com>
Date: Fri, 7 Feb 2025 12:13:32 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] intel_idle: introduce 'no_native' module parameter
To: dedekind1@gmail.com, linux-pm@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>,
 Jacob Pan <jacob.jun.pan@linux.intel.com>, Len Brown <lenb@kernel.org>,
 Prarit Bhargava <prarit@redhat.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250128141139.2033088-1-darcari@redhat.com>
 <20250206164009.816232-1-darcari@redhat.com>
 <6c258775cdf2f8f3c370c0cb81daf22dacf6aeed.camel@gmail.com>
Content-Language: en-US
From: David Arcari <darcari@redhat.com>
In-Reply-To: <6c258775cdf2f8f3c370c0cb81daf22dacf6aeed.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Hi Artem,

On 2/7/25 10:55 AM, Artem Bityutskiy wrote:
> Hi David,
> 
> On Thu, 2025-02-06 at 11:40 -0500, David Arcari wrote:
>> +The ``no_acpi``, ``use_acpi`` and ``no_native`` module parameters are
>> +recognized by ``intel_idle`` if the kernel has been configured with ACPI
>> +support).
> 
> And if kernel was not configured with ACPI support, are these not recognized? Or
> they are just no-op basically?

They are a no-op - the flags are all set to false so ACPI C-state tables 
are ignored.

> 
> Looks like there is a stray ")" at the end.
> 

Yes I will fix that.

>> +
>> +``no_acpi`` - Do not use ACPI at all.  Only native mode is available, no
>> +ACPI mode.
>> +
>> +``use_acpi`` - No-op in ACPI mode; however, the driver will consult ACPI
>> +tables for C-states on/off status in native mode.
> 
> I think "however" part is a bit confusing. Would you consider re-phrasing
> without "however" ?

Sure - so is this better:

``use_acpi`` - No-op in ACPI mode, the driver will consult ACPI tabees 
for C-states on/off status in native mode.

Thanks,
-DA
> 
>> +
>> +``no_native`` - Work only in ACPI mode, no native mode available (ignore
>> +all custom tables).
> 
> Other than these small nitpicks,
> 
> Reviewed-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> Tested-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> 
> (I tested it on an Intel Broadwell platform).
> 
> Thanks!
> 

