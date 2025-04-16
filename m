Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2340B1598F4
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 13:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744810753; cv=none; b=mbgl3zKXk0d/eZ3yYeIleS3OUmmb6rU4vtADKRZDGDEScaDwD7w9bGdmqW09MfGfaSJb22DkISXoSRTzwebWDXjDuQdrfQzuUBqzoYNaUjJAjRS0lMcWGwpfaVTZ7ZXVDgbKQzii78+ChwFFQ9YWKKNRSoUqwAz2iE1ahDWt+ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744810753; c=relaxed/simple;
	bh=gXTPoI5T8ZoVXJpDGb6l3mLTDj7peXW/zXfipaAJJzc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZUNP+6KTCuYOO6+Py9/HdZ76pVRo4riD8LS/M1yrMPrFAhLRkyUAX84O1GYNuEmJTIXAFR+h1m5EaQgoYlzbM6SuyPobzCDFGjENgmDY8wy1Bzp7cuyjWzytwoSRaCGy74G2XNf6h2wTYRnmAeMwQ9vhGXK4hE/9cLUm+daoZLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=IrzECk7d; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="IrzECk7d"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2255003f4c6so70430705ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 06:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1744810751; x=1745415551; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HQPjVTwAlpJP7gDyjMdFPiWvjeOPxcDyZfzJMUg3hr8=;
        b=IrzECk7dkGqsFtjB6oqP0MbRhUD6kI16gtqXuwuPoy5M9yIOW9IOUV0vxv0gTJhIPh
         sf/FqCHueDB2HFRpuF/uobjfejvvHydAOaUhutSxDnlEc7fWFxrH9Uti45tUoSinn8Hw
         3XM8sOOz9pPSRCfxO3f3nVAezDf6t9PLx4FZ1VyFDw4VgWT8DEUDfaZyDSw6oabvAKIQ
         gcD//vEXZVL6XHYs5RGHHj0Uu/28CbcyVtecVASW4/SWH0OQCWlYW31NKWH0vnj+BFtL
         Gpg3p9Dnihvp+xa9msY/VMsG51NlpmQotSy8o8dtNNJMxIffk5v5JUbN+jvcytDMU+YV
         vE2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744810751; x=1745415551;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HQPjVTwAlpJP7gDyjMdFPiWvjeOPxcDyZfzJMUg3hr8=;
        b=n8Z8SleG1ACgIZZnNW576t9edn2ZR0Oo4GU3Cb+Jk7QkjXB0Hj9ktyki5AA512SSnU
         FYWsSduf+AG0oltDwvYSf+jB0ZE6Q4PgO5j2nWHEmpGlY1BUbNizhxMeYnuc7VZ2xbSX
         foAoPpRSh/jaq/Q/fbuXY02UTndSLDLS/9ieiRU7Pt7XlBvpeMctJHoQKATBV3f1fFRA
         rI86q5X8Zrtvrdx3Wlmolm+bge8AfMLk107Blag27EK+mTsAi96EntcOzn1f4yIZTm32
         gFZr/8Ni1KnKmCM1L36QxIcAOFjZsov0jd6xCucuZwUXlF/pztQzJSN3l970YDdBUM6p
         khEg==
X-Forwarded-Encrypted: i=1; AJvYcCW2pisRD/5DrsYssG/UznDzQp1yRDag88el45tJY8LqJp5QQj4IPOpWl77AtBSFlv/gb86viBrMz0s2BZA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yybxkz4GCGvKKfJA91ikYQS041PYoJtTh68T5SCXzf+vtEQQF9D
	JVK1oRAqt9oHDlltld/PHVoSjVNdSgk24uvslAFrfLKM2OJIC50xlAaWf6dmUpxXNynOzXC4Gpc
	d
X-Gm-Gg: ASbGncty3HYVq+W0uyqJSs9zAVjZe949vVNr99K5jOuSBDD3zIouhduMzlpwuU+T76j
	QAsNi/oG+N0IxzpWUfbQ0V54JI+WmLiQ8zNLeqsvKBbGmkXHe96jkvLPViJkaUkyyhq+F4Fals2
	AAHbk4q1XJfxrYWf1ratjqSE2yLhyqzYSNvCXWldAYzkvBwtT+oZAoQPyiLb3YELUMr4DOuomG1
	T80f+VVL1xE0xdR7QT51QzT1aNmEZ7nb0uSbz9ZB7EdpvXibTc8IfGNX8AF15vzQ2kxN44lbbAI
	rM05AbhUpdV7NdShW6vRAn8iJlVEjkGJv+4/DIdg8qgUXSI=
