Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69241253B4F;
	Tue, 11 Feb 2025 15:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739288980; cv=none; b=PUDf+sGo68bZOFNrH2MjnLqcrxlfGdbYXPwG5GjvaPXd2gb7koBSzl2KFA+DwDXjm1my67gNvpL5LPzN+0zYdbKeX8Bwi+tpuK6LxoRDivBv7gd/Hc9WqSnn+hufo05KvemweXruu+Zbzpo4a0wDtJDmBI02zKCn0Xf7kJZX5Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739288980; c=relaxed/simple;
	bh=fKZzaQtQDsSPkGQu8snJR7R9Ds50kdAkBeuKe+iO0yY=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=OOQvTLCHMBIPU2M8NdHn0e1xqH2odh4RYH/jd6d0BQCXtsp7VAG1Fwf+j+FkVlYUHUjkbc0mgBdWVkTAQH2ATqlJTKZBqmKD1gfmYEnjQYi7X09XefrXwNJykrZGMKV5CEpY1IOdrcZhjh3gK8pgXgJCYEa0qJ1C15LhXbfzzUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H8i9rHMb; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H8i9rHMb"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6f678a27787so51127827b3.1;
        Tue, 11 Feb 2025 07:49:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739288978; x=1739893778; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l8qoAqHN6d2bwLyFPQrQGBkCWYEGHRrvnRKCr+AAeR8=;
        b=H8i9rHMb7vdYs7AQ+eF6mDSpLPpgqI5wScqu6IxUzzdmli36AYPvQ9RhYonzJ34sp1
         N02S5hel9S/4c0yE8QZXGEnaGCvA27BtYNEnmzY/r3kdtm0rnv3CpZY1PwgWHQht+AzS
         S7Fe12FZGzT+DNOO5bGin7LEACr8cOLK593KXIPHfnIIxn1tkP+GnofVxQtSSK+psDk1
         4ZHDRaF9HOhdMYsOVnbAUmssylDhFxzrHm4It/Ru/Gompbog4Xij60oobH7IlYmeNVuz
         XD95DHxW8D/MAA3cptJDbjY4M+hncl2QW2aWTBVrCquVEt9NynT4E8CogXcExj8TfBbY
         xu7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739288978; x=1739893778;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l8qoAqHN6d2bwLyFPQrQGBkCWYEGHRrvnRKCr+AAeR8=;
        b=nD+v8bIkC+UZtQ/+/aRTgcp35S5LMpOS1VrW1ecuUIx/e5yMN5z0ccfGbgauLJYGri
         ExhQlEuAbPVrIwmuOAXicuHnsl9/M4AlkKnWNHTpIuDSwXAzfaQU+msvaoNCAz+ug70z
         HNFLr6EjCi1U31UncLTQcub693YS/5oIk78NWZ+2b5O56d1dQoju28AytR0mfZmUMZWv
         tre7yYNNXat99bEg9PVPbAjUv7m6d2qlZUgjhB0QQI3km92q3uioRapsu//lBBWq3TUX
         Rwomr2XvalpLrVhg2AHYMFXEdkqQpiGhmUeIHnFo7WwdXJKS0cN+mj/JIqrjR0TZOx4G
         8dug==
X-Forwarded-Encrypted: i=1; AJvYcCUXer51uTg9nKcsIWsbdO0bdgLDSlQjPPniUI1/Nuq8Iu1/HRBS0TohSKJn52uOZ9zQoh/cOBnslBA7XJ4=@vger.kernel.org, AJvYcCV6OyHkr7ZgaEs2OvCIUI4wcuyg7yBL2sDl7Fui3MWAV2NLWYzvTp2pkZ4z97xBsRpNYoC88qiDOPvWJz0ICak=@vger.kernel.org, AJvYcCWH9key25FY8iLg8XE8B2A+M+VCAA/Zz+0yAIjklc+rJYB10BL0Uhlgk8lbD4v/p6CePAEfDXYWORXy@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4AEoM3h/lxOZ4w9NzbVLp9E+NpOTiZbuhv2ZrlzWRPuUe3EHj
	/hRTXA24fR7fEsaPcdCCiwjCmZfDtZ8Pc6z5pXxkepmwD+45dWI1
