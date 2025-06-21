Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CEF830E841
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 19:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750534387; cv=none; b=N1nRrdPLTZMwYrxsT1hKBqhPj6UNaDzuiOGj2iIOVUqqZnHPcMnPTflVr6LY++sD1UvoX0z1JdLxNbED6xDzzdsgFjjlWpRwPGrRSLOe8TyNmvzS1Vo/qLGelM1YeoCrxlJ6eRpDSxJTSWu5mE9jyGzJzXXW5TvKJiBhAV2pBvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750534387; c=relaxed/simple;
	bh=UEKjrAFQnEwraXk12K4kDWQz+UUN9/Ntv4oWAPk7xPw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ymu+dDjgDUST48vujLV7ty+oVHqE36blD6DL3rdCh2lleF/EesUpgNd8rQiL4N7FL5WDE2S3NW/2peNigNYu/5zhymQ1gMWbQVnyyfqytxw2XlrGllO0/nrN3tsC0nzJWRiekbv+T+UzfvV44ENj4bbAiirPKKChtwjtKg4aS14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BUdL31Dq; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BUdL31Dq"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4530921461aso22612425e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 12:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750534384; x=1751139184; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3hIVdjksKm7JGCONOwGaEu195Y6B8FZHn6VcNUZQBOg=;
        b=BUdL31DqqFOLxUb0tdKKRdx+JTmry+2z3bo/P81nH6GRVzgKR5rqUPGUZBgi2bQXWe
         1hb0bRPOfHWVFWMIIP1R5489XpnqCzS+q3xoMBumMb2Vvx0EUxwq/zb8vEtlbG8HlO1h
         exp7uHQ65HvgdEzyw0GCy9Ex3e7mOj/CXxK6UWLIRKYLvuVJD0t0NO/jJHGD+YqJIoJx
         XyVz21WgCGmoNoYpwavhkKTHY3FjM+Q1MQRcH0RA0uaMRcXZwKHQSZOtWhI27tZP/T5C
         uD+YoFSGHFc0jSwktdqNTqo9jh9oC+Z6jin6KTRrFIIjTw5HO5/tCpM4uNAKaVYx9i6Q
         oyjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750534384; x=1751139184;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3hIVdjksKm7JGCONOwGaEu195Y6B8FZHn6VcNUZQBOg=;
        b=WORvwlyWI4IGsSXnlYNWRKmZjhT5J4fHBs59t+WAZNUjoc9rvbgnR3vI0eagJpu6kg
         vUA8RshEV503hZ/uFcMVy+UgXt59kCQr8chuMQyyuNjAe7wQzI8tI5GzBdSzjtkToIV5
         PZ3K5jpl+nCA/sKdEbRG4J7e0S3xG9BjH+laTTCMaKQHOnWy0XDWPLpUmaOse+0GZQ1U
         tVyuYNfyn2bcMd0L3M/RmMieTlXSkjSGvqoE8GkUFOfsZPxm9+y2osKhtygIvGzW0hx1
         pMGhdSfhyeEC+zC2GqvID2rwOwHFuMgsTit0rzAXtoKxiaAi9exhDAxMQ7WCTuzA4iHd
         1fBg==
X-Gm-Message-State: AOJu0YzIUrqsncupr7LUX7erBR59v5foUSHirZzGwI78B6ItZUO7i5VW
	4SNkR9+SK4BQK54qOuAwolo7FPwH53mMTBin4/glMgRP6P9AYol0yynt0HKeyRhfjRoNyVg7d/G
	mbqz8rcAazI+achc5QF0EsCB48yhMHHo=
X-Gm-Gg: ASbGncs7NvccdK5eKEhuM4cf/C8lakMuy4lGAwXguh7I5O96VeraSRXtW2Ac61FyRIN
	fdxI/AFcKg1kml9UUF9l6yrjAQFybT4kB07G4FMyJFwJv8J8SI4FMncKM6+eDB5Vfm3wZYlGUgA
	mtZUMtOQx04KKU/hYjApRceCML4XWGeZMUz/+J1uoGpg==
X-Google-Smtp-Source: AGHT+IEgxuUfokhkFePka5V/PvFGfAT4H4CT4LaNv+C+dCfGp+Cnug6B/qDCUOOhlObFMlEK4LJia+sDT0JK7fX6NFs=
X-Received: by 2002:a05:600c:840f:b0:453:c39:d0d0 with SMTP id
 5b1f17b1804b1-4536539c48cmr62474225e9.13.1750534383285; Sat, 21 Jun 2025
 12:33:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMb39_mAWfeuyDjHR4Ej9fH=PXdH0qUda50R=iqGKVzN1mcHPQ@mail.gmail.com>
 <48ff3e59-db6f-4870-8f0b-3c49dd4d865e@kernel.org> <CAMb39_nRz-9NemdsASTG_34Lm_6a1uw4qLwkqBdn7FnMmN3O7w@mail.gmail.com>
 <CAMb39_=0tUsn9u=KB72nT5MUhhdpujsOR1_+yhQTSXbijOM0MQ@mail.gmail.com> <d20cbb64-1eef-4ce5-a2fa-fce9044a50bb@kernel.org>
