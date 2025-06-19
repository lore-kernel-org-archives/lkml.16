Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98BDB213259
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 17:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750355825; cv=none; b=kiZTvc6GPI667xyr/IAG/0hzdlBZdSok9o0MZfsR2/TSHyVnkGOhxVHFaKxH6/Xmm84ijM1leZBZjO67haJqgIDlpnshEl0Xv63UPAv+mtZr60iI0hGplsOjD8uh2YI5KMTy1jhyQekEb3jknJRlB1wrbnnsD6uPecezoD0uOxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750355825; c=relaxed/simple;
	bh=eai0KmAEI/LXOe/M1noE2xH7znIEBHLB9tBGHx4OkBM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X7wvR7dlhbqcxn6ZvntB9SIEugoRIkVa5capG8+NCv6/HHvmmYIlSyV20zp8FONlLu/Q0Ozmz8pNbKc+M5iSzb2/SISMIYb4JXUqDtortyhiMdUku0xGR/vHaMay1Sf2qua/OoYNqFQmL0VloEHqREs7zU6+ZHWVxOqLZBvvGZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=JaRduo96; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="JaRduo96"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7d3862646eeso71887185a.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 10:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1750355822; x=1750960622; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U8d2ui7E+uX2eOaUMaNXo/P5F6Y0SfvCqCGd0JgYOPM=;
        b=JaRduo96YQ6iqnFjPO8CC98dm9mUwSs/BjQgN5vUvHBrlSgW9qoXLSTAhhfpzLqpTr
         ReoT29Udl/8KWrdG0fwp0oNpQrPgMMka35YLgFOXJlKEyJ0P/V0UWEAEN2JPTNQz1iG3
         9rGXhGvQdbb5aLcJaGMjekONyZGkd+gLzsqeI7CUj6AsW+OVAy25ta/MFCFOp1ZRvO4V
         juAtPDJHqK3YYFcDKJjvjv9YGtW3+P9db1jcyiaifMrQUx+sHNA5lKqjSzGq8khpOPbX
         Fg9KMv+3YkOgI/Jr73lL8nj9MmiLEElE1DQ1/4BaBIV2ZbB8+3vEM+PuLHDeofMMCkBj
         Ydcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750355822; x=1750960622;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U8d2ui7E+uX2eOaUMaNXo/P5F6Y0SfvCqCGd0JgYOPM=;
        b=mxsVWlaHdtC1FLEk8VuBeneNiYgOSaGbAASZuUJLx31KBCvmCljemsORQdNo5NOzuh
         M/yiZfFt1/X6ABvRV3QERo2QGSaOwyx2DcHjbHCCaBRKfLMhkhQUSfyBo8KkfOFzdBiQ
         M7J7xnylyazbJPiz5+xYiIB7OZWs/WQ/HHP7A8WzEVBMdwJJUpIpmNPmHzBLct6IsqL5
         AwQtcSZCnIdQFIN8JJyaCKKhVKGwluheVK9m6GYHvTHl8iV9agW6Nljo0WnOMwlWTGqP
         q9u4+kLo/egT5igw0sPFEiI78vcHEy4+hkG6ixNdI0xgnCeTqY35i7llzqhOk0SP9OEB
         FnGA==
X-Forwarded-Encrypted: i=1; AJvYcCXybdtxE5DGoZiwWGIebK6TiFitS8v1dMGsyT5rr71NkeFlXuXvDml6xFieKysjHTIs28UiF2eRecLM9SY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPjs2UxPmz5vHYQhIKtj+JMjkf8SJIsaTXlBGBbgFJauq5m5Fc
	Cet5Hk+f/lvOi3D2Vzo/E1hIMRuy6jN4eJEqgJH6W92TtSr4H/XMXATUN2SuIQoS9Q==
X-Gm-Gg: ASbGncvr/JT3nBnfEh9WCKZ3XSpFR/IoAskth7rXbQo36aUzVai2i2PxBDYIc48azfh
	9LR61pOuj0ctCQK2KxNQ7BjuLzaMdz2jdEY+e9gGwBYiPTwdyTunzQWvpSQd8dO2REKAkOhmv+W
	rusVXJM55FuBMSAVrLkewv+ipDP3pJzlcZfPKI6KCsW5gyIMtelANgJ545NW8Ua3ww4reprdF0c
	Tcg7stl/HjqLvKRjmzo/QZoh4zgYLtmrdS3FbBLxjjjB/97wCNOdNH1muJ07xejx6FAkC7joook
	8qhJwxl6PPgtjgj4hjPXVm44/aBN/Xc8CT8D2cMhSg53eeIcdM0QBLgUOzrCzXA=
