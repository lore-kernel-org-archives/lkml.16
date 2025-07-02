Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CBC21531C1
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 07:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751442235; cv=none; b=DTOfA73g8kPNq+mmdMT05KSeGlaQW0yoGSDXLYf/19OUFxb556fxLTRVxRuDpoXofPyAx6IgW908c+lsGHY9NtA50qbQXuUPdI7KA9fwz0lq5cjQ9yU7paEWA/JysEiIxH2fGhFSa2kSmFXJSFhvCZ9CdUZd2QfntSjhqtcVhuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751442235; c=relaxed/simple;
	bh=4bOfOA6U54hFIfw4gEsPE0Fd+J9SoOGc6V4U9sjzK4o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NI1cZT/Hvhd/6kep5a0KOC/hFt2rgnQGwLpq1OImP/KB7s9R8pWr1D4V7w7lxYxqtdcEQdrvCMlsU6L9Lt6BuN/gJgtA1YxoGJalV2blwNY+rmpAm3FeEy4BpuX3d9NNeDZfgcgfV1iPDQMPcE76v+hm+gGPj2lh6W3lSEgchhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jYo9qMu3; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jYo9qMu3"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-714066c7bbbso73185387b3.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 00:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751442233; x=1752047033; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4bOfOA6U54hFIfw4gEsPE0Fd+J9SoOGc6V4U9sjzK4o=;
        b=jYo9qMu3oSD8dmfa+Vs4iYltAi357RrquaD+U6G7reWEi/2NuL8wPJgTvuE+yR+YEA
         eSduAYiSU9FV5/9WyWhIsUZUDD0aAGztVRIAWg5oS3I+RAr4vDeGPRdmo2rhtqq228VV
         qNHhRVpqli5oOgEo/mlVFTdLK9kT2Yl8EKXDTpZwTwkN5r5oZ2tXGOo+SkZhDvoPIe0C
         kFvfEVE+yoeFz8JegMILqsuIvw6Tn7goLb35So7u+rMImwQ+HUALZmT2IpZrWfp92hmE
         lRr7saHnK25meWaGTcdWlKQOKHOBaLOTvz/uJIZhoBNZctxtI+7efoJUHO4hEId5BbfM
         2YJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751442233; x=1752047033;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4bOfOA6U54hFIfw4gEsPE0Fd+J9SoOGc6V4U9sjzK4o=;
        b=MitYS3imA3jRPFWdsSSSdeELitLxzH3RGk/L0o7RWs5cgm8MYgtZdJuBWpeEHd3a6Z
         fvYTQW1a3s3T7TTXSKjZBhJyV+k++DextVvnKtruoUcA4rlamDmzrEzBW6hsczstT8J2
         VlqwTP5qi9yjOh4yC7AC6EdX2il3ehWM/qyg3WZ/wO0MsJnOlvCGyejiTT2jXGS8e9yp
         v4dMGSadCoXxV8POXXeXoAMlHf+xwe4YcM0Xi9x59vEJ3HsLccO7qXiajFJaFaQ4519l
         KVUZXr+pSRfY6MiEQ+ipLk5ghay5eChlPHC86umO3tKET4FceP3X+199TJHqJrC1hfGC
         a2Gw==
X-Forwarded-Encrypted: i=1; AJvYcCWDReyPvytgI0XXiEwdAUHVfkudaYQdFXhe5gb7zxhUlbnWXRPfqsDxE3DBK/UcJm5NuSjs6ciH7xZemeg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwH0rZ0bg1tk8Qp+GSP349AxotVkwL5TvX2Q3Ov3swK9tg0VX27
	1GgMtVWIXsPcFFsDFpglUQprT4NGDe6Eq5q910BLMMrjseJ0y6yDBTN/4Tju7Yce5ilkZtAeZmT
	G56HNhDwcqaQw7Okhq+7Pda3IPsdzX9i8iIu1lz/V
X-Gm-Gg: ASbGncttvYhl+CyBeeDOLd5L44rr5CGqk+vn0MxtOMJ7JWQ5c29z0jXd5f/dWc50p1I
	ZgwuseCkxXGDp97jnadAbctLzFSRjpLhPrGn2KlwysVAoFK8PnjPhsH/l+SItNtO054jpxSxCd2
	UWu5yAq6RQpQNoZCcP2z4Yegf6uRbiyTEP5EigBzk18nHG
