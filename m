Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9460D1EDA3C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 11:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751024245; cv=none; b=ElSrhPrpms3BytVJF0Jk+ZuSHJd/GbbEZlXdNJNeqMpSU7Ly+CY2xamuvH7UFCnMkC10dnFLw9iwp09ed0JKaBto6cSzwsGtfIj7ZQP9cAcX1eD5DvlB9i2YmZLReV64lzanyB3pfCnu3A8Op+N4IwPzNN9CJwmnRAe12Nzxq6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751024245; c=relaxed/simple;
	bh=ajPfArf33hhmfEbmZdVJ/5VonWW202cA0HDkTemkd64=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=W45TowGBrJ+yLpDDXMGInXy9iaaHjgcEi7P4W1AnvlYxWsa+UjMsi0elc6XAHF8v8apvvsKymBvkWqOucmdhZmySYXcB1HVXr2f5R4yIMPH2r4pojuW889X2ZgVxp/ETn1QPCVV/QF39n2lo0c8GJmO2maDFQXE/gMeKnwbKzIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XPsiVOSK; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XPsiVOSK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751024242;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mqBW/4usZgIy/KzRWc6uZF4rRxSI143rt0+4idJgvAE=;
	b=XPsiVOSK2ZN7ePxmJ0VgzKzo2myjNBvV6q0jhK/pDRN+8eJyzT/Cxzpxg/V2liYgupI/rH
	r15o8FWm4TWXp4CvbGEvc1xOcpKhQ6gVRlXMliwlCoIauKGEmoM1P0zoxQQL0qm9x4BJyd
	hZojE3003wbAUcsqKQXGlKAlWl1VhZA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-484-93BNS_vaMXKqoxBrQQdd_g-1; Fri, 27 Jun 2025 07:37:21 -0400
X-MC-Unique: 93BNS_vaMXKqoxBrQQdd_g-1
X-Mimecast-MFC-AGG-ID: 93BNS_vaMXKqoxBrQQdd_g_1751024240
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4532ff43376so15395875e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 04:37:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751024240; x=1751629040;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mqBW/4usZgIy/KzRWc6uZF4rRxSI143rt0+4idJgvAE=;
        b=DhROgtDKKhr9jEykZVbUvmNx0tSq7ke4lNq+At+hVL9b7XUu07Gqwy4hIi9ngOP4wc
         pbHKUQQKyBqEHIXe365tR7sr+AGohtOVSX4sKltxwvOi3fgM4EIxV7IsYGAt9P2VZ+N5
         lG8HhnW2ziJ9KeuxSgN1E1Bakgt0C1f4GnN2MP9e7o/Tbx1RhO6nUidEfnvqsSNChZE6
         n81jNDnCWVN6jjfp1Po4u/Ciwb1om52x5xGle95fb/FeTGLuhok2oBLOq8ScK/RYOLvI
         gb73+te4tvt0jj9mO6t7DO6AzaysblgUFYXYev4Qoy1zsrVUcGE2BiaUWDCVnwIAnEPd
         v0rw==
X-Gm-Message-State: AOJu0YysG7lXFj8SgoMDrPh5YNX0kmuEhDhupp5uH5h1EorwVzlDSxcg
	KsjpQkMQ+HEDRyqjiHSy4vSv5De+QObwhDOKlBJqY09V98QU7BdbDlB95xpB6+KQsLXRVuQP+jH
	9XWCALh6w4T2Jb9FuStPOOV2WQD6ygPV71CTnDwlKbQVMrojmm/kYLe0v2lQmUDGHfw==
X-Gm-Gg: ASbGnctR0fGop+FOw17oEHSCPxMAo0GHKBf41izT9Aq99DBRKBDqlYD7/BrPZmvhBLg
	liR2c3sEw8XtX2kLH/BNguw3oaf0JVA7oIj1SAWomRxX1QLPWQBvGzaJcCdCzMNJnlCGzfPQEd9
	nI0mSn/gSih637H6cR8aAO6dJajufKEkp2db2NRboXaiqKplh34S4ej13I9LBv9eGJGSuX41uj/
	7fqwyxy5XhCvxEj+t0ICdNpM6w+wDvt596fWaU4A/hjThgOL8r0gzLJUXBbh0RUE7d7VL08dNln
	SriRxLZm6AE6nuFVIscpN21/7nCTCHWu6h71h0qfIhtqGQI3TzJBoS6ju+P4BEUVMIJBC0MXbwu
	oGNCK
