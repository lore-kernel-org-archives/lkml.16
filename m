Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B5F1E633C
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 06:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745475983; cv=none; b=lLgguFbQklk6OoKZG7fmy01EMtV+wJGgyjlmc+M0q8PFq/EoZCZunpie9KfQXEoMrqOuXITm/Aa1LGwcjbq3rqUES8LoH5oJdtIKXY8Rk2+zJbfT+IETToBIdQPpEhthrBwipcNK7AXVojary8aTMUMprSUC6iQHFNADPMo8/6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745475983; c=relaxed/simple;
	bh=MRobKELrLTaJdm/sldA80vo1tYXY+QYJFBFLOQIyr+s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mGWKiycwdK92uSXcT+Jy5HxOhA4ShzGKdy72tqwtOT+bhxeqLYPpzsb+lMmnqMyceCJG4LsLVih+qaBf0Tl73cXNwrdWNY834AicB/rkI+f/71aqcP2YZngVhdYEof4CYdQsjz6UM/DUwKxPoCOREZ99C1NXggzC4baKkEsFLqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hDuWumMU; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hDuWumMU"
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-527a2b89a11so301286e0c.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 23:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745475979; x=1746080779; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LMv4c1/Q9VX8Vvz5zwaSAHnAfwzaBXlvUpbLZFKDOcQ=;
        b=hDuWumMU7lsrvoRewW0rAVz8m0Dsz5/JfYnBE5Oou4ZhOiVt9U7fOhOVuAxqMBrFwQ
         VD6fo6CU7x74fMFe92jVKlG+jgYDmHHBRXt/Ht8W2y6uplukIRBGgiQPRzIDKObPHSWX
         H0L1jHCAX4ZpfURarRdPms+FhNGMHnLf/0w0X/QZsXxHhTfU3da4+/cfVj8vKA4JwmDN
         /2GDGAhI9JuxS17FaOB4KD4EUPy4/KOkhxZmkRCmQiLa1516CRcUI2+6AfV/+Ka0wnL+
         RcxQ4v2v98L9rdaO9DZkInZaUK67cTVlw/YSsiDtPcp7cQZdWe8EWY3d/sDiMnQ+8Mt6
         Wg1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745475979; x=1746080779;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LMv4c1/Q9VX8Vvz5zwaSAHnAfwzaBXlvUpbLZFKDOcQ=;
        b=OFKlIBzffbVCuBGN3TuZHgkpk+EXF+kKEf/SB6kdVce1t6stSaq6PNK5C2Nc6jhVfm
         hOulTjSSTYLLckDHrQdSukKwLIrU7u1zdbcS2HqCoOhFmhf9iS99DHoyVtaWulJIABTG
         +IDmwBWF6Es9kesANPz0EohtSk8EZ8yMSKb6arxOxMFmECc3tSimU6qzFW8NW6sDtLYG
         heNPsPwVMGiP7c8NxdhbxBTwPZr/hhwfsd4+VPU+sE8LKWznLyxdDeuvsLzlVUlTnZOL
         I22Lp6uxNWyraVj+set3JeR+YDsM3jQ1qRis9Ayb5SzSLZhe3M0x1jbmMVqZwpcx0iLy
         /SIg==
X-Forwarded-Encrypted: i=1; AJvYcCXuBfVJSOodJC/CU+d/ivCfdt7zaqJ/bMNNjBKX/CZInp+/Eb/NCVGwUDOX4irtY4HNvmHJG4NhXD4eTzM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYP+KM2W2QShAUFYu24QyjLFSdT1wJ75VJoLFr76jAs7Foq/gZ
	ARxpFoMyGDf91F4ekdbQm342foRxvOLe0UY4lJVSbYiEBvLcVtEk/IuKah+5T3P0FcvxQYGoTLX
	dyaE+m9FH4+GZzSN680eLrdkoPMY=
X-Gm-Gg: ASbGncsLf9y7KJPQKYkMHZh5xXVKKQGGsQ5WiMYIH5kqAH6jL+6ZKAS46w5qpx27TGR
	3HVafKz8GeH7y9MKGdMLdtRxOApZG3SYUEcL5B6/7tuQNtU+Qb2VyXTB2mrcKOMCWItrX+V/24E
	akq5dZlo8tiSdyNfV8tV0jwxM=
