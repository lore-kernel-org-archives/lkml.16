Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D334A200B8C;
	Mon,  3 Feb 2025 15:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738596515; cv=none; b=qRaV8pX34FufgzCI8Po8/8dZIo4Jx1k+j0o4RV3k2O2lRxOpvvxjH12ibjsNkRUxHHGf5/nKdSYhR3dsxiAV6IOsCB4Uw8zKqJYK/o7/akqvS6QNquLkTGnxsWX1Ae5oB8krbjoYW5lCtxo4g8gp9SewLmYUTlR3gRRO743WEnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738596515; c=relaxed/simple;
	bh=taTtsBr5Otz5EEF3tDTDTV5VOSbi/2UfRO8hESGOzgo=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=E9PByQQA/x/S27lAPzrwIyT9hopA6cm97P/Leu8+lnWe7X8WQN1BGF/ftbbf2m358CTuv9Y1iuY5iu99J9NIVYEfag71smZCJuqjWS0gc4mSpT8+IfeOazkrPQqkxPDR304vfw1tCkP1q/siwWJIuK6q9uB0UbM49G6JOiUZYM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nCSxn80B; arc=none smtp.client-ip=209.85.166.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nCSxn80B"
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-844ce6d0716so318094639f.1;
        Mon, 03 Feb 2025 07:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738596513; x=1739201313; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cwx/jJuVpXV8nrQOzPoCgA/xl5QSG0sKDpq8AoK3/hQ=;
        b=nCSxn80BedsOkPvDxRbUa2q0bN01wWVFl/qOntU4NyVBDZ7dOBMqgx0PMq2oahHbF+
         qv1oF8Byt4qGlGkt5O/KaROH1HhWONSzDDlNPSOGLpZQ6f5CgqkF2A2ZrS1UlfJhLpnJ
         foD9iltGse7ud/mFcJxl/Pt/OibydRTHWrmKYVOVntuItoUc3K9BHOifQAQaz0/r6WcV
         ZPtu6syRSFNPgZwZYaP3bRSNYd3Gzq5jItY2CT1kav5TaOKXT/dcksEm7hC1xpYmNJl8
         l9Pm55XbkaRX55pVfFF/catS3RbEzi13n3MrQugq4eoQYl2AVhSI+60OIfjFnHcSL2jh
         oUEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738596513; x=1739201313;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cwx/jJuVpXV8nrQOzPoCgA/xl5QSG0sKDpq8AoK3/hQ=;
        b=ARC9o53/anknBFejvc9Du4+4gVftwMxPeP+eIZnDDlJoyQh29WF0D54J5ZgdiNcBa1
         aZeQ0tsIgN8gZLRbE428G58YdtqDcVQWhzwYj6aG0UEwAhc5j5Y8TNwgh922IMPBPf5I
         gLPXPdQAbfN9yqpiIo1Av1+AuZEIk6+r21eQc5vi9iznRFyeEa5kTailrg7elNFyfXbn
         dss5Cyve29vZ7e5ggRd+0H7iRwGg9pvGVpgOK/LUylF0XosgJoeiqqpbI5oxIzlfegnY
         oQkE4wSv6YuQDuih4sieLokCxTw+k6NjfO6TC1bnZ5Lq3K0eJL339Jv6eHJDc2+yCBq5
         Zhvg==
X-Forwarded-Encrypted: i=1; AJvYcCXEju2GpJ3ewGkrtE2ocuYrBNaFPfSl4YzbCtzESPtJ9wErstb41F2WKNObhnkZzD3giQjJJHYdJBQkLNU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx92xwg3YCcaOJhCJXPpmPODQANNb84kZ5ISHTowfXiDYbIrRor
	mpSr9HgAdjluwPSeCtlo8zf0nh8PX1Pf/ZbC8bCJfZ83enQnUvpAardDUA==
X-Gm-Gg: ASbGncsG2ThQikMcPqGWRw42NSp7DyjTZEOENuKddKBvfw8x9IkxTcQKNHREgt+d0Gk
	/ciXN0whBLoRyxLNiIYdX7n/3pCoAuLdGUbzJ+a8H20NBhT0peHofLKSRERQpP1enjNj0Sg0+JJ
	SOcl9GmZq1YalveJvam4YkLo2X7EghJ4Q+wV0bi8/rSnF4iCnETC9MYgIi5c7/XBrrtWUmvRgId
	4NqjYMgJgT9DC4tEno1C6oOC7TTHN+eq+fJ3Ld9W4tvyMRnQxGTcpdGLcsmsCglCjYdeG3dhvvH
	4qSIjaM=
X-Google-Smtp-Source: AGHT+IFyYrE6OkOtE9jg0ZaWEEiM5EY7Tvgr9Z5x4ZS/eWbFIvdLghA9xZFJwwT3nVllGCsjWWqOAA==
X-Received: by 2002:a05:6122:da4:b0:516:1582:f72e with SMTP id 71dfb90a1353d-51e9e30993dmr18043878e0c.2.1738596502184;
        Mon, 03 Feb 2025 07:28:22 -0800 (PST)
Received: from localhost ([2800:bf0:82:3d2:4207:a956:ebad:2a64])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51eb1be9729sm1244933e0c.7.2025.02.03.07.28.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 07:28:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 03 Feb 2025 10:28:18 -0500
Message-Id: <D7IX0TG9FN1I.2GU5APPCH2PG0@gmail.com>
To: =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: <platform-driver-x86@vger.kernel.org>, "Armin Wolf" <W_Armin@gmx.de>,
 "Mario Limonciello" <mario.limonciello@amd.com>, "Hans de Goede"
 <hdegoede@redhat.com>, <Dell.Client.Kernel@dell.com>, "LKML"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 00/14] platform/x86: alienware-wmi driver rework
