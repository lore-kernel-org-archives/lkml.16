Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0255B2EF9A7
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 20:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750190441; cv=none; b=M1lEH+ErBPz6IKFwY9mCwwoIw+burxm9kEqjmbFHEd9m0jq4a5/8SnYWnd497czKnhDG8H1MPhOUszmezsszoaTtSgQNdPsNQNIZbv/M2VuLTNoH2FeT+yeIul2WeVsPP2xZZ0RTng3p0JqhgdRdcMFwaLIU84bnCFGKcrd6fs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750190441; c=relaxed/simple;
	bh=TlljtURwhzYJbyPaK90vj2I1zkTcRxeXoBA3/YHasnw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PFpdgvaNrpFcPxeIbYa+wNOChckjpJOdEcbU71ANUBv5pthFCeEBh+erZJBhiYTYdKDBBvrWtlcI/nz1SeJU+7rhkHRMnoBVVLJ+zgjp4s7qjR1SNgQ9zP0a1w61xA+QA8URM7S99D9o62amSHYgA9rLSYGslmXJFoVnL/8WKKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=LNoCSjEE; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="LNoCSjEE"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a507e88b0aso5973418f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 13:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750190437; x=1750795237; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=P1Q3wNaFb8GSbNxBRR+7t58ougBRe0m0zOJ2hFRgXsU=;
        b=LNoCSjEEPKu6or1v/fxOts5jQ9iVNULloo/Y3svNr+18aLdMKtfvn6xfmU1ITseIvS
         dmNiMCY+lqBjjB5SWlL3eqb0TYdTHFsA2f3LPYVTT7MRtGCQzGYQ2uH9eNyW72DLbux9
         M0H7PooQCepTgr4tb7RkQz4D4PJ4VMLh/QjLgWMT22a6to2wvSOyXH2nnMpTIFGW9bTS
         qFsYjTXnUXQTnKwUX03PiPj/ed4uL7S2CP8vSVo5hl26INx+oskNp2onvpKLeh76sNnZ
         SCxc9V84utT9navyFTIy5TSUPiEd4ynIVhV+XS6r94Ih2h+YPn4pI+hjpF/XehOebv/5
         3pOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750190437; x=1750795237;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P1Q3wNaFb8GSbNxBRR+7t58ougBRe0m0zOJ2hFRgXsU=;
        b=l4i8rtfF2ICi7rOf0vvyDWHr5x0waMFcQn2lJ8PNHjFbv1mHZ9C6pEnX06pEdv65No
         E1Lb3Ex4cNElvoH05QIHNFY7ZmjvR6WdnqC4l7rIObTcqQzdJzW8iHA8Wm2eY+0g/kpR
         DUPc+Qv99EWGf9iNXbFdZ/T3C90fbZZkJVNrz6fZ+Uc8staLfBa46fup5t3VKMvTHVt/
         XpD3VV1DqgWc9EUCKzuD6X7/cl2mi9v2jZCjA7iUh55dY/o+yayg2PKocyDFDs1vrzPd
         B7sTZHpg0/QQeViA7WMjP2vyyS2lYQU+YI2K454FGqBRDsImVctesOHEN5XYjpH8gxwm
         ST2w==
X-Forwarded-Encrypted: i=1; AJvYcCXf/fBCD5znbG2ArKxhqNIbWnMndAFYwghX2t71R5mpJTmlQZwmK5Mw7d+OH/PPveL2IRqUl8QjTiLJDEA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYE1y00AjFDtl5eEBrODbJT+O3XcOUNG1xUKoaybrh+6sC2ZBp
	6S3IqJ2ngTCSAvMYMjlsOlFcDP9b3g2XH1HTsljIW5GixWq3iGT3Jj7S1RnBb9RjncE=
X-Gm-Gg: ASbGnct0NT/FhPEqc90C7Qv0mW3E1637qpF2zvjwFqx7I9rSkEuk6F47eCleG8FOW6v
	KFtG5MbAgY0BHupOltNkrQxp9a+adnZ2OngyGNebFscJtghWhY5yFfrRxxII8314lKql1zWJo0w
	B7XzCyNWHQRYPOUJ6vdmwEiOB7oOIVbsjjG09LxJg0Ssyfkdy0rx7O3TsqlqsxF19PYoxc6mnhc
	yYZp0liUlRnR0/Dybr6PlW7lk9uODx+lgUnlrweHchtOnSBN2X9enz+4wp33dxpL3oIAYjkBsyg
	dPhwVgrA/XeOI496YFMsnHL54LEvfwPAk5N7rjf5E+3qjc4dwQLAsmTI1CqaEdIz0vTSqCMHZcg
	=
X-Google-Smtp-Source: AGHT+IHlhRHm31MK5OB8jKIHAO5TO+ryCNCRSsnXL4vUs0KgKKn+WC8yPZMaiUASGCNL8umsudXbmw==
X-Received: by 2002:a05:6000:4818:b0:3a4:f744:e00e with SMTP id ffacd0b85a97d-3a572367b53mr12169167f8f.4.1750190437340;
        Tue, 17 Jun 2025 13:00:37 -0700 (PDT)
Received: from localhost (109-81-93-212.rct.o2.cz. [109.81.93.212])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4532dea1cc5sm190413685e9.16.2025.06.17.13.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 13:00:37 -0700 (PDT)
Date: Tue, 17 Jun 2025 22:00:35 +0200
From: Michal Hocko <mhocko@suse.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Rientjes <rientjes@google.com>,
	Shakeel Butt <shakeel.butt@linux.dev>, linux-mm@kvack.org,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mm: add OOM killer maintainer structure
Message-ID: <aFHJYymXpMQu6nEv@tiehlicka>
References: <20250617085819.355838-1-mhocko@kernel.org>
 <002eac51-1185-4a51-94f9-49987db84202@lucifer.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <002eac51-1185-4a51-94f9-49987db84202@lucifer.local>

On Tue 17-06-25 16:10:07, Lorenzo Stoakes wrote:
> On Tue, Jun 17, 2025 at 10:58:19AM +0200, Michal Hocko wrote:
> > From: Michal Hocko <mhocko@suse.com>
> >
> 
> No commit msg? :P

Not much to say here I guess. I can give couple of words how much I love
this corner of the kernel but let's just give it a bit of silence
instead ;)

> > Acked-by: David Rientjes <rientjes@google.com>
> > Signed-off-by: Michal Hocko <mhocko@suse.com>
> 
> Thanks for this, saves me the trouble of doing this one :>)
> 
> Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> 
> But you need to add a few more files:

Thanks!

Andrew, do you want me to respin with the sugested change or are you
going to pick those up?

> Also need to add:
> 
> F:	include/linux/oom.h
> F:	include/trace/events/oom.h
> F:	include/uapi/linux/oom.h

-- 
Michal Hocko
SUSE Labs