X-Google-Smtp-Source: AGHT+IHJ5KSoH5fJcH5bRD8u0uju23Ajgzfe2GuZ+dlV9bVuz6oF/DawUNtQuOoM8rfBTiKumHPVsJaPfZVKygoRYhU=
X-Received: by 2002:a05:690c:4:b0:70f:6ebb:b29a with SMTP id
 00721157ae682-7164d5c9ad7mr21914977b3.29.1751442232013; Wed, 02 Jul 2025
 00:43:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624110028.409318-1-dawidn@google.com> <aF5N5jrRUlj3SUGS@google.com>
 <CAJ_BA_CppC58kc-Uv49PSmWFcCih-ySuGDuRcO5-AWQQqcqWVQ@mail.gmail.com>
 <aGOiu-sXFj1EUQAB@google.com> <CAJ_BA_CZWvC2=i8riNe5LReLKzPXK1vPwymiG2dzLEntda7TRg@mail.gmail.com>
 <aGSuS81Psqm_Ie4N@google.com>
In-Reply-To: <aGSuS81Psqm_Ie4N@google.com>
From: =?UTF-8?Q?Dawid_Nied=C5=BAwiecki?= <dawidn@google.com>
Date: Wed, 2 Jul 2025 09:43:40 +0200
X-Gm-Features: Ac12FXyjHURaGeGORQBNZGxM0SsXHPq_jf4zJZWaq-J26bz0217ia66mA1Lhlmk
Message-ID: <CAJ_BA_BQOQe61r9t9rL=UiOqpHwOoTSbQcZNe=CrCcjMha_YQg@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: Add ChromeOS EC USB driver
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org, chromeos-krk-upstreaming@google.com, 
	=?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Content-Type: text/plain; charset="UTF-8"

> They doesn't look like shortcomings to me. The corresponding destructor
> callbacks have to be called when a device is removed anyway.
>

Yes, anything related to USB communication itself has to be freed, but
freeing the cros_ec_device structure and calling the cros_ec_unregister
function can crash the system if any of a userland application has the
original file cros_ec open and tries to send a command. The chardev driver
is not aware that the device has been removed and will try to access the
removed structures.

> Instead, re-using the same inode for the userland interface however
> *silently* swapping the underlying devices makes less sense to me.
>

We are sure it is the same EC device, so why do you think accessing the
same inode makes less sense? It is a case for specific interface, that reboot
causes reprobing, which is not a case for other interfaces. I believe
it should be
transparent for the cros_ec device user, what interface type is used
e.g. if it is
SPI, you can reboot the EC device and wait until it responds to a next command,
but if it is USB, you would need to reopen the cros_ec file after reboot.

> My point here is: to let userland programs be aware of the underlying
> device has been removed.
>

I got your point, but they are informed with a proper return code. The
host command
communication doesn't have context. Every command is independent, so userland
programs can not assume any state of the EC device e.g. reboot can
happen. I think
behaviour of the cros_ec file is not a good way to inform the userland
programs that
there were reboot, sysjump etc. There are special commands/events for that.

> What are the reasons for disconnect and reprobe? From your previous message
> and code comment, are they "reboot, sysjump, crash"? Would it happen
> frequently after AP boot?
>

Yes, every boot "from the beginning" , including sysjumps. It depends
on a EC device
type, but it can happen e.g. after AP reboot (RWSIG jumps to RW, it
depends on boot time),
during firmware update procedure, rollback region update etc.

> Note: we are talking about a EC-like device here. For a real EC either reboot
> or crash, the AP will be reset.

That's true. The problem doesn't exist for the real EC device.

> No, I don't think so. I think all EC-like devices share the same concern
> regardless of the transport medium (e.g. SCP over RPMSG, ISH over ISHTP).

Yes, you can run a userland program that opens a cros_ec file and constantly
sends commands e.g. ectool stress, and then manually unbind the ec
device, but I believe it can cause some crashes/memory leakage. I don't think
all drivers are adjusted to hot-plugging.
