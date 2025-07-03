Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7842E3B06
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 11:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751543930; cv=none; b=S70jCx8s3hZUnMF52rgC2MA3ykNXqW1M+ZuUufCIK8RzYPnEzqPdjdJi12oYmY85WK78wWaiWw6dA3geN1uhtgBQl3vc7dPkfAC8QJUVZUqX6Yk9PnAcCYqB2VEX4TsA5GnrxHKwvGSmq0hY5XUeDi2bvzVMpcKkfTeoEKtIdYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751543930; c=relaxed/simple;
	bh=KVnqP49xtAT/39pjm4SB9D/z0i6aE60n2/FV7cQXGhg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mfkFMwMZ/L1GXAqFt3vMqTDNEfPxtJBW5PHh75Dbtk5Sib+yuL7oUuRw1+D4jgQPWxgfmuLanjYz60zKJng4z4QVPZ9YH5wCLk9E04+4ClRBB9mrYHNCcU0oQuQ9VGOPr6+PyodMQRSWNA3dGFRCTML+QjGQJ6op0JmRLdV+VdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Px7qolil; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Px7qolil"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45310223677so38774985e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 04:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751543926; x=1752148726; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FEy1REQsSnGLpJgUJbCYOfsqXwvfobdRMduB/tZDIyg=;
        b=Px7qolilG0WfQoeFjc1mS8RaxY9VEdTeUiX9N+T1IzUGREecADWCG+5vVSIkaCBY+H
         3h23kG1+yfEfc52JwDa/Gyr4cF06QjPP3o0GSw/8zTtLq0f7BvYvJY5+n1yRWi+7wy7/
         0wMsB61OeUWqUbig4hNgZWBHt9g4ofjq7lvIdnmetzZxWJ1/ezJruzVLs6Tl7nhBaeHt
         nkwCrzBpoEdt66fmgucPKr5YJ6ZLm2Fq7yVFeUjVVjZrBG9IDNb2tcatjWqQCKPQdQgs
         V7EqfkHHIWaWLoUxuY2oWiye+Msv4SY4UxX2dIRv6OSxiUJiT3BMZjTuFW2PWH4wEVIn
         h7cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751543926; x=1752148726;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FEy1REQsSnGLpJgUJbCYOfsqXwvfobdRMduB/tZDIyg=;
        b=H5Obq3a5wa9onZYNwfGRDz0IZBpI8Wz38RKLbhNx52GgkGtNgzSB+Oh29dRJsL4NDX
         YBSRudAnmUIk5joxW9GYCuy5Fio/WcuLa8s7q2OyF1RqJ4Zhfdl+Gt2dL8ZYSGL48tJL
         pZ0l3Oi//kmXvHssQqnhrcmQv+AuudmtLJRjTWG+VodvTENvcdHMyWbkkU4fCptgHPZu
         EwYBoxg8Sh9+bknl8fodYOPUv2lXAPTS7NZS719p8wW5CAKlGE52cDWcRLstmhAs4rgN
         f4oI1u18ZipBJNY8OlWkq2iR0Bpnv0KQPMBk7DPBeEs2sH2vW/uzIfZGsLOxgXuwvKmX
         rnJA==
X-Forwarded-Encrypted: i=1; AJvYcCXiHY8Avg58c7TbAi5sKDUknrZ1Au68g8y2dBjeDOlq31WYeeqRTXb5LI/qNZ42VFgvc1D9CAyLPdmdAv4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1BBSXWfGJYEW3dwyXBdKvsQWepZTHMVhSMWljkO+sd8P4YbRJ
	2TOah/QrXPASc3CqQA3ZSs16Tn7cJOFpbcnVdNCQVuwXEOMCtf+XveKfOoj8h31Cmg==
X-Gm-Gg: ASbGncuytUXYJ3rNYGOpbneYdmiyQnWSIEgmcuj+Jn4uWnt7WYA5m9lYXggLUGXHyct
	a6ktxTRNNmqGkEOEd1LE7lU7c3GHSn1Dqd4oXjnUGq4VRMMhb4B1XbVvMh1/XBvmpEdr0+/3KPM
	17qwpI4lVb+RGbrmuJdsBnMxuqAHtnkMyeCkaC/Kjd4WYIK5prVDpqEjWNe4HiOEUdrfcHCBVCe
	2qcoYezbitl51Mr2EjtNgb4LMUS0aX0LFwjMOO0IyXaPRGgSDBZvL/421TwfrqHiVutfNPHOs2V
	VzMUvhW1u27Fb3yQmVfVtCg1LFoCp+0K1orTpHzer0fAlH4nQhzagrcDbzwnoQ==
