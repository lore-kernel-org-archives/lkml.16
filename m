Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4178835977
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 15:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750692933; cv=none; b=pYi3gr0/rAj7sqIell3OdWh1kp5+pOYpyIrBLLLme4WrQ/JRvCDw5qcvJdwLlRHAofHCisOi1CuYizlI1bvhFvXGEsNUvWObQYYElvZl04OlXCJjhoB7Yg06TPm8aykWoPKsPX75SjVeZCJjCkGjcKBaYLiFD0OaVLTDjSYs86U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750692933; c=relaxed/simple;
	bh=EiHCWYnfA84Lwth0NtKhy0RZNL31ktggDzUPPkngdho=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TrgKto4KJ85r8VghKCkD9Dc9jtlg5h6K99KcOAPc+g8Oxom6aTACZobniPAGYrYTFX9FqCRNyPoEck0C712cFokgF+qrePq9ygkk4by+Jn7TJ0y9giZrxTqtGvMD73ytmItaC4ie875cHcRn8oflqBMqytLHMV5rg4uWqMqOTMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YCO4QwhV; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YCO4QwhV"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a54700a463so2394792f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 08:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750692929; x=1751297729; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=huYAT/t42g1dmZnYVcoeWH1YVJvzhdKSFl3csVwzj80=;
        b=YCO4QwhVDJA665Vzhl3ImTDRPx3DwAPMb7v5VgdmJ/2AJNPrHUKf8fHSvv5k4B6jx1
         +6taT6m3soKGNTwt4nM999cJ15ZMZw+/nmGqj1EPkuzhbeP6KCndUOJz2NXswLmC42uO
         8noYXaktdTJeWCRu9nLlYb6rAaiiwNeOHWhez4vKOg2Fa/Oeb/QOtyVt/2ftLRO9N3+D
         C5CPlIhd6jpSActsyekWc7TOfQDkY7i4gtzhruOtX+GYI+qoOlBWLKytZFpJjx3ZAuUt
         oLEm5oLoScA1O3jK/PKGh5xfZa0ZXRxc4t0mZAMo6xsmuoIGj8z4+np1VRc/8SpRB9n4
         IR5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750692929; x=1751297729;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=huYAT/t42g1dmZnYVcoeWH1YVJvzhdKSFl3csVwzj80=;
        b=GooV3eUDEWJtkChjd2eKbfsbfzjyOEYfXc4BWO+iFnFEZa/Gk/ks5LqNz9jppCKJlK
         oh9eVr88F87GEAtRwJxjQkjX1irR0idt2bgd8zMyAhwwkZRFQPEpSIM7Dwe141ynKrtG
         Fp1ebfUiphtMyrWE71bvdW0Bh2hKLLpSwoQ/Ldtqx1+AWz29Bro1NRpHm8ccz+FwMHSL
         JZgNNqSLR2JiZ4hmJ0xNwupR0sveh5eE49gZf+IXyHJ6t8/xC4YIhlbY2QeGxZY3DQZe
         bDUu4Du2vsQludpsoFIp8vJwGC6kDoMTrJmIJS6ia1vBY55Ugpr7J5/ITvkWjTbVohDO
         g7lg==
X-Gm-Message-State: AOJu0Yx6qMVYAVrhWWNlIJT29ttp8GWxlBmoDUbbROai9d1/tjcBp8WE
	gERsxOOtLTValV9zAi0H3fqBQ7+eCi7U+kXvH6K1BlLblaA3oHrKJUQjiqAsWj7C0ShKaK2t7VW
	kVhucn7Io8umGCzaV5Mf0IUnKCRErL3JJ0g==
X-Gm-Gg: ASbGncu5GReGc0WKY2SKVt8rZF9QnKmtt/iU9qOS9ZDREr5gLEcQ83oHK2huJPo08N/
	ktKKvnXZmJGfYtXrQFJEdQiLov8GBZ83qOTePv7KmryoUBIqjJjkrB48dQjA/MOPc9yLH08Q5rg
	MhOlM9BUtOnIIKf1fHb67SfddpuYlwBzWHIi01VSxZiQ==
