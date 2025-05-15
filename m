Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F3435970
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 20:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747342632; cv=none; b=KfXQh3Af6kUCoBuLz1IfzbcGx9WEy6W3hIahfP3s9IJoj2I2ylleida5flPLLY35xIrFtl6YTFpKushXlD2QHVtL603y2SpEbkEnyudEAHzRwLCQrvdj20tPW+uufCf0ylPYMDZJyOb43l4kBFIPwazbJW0DpN/IhIAvYyyns9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747342632; c=relaxed/simple;
	bh=n4S9xk7FkDGi8ZPRR5Krx9XPaCn53xUBcwh32O8sVhA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zn75uhtEezcgzGrVPsIp3TUBnTSwG9UrcHiEe5LCF3JXZy+SLJFRJYG7DQOHFK2Q7Yl+l3x/XbxzIX4Ebs3JAhm0KRihTOmScJ+mot3B3HW3Jgpfj0mrjp4RdXfxpizHEUh8sPHqrMAOgJEhMVjXuwNcdIrqXaV1y1vtVyqIk2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NiK4c5VK; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NiK4c5VK"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6000791e832so1339a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 13:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747342629; x=1747947429; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n4S9xk7FkDGi8ZPRR5Krx9XPaCn53xUBcwh32O8sVhA=;
        b=NiK4c5VKp6uMSJjFMco2TAD5PtvZRm+/Nbty7oVQE3OaZnmKVU3RWdW2kJpwdm8WC1
         9w3+WoYcman57A0RL3v1OVsw2ok20PXL4KRfwkKPZ/DBIqDWy335+k02rAGSMrjKctKZ
         kIPgCvZ3G6k5tUmICjohmIP7Tqge+2ljZ4o6RWu5N7kW8TSzeumG31IpV+p7XfW+pjve
         tNqTL2N5jYN4W/2iw1ODL89i8TcXuy+J52rVziqY0RxKH46PaFD2vk6BytslHkn7eUuz
         WLvCrhCe6ppUBB17JifhmtoB2h3P99gvhohrMn5FM1oktQvi412X2dzVdFTWJaOheR3s
         XPSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747342629; x=1747947429;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n4S9xk7FkDGi8ZPRR5Krx9XPaCn53xUBcwh32O8sVhA=;
        b=HFpfggpLOpObFdSlnuKMX7ilyNqtfjAwNg79Xf7F0wkZnjp2AD40WbQCdoGWPVbtj2
         jy/NkwlmMLcwIzCz2VbRw7Yh71CjKYyaP8APna1pg3kcLtj/02qkoTu3eoDKG4fOSVp9
         IiUoKbwLDX3Rgsbxx5czq9MJbMDSVSHSsc6m3hp7qSUaJCMenL9SOPqWOqgUprXb1Nxk
         ZTfHHaRusyDJB/wu3wD9I2cgt8Qjrf4Y5g/i5uw0AJ7Yag3eQrVYPoGcN573Du3CtgBD
         ubH/E/OCFGwNy0WNJCfI2yIGe5mKnvwMbBukQb0j7+vGpJrNs91VqYua5sxxt5HV7wzS
         87dA==
X-Forwarded-Encrypted: i=1; AJvYcCXcWM1a/iPdZ0sWD6XsaKZmr7QCo0njb/ErrxSOk2yF2SU47ZL2/MxP6e4RQsV5FXWclyMkAR6/9/+QDgw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzW/xkqabYSicspXL9c67SJ2skeOOwlN2H9IdvVXyrT6xjCSH5l
	cYuMDRWAozBtJGCk4q5jZwn3BmHeWeNZCA1ACVleWY4Iq3dbvXAyHkYwDFnlMMvJh5W1jSZGK0G
	xoDxY7rdaWfosO13bVGPls1b39g8J+setfHu/y3KY
X-Gm-Gg: ASbGncsZy/WauKrfLlBmlmULegj5oEmO4MitO9sC0XdqdyrI7OjfHEXowF43Jr5MtqI
	OQbgOg0KPH1Nd8EjAKrjnZnJnpsyiFvESJgkMWCN8GX3IsphARa9kNmusLc0Ea2hfFZLi77AzQS
	vUDB4Ldc0VBouuRNU4swpAzm0TDuVedWIckHGcBR6vXm+Dya1CY2kfdFFXpvaK
X-Google-Smtp-Source: AGHT+IHZOBTJlThJhcv/ZxHz/H+8QZlugn3sleQN3wcAGTU8hgAWjH2Njf0TmrGz0ZHIoDeXYKzWzlKfCbbNua8Uh/A=
X-Received: by 2002:a50:cd19:0:b0:5fc:a9f0:3d15 with SMTP id
 4fb4d7f45d1cf-5ffce28bb43mr138873a12.1.1747342629100; Thu, 15 May 2025
 13:57:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515-work-coredump-socket-v7-0-0a1329496c31@kernel.org> <20250515-work-coredump-socket-v7-6-0a1329496c31@kernel.org>
In-Reply-To: <20250515-work-coredump-socket-v7-6-0a1329496c31@kernel.org>
From: Jann Horn <jannh@google.com>
Date: Thu, 15 May 2025 22:56:33 +0200
X-Gm-Features: AX0GCFvCU69IQ16RRV7879LgqrtFsOSgJDh6k5Q76ICOqMSjVLU262TZzPZwqzY
Message-ID: <CAG48ez0dqyzT3k4-HC3UjhCncgnPk28c1Av-iV8c9hB5tcu2YA@mail.gmail.com>
Subject: Re: [PATCH v7 6/9] coredump: show supported coredump modes
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Daniel Borkmann <daniel@iogearbox.net>, 
	Kuniyuki Iwashima <kuniyu@amazon.com>, Eric Dumazet <edumazet@google.com>, Oleg Nesterov <oleg@redhat.com>, 
	"David S. Miller" <davem@davemloft.net>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Daan De Meyer <daan.j.demeyer@gmail.com>, David Rheinsberg <david@readahead.eu>, 
	Jakub Kicinski <kuba@kernel.org>, Jan Kara <jack@suse.cz>, 
	Lennart Poettering <lennart@poettering.net>, Luca Boccassi <bluca@debian.org>, Mike Yuan <me@yhndnzj.com>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	=?UTF-8?Q?Zbigniew_J=C4=99drzejewski=2DSzmek?= <zbyszek@in.waw.pl>, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-security-module@vger.kernel.org, 
	Alexander Mikhalitsyn <alexander@mihalicyn.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 15, 2025 at 12:04=E2=80=AFAM Christian Brauner <brauner@kernel.=
org> wrote:
> Allow userspace to discover what coredump modes are supported.
>
> Signed-off-by: Christian Brauner <brauner@kernel.org>

Reviewed-by: Jann Horn <jannh@google.com>