X-Google-Smtp-Source: AGHT+IGmOASa0oMFT6hRpNe8aWb1lP5feRf8X2l4wmfd55rNGbp6qVKK1A5kadBg5n8uLklMz596vA==
X-Received: by 2002:a05:6000:4282:b0:3a5:2694:d75f with SMTP id ffacd0b85a97d-3b201c97157mr5254542f8f.52.1751543926246;
        Thu, 03 Jul 2025 04:58:46 -0700 (PDT)
Received: from MiWiFi-CR6608-srv ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb2f218esm161233325ad.78.2025.07.03.04.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 04:58:45 -0700 (PDT)
Date: Thu, 3 Jul 2025 19:58:06 -0400
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
Subject: Re: [PATCH v3] selftests/futex: Convert 32bit timespec struct to
 64bit version for 32bit compatibility mode
Message-ID: <aGcZDjYh6OLWRFkc@MiWiFi-CR6608-srv>
References: <20250702102157.5222-1-terry.tritton@linaro.org>
 <87y0t6jqnp.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87y0t6jqnp.ffs@tglx>

On Wed, Jul 02, 2025 at 10:15:06PM +0200, Thomas Gleixner wrote:
> On Wed, Jul 02 2025 at 11:21, Terry Tritton wrote:
> 
> > Futex_waitv can not accept old_timespec32 struct, so userspace should
> 
> sys_futex_wait()
> 
> > convert it from 32bit to 64bit before syscall in 32bit compatible mode.
> >
> > This fix is based off [1]
> >
> > Link: https://lore.kernel.org/all/20231203235117.29677-1-wegao@suse.com/ [1]
> >
> > Originally-by: Wei Gao <wegao@suse.com>
> > Signed-off-by: Terry Tritton <terry.tritton@linaro.org>
> > ---
> > Changes in v3:
> > - Fix signed-off-by chain but for real this time
> >
> > Changes in v2:
> > - Fix signed-off-by chain
> >
> >  .../testing/selftests/futex/include/futex2test.h  | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> >
> > diff --git a/tools/testing/selftests/futex/include/futex2test.h b/tools/testing/selftests/futex/include/futex2test.h
> > index ea79662405bc..6780e51eb2d6 100644
> > --- a/tools/testing/selftests/futex/include/futex2test.h
> > +++ b/tools/testing/selftests/futex/include/futex2test.h
> > @@ -55,6 +55,13 @@ struct futex32_numa {
> >  	futex_t numa;
> >  };
> >  
> > +#if !defined(__LP64__)
> > +struct timespec64 {
> > +	int64_t tv_sec;
> > +	int64_t tv_nsec;
> > +};
> > +#endif
> 
> Why not use __kernel_timespec which is the actual data type that syscall
> requests?
> 
> > +
> >  /**
> >   * futex_waitv - Wait at multiple futexes, wake on any
> >   * @waiters:    Array of waiters
> > @@ -65,7 +72,15 @@ struct futex32_numa {
> >  static inline int futex_waitv(volatile struct futex_waitv *waiters, unsigned long nr_waiters,
> >  			      unsigned long flags, struct timespec *timo, clockid_t clockid)
> >  {
> > +#if !defined(__LP64__)
> > +	struct timespec64 timo64 = {0};
> > +
> > +	timo64.tv_sec = timo->tv_sec;
> > +	timo64.tv_nsec = timo->tv_nsec;
> > +	return syscall(__NR_futex_waitv, waiters, nr_waiters, flags, &timo64, clockid);
> > +#else
> >  	return syscall(__NR_futex_waitv, waiters, nr_waiters, flags, timo, clockid);
> > +#endif
> 
> You simply can do
> 
>         struct __kernel_timespec ts = {
>         	.tv_sec = timo->tv_sec,
>                 .tv_nsec = timo->tv_nsec,
>         };
> 
>   	return syscall(__NR_futex_waitv, waiters, nr_waiters, flags, &ts, clockid);
>         
> unconditionally. No?
Thanks for your valuable comments.
Your change has more directly interacts with system calls and simplifies the code without
conditional compilation. 
Only concern from my side is test on very old kernel(But i think this is not problem for kself test)
> 
> Thanks,
> 
>         tglx
