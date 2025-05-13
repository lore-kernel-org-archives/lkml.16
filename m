Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2484A191F89
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 01:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747100948; cv=none; b=fwPkstFTB2vTka+QLKlBQ+E9JhD/vBlPCWYBL8DqKSFo/baXpm9ZULys1SE9bTEDk8tgtAftdqQ6XzUWa9ARB1zAxaMnfTU3gANmMU+rgxNziyo2zktj3Vu3sBwk/V+4A4s2nm1J22QArZ3kgUPyMYRKJ9qD+hS5hCyGDaFTH4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747100948; c=relaxed/simple;
	bh=XR0DZnEvtPXz6GqL8llvpmZDHyr5Hnot0r48twYOqzw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YhYjM637VEi19ShZ3tJWtq51r2HmhkDmwErL/wyw2lkal47BWKfNkaWpV0Zt4nzLZiPU27g4ZtNCgVPQwwmr3Rhdckx1P76x3Hn57914tKHFITp6Wkyf2iyCi2qGyxWjRPh58Jjd7GvJ7ahyjzoub3QQO5P73DpJciI7wH06HVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=MJmnkG1b; arc=none smtp.client-ip=209.85.166.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="MJmnkG1b"
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-864a22fcdf2so163985639f.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 18:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1747100945; x=1747705745; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bBPDHnkKeDmDpBDa2SgAxE58ZEppnAX8xq/UI8zGOpA=;
        b=MJmnkG1bjWYnKscNum7DMOuLTltmbikXVcEDXrccbKO5O19EtSaBeFBGQWcLL0c/TB
         26aXuKuuA4Ub/m5edStTpvWFUBIhNlZgdRGF/s5JW79bztsFn92+beKrHIutjTNMZSor
         TAeWDLal94IQ13AJS6i7mtxc8V21bu1WKjziBqx5cqjNK6SXlhgk0amB6w3xwVsnHO5a
         kE2a2ms6WApg+97jMVadVD0r9pWSNSgqOsWkIXc8STWqCRSxW94rISRy0zvtPwg6KhFz
         10ueUis//KdHtpmOZAV9FRKd8+0KwzVzZ8/cxwvHEYDROk5j60hDgXerC2Ux9qWvf6CN
         vvMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747100945; x=1747705745;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bBPDHnkKeDmDpBDa2SgAxE58ZEppnAX8xq/UI8zGOpA=;
        b=mvH923+i7sZig2nIzt1sj/F06OnjqNJaiQDAnD7wkde6GEZ3b4GCXo/0j7cq0Jm2HS
         rgkmEqiLOflKPMM1B4XmxKVL0YAcSE1fYAN3d+vOr7KWeq62evLThHOev+/fCdWaWl+U
         3/SjrCp4tKtUneeOK6BpyZ6BD9zs4eGyAxkJZVAkvxQcv8snaoCWhNKBjf/q9G2VYQ+v
         AMGsVPQmDvLg0XH/flIpQ34IdXeWgyCJM8wFQfxXfEtbr+TjOJ6cVS9yodNPrKYESoze
         0yU3zwDRCL4okJF0bYX0gQaXUlZ1DinjiFqAzOEWyZZZqA0f9v2+PD0Efe6ZQAUdkZ+6
         HEeA==
X-Forwarded-Encrypted: i=1; AJvYcCViuwMu9eZqqJ1aSabWBOSV5U5wEV6bgxYKaffXFZiclGKG7cKsdoivCQaAZaf+sURSA+5oGXFb3qFfREk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2KTYBaCskjtTeJN70uq5mitTkwJxiL/cJedwLP8Py3FYh7MU3
	wg/FOZ3aB/XEO3yYHYI6Bo6NjYDiOSCLC9FfaufrVRkdtrBpwduzTkoYRlYVU+8=
