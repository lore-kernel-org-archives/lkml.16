Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF41713D8B2
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 13:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744376542; cv=none; b=BL6wyxOlU4om588C1wkbuV1vpbY4XDMb9/S8bBCoA2AH9tDSmIpU9hnL8VPScL460thUj0kV36CCVgxMtEifXBodw43JCJ6/LxGGXY6bxqySXbHG4Tms0TUDUumkC1n+/yQSlc+3ks1iARNLkkHuEpHTqnYATNtcNJ3R12rAE/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744376542; c=relaxed/simple;
	bh=Y599NkHot1T/Vnal+uEKiXwlpVjxod2wKuVkNQ58RT0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WtePk8WR1+1HR4UqvRRQ1XjqAT/cyDiheN6mvqpfWZiEPTpRjnJP648gOFQCC8Kn7iJ8kruDql1TP4FBIp4q0p+Gs2y5bgNZTz7Uet7zR9vbBaiXvkDX7XOvVchPVWCyuY5biG3ALDbfqFHTHVnX8wld0o2gmUlEsHUoOmHpsnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jPRMbGa7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jPRMbGa7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744376539;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Y599NkHot1T/Vnal+uEKiXwlpVjxod2wKuVkNQ58RT0=;
	b=jPRMbGa7aAetyKB9i0Y7fpaiQsX/9vw1iTsYr/chKItPSzrC9wnOWoQTZEe1Qvl3fiU/Vm
	M5H8ExtEiAJhZ+wKNvSy98KrdnZdPnSxEhnnhg1w6EdtnnXTUxN1iMHONg85UDUfK/Tt2P
	UzLJOwDHa5pud3cjbeOJQ1ZeyGypbfE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-408-DZuAJcW-P961i07r-UrUkw-1; Fri, 11 Apr 2025 09:02:17 -0400
X-MC-Unique: DZuAJcW-P961i07r-UrUkw-1
X-Mimecast-MFC-AGG-ID: DZuAJcW-P961i07r-UrUkw_1744376536
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3912b54611dso1106550f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 06:02:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744376536; x=1744981336;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y599NkHot1T/Vnal+uEKiXwlpVjxod2wKuVkNQ58RT0=;
        b=v2tWdJ5VfhNEtM2f10elUMzlyahoRbpyKEFHBStTEVmKAZMVEBAY1tz6vNUYJBvqcr
         zXCqMvc5YPqqIBEsTFp0yJLv1X23dpNEpN+vbWTfmCvjrs5XdM5qPfmFa50ONi14evcS
         OnZ8Jpdzgvz4z8uEl5RLBqHLHEn5W9xcnW4OiSngoWoVrUM10ayLLkBwWWFFzjf3ydsg
         R8pEhorRrIo1e303//UbldcdllgUB18UymvqGh/HWOJLRiwmPNUtxIow2CdsQadJ5v7G
         51hcV4WDKtcxDdCMqysaSk6VokH+UrIEA87w+SOltLuICPJh6xwrhzK806SM9CptITDp
         YIAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVokW3ZBK7Gn8ORsjUZDZnlvMz6dgYdhA/96zS3MqpUA+mDfNkSUehkB+16igH9aV0eEwaatn+nL0y4MwY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcvfAVtP+NX8ZWcxA1CK3nrfWEJ4obVzHmu6MNR1IlSSaRVqPQ
	hOEEmsbvn72qVHoK+zNjLE9pMIk2Mm7IvMQg3Yj74z/Ah4C5U4nj4sWUZcXae3C+parFIglRF50
	3Y/anWl9Ekk1tgq+Pq/TK98cCThB28IuT6zVvSV5CR9h2yGmxN7t43ewAwWL85g==
