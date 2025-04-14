Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0313F258CF2
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 08:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744617976; cv=none; b=aYQ6Ak+qmpvTD4TO0NLejPwZrDjjJs3UdfMhIJsttz6eEGYC+/+tbu4YJ6iy5ComAyjqcd6khLpWnNTO9f9zRxhShMGdEjxI49PCMod4q8T07MoqA9Xt0fo+tQf8SFKNQLXRgxVlMSUfhZD0+DuNqvgapd+D5RLRj1KE7WpVvJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744617976; c=relaxed/simple;
	bh=bgkJEIH4Y2e9wfZ4zg26jY7uh69wJrhNklZKNIexm4w=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=o8Bs7Uu/yaySZWMwblZsgYlAWnwE+/mwK7lEU6LBm7zNLwrb5ggFFg+CaKShpsRSf3jrOCNCDWheF7V42URc6C4yhBJzo7qYqX7L7X4wwCrCcJjuul7CpIHZJGMk/6FNU4lBJvhjE8zvGjqzZzmiqcNVk7NX/4SaBszZ6cgthNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=T9hSnleL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="T9hSnleL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744617973;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=bgkJEIH4Y2e9wfZ4zg26jY7uh69wJrhNklZKNIexm4w=;
	b=T9hSnleL4b3t0qZnsIzwrx5gFoIwK8oknAJVhZXOXwwL8RfFyHsYZ+UjWIwTvVChDHA6wD
	nL+sL/Jef5TebnPxZfO/iVk9d4ENPHf8sdz3yRib9gUl/UDOr5M6Mp5firLT3/dD8BlgRU
	g+5JPdxdn8ao98+2re8+L/oSjL3nJ4Q=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-92-crt-YqqYNvy4ygjZSux7RA-1; Mon, 14 Apr 2025 04:06:10 -0400
X-MC-Unique: crt-YqqYNvy4ygjZSux7RA-1
X-Mimecast-MFC-AGG-ID: crt-YqqYNvy4ygjZSux7RA_1744617969
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3912a0439afso1597791f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 01:06:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744617969; x=1745222769;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bgkJEIH4Y2e9wfZ4zg26jY7uh69wJrhNklZKNIexm4w=;
        b=S54sWzc+3tkw7xxzi354AIrsweA0u5J9Zf+UYGjazFvaUEQLN5FHq3OoKJsnEXUh7R
         soznx3vMwNebhVYbq/CxR6FNIbarBfi2yTgVCOc8AcGkUO8GnrSM8JX2KQZcxnUSgHbK
         z0Hb3NrSedftAuZemp2cGfKf7skxMUCQh+fSkAkNK5DiWH1OMJtVMWRJMLjk1OXauQZ5
         T3c4NpdKWtbMmoD4bYWbW+DHCGGW5tIjJF5fJDudcSllGo67GDjLS3fNWXpxYS4BNnr6
         d8/YhF9ykBIFlidPcFUGqIpbxLBVUFSSTsLBG2mrt6wY3sk2NGC9/ce9eHljLJOdTxJJ
         ZLNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKua/XM5Iw14/QeKNSkY06XnvHle6yQMjWty2DguE/+ca2dvARTxAIDnfH/p82S5za59VvsEh/iKpOiSY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi5uM1tbMTQoIzRl28iSOHMpwqjbu97rBm2X8nj2ZL4rB/3KGk
	K/opgyVTmAoj+R7eoG6MACD4dyrZerufmf5m3I604z2txRzQ+2Q6TFKCuevzu/mFNZ0V+hE+mxK
	u4oKGVn7D/Z5Duo3xuQpPG7ZiJkcsUgT2uBJx2LoUzWLMGoR8It10+zBQsiT6EQ==