X-Received: by 2002:a05:600c:190b:b0:440:6a1a:d89f with SMTP id 5b1f17b1804b1-4538ee4fd6cmr31903275e9.4.1751024240012;
        Fri, 27 Jun 2025 04:37:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCBR7LbTCpwnNkp2jfc+fHR+Jnw/4eK6FQ7J1oFBcSy8aFQFNxv7gE5sE6VQWu1nHQC3H2bg==
X-Received: by 2002:a05:600c:190b:b0:440:6a1a:d89f with SMTP id 5b1f17b1804b1-4538ee4fd6cmr31902845e9.4.1751024239355;
        Fri, 27 Jun 2025 04:37:19 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823ad03asm79034345e9.23.2025.06.27.04.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 04:37:18 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v1 1/2] firmware: sysfb: Unorphan sysfb files
In-Reply-To: <aF53djlieUNF_-aV@smile.fi.intel.com>
References: <20250626172039.329052-1-andriy.shevchenko@linux.intel.com>
 <20250626172039.329052-2-andriy.shevchenko@linux.intel.com>
 <87ikkhd0uv.fsf@minerva.mail-host-address-is-not-set>
 <aF5eL1o3WNo3Q7_p@smile.fi.intel.com>
 <87wm8xbkyh.fsf@minerva.mail-host-address-is-not-set>
 <aF5w4QTbSkebYbk2@smile.fi.intel.com>
 <87ldpdbhj8.fsf@minerva.mail-host-address-is-not-set>
 <aF53djlieUNF_-aV@smile.fi.intel.com>
Date: Fri, 27 Jun 2025 13:37:17 +0200
Message-ID: <87frflbeky.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Andy Shevchenko <andriy.shevchenko@linux.intel.com> writes:

> On Fri, Jun 27, 2025 at 12:33:31PM +0200, Javier Martinez Canillas wrote:

[...]

>
> The problem is deeper. This is default behaviour of get_maintainer digging
> into the Git history. In the past people were complaining (a lot in some cases)
> that they were included in the threads by a mistake because they made cosmetic
> patches or the treewide change while not being interested _at all_ in looking
> after the certain file / driver. So, with --no-git-fallback it gives nothing,
> expect LKML.
>
>> In my opinion both Thomas and me have much more context and knowledge of
>> the sysfb codebase than the x86 maintainers. It was just for historical
>> reasons that the sysfb code ended in the arch/x86/ sub-directory.
>> 
>> But you are correct that dri-devel at least should also be in the Cc list.
>
> See also above. Depending on the options it may still give bad result w.o.
> explicit mention in the MAINTAINERS (or via glob).
>

Sure, I was not saying that is not worth it.

> ...
>
>> >> >> > +F:	drivers/firmware/sysfb*.c
>> >> >
>> >> >> I would prefer these to be in the "DRM DRIVER FOR FIRMWARE FRAMEBUFFERS"
>> >> >> entry instead of "DRM DRIVERS" since the former is what has most of the
>> >> >> code for the sysfb infrastructure.
>> >> >
>> >> > Then do it, please, fix the above.
>> >> 
>> >> Part of the review process is to give feedback to patch authors. I don't
>> >> understand why you expect me to fix an issue you brought up just because
>> >> I ask you to rework your patch a little.
>> >
>> > In my humble opinion, the author of the patch that makes the problem appear
>> > can help to fix that as well. Are my expectations too high?
>> >
>> > In any case, this was an ad-hoc patch due to the second one, so this one
>> > may be considered as a administrative bug report.
>> 
>> That's OK, but it wasn't framed as a bug report but as a patch and that's why
>> I gave my feedback. But I'll post a patch and add a Reported-by tag from you.
>
> Sure, thanks ahead!
>

Patch sent:

https://lore.kernel.org/dri-devel/20250627113328.2703491-1-javierm@redhat.com/T/#u

>> Thomas, I think we can then only merge patch #2 and I will take care of #1.
>
> I just sent a v2 without the first patch.
>
> Thanks for review!
>

You are welcome.

> -- 
> With Best Regards,
> Andy Shevchenko
>
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