X-Gm-Gg: ASbGncvhp4nKXG+MMRsPBJknal1KxWeme3GUVTN9yKF5ZtI8JR3E04Y9wcdBiFbPXeR
	Az99ofyFMY6S8T0Z8POFV1RSmbFGskoRL+dl89pdc3gn1lCCRvr6c3/6zZqxXnJZ3Sc8ovcsFc/
	/braJtsjGvvyIU0k3PnVsb4BH6iYe/ImnEMKAH5Oml+46JWPKZm1zEBFwIHXuY/bSfzq6kJEHls
	UIM45C/8N+c3UBOH//pZlPKwtpfsa7ZvH7mKuKvkM2FmULZBuWPkF0W6lvCQp5s2rRKxo2jv2nA
	VgAz04o=
X-Google-Smtp-Source: AGHT+IEtgw91cXuJ0BG7VzTeHTqgV/DQam0mEB1K/IkRHtjW8w0U61fsFS5cFTVxxB609FpmSGYQ4A==
X-Received: by 2002:a05:690c:7010:b0:6ef:5688:f966 with SMTP id 00721157ae682-6f9b2a2167fmr166314937b3.37.1739288978239;
        Tue, 11 Feb 2025 07:49:38 -0800 (PST)
Received: from localhost ([2800:bf0:82:3d2:4207:a956:ebad:2a64])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f99ff6a8c2sm21652137b3.77.2025.02.11.07.49.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 07:49:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 11 Feb 2025 10:49:34 -0500
Message-Id: <D7PQHGGX4WPC.26F52356ISZU8@gmail.com>
To: "Zijun Hu" <zijun_hu@icloud.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, <linux-kernel@vger.kernel.org>, "Lyude Paul"
 <lyude@redhat.com>, "Rafael J. Wysocki" <rafael@kernel.org>, "Danilo
 Krummrich" <dakr@kernel.org>
Cc: "Alexander Lobakin" <aleksander.lobakin@intel.com>, "Andy Shevchenko"
 <andriy.shevchenko@linux.intel.com>, "Bjorn Helgaas" <bhelgaas@google.com>,
 "Jonathan Cameron" <Jonathan.Cameron@huawei.com>, "Liam Girdwood"
 <lgirdwood@gmail.com>, "Lukas Wunner" <lukas@wunner.de>, "Mark Brown"
 <broonie@kernel.org>, =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>,
 "Robin Murphy" <robin.murphy@arm.com>, "Simona Vetter"
 <simona.vetter@ffwll.ch>, "Zijun Hu" <quic_zijuhu@quicinc.com>,
 <linux-usb@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Subject: Re: [PATCH v4 1/9] driver core: add a faux bus for use when a
 simple device/bus is needed
From: "Kurt Borja" <kuurtb@gmail.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <2025021023-sandstorm-precise-9f5d@gregkh>
 <2025021026-atlantic-gibberish-3f0c@gregkh>
 <D7OU5VOXCS8M.39YEYRWFL1MPW@gmail.com>
 <116e9983-6c5f-45f3-a933-dcded223f6d7@icloud.com>
In-Reply-To: <116e9983-6c5f-45f3-a933-dcded223f6d7@icloud.com>

On Tue Feb 11, 2025 at 10:29 AM -05, Zijun Hu wrote:
> On 2025/2/10 22:29, Kurt Borja wrote:
>>> +
>>> +	ret =3D device_add(dev);
>>> +	if (ret) {
>>> +		pr_err("%s: device_add for faux device '%s' failed with %d\n",
>>> +		       __func__, name, ret);
>>> +		put_device(dev);
>>> +		return NULL;
>>> +	}
>> Now that the probe is synchronous, what do you think about returning
>> -ENODEV if the device failed to bind to the driver?
>>=20
>
> Result of device registering @ret is not, should not be, effected by
> "device binding driver (probe result)"
>
> if device binging driver failed, you may return -ENODEV in
> faux_ops->probe(). not here.

After thinking about this discussion, I understand why this might be the
expected behavior. I'm thinking about very simple modules that would
remain loaded even if the probe fails. But of course this may cause
problems to other modules.

In the end, this is just my opinion so it would be up to Greg to decide.
However, there is still an issue with the groups added to the device,
which a user might expect they are tied to an "attached" device
lifetime and this currently not the case.

>
>> This would be useful for modules that may want to unload if the probe
>> fails.
>
> may need to root cause if probe failure happens.
>
> how to unload module automatically if probe() failure ?

If we check for !dev->driver, a module might propagate an error to the
module_init, thus making it fail to load.

--=20
 ~ Kurt

