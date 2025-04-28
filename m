Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B4F268C5D
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 14:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745849459; cv=none; b=mraNE/5xyYbwwknOxz30v8vOqmaK4t0PVFDjxit5CawmEK9OlMbwcfYZ5UHJiIZrji6Ygd65cnlBugn//3PynY7749mK0Pk+B7Nwp0TL9WK95O3E3NJU0c0tNtolsnkzzn3eMFn7yf1kha2MS8JTBSmwD1YjqGrR9uUok9ZK49E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745849459; c=relaxed/simple;
	bh=3h2EMGfvu+UctStWx0bIwV5H/Jn0gdVbSF2DccNcs84=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OhRP1aH+MJT1eDEmkhR5M4mdkxlZlyHhUayP/iPURaY5TQ/YYbopTlfdgy5sX2pWOaKx7Lrn5uYQaNqIKPISWQ2ZuBSSqXmtNWlnjPmBeKc215mlH56Xs1bL+RP2+ElKSrQtZ2gBOTTYgX7vUai+GycnZmZKAj3fGhaeDGZNwvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c+l6hOth; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c+l6hOth"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745849457;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G+uPdzRwnIP87DAfoRjnEpqTaAiojdHq3g26uxoE7Gc=;
	b=c+l6hOthoA062FLLkBU5WPLzG7LQv7ySeq44TMpjFSwC+dPiFNTE4Gub9mytoXYy8u1rAA
	Bpsx06YhZhd+rzfZl8McZYbZBk0stqmxn6wTHIgr5AVr2AwGLJGk41SeNqLz4uGG2TEMuj
	AaMtbhoFHDrTcOCTiQWrw9qaQ3j6zcM=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-537-o1dZczlWN5mLSaxgVkZ6ZA-1; Mon, 28 Apr 2025 10:10:55 -0400
X-MC-Unique: o1dZczlWN5mLSaxgVkZ6ZA-1
X-Mimecast-MFC-AGG-ID: o1dZczlWN5mLSaxgVkZ6ZA_1745849454
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ac287f28514so405923966b.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 07:10:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745849454; x=1746454254;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G+uPdzRwnIP87DAfoRjnEpqTaAiojdHq3g26uxoE7Gc=;
        b=LuZqN/6g1raTx5i4NFu89Ay8LHTQXgK0v0T7C803P7E/g88Ta9MCkav2Ta/yJiPgNs
         qJ1lK+UeZtUadkaZV2c+GQO7ERW4IDjNa55qNJ2Elatpny1VBy50qAiqA2j38eNR+TH2
         QAclQXeHD3VndrKPOXFWUkL7834YN/jDE4gyHCi3eHEeC/3SmPIOIHQrV89tiat1CVqU
         PFuvu94RGNICBWrj7fgDatJCQFLCDvHKSBtCD+fk4THejwgaLsQiLGs8ajx/a5dzy4uV
         gGMGCVaclxvkGCrCBHP2tlKG871BJcqmlT/nl+TUdlqNlSNLxrfMkSlIUekss29MjjyI
         3aaw==
X-Forwarded-Encrypted: i=1; AJvYcCW1PyqpPVCqzJ2smRWD4PykXprkSKLi4/t9uq52EXSLst0wg1PlrZ07T6VriMUgHz9xcLiBTWrh8OScJRQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNSFLr335Ip83iQr44TQlLs3NMTyNhnZNce23/bWugd9owlZ3+
	VuDrpG5oXOFpkIiKSdNGmmV8KTqiVYD8UGzymAb0IRpbB2ieCQdUbFazQlGjMNxgXP3ARtTEQcw
	FrIVIzLYno3ChaRlUdTiY83piSHdp0OGWYFINSSbjSwFMaxsU9qKBT/GutSGFoQ==
X-Gm-Gg: ASbGnctzMwFauaax2BAeRTV5S8112P63S0ZvDmTNxG6ZJaN4vKYRWEE2JstxpVNMHjL
	MyZBhWRvxPwFncsb5TS0OPmmVPkZc4lFmF+FZnAnpvF1yWVtPMMTlPeE2qw/MAVOl4vEA+lKJN8
	UfOXVolHOVNTVlfrBCK5tXoICHIE4HyO2uZ01IQrfVAfbAqgfAt8FsHR0rhLH+DzySIwMV+m3Q6
	EFrpOQ1kMESkFuw65+FCmyY5QIT0hFmAbmSqDVNXwQKK2j1GI72Ubv0T7GY/UDfqFNx1ZV517rq
	NawQiMuDYdliDUM=
X-Received: by 2002:a17:907:9449:b0:ace:6fa7:5ed3 with SMTP id a640c23a62f3a-ace848c0470mr711016766b.4.1745849454259;
        Mon, 28 Apr 2025 07:10:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDhqLGdlz5ExTdegQGYB8SKbnk9MuRrjtYF3bvcdYMyl0xaJNQdZAaKvtae1celGjHMZAYPg==
X-Received: by 2002:a17:907:9449:b0:ace:6fa7:5ed3 with SMTP id a640c23a62f3a-ace848c0470mr711012366b.4.1745849453831;
        Mon, 28 Apr 2025 07:10:53 -0700 (PDT)
Received: from [10.40.98.122] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ecfb35bsm633212366b.100.2025.04.28.07.10.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 07:10:53 -0700 (PDT)
Message-ID: <98ffacc8-d13a-49b6-bcfd-f3cc35224b79@redhat.com>
Date: Mon, 28 Apr 2025 16:10:52 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] Input: Add a Kconfig to emulate KEY_SCREENLOCK
 with META + L
