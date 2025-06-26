Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1BB295DB2;
	Thu, 26 Jun 2025 08:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750928187; cv=none; b=Mqedxc1SRKhs2MlAwcRMxF3FD4nne9LUhW2CdRAqER7vEKGrJ10L5E0xzm5r3hvg+VESwVzjV37qN9exAuYJMzta4foHJeM7tNC+qLNJcToNx/O6gYYg9+DC1p8hiZaqLFXLQBkkisnAuXeRcxcKP1S9PUKYba2OHmGWorqsh/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750928187; c=relaxed/simple;
	bh=kKq2tmEw8Z+I4+DkPTVtyuGbD/NPo/vSE2bc1oGU0v4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LwzIAYdj640ESecPjbTRG/RdNAGXV1qgPgcVSHMotuY4vJXEqhgx5Kn/VYUSjox2PbFtxs02tZvkrHiI/GqIct6S93coG5gQjSuLVjDggyVsrSw3BxSPIeHRyHD5XhEKx5KzuUjG66R/ogV9FGqNt6Qn1fLIiandBtrvK56IkUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FbeBuza2; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FbeBuza2"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-234fcadde3eso11788295ad.0;
        Thu, 26 Jun 2025 01:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750928185; x=1751532985; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kKq2tmEw8Z+I4+DkPTVtyuGbD/NPo/vSE2bc1oGU0v4=;
        b=FbeBuza2DP9Y3YvcZhACmmJ90gkMacnJXh8dUfl6ae/uMI/ntJWTq/yj4kZKz5h4zE
         4gg3AsxoivRaTi64gKIv4XsyzPuE31a+o8+jXxmG1abyQ0v4i2jk1BwlMIlBvfFTp1IP
         q6hXargx+FwbNXfN66Iik38w51z5zI0JV18yTtxWn487cs2p/Ga9TCfGUllTtFSs9Vhd
         5+xWpXdsbfb3imFiTAboueI2pKkA5FO5pH7Ts3Dl8E2NJae5wTK5mv4TZeQVx8DHTsuW
         lTh/VzzV9kDJ2wBKw/pVV8KdIYylOhz80GMaR/1R0eYgK5IzjvKo0ndFy3l4Pyv4v3OO
         txrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750928185; x=1751532985;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kKq2tmEw8Z+I4+DkPTVtyuGbD/NPo/vSE2bc1oGU0v4=;
        b=qRofxzVpvkUjg2GGn7BDhW5u15hJAvFCLzKy4J2yVCq4rliP4ihZ8a2Fy5vAO8L5Lz
         GZnOTEpkROBAh5YT90ne1jtv2zTBJd6lka/Y9zNCImf1D+eg5w9kTykVnEDT0GS4J80f
         rSdMKxetGLKvhDkSzyHqJ+TblQ2JBVbT8X0Yk3HGkxY7Sk1e37ZrTdlNRAbQcmLXahzv
         f74TqBn20tAkZPKGI9XcVe3C2b94u9PVmZpUKiK9fgFIOhpsWr1YCqV66QoOmNcvdVkp
         0AHzWIxWZ0l5ykjqpru6bRbfi8mniPOksS99N1v3wE9UQa52NMVq3NrHk449I3pnSBIX
         fAtg==
X-Forwarded-Encrypted: i=1; AJvYcCU09g1xmCMbQfDVqT7Pi4zt9YiGRLGXqjXIc1sk3DCdb+GXtge7bGfKPxvpWkD9uURKKUHYqvFj2lUJ4zI=@vger.kernel.org, AJvYcCXsZK1fs2C0MEgYbb1mlaEoS/wrZZZshCy3YV3OJ2YTJAYAwD1h7tT92uECcNaMREA28/VAZq8IXLT/zsc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyD99PzrB0IPXAe9lZsJKOOK9H8Ll60YzUP8dfV98F5tF0OI7Zl
	2IHANfIO4CwxsT3GVxzH/xUzGs11bI80Hui3WllyaapWigozSby7/ph1dGZOFdxdKzrtzXxS00C
	f13MJA1zMavUXvP8gevKhLNZ4F3FGymQIBw==
X-Gm-Gg: ASbGncuoGJnh5vaOQMQjRyXd9NutvFa/Ftvi7hj5gkpNNka2oYV6kmjWMxxZVArJtEg
	QQSVrpH7CHt4v1Z3mgkLttXisp8AESPtBzN7wadaAXFJs2hiYNg34TmzBEZ3PDZcyRuNrlgUVg0
	ub6f0OH6hlfLBUEWMVL8HqpkpOkbf2re6xhRg9enH1ESbDZEfAp7xmOY9xThe4/T1traiRbJTsf
	eY6Ag==
X-Google-Smtp-Source: AGHT+IE2DrC5grwumkOHXtYkpMUb7BU6kwWjuzYjVuHSy0tZ0sO1LU9jFpnSRoX5x0S/VZtcmZJfjTLwHaopoc46CX8=
X-Received: by 2002:a17:903:2407:b0:234:f580:a15 with SMTP id
 d9443c01a7336-23823fd0962mr97131565ad.14.1750928185135; Thu, 26 Jun 2025
 01:56:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250625020504.2728161-1-shengjiu.wang@nxp.com>
In-Reply-To: <20250625020504.2728161-1-shengjiu.wang@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 26 Jun 2025 11:56:10 +0300
X-Gm-Features: Ac12FXzvq83DcpP5mt4TK7XmROn_z1FuFMfxOK7fO0D14eB9FvX3yh2CJWin8Vo
Message-ID: <CAEnQRZDDrt+zP=+Echs_Df_7dcugHrJ4DW7SF_aDGiDSnMtVbg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_asrc: use internal measured ratio for non-ideal
 ratio mode
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, 
	perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 25, 2025 at 5:07=E2=80=AFAM Shengjiu Wang <shengjiu.wang@nxp.co=
m> wrote:
>
> When USRC=3D0, there is underrun issue for the non-ideal ratio mode;
> according to the reference mannual, the internal measured ratio can be
> used with USRC=3D1 and IDRC=3D0.
>
> Fixes: d0250cf4f2ab ("ASoC: fsl_asrc: Add an option to select internal ra=
tio mode")
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