X-Gm-Gg: ASbGncuBd5iBhS8cX5wCFdbvt5yzW0i/0JP7vFsRK4srEflOmFFXarkOs9FYqDt/Usr
	W50911i9+6TODZVgdMmV20vN7L7GM2FFoP1j/gLv74BcxPXSBUBnKKSMl1VlNnP+M0vnOvGoZ4K
	t/Oiihi8aUov2OqfDWdv35rx7JaZ3CGo8EntRnfU8lAohl5Edd3ZMjAgQO/KUcgn5RrpySzPXgK
	j0ZBI1hKznvjEnzawRmnyFo+dqpF+DpeF83/Q9NVyqpy9dcuwzzRYeCjaQNL0edyoHSlikuwMDp
	U4Yphf2Y/wHNhO5oFilyhSf501ifNqVJmodDqzoh3sLBtf42
X-Google-Smtp-Source: AGHT+IFTJHT5B9YdkW5HUOi235WCqkDs50fBKdItsfkTyG4tYu856BxjsQUtfq0QRa/xjFTzFY+eAA==
X-Received: by 2002:a05:6e02:3b09:b0:3d3:fa69:6755 with SMTP id e9e14a558f8ab-3db663b8eb2mr18525795ab.5.1747100945004;
        Mon, 12 May 2025 18:49:05 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3da7e158975sm26102295ab.49.2025.05.12.18.49.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 18:49:04 -0700 (PDT)
Message-ID: <70293376-71b0-4b9d-b3c1-224b640f470b@kernel.dk>
Date: Mon, 12 May 2025 19:49:03 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] relay: Remove unused relay_late_setup_files
To: Jason Xing <kerneljasonxing@gmail.com>,
 Christoph Hellwig <hch@infradead.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, corbet@lwn.net,
 linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux@treblig.org, viro@zeniv.linux.org.uk
References: <CAL+tcoCVjihJc=exL4hJDaLFr=CrMx=2JgYO_F_m12-LP9Lc-A@mail.gmail.com>
 <aCGR4EOcWRK6Rgfv@smile.fi.intel.com> <aCIL0zZvf1fvTahk@infradead.org>
 <CAL+tcoCJxoiGi=Ea1KCG4_ri2=GbNhhVhEV5anMLyai6qg2zeA@mail.gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <CAL+tcoCJxoiGi=Ea1KCG4_ri2=GbNhhVhEV5anMLyai6qg2zeA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/12/25 6:49 PM, Jason Xing wrote:
> On Mon, May 12, 2025 at 10:55?PM Christoph Hellwig <hch@infradead.org> wrote:
>>
>> On Mon, May 12, 2025 at 09:14:56AM +0300, Andy Shevchenko wrote:
>>> Also note, we usually do not care about the out-of-tree users. The main Q here
>>> why are they out-of-tree for so long time?
>>
>> We do not care.  If some of this ever gets submitted it can add the
>> needed helpers back.
>>
>> This entire discussion is silly.
>>
> 
> I'm surprised how you described it....
> 
> Now relay works like a filesystem which helps out-of-tree users
> transfer a large amount of data efficiently. it's totally not like
> other pure dead code. I meant what the trouble of just leaving it
> untouched in the kernel could be?
> 
> Let me put in a simpler way, two options, 1) just clean up, 2) keep it
> and help so-called 'out-of-tree' users even if you don't care. I don't
> figure out what the difficulty of keeping it is :S

I think Christoph's email was quite clear, and I also said _exactly_ the
same thing in an email two days ago: we never EVER keep code in
kernel that isn't used by in-kernel code. Period. It's not a debate,
this is the law, if you will. It's a core principle because it allows
the kernel to be maintainable, rather than need to care about out of
tree code when changes are made. Similarly, we don't have a kernel API,
not even at the source level.

This is one of the core tenets of the Linux kernel, and all in-tree code
must follow those. If you have aspirations of maintaining the relay code
going forward, you need to fully understand that. Either the dead code
goes, or the out-of-tree code that uses it must be merged. There's no
in-between.

-- 
Jens Axboe