X-Google-Smtp-Source: AGHT+IFwlcmc9LSA/lKPl8K/Zk+Q6oHIusATENRHLiSOclNzazuyKq4pAE5MXmjhYb4KSZNiWmw2XfSs26Ye/7rvltE=
X-Received: by 2002:a05:6102:5249:b0:4bb:9b46:3f87 with SMTP id
 ada2fe7eead31-4d38d51db10mr1047165137.6.1745475978891; Wed, 23 Apr 2025
 23:26:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250421085907.24972-1-jagathjog1996@gmail.com> <a6c2baa7-521f-4c9f-b6f8-ff18e35dd941@igalia.com>
In-Reply-To: <a6c2baa7-521f-4c9f-b6f8-ff18e35dd941@igalia.com>
From: Jagath Jog J <jagathjog1996@gmail.com>
Date: Thu, 24 Apr 2025 11:56:07 +0530
X-Gm-Features: ATxdqUFk-Lgc7k7cHFmyxZCIPXCwPjxJlmDIoxYJDLFDYfVAvkL6VXrWucDgk6E
Message-ID: <CAM+2EuLPp8wNn8o8uqvryAVojg5wr3ZCjpSLEFoXKv-cE_QHWg@mail.gmail.com>
Subject: Re: [RFC 0/1] drm/mipi-dbi: Use drm_device for debugfs, drop drm_minor
To: =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>
Cc: mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ma=C3=ADra,

On Wed, Apr 23, 2025 at 4:22=E2=80=AFPM Ma=C3=ADra Canal <mcanal@igalia.com=
> wrote:
>
> Hi Jagath,
>
> On 21/04/25 05:59, Jagath Jog J wrote:
> > This patch updates the MIPI DBI driver to use drm_device.debugfs_root
> > instead of drm_minor for creating debugfs files. The debugfs setup is n=
ow
> > done earlier in probe(), before drm_dev_register(), and the drivers can
> > avoid using the .debugfs_init callback.
> >
> > This is an initial version, and only a few drivers are updated for now.
> >
> > I noticed that some newer drivers or patches still use
> > drm_debugfs_create_files(), which relies on drm_minor. I was wondering =
if
> > there is a specific reason for this, or if there's a plan to switch to
> > drm_debugfs_add_files? I can send patches to update more drivers if
> > that helps.
>
> Yes, there was a plan to switch to drm_debugfs_add_files(), as it
> centers the debugfs files management on the drm_device instead of
> drm_minor.
>
> But, in the end, we concluded that we needed a few more changes in the
> infrastructure to make things more generic. Here are some discussions
> [1][2] and this was my plan to make things more generic [3], which
> needed some improvements.
>
> It would be create if you help us to cleanup debugfs and feel free to
> use my patches as a base for it.
>
> [1]
> https://lore.kernel.org/dri-devel/20230209081838.45273-1-christian.koenig=
@amd.com/
> [2] https://lore.kernel.org/dri-devel/87eds0gm9b.fsf@intel.com/
> [3]
> https://lore.kernel.org/dri-devel/20230131195825.677487-1-mcanal@igalia.c=
om/

Thanks for sharing the links. I had missed these discussions.
I will go through them and get back soon. Since these touch core DRM infra,
I will study the changes more closely before proceeding.
Thanks for sharing your patches as a base, that should help a lot.


Regards
Jagath

>
> Best Regards,
> - Ma=C3=ADra
>
> >
> > This patch helps move toward the debugfs cleanup task listed here:
> > https://docs.kernel.org/gpu/todo.html#clean-up-the-debugfs-support
> >
> > Looking forward to your feedback.
> >
> > Jagath Jog J (1):
> >    drm/mipi-dbi: Use drm_device for debugfs, drop drm_minor and
> >      .debugfs_init
> >
> >   drivers/gpu/drm/drm_mipi_dbi.c        | 8 ++++----
> >   drivers/gpu/drm/tiny/ili9163.c        | 3 ++-
> >   drivers/gpu/drm/tiny/panel-mipi-dbi.c | 3 ++-
> >   include/drm/drm_mipi_dbi.h            | 4 ++--
> >   4 files changed, 10 insertions(+), 8 deletions(-)
> >
>
