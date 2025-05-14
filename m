Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92176202F9A
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 08:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747212653; cv=none; b=ctqpX46nEWyWGb7Wd7QqaDnyedKY9kTG0UNYYmocK7PbQ8MxH8D4K0lgm+tSVYVXyJ+4oqLfWlHt8cPMQhrvmiXhYVxHk0yUqwphcJp6q+NBBFKkPBPLn87sQ0ST4Ra7LIyT78NXAPu/ed9dTeCGuO67zpoLwTA9WW6SHOG7+30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747212653; c=relaxed/simple;
	bh=tSX3jA/HXWZCcxkvdPn0B4RRhN6070u7urtspGwQs0M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OHIJmX5ikS7gUUcmVRFxBHKG07Smeok99C/JNNxNplc3SSdddkJH84uL4DiXn9ps084jW2CETrjARnKQXP9LOzv6WhizD+QtZuG3R8Uzck7jevydB2GYPK1hfW00XcCcOYd4PkbhB7DiaHW1QmD9lDFZmBtaykkHYtsBMNLJSZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=kf4U2n9Y; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="kf4U2n9Y"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-47698757053so93987991cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 01:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1747212650; x=1747817450; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tSX3jA/HXWZCcxkvdPn0B4RRhN6070u7urtspGwQs0M=;
        b=kf4U2n9Y1ExQpfzS5NuhX7Ta/Yr/x6hsB89cupFjqJXG5Joi0c0f0k+st1HHPeumMJ
         A+Swj5610n7rC2V/bTJVeJLn4ERsHqeGP0sT1gXDDNjbJ5+q3UaSKd7IsJ7uqwwydrai
         0Nd8tk3J5YvWDNM2FhswhD5eX7hsi0oyBj+es=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747212650; x=1747817450;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tSX3jA/HXWZCcxkvdPn0B4RRhN6070u7urtspGwQs0M=;
        b=jkrd+og1kiwEb23oUIYobR3bByB4YGMJsXxy8Uj05vys9vY2fuBGVLJPP7sg5OV811
         UgYm/GJV33n+TVWWnUsM+EiZJbHtRsaQUMtSQBvIlXFOKguMU3VtbAuECWGfOJSLiMRa
         PRNf/M3S4nwCRkq2zvoXysZmA7gpK/NsfOolm7rKGDgdlklEOk03y45/OCuIa2HsoGij
         +lBNkAnCNUCiOs8oQT2e0Qnjdyl1D+Mly30Z0PcTaxkwEfWxQN3JXvMsPOuEYRpXQF0Z
         nJ490llGZhfsRs8MyuxV8AqiBpP3B2l49gNcftNd/NcVrax3l84Ww+/Z8vzoOx3d63yb
         q+Wg==
X-Forwarded-Encrypted: i=1; AJvYcCXmXzkBQEyMQPk0H4WeKlDOIVEg9gDa1c0oUKOq66Z57JYpI1wbykjgGBwOws7xa8z0xAIQ8m9Z98vbMLU=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv379J8E7Y93pPCvA00w9XlgSw7miHbLFgMi743B7o16oClf5O
	K78rxorZYABYVZFAtO9Kc6gDFlfl3UM647ukvPSd02c/OkSeNVAUyHl4Y0k0Y3wXzO0v+H92Ii1
	jNLZNeyFG0IHQ8YZTkUAqfoX5tdgq2ED6DI73AA==
X-Gm-Gg: ASbGncs4woDFdfti9Jbs3BzRHSvrNg34izGvBqT0sEmZTL/11A/b/Tvj7EaNFMcSQlQ
	QCCEFp1KW0EA3WBrc/gdiFpNZCpc/yTqSriIFdRJ0rHKbAeS2Wlrekdec+r3bI0+sfnptK9/Xj/
	52r5ExVg5nSRUv+zZ+dZkYsRx49fJ8vD3yWiYJHyaQTA==
X-Google-Smtp-Source: AGHT+IGLeCzQIwc32fG1czjxbITqnFTOhdsSRGzbFubUyBG2WFIbL35MyAP26FPslXlF8Vxt+OWDfIGfCB+vatsKBm8=
X-Received: by 2002:a05:622a:2517:b0:477:ea0:1b27 with SMTP id
 d75a77b69052e-49495c911b9mr36262961cf.26.1747212650345; Wed, 14 May 2025
 01:50:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250509-fusectl-backing-files-v3-0-393761f9b683@uniontech.com>
 <CAOQ4uxjDwk6NA_UKiJuXfyY=2G33rruu3jr70pthFpBBbSgp1A@mail.gmail.com>
 <CAJfpegvEYUgEbpATpQx8NqVR33Mv-VK96C+gbTag1CEUeBqvnA@mail.gmail.com> <CAJnrk1ZxpOBENHk3Q1dJVY78RSdE+PtFR8UpYukT0dLJv3scHw@mail.gmail.com>
In-Reply-To: <CAJnrk1ZxpOBENHk3Q1dJVY78RSdE+PtFR8UpYukT0dLJv3scHw@mail.gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 14 May 2025 10:50:39 +0200
X-Gm-Features: AX0GCFthxfZY97wXLqodWfQQ_45BmPxv7EIaJAcSOrNefrHrtSaWnhjOExjHadc
Message-ID: <CAJfpegunxRn3EG3ZoQYteyZ3B6ny_DG1U65=VX25tohQuHCpVQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] fuse: Expose more information of fuse backing
 files to userspace
To: Joanne Koong <joannelkoong@gmail.com>
Cc: Amir Goldstein <amir73il@gmail.com>, chenlinxuan@uniontech.com, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bernd Schubert <bernd.schubert@fastmail.fm>
Content-Type: text/plain; charset="UTF-8"

On Tue, 13 May 2025 at 20:52, Joanne Koong <joannelkoong@gmail.com> wrote:

> For getting from conn to fuse server pid, what about adding the server
> pid to fuse's sysfs info? This use case has come up a few times in
> production where we've encountered a stuck server and have wanted to
> identify its pid. I have a patch on a branch I need to clean up and
> send out for this, but it adds a new "info" file to
> /sys/fs/fuse/connections/*/ where libfuse can write any identifying
> info to that file like the server pid or name. If the connection gets
> migrated to another process then libfuse is responsible for modifying
> that to reflect the correct info.

Fine, but then why not just write something in /var/run/fuse?

Thanks,
Miklos
