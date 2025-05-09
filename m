Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A32B238172
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 18:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746815281; cv=none; b=nqu+L0y/O8QYuPsAQgX6dgUHdI2mtAqpOEBj7ghaDtxAvmN1MKZEO8eB1SXT2hP5dBH5aM4KgyGehMgc/HqjS89t+rVIUYLu1VYOYABtME5K/OzkgTEwlHphGHFz9Ds/KftrurC+fRYNNlS4zyVWPZES+r5Wn0vlzcEQlaF2IYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746815281; c=relaxed/simple;
	bh=sGMDR4vrCsmFK5oEVJjhbe9GdCx3AVSX7y/0PLZa9DE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oKZAwvU31azB4NOaWIJh39YeXmKz4NJYxieYS+wa9maNh9iI87NAQisMw9sV3VYRtObPGV3DPwmlNLwXNnM+Krc5/Aa65I6B/vNrKr6x85cHRx9sQaNgoyjrwtjuivqVnfhjFBsXHFNE7iD51wd0O4aY0EvnDX3DRnrFU9P5Mh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=IOz3QZPn; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="IOz3QZPn"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b200178c011so1847309a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 11:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1746815280; x=1747420080; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sGMDR4vrCsmFK5oEVJjhbe9GdCx3AVSX7y/0PLZa9DE=;
        b=IOz3QZPniNAiptK8EY1Arse5iZ8jPF7hnOzQXGjLMp0tsX8qigDutLa3cPedfn36+q
         re+4wrM3KYT4m4PLiuDT5wNLnu2ev2cl++HFcrU8MeLgrZT7TqeIFNFG7UCA/hFy1fkb
         /HV/9XWdrmvakn94rUgDA+WaWxr9vTTZYWrGrZbfFdt83roF/7XoriuICcDA/3yJLsO3
         BGI1GSoYUDc9TfOOrx5Gk0iLWH1KvwOsuMj4WEKFQXIy75BHrUknqOq/iK0e6kUfJkky
         lulzcYlFs8hjD3jpGWXMKLvY9oVfbvZyqZEdc2OKvcVfQqjLlFy08MDjZBkCDFl/4/8x
         01VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746815280; x=1747420080;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sGMDR4vrCsmFK5oEVJjhbe9GdCx3AVSX7y/0PLZa9DE=;
        b=wo1dZXLcT8Nbab36U/G/91k2+mAYmx3b4AhxL+0MkxJCSa4U/B8FPwXw4H8tLuYkG7
         cJ01cS5PFssDyNBkhQyg2fCK00a9JMymF1qBHx5aVVpVtVihBGStR4irSN1qmETkrIMy
         domm6Y92z3DaEQeTa9jCiqay3BD3mPmeE9stXCZhOgksv73kHl/cgaviqJi4cjlNZLVV
         3RYn4/B6q9ndPONK39QVppnWVxqolRh96a43u7dsAHqOo2cb9pQg2F7mkML7RY1tsTYR
         6XzZ2+URNpJntEUwalYM1wjS2FYMrL6Z4uiuBmcQCu0skCJ1CypROlObRpMz5xGgBOzH
         +Fxg==
X-Forwarded-Encrypted: i=1; AJvYcCX4CP5zB2e7qV8m+/IecJ5a8twH2cvqn13wMSGx+3oc/u3W8PhyRmzaa8roJGSduO1rhAL/AIhjRbZu18c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh8QZCAyv/9ban3d7IZYddotSxF7FULH4Rx+WRuNKOxkEsrut1
	7FVKDb2+ZWm2KtBjh3hiTFcHy1NJ1JdcGFQAlFED6k/3Sk5oEDNMWzt9HHh10pUu1YA2vhpxJPs
	BuYhYc/Eeb5C634kvkvhzB43UWbo=
X-Gm-Gg: ASbGncv1RcL86Ha/GKpq3CEvQcFY1LBko1qJhLhluf8mcs8yIVLfFqDuvJOgT1nLRJd
	Z+whHLiIRISS8OBd9a92B9dsT/aWJSCydMXLdUUDhuLizHyBa+aSXjrbHIHmz5jm6YpkkNMd12P
	CtW73lN1TokJB5uOg8EZABNK/xuaA0LbikD9fvLSXumKkaJUyQU4fbq8qqnCO7BtuTTg==
X-Google-Smtp-Source: AGHT+IHXDGWP+YtZpWiwJiGwLYqFvxGO5dbb7SWr+ooxT2b9DImqaiGMOG5CHnVu37yhFV5sw1lsNGEQqFB08eoyEkU=
X-Received: by 2002:a17:902:d48c:b0:220:d909:1734 with SMTP id
 d9443c01a7336-22fc8b32ce8mr71176355ad.14.1746815279648; Fri, 09 May 2025
 11:27:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250505184338.678540-1-richard120310@gmail.com> <6d2f35ee-1b33-40b6-b164-ab4480110e49@linaro.org>
In-Reply-To: <6d2f35ee-1b33-40b6-b164-ab4480110e49@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 9 May 2025 20:27:47 +0200
X-Gm-Features: AX0GCFux03CvY5ldQo8MgJxENVqxGp77YENyE8ZwpmGhXEQFNatCnqiqkcdNym4
Message-ID: <CAFBinCDmHhF7=-dutXT6RE9hVzfN3akLicGkQKw=Arm8bq2NKQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/meson: Use 1000ULL when operating with mode->clock
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: I Hsin Cheng <richard120310@gmail.com>, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
	khilman@baylibre.com, jbrunet@baylibre.com, christophe.jaillet@wanadoo.fr, 
	skhan@linuxfoundation.org, dri-devel@lists.freedesktop.org, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 9, 2025 at 5:35=E2=80=AFPM <neil.armstrong@linaro.org> wrote:
>
> On 05/05/2025 20:43, I Hsin Cheng wrote:
> > Coverity scan reported the usage of "mode->clock * 1000" may lead to
> > integer overflow. Use "1000ULL" instead of "1000"
> > when utilizing it to avoid potential integer overflow issue.
> >
> > Link: https://scan5.scan.coverity.com/#/project-view/10074/10063?select=
edIssue=3D1646759
> > Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
>
> Could you add a Fixes tag ?
Fixes: 1017560164b6 ("drm/meson: use unsigned long long / Hz for
frequency types")

Neil, can you add this while applying or do we need a v3?


Best regards,
Martin