X-Gm-Gg: ASbGncutmK2Q5aBibWxQTq0mdq90UAMzMEyO2/fpddkTMvJbnLxLEf55Fr1LmvjLGEY
	7o5hn2QQByQNhQ1J8Qp7oG0FvbaIP91zLXYFDL/EkE2O5HkmsdfiXlKu73t0cj/jIPjJh/65Ib8
	Nbw9jHKpPfNwnP2KDuxwrIQ1URAQmjilVJLrwU+eX5GiFshYkz7eywaHKc77yXSUkwBQaW3Ecos
	u+AukILj9/4cyMEFa5PXynUEiyNHfrj7m7LqdJ6HNaYs5qDNVraUSvZQAVbCwixlmSKP6S+qBct
	QgtFZQX37ZI6eX7Dr3hexpTAKQuXjSuKwtklPA==
X-Received: by 2002:a05:6000:18af:b0:39c:119f:27c4 with SMTP id ffacd0b85a97d-39ea5212fd6mr8390584f8f.30.1744617969227;
        Mon, 14 Apr 2025 01:06:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEY3/6voGKwFboLlpb/71hND3KDiKWzqFF3yYwomw1Ik9ctTfuUb+eBUwc8X4YOOTrNv1+dzA==
X-Received: by 2002:a05:6000:18af:b0:39c:119f:27c4 with SMTP id ffacd0b85a97d-39ea5212fd6mr8390553f8f.30.1744617968780;
        Mon, 14 Apr 2025 01:06:08 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.107.56.42])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf44577dsm10267297f8f.94.2025.04.14.01.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 01:06:08 -0700 (PDT)
Message-ID: <f10fca10b106652e1bad2dc75ce474aa5bb7907e.camel@redhat.com>
Subject: Re: [PATCH] timers: Exclude isolated cpus from timer migation
From: Gabriele Monaco <gmonaco@redhat.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, 
 Waiman Long <longman@redhat.com>
Date: Mon, 14 Apr 2025 10:06:06 +0200
In-Reply-To: <Z_mePtIrl6z5fJBc@pavilion.home>
References: <Z_fHLM4nWP5XVGBU@localhost.localdomain>
	 <4fdc6582c828fbcd8c6ad202ed7ab560134d1fc3.camel@redhat.com>
	 <Z_fTmzdvLEmrAth6@localhost.localdomain>
	 <56eae8396c5531b7a92a8e9e329ad68628e53729.camel@redhat.com>
	 <Z_fcv6CrHk0Qa9HV@localhost.localdomain>
	 <1c60e19d1cebc09a8fd89f073c3dbec80c8ddbf1.camel@redhat.com>
	 <Z_fkgN1ro9AeM1QY@localhost.localdomain>
	 <75607f0eb5939bf1651ff2e6c3eda4df2b4f26f0.camel@redhat.com>
	 <Z_j9fOxE4Ia79dtz@pavilion.home>
	 <1047ba4c25cdf4c0098dac308bcddb4b8b671954.camel@redhat.com>
	 <Z_mePtIrl6z5fJBc@pavilion.home>
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

On Sat, 2025-04-12 at 00:57 +0200, Frederic Weisbecker wrote:
>=20
> If you want housekeeping CPUs to pull timers from isolated ones, then
> you
> need isolated CPUs to eventually be part of the hierarchy (be
> "available"),
> because they would need to propagate their global timers up to the
> top.
>=20
> If they propagate their global timers then they must play the whole
> hierarchy
> game and be ready to pull the timers from any other CPUs.
>=20
> Because if they propagate their timers, they must also propagate
> their
> idle state to synchronize with the whole hierarchy and know if there
> is
> a non-idle housekeeping CPU to take care of their timers. And if they
> propagate
> their (non) idle state, the isolated CPUs also declare themselves as
> available
> to handle other's timers.
>=20
> And working around that would be very nasty.
>=20

Well, that's exactly what I was trying to do, thanks for pointing this
out. I guess I won't go down that rabbit hole then.

Thanks,
Gabriele

