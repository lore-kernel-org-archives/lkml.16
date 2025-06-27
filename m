Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E49E4EB38
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 10:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751020419; cv=none; b=mmqjI/2/tgf2hJNQIjwrzxQBgCIgHZj6GBQ49MTnA7i9Nvvl5IgYG+nO+pPsmYjxyNZMUt6n3fpyzpU/YsBjlOHLfssTC334aFVO0kF8iNYpNvJsBS7r4ZJZy+9xfa9GP+vak4v8CotW2P6WVbehePS6+PfOofU0Q60d3jcWVGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751020419; c=relaxed/simple;
	bh=aIbu24VZKsQ0mNNKyKVSxFOTzJ56cEmLBlpiEyUahzA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Y3hxWjaXHxqJk5UocFapHjm6m2endxEpbGUnNtji6I/ALtueY8T9w84LnNwwXy4QML8MPbPVMDu0NPQWiPcZBFe44qs0ceovZ5wNOc0XTmoKD+HK/DRpEUCFe8OYBK6QTrVBqHhYHfSLsvO0GwMMv8d1Z74j55eemUNn2Zi11Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CBKmPHtc; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CBKmPHtc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751020416;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Dulzs6tJ70GQvmeyAReKMXNerxvTVJjW28pt4S38/Hw=;
	b=CBKmPHtcC6Wp2NRfTsfsbYbI6fHOeC0/z0KgDSUWOTK81rosXTooEdo/2yPMzakfTedFsL
	5BnQtbNHrSoVO9ofECqyM+S9am3lMMwYGcVh0l9a0CVbGnaLs64LIWrMwmRUJn7U3ScXyq
	xBOkGAEfw5BwrOf6y/ctvoq5A74uLQQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-X7inpYuvMXOVb8u0c_It4g-1; Fri, 27 Jun 2025 06:33:35 -0400
X-MC-Unique: X7inpYuvMXOVb8u0c_It4g-1
X-Mimecast-MFC-AGG-ID: X7inpYuvMXOVb8u0c_It4g_1751020414
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a4e9252ba0so1266156f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 03:33:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751020414; x=1751625214;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dulzs6tJ70GQvmeyAReKMXNerxvTVJjW28pt4S38/Hw=;
        b=XmWO7ns7CMQy5AxBOZDiR6buawcWHe+L69DeIgVzPNoqd7awBGguQ8dSXVnGES7qt1
         gWf6egcuiLJRBEKo7BCSemHjEAU9AjmX5f3hfJNit8ZhSCK/BXisKpzDsYkw4ybGpGtk
         KgRqXuinS/xSaotz747QpaK3fZ9KjyRVXmiHWYaocx4mPsPfFBajKSfqElr/R6NlxiQs
         AcdQxkfiXvRY4j9kptehnlkslEhip9UWOpTjjMcSqs2zarpY8hMV9nso7NOxZDsa0qku
         9pmzSMaNx+UbPwsxMI3uFTRPmdR8nNGrUza0X6+I5mi5fucwXs/5UKaG0Hb4HnnW2l1y
         +Ycg==
X-Gm-Message-State: AOJu0YyNq+702x5uabtrv/bmMILayUbpRSwfL+Wa8CT+oDHYHgB8fk8S
	ioJW8MQBHMRxlmWeoa1d0vvbKI7u95GMF0KVuvKotUU2LZnw334sX7lQjsemjUjfJYkU+W5knbW
	J20sAdzOhEXauScGmF4p+09bAWb3j/psf631Gwn3wdLNoH9fSEfHGhXkfPuPR6lEBng==
X-Gm-Gg: ASbGncswyq6dNHrxCzt+4EvxyIk0Gfg0jCqFpfQ0A6Lz9eAPQSJMYWSgSSHU0/u304/
	cRM3vuHUQgrbU1SGxiC045y02PYxrKzYyJoJxQ9cyuxtsoDfpgnvPi2LyST9SWu1RSwXyH2Fja4
	uVKmqivyfAvFoqFOxL/RnQSS0XGx3fhWPCop1F+7ixXl3LZDLRS1zjgkAphNMdyKatXybnAz+Ui
	0VKlR3rL6rZaFKbjvv5/QR/rtNRkXLX3nrPi4z9iwWjK9QLBy553Fa3cAJlcpTVxZcYqXyiIhAK
	TcuHfIB6aKhDCDfd23KjjyU7Ex/OdP2RqGODt7p7oDaYuMm1BSPgpXzCHi5Wlmrag9V7WusUu+N
	Lkxym
