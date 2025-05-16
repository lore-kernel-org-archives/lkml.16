Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2D33E47B;
	Fri, 16 May 2025 11:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747394423; cv=none; b=b4L82Hpt4Cqy60O9fSwPv/BGttLqjnuCpnrv+IlS0Gpv/T+SHgARHqr+DNq31I/pgH/0xUBgIzKv5UHtYaihRfdInmcAEElrzEKx4JscWIYmpRHYzzBFzZTQ/44miDh6B6lQeC17KXdK5G8C/Me/wyo3vaheht3L8xxhJwORS14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747394423; c=relaxed/simple;
	bh=vwy7hfzLZ0cBAqUBMTjbZE/Mm+UAvRQOZbt7AM6Ff30=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fX6AFsVKExPHCuDFJ4N0Yk/L5SlxRrzwiNHiIMrWiaVh0DQUHBLvSuWIjalFVUvw3fWWzINQdR9ZESm5Qy1fA6NsSNY0y+JUucZz47+OT/UFoumOcLELhcSjSL3a9d9hf0al2uynNeNmG0yGKYP/QLFY7YfIYcgp+HO5PaUQgJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=noHg/avo; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="noHg/avo"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-22e7eff58a0so21213345ad.3;
        Fri, 16 May 2025 04:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747394421; x=1747999221; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vwy7hfzLZ0cBAqUBMTjbZE/Mm+UAvRQOZbt7AM6Ff30=;
        b=noHg/avoD2ysmfJMagpt5Bf72UvRhuJr/IMpqKivXMUaeuGR3asVRQhvSeP9MqwEjy
         PZMZC2cWxBR/Gcqqm9IDmefTLg4kLdB83QDdJ1C6S13o7qVMUO5gB1IJyanS4wcIJN+9
         koMWqDwqJOnEes/ZmFk+FWPBltbRAMD42GG1bKWZYx5K4u2AqgDpy8vU1RtGcbKvcxpJ
         e/6mhyxkelRWkE6F6JTluKdL8fB4set74K0kz+wDSqkU3myoOUHtaLmKqG/1/EsBKCPf
         PdOLbeaiwt9d3kedfMRv0E87GuBh3z/dKLfO2VtoyKzlrcnm31bnqVAi3F2sRzJ5u0GH
         qEPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747394421; x=1747999221;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vwy7hfzLZ0cBAqUBMTjbZE/Mm+UAvRQOZbt7AM6Ff30=;
        b=ZMmn4hNG/sLNa0LVHm+KFol8vvYnuPPf3M93fUOZI2NPkC1+OPvazcxZDH2R2nbgmY
         LelgkuaZBAU3XCOyQb81lC1ncZYMuJ37/w4CIdxqYPBgij6pDEW1s1LtYba+sIHGhj5G
         nry+gmiAf2p1d3yn/qj5/pcJM4pkxKEZNK6GT3n/QNwc/latcsCIRxzMQDFAA8UJYb6n
         10PoESCbFygX7JdyttcB1sZtrvu19PrdDl3DQlO7xTq3FvpvWI/iOf2cC+07i4uVdJ1s
         7zm7TGNyeADUbriGKHLqaCd6TqZVlylbFaNKT4NxlTAYrXq4ISJd6e7CYCCltnzYF8AW
         Q4DQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSJS+PtWn5Yf/PiVYooNcA7QBslBxnmQxnQoPCsfZyF4z4HsTxGAo70v0DwYXa1AFxVIvgbVDPLqrgF0o=@vger.kernel.org, AJvYcCViVH4gEvkR959UXjfWIEQ32Vo/rbD/YOV5kzUWbwlrCPbOcn/gmvTq6VTcSJre5gsnpP/2ds97W2DdvBg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAjWfH7+Luc9yfUu+Zh0/E0AdAKmNmigkKX5zSyhZv0uKn0+G7
	65SyvLqBff+Nn0srGckXSyTkiNDF1Vvs+v9WCSh1mychZapNHYggGdjnHly4EW9kG2XgMRYLRoF
	JcluZv+SzpCZZBBdlVV2zLy+DJba/JbA=
X-Gm-Gg: ASbGncvMPI+YGLSHlp7X+3095ZuWwxNbYfgzTZIyTPvlxfvuvtOBphsNysgdnfQbHLf
	VxfqHBZrlulbXKYVXg72fFSMAuF1rEqpIXyO+IwCzNzuis2sF5363YYgy1UA+8ShqCrUN073W7B
	H2/rbet3XvTQ2iQ1dlsvcz3a+j2ydIsQ==
X-Google-Smtp-Source: AGHT+IF/3Di+oLsBLaPYpxcv7LfBBu85vy0Q3yZ/dHsMufRKupnaU8hUSwUIBVs/d7/PRc2cuA5Zbi/WvmJkmILfBEU=
X-Received: by 2002:a17:902:ecd2:b0:224:2384:5b40 with SMTP id
 d9443c01a7336-231de31b3dbmr32958375ad.24.1747394421207; Fri, 16 May 2025
 04:20:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250516080334.3272878-1-shengjiu.wang@nxp.com>
In-Reply-To: <20250516080334.3272878-1-shengjiu.wang@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 16 May 2025 14:22:09 +0300
X-Gm-Features: AX0GCFtrJluGbPO8r8cq7EZ0iKopTI7pXoYtTZfmc5c4e3CQG0UEAmnKOrj0Sus
Message-ID: <CAEnQRZBfxz7xkC6GSfL6OJ3g6HeFicQdicj48W=JwKYB8HyGRg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_xcvr: update platform driver name
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, 
	perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 16, 2025 at 11:06=E2=80=AFAM Shengjiu Wang <shengjiu.wang@nxp.c=
om> wrote:
>
> XCVR driver is not only used for i.MX8MP platform, so update driver name
> to make it more generic.
>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
