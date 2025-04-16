Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42AD022425D
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 18:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744829547; cv=none; b=GvOfx3jxFcpcZzKU+iaeEKrgDZ3cXTo32H6SiJL9awze9C8MZdJlw/lDyJyjX7cVcjQOd84lnSTv+LKInZu0eepPC830JZD+VSCGV8FBzawjFXfWGvfakdR3tAU4ih6u1NWuaFoh8H7+3Cm4KfUlezD9lamRbVbva3uiuCDLOYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744829547; c=relaxed/simple;
	bh=MP3MEPXxiW0y+zqENt1iZmdSIe99ISiyPFjriypvPQI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=McLc1uy3RpeGQsSw6f2/HQdFvIlvIHpF5fdhY9mbgYV6AJ8TtdOckRICza5zNnQ+M8++stTt1CkGFe2wTQ53YTdOVy43nZCtEQCeUoBBu5gzBkY0eCthjgdhMk1wUnxz6/dgAlTQ1eD1KzKd+wgQuws29oqFptpQYF20IMhCpBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=GohNG6cH; arc=none smtp.client-ip=209.85.166.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="GohNG6cH"
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-3d57143ee39so157455ab.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 11:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1744829544; x=1745434344; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p7MoVykQROxUe2maoaPkdBQ7x8hTpGUg8xmb62S+DQ8=;
        b=GohNG6cHFcpOKsh9M0P/tMzijNuEpfgFkxsjeynZuSnwKEj/RR4y8lr4afR2aTX0F4
         Ae1EfrNLOOYinNvCrqh4LL97clCiMs1p7KszoeO8m1NV7yMTXpw7fRxWM044PUux/H00
         sTpater66STZmD1BUni9+LQxE9bUX34Qk9KZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744829544; x=1745434344;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p7MoVykQROxUe2maoaPkdBQ7x8hTpGUg8xmb62S+DQ8=;
        b=RodA9BQHUNdj74nLVU+bNvN1hwVRZJ8vkzM5fYVIFy6wHO8NNdtcbeJHl4tMDgta9I
         R9MGi+yreK42Ctf8igcGKctjfbYndyiXFjHsauhnRRPT6mHUySGH8zvucKusT3KSuUWE
         g/IQkz9DqfBIRkTbcn0abY7FM8o8U59JnHZUC4Pn3EkrzkxBIKNAFCebL663Q6UYfGmE
         Y8eQ/YwL0i1XJZtJ5ATFquRpdxMofNqZVes2KlvhvwZeASLeesK19ySKfoAoFlsd8fM8
         EOevphkrMKAOEFU55vdiYsUuDsV+3LruAIeAOVWptoX/KFjhyVraqonoUWXRW5QGgWKj
         Tqmw==
X-Forwarded-Encrypted: i=1; AJvYcCWbpKckV5odrknNt19z7fQnbHcbjNusaM30gBw4ysGZrCBswrKFoBY226vopxuPaAHDEDjA/42CRFk4FvU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUK5JwPYDS/1FdNdbKzMqLsj0Iz0yICI5v/knergFjs/zvTLFL
	4JUG1oLRHucXJwvPmX0/A2FnhUTlCKbu23EJDm6klJLZanR5AYVfmzRVSC0V/QQ=
X-Gm-Gg: ASbGncv3frC1l40tRFMT9MSCubUOVCrxZ7wqcwOVuxTvllE6cnZnQ1q4dWKEH//SIJt
	8APcdemiBSeCPAre4oyEOoAk8OMu2kK/CnZAs+l5CZ907mCeGkec3zR7U71JvphG6CTlOzWKMBH
	5K3CgyjXPyFNTgTZPC5/NuNLP/FsMwFVGLTmuExxSUhQZNQIpI+GzKVIfHKh7QUcb/QZlk+Tw5k
	C5f+NpwEiWkDrcoxXc7e3F0UDZsU6psRUlwiMIWsW3Uex0cu++j1k2lbiGsXvFkh1WIw4jgSFXW
	H0LedpV0J6LnqS6sXkNHQuOwEvSCpyRCIm6vjQPw1xvI3UJfDVA=
X-Google-Smtp-Source: AGHT+IGIdvCjfpOGUqUnUYJh8CVNLblQA7dCofVWf09VAklKBR/jcQuZcH92lgy+WOSL6Lk0pA4EKQ==
X-Received: by 2002:a05:6e02:1fe4:b0:3d4:3d63:e076 with SMTP id e9e14a558f8ab-3d815b5e781mr30114755ab.18.1744829544363;
        Wed, 16 Apr 2025 11:52:24 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505d16a79sm3773037173.50.2025.04.16.11.52.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 11:52:23 -0700 (PDT)
Message-ID: <55ab926b-26a5-4497-a6f5-8ea18ba8e454@linuxfoundation.org>
Date: Wed, 16 Apr 2025 12:52:23 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/ftrace: Differentiate bash and dash in
 dynevent_limitations.tc
To: Steven Rostedt <rostedt@goodmis.org>
Cc: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Linux Trace Kernel <linux-trace-kernel@vger.kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Mark Rutland <mark.rutland@arm.com>, Mark Brown <broonie@kernel.org>,
 linux-kselftest@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20250414210900.4de5e8b9@gandalf.local.home>
 <20250416075832.cd27bcb52b7e31d0f5717273@kernel.org>
 <658670d0-086b-49e9-85ac-3e002fa8322b@linuxfoundation.org>
 <20250415205442.2437cea3@batman.local.home>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250415205442.2437cea3@batman.local.home>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/15/25 18:54, Steven Rostedt wrote:
> On Tue, 15 Apr 2025 17:03:44 -0600
> Shuah Khan <skhan@linuxfoundation.org> wrote:
> 
>>> Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
>>>    
>>
>> Steve, do you want me to pick this up for rc3?
> 
> Hi Shuah,
> 
> Yes, can you please. But can you change the Closes tag to:
> 
> Closes: https://lore.kernel.org/all/350786cc-9e40-4396-ab95-4f10d69122fb@sirena.org.uk/
> 
> Because the one I had was the top of the thread which is about a
> different bug. Mark mentioned this bug in the middle of the thread and
> the above link is where Mark mentioned it.
> 

Done. Applied to linux-kselftest fixes branch for next rc.
https://web.git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git/log/?h=fixes

thanks,
-- Shuah

