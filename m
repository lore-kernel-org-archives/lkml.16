Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D82484039
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 15:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744297596; cv=none; b=Y42qmX9X43qocFliuKnKrN8zAd0bTlI1jIYjrcdD58ldQe4mQaZ6wI1rZC9/4+B0BrjRc7KHbbd00VFfHULlPy8mgGjO2Tv/QYYeKKOCx/HcPM9vO4k7hnf7P4mH180MHmMDzGeRV0ttdRcsnjPTanHuZhR5KFu573miBPp7ymY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744297596; c=relaxed/simple;
	bh=vHZm5SOl3X4jMM+xMEuMfIzkZXSBFxMmX8Ur/ZaHl4c=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=UURQxXnWY9tfPi2KkSF0IQVAuAphOMjf1SEZnsFVG4ntfH7GTc+5cmmK5S5SWXtvoOS/lsDOOp0jhuH7diRTnSFRVERV41Zl1KzyOglAgLkj0yMniBzHjsqEeIvfGFn0zGvIJc3PFGjJB0RDZM8jjRZzEEu+ZBXrvfRT9D6gCog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=chr7qDJU; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="chr7qDJU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744297594;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qIhuXajAbGCms/ziWZp+4wESEH4orURgdhorzcqWv0U=;
	b=chr7qDJU+oBAe4QRbu7daFJsqT8YYoPuz63s2ylIswEgKS6yPbb46G1r60ClvuThV0JXQU
	fOBS1TEhXqZnAG8T5soAbxb63HY/Nw/i7LlJvrJrYVbQEgcGNj+CiAyfXAySFpFvEjEneG
	jXMVkRbC5n+h/NPWEi5BL8OY1eswtWo=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-206-4CyBuwADPqKUknJOClG06Q-1; Thu, 10 Apr 2025 11:06:31 -0400
X-MC-Unique: 4CyBuwADPqKUknJOClG06Q-1
X-Mimecast-MFC-AGG-ID: 4CyBuwADPqKUknJOClG06Q_1744297591
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c793d573b2so175429085a.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 08:06:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744297590; x=1744902390;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qIhuXajAbGCms/ziWZp+4wESEH4orURgdhorzcqWv0U=;
        b=vx8VS/bDeiOjyxRkRGf4g947OjuGO4LqGDcKOm/HPGszJ2r082rCdc0+CNiy6GoIqj
         YPF57+kqWycsoe9Jnr8jfdAMHtGKkqrAoc4gSJPiH2el4z2H0p2ni3u1v9qPxIhtks3D
         iwBuKEbQ+ZLscLPKWA/NPw5Kx7nP2oUek+C/63CSWix7DxMOLQjGk1V2RabXfegEaIvh
         xn709j4XivEqP/qMbf/iPxo22RxrYv0sVo5nbAk0scGP2dE1D/gaVDyh8DJ4nneFByx2
         eCsohbGjNqbTcj3VXvmbl/iiVCAnxrBlqSJMux/D1nJvjdyxIBupsmlpp/pE2E6eZ5gp
         UaEg==
X-Forwarded-Encrypted: i=1; AJvYcCU8cfij7uA9fQ0Ahjj46XxwoYjNonSFDtOC/CzQTuU9MG3NnAVfKvLqiLAQlLE8wycI5+/3Vi4PuZgEkYM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6oeuWCh00gPzHda9HL+CSjmwdPYEGL4iEjaA+UBKTZN7mqh4/
	EJreTn61RZ8ZFUmj4UxrVhx75RnlzstyXU2m0RKqIWxzRqEaS7KmOCnumYpVOwuZBSabCXdmvnH
	My/Oi0smdRn93gLjCt/OF+3oNRRC5mINuRT+m9G1TOkHEkMtI0+5VjHr5rf8Q11KcavtMoQ==
X-Gm-Gg: ASbGncs24p3ew8htKzQOk2gvFQ2BG3lmVWyhmq3b/kcXn82B/gAjtsLNWSEZaP/QaFv
	SFZtSReqsLAzXLg9Jq68tKS1kHm28TMy6OO1YF0LEDJoSd/mBLJpE7p+awRZsDGFo00MvFs5o9U
	oKqErUb0eWpSuWZenrgaJv3bb+kD8HXUSJrkVPuxtSfgGoRW0qfXgwSitQO+oydz/1jwiRAQBPr
	30/0mbc4gmtj0NrDx87cfn2GMSAN3ONzwOBkQEkr7kak8IcjNhEOHHTueOnrJKzEKnlysl1EbHF
	HpxqYiGqy6Q22gT3itEiN/sNtKmGxwJSe+Ra5JjebT4iujXITbEBuhVYKw==
