Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0862241116
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 19:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739044573; cv=none; b=LwmhmRJ2oqbzu7gc6N2LGTg79FE99MdZpaja3OBBYkVT5VJ4zEjIBiyRK8W6SkUA2L3YxeStSx7tZrVbPakcRPNxM/ck8axm/Y/yEEIEwcFEn9mOeRJTuDy8hlPBC1oSNykWmAgy69y0oeOrAikRmUyd4tM2PAz8vwUgquJSMRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739044573; c=relaxed/simple;
	bh=1drWUIgvHFq0hezfTkFnWaTwhco6irh+3Gr9yrHOpOU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W3HXhC4TjYVHE+1BW/Mo5LnE6UAnWmpJFXxDjYSJ1rRQIu+2VOQ3lK2DSlCNLh8OSjefhaLYz+yZHgkOcLyO9OREBklR4kVOFWgWWFA/na149SdoRR/5H9dklcwWALQIOyDY0ifYr/PxDI9yChuhfs9I14bLKUeMQWZWtXX+dwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DAV/nngD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DAV/nngD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739044569;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qJrBPQnhtPlXH6IxDYHNsAVehPX7LGhNXc/5vBp7/qY=;
	b=DAV/nngDfrZUnxDqOLqGpFR+jn9Rms2fhxpTbE3hz/e1o3C8Hy5GADzJu5pZpFmIepcjPV
	zjx1wJnMzZhnavF312MJvp9C8npGID/EWwgijDXTUwBDeEUO6l6RCJnRU6o9RlQtqVm3FU
	XeKBrTbYT8YkVMvOAR5IcJMCEkDNGcE=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-259-t4R_XFxNPQCFZ3DAUgjUew-1; Sat, 08 Feb 2025 14:56:07 -0500
X-MC-Unique: t4R_XFxNPQCFZ3DAUgjUew-1
X-Mimecast-MFC-AGG-ID: t4R_XFxNPQCFZ3DAUgjUew
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-3ef3847424aso3494636b6e.2
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 11:56:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739044564; x=1739649364;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qJrBPQnhtPlXH6IxDYHNsAVehPX7LGhNXc/5vBp7/qY=;
        b=X2rep0Jm5OXHNhg+Lpt2dtMlN5XFYxQfI6rncaMVsx0PTHHv8+aGfFcggEmfhGwi29
         Rbz0v5p2sgC8dNXV5jwmWJlxtahlNSDpQhySCjVgSkFhknXzv5nhnpjg6l5r5xNhY2Oe
         4cdS8P49eH/zmNBCDO2qxBYTYt+/5nB/H1sU6ftBLYKr7udMpZ/po7tesZyiB14Zt/uj
         OBhRUGIdjW/ApMf+2zPDJU5e7nYK7O7HqfqXi+rYcbebGN06EbZY3fAimfV/jABjor4J
         /ivSWjsF4vy6KSRaQImg4OvGYyHl7RmF8EQlcKhi3JggJdmZ4dbNJtTfwO+hk7SAaCzW
         h3Ug==
X-Forwarded-Encrypted: i=1; AJvYcCXvdrfpuTLmk9l2eG7yEr6EbcUN0etliUwerlplSVGwpG+ybwbEMeOZ1Z2eozsSJ0N03xg+PmvPt/vIRL4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz47MGxjELxVzzcW2BH/ctrGlZoPFcONrMiGN5o5dPcuCEPbOJL
	lapyKOv8JMfvMRJzQ00LCFoPqqsYVnU+jkSYab2vps3JFKbSroOZhL0H4Mo38PsiW6hEWUFKUDb
	SD073CTIYxQ1dKqpjwCIhzRdhI+3hxn2Ra58cqpcwpFOX/jV8o95ITKnNkQV9aHRFKl8rKg==
X-Gm-Gg: ASbGncuvltZj2pPmZ9ECfmqA4rQEnUMvmAHLqmeKBznSAENGo27XlC+g5h0gEuNWAuD
	IeMM+uCUry/QjT8v34FA9KVnbw/r/ohlgJ/xJvTgYP9BpQJ1VeCG0NBRC57UCy8zQD7F3/ZfJDQ
	2G03alGTdvwhY6gJIQ8Ty5Re+DNRPpC6AmhCyUHEZN29jAmaxMD4XGk9KGoml4UIYQLRBAqKbJF
	iY3kwO2nLhlvEmOUzagWWbSDxGfyW1j1ohe2NhyxBxjafTSgdUa2rCOU6/umwYIaFYuqdSWfujv
	839W
X-Received: by 2002:a05:6808:80cc:b0:3e6:3116:99d0 with SMTP id 5614622812f47-3f39222b3fbmr5393569b6e.13.1739044564700;
        Sat, 08 Feb 2025 11:56:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF77f8SjJ5aO8jURW5smUN5SBZK/+nJGx6pVJEW7YxApvAY6WlsUk5VVFGjgRkKRDc4TDJ/xA==
X-Received: by 2002:a05:6808:80cc:b0:3e6:3116:99d0 with SMTP id 5614622812f47-3f39222b3fbmr5393561b6e.13.1739044564465;
        Sat, 08 Feb 2025 11:56:04 -0800 (PST)
Received: from [10.26.1.94] ([66.187.232.136])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3f389fda9a7sm1417358b6e.48.2025.02.08.11.56.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Feb 2025 11:56:04 -0800 (PST)
Message-ID: <720944c4-48b2-4d1c-8a02-d81416ed7484@redhat.com>
Date: Sat, 8 Feb 2025 14:56:02 -0500
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
 <9241eff1-0c2d-4c82-a77d-cb8b67cab6f9@redhat.com>
 <c25d3b9abced9263da463b3ef4f31fff73878189.camel@gmail.com>
Content-Language: en-US
From: David Arcari <darcari@redhat.com>
In-Reply-To: <c25d3b9abced9263da463b3ef4f31fff73878189.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2/8/25 5:37 AM, Artem Bityutskiy wrote:
> On Fri, 2025-02-07 at 12:13 -0500, David Arcari wrote:
>>> And if kernel was not configured with ACPI support, are these not
>>> recognized? Or
>>> they are just no-op basically?
>>
>> They are a no-op - the flags are all set to false so ACPI C-state tables
>> are ignored.
> 
> It would be nice to mention this too. Otherwise it sounds a bit incomplete. Like
> this:
> 
> 	If A then B. (nothing about "else").
> 
> Better way:
> 
> 	If A then B, else C.
> 
> :-)

I actually took that from what was already there.

So I can add "In the case that ACPI is not configured these flags have 
no impact on functionality."

Does that work?

-DA

> 
>>>
>> Sure - so is this better:
>>
>> ``use_acpi`` - No-op in ACPI mode, the driver will consult ACPI tabees
>> for C-states on/off status in native mode.
> 
> Yes, thanks!
> 

