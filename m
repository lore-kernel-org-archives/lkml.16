Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F214E28A1C4
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 15:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745595159; cv=none; b=ppwOQ3EklPZRo/p/GuSJYtyHqF8W5v1BFlqe+WxZyMW3SYE5yGhZTyqDworIBvnVTIjhpb07jyLO7yciW5P64wgTkompmvihS0yZM6co287yPTqG5huBh5DinUFT/X9zx7giezLs1s6tGkmuYPWKh6lYWPTBdEnUtcuOdkBwjrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745595159; c=relaxed/simple;
	bh=3oR3DInuCHzHMyhCIN0ryjMS6xvCykvTUTuISe8kVOU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kYI6yhwIgp9mMDez/ECkvC9gGHyMPuOrFbDHjh1q1Ks76LdNhElTWkEtXo/L1V6piZyKQI6WtIMi04HMUss1EOEDCnrg405gRPm3gxx6b9p5t1MQKSiDFhd6hGTEoPg9/IUF9hhBvUFREcFcV9xF48JgMa/M74KXxgE5QEATf2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=WkCSY7Y2; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="WkCSY7Y2"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7c5a88b34a6so247014485a.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 08:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1745595154; x=1746199954; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2asthD55KNrhLhfjveoWXz7Lfde6+xbDsGUdy2WM9SM=;
        b=WkCSY7Y2L/Ptk9cOUMvV1qFb9glCkUFPxbLWUZFSFfPYP2izxMJCpvkjyMR3hiXUlH
         ccoMJjpTBjpwJavdDqNJvbIIDWVAMocJIEEZUjonf3Gz7X0qSOu1cPyFFHsgY6ZrltYH
         5rSvnZCYxErgqIY9y6MBGrnDQS8CTdCObgD/8V2gV0npwTHlXdUjwSsuIRuC1lW23x3J
         +eEhmK4W56BoInT08mKWSkXhrIS5xmbLfbMPHNVU1wRqT32uim2c5acTqoPkmymrhSav
         XgaibHv9S3J0pGi/htCTZTgWdqXbbkzH7WeBohlGX9802sTbTsrm1Bgt8DW3BxXbv04I
         tlCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745595154; x=1746199954;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2asthD55KNrhLhfjveoWXz7Lfde6+xbDsGUdy2WM9SM=;
        b=YW1EP7KQYVRyGkqN0OAibuHPEF1SIRVbNh/hZYXxcS4kzm2vWL1JFl9MmtZcc04Nen
         yPmXoEHWRyJqGJ3OJ23/+sUm++Xy7f6P+kW25aq/0jgOtuaZ3qf8sXL5BdXAPAEvio4P
         /TEYm38lnHIH4Zv7XvUnRc1A/RbvKUX5UCxifl9tjBtpE92/fOJVygQy5e7vTTkk3J1X
         0RZUI40J1MNQ+A56GpSoYp6K68gejk3X32bQNTPhrLXtxGswtUCwv44X10NN+1gDsPOi
         M6gu7ADO14lZia89Fy2QvRoz4v9ivYdnsqMJLcwoaQvuaa4YhCKdm6MP5WjIKwcMd6Sd
         +vWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLmOT7w709VJCS/A5q3oqL3nZ/LgpctIdts2J+2tIU0Q/3tdeQG7nL+n/K9/V4dA2g4liE8IRVwgAnglo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxOfoY+BEj8q+va+ruDev1qIz4QkvhkZ0NxkVk7yaFcNsmxtgc
	VsEJTfrLtCH8waWJeH1KqEEj4/BU6yoX/CCxwnyKBZmRLCA/BpQXe3enki1ELPb0i1uqL6pbZZ6
	1ISA=
X-Gm-Gg: ASbGncvGrKJBUJBNlJpOTI9cH0jQwcqfwJWe1mFuyRPHcz0+siYYWh/WEmBLNbZiEwx
	sMbEI23uDN4rvDT2FwsJHMOOkuUV8I4hlO0FJlO1hVMEdiApAZkZAc+dfp7tTAH+ofJ27Dq27jV
	1RMrsGmt+IEKQw60Y49V0agv4mWS7iCVt/mOB9WAKeZgLKn8MnL/M8GbynEIBN1Dmdt7cACp+t4
	a6ztlOJ2E6yDC8kgp+JUrEa0RtPf1W6wz8AUJmJiusWtG+k9unklPKuoEmvsaZZyR5xMRM1GJ0c
	78MvozD2RRjUlkSFpgqMF+NlWEg0NDYPZUiTaaZA6L/XTHE6BA==
X-Google-Smtp-Source: AGHT+IGGNDFMq3A/3qPkkk3vuTcBJDIniA6Zbds6BvL0JT/ppafg1A4GyBmW2YxTKwrlYEuzUJHlXA==
X-Received: by 2002:a05:620a:2a0c:b0:7c5:59a6:bae2 with SMTP id af79cd13be357-7c966863bf5mr6043885a.4.1745595154670;
        Fri, 25 Apr 2025 08:32:34 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:365a:60ff:fe62:ff29])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c958e7bdfesm231289485a.75.2025.04.25.08.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 08:32:33 -0700 (PDT)
Date: Fri, 25 Apr 2025 11:32:32 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Wenchao Hao <haowenchao22@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/compaction: do not break pages whose order is larger
 than target order
Message-ID: <20250425153232.GA108388@cmpxchg.org>
References: <20250424153815.4003-1-haowenchao22@gmail.com>
 <20250424194200.GD840@cmpxchg.org>
 <CAOptpSPoc76ZSzbKJSnnfxtcDubJHC8a1zU7b=C=wdF6_wC3ww@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOptpSPoc76ZSzbKJSnnfxtcDubJHC8a1zU7b=C=wdF6_wC3ww@mail.gmail.com>

On Fri, Apr 25, 2025 at 10:28:42PM +0800, Wenchao Hao wrote:
> On Fri, Apr 25, 2025 at 3:42 AM Johannes Weiner <hannes@cmpxchg.org> wrote:
> >
> > On Thu, Apr 24, 2025 at 11:38:15PM +0800, Wenchao Hao wrote:
> > > When scanning free pages for memory compaction, if the compaction target
> > > order is explicitly specified, do not split pages in buddy whose order
> > > are larger than compaction target order.
> >
> > Have you observed this to be an issue in practice?
> >
> > compact_finished() would have bailed if such a page had existed.
> >
> 
> Yes, when proactive memory compaction is enabled, there may be situations
> where the order of isolated free pages is greater than the compaction
> requested order, and compact_finished() will return continue.

proactive compaction has an order of -1?
