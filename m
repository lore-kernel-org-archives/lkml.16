Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6965A1C1AAA
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 17:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745861914; cv=none; b=rI5hL/hkVP7ZD/vlkkmWXR2LEmCdMt6opJA2FH7BBNuDMyBg1YfGcXZ2zq2umv+tCd2Ent9ACn/MoymhD2DO5bu0sFPQwXSAbQD2uuvq+mASuzDZ/zILuq/cAnMmwMSgyZba3hHhxlJPzHQkjuhYMM+B2jISorp6PcWO1U83TGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745861914; c=relaxed/simple;
	bh=GpKAmpJif3MFJNpqqTjAOJdznMpJykhet7jEjAtxr7k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=raRiCuTzZZO3vD9dwTcJMX/pnas+HT1yAYu+qbNIu65eDhIXNj31lC/gbW7yvuVGQWdgsdJo/l52ALZPgpUl+1a4g3i9Sfa1GmhwI5JLd+MGKNSfTtzgJfRHH7JBWJmDFyEf+47C4gPmQz30OE9vIZ3kwUD+/6ggHBmBADKs7oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KADGqJDa; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KADGqJDa"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2ff67f44fcaso409265a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 10:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745861912; x=1746466712; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XxdH2HBKv26bS3K+JOBUm6gBKxa8LnfYwhAZCtP8Xlo=;
        b=KADGqJDafZ5ANWcsMERrJDXzfItXFG1gYy9Klr/sRIX/rz1SVycgFZP9A8F+As3Xjs
         ppH0jOZyBaDiMoxakyG/ZukplP0cs080zDJFAGqUtO9fSblmlsjZvd2lcU4vvOcUl/Qs
         EUwftASHgpGeuH4UUrNkzsk/A15DiuqKRplIxUMfsmEoJ0ABA9oKDMllF7dpkh5S/RZG
         A0Mi3eLGy/iR6hBr6BH/j48JjuYpNf850FxzJr31gjjo/8bTC/qY1fVrWjVxxUZkeYov
         +Zps2TC3UmcsVbmPpdIW5jvw9x29zJxUDeltLEfXiC5a3t6IYOZkz77/LndNwYgY2niR
         2Xqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745861912; x=1746466712;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XxdH2HBKv26bS3K+JOBUm6gBKxa8LnfYwhAZCtP8Xlo=;
        b=NIAaZNoSKw6gY+SZA2MHCy/t8zTMJVqKODTSJFulMcwMRdJ6t3Sz1zMhzgpW9p1qt4
         3jzBKBH2I6T9ipePNIypEthbdd0T3fkonmt73n2msdz2ISmGlTkK62miTypgjL7lQyRZ
         G8p46KNRsjVk/BwSl1ImSRUbWoTRVdSQhYvWfcfrrjma7jNS+sQuSMZC3pNoXUCtGBcb
         TfBRg8+4IGbOvNAu5HYAOl2hcPltDO+71jUqIrlo4OI2s0nnx4nPQKbALRgcN/jyNwIQ
         qTFOx+Ay3a6KEkYdf7D0Dm/qEg8LpoEBY/4xXZ2/7LR5uHhfa1qEYO1JdeI0E5EWmZ0M
         CHlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHznlA3JzR1Gk6ftCXvN4p6hhEsWNNjyDB2P7u5j3jklCwfMgBwbdYrXUVqhuut0g3mB73sMDFkBsC7ZQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3PBElTHr4ivC+ngiFFf8iQaAMHMgTTYb3n/v5d0SpGJu06wJ/
	PUMZ+zzKUkkuQqUwIXjqX1Nqxnbaj/WwaRSZTkLdl0yLznWPy8jUfVGt0s91Xomlq33wxLzLhtu
	1k9FyXS12I604qnmoUN56swV6qy4=
