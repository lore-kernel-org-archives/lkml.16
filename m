Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77707204879
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 15:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743520034; cv=none; b=UIyzy+msKDJLkVXMFFaOzdD0BTgScWtxAKA1rlkB6C4Ld0rJodlnprLj6EeXxDZJx29x6WAt/F9kAQaxq/qkXGJhWzhecmoWO4BO+j2O8957gAMsAmwn9tsDjPTVfOBmeQt7AR+o03yi5MAjVCgAW8SIaugw+PRWzLComqegWhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743520034; c=relaxed/simple;
	bh=dRuO63E+69TadZDhBnj56rdcnGKLJdb/8PuPtgys64c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GuhmBAkxPHCxENfeg/FU4E8Cta+IxhRqwHkZcnLkNpQN9zN6lWXfLowip62sTZqLtgqByPKKfx1NFVk9r8aQDtPNq6x+MwXM8PejzL6l3//QcjSdw29CJcnalvmDHQ29HPPklu+waF0Ea1IhzDCYWy8P0qysmiSSG8nf2J/qY3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OzvVPyQh; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OzvVPyQh"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54b166fa41bso2959296e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 08:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743520030; x=1744124830; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dRuO63E+69TadZDhBnj56rdcnGKLJdb/8PuPtgys64c=;
        b=OzvVPyQhAM0YwURywgRodYW3HPaDDiqWrb/s2b7C8A/Bqo+9dyMaQuW6mUxFV2t03m
         Td56BrQU3G3LQsgUVPdc5an9aEd6QNVhNFdbbfMLOI073XsTLyxzO3IyvHazWJkAW4i3
         jNAGK+0ZufJPuALS7voCIEHnnV2BWw50oIanA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743520030; x=1744124830;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dRuO63E+69TadZDhBnj56rdcnGKLJdb/8PuPtgys64c=;
        b=gnzaOdimPxMDlAw0lN9Um/zW5hThWFJ2Wbj1cnbu9vahglmiCb9EhWKlFzf5Ce+02S
         PI5Nz8nPi+EeLsNFyQ1QUVZL2gsBRV7wHabHjE4BWGGrXMwiGi4D7i0neaE80aW75cgM
         J1OrtmPchNxhq+J7BqJKY7eJ4+vSjWZke5GX6U+WwVMgzmWzO9A/Xwa4L3TE/wBJkS97
         8pDLP0EhEhJiZeUkeBi0GFNkTk0Dm0ZIIoDOcLEOgBsVOkxhm5RCPo8S7RdVzPM5/9ck
         aNfsD7w6SB72VeljDzM3FHSiVB9+tUL4xBsVvIK+fsyTtcIKhET8H/OjAvmOYnUqDIcX
         S6nw==
X-Forwarded-Encrypted: i=1; AJvYcCW/krIchqR+eIQ3z6J0DmN2bDArBicHo6ShAs/KGAmDroUqMcb8HN11vhLyVQR1LiLhoYcETO2F5WCLpeo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBX3Sm1ubIHfgO2AdwvO/dgDRf5DgNOnS2ZqgJyGKFwEaWo0Xj
	fdwBz7QkQY/K2v8Gj7QEl69+6k4B0yQsATZzHxOg3XY+MqjsfUD/Gp4Bu4GTtjmdrcd7cHK3Qi/
	mkw==
X-Gm-Gg: ASbGncuSuOj2As7UkyjXqo12V/e6NJh6vIop3kSx8mWKGGOkEYVZ/gzSx4bhPlYLY4Q
	wIllPeYniCeK3UUR5CijoDZ+sj38um3P3O0HykGmPqK1Gk0opfduWesJ8Ztzz5RMvzSAGE4XGKo
	eeH3krsU5vIgr/Vs5a3hgArwAZejZh5MCUJ/P2wYF93+Kiqm0bVotK1tNKMZR0pDCkMn735TBAi
	C553BvqyYxZcvj3sMochNwqGINBe/1vlG1j+CaTx3rtWf9blrkhn1OdH3SI4XFcMM7GSYX3aYba
	5msPgQSIcO6TQduR3bzM9y5vuzHYtmmc5Le4GeWMuBmt3FkDdOyO3czHLNZV9mSK7o9U9H+X2Zt
	yVeiswUzU
