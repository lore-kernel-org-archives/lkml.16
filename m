Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4712D63F1
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 13:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751636313; cv=none; b=OQ0jMDUBNxjRgMGh/2XK6jQcrlfqbZlFCHAiMVxtroMCGC3j3ScRgbSDVG7ogJ+cjhMNQvNYv0SUIjAd1Y9dmtUMj6Z4dzDErGOTq0idBpBcvPlPhFitpwlDn4aZF4LJyMT9vcpdFg3i8ggFFEMWeIcwEkyMFfxDlRJJ3PSjBgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751636313; c=relaxed/simple;
	bh=nSZJy1QEzdNWjHnuZ976rnZEqL5z5xj2uI3EMFuN/9E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C9AGLISB/g17klXZ5MfBP5bCG0io1iDX+kv/B6veqGngGqg3JWCP34z0BcrRKUpMFQyTdT7pckvRGzws6+YsVogK5B5hwvZh0m13GDlFO3jXkfcPxrVXkTFMR2w0yyqbahXdImifwk66etx9qBDY/svQBmtAvB0Pw/X60OSLA/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ekZF0MHc; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ekZF0MHc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751636310;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f0LwhhSKAS9rq9688GXK8zhFORyfbElYWA+ly5rGBPU=;
	b=ekZF0MHcA9o0qS9yBGsvMSsrPXtIIfKpdKHvhBoBMEZcMQGyo/7zg/t2YtCHnR/LMi0MOk
	FUynKA/HFyNw8pTS+fWldxE/Yut7LBt9DKR/Smm2UBjlMZ/OlFtnrN1eiwXgK6VNUbyImd
	LWXJFVQpimYsTTYsz5uqItlXsjcjXFU=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-150-YkrSuDgTN-O6nWI5uFyXLw-1; Fri, 04 Jul 2025 09:38:29 -0400
X-MC-Unique: YkrSuDgTN-O6nWI5uFyXLw-1
X-Mimecast-MFC-AGG-ID: YkrSuDgTN-O6nWI5uFyXLw_1751636308
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-32b49f95c5eso3786271fa.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 06:38:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751636308; x=1752241108;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f0LwhhSKAS9rq9688GXK8zhFORyfbElYWA+ly5rGBPU=;
        b=nDn4sr4XDtbjzgoj6lAqrwSWQxEnKSf0aVw4i9C8SPGLtUU67tyGhJv4LpxHBCdq7y
         y3uVFEmSdnzcIne42xBsneSr1Vy9m9KPSzOZs9WgpoLzqPnP4NqczOLNksHefVBcNbJW
         oRa1tEeZmZgplTepS9e3/Jk+Slfy/QGiI3j1P4p9SkrbbjkUvxC4gVpIxfRBqQYtFQbY
         2Idke9MNo2CjFWtHc5ARa+jUWRHqME1pQ5/41gc4PBAPgltxOgTYlZCgKPwDr0eKF9mt
         MewMg1H+KnmhqHG+UQxCjntmTRx/Zw83xCne/BxRnQ9zo/scJ4xjO5+AcXQvadNmhW+P
         e9Mg==
X-Forwarded-Encrypted: i=1; AJvYcCWsr4hYsAl4YiGbU7Ex5kzJkQaLEG1oAB4OpS3gGMBJspuvpqLkti7yIYCoP4e6XfsYrjDDsy+GNYnhxos=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzlk14Vmq0bP25ub7T+2zVKYnhNQoaohCMD84FnhnlwKL8nG+MX
	n5yJAwXBoXzbVAG2xqKO2+HPRjItoU3sN5XBKSoDNHdo+HIU9Ip2T9u4LOX9ZtSWAW5mamb6nYu
	yS/v/OQ2pThgCG7twxxMR7ryay9RGm5aHmTq3J8U+0pE4+KSJnvjqhvC7gvtb0PhO/trYFiiPO9
	0/f8Q7qeBwpQYwcLdCM2gatL0BvYHfA2Ec9dwlTvPa
