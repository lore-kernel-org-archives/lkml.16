Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA60118952C
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 17:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745859643; cv=none; b=bbvweSz27Fh8XvlngBh6Vx+zPHsOdlURNGNr77wV438VqDKvorSYSJkCjadmi4wO8X7+LxR2Vjlvx/Ll1Msjryu17NkbuYR2iJ3Wy4RlAz1OxD/shHR8hKPSJ2pNcOiWSTm+DTYpF1rK7Dr+3aeKEKG/6w+0D+aOoRonwwtOni4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745859643; c=relaxed/simple;
	bh=uqa3pUCCBhc/8XYYDK50VJ8Kh8SjO9GYpSwwxAaDr8Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ce2L861nxlK19qo7JNzJ/XgkuakW2BFQM64cP71c4LwVkcLj/So1kOxvR0CpWqw5TalnKqh+zK5gELR6BpduYmvoddI7THN5F+B5m/AoRlBMLhDU8QqyrkqtS76XaTrQ504mZ8N4VSbU+z9R+NlDWCmwSqLQA1mpfpW+DgNH1dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PqJKqkVa; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PqJKqkVa"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-224191d92e4so55655225ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 10:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745859637; x=1746464437; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uqa3pUCCBhc/8XYYDK50VJ8Kh8SjO9GYpSwwxAaDr8Y=;
        b=PqJKqkVaUBkOfaOXpAuhS7GmHevH3FPLw7w9UP4+cxI/eX3JPMaBZlnaDR4z6VXLjr
         2lkJrBAPptUHyglcin+rWmxIoOclR+ETKra7Ir23N+20T434o9IsXDS7MwZFZtgohs2G
         4gsQQ6YEbFeZgxM3FCZ4A5s64zFTwehN4PJcA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745859637; x=1746464437;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uqa3pUCCBhc/8XYYDK50VJ8Kh8SjO9GYpSwwxAaDr8Y=;
        b=sjW50XDVDaM8gS6soD3i2SUK2T4Ifajg0kpHZVY5YV88GUJBgf3e+KtZkXfm/S3alf
         DxwkzjPaD1pLQAYAQarw3y9CxGbH6/6c/v4WVGgTcPvuob8mYzA4SOAmI/dHxY1VYYmY
         2D7oW230ztCKzZdGPfwKdJ1v5TEwJsEnnpkwvTFdv78O5XZYhNJYfB+l0L2/lGVor22J
         7l1T3h8ljSmAYYLjD0jHGBey77lWKQdAAH65BRdWyrKRIJ/c93y5GQtJf/HuFrtM9SFX
         q1bDaMjDcFOSKwax5CxVNmUYL5ZvGtcYU9VwJhsj0QbsJEoBaZt4hnVdpWZj/9JzeP/T
         DA4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWlBKrrQbLA/uy3MGORD0GPdqSWoNcjzqKc9wo2obEvIXjnfpj3WoDVzESa9a2Fxhq6r0SNxXnCj4Q3jjY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKjjYNX/KYvrXisRLc+JqNj1x64i+KY6MlXqA7C1TqPnsxG7Ab
	GhwkDhXRuS6Vn1iUDu5TYwm2+poh22MuzE7vqu6Ue7tV/FSBWDJmA5t5B0uvbrOoQ3pLnYxrsDc
	=
X-Gm-Gg: ASbGncsGbZr9YpZ9KY0p6YRcEMylmuF0+r9PcrcdaQBXrBTqoYLE9UDEB5qOdUwXHyq
	Ym9J7AghX1BVXYW6OU+jWBn2ZBYagTCs4fHb67S9Fr+ocmwwB4go52hXAB7gds3rg7n74EKRjs9
	Ma4X0LtZai/pW5+tgcL7KPFkub14YN08tI6pshNW9RoPLg4B7CdqdgMaODW6wP/bJyoxAhbWR80
	mcE8v0yL/y6/3cyEHbkc03g8X6TLaOWfW3Synd0UM7FJKacp0W8IwR8qO8Q+kfrQkb9H7RyqSZc
	6dyAUvBaxFhcvEFSd4j2CMYh1AraruEuJx6cFnKeqX+Q8Gfs9Qvuf8SylhkL7I76XAYZ04BatJe
	oFUMB