From: "Kurt Borja" <kuurtb@gmail.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250203062055.2915-1-kuurtb@gmail.com>
 <c6e10cdd-6fba-6e8b-0913-66766cb9248e@linux.intel.com>
 <D7ISQ5PQLOLR.2P6D3M7W54PA3@gmail.com>
 <30f4bdff-caf7-45ce-5997-70c1c36a71ae@linux.intel.com>
 <D7IV1P2LAXRV.21V72EQZ7RMFZ@gmail.com>
 <a2086a6b-6e2a-faab-6dd1-d13d3bceccfa@linux.intel.com>
In-Reply-To: <a2086a6b-6e2a-faab-6dd1-d13d3bceccfa@linux.intel.com>

On Mon Feb 3, 2025 at 9:09 AM -05, Ilpo J=C3=A4rvinen wrote:
> On Mon, 3 Feb 2025, Kurt Borja wrote:
>
>> On Mon Feb 3, 2025 at 7:55 AM -05, Ilpo J=C3=A4rvinen wrote:
>> > On Mon, 3 Feb 2025, Kurt Borja wrote:
>> >
>> >> On Mon Feb 3, 2025 at 4:20 AM -05, Ilpo J=C3=A4rvinen wrote:
>> >> > On Mon, 3 Feb 2025, Kurt Borja wrote:
>> >> >
>> >> >> Hi!
>> >> >>
>> >> >> I bring some last minute modifications.
>> >> >>=20
>> >> >> I found commit
>> >> >>=20
>> >> >> 	8d8fc146dd7a ("nvmem: core: switch to use device_add_groups()")
>> >> >>=20
>> >> >> which states that it's unnecesary to call device_remove_groups() w=
hen
>> >> >> the device is removed, so I dropped it to simplify things.
>> >> >
>> >> > Hi Kurt,
>> >>=20
>> >> Hi Ilpo,
>> >>=20
>> >> >
>> >> >> I also found commit
>> >> >>=20
>> >> >> 	957961b6dcc8 ("hwmon: (oxp-sensors) Move tt_toggle attribute to d=
ev_groups")
>> >> >>=20
>> >> >> which states that no driver should add sysfs groups while probing =
the
>> >> >> device as it races with userspace, so I re-added PROBE_FORCE_SYNCH=
RONOUS
>> >> >> to the platform driver, so groups are added only after the device =
has
>> >> >> finished probing.
>> >> >>
>> >> >> I'm not 100% sure that the second commit message applies here, but=
 it is
>> >> >> revd-by Greg K-H so I added it just in case.
>> >> >
>> >> > Which is why .dev_groups should be used as it is able to avoid thos=
e=20
>> >> > races on driver core level.
>> >>=20
>> >> In previous discussions with Armin we agreed it made more sense to mo=
ve
>> >> WMAX-only groups from alienware-wmi-base.c to alienware-wmi-wmax.c wh=
en
>> >> splitting.
>> >>=20
>> >> I have no problem in moving them back to .dev_groups though.
>> >>=20
>> >> >
>> >> > Why you call device_add_groups() at all? Can't you just insert it i=
nto=20
>> >> > .dev_groups member in alienware_wmax_wmi_driver?
>> >>=20
>> >> I'd love to do this as it would simplify things a LOT, but some
>> >> user-space tools might expect this attributes to be exposed by the
>> >> "fake" platform device located at
>> >>=20
>> >> /sys/devices/platform/alienware-wmi
>> >>=20
>> >> If it were not for this, I would expose every attribute in the WMI
>> >> device.
>> >
>> > Ah, sorry, I didn't pay attention where they were added to. I vaguely=
=20
>> > recall that discussion.
>> >
>> > But still, you could make the groups available through .h and just add=
=20
>> > them directly into alienfx_groups (with an #ifdef/#else in .h), or is=
=20
>> > there again something I don't see?
>>=20
>> What do you think about something like:
>>=20
>> alienware-wmi.h
>> ---------------
>>=20
>> #if IS_ENABLED(CONFIG_ALIENWARE_WMI_WMAX)
>> #define WMAX_ONLY_GROUP(name)		(wmax_##name)
>>=20
>> extern const struct attribute_group wmax_hdmi_attribute_group;
>> ...
>> #else
>> #define WMAX_ONLY_GROUP(name)		NULL
>> #endif
>>=20
>> alienware-wmi-base.c
>> --------------------
>> ...
>> static const struct attribute_group *alienfx_groups[] =3D {
>> 	&zone_attribute_group,
>> 	WMAX_ONLY_GROUP(hdmi_attribute_group),
>> 	WMAX_ONLY_GROUP(amplifier_attribute_group),
>> 	WMAX_ONLY_GROUP(deepsleep_attribute_group),
>
> IMHO, just define WMAX_GROUPS in the header and use it here.
>
> Similar to e.g. ARCH_PCI_DEV_GROUPS in drivers/pci/pci-sysfs.c.

Thanks for the example, I was overthinking it. I'll send a v8 with this
approach!

~ Kurt

>
>> 	NULL
>> ...
>>=20
>> };
>>=20
>> >
>> > Obviously, .is_visible functions need to be extended slightly to filte=
r=20
>> > out by interface but that should be relatively easy too. Also, the gro=
up=20
>> > variable names should be properly prefixed when making them cross file=
=20
>> > boundary like that.
>>=20