X-Gm-Gg: ASbGnctj9/514pzZjKr+cabYrc+P4UWGBXugmkpZEmbzh6eKDUxWJ1qQl7zZLZpwh9U
	iRz3qgNVuVE7g8usSQQEbCOmtwGsp4nLtvr9bejP/05pXqQZCJ/2SyHlFA7sRYt+zMC/RJQqlNb
	lmcEech6DD985niNm46+dkBw==
X-Google-Smtp-Source: AGHT+IEf49D21OKZEoGq8PtCW5/VDEocs+Glnf6NxJn6VwlyTRpUK4ukZURDMWvp5+SXIElEAIYZOcpi4f5J3vvG4qI=
X-Received: by 2002:a17:90b:33c7:b0:2ff:7b41:c3cf with SMTP id
 98e67ed59e1d1-30a220c2b2fmr77817a91.4.1745861912606; Mon, 28 Apr 2025
 10:38:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250428104620.12699-1-listout@listout.xyz>
In-Reply-To: <20250428104620.12699-1-listout@listout.xyz>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 28 Apr 2025 13:38:21 -0400
X-Gm-Features: ATxdqUGI4Oe5F6VoqeDEjQ3KgdW839T6wIfAH3GnW6nH4T85eNCbUBtykYRM5qQ
Message-ID: <CADnq5_OB=HLZ+ArqhDQtafFyc2a034jqEN5JsbN36Q0fUdk3qw@mail.gmail.com>
Subject: Re: [PATCH 1/1] drm/amd: Fix malformed kerneldoc comment
To: Brahmajit Das <brahmajit.xyz@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sunil Khatri <sunil.khatri@amd.com>, 
	Mario Limonciello <mario.limonciello@amd.com>, Aurabindo Pillai <aurabindo.pillai@amd.com>, 
	Boyuan Zhang <boyuan.zhang@amd.com>, Leo Li <sunpeng.li@amd.com>, 
	Dominik Kaszewski <dominik.kaszewski@amd.com>, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the patch.  This was already fixed.

Alex

On Mon, Apr 28, 2025 at 8:53=E2=80=AFAM Brahmajit Das <brahmajit.xyz@gmail.=
com> wrote:
>
> One kerneldoc commets in amd_shared.h failed to adhere to required
> format, resulting in these doc-build warnings:
>
> ./drivers/gpu/drm/amd/include/amd_shared.h:369: warning: Incorrect use of=
 kernel-doc format:          * @DC_HDCP_LC_ENABLE_SW_FALLBACK If set, upon =
HDCP Locality Check FW
> ./drivers/gpu/drm/amd/include/amd_shared.h:369: warning: Incorrect use of=
 kernel-doc format:          * @DC_HDCP_LC_ENABLE_SW_FALLBACK If set, upon =
HDCP Locality Check FW
> ./drivers/gpu/drm/amd/include/amd_shared.h:373: warning: Enum value 'DC_H=
DCP_LC_ENABLE_SW_FALLBACK' not described in enum 'DC_DEBUG_MASK'
>
> Adding missing colon symbol and making kernel doc happy :)
>
> Signed-off-by: Brahmajit Das <listout@listout.xyz>
> ---
>  drivers/gpu/drm/amd/include/amd_shared.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/include/amd_shared.h b/drivers/gpu/drm/a=
md/include/amd_shared.h
> index 4c95b885d1d0..c8eccee9b023 100644
> --- a/drivers/gpu/drm/amd/include/amd_shared.h
> +++ b/drivers/gpu/drm/amd/include/amd_shared.h
> @@ -366,7 +366,7 @@ enum DC_DEBUG_MASK {
>         DC_HDCP_LC_FORCE_FW_ENABLE =3D 0x80000,
>
>         /**
> -        * @DC_HDCP_LC_ENABLE_SW_FALLBACK If set, upon HDCP Locality Chec=
k FW
> +        * @DC_HDCP_LC_ENABLE_SW_FALLBACK: If set, upon HDCP Locality Che=
ck FW
>          * path failure, retry using legacy SW path.
>          */
>         DC_HDCP_LC_ENABLE_SW_FALLBACK =3D 0x100000,
> --
> 2.49.0
>
