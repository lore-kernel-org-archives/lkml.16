Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7DB205503;
	Mon,  3 Feb 2025 13:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738590931; cv=none; b=OeYhvWvuAUFoAznYDpfaNHGjDey6EIf+GRD3IQ1Vug1mXv2WVRw5XASvmsUBqTXM8SjqRLbSwb97TRZUJUUBG/e4qBb4N0ZIMHz/xF3z6Lfk2RgnYXphjOF7oie1oCCCYUrTq8bDwss1x71kF1sT1NBH7L7v8o/luv9hMFH9KDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738590931; c=relaxed/simple;
	bh=gUp8U+rVxD+Y6HfpwyTm+JttDTLTSH18uhznER5ne6o=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=cE0a2KnxwTCOMPMhXgMeHFja9hYv6HX20b7mHr7ORTmFODIzN37Y+iSfMqhCxTBaGIpl1Nygm4+IVymd/2cVTgqUotIr2ZRSZ2HwTY7/hcoNSnHecqtjSmqqJ4tdDq08/upo0knynU4j/NNLHJNG1pS6S0Y0MQWnsEzAuIW9HcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h2g3rryX; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h2g3rryX"
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-51eb1a714bfso2342036e0c.3;
        Mon, 03 Feb 2025 05:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738590928; x=1739195728; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Thz/RdrPk00uTTv6ZpDaGf9cCMbRNeDYOogjrqVQpPA=;
        b=h2g3rryX1wi8EQM0b3+4bPDgqFoSgCReUEa6FpVxKoqfpTUsDvvIeQZGPDVvAfzscz
         nyulD2n9VqAlg/PfeGbjino8/rsZdnk0dkn+bAcbjWVisscuvcqr1RMwh8SqYD/f2meS
         J9/uplNaOxTve9pWYZsyltrYTU6dB7Tnri2/V1D6JYGYvkBPAf4ADu+D8eLF1Vy1JDR4
         Is4cCWr5AWikpy1qXUQoP1809l+xlSkN78aeIUnfftAtymnQjBv0LxS1HjlUucRlAjE9
         tNjfLJjCFBX9TqiTEmg8s9PLUdRwpkTH89Ne0cYGjJ8x/dtlXYMzlAVIt5h/kXOWT0M2
         zGGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738590928; x=1739195728;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Thz/RdrPk00uTTv6ZpDaGf9cCMbRNeDYOogjrqVQpPA=;
        b=wFyhisb9hYH8ZwXptaOMS7L5sL6tkBGCFQdb9sEwl1i9mYaPDW1AN9D9FomhfPIIgi
         0/y89iZl3ucZEQrgviYuXjq/sT9sMWeJ9/wQVQLqghwmbKuqgllGXTKLeLUC5gQ0IZ3Z
         XRo42ghgiUZiObnsu6JiqQ8hyICLb2mfKblc/YX4emZg4wb56sm2k5IAB0vGq318iS1U
         LzUiUOv9b9NKPX5kG0HTxA9wK++mY3ouia7fAw887EUpjQUhCPy878DIUgfOtEEI+FAH
         TbNwVZA+eXXFayhs/RjVLRrwjMOAd+MqGNTC5EGzD0wXzMkQPxnSlQIiq8z6u+LyEgjC
         CavQ==
X-Forwarded-Encrypted: i=1; AJvYcCWl1u+KqpdN+NfWH5PYAdQvxyHAKT9FWzZkdSFHcfSoUeWajlUzAd9WAqhICTjFjLb43FwNvRSMTs7KnYw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2QpN6Sy49qOZUQk2gjy0piMBKK/LZ22YPjtVrn7oKtQt7EhWq
	z3ymkLbnJn+FIYPeaCXBZwKiulRR3CRjJLXFhjlqACR3WeQuWFf7
X-Gm-Gg: ASbGnctw5XFcQnky6gSQ4VzepFA858QP5xhaBOpkTI29dbE6vmXndmHRSlFPGThXAw4
	r0nW4/PrkfbHsWpX8Uxcc0uUf94Zyz+LHdBZl6czuBMzSaF3PFW1wTmFQi5TK9NjOsDOmqg2XAI
	dGZ6uhl3eDER+Uagqs8XpNXHn72LJ1UcauU+AUUTQxcUZwinB0WTdT714DOgKy3QqWtBFTiHmOE
	vRtgMqaSpa0UF4QRqdQybFNhBcm1rk8zsdETfNXk/mFv6k9QoLv2bXtBRSpLDyVzNeU0qVyrXVy
	i3Lx0bk=
X-Google-Smtp-Source: AGHT+IEbd+Go396Elq8mrQOSWxNWOVg14gPegdtnO1ywhVrUmMbnMLH6BAaW0V/58PuZ4DfqTyRUBw==
X-Received: by 2002:a05:6122:683:b0:51e:9efb:a23a with SMTP id 71dfb90a1353d-51e9efbb51cmr12141852e0c.5.1738590928607;
        Mon, 03 Feb 2025 05:55:28 -0800 (PST)
