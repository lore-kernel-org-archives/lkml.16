Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF76A242D6E
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 18:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751395803; cv=none; b=ctKGNAVfn4hEA6Nx/vGfW8LIUZZTgBSA29PSFcBX840cMI1CYQjRfHIkQUeBsbGHKcAQODBRsQKrp5ySZy1lrlXRv/6LLiZQhKP0HCKwjr9cbcNxA1ajkzajsN2SN25Uxf7kuiJEajbwkdPOBenLpjLSzOdrlkNZ+66DxSKjEo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751395803; c=relaxed/simple;
	bh=A0SeLjv0Ad6q34+K/p/NvzP9rXjhqfj4e2EoBX9Nsec=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rNF60bj3f1kkjX6O2J5g7HW1J0P8pQmhzGrCMP+4RVUDUv97o55KGpt8GifPHavizuUZN/al482Kj14UhJhjvD9bgEnHzemVhVJatTLFU2ktZDWFoJdN2p+/871BRSWZH8N2RsRjuQiGM9DxwqfsrS5FX299EztJcWQha9rf2lM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LcWZhGU1; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LcWZhGU1"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-235ef29524fso8718675ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 11:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751395801; x=1752000601; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c18tP8nMm4WxN5l3Je6fgQ9inVG1a5KDTeXUjUHXCSo=;
        b=LcWZhGU1taauB6IVSdQiaOSith1nUCIAvgZLha9U+MDs7vGcoijS6AaoFYuj5NX3gy
         SADKoVSZFyKsfHUMKOH1nuWIWNefJOkVQTw93R7XQ69QCndc+tKKlct+53MTRL49TAu5
         Fv0smbRLSvXi/br85EWipCQv4PE06ltzrmlERYd07rlSOMVMxV2So77qtDj3BEpRt56T
         E7Np6dLtiBB4QHNlobJm4c/B9+viZ1Aq2Fz5j0hr0R5TV48QPUF9MA55kgYB4RNgRa6B
         yoeTrgZP2sDIWzXPZA+PCV+CuRVKhNLEHekebxblkw05JOwjqH488yhoZy4sy1zie10c
         Nklg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751395801; x=1752000601;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c18tP8nMm4WxN5l3Je6fgQ9inVG1a5KDTeXUjUHXCSo=;
        b=sV+gUSrvJXabTqa4TP1ww9KjZDYTfa/iTiVar8Vxp8ZZUAVmNzUT+B7L1HHaGDAhv5
         opo3mNhPyDMb1UtZ503bW4u+5+NieMGta4m1nq/4fS2EIa4mtVVdv5uiwd21bx/Axrmk
         HuQjCMw6JQMKRrY7TS9SZRqecDJkVrdwhFHfrQwZ3NYavi+PH7pj25Z9yiaj9Yl8wSdr
         63Plsb9uF2bkg3SgrsMHdRG/7BFKmvbp7c4Av5mmomtZNTnsbJVYQOc56KSAa7iTP7wl
         aloE5OeKaZ5fugdH1jTPIw8eC7vQnjzYygNItdW3hFSbPIK+e5WKar5qEFFKRbzbKaNX
         n+aw==
X-Forwarded-Encrypted: i=1; AJvYcCVgaPLy+HCCU6TrH+o5cLFBePd9vgjuK8noTR21xHQn5BrQUuoa2N1ITz1YKb8u8NhUKfUljsHDjd71i0c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo6nCJkE7WTx77IiaXWS/sSWm+oqA/HGKR/fQ/AitFRg2JDuAi
	2aFSmCI8e3FxTniyX3Yzl7rECjBqG1PuUcnpnsMIrdVUcTdmO0TbHBbxni1s/4Jt8H6DZrDY3Lj
	tVTaFwr6Gk7pAbUZJbzQFNZ5uWWa7iG0=
X-Gm-Gg: ASbGncukhV3ii2H0Ky97hZ6nBhk/zbk52JD8djW4PtqtLI97t44oGOr6Rko6+8+5zv7
	tjg+iWDmS4hrRumyCM6EmXxLq54v46Voephz2ZQpVq1IszP/Qc5PSNN1AYEpQKcoh3xcwlg93Sb
	q6W8EvA2SlUVnXIOFbEgGT1FC92JVQKwkz+pMzJpOwspHX
X-Google-Smtp-Source: AGHT+IELUYSLiXIvs+5/n36TgYU+Pz6iPW4D6o9eUn0uNN9wyJnM52eqk0EHR3VV2zEtbUR3q5cH76BCZEpC9vjZidM=
X-Received: by 2002:a17:903:189:b0:235:ca87:37d0 with SMTP id
 d9443c01a7336-23b621039bcmr27042365ad.11.1751395800830; Tue, 01 Jul 2025
 11:50:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250630202618.1537569-1-pchelkin@ispras.ru>
In-Reply-To: <20250630202618.1537569-1-pchelkin@ispras.ru>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 1 Jul 2025 14:49:48 -0400
X-Gm-Features: Ac12FXxAYEN6HICp5nfu6qjYqypkqYMmASkqv7jqJtXG5bSVzrLRAePPXKKK3kY
Message-ID: <CADnq5_PRBcOb+9To8ax4ardU9rBOAbEch7qegTxErpUGm7rW+w@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm/powerplay/hwmgr/smu_helper: fix order of mask
 and value
To: Fedor Pchelkin <pchelkin@ispras.ru>
Cc: Kenneth Feng <kenneth.feng@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Rex Zhu <Rex.Zhu@amd.com>, Jammy Zhou <Jammy.Zhou@amd.com>, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	lvc-project@linuxtesting.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied.

Alex

On Mon, Jun 30, 2025 at 4:33=E2=80=AFPM Fedor Pchelkin <pchelkin@ispras.ru>=
 wrote:
>
> There is a small typo in phm_wait_on_indirect_register().
>
> Swap mask and value arguments provided to phm_wait_on_register() so that
> they satisfy the function signature and actual usage scheme.
>
> Found by Linux Verification Center (linuxtesting.org) with Svace static
> analysis tool.
>
> Fixes: 3bace3591493 ("drm/amd/powerplay: add hardware manager sub-compone=
nt")
> Signed-off-by: Fedor Pchelkin <pchelkin@ispras.ru>
> ---
>  drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu_helper.c b/driver=
s/gpu/drm/amd/pm/powerplay/hwmgr/smu_helper.c
> index 79a566f3564a..c305ea4ec17d 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu_helper.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu_helper.c
> @@ -149,7 +149,7 @@ int phm_wait_on_indirect_register(struct pp_hwmgr *hw=
mgr,
>         }
>
>         cgs_write_register(hwmgr->device, indirect_port, index);
> -       return phm_wait_on_register(hwmgr, indirect_port + 1, mask, value=
);
> +       return phm_wait_on_register(hwmgr, indirect_port + 1, value, mask=
);
>  }
>
>  int phm_wait_for_register_unequal(struct pp_hwmgr *hwmgr,
> --
> 2.50.0
>