X-Received: by 2002:a05:620a:4609:b0:7c7:a356:105d with SMTP id af79cd13be357-7c7a7654feemr406518285a.4.1744297589983;
        Thu, 10 Apr 2025 08:06:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHTV0chasRZUb90x4YxrDnOrfQQbAHNNJ198zLNZD+JqFVlN+LdY/tKjh70QRgl5irR2mKTBA==
X-Received: by 2002:a05:620a:4609:b0:7c7:a356:105d with SMTP id af79cd13be357-7c7a7654feemr406512085a.4.1744297589478;
        Thu, 10 Apr 2025 08:06:29 -0700 (PDT)
Received: from ?IPV6:2601:188:c100:5710:315f:57b3:b997:5fca? ([2601:188:c100:5710:315f:57b3:b997:5fca])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a8943834sm100590285a.22.2025.04.10.08.06.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 08:06:28 -0700 (PDT)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <8a8b916f-0154-4a65-b7e9-b99fbaa28dd7@redhat.com>
Date: Thu, 10 Apr 2025 11:06:28 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] timers: Exclude isolated cpus from timer migation
To: Frederic Weisbecker <frederic@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>
Cc: Gabriele Monaco <gmonaco@redhat.com>, linux-kernel@vger.kernel.org
References: <20250410065446.57304-2-gmonaco@redhat.com> <87ecy0tob1.ffs@tglx>
 <2c9d71fd79d7d1cec66e48bcb87b39a874858f01.camel@redhat.com>
 <Z_fBq2AQjzyg8m5w@localhost.localdomain> <87wmbsrwca.ffs@tglx>
 <Z_fHLM4nWP5XVGBU@localhost.localdomain>
 <4fdc6582c828fbcd8c6ad202ed7ab560134d1fc3.camel@redhat.com>
 <Z_fTmzdvLEmrAth6@localhost.localdomain> <87semgrs5t.ffs@tglx>
 <Z_fbimtUBqBiWr16@localhost.localdomain>
Content-Language: en-US
In-Reply-To: <Z_fbimtUBqBiWr16@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/10/25 10:54 AM, Frederic Weisbecker wrote:
> Le Thu, Apr 10, 2025 at 04:46:06PM +0200, Thomas Gleixner a écrit :
>> On Thu, Apr 10 2025 at 16:20, Frederic Weisbecker wrote:
>>> Le Thu, Apr 10, 2025 at 03:56:02PM +0200, Gabriele Monaco a écrit :
>>>> On Thu, 2025-04-10 at 15:27 +0200, Frederic Weisbecker wrote:
>>>>> But how do we handle global timers that have been initialized and
>>>>> queued from
>>>>> isolated CPUs?
>>>> I need to sketch a bit more the solution but the rough idea is:
>>>> 1. isolated CPUs don't pull remote timers
>>> That's the "easy" part.
>>>
>>>> 2. isolated CPUs ignore their global timers and let others pull them
>>>>    perhaps with some more logic to avoid it expiring
>>> This will always involve added overhead because you may need to wake up
>>> a CPU upon enqueueing a global timer to make sure it will be handled.
>>> At least when all other CPUs are idle.
>> Which is true for the remote enqueue path too. But you inflict the
>> handling of this muck into the generic enqueue path as you have to turn
>> a 'global' timer into a remote timer right in the hot path.
> Fair point.
>
>> When you enqueue it in the regular way on the 'global' list, then you
>> can delegate the expiry to a remote CPU on return to user, no?
> If you're referring to nohz_full, it's not a problem there because
> it's already considered as an idle CPU.
>
> But for isolcpus alone that notification is necessary. I'm not sure
> if return to user is the best place. I hear that some kernel threads
> can spend a lot of time doing things...
>
> But to begin with, is this all really necessary for isolcpus users?
>
In some of the actual customer use cases that I have seen, both 
"nohz_full" and "isolcpus" are set to the same set of CPUs to achieve 
maximum isolation. isolcpus have domain and managed_irq that are not 
covered by nohz_full. As isolcpus=nohz has been extended to be 
equivalent to nohz_full, users can now just use "isolcpus" to achieve 
that maximum CPU isolation.

Cheers,
Longman

