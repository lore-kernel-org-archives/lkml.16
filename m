Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6985729AAEF
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 09:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751015982; cv=none; b=HUspqpwvLwjZhHJtvZ9d61EC9sLUmZ1AsC4mCYu7i01Xs+U4c7lvHkoQ6V8twSVPq0mSBd3Qr+Lh6004ytSAd1WcxDkFffyG6r/OsafjF+HagsxcQXgapWjOJaGNyk1xxhJfGmgTj4RMQ9PG3nTZiA4ePwB9O8CiNr8Gln2YQ+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751015982; c=relaxed/simple;
	bh=srqTfvvPUbI74MHeSrF8v7vcA6FiuhfMHcNb9zerUmM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=lR56QnWpSXhxxt8oIge09Z9m6vrIb/NgEoTH2+9Uur8RRCB1pQ56vHYPIQMh7rVK+7cyynln4c+NjxfLL3l8PGEJBkJUBQS3hcWKi7FmhJPUeOIMElFc9ygG2XjdVAdVM/m2zhby0hcHF5UmNnt4d5viui5HAaSLBtQD2KB8wEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DEFI4PO4; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DEFI4PO4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751015979;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=g82Vx2Ie4h4U1eEGpv+09qfNgIc3xMt/5Ccns/m+ozY=;
	b=DEFI4PO4f1g921LGGQl97TnIpYaej3GBY3SWFL81F1K4xAOTLiqcXjOzhjYeT+l6J5jhcE
	m5wdxZBY/yMYj8w3YjIaBEZ+TDYJkfZRvv/MWsH+ILw+lcO99eY1FPBFcjrAJOSxipCb3n
	ddOXcmME7E8xgrzUJOZTwKf6w2ID3IE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-440-wQGD_MkdNB2dpTp8iBOw2w-1; Fri, 27 Jun 2025 05:19:37 -0400
X-MC-Unique: wQGD_MkdNB2dpTp8iBOw2w-1
X-Mimecast-MFC-AGG-ID: wQGD_MkdNB2dpTp8iBOw2w_1751015976
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a4eb6fcd88so1183555f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 02:19:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751015976; x=1751620776;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g82Vx2Ie4h4U1eEGpv+09qfNgIc3xMt/5Ccns/m+ozY=;
        b=GgPTv/8vf3jhCJDE2oX8F4WrTYD8A+kZad2Cj3F5OFD4XSO9ywjjI3tXfEcSF63rFK
         WUMc/OlTCBpA2RJJhwiQMyG6jJMVZ/sksIc0lL5sAhESiR++KqcykpGwc/34t5PqE/Ay
         1qmxm8OFcqgnBsd1c6UQnhFHiVt5T9PYEE20TGITfblEf1lshpPjUlGiQQ44DumX6LhU
         CoKKO++/YhYLgbqwqT3rGcn9BYTz+kkGLCBJjZKe2yxZrLR3VHsv1pJZKXXFGj64VGcD
         lfFt7VXqorHziIbeczCXmRcEqyYL7evcOKQJz/JFK9iJnlROmvsX166Sc4QKJYizhRQA
         QSRA==
X-Gm-Message-State: AOJu0YyFxsI0UcRpOkx3FH7u60OfZkH+cgThOZRDCdfJ7QoKAnfUUO8q
	06Qdl5N1u2q0wdwFbSsT+x1nbCnNTIOZK+t63rqaruvu8HVRpVU8RK+QBuT4URhzCH4nn702KC4
	f0PZOsl7DzK9JVUAojBe8asrKbCG+Ux5tH5F5QHsUdWJhiZBt4xbPlPEb/9n9qahM5Q==
