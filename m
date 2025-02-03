Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7B0139CE3
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 20:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738613952; cv=none; b=DJzabGGvhPRTsaxEFYXL42J9xnqbwYFSK+iMR7LBrt2gNzGurHlUUIfo35Eq7TmxY1bveC0kTBosS7I255vOog4ZLw6zijvHx5sucn/VpddbgP8Cy1eIqdj4Y6V3tCNEPPY/Xe83LA3urQJhKKY2wVWb4vcxyzP64OK6nQQsh1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738613952; c=relaxed/simple;
	bh=eyTusJud+zCVuZKKK/fhCWrxuYCadbFvbIQYPYDNiuw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hlnMMQpxuMUdOi7cH6cfwx3iQHY299MO7XZlw3gunegGfaqtAUT5+HlIJ949KEOa18IWiz2fX3K+jxyxInIsnqwprAmwA2Ve06ibxIZvjrMFfyodl+NHJ2CrYW/y5dTb42YwZ0lNhQQqFRdj0RXGsrQhCDJn8H4t7xUa5b6gjqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eKaXDiVi; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eKaXDiVi"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-218c8ac69faso8596955ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 12:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738613950; x=1739218750; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7GfrOoO3bAcjQVPU8/Q1HunhpNAjwvu9rcpPDzh1ScE=;
        b=eKaXDiVi8Yw0kkyM8UQdg+A7RruU+yzl0L3vwpEi638JywEkOsamLvaVy+NFn+svDR
         4jYiFpB4tVuvpCGEvKbb5qCr5zbYKVp03oghv7vKHBul4WKDECwkpYrZVe5J00Me4CG1
         kAOeA04/wkrDogzi/YDNjmgJZcG2WFR/34RFJmiqUhIJD65hz40/yRRHnaoFeD2d2M46
         MG5TC6aZ3oqPqScZ1afm2iaZO4BhiJZKpC9hjcuImwWy0l4aQrakVlgWBjRspjhp4Z6m
         zdL72xNo2TsJ0ubd9PxSDrEx5aMzl26CT7ddWawL/enoFpqplxSvjDpvoAbz37q5vwOd
         4GWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738613950; x=1739218750;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7GfrOoO3bAcjQVPU8/Q1HunhpNAjwvu9rcpPDzh1ScE=;
        b=exvCWT/R64Tzdp51+u6GQMS5HkF3yEvvMBTi1iFsfnDMfuquCHGQVcEwe5/S4s/uVA
         Y2B3RCDgW2J6RFK3791b43UZiIeOKIvvQihRvzsyLKo/pJ9hiPXX8en5wEtEZyYuOxwP
         pT0ieqC0yJE7iG0/+ot2sbX7elrJ6VffYlcFZGGVql8uQCaV8ANgq/8byIdWMf+5ZWEQ
         +EEapTcNEOKRevgpCnGEqHaxYLr/RS3nddzQD39OXjFSu/zneR8osDAmasKBLr2oeOtu
         I+okz0yU+RxZFzsM0TeiQidtWmnOH5AnIgBae8vvUu8NuyDDO5AZPtPj527lJG9ZsHIc
         flgA==
X-Forwarded-Encrypted: i=1; AJvYcCX8L6jvu4NtUyqIjRoK8mKNO4cX2X+repYN8DyjNuuvDEO1s6EiQtDgSzAsigHTT8v4zYxN/vpem2xEh8w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxD9eWVYaxsG06sJVyOsMjO620epqwxE28PtH3RiEI/SyvhDrYL
	Npa6mI3Arzv29ygsgaL6/vpSQTh9dJC+EST8lzFhSQH0sBhOd0Nb5afiz95lAsbe2/6MdybU4+B
	fYhILfXYI4ibpuvP4JkuOFc7zgDg=
X-Gm-Gg: ASbGncv+dL+OkPWedJztfMsugySUPwhgKTtVl/kCks2GsKmnPhkE7IaPpmYK4kuylhc
	r6SxaJIvs6IgBk+AMXAGVdp27+uHrhkzFIiLAirB1/aWWMbacB3OEIJKEImUzakkKFy9M+C+J
X-Google-Smtp-Source: AGHT+IFY+u51Co3Qp2/PkJXnZEwd7WUwAWTcLHP8aQV2q//0eXRrEQd3/ZuG20piRJnwccBvlNVArLxbSotWJtwNHmQ=
X-Received: by 2002:a17:903:22cc:b0:216:3083:d043 with SMTP id
 d9443c01a7336-21efe6f8e32mr4486725ad.12.1738613949418; Mon, 03 Feb 2025
 12:19:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250202215856.252439-1-linux@treblig.org>
In-Reply-To: <20250202215856.252439-1-linux@treblig.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 3 Feb 2025 15:18:57 -0500
X-Gm-Features: AWEUYZkhAPx1qmtLRs097YAKTjqKoL1dor02COhhyiGymyXTrVfYUlPCpeq3SH4
Message-ID: <CADnq5_N62AzN=PGxHJPtAcUYU=GfkW=cDPAVZu4h9EjfBJ0nLQ@mail.gmail.com>
Subject: Re: [PATCH 0/7] drm/amd/display: More deadcoding
To: linux@treblig.org
Cc: patrik.r.jakobsson@gmail.com, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, alexander.deucher@amd.com, harry.wentland@amd.com, 
	sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, christian.koenig@amd.com, 
	Xinhui.Pan@amd.com, airlied@gmail.com, simona@ffwll.ch, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied.  Thanks!

Alex

On Sun, Feb 2, 2025 at 5:08=E2=80=AFPM <linux@treblig.org> wrote:
>
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
>
> Another small pile of deadcode patches.
>
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
>
>
> Dr. David Alan Gilbert (7):
>   drm/amd/display: Remove unused mpc1_is_mpcc_idle
>   drm/amd/display: Remove unused freesync functions
>   drm/amd/display: Remove unused dc_stream_get_crtc_position
>   drm/amd/display: Remove unused get_clock_requirements_for_state
>   drm/amd/display: Remove unused hubbub1_toggle_watermark_change_req
>   drm/amd/display: Remove unused get_max_support_fbc_buffersize
>   drm/amd/display: Remove unused
>     link_enc_cfg_get_link_enc_used_by_stream
>
>  drivers/gpu/drm/amd/display/dc/core/dc.c      |  39 -----
>  .../drm/amd/display/dc/core/dc_link_enc_cfg.c |  11 --
>  drivers/gpu/drm/amd/display/dc/dc.h           |   2 -
>  drivers/gpu/drm/amd/display/dc/dc_stream.h    |  12 --
>  .../amd/display/dc/dce110/dce110_compressor.c |  13 --
>  .../amd/display/dc/dce110/dce110_compressor.h |   2 -
>  .../display/dc/hubbub/dcn10/dcn10_hubbub.c    |  18 ---
>  .../display/dc/hubbub/dcn10/dcn10_hubbub.h    |   3 -
>  .../gpu/drm/amd/display/dc/inc/link_enc_cfg.h |   5 -
>  .../drm/amd/display/dc/mpc/dcn10/dcn10_mpc.c  |  16 --
>  .../drm/amd/display/dc/mpc/dcn10/dcn10_mpc.h  |   4 -
>  .../amd/display/modules/freesync/freesync.c   | 137 ------------------
>  .../amd/display/modules/inc/mod_freesync.h    |  26 ----
>  13 files changed, 288 deletions(-)
>
> --
> 2.48.1
>
