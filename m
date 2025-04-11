Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8FE1E9B38
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 07:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744355323; cv=none; b=YRHVMANMVpmCA/yo3oY1v7Ljjjw4YKbu8yY7cKfSMkj32s2wz4/LuOpnYYyypNoaiX9Jg/SX81KenKABrJWk7LldwrciEV1YLsoamQsxCHTSV996EOG6JBZouJMX8kTuK38IPWHKqglQJjl2uJ4xqJK4kx8PGMK2n9U2qemx3uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744355323; c=relaxed/simple;
	bh=K5NzlYCbCEvLXqneifQd7JK2XpAhe4N8Yviy+4UcfW0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AVmaKIvSxE8aRlTrAX1DiRnJs0rKtVY6cTZqX7m1qCOXfoJDBabyVkTopsDNsDVBaVnXNTcF3XXmkS+oP4s0OOoJsVzpP16F1ogkjGnNHTbGOWDShHvAhvZAV+dzhYNBY0wcxZJBk6Bk0iU7XRW0fe7e7HODEaNGA5iBj1bidrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FMtvvh3X; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FMtvvh3X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744355320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=K5NzlYCbCEvLXqneifQd7JK2XpAhe4N8Yviy+4UcfW0=;
	b=FMtvvh3XfO6hB3mxVRPq5dPeEDujcuJ72TTSkJ/nWJLKaiiyIcsHGEZIWZ3maZUXVmwA3Z
	u3XfKmrlbQZILJGnELLgO1OIgSV1CTXNnOMNYEdUgnwBazm56zUPI9u+6uDtvW96XT01rR
	9fM309lHV5XgKclZOyp9rSci1WWBMN4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-574-Az84J9-lMPeRss7yshVsgA-1; Fri, 11 Apr 2025 03:08:39 -0400
X-MC-Unique: Az84J9-lMPeRss7yshVsgA-1
X-Mimecast-MFC-AGG-ID: Az84J9-lMPeRss7yshVsgA_1744355318
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43cf172ffe1so15027195e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 00:08:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744355318; x=1744960118;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K5NzlYCbCEvLXqneifQd7JK2XpAhe4N8Yviy+4UcfW0=;
        b=SfkdzcmjVun0idAwPhbHrXcRxRFropEXXWU4VVFeeP7puwwoYh8mIZc0BNV3fceJlx
         ASpl2WNJBUyQaJ59+0mYCjjevBDaEbXwJINn2Kt2YA0zJDdd9nqoygtk4X7OjSKa8GM4
         HGjBEO5mfDOH08X4tlopR38rh6iUKdmxOtD+luD7hYGn/FxJpUzyOkIy97sefb2GpZZ+
         dNAITl/9kMG16xneM1i+w4QeofJvTS4Svkx2/PqbA0PFbeWfE/XHh9wjunsAXiGx/sHP
         ++p+M8odCfWRjlCqWciqT5JSefvafvNJoKmwLOSchMN1VhylzynywWMziCyOmlMBkxAq
         74HQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyh31kTKNj+5kMtbLReMTYfVOpXSJpoXthO2YHOFrNXVjtsh0JsAY1xlVLnKVwCH7Ruy3uu8OWlcDsi54=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhV/I95F8fGlZTPAeNQDkNFZaHyMRePvjNy+cgMgsx8lc1iR2/
	9cA4etnJu3IvLLKN9K5/oi/uef5qggGgmPCj0sUYBqhOrcMTQx9JvGcv0l9QDSTGo69Tqk8tQtx
	u+/nG4Wi0VYyU1UDjxIBmASf5gg6B0ijrAbdpYZS5X87QU1l2nvrUJ5IQpGnRaQ==
X-Gm-Gg: ASbGncvn53TkdnN/iEeikDWPGOXbLr8g8CLsWUkr+7R/DvLw6zqQUMsiYUNTLY0wtT4
	8pcVw+RvMiQO3GKHkW2dN7UMIOYAfq5EZZeQxPVhNXgJoJWtVeA7jCPXsVa+Cgkz0lB2MJKwCSK
	D+fkR5gC3TOMsqp+8oiZSYUfa7Y5EBXlgH4oKXkuXezS46ldabPeZZDrQ+m/2W2M6uPvonvNzoJ
	59eYDLTwwCsNcm3Z++8GqMVepdwXuVMt/VhmIcGU/wXpQKsIP9myUVFRSuajlmnr/FSVaRIFo52
	dNRTIYnWtkfJ7Ux/D+LoEewdv+Da4zlcHA9QOg==