Received: from localhost ([2800:bf0:82:3d2:4207:a956:ebad:2a64])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51eb1c12174sm1223421e0c.16.2025.02.03.05.55.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 05:55:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 03 Feb 2025 08:55:25 -0500
Message-Id: <D7IV1P2LAXRV.21V72EQZ7RMFZ@gmail.com>
Subject: Re: [PATCH v7 00/14] platform/x86: alienware-wmi driver rework
From: "Kurt Borja" <kuurtb@gmail.com>
To: =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: <platform-driver-x86@vger.kernel.org>, "Armin Wolf" <W_Armin@gmx.de>,
 "Mario Limonciello" <mario.limonciello@amd.com>, "Hans de Goede"
 <hdegoede@redhat.com>, <Dell.Client.Kernel@dell.com>, "LKML"
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250203062055.2915-1-kuurtb@gmail.com>
 <c6e10cdd-6fba-6e8b-0913-66766cb9248e@linux.intel.com>
 <D7ISQ5PQLOLR.2P6D3M7W54PA3@gmail.com>
 <30f4bdff-caf7-45ce-5997-70c1c36a71ae@linux.intel.com>
In-Reply-To: <30f4bdff-caf7-45ce-5997-70c1c36a71ae@linux.intel.com>

On Mon Feb 3, 2025 at 7:55 AM -05, Ilpo J=C3=A4rvinen wrote:
> On Mon, 3 Feb 2025, Kurt Borja wrote:
>
>> On Mon Feb 3, 2025 at 4:20 AM -05, Ilpo J=C3=A4rvinen wrote:
>> > On Mon, 3 Feb 2025, Kurt Borja wrote:
>> >
>> >> Hi!
>> >>
>> >> I bring some last minute modifications.
>> >>=20
>> >> I found commit
>> >>=20
>> >> 	8d8fc146dd7a ("nvmem: core: switch to use device_add_groups()")
>> >>=20
>> >> which states that it's unnecesary to call device_remove_groups() when
>> >> the device is removed, so I dropped it to simplify things.
>> >
>> > Hi Kurt,
>>=20
>> Hi Ilpo,
>>=20
>> >
>> >> I also found commit
>> >>=20
>> >> 	957961b6dcc8 ("hwmon: (oxp-sensors) Move tt_toggle attribute to dev_=
groups")
>> >>=20
>> >> which states that no driver should add sysfs groups while probing the
>> >> device as it races with userspace, so I re-added PROBE_FORCE_SYNCHRON=
OUS
>> >> to the platform driver, so groups are added only after the device has
>> >> finished probing.
>> >>
>> >> I'm not 100% sure that the second commit message applies here, but it=
 is
>> >> revd-by Greg K-H so I added it just in case.
>> >
>> > Which is why .dev_groups should be used as it is able to avoid those=
=20
>> > races on driver core level.
>>=20
>> In previous discussions with Armin we agreed it made more sense to move
>> WMAX-only groups from alienware-wmi-base.c to alienware-wmi-wmax.c when
>> splitting.
>>=20
>> I have no problem in moving them back to .dev_groups though.
>>=20
>> >
>> > Why you call device_add_groups() at all? Can't you just insert it into=
=20
>> > .dev_groups member in alienware_wmax_wmi_driver?
>>=20
>> I'd love to do this as it would simplify things a LOT, but some
>> user-space tools might expect this attributes to be exposed by the
>> "fake" platform device located at
>>=20
>> /sys/devices/platform/alienware-wmi
>>=20
>> If it were not for this, I would expose every attribute in the WMI
>> device.
>
> Ah, sorry, I didn't pay attention where they were added to. I vaguely=20
> recall that discussion.
>
> But still, you could make the groups available through .h and just add=20
> them directly into alienfx_groups (with an #ifdef/#else in .h), or is=20
> there again something I don't see?

What do you think about something like:

alienware-wmi.h
---------------

#if IS_ENABLED(CONFIG_ALIENWARE_WMI_WMAX)
#define WMAX_ONLY_GROUP(name)		(wmax_##name)

extern const struct attribute_group wmax_hdmi_attribute_group;
...
#else
#define WMAX_ONLY_GROUP(name)		NULL
#endif

alienware-wmi-base.c
--------------------
...
static const struct attribute_group *alienfx_groups[] =3D {
	&zone_attribute_group,
	WMAX_ONLY_GROUP(hdmi_attribute_group),
	WMAX_ONLY_GROUP(amplifier_attribute_group),
	WMAX_ONLY_GROUP(deepsleep_attribute_group),
	NULL
...

};

>
> Obviously, .is_visible functions need to be extended slightly to filter=
=20
> out by interface but that should be relatively easy too. Also, the group=
=20
> variable names should be properly prefixed when making them cross file=20
> boundary like that.

