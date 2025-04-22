Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3DA928E5EF
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 14:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745333440; cv=none; b=IKMxSmB8yuiD45QmlpGofdxBPzxl3K9c6s2a73vogSpTQzVO1aNh/MarJzk6H/+7f5a5dSdNkXttMZpuCV3Vr8BNnvOks2vNCtuZZo98L+4bYfYjahXucOWazmszWad6JQu/vN5JnR/zc2TtsIA2BQhmJm3HsKJIIv2Fc9erExM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745333440; c=relaxed/simple;
	bh=iCimHhUd/mzUcFh965kaimeCxXedpyGd4dqO8foRRYk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jddCEwDok/cpu86Qmj64XaZLHKJZHatIpCebywK/gtTtCFMbBMhJlqeia8JUn+xK8WutvPgkXXI+sGzlYqvwaSoapJTT67wpLFL3YCwhb+/5RQBZ4UYd+IxhiLmyvTk1S8635aqaJOfFtQ44VKVcQULMTPdSiMLifO9n3VUzyrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=KSxPS/09; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="KSxPS/09"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so39488465e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 07:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745333437; x=1745938237; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UShiax+LU8LwPMZnoww3ccqot70SLTgfbw+9kx2vTD0=;
        b=KSxPS/09JDdvUfbFZYBRA1LFXygdmW/Gny7AiApXv5If/C09Y2OVjSZtjFTJEXlJmh
         zvgmrwAgrwHo0TONz46E/loH+XjV33USKjllI2rzSNmMnOQ+sSrUUkG1mi/MZ6J6waGT
         7xsM3apEaLtYPuNeZmRpOpCcLRm9u3Ln7QHH5Y4GmlmhwbaJ6bnDRF8/32RIYvS0JW9Y
         XO2ASef0y0D9Aa9xZDeVY1Hv0uy6cmgP7e2cKZWkNLhEOiOfYjVQ/zIz15hhp1VPE24/
         EiwiFtNNlLT69OqLQ1kC27RZwfhKXavYRwg6F2V1Q56Rl/ixQfmXguVTuUANZ+zqYbIK
         mohQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745333437; x=1745938237;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UShiax+LU8LwPMZnoww3ccqot70SLTgfbw+9kx2vTD0=;
        b=MKC83d+WQHOnZHX8TOjCaQ8iN74qfMCP6PMAzfhxp+ztpGWZW/+hMfrMwp6fOgs27t
         3EjvSdJhsqFMK5MH1KevNcrRE1f0BAtdJrEuogcbLclOeDGUTm7y5AHfvY+jPM10C7cw
         RHVBbPOMMQbS8jsouAgU88IAgfiN+0/1MuwanVMmdZY9jp3lweSTWRkbASQo9oNlS/Fn
         /efM5BW2ZO4T4LvCraJmUtvUG8TTPPRmkR/nNVgBzaXB18tWzuwEFs2oAznGrsVhDj1R
         LG/O56ovUSaw2L654HrrTFOZhYOrCfisUgOkP7Muj8ilquh+oSwEPRhmDer3Xt1n/prl
         6bGw==
X-Gm-Message-State: AOJu0YzQdLc/vJZrcI8mZJqgUsFOYFFHd2Qa0uMDPHS6KxOmFf8Movok
	5DSpPCtDL/x2wAgDR6X9kTzENUpJToKMQb6hltMYS+/RghQb3APVxyWpyFJHTUw=
X-Gm-Gg: ASbGnctfBda5Fv1uliuFS9KoSM2p3yskHYGYnTxF10Uj9AcA5Mo8lHSz7g9LqW7pEX3
	XWzpvKg4YWcc3Ott47141oS2uyL5Wb8fXbHj7BK2Q0QZCqOAR54Gg0XsffTOQzOXTF9HxC2rqZz
	RANjspJb3V1682WD+SaGy3142HtsiC3tDuWombJDny7jxtIOcrzya2UjbMg/BofufLh2pZCS+8X
	wZ+Imc0FrhNR2H3xHSy7+6CMZGM9DxqCGPb246KeU9zbmKcitYckug9gApzdS/jfPWMcknhTNIw
	Itlk/TdBwy+3vb5r5Fm4Tgt3CHaIE+TgAcu3PIcfkeU=
X-Google-Smtp-Source: AGHT+IEEQI8X/bGEgYwYK6QKG0DoD1RsbG5CG6ST27j6gHp079g1myYN7p57MYNl+GNamCTUP7hJTg==
X-Received: by 2002:a05:6000:188d:b0:39c:1424:2827 with SMTP id ffacd0b85a97d-39efba4657amr12604592f8f.15.1745333436928;
        Tue, 22 Apr 2025 07:50:36 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5aced6sm27597405e9.16.2025.04.22.07.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 07:50:36 -0700 (PDT)
Date: Tue, 22 Apr 2025 16:50:34 +0200
From: Petr Mladek <pmladek@suse.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
	Kuniyuki Iwashima <kuniyu@amazon.com>,
	Mateusz Guzik <mjguzik@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jon Pan-Doh <pandoh@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Karolina Stolarek <karolina.stolarek@oracle.com>
Subject: Re: [PATCH RFC 0/9] Reduce ratelimit's false-positive misses
Message-ID: <aAesultdR77oRaSI@pathway.suse.cz>
References: <fbe93a52-365e-47fe-93a4-44a44547d601@paulmck-laptop>
 <4edcefb0-cdbd-4422-8a08-ffc091de158e@paulmck-laptop>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4edcefb0-cdbd-4422-8a08-ffc091de158e@paulmck-laptop>

On Fri 2025-04-18 10:13:49, Paul E. McKenney wrote:
> Hello!
> 
> This v2 series replaces open-coded uses of the ratelimit_state structure
> with formal APIs, counts all rate-limit misses, replaces jiffies=0 special
> case with a flag, provides a ___ratelimit() trylock-failure fastpath
> to (almost) eliminate false-positive misses, and adds a simple test.
> 
> The key point of this series is the reduction of false-positive misses.
> 
> The individual patches are as follows:
> 
> 1.	Add trivial kunit test for ratelimit.

I have suggested few cosmetic changes for the above patch.

> 2.	Create functions to handle ratelimit_state internals.
> 
> 3.	Avoid open-coded use of ratelimit_state structure's ->missed
> 	field.
> 
> 4.	Avoid open-coded use of ratelimit_state structure's ->missed
> 	field.
> 
> 5.	Avoid open-coded use of ratelimit_state structure's internals.
> 
> 6.	Convert the ->missed field to atomic_t.
> 
> 7.	Count misses due to lock contention.
> 
> 8.	Avoid jiffies=0 special case.
> 
> 9.	Reduce ___ratelimit() false-positive rate limiting, courtesy of
> 	Petr Mladek.
> 
> 10.	Allow zero ->burst to disable ratelimiting.
> 
> 11.	Force re-initialization when rate-limiting re-enabled.
> 
> 12.	Don't flush misses counter if RATELIMIT_MSG_ON_RELEASE.
> 
> 13.	Avoid atomic decrement if already rate-limited.
> 
> 14.	Avoid atomic decrement under lock if already rate-limited.

The rest looks good. And I think that it is a great improvement.
Feel free to use for the entire patchset:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
