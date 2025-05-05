Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8932F33E4
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 11:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746442828; cv=none; b=cg2KPN4mfyCkcR8oXSgWdeOAN3ezyStBGUUTsPgmJ8aegzBF7vUWQe480G3pB5zrq0VnIO903dkSQa5On0KpFv77T3eYllenN/G0d6fBp5u5+SJ7hHfkxBGwJzifHSbEKyPmfRd8Zuxv66Fm8JQyh2wD+SYEHrZ2FHF62t/o0mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746442828; c=relaxed/simple;
	bh=bGplvSCQsaTAXR3bicm/4TgnBkJ/3j/c8VsVO7MaOUg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=AKg8zeRYP0/vudx3kTMvFvrmXmj4MnxKlWl0nLWUsz6VeaEFA7uhNBx5mLcCABtz0HcDD9/M4ieTTzXUhAaSeVgaZqOVHie1UnvcmZoPRpW3tD73dUrHGjGRtWTX+XHUmJFVU7h5O4wKSiSH1M7jAMv1xvJbnuBslGrhcUdmXEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BViqOI88; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BViqOI88"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746442825;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gYZVyBXjALhKKXNyoTTAghH2Cljj5vQ2jFdSmpambSs=;
	b=BViqOI8893trd4S8VcngoEqF7xOcHPbdme252v5uD5NSXhiOeUlu122+gkhnhN2vX5a7kw
	7+5pWObDIn3qbovsNbiG4ii3Xsz4sHlv6Kn7Cevr2ubsDZ9ATTin9IAWlJLMH08bIDBThl
	Uwzh4Oon9pmtMxtBG1R4/NtjI1jlaB0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607-EyoeY_DQP3ae6eGdTM658A-1; Mon, 05 May 2025 07:00:23 -0400
X-MC-Unique: EyoeY_DQP3ae6eGdTM658A-1
X-Mimecast-MFC-AGG-ID: EyoeY_DQP3ae6eGdTM658A_1746442822
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3913b2d355fso871378f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 04:00:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746442822; x=1747047622;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gYZVyBXjALhKKXNyoTTAghH2Cljj5vQ2jFdSmpambSs=;
        b=nGBdB1ogHKmA2dplJ96mnd2KnSux8PXUqsAviyUPky3CJb5E7i0Ga8Z+mj4phDniOQ
         kH9oiGUMbHJPTuKn60YLSWxMyXi7ZAbMG0YHaDpFGMUKyIbMccuob8VRQbwltJnen672
         L+XuRRxPsH6bNiEok7uA+u2rHe/RTkxba4V+AXcIshQfTQIJfadz/BPE+Q2imOvV88F/
         pFHovlhrUS/vkFd15JhkzvByrQMiPTkZ893Vk/pRp+tAp0/mheh1V9lHyYOkXFbpI2fc
         QTNHhS1xmC3cVRZ6cWkSw6WYlW+LUVKrb9S6XAyJijLf0tPKyAPMXIHMbMjEMs0DvuBB
         EsLw==
X-Gm-Message-State: AOJu0Yykd5iKja+Ayo7ZQuGzICSVe8ovEUk9OgBrHYcaoDcCTDXGBKey
	pPXu0rMDbHuUgThLHeSLBQS1JWLW7vHBE/E/zrKlBlDF6jrWJIitm0vpoHIEAIdHA44ACr8TdZT
	xAR5HkbAZIdijP3MnjvCbFSXnm31fCGNicVXBKkc86VlwPFOYFSpiXAzdDgtetg==
X-Gm-Gg: ASbGncsXvDLpaKB/p2BmXQ076tpQWY4rTOkvm9W7sI/FEwzIfmLII3NmogLUuhYtp1c
	ETWM2GqeDmxRS8Q92NXY3JxWDPWWL41H0ioDU/9Z5V/TZ/rH+UyE4gnX/2KCb/AxJrwGI7T/t+a
	PEbQ/Wjbhci/ehMnHzTO8tnkVdV/bUupZR8jT7RPNO19+MaIFbJRWyyDrxn4lzfz/Vdj9el50n1
	FHV/kjW9oh9g8WpQHQirkONqiWVaDeYFzYvPDXqO+vWjNCB7cgGOlbxeHJKVOVJX/654vR+a2IO
	uon3miIR2tdfQcIHabUJJFw6W/POOHqNyJyo2jDZ5Q==
X-Received: by 2002:a05:6000:178f:b0:39c:16a0:fee4 with SMTP id ffacd0b85a97d-3a09fd88901mr5903273f8f.27.1746442821963;
        Mon, 05 May 2025 04:00:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGBxRsfJq3WL/X8i0OkbQ6itau/ggn7k4p8e3Vj8ihS5socMSRfYRyDLKwDFZM/ivQvZNUfA==
X-Received: by 2002:a05:6000:178f:b0:39c:16a0:fee4 with SMTP id ffacd0b85a97d-3a09fd88901mr5903250f8f.27.1746442821629;
        Mon, 05 May 2025 04:00:21 -0700 (PDT)
Received: from localhost ([195.166.127.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae7a55sm9913932f8f.45.2025.05.05.04.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 04:00:21 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Marcus Folkesson
 <marcus.folkesson@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, David
 Lechner <david@lechnology.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/sitronix: move tiny Sitronix drivers to their
 own subdir
In-Reply-To: <29c139fe-337d-4cd2-944b-8e26080a326f@suse.de>
References: <20250503-sitronix-v2-1-5efbed896be2@gmail.com>
 <27a5f519-de87-4fab-b465-bb89ae5b988b@suse.de>
 <87r013wgoy.fsf@minerva.mail-host-address-is-not-set>
 <29c139fe-337d-4cd2-944b-8e26080a326f@suse.de>
Date: Mon, 05 May 2025 13:00:19 +0200
Message-ID: <87o6w7wce4.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Hi Javier, Marcus
>
> Am 05.05.25 um 11:27 schrieb Javier Martinez Canillas:
>> Thomas Zimmermann <tzimmermann@suse.de> writes:
>>
>> Hello Thomas,
>>
>>> Hi,
>>>
>>> there's one major issue here. You must not change the Kconfig symbols or
>>> you'll break kernel updates for a lot of people. So those TINYDRM_* must
>>> remain as is.
>>>
>> I disagree. The https://docs.kernel.org/admin-guide/abi.html document
>> explictly states that Kconfig symbols are not an ABI, and userspace
>> should not rely on these not changing over time.
>
> To summarize our discussion on irc [1]: changing the symbols is ok, but=20
> we should make it compatible to ease the transition. To do so, the new=20
> Kconfig file can still contain the old Kconfig symbol and the new one=20
> defaults to it. Something like this:
>
> config TINYDRM_ST7586
>  =C2=A0 tristate
>  =C2=A0 default n
>
> config DRM_ST7586
>  =C2=A0 tristate "bla bla"
>  =C2=A0 ...
>  =C2=A0 default TINYDRM_ST7586
>
> Doing 'make olddefconfig' or a similar make command sets the new symbol=20
> from the pre-existing one. After a few releases the old symbol can be=20
> removed.
>

That makes sense to me, yes. I'm not against making the life of distro
maintainers easier. We can then drop these transition symbols after a
few kernel releases.

> Best regards
> Thomas
>
>
> [1]=20
> https://people.freedesktop.org/~cbrill/dri-log/?channel=3Ddri-devel&highl=
ight_names=3D&date=3D2025-05-05&show_html=3Dtrue
>

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