X-Received: by 2002:a05:600c:524c:b0:43d:1f1:8cd with SMTP id 5b1f17b1804b1-43f3a9aa87bmr9472385e9.24.1744355317872;
        Fri, 11 Apr 2025 00:08:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjhRKA4TnrTKewW8lP720jQbGCgUemtJctQDW58s8TfnOXt9H9Uoy0Bmt4NQZNN155Rl9AWg==
X-Received: by 2002:a05:600c:524c:b0:43d:1f1:8cd with SMTP id 5b1f17b1804b1-43f3a9aa87bmr9472205e9.24.1744355317522;
        Fri, 11 Apr 2025 00:08:37 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.107.56.40])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2338d7d8sm77576555e9.4.2025.04.11.00.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 00:08:37 -0700 (PDT)
Message-ID: <75607f0eb5939bf1651ff2e6c3eda4df2b4f26f0.camel@redhat.com>
Subject: Re: [PATCH] timers: Exclude isolated cpus from timer migation
From: Gabriele Monaco <gmonaco@redhat.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, 
 Waiman Long <longman@redhat.com>
Date: Fri, 11 Apr 2025 09:08:35 +0200
In-Reply-To: <Z_fkgN1ro9AeM1QY@localhost.localdomain>
References: <87ecy0tob1.ffs@tglx>
	 <2c9d71fd79d7d1cec66e48bcb87b39a874858f01.camel@redhat.com>
	 <Z_fBq2AQjzyg8m5w@localhost.localdomain> <87wmbsrwca.ffs@tglx>
	 <Z_fHLM4nWP5XVGBU@localhost.localdomain>
	 <4fdc6582c828fbcd8c6ad202ed7ab560134d1fc3.camel@redhat.com>
	 <Z_fTmzdvLEmrAth6@localhost.localdomain>
	 <56eae8396c5531b7a92a8e9e329ad68628e53729.camel@redhat.com>
	 <Z_fcv6CrHk0Qa9HV@localhost.localdomain>
	 <1c60e19d1cebc09a8fd89f073c3dbec80c8ddbf1.camel@redhat.com>
	 <Z_fkgN1ro9AeM1QY@localhost.localdomain>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0ByZWRoYXQuY29tPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmbiuWMCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfJzZgD/TXjnqCyqaZH/Y2w+YVbvm93WX2eqBqiVZ6VEjTuGNs8A/iPrKbzdWC7AicnK
 xyhmqeUWOzFx5P43S1E1dhsrLWgP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0



On Thu, 2025-04-10 at 17:32 +0200, Frederic Weisbecker wrote:
> Le Thu, Apr 10, 2025 at 05:05:52PM +0200, Gabriele Monaco a =C3=A9crit :
> > I'm not understanding what is going to be invasive in this case.
> > Aren't we just talking about not allowing isolcpus to pull timers
> > from
> > other cpus?
>=20
> Right, but in order to do that you need to avoid remotely executing
> timers. And for that we need your initial patch (after reviews have
> been addressed). Right?
>=20
> > Let's ignore for now the global timers started on those CPUs, I'm
> > not
> > aware of complaints regarding that.
> >=20
> > As far as I understand, the change would allow timer migration to
> > work
> > normally out of isolcpus and among housekeeping ones, we are not
> > forcing any migration that would potentially introduce overhead or
> > missed timers.
> > Or am I oversimplifying it?
>=20
> Global timers only migrate:
>=20
> a) When a CPU goes offline (but they should be migrated to
> =C2=A0 a housekeeping CPU)
>=20
> b) When a timer executes remotely and re-enqueues itself.
>=20
> In order to handle b), you must make sure an isolated CPU
> can't execute timers remotely. Hence why it must be set
> as not available like you did.
>=20
> Or am I missing something else?
>=20

Mmh, my patch is in fact allowing isolated cores to still migrate
everything if they go offline.

However I don't think housekeeping CPUs can execute remote timers on
isolated ones. That is not a problem for offline CPUs (they won't start
anything and do the migration while offlining is enough), but we should
allow it here.
I may be missing something, but isn't it what [1] is doing?

Thanks,
Gabriele

[1] -
https://elixir.bootlin.com/linux/v6.13.7/source/kernel/time/timer_migration=
.c#L976