In-Reply-To: <d20cbb64-1eef-4ce5-a2fa-fce9044a50bb@kernel.org>
From: Walt Holman <waltholman09@gmail.com>
Date: Sat, 21 Jun 2025 14:32:51 -0500
X-Gm-Features: Ac12FXwjAhSZK3iwH3YQeYq69fZFC4USa_JPOW2ugMkzzlEYElZEzeIDarhkKn4
Message-ID: <CAMb39_nh5_DJpv0zEKauMRd1DpW8obpu228gpMVTaE7j3WPikA@mail.gmail.com>
Subject: Re: AMDGPU - Regression: Black screen due to commit 16dc8bc27c2aa3c93905d3e885e27f1e3535f09a
To: Mario Limonciello <superm1@kernel.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, mario.limonciello@amd.com, 
	alexander.deucher@amd.com
Content-Type: multipart/mixed; boundary="00000000000015646506381a0c2c"

--00000000000015646506381a0c2c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 21, 2025 at 2:12=E2=80=AFPM Mario Limonciello <superm1@kernel.o=
rg> wrote:
>
>
>
> On 6/21/25 11:07 AM, Walt Holman wrote:
> > On Sat, Jun 21, 2025 at 11:03=E2=80=AFAM Walt Holman <waltholman09@gmai=
l.com> wrote:
> >>
> >> On Sat, Jun 21, 2025 at 10:52=E2=80=AFAM Mario Limonciello <superm1@ke=
rnel.org> wrote:
> >>>
> >>>
> >>>
> >>> On 6/21/25 10:18 AM, Walt Holman wrote:
> >>>> Hello,
> >>>>
> >>>> With the latest drm fixes this week on 6.16-rc2, I am experiencing a
> >>>> black screen instead of the sddm greeter and the GPU appears to be
> >>>> locked up. I can ssh into the laptop and reboot it, but that's about
> >>>> it. I have bisected the commit to commit id:
> >>>> 16dc8bc27c2aa3c93905d3e885e27f1e3535f09a and upon reverting the
> >>>> commit, the system works as normal. The hardware is an Asus Rog
> >>>> Zephyrus G16 with AMD Ryzen AI 9 HX 370 w/ Radeon 890M video. I'm ab=
le
> >>>> to test patches etc.. if need be.
> >>>
> >>> Hi there,
> >>>
> >>> By chance do you have an OLED panel?  If so can you please try the pa=
tch
> >>> attached to this bug?
> >>>
> >>> https://gitlab.freedesktop.org/drm/amd/-/issues/4338
> >>>
> >>> Thanks,
> >>>
> >>>>
> >>>> 16dc8bc27c2aa3c93905d3e885e27f1e3535f09a is the first bad commit
> >>>> commit 16dc8bc27c2aa3c93905d3e885e27f1e3535f09a (HEAD)
> >>>> Author: Mario Limonciello <mario.limonciello@amd.com>
> >>>> Date:   Thu May 29 09:46:32 2025 -0500
> >>>>
> >>>>       drm/amd/display: Export full brightness range to userspace
> >>>>
> >>>>       [WHY]
> >>>>       Userspace currently is offered a range from 0-0xFF but the PWM=
 is
> >>>>       programmed from 0-0xFFFF.  This can be limiting to some softwa=
re
> >>>>       that wants to apply greater granularity.
> >>>>
> >>>>       [HOW]
> >>>>       Convert internally to firmware values only when mapping custom
> >>>>       brightness curves because these are in 0-0xFF range. Advertise=
 full
> >>>>       PWM range to userspace.
> >>>>
> >>>>       Cc: Mario Limonciello <mario.limonciello@amd.com>
> >>>>       Cc: Alex Deucher <alexander.deucher@amd.com>
> >>>>       Reviewed-by: Roman Li <roman.li@amd.com>
> >>>>       Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> >>>>       Signed-off-by: Alex Hung <alex.hung@amd.com>
> >>>>       Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
> >>>>       Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> >>>>       (cherry picked from commit 8dbd72cb790058ce52279af38a43c2b302f=
dd3e5)
> >>>>       Cc: stable@vger.kernel.org
> >>>>
> >>>>    drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 41
> >>>> +++++++++++++++++++++++++++--------------
> >>>>    1 file changed, 27 insertions(+), 14 deletions(-)
> >>>>
> >>>
> >>
> >> Yes, I do have an OLED panel and that patch does make it visible
> >> again. It is still very dark, but visible.
> >>
> >> -Walt
> >
> > Upon rebooting again, the display was much brighter and is fine. Just
> > the first boot after that was dark.
> >
> > -Walt
>
> Thanks, this makes sense.  I suspect that because 0 means "off" for your
> panel that the patch you bisected to exposed running at 0 (or near
> enough to 0) that it caused this behavior.
>
> That patch you tested will be upstreamed in a future promotion, and I
> think we can take it in a -fixes PR later in the 6.16 fixes cycle.
>
> But there is one more thing I would like to confirm - on your system can
> you run with drm.debug=3D0x106 on the kernel command line and share me th=
e
> output from this debug print?
>
> https://github.com/torvalds/linux/blob/v6.16-rc2/drivers/gpu/drm/amd/disp=
lay/amdgpu_dm/amdgpu_dm.c#L4933
>
>
>
Hopefully, this is what you need. I grepped dmesg for drm and threw it
into this file attached. Let me know if you need anything else.

-Walt

--00000000000015646506381a0c2c
Content-Type: application/gzip; name="drm-output-logs.txt.gz"
Content-Disposition: attachment; filename="drm-output-logs.txt.gz"
Content-Transfer-Encoding: base64
Content-ID: <f_mc6myqdh0>
X-Attachment-Id: f_mc6myqdh0

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
--00000000000015646506381a0c2c--
