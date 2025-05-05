Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48E21459F7
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 13:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746450527; cv=none; b=lHb+i0+hyLREzW+72vykmYZbalW0AVIOgE1TdAfI9bbQReVn/HrWpWCrGOH659swozTbF6eEDC/2Dq1O4wfrmwpsAdq9yuJeXHqyk6Tc1QjC/5CH9t1K/k62hcFCXnLxtCw2Z/YCemm5dswCWSDYl4AOCZbRmddfflYaOlMJAbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746450527; c=relaxed/simple;
	bh=CcTxzgBbzI90f+wN0JcENM4jZ4hoxOhLzv6DnmnMc4A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oLPS90sl//+5VI4wZTTxLK37bbJF7K7oFrcPn/ow0xIutkTzOIFsExT/1tYYHSrOpAxpmSjmPi5QFPLghZX9qTufnow22Cix9rXA0qcZ4jZvo10vhzMSDMxpIyB5taTtUTlekX1WCQ7nzsd49nXYOcA7RTI4lB287V1DHIQ1Ba4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kq5iKNY/; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kq5iKNY/"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5f88f236167so12836a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 06:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746450524; x=1747055324; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CcTxzgBbzI90f+wN0JcENM4jZ4hoxOhLzv6DnmnMc4A=;
        b=kq5iKNY/AnIUtVknlPT/tz98zm4MSOGfJnLvMZH5/eXGakKynlE9gEdHx8ZEJHpvbm
         nRNIruInVpmfJt2my0CZFwVH/9hrFAqp6vxR+vbgNQT6OAvKXDurcpbFdiiKUQBbHOlm
         6lgK9imDnlBKKa7RsE6DswQyetBWo6MVlxy7HcwAnk01VUsGIB263xLRt7tcAIJbYFMT
         A9uNi7TdPvRYxw87Epu9uRGBL7Zae4geyq10K8jiAl7x5nKvVYc3yDklB/jssV2IxZoN
         YO/llfhEmc1//+pu4h5h1iSRwW0DBsdkTJo/+p3/lUBVfdwY0rRM3CvCcHcF9hquimbZ
         YvHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746450524; x=1747055324;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CcTxzgBbzI90f+wN0JcENM4jZ4hoxOhLzv6DnmnMc4A=;
        b=L0PvSYAqQpSzsEjk4rmEX6lTuNgfgMpCiWNn4/T0nZFzmeyTUcXb1Btr05x18Fm1JG
         Ag2qH2Vuvs9emcOCy86B3lBZBHuhqIYW8F2p+khBbEnEZ7iIsAktVdCA9dr7JJfxH9p5
         oAs8DNcrFmCi/u24C/+fK3vLHNsttk9lNfBn1nO2Jdy23GzvJ49GV6mqzwJS45w60X57
         CKsPeYTgnPSQkAN8v5t7Jd871yhDAIjkNI3v7EnUP2NwN3piyQFJbx4RlokfE5WsPSNK
         f3Kacbg8bQLREgGC/D7hWcMjB1EIryCcHsy8Bmn0jW0XzDOEIJD9ffmSAQVF3nMN1uth
         ALRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhBr1uaqbBD//wzs+qdEYAz3CoBbCE8669l4TQrxrYcpsfLRh4sWeFRNKqzkuMCw081fFNr5wXf1z36XY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTw9KDpmO+Pev+OceEiAyt8OVyjSNnTbnAMjj/PJVd0ItbICe2
	F4P/pUw28z7Ys2I1Ehs0qSID75g1zwKEP8EFY9NU8W4Nb8NLwAX9DlO02htoInw1+SBW0+p2Pea
	VzlUHAbcfmqIkka1XXEP84GqGJMb6Cyi3e5T3
X-Gm-Gg: ASbGncv9DEG/4+UoUd4cV8YYyLdN3XPO+BdmmyO1QCcI5gBkDYY8gCRk8sB7TiQ9nbl
	lYB4XS4Jx45CZTZ2jr/hJpwkppy5mhjKV56iD4a2ZECvZw3eO04qGL0cyDJBf/dN+oiX93CROdC
	aOgy6Y5ttAX0VWabU2ujFjUz16C8PJ49WBP0C5ozpzhXo5iYn6Eg==
X-Google-Smtp-Source: AGHT+IFX1jZnIEUIqKHTcho7yIpvOOHBKxzhoHPTnmaDdVP2OafarV7bS2cZO9snYNbMzLKCcMCds3n+Ecp9RGACrAw=
X-Received: by 2002:a50:ab11:0:b0:5e5:b44c:ec8f with SMTP id
 4fb4d7f45d1cf-5faaa1f2701mr123881a12.3.1746450523693; Mon, 05 May 2025
 06:08:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250505-work-coredump-socket-v3-0-e1832f0e1eae@kernel.org> <20250505-work-coredump-socket-v3-8-e1832f0e1eae@kernel.org>
In-Reply-To: <20250505-work-coredump-socket-v3-8-e1832f0e1eae@kernel.org>
From: Jann Horn <jannh@google.com>
Date: Mon, 5 May 2025 15:08:07 +0200
X-Gm-Features: ATxdqUHIxwIoIqV0etAlWQHM7DrrKMZU_RnaVc88wfMW5gzzGzHJfNE1OpkPS5Y
Message-ID: <CAG48ez3UKBf0bGJY_xh1MHwHgDh1bwhbzMdxS64=gHNZDnNuMQ@mail.gmail.com>
Subject: Re: [PATCH RFC v3 08/10] net, pidfs, coredump: only allow coredumping
 tasks to connect to coredump socket
To: Christian Brauner <brauner@kernel.org>
Cc: Eric Dumazet <edumazet@google.com>, Kuniyuki Iwashima <kuniyu@amazon.com>, 
	Oleg Nesterov <oleg@redhat.com>, linux-fsdevel@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Daan De Meyer <daan.j.demeyer@gmail.com>, David Rheinsberg <david@readahead.eu>, 
	Jakub Kicinski <kuba@kernel.org>, Jan Kara <jack@suse.cz>, 
	Lennart Poettering <lennart@poettering.net>, Luca Boccassi <bluca@debian.org>, Mike Yuan <me@yhndnzj.com>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	=?UTF-8?Q?Zbigniew_J=C4=99drzejewski=2DSzmek?= <zbyszek@in.waw.pl>, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	Alexander Mikhalitsyn <alexander@mihalicyn.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 5, 2025 at 1:14=E2=80=AFPM Christian Brauner <brauner@kernel.or=
g> wrote:
> Make sure that only tasks that actually coredumped may connect to the
> coredump socket. This restriction may be loosened later in case
> userspace processes would like to use it to generate their own
> coredumps. Though it'd be wiser if userspace just exposed a separate
> socket for that.

This implementation kinda feels a bit fragile to me... I wonder if we
could instead have a flag inside the af_unix client socket that says
"this is a special client socket for coredumping".
