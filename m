Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253341EA7F1
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 09:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739266700; cv=none; b=mpV9NDZCs7hY8E8OsWMAEoEd6LhS8f2E4y7K6XZu+vUW0KNmm5az96wXOmdLpoYH93T+8kibaMdI6/zjAsVvuLIWMTQ2eYLgIAo6MEzF+xVTNse5YgnnOvBmF4+WOOQA+EcjR+WEWNUeuMkl9A/6d/6DpCkeKMxRHa3VtEt5UD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739266700; c=relaxed/simple;
	bh=UMEmLFxSzGCX0x4TAPfHL2GDmSKTHafVFyL78eN5EOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BaA2+H4LkeVAlJFzxGQT1TQo+QxRZwQW1AdwA9O/tfHeTN2kMW9K5khHWOl5fDz66b7NsbMa2nbmWKKpMmbEhfYQpbxtWgKKqevqUinoFSkHlVroY72sYOeq+W3d97NH/SXebLzLFsFayqCcwI1VEzVVC7Tjq2v0q9gihkb+2a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZaGP4up+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZaGP4up+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739266698;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JEBn5BDD0bivGeX0sWRFJtyk8zRNMnBY8R9geVV2WJw=;
	b=ZaGP4up+qJ1LMK3LDCKJhLvYrhnq4r4TAP3SeRLBAm7XyaooLKOAUXIeWa5GIP2ITFLLcI
	n6UTNA7OxLK0+gX2rK1Iz4/W6Q+F+avwbC7ozlLfBtz2Ku/e8U0Lpd7D8QsYMXLveD9ksm
	gKPje7i/FwligONLtPtf35dyLgDxvkg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-424-DaC2ZRrGMTCR8RS1_hQjvw-1; Tue, 11 Feb 2025 04:38:16 -0500
X-MC-Unique: DaC2ZRrGMTCR8RS1_hQjvw-1
X-Mimecast-MFC-AGG-ID: DaC2ZRrGMTCR8RS1_hQjvw
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-38de0923dbaso772051f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 01:38:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739266695; x=1739871495;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JEBn5BDD0bivGeX0sWRFJtyk8zRNMnBY8R9geVV2WJw=;
        b=c7O9hbFWRbM9URTBa9rb1xs/4o5mVbgXONulvMUSdJ1W7Z4U/vQ1rAW57oHlgYT/Kv
         0l/w190arAF1GqTn77ljIkGUBn02d0fwr+FZ/9NcAmIWtbnjfNXBbgH5iZEy+rpCJyBX
         Azdivu+e7iO94d5pV+TUCbkv/eZrcG6cQagyu+LwI0nhDz8wJNONq954yMNiJi/w0TxO
         4onj9kjE0RfGFWUOuJlEuHV7hK6wW98bEjac/w1zQzKr7DpVvB4Sgv4CaBCiNRQQmAAY
         ZpXBC3u+BHawDJn/W1eUAmIJ0MwnM/d3apxuCqSSq5o/cYs7Ue/P7+fMVtBuvi3kVE1q
         21eQ==
X-Gm-Message-State: AOJu0YwynbSPX2Pdw7ePZfC6WyqJCl7fUQsJKVdk4zjToNE8mqhs0j23
	z9IGwXlVrEGbvOL6QTSD/+Djkw9p1Pfo3nfQhwV0g99MXjsGmrC2Wrok4Ie94wYMIJj+PVvva95
	5jqvh+MQ+FQOsVKTkr1iaTxKmuElC2bTD5P6EWABsrCjgmaa9onAxlAhu4ryOuA==
X-Gm-Gg: ASbGncuqj1N/gMWlDq3nOg6buvO5QQlywEL7cb7uSuBQrMJdWSkZWw9OyNXrJYZDo5p
	QpETh/Re7HHN2k2BPmixk61qOsw/+teHsQUv6jtnOAZAoavLgflqUZ3BADULMivCjLb44cJHYY2
	bi+4rct0T/GVy/N6KXQuXpFiW/bNMGpkbchYvez0nAjC5QEGwWBU/9+7NBE9w58SPthGeiTPcU1
	J8u1iP3LqpByUVheMYZ1RK2B1PhJ1ApVVwrmR3RfE8RBN1YZVhqrQfS2BF7otL8yIxsby3Jn50+
	aP0OHqz9xeT7K5zGcHBXuhR2sppr8DUMLQ==
X-Received: by 2002:a5d:648c:0:b0:38d:d221:701d with SMTP id ffacd0b85a97d-38de41be949mr2385521f8f.42.1739266695211;
        Tue, 11 Feb 2025 01:38:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEi1zF8zGCXf3u5BZowhS/tIHfp/myPqRuYfehgLlAWbaD5VlSQIEDbgi0akDT9Mtd2ryGMOQ==
X-Received: by 2002:a5d:648c:0:b0:38d:d221:701d with SMTP id ffacd0b85a97d-38de41be949mr2385504f8f.42.1739266694894;
        Tue, 11 Feb 2025 01:38:14 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.34.42])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc53ae9c0sm12923656f8f.101.2025.02.11.01.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 01:38:14 -0800 (PST)
Date: Tue, 11 Feb 2025 10:38:12 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	linux-trace-kernel@vger.kernel.org, John Kacur <jkacur@redhat.com>,
	Clark Williams <williams@redhat.com>
Subject: Re: [RFC PATCH 00/11] rv: Add scheduler specification monitors
Message-ID: <Z6sahFdh9uVhrRhA@jlelli-thinkpadt14gen4.remote.csb>
References: <20250206080952.98478-1-gmonaco@redhat.com>
 <czykavxpz46nwnelml6yorg3tvmyjvczqogeuqzji6qrfd2peu@qxr6wucv6mrj>
 <847c962745ef5bce757b9ae257ae279913ac711c.camel@redhat.com>
 <Z6YYPAiM0itlIVAH@jlelli-thinkpadt14gen4.remote.csb>
 <59ad26ac442aef340f819ed080684d72b50e1c57.camel@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <59ad26ac442aef340f819ed080684d72b50e1c57.camel@redhat.com>

On 10/02/25 13:56, Gabriele Monaco wrote:
> On Fri, 2025-02-07 at 15:27 +0100, Juri Lelli wrote:
> > 
> > Right. I guess I wonder if we can find a way to inject kernel
> > problems
> > somehow, so that model(s) can be further tested explicitly thus
> > making
> > us confident that they will be able to identify real problems when
> > they
> > occur.
> > 
> 
> I sketched it quickly and I wouldn't include it in this series not to
> make it heavier, but if you want to play with it I wrote a patch
> exporting a function to inject events and building a kernel module
> calling the function periodically.

Ah, this is cool. Thanks for working on it!

Yeah, agree, we can leave it for later.

Thanks!

