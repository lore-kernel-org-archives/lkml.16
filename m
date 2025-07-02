Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B67163
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 00:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751414765; cv=none; b=LsLhY97PS6FYnNehKPQKRezLOHxVOsSbfRZf1wJVQ20KnaaBnPe6+0kJqq+TOulLse2gPEWMjPQvkdsfb/u458unaNByJ7jIL5cLmm8qC1B6upc/u5aKTkkTWtTpQmNfIHABcnH94uotevhOdy3VYp2cHhOOdp9flRcJ4UGJjno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751414765; c=relaxed/simple;
	bh=bIMTi4MWsgaUbmZu8ndOxvFLqagge7bVFXfE8u72634=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RCNOw8WZUzFaDUoY/o/bfVJznbviX18vPEK8IygXEPHIjuyZEYbJN/UqoJXy+Casl3ACSfQTrml+5nz06cIuOeF6XxXj6Gr2dU5+ZzePnNUl555kQ/ejE8jBIaLNPRbQjlfOV/BBFQjDfjCKbrdrZeXJ4nBKTIi4tv/2H39CCl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=CVNb94Iv; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="CVNb94Iv"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a6cd1a6fecso6632086f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 17:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751414760; x=1752019560; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ce3zDRJVoRRIoVuOih+y1uZIYHn+OOhDiG27OLlb9rE=;
        b=CVNb94IvQLjV3Kc0WC6Ibs+Hn96TZhMGBiKW0BKCKqBQ/sFqmF8HLm7AQUDUtwqAF5
         P4svXkkMAxLVTWrrF7uLZUjdace7iRHzoET/dR+5G9BMn64vwp8OcDUU2h81O41g8kV+
         RDHL7G9RcMRjTwfBpDBDQi2QDm0w/RyiptwPLehfdv7Y0yXGeRNwCMwvx4cnngNMO4lc
         mVg8pEanOfRbrUKOmPkQFIIBAk6mqV7Q1BUjBaNQMGET9F/atmK+hTYylh5hOTa7VBbz
         MAFBmwvN5C46Shv1i+iv7K07DHXgxLZWHFPygr6k1W6aVQcR0neULyutljOw5NvQ3kgL
         JboA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751414760; x=1752019560;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ce3zDRJVoRRIoVuOih+y1uZIYHn+OOhDiG27OLlb9rE=;
        b=osyrBhanX4XEsSB9wX/HD40pXw/fYwmAM2hDM8TZxiNEwiP7fvedyOVSZqS7S5w0A1
         LaEGA0ke5bka2Q7/MkhIC9YcFJgj5Lf6DLp5obmcne3ayVRu014s6iolaB02ML7H2oTt
         OllgGv4mdeCni8c+lwHWrILMPTeHayuROCZVQOAhM+kSIT/cofVqlrUK9zHGNdqaKQTS
         1Yrh//aXbVcqKYs+1blsNbMyZ8lRAnlB9pFyhYtdAGDQsrPbIVPS4KKWdzgREvTlHk2R
         8r6pzzsdpX2uySFJkkP8yKssY/gVMtTfIHdImx53G33OQguxGmo9/4LrgcVad40ZqTpN
         2Ksg==
X-Forwarded-Encrypted: i=1; AJvYcCUF/7C4sKqlyadA1xnBOrlM4Km9hK37qs075E6I691EvcXqGmDi1vmK70+xVDDazkCwqU721/blal6deP8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzxo+u1hZCFY8TQW+MAv5RVL01WxMIDj9SN5hOxrK+KMrEjrNMe
	AIou3Ndl4JIizPjvM3Z2jiPqlxdamYX80atJa5a2pIqjqI/+JERKhUluXo33IxdroA==
X-Gm-Gg: ASbGncvDLlgJdxGa8UClOUeByaBy5gf11go3xu8ayCf7NAkP6BaNCzGspf04IPl+0li
	eTi2jd0sp1jdnEi6E3BptCOtwaIvou2r5dBerHAqDbRDEezAte5qdkjzqiSfroekiDk8awnFTqw
	uxIo28Oqql91PA2TImrGe8WWc1O9BdsrzI8xWK7rbDnAqJYPQFER9OLMgBY0WUdutQvHcvgmLmp
	wkcweNDHohNU4UVnMvJnWhaYvutlaShwiu+SqWmDciFrjkJQnTr88hJdIQeTaiWiwFeH1bCSgZT
	Q9eXbgJ5v1g9D4e/fSTATAV2tWDrPkn7WFDNsgw/lB2Wemv3ke5SDcyaq3B1+w==
X-Google-Smtp-Source: AGHT+IHgFK+x5iOOCR7s+Jwca4C328dxRJPFWJLVCE70nVrrFL6mJkkvUSJeMxzZnHxSrAYyY3US1Q==
X-Received: by 2002:a05:6000:2dc1:b0:3a4:d83a:eb4c with SMTP id ffacd0b85a97d-3b2013f8c90mr292003f8f.57.1751414760277;
        Tue, 01 Jul 2025 17:06:00 -0700 (PDT)
Received: from MiWiFi-CR6608-srv ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-318c14fd6b5sm12475850a91.35.2025.07.01.17.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 17:05:59 -0700 (PDT)
Date: Wed, 2 Jul 2025 08:05:23 -0400
From: Wei Gao <wegao@suse.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Terry Tritton <terry.tritton@linaro.org>, Shuah Khan <shuah@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	=?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
	ttritton@google.com, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] selftests/futex: Convert 32bit timespec struct to
 64bit version for 32bit compatibility mode
Message-ID: <aGUggwe_gJon_2E3@MiWiFi-CR6608-srv>
References: <20250701142313.9880-1-terry.tritton@linaro.org>
 <87ikkblkff.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ikkblkff.ffs@tglx>

On Tue, Jul 01, 2025 at 10:34:28PM +0200, Thomas Gleixner wrote:
> On Tue, Jul 01 2025 at 15:23, Terry Tritton wrote:
> > Futex_waitv can not accept old_timespec32 struct, so userspace should
> > convert it from 32bit to 64bit before syscall in 32bit compatible mode.
> >
> > This fix is based off [1]
> >
> > Link: https://lore.kernel.org/all/20231203235117.29677-1-wegao@suse.com/ [1]
> >
> > Signed-off-by: Wei Gao <wegao@suse.com>
> > Signed-off-by: Terry Tritton <terry.tritton@linaro.org>
> 
> This is still wrong.
> 
> If it is based on someone else work, then you need to attribute it
> Originally-by and omit the Signed-off-by of the original author.
> 
> If you just picked it up and adopted it to a later kernel version then
> you need to add 'From: Original Author' and preserve his Signed-off-by.

@Terry @Thomas, Thank you both for the mention in the commit. I appreciate being included.
I guess above options both good.

> 
> If you collaborated with him, then you want to use Co-developed-by.
> 
> All of this is documented in Documentation/process/
> 