X-Gm-Gg: ASbGnctg5MKOMvchWNFcUimzj91Zr07TtE+Qgl1LKTZBReUEq87teNfOLJYdAPEqsiY
	fcFPdFy9+lTQGQTHCFhv5HFkSOD0Hzo4ys0dCf6CiDfMU9w1T9uQScSNk75aiXGsM8OaoC463MB
	LwIg==
X-Received: by 2002:a2e:a01c:0:b0:32b:56b3:d35e with SMTP id 38308e7fff4ca-32e5f602f69mr4968811fa.20.1751636307984;
        Fri, 04 Jul 2025 06:38:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFTOeLA4a8sWQdDmY2XwyBSkX+j6bk0YsxJsmNYE69UtQ1grt4HLkEvANqOSyCUqmP6VBgFXQtwwI2iq9F+sGg=
X-Received: by 2002:a2e:a01c:0:b0:32b:56b3:d35e with SMTP id
 38308e7fff4ca-32e5f602f69mr4968731fa.20.1751636307512; Fri, 04 Jul 2025
 06:38:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250625201853.84062-1-stuart.w.hayes@gmail.com> <20250703114656.GE17686@lst.de>
In-Reply-To: <20250703114656.GE17686@lst.de>
From: David Jeffery <djeffery@redhat.com>
Date: Fri, 4 Jul 2025 09:38:15 -0400
X-Gm-Features: Ac12FXxwOEfJeSt_DtU3lzqNkoWZYOv_HS6yyS3Ns8ZeN5Ywx-N5Uhun672eW6M
Message-ID: <CA+-xHTH2rxWwAao0EuNbhubqA2mrXOTZ7r1p-hcTieieomx75g@mail.gmail.com>
Subject: Re: [PATCH v10 0/5] shut down devices asynchronously
To: Christoph Hellwig <hch@lst.de>
Cc: Stuart Hayes <stuart.w.hayes@gmail.com>, linux-kernel@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Martin Belanger <Martin.Belanger@dell.com>, "Oliver O'Halloran" <oohall@gmail.com>, 
	Daniel Wagner <dwagner@suse.de>, Keith Busch <kbusch@kernel.org>, Lukas Wunner <lukas@wunner.de>, 
	Jeremy Allison <jallison@ciq.com>, Jens Axboe <axboe@fb.com>, Sagi Grimberg <sagi@grimberg.me>, 
	linux-nvme@lists.infradead.org, Nathan Chancellor <nathan@kernel.org>, 
	Jan Kiszka <jan.kiszka@seimens.com>, Bert Karwatzki <spasswolf@web.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 3, 2025 at 7:47=E2=80=AFAM Christoph Hellwig <hch@lst.de> wrote=
:
>
> On Wed, Jun 25, 2025 at 03:18:48PM -0500, Stuart Hayes wrote:
> > Address resource and timing issues when spawning a unique async thread
> > for every device during shutdown:
> >   * Make the asynchronous threads able to shut down multiple devices,
> >     instead of spawning a unique thread for every device.
> >   * Modify core kernel async code with a custom wake function so it
> >     doesn't wake up threads waiting to synchronize every time the cooki=
e
> >     changes
>
> Given all these thread spawning issues, why can't we just go back
> to the approach that kicks off shutdown asynchronously and then waits
> for it without spawning all these threads?
>

The async subsystem fix is something that should be fixed regardless
of async shutdown. Async shutdown's use just exposed its thundering
herd behavior which is easily fixed.

Reducing the threads is just good optimization. Doing every callback
in its own thread adds extra overhead which isn't needed to maintain
ordering and async shutdown gains, and combining sync devices into a
thread where reasonable didn't add that much complexity to the code.

The older non-thread approaches were unpopular with how they still
added plenty of complexity to the shutdown logic while pushing either
ugly splits or their own thread creation down into the individual
shutdown routines of drivers.

David Jeffery