X-Google-Smtp-Source: AGHT+IFoIPNDkQn7oVxuncqn9fPhp4/UfPtkr5qC8X0Eb/ohId2zdqpFsmOhFASawm3nULqiEQTX4g==
X-Received: by 2002:a17:903:2383:b0:229:1717:8826 with SMTP id d9443c01a7336-22c358fd48bmr33065235ad.28.1744810751270;
        Wed, 16 Apr 2025 06:39:11 -0700 (PDT)
Received: from medusa.lab.kspace.sh ([2601:640:8900:32c0::c137])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-22c33fcbf61sm13589115ad.201.2025.04.16.06.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 06:39:10 -0700 (PDT)
Date: Wed, 16 Apr 2025 06:39:09 -0700
From: Mohamed Khalfella <mkhalfella@purestorage.com>
To: Daniel Wagner <dwagner@suse.de>
Cc: Daniel Wagner <wagi@kernel.org>, Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>, Keith Busch <kbusch@kernel.org>,
	Hannes Reinecke <hare@suse.de>,
	John Meneghini <jmeneghi@redhat.com>, randyj@purestorage.com,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 3/3] nvme: delay failover by command quiesce timeout
Message-ID: <20250416133909.GH1868505-mkhalfella@purestorage.com>
References: <20250324-tp4129-v1-0-95a747b4c33b@kernel.org>
 <20250324-tp4129-v1-3-95a747b4c33b@kernel.org>
 <20250410085137.GE1868505-mkhalfella@purestorage.com>
 <6f0d50b2-7a16-4298-8129-c3a0b1426d26@flourine.local>
 <20250416001738.GA78596-mkhalfella@purestorage.com>
 <22e48664-63f3-4cc0-8b99-f56e98204e5b@flourine.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <22e48664-63f3-4cc0-8b99-f56e98204e5b@flourine.local>

On 2025-04-16 08:57:19 +0200, Daniel Wagner wrote:
> On Tue, Apr 15, 2025 at 05:17:38PM -0700, Mohamed Khalfella wrote:
> > Help me see this:
> > 
> > - nvme_failover_req() is the only place reqs are added to failover_list.
> > - nvme_decide_disposition() returns FAILOVER only if req has REQ_NVME_MPATH set.
> > 
> > How/where do admin requests get REQ_NVME_MPATH set?
> 
> Admin commands don't set REQ_NVME_MPATH. This is what the current code
> does and I have deliberately decided not to touch this with this RFC.
> 
> Given how much discussion the CQT/CCR feature triggers, I don't think
> it's a good idea to add this topic to this discussion.
> 

The point is that holding requests at nvme_failover_req() does not cover
admin requests. Do you plan to add support for holding admin requests in
the next revision of these patches?

> > > > - What about requests that do not go through nvme_failover_req(), like
> > > >   passthrough requests, do we not want to hold these requests until it
> > > >   is safe for them to be retried?
> > > 
> > > Pasthrough commands should fail immediately. Userland is in charge here,
> > > not the kernel. At least this what should happen here.
> > > 
> > > > - In case of controller reset or delete if nvme_disable_ctrl()
> > > >   successfully disables the controller, then we do not want to add
> > > >   canceled requests to failover_list, right? Does this implementation
> > > >   consider this case?
> > > 
> > > Not sure. I've tested a few things but I am pretty sure this RFC is far
> > > from being complete.
> > 
> > I think it does not, and maybe it should honor this. Otherwise every
> > controller reset/delete will end up holding requests unnecessarily.
> 
> Yes, this is one of the problems with the failover queue. It could be
> solved by really starting to track the delay timeout for each commands.
> But this is a lot of logic code and complexity. Thus during the
> discussion at LSFMM everyone including me, said failover queue idea
> should not be our first choice.

Got it. I assume this will be addressed in the next revision?