X-Received: by 2002:a05:6000:649:b0:3a4:d4cd:b06 with SMTP id ffacd0b85a97d-3a8fee65059mr2554129f8f.34.1751020414134;
        Fri, 27 Jun 2025 03:33:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGr8/RKNk/JTVd5LqMGQVf2Ns+S9uVp6luEws4kRt9cVcCSr6ObG/jWvZ4ZnNoCEPUruiIDIw==
X-Received: by 2002:a05:6000:649:b0:3a4:d4cd:b06 with SMTP id ffacd0b85a97d-3a8fee65059mr2554114f8f.34.1751020413648;
        Fri, 27 Jun 2025 03:33:33 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7facf9sm2309041f8f.22.2025.06.27.03.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 03:33:32 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v1 1/2] firmware: sysfb: Unorphan sysfb files
In-Reply-To: <aF5w4QTbSkebYbk2@smile.fi.intel.com>
References: <20250626172039.329052-1-andriy.shevchenko@linux.intel.com>
 <20250626172039.329052-2-andriy.shevchenko@linux.intel.com>
 <87ikkhd0uv.fsf@minerva.mail-host-address-is-not-set>
 <aF5eL1o3WNo3Q7_p@smile.fi.intel.com>
 <87wm8xbkyh.fsf@minerva.mail-host-address-is-not-set>
 <aF5w4QTbSkebYbk2@smile.fi.intel.com>
Date: Fri, 27 Jun 2025 12:33:31 +0200
Message-ID: <87ldpdbhj8.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Andy Shevchenko <andriy.shevchenko@linux.intel.com> writes:

[...]

>> 
>> That's just because there is an entry for arch/x86/. The problem then is
>> that there isn't an entry for drivers/firmware. It was orphaned then just
>> because it was moved to a directory that has no entry in MAINTAINERS.
>> 
>> > See the difference?
>> 
>> There is no need to have such a rude tone.
>
> It wasn't meant to be rude, sorry. The point is that any change in

No worries.

> drivers/firmware/sysfb* and respective include are not visible to (any)
> maintainers, they just might be sent for a luck of somebody to pick
> them up by browsing the LKML for such things.
>

Right. But get_maintainer.pl still reports I think the correct people to Cc:

./scripts/get_maintainer.pl -f -- drivers/firmware/sysfb*
Thomas Zimmermann <tzimmermann@suse.de> (commit_signer:4/4=100%,authored:2/4=50%,added_lines:11/43=26%,removed_lines:5/11=45%,commit_signer:1/1=100%,authored:1/1=100%,added_lines:1/1=100%,removed_lines:30/30=100%)
Javier Martinez Canillas <javierm@redhat.com> (commit_signer:4/4=100%,authored:1/4=25%,added_lines:19/43=44%,commit_signer:1/1=100%)
Alex Deucher <alexander.deucher@amd.com> (commit_signer:3/4=75%,authored:1/4=25%,added_lines:13/43=30%,removed_lines:6/11=55%)
Tzung-Bi Shih <tzungbi@kernel.org> (commit_signer:1/4=25%)
linux-kernel@vger.kernel.org (open list)

In my opinion both Thomas and me have much more context and knowledge of
the sysfb codebase than the x86 maintainers. It was just for historical
reasons that the sysfb code ended in the arch/x86/ sub-directory.

But you are correct that dri-devel at least should also be in the Cc list.

> ...
>
>> >> > +F:	drivers/firmware/sysfb*.c
>> >
>> >> I would prefer these to be in the "DRM DRIVER FOR FIRMWARE FRAMEBUFFERS"
>> >> entry instead of "DRM DRIVERS" since the former is what has most of the
>> >> code for the sysfb infrastructure.
>> >
>> > Then do it, please, fix the above.
>> 
>> Part of the review process is to give feedback to patch authors. I don't
>> understand why you expect me to fix an issue you brought up just because
>> I ask you to rework your patch a little.
>
> In my humble opinion, the author of the patch that makes the problem appear
> can help to fix that as well. Are my expectations too high?
>
> In any case, this was an ad-hoc patch due to the second one, so this one
> may be considered as a administrative bug report.
>

That's OK, but it wasn't framed as a bug report but as a patch and that's why
I gave my feedback. But I'll post a patch and add a Reported-by tag from you.

Thomas, I think we can then only merge patch #2 and I will take care of #1.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

