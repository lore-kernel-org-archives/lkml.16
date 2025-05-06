Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8DEE2741CF
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 05:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746510042; cv=none; b=Ggycu29r5v8Cw7yeHH2v32gxf47M0iEX3dPey7Sz0kV6P2+48VLQrdNmPDEQ+RrRDbLuA8SGBHGR9Ykle6A7KCb7y2AXzBkwhSiQTlt1qrTs8wt1HKGNKC9jcRBxfc6aZCMM93XVvZVPtIA2dSA5fWs+U1vAJEdx14bcssFav0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746510042; c=relaxed/simple;
	bh=FBXKSLJj7UUfdC38mgyAQwdq5cvKODFsNSOaU/O1LPA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ft8UXB/TPTRdiHKWVn3e4ZqUc6J2+Ib2GM472ffEkgSljvd843mT7mBhrTDO89lnTGp2btWlQZOd3IOWr99UTUguz39K15mxrUFYFEuWFMPKXFccodyV49INviY5fpEti0rau8MpAlYVqwrL8ZlPahkq4h/t1VRBWSz+OmWrEEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=b/jz4vZF; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="b/jz4vZF"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-30549dacd53so4494665a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 22:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1746510040; x=1747114840; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FBXKSLJj7UUfdC38mgyAQwdq5cvKODFsNSOaU/O1LPA=;
        b=b/jz4vZFwQLJ9j8/RCmRnaD5wvim56fVL5ZiVEUgYpa95hRbdPpw8EJmYsZOq7zZAW
         7c6qZKmC/1pWYLxvmxrc39BO/k1iv/kfsTs6WicVKQ2lihW+L4PTRc5wsYMlHsjcyNMu
         C+/ZAoBF9s0yrr/YL3ZJ5mL0uz98U+R6T8Qf0HavsFmEwxdG8TwqQW4J6L3uq/NlkRIK
         maa/tZsi1ZnDOFKruEYUE/Nc7SlVgMhB1MSNh0xh4Cmw7NR9vJye61mN5pjh182/7k1U
         tOUexP8l3aw5ZWjgkVaplnMrnuadJ5GimvN6Xu5rY8gVhW3Ul3Axt2O6VRPoHxYG8ULA
         Q0dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746510040; x=1747114840;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FBXKSLJj7UUfdC38mgyAQwdq5cvKODFsNSOaU/O1LPA=;
        b=hMx8CW3fCO17z4eG27Qq0LOkr14CKE5XzJgvxDVe43FBJ5SXZupWGShKx7b5P4Ufqb
         buJ0tZyh06E9F8iROkKCXGQLufhL4s0fwYABwZ8p0r9ogb1PtVd8OP1OECvTYohxnumJ
         fnJlDVeJvGgTlVwZufB7M1WxqsGkghkRfs4RMHFyhNra/dOM+1ilnlvZkXBnDjcalTpp
         kb7V+zQkGgYEE9Ye7bMhfzYzKAiZPRfW04zy5Lvcrlbkknu7oDf2CakTGjUc2FLTRggP
         1ZyWt1km8BhXQQBwrkbDXG9belkakUixWiPiL1YFJ43yiqIv+0gDaCRX52SpTBodnGgn
         OaQQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/W+rwozq2M/irUbWBTY7i18rKMxJ+EXbOCX4JsouszmjNm3jmXgO1Tx2SFnFfjIanySABVFYaIphBOfc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyD/CUmp45Tv8NJtJJww489pr70EjIbqQzpHdAjM/euYXtoBn4T
	qRQxpsNqNsr7btDD/9oOsmvNL3RRDM6Kfy7eaFrPtyS8T6wZYqUJVhQ0nkDy78+92QUC5U62XPj
	CsCMxH3au4M9KMfE2gsQ7fH43KCo=
X-Gm-Gg: ASbGnctJqa5wSMd5c58ziS0OkQ+ObmpOaMraPilvOvx1uPhG9PdDzOnGtRgSUvZ23dr
	QXAlDvRSbsZV4zsxCH5UC/mhp2EX+9DDeObqFOZQ5NGtp/lxNd2HTn6S2JWvgZ+7j8hgvUrmF0w
	3zTHlAbApnIhIxOZtrLu7GRTdsdNedHqG6lbc5sya0QFoSkDo=
X-Google-Smtp-Source: AGHT+IGH2VPUNqhKP0n7asYw5iLX2WnGWqBav+nif7/SVHvaSVRrallgXVrGMUXr17M5pJMS8YFYExxZQjpe5eZ+A3c=
X-Received: by 2002:a17:90b:380f:b0:2ff:556f:bf9 with SMTP id
 98e67ed59e1d1-30a7bad3792mr2973119a91.4.1746510039781; Mon, 05 May 2025
 22:40:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250505184338.678540-1-richard120310@gmail.com>
In-Reply-To: <20250505184338.678540-1-richard120310@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 6 May 2025 07:40:28 +0200
X-Gm-Features: ATxdqUEfi7YvCZqVRTEcgT4RIKU17ch-N4bMmEbxaRpKJa39QnO_szEOKK7kln8
Message-ID: <CAFBinCD2wHRfP+1i+pUwG0FVNr0t6uHPxH5uetbJN=RcQC_A8Q@mail.gmail.com>
Subject: Re: [PATCH v2] drm/meson: Use 1000ULL when operating with mode->clock
To: I Hsin Cheng <richard120310@gmail.com>
Cc: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
	khilman@baylibre.com, jbrunet@baylibre.com, christophe.jaillet@wanadoo.fr, 
	skhan@linuxfoundation.org, dri-devel@lists.freedesktop.org, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 5, 2025 at 8:43=E2=80=AFPM I Hsin Cheng <richard120310@gmail.co=
m> wrote:
>
> Coverity scan reported the usage of "mode->clock * 1000" may lead to
> integer overflow. Use "1000ULL" instead of "1000"
> when utilizing it to avoid potential integer overflow issue.
>
> Link: https://scan5.scan.coverity.com/#/project-view/10074/10063?selected=
Issue=3D1646759
> Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>


Thank you and best regards,
Martin
