Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59882235363
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 17:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738861240; cv=none; b=fsBLtIIivdZ0QMiTJUkQh94KPQXD5G9pyb2YH/dR0/o/g1r5c79YeNP5Rx5P4P90PqShcQebya0feZFqprUpr/vKHUO+JMpjQOovwdRMo6zkmYz1uPwrQrD90b17H4HAWEJo3tSHIqddQJavlDlawBkqRyqC+SaksOp9cenR3fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738861240; c=relaxed/simple;
	bh=jtdzR9MANlBGwZOBviVAF91lKt4s45NqbVwQoGqaRGk=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=UqNhoi75YtYAbmtGuRtq70IaERXDH1HbtG9awUIQ8UxtlMjif7aLe7l1p9NrAcLnTlm3Xc6Pl+ohpPi1oV9wH4dGFpQCHKmpdFqQJO3XS1/ASCEJ/3RBnhuYQXLHMLhl1O8UvusP/1IYUTY/t/F9G5wuN/jncBQUpWHtxh2i3cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=E+gYUPez; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="E+gYUPez"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738861237;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fvCsKA8QVBw7QDnLdDBiIBvBpRR72PuKjO1Bp/VHQQo=;
	b=E+gYUPeznO6cXnCkOv4MH9s2xZHl5Ndf8OgQDcHhh03xN3BbZWqDpqqNJsBPz7URNtsncE
	yrVvH1wmJH7nogBcTEr3b5H47kYH+rGSbMWMXc7zEioNZNwqU1yNL/drTzW3InWr3/xUsN
	FPI5ytXDAnR7/sp47dduFkI9LplYQTQ=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-246-iyGZr13cOIC4TTovAtLCjg-1; Thu, 06 Feb 2025 12:00:34 -0500
X-MC-Unique: iyGZr13cOIC4TTovAtLCjg-1
X-Mimecast-MFC-AGG-ID: iyGZr13cOIC4TTovAtLCjg
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-467b19b5641so22543981cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 09:00:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738861234; x=1739466034;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fvCsKA8QVBw7QDnLdDBiIBvBpRR72PuKjO1Bp/VHQQo=;
        b=WwN3rrZVx3Vz6GEfm7EuXtUpbX6nPVfGDYLjLWArrcZOhRoKvqVDuJw1AtaX1UcMim
         wH7LMxh0CVHS39DAR6P3WNX8XJnY4JMVN8xvyfHxHu0/Kf9VxTYug4qfMye2V6TvfyO/
         3PBhhCyd64T++nEYPrSkEVs+6oqUHZUtTKdnIEL2y4QDIpbqM6OvUt7PKbzd0ZiyGwM5
         XnlgyAbemb3ecwzFJoXtnu1ox3Zi1nfFd8xa2O4kueaxEnzVketTqc+Ih8fL/8Qyv7+j
         RFG/wG7wNctqiXWNsdbyXhLg2gByDQMFcg9xjvrr+c6yBUcXNePWzkma39YMcKjuwaMH
         mEAw==
X-Forwarded-Encrypted: i=1; AJvYcCU8bunIGWGZBfuQ3d9dDENt63bJRRKQwuOdJfc2PTGOJhlaPDSi7hVOpeTDyiVj3SKSlV6vPdFtEIqjPYE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNG3VofbCCG9LRIoNgjDLTnH4QCR4Gaqq292Etpy03GEfg8DIr
	zo/d5fNN7Fi0BxYbAeNZFHybRgjB4wwrB23HzWr0Z353iyeqg5zpe/9GqljDubap1Ym4rdy9bp6
	2XP2wyynyAVPIN07pCXoc6mshm7MGG6ZWh5GpnoAxVdFgNM31hUrXB4K3GozP1A==
X-Gm-Gg: ASbGncu0SM5Jkybw73TQ/Clulm/2KbMtGgZMoQDz8fcl/OzS3eQmDDL2LSbTjPg4Lcn
	UNtJiG+2uDLWY4MmR9YxoZhD7ZxG1dI6qGdjX/UOc9Pn2ZnRg1UVLa9TuHrZTlGP18ucLQOehlz
	pErO1Q3rhG79803ESKEbvK6s4te4dk2cWFIzFiXrnNb9A2kR8/c4XNqnZV1xfgeA8OA7CLQcdEk
	i3nU8EsmBKmrshzifQFQramS6cAMsLuErGvuelaU3PeVqVmlahZ0AuxsQqR2P2cWONoowVvei8t
	KyQNoorC0vS/JSk83RCGQvEk8dsTXXdsIqGyFmV1cYphSu94
X-Received: by 2002:ac8:7f50:0:b0:46c:870f:f625 with SMTP id d75a77b69052e-470281e9ff9mr107129071cf.29.1738861234164;
        Thu, 06 Feb 2025 09:00:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEJHBVjFDA+2ZbDy5yUMfUknNB5yZftD3UlCDEvW8Q8Ah3Fd0uW6pON2he89Imb/0rgCrJ++Q==
X-Received: by 2002:ac8:7f50:0:b0:46c:870f:f625 with SMTP id d75a77b69052e-470281e9ff9mr107128541cf.29.1738861233762;
        Thu, 06 Feb 2025 09:00:33 -0800 (PST)
Received: from ?IPV6:2601:188:c100:5710:627d:9ff:fe85:9ade? ([2601:188:c100:5710:627d:9ff:fe85:9ade])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-471492a90bcsm7026631cf.31.2025.02.06.09.00.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 09:00:33 -0800 (PST)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <2ed01b76-0a8d-48ec-a366-40bca78de93e@redhat.com>
Date: Thu, 6 Feb 2025 12:00:31 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] x86/nmi: Add an emergency handler in nmi_desc & use it
 in nmi_shootdown_cpus()
To: Thomas Gleixner <tglx@linutronix.de>, Waiman Long <llong@redhat.com>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Peter Zijlstra <peterz@infradead.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Rik van Riel <riel@surriel.com>
References: <20241219150653.349177-1-longman@redhat.com> <87a5b0oihc.ffs@tglx>
 <cf3a8f45-683e-4fbc-bee7-cfae73d9061c@redhat.com> <871pwbnj8k.ffs@tglx>
Content-Language: en-US
In-Reply-To: <871pwbnj8k.ffs@tglx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/6/25 11:14 AM, Thomas Gleixner wrote:
> On Wed, Feb 05 2025 at 21:46, Waiman Long wrote:
>> On 2/5/25 4:20 AM, Thomas Gleixner wrote:
>>>> +int set_emergency_nmi_handler(unsigned int type, nmi_handler_t handler)
>>>> +{
>>>> +	struct nmi_desc *desc = nmi_to_desc(type);
>>>> +	nmi_handler_t orig = NULL;
>>>> +
>>>> +	if (!handler) {
>>>> +		orig = READ_ONCE(desc->emerg_handler);
>>>> +		WARN_ON_ONCE(!orig);
>>>> +	}
>>>> +
>>>> +	if (try_cmpxchg(&desc->emerg_handler, &orig, handler))
>>>> +		return 0;
>>> What's the point of this cmpxchg()? What's the concurrency problem this
>>> tries to address?
>> It is because I am not sure if there can only be one instance of
>> nmi_shootdown_cpus() at any time. If there can't be more than one
>> instance, I can remove the atomic instruction.
> There are two ways to get there:
>
>    1) crash(), which installs a handler
>
>    2) emergency_reboot(), which sets the handler to NULL
>
> If they interfere, then the callback is the least of your
> worries. That's already broken today in so many other ways.

OK, I will remove the atomic instruction in the next version. Thanks for 
the explanation.

Cheers,
Longman

