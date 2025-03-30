Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D9D288D2
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 15:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743350258; cv=none; b=sk9bHVHxBwmIKDnoPlKFABBcyRKubDsmahKNCdx59M+k+DgCMBinR2Txzfcl3KL99XdZetn4g0RO5dPdbajAGF6RwnpckEAxbHSwQcGXa+VoeRcEUL9u7Em4kHUjCW0+RqiZz1xcoZnQOKrC7PUKAgyLhX+b3iVjHI79FO8Wa4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743350258; c=relaxed/simple;
	bh=mzR43zxb6NjxOFs7Go+WlhmJwzD4twZ04Ri3ThXZFIs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=tEFrCxp15G8EvkufCTciw7mFaCG1H5edHwhLmFxoYgDF/zIKoti9xP2VDraQuujTyNYXtAk30bp4ZTRlyeSy9ioBQg1Iw0enMW4E7NSWYPoqteFWKS0K8xffD0DpTQNsHx4rJ/XFYBYPJoZ5Cxh1/lpKCAsbcfaAaSiT1YTi8Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gb2DAmJC; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gb2DAmJC"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6ff27ad48beso34056027b3.0
        for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 08:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743350256; x=1743955056; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mzR43zxb6NjxOFs7Go+WlhmJwzD4twZ04Ri3ThXZFIs=;
        b=gb2DAmJCEpUf7GD5qKlSj0Z0ucR0+a4E/bVZUS4BHlXzKcPZv8d+uNHk1ndoFTmVWy
         s8EQg8h7881ZB2Dbs6Zxl4hxSYKKdQqGg8x53I+jpbLzOSeiaT9gesUAGO+oHSTpK9pu
         LN3ilzTniBRonGWFZPymkXnoq1VA2LHL4jW0uNYbjdqFJJxMOTu54kfYRb6o3J3VAp1s
         6nhcCS+PF5LNw1uHQEqhUu+kqb31DRCO6F+jPscXvI/zf3UTyzpgyt0eNQe0rUojkL+c
         Z7NZIYhuLGEHP3AEPLlcvZimuz7xu4CO7sr78/P5LyEdjGbInj8kfAE1LCJJWO8oIQ3z
         /r+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743350256; x=1743955056;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mzR43zxb6NjxOFs7Go+WlhmJwzD4twZ04Ri3ThXZFIs=;
        b=X2jtryydQb9O9IHUriT+VVH1uomnv8rMbyvUh/EQp13U50Djvw3EZcYaVAfEOTqSG5
         d4EfLTQYUPYgxCpxWa1dw0o8mOB6oAbUCknXzEa/C59gvJ0rVSKgQufslRCOVucL+tQ+
         3jpRdJmfGya9jfiYVEc83tJBCk0ho5FDfuPyyykn7xal+p17RwtSr+1p5zJvlpo82r0K
         I8ol/WMWhDeAKo+QZZaMUMY+altv0kyiyuZdwTz1ainXPI+v9nofxspFlZLsIbLRDdh4
         yAkzgAhJJ2HSyzyPg2owvLRmRFCv3F0/UMZ5snGcwy/K+RZO4OqU9v/sZRDuaYOgvRj8
         pmXw==
X-Forwarded-Encrypted: i=1; AJvYcCV3ddOL8gihHfS864VIcg03s2bjbVLbEcjc0fTmW3idfQJtnpCNQCZIo+CJZdSq5FKTIBj4JUeClESUdfk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwtfF43IR/Iq52KrHXwi63s6tMG4Dd/0CBMKqHmFhyGHK6wGZG
	3E3XN9xC9HiZM/3/D139y9UKhDg5h6RCHSjTe0/7ZtPsHs8Lu4ER+jsE1NFX4HBO2GguvjS4vgl
	U57dopbwJSImpaJUnLfMsCxfZClSsEVHm
X-Gm-Gg: ASbGncuumcHQeEqJBrZyEUiOCaAa8luw0h7IA67+nvvXg+NordEbm97FIU7jVBgpY2r
	rWVXW5SiYyxcItKBEV4pb+na9CzVYr627OEEg6D4tkQ+q9QsSRjbtI3VyXtSQWrNUGndwtUpblx
	W8IhxGQAb2GskY1tyWeKYqwlmsAVTubS4KFwxwixA35qNKHXfD4d0wZxK/gQ==
X-Google-Smtp-Source: AGHT+IHNGW/KpfzMAlBXwefGE/j3fXIjH0+5OMThAC27I8OvFTrt7XTy3sWzrCHtMa+yyxEypTP0jvy3doTOqS7/1xw=
X-Received: by 2002:a05:690c:f89:b0:6fb:b7b7:f1e5 with SMTP id
 00721157ae682-702570d1318mr89095287b3.14.1743350255656; Sun, 30 Mar 2025
 08:57:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z-ljeKZd7vNoQZJZ@pampelmuse> <CANL0fFSUCiedt_V91bmEdDYnqo_DgkptgmYMUAWZPePM2sWzvg@mail.gmail.com>
In-Reply-To: <CANL0fFSUCiedt_V91bmEdDYnqo_DgkptgmYMUAWZPePM2sWzvg@mail.gmail.com>
From: Gonsolo <gonsolo@gmail.com>
Date: Sun, 30 Mar 2025 17:57:25 +0200
X-Gm-Features: AQ5f1Joy6X8BzXlGuDAhZrd8PwEk7sq1bPQcQ3Gc_d3QydZypJ3fRc-d9iMtgao
Message-ID: <CANL0fFSZWVKELUC2xaXHXcWn2tLNSUE-kbUR6WovuiJSuJG=8Q@mail.gmail.com>
Subject: Re: Screen corruption with second monitor
To: lyude@redhat.com, dakr@kernel.org, airlied@gmail.com, simona@ffwll.ch, 
	dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Update:
Sleeping with two working monitors also corrupts the second monitor.

Am So., 30. M=C3=A4rz 2025 um 17:54 Uhr schrieb Gonsolo <gonsolo@gmail.com>=
:
>
> Hi!
>
> Second try without attachment.
> Youtube link of screen: https://youtu.be/zVbuzxECinI
>
> Am So., 30. M=C3=A4rz 2025 um 17:30 Uhr schrieb Gon Solo <gonsolo@gmail.c=
om>:
> >
> > Hi!
> >
> > I bought a Displayport-to-HDMI cable to connect a second monitor to my
> > NVIDIA 3060 12GB with three Displayport and one HDMI outputs.
> > The first monitor is connected via the only HDMI output.
> > The (second) monitor via on DP-HDMI flickers and has vertical stripes (=
see the
> > attached video). I'm running the latest Arch with Nouveau and NVK.
> > The first monitor is attached via
> > Kernel 6.13.8-arch1-1
> > Mesa 25.0.2
> >
> > I think it's the driver's fault because
> > a) console works, flickering starts with the graphical console,
> > b) on Windows it works,
> > c) with NVIDIA (nvidia-open, nvidia-utils) drivers it works,
> > d) booting with just the second monitor (Displayport-HDMI) works, and
> > e) funny enough, booting with just the second monitor, and plugging in =
the first one
> > later also works.
> >
> > So my guess would be, there's something not working with Nouveau's hand=
ling of
> > the second screen.
> >
> > I'm happy to provide more details on request.
> >
> > Cheers,
> > Andreas
>
> --
> Andreas



--=20
g
