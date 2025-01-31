Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6C7153838
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 21:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738359082; cv=none; b=G4kxLgZGSxvTaBdJwz8tAGCB9GbA3OiMtHLXBSneWFkweJkPdlWGX/XIMzAmf3jpTsSFqC5y4MecJpcL9WPcbTOgtk09Ci2Akvst0a3XMjUvOKrndFZ3aP9EZ4+bxuf2DsrqJN72QoL7UYKbBnZ5YvDl6guvjlQFrAGhC8Uitqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738359082; c=relaxed/simple;
	bh=CiooTMJp/iOTrvueIOCywb9gxlzNvjuRh+Q83kvM69I=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=PThkss8f+mhGxJ5TRZbRW1VF8LrZJXE+yFwuZLSmvQo4AVkpsTfyBPhPfo3OOjx4iAGJYiV7N7daT9B1yUpJm37okdgOdTkB2C4rA/p+0pWcgKs7fGpkDAkf2rQmp0gXKMf1ItweqvWvoTjDmNKCzlbz59VkA5nh1936s1w4b/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bs9i6C/a; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bs9i6C/a"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5d3f65844deso4266403a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 13:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738359079; x=1738963879; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8sMFgyKuIAH8ly7F91V8rApj+AxzQFEz+0kCLCxW1So=;
        b=Bs9i6C/aEJuGSXZYC1FjN++THoeTsFggel4S+HqEp4DzHsp9Qbue5lRpvQPZpzjkuM
         DFqK4IpC5v9fYBAQvSO6ohAL5WkNBXJB1QCOHjTtJvkIPE7WA/Mng7I3BBkRv7rDVAtb
         sCB+vmx/rG8kyGJLRrAWwNYx3ElDPxPtUEzNlhoWy7eN0BMcrLkRo49Qa58HExSJqlkd
         qTKItmHBRT0Shd1Lp2mgIvGCdCCArSDaoMJICBznFPBmp9vzi9z+R+ShrZPxJDqxkGpW
         ogZQd++MVz5P3u5U0LM1SB1i8Wz41RRsNsPbTjvCfOoXDGrnwiW/851Wasomwf43OyGu
         ZVug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738359079; x=1738963879;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8sMFgyKuIAH8ly7F91V8rApj+AxzQFEz+0kCLCxW1So=;
        b=vdp5Fwjp2qhUWoRNSX1NrdF80iPdM9BdVoW/gE15R6+5KHG4+ImzvYgLc3Jm424Vkg
         P6ENhUfIt0cMTSfrLkPoc2JHQRCcBh8pFbNUJ5UExcxcJf2v8aMkMn2ZMiO4sewHJRUU
         Anj4nNdzuoH12gwpYtsz9YNUi2ksRWnxXMdraGeSzdX2dbW2QFVFDiR67dXfQMZXIihr
         sPIaC7V/1FX9yp438FKDFN0CjpsgUvz72iptM8UJVR82qZNPiDo32Ni1vHilF2NyOu5m
         QuCtlzMv++HWM+4SoYMN9Tjy9rg3k/10qCnyaIpBjWigXlxm36MN23ZHUxrZ6Q76Anov
         2Zmg==
X-Forwarded-Encrypted: i=1; AJvYcCUpiVxQ8zA3fy1A10f+r+Nqg2TIaxJArlmO6kdQ2YwT6ixUPXzyovxhke8H4/L+8TCtqU0gdUYJCSiIecU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjXXPtDBweIlFQ08C74h5dSVOfV1GhKq3yHKtzd+ZejA4uKWSP
	4l2Vz+g3xyzcQaAeBCu54IjqD+dND0riI2dW8323gQEfeGSl/0ZsGZqJrEGVL/SUz15r0hki+hl
	G4Nl8CoMpS9U/5O3GafltqwPI5VY=
X-Gm-Gg: ASbGncs4leALikQ1V0u57K8BkVWi2Z5Xo8jB0HKR3rg7As4Wfd6zm06jd5rTAP3kNqI
	u13HDTSCTgpLBFIw0UVRK/0xOaLXS4KvrJTxfnRzXmaievpqXTICl7dEBEMH4hj8CHYPUSwA=
X-Google-Smtp-Source: AGHT+IFCxjq7JVele5N0WAD/aWKOorY7Nl8XoPCWOwHdyUa4tKW4l5lQYN8VH9vBW8jEWSjHSdhpLpI8ipXmD1wj+v0=
X-Received: by 2002:a17:907:9452:b0:ab6:fe30:f495 with SMTP id
 a640c23a62f3a-ab6fe31018emr545918366b.35.1738359079237; Fri, 31 Jan 2025
 13:31:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 1 Feb 2025 07:31:07 +1000
X-Gm-Features: AWEUYZmar993kBa1Sp93Oc8tcUnpCbu80RjXzUnUNE47h24wGe57ZiO58684Qes
Message-ID: <CAPM=9twWB85+Oz8ZSoAej1y4Otb6JesYm7_DE0XAfEU6CJbZxQ@mail.gmail.com>
Subject: [git pull] drm fixes for 6.14-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>, Sima Vetter <sima@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

Back from travel, thanks to Sima for taking care of things, only one
MR left for me to finish the merge window, this is only AMD fixes.

Dave.

drm-next-2025-02-01:
drm fixes for 6.14-rc1

amdgpu:
- GC 12 fix
- Aldebaran fix
- DCN 3.5 fix
- Freesync fix

amdkfd:
- Per queue reset fix
- MES fix
The following changes since commit 64179a1416e1420a34226ab3beb5f84710953d16:

  Merge tag 'drm-misc-next-fixes-2025-01-24' of
https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
(2025-01-24 17:06:06 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/kernel.git tags/drm-next-2025-02-01

for you to fetch changes up to 8dcb26b493d3bab90851f93ae1c127af5cb2dbb5:

  Merge tag 'amd-drm-fixes-6.14-2025-01-29' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next (2025-01-31
09:41:25 +1000)

----------------------------------------------------------------
drm fixes for 6.14-rc1

amdgpu:
- GC 12 fix
- Aldebaran fix
- DCN 3.5 fix
- Freesync fix

amdkfd:
- Per queue reset fix
- MES fix

----------------------------------------------------------------
Dave Airlie (1):
      Merge tag 'amd-drm-fixes-6.14-2025-01-29' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next

Jay Cornwall (1):
      drm/amdkfd: Block per-queue reset when halt_if_hws_hang=1

Kenneth Feng (1):
      drm/amd/amdgpu: change the config of cgcg on gfx12

Lijo Lazar (1):
      drm/amd/pm: Mark MM activity as unsupported

Melissa Wen (1):
      drm/amd/display: restore invalid MSA timing check for freesync

Prike Liang (1):
      drm/amdkfd: only flush the validate MES contex

loanchen (1):
      drm/amd/display: Correct register address in dcn35

 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c                       | 11 -----------
 drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c        |  4 ++--
 drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c       |  7 +++++--
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c            | 12 ++++++++----
 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c |  2 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.c           |  1 -
 6 files changed, 16 insertions(+), 21 deletions(-)
