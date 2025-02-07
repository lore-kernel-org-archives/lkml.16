Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8271D7E21
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 09:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738921272; cv=none; b=JULu3uI8504PL1euIl1iVN9jYvLgb5GSCSiFi1ufkT/K8Ur3Yl6KOCE2C1ZBRFn6GerLiTYHHUylq/CCvwqk21HLfh75PfllXj/urtg5ftFyJKVG90veot1M9K0xQPbGWdJEIYqv9RqNTfPr2Qdpoi+Bj/QR6pGktwTxSqiGFdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738921272; c=relaxed/simple;
	bh=CV0k9Y9N2XH7TpzSEsHnZP41G56ajGME1NoRcfQX61s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iB1mCHWMREJTXIFbmCi9rxsexS8aQI9vSDbk7BFtvWj2JG7D7Zhj6aBiuRX4LVoaOYukjmDA5HOxh/dA3CFV/p7J/oNlm8n8GNfAnI8FyxD6C6tvi+f2dXHnPvlfB7/KkUtTzFptWJzvR7MoH1yZyMs7FaJo4n95aahwM6ydUts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fTn7yQPx; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fTn7yQPx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738921268;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MTUqpRx4tzL9Ro/AKG2wZApCJkbUmpW96EY5MEESuss=;
	b=fTn7yQPxYR5DRf15E7V5YXZVbMubSOoEpwYylhO1+JsYUhM82PMHcDfOm/0vH24kBupMVo
	F60HE8TEEIa+GNyYM6OGwigQQOROySgakd6+74+yLYzzfZyEXcjACneByavXTTlvUpkXAx
	sLhv//fnhLMtybQrHDzPZXv+6FdalwY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-417-sLGFGb1ZONezeIlD6ZRhzw-1; Fri, 07 Feb 2025 04:41:07 -0500
X-MC-Unique: sLGFGb1ZONezeIlD6ZRhzw-1
X-Mimecast-MFC-AGG-ID: sLGFGb1ZONezeIlD6ZRhzw
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-436248d1240so9728175e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 01:41:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738921266; x=1739526066;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MTUqpRx4tzL9Ro/AKG2wZApCJkbUmpW96EY5MEESuss=;
        b=CNmgUMB7Z9jZEz8KTLtE0tgmZP+uQfkgfR1e/GG05ovZvvX8JJyt8S9U0tmtBCTLOg
         PUYrqLyuw/uIP1vyYys0NAiwrAXBUMxb2EcEfRG+1WHa1Ton9aUcu9BYxzinNRHZ68Ob
         cYJ1+GBk91v0uIQnNo3+XdLTQ9RrkpLmnaddqLSUSdYYovn6hhyvBi3VHiUjnWJorx1u
         57E60cwOzeh3azddMBo3ABRgmgpT6ulKB4Kp97HeTa+s17aCGzj9hZLlS99nPB2kGwId
         yN8RP4xaAdciSMmsalWjpaKIjNlR7Bwf+2HrfPwakepH8pnnYxzmerb9RHogfvz08xgv
         aAHg==
X-Forwarded-Encrypted: i=1; AJvYcCX0i4bqSjxDQNb0ghtttsWl7yLZrIXGRtCCfzy8dA0df555UDWJX0wr0nA1jdWW5cYZ2cKI8Gqk4LqF8Vg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3vstnm28z45q7GKeKZV7LfJd1NW9y/omLKj7QQ1PD9H3nPEgs
	uA32eHwxiqF+6b/75ZqENd3UrWu6TJxwaxJuBKUPlJcPZ9KkhYybshONDO6epX/0MSi0Oah6WNI
	9Lh349Hx84yi0bsLCNJrWCir+OaJA/73ADWA56G9ZyPWU/fsJIS54704BUs8DZQ==
X-Gm-Gg: ASbGncswBEd3EnSjXbuG83t1hAKdM78pSle5p7Y6GDEcUTL9Lr5lMfVWD4Ji2J4FGGO
	3fzAwe9gy5DGSif4t85AYgI9iZPzed1VG/vYzqnFi3uIf7szMqnrdIK9cTdcw8/XIBbo/PWyRAh
	ckbFRhDNfAuMTJjoH5ekt7JoFDhYdccSP0Xz60kwoatam72FU085uQtne1vD5/WygeLcUXaazlK
	dACgu0ho5o3uQ6ZcrLmQRNX6ffssDSTiAHaB7jD8UofvHuEYF8Ne3AFswm4e+cYG7LWRZ7gjhBu
	UZW4rmzU+rDjPBvo3XZWTDFzEjhVoqM9OA0Z
X-Received: by 2002:a05:600c:4e0e:b0:434:a802:e99a with SMTP id 5b1f17b1804b1-4392496ee8bmr21363525e9.4.1738921266019;
        Fri, 07 Feb 2025 01:41:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE1IDj88tlm0Zz5NWt5gu+dyOk4SepP643oi8e9gwTEPFK+T+h1KRg5A3h/kefExbx3f/+cKQ==
X-Received: by 2002:a05:600c:4e0e:b0:434:a802:e99a with SMTP id 5b1f17b1804b1-4392496ee8bmr21363365e9.4.1738921265663;
        Fri, 07 Feb 2025 01:41:05 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.128.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390daf3c70sm83796855e9.26.2025.02.07.01.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 01:41:04 -0800 (PST)
Date: Fri, 7 Feb 2025 10:41:02 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>, Ingo Molnar <mingo@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v8 03/15] futex: Add basic infrastructure for local task
 local hash.
Message-ID: <Z6XVLqexaKZr0cy1@jlelli-thinkpadt14gen4.remote.csb>
References: <20250203135935.440018-1-bigeasy@linutronix.de>
 <20250203135935.440018-4-bigeasy@linutronix.de>
 <20250203142743.GI7145@noisy.programming.kicks-ass.net>
 <20250203155114.YVGnCHUT@linutronix.de>
 <20250204103447.GU7145@noisy.programming.kicks-ass.net>
 <20250205083926.etxnZAoP@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250205083926.etxnZAoP@linutronix.de>

Hi,

On 05/02/25 09:39, Sebastian Andrzej Siewior wrote:
> On 2025-02-04 11:34:47 [+0100], Peter Zijlstra wrote:

...

> > Anyway, none of this solves anything when a process has both an active
> > RT part and an active !RT part (which isn't uncommon AFAICT).
> > 
> > Then the RT bits will still get interference from the !RT bits. Do we
> > want to complicate things and consider that?
> 
> I don't think so. The active and inactive are common but it is still the
> same process so you can expect it. The ugly part is when it is an
> entirely different task and it is random which one it is.

Not entirely sure we are thinking about the same situation, but it looks
like we have cases of RT tasks that are affected by the underlying issue
this set is about because they make use of libraries. So, in this case
we have a cross-process (RT/!RT) situation that I am not sure we can
address sanely. What do you think?

Thanks,
Juri

