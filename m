Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74A01F461D
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 15:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744384070; cv=none; b=swiEsFnd6lGahmXCjxh/Gx8qmceLe5kgLLPoDFYKTUJXt4S9jaRU0RdTEckFqFY3axc8uxkLN9SnQkFKwM1L8KP3TmOm8bd81wpuSBWpgeUGIVjy6xYE3NOoXXECZPe/5f9wH8YZsPOMWVBuYf43i1VxP66Fma710sHEdDMAl0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744384070; c=relaxed/simple;
	bh=nOqw3UCQNgkETNgENmxmP/upbcQxPunDT4ykImyo1N8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ne3RbI9/ArwX6p5W2ubuNNrVGsC4SkjHIdEgtQrnF7X9psjegv+RdCpG98EU4sRjmiuFrlrqmRzWoKVurtAYh5+T7nlp9EN1z468KpFFo9nEnbZ55MzzbPpDfzMinaHXJrYY0GqU0GfMtFAeO1P4qQhaACn29WUurTvlGLAN5z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NNa8O/WV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NNa8O/WV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744384067;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nOqw3UCQNgkETNgENmxmP/upbcQxPunDT4ykImyo1N8=;
	b=NNa8O/WVEBRvG7g4ZCQFaHWf9/UT50qhWcLyX2UROCMid1An+CAN11T3w4l9sLaAxaJPX1
	/tgW7fx0wrEqOwOOMdbSDiVXWopXf1CvLB/6B1oRV6UsuNjz6JP6YzX/GklOyj6uTPaGmO
	vfBnd8JfxtRmaJGmJ5OU7tDXpMeul4E=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-688-PVSxihWVO1i6wwYuqixiKA-1; Fri, 11 Apr 2025 11:07:45 -0400
X-MC-Unique: PVSxihWVO1i6wwYuqixiKA-1
X-Mimecast-MFC-AGG-ID: PVSxihWVO1i6wwYuqixiKA_1744384064
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-229170fbe74so17559515ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 08:07:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744384064; x=1744988864;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nOqw3UCQNgkETNgENmxmP/upbcQxPunDT4ykImyo1N8=;
        b=g6SzDoSifrNXl3AuSa3iqBRXpbNc6kgCd/V0W9RM8+xXyx7jpSmqfUII2Bb9gn7p+V
         jBHWDHlb8Z6QOCobZ0AEFCdhM0UrSGXpwXQhAZZ46q/eU8vb8Sx7zXlaH4+lbAv0sPgA
         mip7QszXfrtBesvQxZGkHjRX+EX+LpQNvsOHmspxq67toXsikxH1EY3/c4GZI2oFMuV9
         80JklRmy9Mj/QzNrvAgyEgzCnVFV1oKie2zB3yCbwAGBHI3HWWhI0FoChwmP+P56W82L
         B9Q974CsBLIP1Bt88Stw3BQwew15k+FOn1RoFqEpyLdmuSvJvgZZvZTlMXohmSf5kZ4S
         p18A==
X-Forwarded-Encrypted: i=1; AJvYcCVVzx4ErN1IGzK2aRGd3ET+jqXb58ph+XJLnbtBTzl8L1LWISrsji1q+RhcUFQcwFZx7mBtSnKPTq/iilo=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg0Mv3D6hrgHDf2gWC0QEqoCPxgiTd2dLiktae2GuyMxMkCoq5
	f9Z/3xqvxjsRmkp2y2i1CfI4Uf1V8ezEY3V2Lds6YQZ7Fbmr7EW9w1knk/fc37f7D4BeV89azKe
	te6B7IIixCIDXFaSQTSyYdY6Bjc0ZB0uHTEnEc7h13D8ry7J/rhtu9q40t/EEGg39Id+cpzZ9PI
	Z2NGteJ5fxfouTsRx+e0FHjMXwNT2cl+ZxIDUY
X-Gm-Gg: ASbGncsl/pq1x9lRZ7QHWnI1TZbTMrXxx6HVDH3sMSUbv6znzaqoXmb39ocK9RgoZMs
	UyJmZNmUDleDfkK/vrNxGZt+0tCgoHcIyxXBlNbaBLKrNJYFe/tcvvwQCMLBSS2LEYVI=
X-Received: by 2002:a17:902:e947:b0:220:fb23:48df with SMTP id d9443c01a7336-22bea5013d9mr47679175ad.36.1744384063951;
        Fri, 11 Apr 2025 08:07:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcyY0eGCvHI/gdDU7XNiZc6IWofGPi7vPYYYhj18wxtPn+ZObM4OBxwrLpEk3ZNRwlRvvdOslJtVL7ZRuw34Q=
X-Received: by 2002:a17:902:e947:b0:220:fb23:48df with SMTP id
 d9443c01a7336-22bea5013d9mr47678805ad.36.1744384063602; Fri, 11 Apr 2025
 08:07:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250410035717.473207-1-bhe@redhat.com> <20250410035717.473207-2-bhe@redhat.com>
 <20250410204338.4b2101afdf18d8898390ef58@linux-foundation.org> <Z/ipfCofBe99Ie+7@MiWiFi-R3L-srv>
In-Reply-To: <Z/ipfCofBe99Ie+7@MiWiFi-R3L-srv>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Fri, 11 Apr 2025 17:07:32 +0200
X-Gm-Features: ATxdqUHXErCdiRkEhF36CcQgwOHHQJ4vauPwTGL6_wmpxLHi-chD_wBZ4Y_HerY
Message-ID: <CAHc6FU7B5ORy-97OegzZ939MjuZWdBicLjRxj_bYmG3Hm1mKSA@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] mm/gup: fix wrongly calculated returned value in fault_in_safe_writeable()
To: Baoquan He <bhe@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, gfs2@lists.linux.dev, linux-mm@kvack.org, 
	david@redhat.com, osalvador@suse.de, yanjun.zhu@linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 11, 2025 at 7:32=E2=80=AFAM Baoquan He <bhe@redhat.com> wrote:
> On 04/10/25 at 08:43pm, Andrew Morton wrote:
> > On Thu, 10 Apr 2025 11:57:14 +0800 Baoquan He <bhe@redhat.com> wrote:
> >
> > > Not like fault_in_readable() or fault_in_writeable(), in
> > > fault_in_safe_writeable() local variable 'start' is increased page
> > > by page to loop till the whole address range is handled. However,
> > > it mistakenly calcalates the size of handled range with 'uaddr - star=
t'.
> >
> > What are the userspace-visible runtime effects of this change?
>
> I see it mainly affect gfs2_file_direct_read(). Not sure if GFS2 people
> can sense any exceptional behaviour caused by this code bug.

Thanks for the heads up.

In gfs2, fault_in_iov_iter_writeable() is used in
gfs2_file_direct_read() and gfs2_file_read_iter(), so this potentially
affects buffered as well as direct reads. This bug could cause those
gfs2 functions to spin in a loop.

Can this fix please be sent to Linus for inclusion into 6.15?

Thanks,
Andreas