X-Gm-Gg: ASbGnctSsMhDfi4aJWq389u2oCbWal+yGkyP78cZ1LFfAdvmHZnXPM8YD+756Gg7DJk
	EmIwpNHlKknnrgB224aFWL0UJMXVEghBaWJUXrozxMVLxXnTvGGteQT3LfzwYqyWkXsEJUbz5BQ
	hxqM5/n4kDQOQBmazBqHyEPSf/7MgucDP3Eh+SsgChpkZC/b4JdW5awJ1RvBi5Fz8pPTOu8t0XV
	icf1QoIMq5ncNJ/g1LVmkZgCBGyDhbBqwVqnv9pivBgZeM6zhUiX8gmZ3MCX559jdSI1wlPjyp0
	sIOGU3On3+5YOck0qIGlc2IJQqfVJ8i87t5H3g==
X-Received: by 2002:a05:6000:2283:b0:39c:2669:d7f4 with SMTP id ffacd0b85a97d-39eaaebed45mr2041514f8f.43.1744376535539;
        Fri, 11 Apr 2025 06:02:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgx534q0WwQCoLJbyafQQC3IoR+njOKJ23epIUvTJduQwNjLnttuyBQNk4Y68jA/lEr3xu6A==
X-Received: by 2002:a05:6000:2283:b0:39c:2669:d7f4 with SMTP id ffacd0b85a97d-39eaaebed45mr2041334f8f.43.1744376533607;
        Fri, 11 Apr 2025 06:02:13 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.107.56.30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf445515sm1906950f8f.89.2025.04.11.06.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 06:02:13 -0700 (PDT)
Message-ID: <1047ba4c25cdf4c0098dac308bcddb4b8b671954.camel@redhat.com>
Subject: Re: [PATCH] timers: Exclude isolated cpus from timer migation
From: Gabriele Monaco <gmonaco@redhat.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, 
 Waiman Long <longman@redhat.com>
Date: Fri, 11 Apr 2025 15:02:11 +0200
In-Reply-To: <Z_j9fOxE4Ia79dtz@pavilion.home>
References: <Z_fBq2AQjzyg8m5w@localhost.localdomain> <87wmbsrwca.ffs@tglx>
	 <Z_fHLM4nWP5XVGBU@localhost.localdomain>
	 <4fdc6582c828fbcd8c6ad202ed7ab560134d1fc3.camel@redhat.com>
	 <Z_fTmzdvLEmrAth6@localhost.localdomain>
	 <56eae8396c5531b7a92a8e9e329ad68628e53729.camel@redhat.com>
	 <Z_fcv6CrHk0Qa9HV@localhost.localdomain>
	 <1c60e19d1cebc09a8fd89f073c3dbec80c8ddbf1.camel@redhat.com>
	 <Z_fkgN1ro9AeM1QY@localhost.localdomain>
	 <75607f0eb5939bf1651ff2e6c3eda4df2b4f26f0.camel@redhat.com>
	 <Z_j9fOxE4Ia79dtz@pavilion.home>
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



On Fri, 2025-04-11 at 13:31 +0200, Frederic Weisbecker wrote:
> Le Fri, Apr 11, 2025 at 09:08:35AM +0200, Gabriele Monaco a =C3=A9crit :
> > Mmh, my patch is in fact allowing isolated cores to still migrate
> > everything if they go offline.
>=20
> Sure that doesn't change.
>=20
> >=20
> > However I don't think housekeeping CPUs can execute remote timers
> > on
> > isolated ones.
>=20
> I'm confused, a CPU can't execute something on another CPU (except
> with
> an IPI). But:
>=20
> Before your patch, a housekeeping or isolated CPU can pull timers
> from
> any other CPU and execute them on its behalf.
>=20
> After your patch, a housekeeping CPU can only pull timers from other
> housekeeping CPUs. And isolated CPUs each execute their own global
> timers.
>=20

Right, the way I said it doesn't really make sense.

What I mean is: why wouldn't a housekeeping CPU pull global timers from
an isolated one?

We want to prevent the other way around, but I think housekeeping
should be encouraged to pull timers from isolated CPUs, even if those
are not idle.

I see only preventing isolated CPUs from pulling remote timers may play
bad with the algorithm since they'd register in the hierarchy but just
not pull timers.
(This simpler approach works in our scenario though)

The idea in my patch could mostly work, but I'd explicitly let
housekeeping CPUs pull timers from isolated (while of course not doing
it for offline ones).

Does it make sense to you?

Thanks,
Gabriele