X-Google-Smtp-Source: AGHT+IFnvY7JUfzEqgX6SMRWf5s6qit7gZXlsaTeTlGUWdJGFASdJH6pfWWpMC2Ui77oa2i2tmlUHC4sNiT2Iumv1Ls=
X-Received: by 2002:a05:6000:2883:b0:3a6:d93e:526d with SMTP id
 ffacd0b85a97d-3a6d93e54c8mr6283861f8f.10.1750692929258; Mon, 23 Jun 2025
 08:35:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMb39_mAWfeuyDjHR4Ej9fH=PXdH0qUda50R=iqGKVzN1mcHPQ@mail.gmail.com>
 <48ff3e59-db6f-4870-8f0b-3c49dd4d865e@kernel.org> <CAMb39_nRz-9NemdsASTG_34Lm_6a1uw4qLwkqBdn7FnMmN3O7w@mail.gmail.com>
 <CAMb39_=0tUsn9u=KB72nT5MUhhdpujsOR1_+yhQTSXbijOM0MQ@mail.gmail.com>
 <d20cbb64-1eef-4ce5-a2fa-fce9044a50bb@kernel.org> <CAMb39_nh5_DJpv0zEKauMRd1DpW8obpu228gpMVTaE7j3WPikA@mail.gmail.com>
 <9c40cd6a-b34b-468b-b5c4-6a2cbb7dcdef@kernel.org>
In-Reply-To: <9c40cd6a-b34b-468b-b5c4-6a2cbb7dcdef@kernel.org>
From: Walt Holman <waltholman09@gmail.com>
Date: Mon, 23 Jun 2025 10:35:17 -0500
X-Gm-Features: Ac12FXxTsrtD-ZYmskmomh3F_QbWpvnVgiKxwvu2DpIjdWepKKapiMCmTDdnhGs
Message-ID: <CAMb39_mpfdjxAH7jp0s7aedi_CsUOOVSR6x=8NG1ehRwWeQ30w@mail.gmail.com>
Subject: Re: AMDGPU - Regression: Black screen due to commit 16dc8bc27c2aa3c93905d3e885e27f1e3535f09a
To: Mario Limonciello <superm1@kernel.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, mario.limonciello@amd.com, 
	alexander.deucher@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 23, 2025 at 9:51=E2=80=AFAM Mario Limonciello <superm1@kernel.o=
rg> wrote:
>
> On 6/21/25 2:32 PM, Walt Holman wrote:
> > On Sat, Jun 21, 2025 at 2:12=E2=80=AFPM Mario Limonciello <superm1@kern=
el.org> wrote:
> >>
> >>
> >>
> >> On 6/21/25 11:07 AM, Walt Holman wrote:
> >>> On Sat, Jun 21, 2025 at 11:03=E2=80=AFAM Walt Holman <waltholman09@gm=
ail.com> wrote:
> >>>>
> >>>> On Sat, Jun 21, 2025 at 10:52=E2=80=AFAM Mario Limonciello <superm1@=
kernel.org> wrote:
> >>>>>
> >>>>>
> >>>>>
> >>>>> On 6/21/25 10:18 AM, Walt Holman wrote:
> >>>>>> Hello,
> >>>>>>
> >>>>>> With the latest drm fixes this week on 6.16-rc2, I am experiencing=
 a