X-Gm-Gg: ASbGncujJx9NnRoz2/aLeDA8kDsRlk8JiLWUidVu+kLzHK0B+d9IgmNsLrAAlxxCe9C
	lhsUBRv0up8Z2uEzD5IamArcpWuwdB86WgFajkZkErZ5etZt6yyWfc36uKntSUm7XBWFr5FrvKx
	TPfES1IyUOENFIu1/G9FZyyyunl+wb4b+x7yC9spA6F38RcoNBSP/xzisvTAEgYmfGOjEYH2GLr
	UDiW1svkk4aIPLihYlbV07ZDtQ1W47rIEl5epdBA2os3k3uXwIa0x7P+ANlh9DKtyhBHJUKu3GJ
	v7GFWNevxAfN0lIcebyeJ2qNooyFcq25BCrhj4paB2RP2o0tbg+tfDz1a1XEiZ2d4zUwKUXHg+w
	EAJTT
X-Received: by 2002:adf:9c83:0:b0:3a5:5103:6ff2 with SMTP id ffacd0b85a97d-3a8fdeff47fmr2050727f8f.28.1751015976407;
        Fri, 27 Jun 2025 02:19:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzyRJBDizEILuLHMxW+NeEg0vW2foGNlrjGtv0Fdg1XOkzykoq5nTlxMoGg+vQ2/a3/2HnUw==
X-Received: by 2002:adf:9c83:0:b0:3a5:5103:6ff2 with SMTP id ffacd0b85a97d-3a8fdeff47fmr2050703f8f.28.1751015975935;
        Fri, 27 Jun 2025 02:19:35 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a3fdfa6sm45608555e9.22.2025.06.27.02.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 02:19:35 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v1 1/2] firmware: sysfb: Unorphan sysfb files
In-Reply-To: <aF5eL1o3WNo3Q7_p@smile.fi.intel.com>
References: <20250626172039.329052-1-andriy.shevchenko@linux.intel.com>
 <20250626172039.329052-2-andriy.shevchenko@linux.intel.com>
 <87ikkhd0uv.fsf@minerva.mail-host-address-is-not-set>
 <aF5eL1o3WNo3Q7_p@smile.fi.intel.com>
Date: Fri, 27 Jun 2025 11:19:34 +0200
Message-ID: <87wm8xbkyh.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Andy Shevchenko <andriy.shevchenko@linux.intel.com> writes:

> On Fri, Jun 27, 2025 at 10:50:48AM +0200, Javier Martinez Canillas wrote:
>> Andy Shevchenko <andriy.shevchenko@linux.intel.com> writes:
>> 
>> > The commit d391c5827107 ("drivers/firmware: move x86 Generic
>> > System Framebuffers support") moved some code to the common
>> > folders and effectively orphaned it without any reason. Put
>> > it back under DRM MISC record.
>> 
>> What do you mean that it was "orphaned without any reason" ? There were no
>> regex matchs for the old file paths in MAINTAINERS either before that commit.
>
> There were maintainers for that code before. The change in question dropped that.
>
> [((bf44e8cecc03...))]$ scripts/get_maintainer.pl -f arch/x86/kernel/sysfb*
> Thomas Gleixner <tglx@linutronix.de> (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT))
> Ingo Molnar <mingo@redhat.com> (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT))
> Borislav Petkov <bp@alien8.de> (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT))
> x86@kernel.org (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT))
> "H. Peter Anvin" <hpa@zytor.com> (reviewer:X86 ARCHITECTURE (32-BIT AND 64-BIT))
> linux-kernel@vger.kernel.org (open list:X86 ARCHITECTURE (32-BIT AND 64-BIT))
>
> [((d391c5827107...))]$ scripts/get_maintainer.pl -f drivers/firmware/sysfb*
> linux-kernel@vger.kernel.org (open list)
>

That's just because there is an entry for arch/x86/. The problem then is
that there isn't an entry for drivers/firmware. It was orphaned then just
because it was moved to a directory that has no entry in MAINTAINERS.

> See the difference?
>

There is no need to have such a rude tone.

> ...
>
>> > +F:	drivers/firmware/sysfb*.c
>
>> I would prefer these to be in the "DRM DRIVER FOR FIRMWARE FRAMEBUFFERS"
>> entry instead of "DRM DRIVERS" since the former is what has most of the
>> code for the sysfb infrastructure.
>
> Then do it, please, fix the above.
>

Part of the review process is to give feedback to patch authors. I don't
understand why you expect me to fix an issue you brought up just because
I ask you to rework your patch a little.

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