X-Google-Smtp-Source: AGHT+IFfAivhqC/12RhcVOhHTCkxtn7BPAMKJ8jBgCMvwPH79EHDEwzW7+X8dU3ooMKnx4PjKTOoZg==
X-Received: by 2002:a05:6214:2c0d:b0:6fa:c5be:daca with SMTP id 6a1803df08f44-6fd0a4694e4mr3308996d6.7.1750355822520;
        Thu, 19 Jun 2025 10:57:02 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::9ca8])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd09593450sm2348556d6.98.2025.06.19.10.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 10:57:01 -0700 (PDT)
Date: Thu, 19 Jun 2025 13:56:58 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Thomas Haas <t.haas@tu-bs.de>
Cc: Andrea Parri <parri.andrea@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	David Howells <dhowells@redhat.com>,
	Jade Alglave <j.alglave@ucl.ac.uk>,
	Luc Maranget <luc.maranget@inria.fr>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,
	Daniel Lustig <dlustig@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	lkmm@lists.linux.dev, hernan.poncedeleon@huaweicloud.com,
	jonas.oberhauser@huaweicloud.com,
	"r.maseli@tu-bs.de" <r.maseli@tu-bs.de>
Subject: Re: [RFC] Potential problem in qspinlock due to mixed-size accesses
Message-ID: <a0887a91-468c-43ff-872e-c4c4e23b26dd@rowland.harvard.edu>
References: <cb83e3e4-9e22-4457-bf61-5614cc4396ad@tu-bs.de>
 <20250613075501.GI2273038@noisy.programming.kicks-ass.net>
 <aEwHufdehlQnBX7g@andrea>
 <9264df13-36db-4b25-b2c4-7a9701df2f4d@tu-bs.de>
 <aE-3_mJPjea62anv@andrea>
 <357b3147-22e0-4081-a9ac-524b65251d62@rowland.harvard.edu>
 <aFF3NSJD6PBMAYGY@andrea>
 <595209ed-2074-46da-8f57-be276c2e383b@tu-bs.de>
 <6ac81900-873e-415e-b5b2-96e9f7689468@rowland.harvard.edu>
 <c97665c6-2d8b-49ae-acc5-be5be04f0093@tu-bs.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c97665c6-2d8b-49ae-acc5-be5be04f0093@tu-bs.de>

On Thu, Jun 19, 2025 at 04:59:38PM +0200, Thomas Haas wrote:
> 
> 
> On 19.06.25 16:32, Alan Stern wrote:
> > On Thu, Jun 19, 2025 at 04:27:56PM +0200, Thomas Haas wrote:
> > > I support this endeavor, but from the Dartagnan side :).
> > > We already support MSA in real C/Linux code and so extending our supported
> > > Litmus fragment to MSA does not sound too hard to me.
> > > We are just missing a LKMM cat model that supports MSA.
> > 
> > To me, it doesn't feel all that easy.  I'm not even sure where to start
> > changing the LKMM.\
> > 
> > Probably the best way to keep things organized would be to begin with
> > changes to the informal operational model and then figure out how to
> > formalize them.  But what changes are needed to the operational model?
> > 
> > Alan
> 
> Of course, the difficult part is to get the model right. Maybe I shouldn't
> have said that we are "just" missing the model :).
> I'm only saying that we already have some tooling to validate changes to the
> formal model.
> 
> I think it makes sense to first play around with the tooling and changes to
> the formal model to just get a feeling of what can go wrong and what needs
> to go right. Then it might become more clear on how the informal operational
> model needs to change.
> 
> A good starting point might be to lift the existing ARM8 MSA litmus tests to
> corresponding C/LKMM litmus tests and go from there.
> If the informal operational model fails to explain them, then it needs to
> change. This goes only one way though: if ARM permits a behavior then so
> should LKMM. If ARM does not, then it is not so clear if LKMM should or not.

Okay, that seems reasonable.

BTW, I don't want to disagree with what you wrote ... but doesn't your 
last paragraph contradict the paragraph before it?  Is starting with the 
various MSA litmus tests and seeing how the operational model fails to 
explain them not the opposite of first playing around with the tooling 
and changes to the formal model?

Alan
