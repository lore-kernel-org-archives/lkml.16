Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82FC770824
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 14:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750517920; cv=none; b=C4RozYQFbrHAHLmm6K3kW0zhARbVpq+gBpbmvNnWYxlqFbopfTdrVyI5VGZIQRRq2Zsy/lv8U8tXRP7TuaVHdLRYyc/MX/mN72EQsUVQ4XY+kDG7KP3SH6skpb0FFV9PRU5VhW1VdVVQE5RxEw7IebQ5hQ8xLcCQHzeHT35EZM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750517920; c=relaxed/simple;
	bh=cTBQVTCdGMdyBgmhvqGFZoxmqDp/hfYxMNk9eCGvKPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qs9663Fs3kZSSa93oOlpN5j9oLvFAoRbhOgv0aR1LAP7wRSeg/yw4ZOpxgNskP2xqcCC5ROFMzGkdIHCPwFoKFHI+3V/DuTr9hF4f6qgIleCshQg46m2DZ5RmRoNmSaqyBWL4AbFL4a5FrRYAg7ckuGAC+6SaQcgHgTt/nTwjPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A8upGduV; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A8upGduV"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3134c67a173so2933581a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 07:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750517918; x=1751122718; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VGu3drOqe9DL5LNux9CmN1TEJbosRK8OmU6Vzce5DIY=;
        b=A8upGduVdcaaeR8BET5ZCFvikxLWx1pV/HcUthdJGwiIe0meFT3L8yC8NMBQIDa//q
         qQXO0lOGfpgSbxrrcF0qLcMT74L5RvX8El+4lROriTEIQMVXbatQvqHYqea1pjPtSevs
         sHbiF+OzXNFmjEdEVW0TtmcySCpCvINTFMDCAWmuEpsrA+jFcevdVZ3mJPRiuRsOo3XL
         5I8tvO5isBs9pIGwJ6pIZ3T1vcJEfr3X6HFdbfpi7NdXSKmAe03iDTQFYZOUv8B4M2XA
         hVPc+lwjNFUxU1QqZ7UoUixnXng4Q9wqo4oq90Nt6ZkuMZC/C9baatQhumDDsEfA66aE
         aMZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750517918; x=1751122718;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VGu3drOqe9DL5LNux9CmN1TEJbosRK8OmU6Vzce5DIY=;
        b=rmdyG19vMaon4j2iCB/jMPghC1yr1YXZBwFeMSQTyO56lhAj3IbZzVp0DhM8QxUK01
         O5tQy/hKG0qcd9ud3ldHVRlD4yT8L378sdvR6XASBDExrnvjOHlf6Gir5WxXOxxzSN8b
         FY9u2/bmT6ixwzrcYetgl7he4nHShJmfehvSV97ciH7sF59GKwmlgjm/DEFSliA9j9mV
         +sc5LIJAg+WKL1eDodTq2KLYDsWf8Nld7co+Qv738hMQCDbPZx6G2+ZgfQg6BhbDfOnb
         YeKfHQjGyVaKY7ele/t9OF7YBr2DtmwHM04BRNqI2ztd4pj2p7t/YqKRsLf8SDtsn+iB
         XZrg==
X-Gm-Message-State: AOJu0YwOdLgBYFcnfg0OwjPzde9QE+Aqimsvox5TF3l+3tnNtg2YA3tv
	Cgi8dLFU+2t0IkpG8tkZOaaNB2cbckTIRIUo3IevDtJOcf1h2sx8BJlhpHPIog==
X-Gm-Gg: ASbGncu0L20/+pNOSijAmTK8bpycc32/DDvW50Y6n9cxJw1pkIUQnXJsvDe/QS/uNEi
	LQuOjYVcJgRVLbmiimGlct86LAh/OJ9kge7r1ae8CVf/2ZoT/Ftxn1uMDSfV/2FgP92SEERUDJA
	RUWgaHY0Z8MebwdpTTiMPw/hAOF7dxr2KH59eRvDuzXrp3Uoe7tfXXms6ghyNfUetNU529zysBa
	1f2E5SnlYYN/IEAFsLfl4zma+NyqYj45TDPT2FsUmuYEFEIf0bcFAnJWX8DuudIqg0k5UiFEHUV
	bg8q3cJAxuKNnYCXgTBOavVNPH+/+jbXfzgTa4s+YnPeSvA7ojniFITCXdjTj547LXkHVZ25
X-Google-Smtp-Source: AGHT+IE+pP0yiqSfeXSKo3qhjVOhKoQZK8H5pOssiqxyJckS9S4H2hglZilpYNERIbi9ib1tNwwMkw==
X-Received: by 2002:a17:90a:dfc8:b0:312:1508:fb4e with SMTP id 98e67ed59e1d1-3159d8c5dfcmr12665976a91.17.1750517917611;
        Sat, 21 Jun 2025 07:58:37 -0700 (PDT)
Received: from localhost ([216.228.127.128])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3159df71c24sm4023787a91.3.2025.06.21.07.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 07:58:37 -0700 (PDT)
Date: Sat, 21 Jun 2025 10:58:35 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Doug Anderson <dianders@chromium.org>
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] watchdog: fix opencoded cpumask_next_wrap() in
 watchdog_next_cpu()
Message-ID: <aFbIm97L3idgQYLD@yury>
References: <20250605001253.46084-1-yury.norov@gmail.com>
 <CAD=FV=VzTK517-JMRNBQ6_YtOQKqQEfO_7-pt5H+w1jsUtpqGg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=VzTK517-JMRNBQ6_YtOQKqQEfO_7-pt5H+w1jsUtpqGg@mail.gmail.com>

On Mon, Jun 09, 2025 at 10:16:51AM -0700, Doug Anderson wrote:
> Hi,
> 
> On Wed, Jun 4, 2025 at 5:12 PM Yury Norov <yury.norov@gmail.com> wrote:
> >
> > From: Yury Norov [NVIDIA] <yury.norov@gmail.com>
> >
> > The dedicated helper is more verbose and efficient comparing to
> > cpumask_next() followed by cpumask_first().
> >
> > Signed-off-by: Yury Norov [NVIDIA] <yury.norov@gmail.com>
> > ---
> >  kernel/watchdog_buddy.c | 5 +----
> >  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Thanks, Douglas. Adding in bitmap-for-next for testing.