> >>>>>> black screen instead of the sddm greeter and the GPU appears to be
> >>>>>> locked up. I can ssh into the laptop and reboot it, but that's abo=
ut
> >>>>>> it. I have bisected the commit to commit id:
> >>>>>> 16dc8bc27c2aa3c93905d3e885e27f1e3535f09a and upon reverting the
> >>>>>> commit, the system works as normal. The hardware is an Asus Rog
> >>>>>> Zephyrus G16 with AMD Ryzen AI 9 HX 370 w/ Radeon 890M video. I'm =
able
> >>>>>> to test patches etc.. if need be.
> >>>>>
> >>>>> Hi there,
> >>>>>
> >>>>> By chance do you have an OLED panel?  If so can you please try the =
patch
> >>>>> attached to this bug?
> >>>>>
> >>>>> https://gitlab.freedesktop.org/drm/amd/-/issues/4338
> >>>>>
> >>>>> Thanks,
> >>>>>
> >>>>>>
> >>>>>> 16dc8bc27c2aa3c93905d3e885e27f1e3535f09a is the first bad commit
> >>>>>> commit 16dc8bc27c2aa3c93905d3e885e27f1e3535f09a (HEAD)
> >>>>>> Author: Mario Limonciello <mario.limonciello@amd.com>
> >>>>>> Date:   Thu May 29 09:46:32 2025 -0500
> >>>>>>
> >>>>>>        drm/amd/display: Export full brightness range to userspace
> >>>>>>
> >>>>>>        [WHY]
> >>>>>>        Userspace currently is offered a range from 0-0xFF but the =
PWM is
> >>>>>>        programmed from 0-0xFFFF.  This can be limiting to some sof=
tware
> >>>>>>        that wants to apply greater granularity.
> >>>>>>
> >>>>>>        [HOW]
> >>>>>>        Convert internally to firmware values only when mapping cus=
tom
> >>>>>>        brightness curves because these are in 0-0xFF range. Advert=
ise full
> >>>>>>        PWM range to userspace.
> >>>>>>
> >>>>>>        Cc: Mario Limonciello <mario.limonciello@amd.com>
> >>>>>>        Cc: Alex Deucher <alexander.deucher@amd.com>
> >>>>>>        Reviewed-by: Roman Li <roman.li@amd.com>
> >>>>>>        Signed-off-by: Mario Limonciello <mario.limonciello@amd.com=
>
> >>>>>>        Signed-off-by: Alex Hung <alex.hung@amd.com>
> >>>>>>        Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
> >>>>>>        Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> >>>>>>        (cherry picked from commit 8dbd72cb790058ce52279af38a43c2b3=
02fdd3e5)
> >>>>>>        Cc: stable@vger.kernel.org
> >>>>>>
> >>>>>>     drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 41
> >>>>>> +++++++++++++++++++++++++++--------------
> >>>>>>     1 file changed, 27 insertions(+), 14 deletions(-)
> >>>>>>
> >>>>>
> >>>>
> >>>> Yes, I do have an OLED panel and that patch does make it visible
> >>>> again. It is still very dark, but visible.
> >>>>
> >>>> -Walt
> >>>
> >>> Upon rebooting again, the display was much brighter and is fine. Just
> >>> the first boot after that was dark.
> >>>
> >>> -Walt
> >>
> >> Thanks, this makes sense.  I suspect that because 0 means "off" for yo=
ur
> >> panel that the patch you bisected to exposed running at 0 (or near
> >> enough to 0) that it caused this behavior.
> >>
> >> That patch you tested will be upstreamed in a future promotion, and I
> >> think we can take it in a -fixes PR later in the 6.16 fixes cycle.
> >>
> >> But there is one more thing I would like to confirm - on your system c=
an
> >> you run with drm.debug=3D0x106 on the kernel command line and share me=
 the
> >> output from this debug print?
> >>
> >> https://github.com/torvalds/linux/blob/v6.16-rc2/drivers/gpu/drm/amd/d=
isplay/amdgpu_dm/amdgpu_dm.c#L4933
> >>
> >>
> >>
> > Hopefully, this is what you need. I grepped dmesg for drm and threw it
> > into this file attached. Let me know if you need anything else.
> >
> > -Walt
>
> Thanks I see another problem.  Can you add this patch?
>
> https://lore.kernel.org/amd-gfx/20250623144821.745908-1-mario.limonciello=
@amd.com/T/#u
>
> Thanks,

Got it added. Can't say that I notice a big difference, however, the
login screen may have been a tad brighter. But it's obviously more
correct now. Thanks,

-Walt