X-Google-Smtp-Source: AGHT+IGhdOI9Bvz0KuagaMvrJcf+tjPJroTaNnNUj3aaSlDTCFqRh0Cy7R8nxYvrOpVkbo7E3XlAOA==
X-Received: by 2002:a05:6512:2391:b0:549:4f0e:8e28 with SMTP id 2adb3069b0e04-54b10dc8b11mr3662723e87.15.1743520029717;
        Tue, 01 Apr 2025 08:07:09 -0700 (PDT)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com. [209.85.167.46])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b09591c15sm1381133e87.184.2025.04.01.08.07.08
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 08:07:09 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54c090fc7adso1312448e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 08:07:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVv7ZaxfZuzsFgMpV9jzDhNKDvH1acSSAAomql+BSOicowzTZUBuB9xc07O757toNv8O7qWQg01TDja3CE=@vger.kernel.org
X-Received: by 2002:a05:6512:224f:b0:549:74a7:12de with SMTP id
 2adb3069b0e04-54b1113f382mr3140375e87.48.1743520027562; Tue, 01 Apr 2025
 08:07:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250331061838.167781-1-tejasvipin76@gmail.com>
 <CAD=FV=UbUqNf4WoWzqMe5bDQmxiT+bRG_cn0n1dBrkFRijx0Cw@mail.gmail.com>
 <jlqxx47vzlp6rmwpi3tskig4qu4bgyqd7vletxbzzn7xdpep72@42tzrjkg65lh>
 <CAD=FV=XeHeed5KhHPVVQoF1YPS1-ysmyPu-AAyHRjBLrfqa_aA@mail.gmail.com>
 <y5l6gr7gdrz6syc3kxortl4p52bpygs2cqzkgayhnbsvrjcbcw@hxhel54zw372> <mz4axwltt6zhm2hykenerz2k6hp5qb4tqa3seui2vnztsldpoo@hejaeukdu2tg>
In-Reply-To: <mz4axwltt6zhm2hykenerz2k6hp5qb4tqa3seui2vnztsldpoo@hejaeukdu2tg>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 1 Apr 2025 08:06:55 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XwczaG+FTBv_VxoR=GxNsXemCehkMc_V2=DDoXAepZoA@mail.gmail.com>
X-Gm-Features: AQ5f1JocZ9bptb3nCF0tRv42SZ1SGHwRnbocP0Js32Tf11L8NlMkhlfRqmEasTM
Message-ID: <CAD=FV=XwczaG+FTBv_VxoR=GxNsXemCehkMc_V2=DDoXAepZoA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panel: boe-bf060y8m-aj0: transition to mipi_dsi
 wrapped functions
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Tejas Vipin <tejasvipin76@gmail.com>, neil.armstrong@linaro.org, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, quic_jesszhan@quicinc.com, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	asrivats@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Mar 31, 2025 at 6:52=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> > > ...although I think you said that the DRM framework ignores errors
> > > from prepare() and still calls unprepare(). I guess this is in
> > > panel_bridge_atomic_pre_enable() where drm_panel_prepare()'s error
> > > code is ignored?
> >
>
> Hmm... Most of the drivers ignore the results of the drm_panel_prepare()
> / _unprepare() / _enable() / _disable(), but then the framework handles
> error values of the callbacks and skips calling the corresponding
> en/dis callback if the previous call has failed. Which means I was
> incorrect here.

Oh, right. LOL, that was even me adding that code in commit
d2aacaf07395 ("drm/panel: Check for already prepared/enabled in
drm_panel"). It wasn't my intention there to work around the fact that
the panel_bridge ignores the error, but it's a happy accident. I guess
that means that the warning:

dev_warn(panel->dev, "Skipping unprepare of already unprepared panel\n");

...would also happen any time a panel prepare returned an error code
that was ignored by the bridge. That seems OK-ish to me even if the
comment above the warning doesn't list that as one of the reasons the
warning might be printed. I didn't test this myself, but assuming I
got it right does anyone want to submit a patch to add this reason to
the comment? ...or, maybe even better, we could fix the panel bridge
code to not call the panel unprepare if the prepare failed...

tl;dr for Tejas in this patch is that I still think he should spin his
patch to fix it so the regulators get disabled in the error case.

-Doug