X-Google-Smtp-Source: AGHT+IGlToMiw/O/wET0RnQItLtD67nCUIDA3fbjyrgO58jd/DubrxjHsA10sRHVAGQO0vloLWtqig==
X-Received: by 2002:a17:902:e841:b0:224:f12:3735 with SMTP id d9443c01a7336-22dc6a09655mr142751655ad.31.1745859636736;
        Mon, 28 Apr 2025 10:00:36 -0700 (PDT)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com. [209.85.216.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5221cbbsm85167795ad.221.2025.04.28.10.00.33
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 10:00:33 -0700 (PDT)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-30828fc17adso5060673a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 10:00:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWGX1HTmgvzXJIc7gC6yNyoytM2seUPu51XQ5UxgYlon0rVco7jm5l77M9pkV8VPmBG6xIlkDAEGrv6g88=@vger.kernel.org
X-Received: by 2002:a17:90b:58cd:b0:2fa:15ab:4de7 with SMTP id
 98e67ed59e1d1-30a01329af0mr17554015a91.12.1745859632801; Mon, 28 Apr 2025
 10:00:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250411092307.238398-1-j-choudhary@ti.com> <CAD=FV=Vkj_YnmYnDF3K+eYZ5M4fFPgGdmryHS8ijZOLZWbt6ZA@mail.gmail.com>
 <d6e864d9-53ea-44d3-832c-55a6e58ac6d3@ti.com> <526c1714-95f1-49ea-9bf1-a778e00ad6bf@ti.com>
In-Reply-To: <526c1714-95f1-49ea-9bf1-a778e00ad6bf@ti.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 28 Apr 2025 10:00:21 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WqKawr-e4riTPYfaOOW=pfsFQ9emQSqr=OB=hYNV9EQg@mail.gmail.com>
X-Gm-Features: ATxdqUENHvp3B6JI9Rchu8sHVmpuke2Fbz8JeoXha2ori6afQDg1Oe3Ku5_NCjU
Message-ID: <CAD=FV=WqKawr-e4riTPYfaOOW=pfsFQ9emQSqr=OB=hYNV9EQg@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: Add necessary DSI flags
To: Jayesh Choudhary <j-choudhary@ti.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, dri-devel@lists.freedesktop.org, 
	jonas@kwiboo.se, jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Apr 24, 2025 at 3:47=E2=80=AFAM Jayesh Choudhary <j-choudhary@ti.co=
m> wrote:
>
> Hello Doug,
>
> On 17/04/25 02:40, Jayesh Choudhary wrote:
> > Hello Doug,
> >
> > On 13/04/25 07:22, Doug Anderson wrote:
> >> Hi,
> >>
> >> On Fri, Apr 11, 2025 at 2:23=E2=80=AFAM Jayesh Choudhary <j-choudhary@=
ti.com>
> >> wrote:
> >>>
> >>> Enable NO_EOT and SYNC flags for DSI to use VIDEO_SYNC_PULSE_MODE
> >>> with EOT disabled.
> >>
> >> Any chance you could add some details to this commit message? Your
> >> subject says that these flags are "necessary", but people have been
> >> using this driver successfully for many years now. Why did these flags
> >> suddenly become necessary and why were things working before?
> >>
> >> I'm not saying that we shouldn't use these flags, just trying to
> >> understand. I actually don't know a ton about these details in MIPI,
> >> so it would help me :-).
> >>
> >
> > Definitely.
> > I will add more details for the commit message.
> >
> > For more context here, I was working with cadence dsi driver for TI
> > SoCs. So to be more accurate, this is required for CDNS_DSI
> >
> > I observed other bridges like lt-9211, where I have seen such flags
> > being set for dsi-controller by vendors.
>
> Upon testing with modes other than video sync pulse mode,
> I found that with the upcoming fixes in cdns-dsi-core driver made by
> Tomi[0], this patch is no longer necessary.
>
> [0]:
> https://lore.kernel.org/all/20250414-cdns-dsi-impro-v3-0-4e52551d4f07@ide=
asonboard.com/
>
> I apologies for the noise in the mailing list.

No worries. If folks are convinced that adding these flags makes
things "more correct" I still don't have an objection to landing the
patch, though the commit message would still need to be clear about
why these flags make things more correct. I'll leave it up to you. ;-)

-Doug
