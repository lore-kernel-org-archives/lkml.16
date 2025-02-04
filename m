Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD72216E15
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 17:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738691816; cv=none; b=N5sOw+OmygplVH9MDt/HEDYrCncuJcNuENDsuNN/8V32LqvGcO1Z/ZXiHeDQs+NaGzhnImWjl51XG4lKBtBhVSyhdo/DaqrH0shFCWQi9ROPKwVcTzwtKsgoHzQFnoMZWXqK2FzPmOZA20IdLI48e/fbQsCdHp2T+kxk3t33M6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738691816; c=relaxed/simple;
	bh=6MfNKqlPY66LdRK1s+sv6ABSkmpyUD/zuxH8o4il5yE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i4e9Oi2biK91WBdfA+YJIhWTnEYw5B52Q7tE4O13+lwTYD1IMfb8DZ1FxYe0taq54Xdvd0pzYodOtl/4xtgLOeRWdayI7TUibDDl4dQcIF0qlweePirIk7Uwf8l49EUXgHBCrZq4ce3Ok9F3N3wtM5qwYbhC/d4j/dpr8gR/hC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=i6x9NV9P; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="i6x9NV9P"
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3d04e5bd797so12575ab.1
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 09:56:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738691814; x=1739296614; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6MfNKqlPY66LdRK1s+sv6ABSkmpyUD/zuxH8o4il5yE=;
        b=i6x9NV9PZxC/hxVZZp1y3iN0ax1w9CIJ68O47lGfKS7vJLkmiGnoiP3h4B1OC9MExR
         jP1RucHlwzMd0THbuzCV4hbuH0TqDhygkLW7zLYQWBhLUfeMOSjAho0MJRUG74UwDsrl
         PmZ5KdTx1WLdm0mGiHULJS1Lk0uvoeWw4RQ0GRk1XSRVeH4a2fSGD2kkCSIIC0CGtzUU
         FnQJ1Lo3imk2KGdhe6ocTLs8yzWLG8kNnSEazoFWA/1hZNhFGfH6okSR15vljDxILOIr
         frfbrHOrMWjW/Z59q3YtYU2+XNEHLZNmQRfEfWGca3fssok5+0xvdCAaK1FblnEqyWNg
         vswA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738691814; x=1739296614;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6MfNKqlPY66LdRK1s+sv6ABSkmpyUD/zuxH8o4il5yE=;
        b=c1DARbcrRO+e3DBGyMPq16NTgwnK7a3RO16FnALpJktn1Y6W5g/wG+IbRHNukL/m/p
         yjSQbEdPN3w2mnlwG/F4oIjjTVbyub/BX1zZJXXKuAo2qQVikXSKlI6eaypqhloa4Lp7
         8IEjPUWs1ih0gaEahFKAOoJSwTcUFRhD1F91IvwoQDtvRPgciQ1I2m5t6nBNNKy+0P6l
         9l5ygtZA83k9IzZP8yvmJEGZzU6qH6cdwaotFt9GTR//6iB80CFfrbNfloWCaX001TY9
         XkX6OT1zjzq/8qKew72anzz1x174XtitSXxmajOlccQXDenGi+xVYwtAJ74NO+/kNvXR
         PUIA==
X-Forwarded-Encrypted: i=1; AJvYcCWSvVaDbI+1Q40hGeoHrJG5fkDG59ESx9M2HOfgGL9ijBQLIN4zl29KEvfmWbB3dmnY0QDV9MIme5LxcyE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0HKqPmE+zmwlVjtREIeAiOxURr39ooX73PrML0JoksnX4D5T/
	bacw2UR9oNuEVYZhcpZ66C/rPRhXD5t/M2uPmcHA2DkeSuDHZ7ezpgWfxhYvBxXxJDeD69qAiep
	VL3CyS/KicSBppBShjdDgYBsqhGZA3Bs+N7n7
X-Gm-Gg: ASbGnctdfTGsgJiT8Mx1861aE21cbiKH3E4LyVwcMnUo5Jq8TTXRQ09oCr/cD1ZOsJq
	78KHebSguv7p/+XIrzx6X+oUML/6T9ogaHfWSCS9vj/tFphjuEqFmO1sE0LvZa/dViIWhvSc9o2
	CWFjD+v4S4xwPpR1u4BGPaBZU=
X-Google-Smtp-Source: AGHT+IG1acNH4dX8Vb0s5oxx9ddSfzVUNv/AaN82ZPUmm9fX6OxCbLVTvL2daR2maEwM0AH0L4ztS+4bA7GtmkxfApc=
X-Received: by 2002:a05:6e02:1566:b0:3a7:c9eb:accc with SMTP id
 e9e14a558f8ab-3d03fbfd550mr4313095ab.14.1738691814257; Tue, 04 Feb 2025
 09:56:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241215181220.754822-1-howardchu95@gmail.com>
 <Z2CJW0vFT005gmIe@google.com> <CAH0uvogp4GB6ZkB=79wCNVtOhsGw-aofzGmW6nPc--b=g-D9OQ@mail.gmail.com>
 <CA+JHD92xXH=6K0-imdObf+dw3=B0uiGdFH16DO3ArdHv3r1Zzg@mail.gmail.com>
In-Reply-To: <CA+JHD92xXH=6K0-imdObf+dw3=B0uiGdFH16DO3ArdHv3r1Zzg@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 4 Feb 2025 09:56:43 -0800
X-Gm-Features: AWEUYZmt0EhyS_vNxi6_NAMLvcI8PJ4wAkE-Tn2ZgXvM9XCRHXIsR_7itjC3TSI
Message-ID: <CAP-5=fXRBssmhBZDTbk0=0_qzo6R6f5Kg4BGnE9M1AA2viR3=Q@mail.gmail.com>
Subject: Re: [PATCH v14 00/10] perf record --off-cpu: Dump off-cpu samples directly
To: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>
Cc: Howard Chu <howardchu95@gmail.com>, Namhyung Kim <namhyung@kernel.org>, acme@kernel.org, 
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org, 
	adrian.hunter@intel.com, kan.liang@linux.intel.com, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 16, 2024 at 12:55=E2=80=AFPM Arnaldo Carvalho de Melo
<arnaldo.melo@gmail.com> wrote:
>
> Now it's my turn.. ;-)

Perhaps this could land?

Thanks,
Ian

> On Mon, Dec 16, 2024, 5:49=E2=80=AFPM Howard Chu <howardchu95@gmail.com> =
wrote:
>>
>> Hello Namhyung,
>>
[snip]
>> On Mon, Dec 16, 2024 at 12:11=E2=80=AFPM Namhyung Kim <namhyung@kernel.o=
rg> wrote:
>> > Thanks for your work and the persistence.
>>
>> I think you misspelled 'procrastination' :). All jokes aside, thank
>> you for the reviews=E2=80=94it=E2=80=99s much harder on your side.
>>
>> >
>> > Reviewed-by: Namhyung Kim <namhyung@kernel.org>
>> >
>> > Thanks,
>> > Namhyung