To: Mario Limonciello <superm1@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..."
 <linux-input@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 "open list:AMD PMF DRIVER" <platform-driver-x86@vger.kernel.org>,
 Mario Limonciello <mario.limonciello@amd.com>, Armin Wolf <W_Armin@gmx.de>
References: <20250425162949.2021325-1-superm1@kernel.org>
 <aAyWFI+o/kU9hDVs@duo.ucw.cz>
 <b4bc07aa-e4b5-4a2a-a4ad-91c1e5071f00@kernel.org>
 <aA0o2SWGtd/iMYM2@duo.ucw.cz>
 <db4dfc85-ce8b-4922-9558-670c3bb6eff2@kernel.org>
 <aA3KXNCKKH17mb+a@duo.ucw.cz>
 <63fbf7e7-8d61-4942-b401-51366705252b@kernel.org>
 <7tnn7sa654c3irqxprnqgbxawl6pnvuuonps3t5qkhso3h6fp6@fc3ph7fkukgm>
 <owigkmidrmavvcdewxx3fvqyp4klvchklgwbtpzncqiado4kwb@akuzxqxp5jpm>
 <a7e82a84-2610-4132-90a8-42b371f57fb0@kernel.org>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <a7e82a84-2610-4132-90a8-42b371f57fb0@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Mario,

On 28-Apr-25 15:50, Mario Limonciello wrote:
> On 4/28/2025 12:51 AM, Dmitry Torokhov wrote:
>> On Sun, Apr 27, 2025 at 10:30:24PM -0700, Dmitry Torokhov wrote:
>>> Apologies for extended absence...
>>>
>>> On Sun, Apr 27, 2025 at 07:15:31AM -0500, Mario Limonciello wrote:
>>>>
>>>>
>>>> On 4/27/25 01:10, Pavel Machek wrote:
>>>>> Hi!
>>>>>
>>>>>>>>>> In the PC industry KEY_SCREENLOCK isn't used as frequently as it used
>>>>>>>>>> to be. Modern versions of Windows [1], GNOME and KDE support "META" + "L"
>>>>>>>>>> to lock the screen. Modern hardware [2] also sends this sequence of
>>>>>>>>>> events for keys with a silkscreen for screen lock.
>>>>>>>>>>
>>>>>>>>>> Introduced a new Kconfig option that will change KEY_SCREENLOCK when
>>>>>>>>>> emitted by driver to META + L.
>>>>>>>>>
>>>>>>>>> Fix gnome and kde, do not break kernel...
>>>>>>>>
>>>>>>>> I'm sorry; fix them to do what exactly?  Switch to KEY_SCREENLOCK?
>>>>>>>>
>>>>>>>> That's going to break modern hardware lockscreen keys.  They've all
>>>>>>>> obviously moved to META+L because that's what hardware today uses.
>>>
>>> Vendors do all kind of weird things. They want to ship their
>>> peripherals here and now and they do not care of shortcuts will change a
>>> few years down the road.
>>>
>>> FWIW there are plenty of external keyboards that use KEY_SCREENLOCK and
>>> do not emit any shortcurts. Anything that is "Woks with Chromebooks"
>>> will use KEY_SCREENLOCK.
>>>
>>>
>>>>>>>
>>>>>>> Gnome / KDE should accept either META+L _or_ KEY_SCREENLOCK to do the
>>>>>>> screen locking, no?
>>>
>>> KDE by default recognizes Meta+L combination (which used to be
>>> Alt+Ctrl+L), Screensaver key, and allows users to define their custom
>>> shortcuts.
>>>
>>> I also wonder how many other DEs beside Gnome do not recognize
>>> KEY_SCREENLOCK.
>>
>> So I poked around Gnome a bit. According to the gnome-settings-daemon
>> source code KEY_SCREENLOCK should be recognized. It is set up as
>> "screensaver-static" key which is hidden and shoudl not be changed by
>> user:
>>
>> https://github.com/GNOME/gnome-settings-daemon/blob/master/data/org.gnome.settings-daemon.plugins.media-keys.gschema.xml.in#L504
>>
>>      <key name="screensaver-static" type="as">
>>        <default>['XF86ScreenSaver']</default>
>>        <summary>Lock screen</summary>
>>        <description>Static binding to lock the screen.</description>
>>      </key>
>>
>>
>>
>>>
>>>>>>
>>>>>> This was actually the first path I looked down before I even started the
>>>>>> kernel patch direction for this problem.
>>>>>>
>>>>>> GNOME doesn't support assigning more than one shortcut key for an action.
>>
>> It sure does even if it is not shown in UI. Poke around with
>> dconf-editor and look in /org/gnome/settings-daemon/plugins/media-keys/
>> and you will see plenty of "*-static" keys with multiple
>> keycodes/shortcuts assigned.
>>
>> "touchpad-toggle-static" - ['XF86TouchpadToggle', '<Ctrl><Super>XF86TouchpadToggle']
>> "rotate-video-lock-static" - ['<Super>o', 'XF86RotationLockToggle']
>>
>> and so on...
>>
>> Maybe Gnome broke screen lock key in recent release?
>>
>> Thanks.
>>
> 
> Thanks for your feedback and looking into what GNOME is doing.  It sure /sounds/ like this should have worked with no kernel changes and GNOME has a bug with the lock screen key.

My guess is that maybe at some point the lock-key (combo) handling has moved from
gnome-settings-daemon into mutter and maybe things broke at that point ?
 
> I'll abandon the kernel series.

Agreed, the GNOME bug needs to be fixed regardless of AMD PMF use.

Regards,

Hans


