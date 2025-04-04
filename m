Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A903219D081
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 08:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743756830; cv=none; b=gVFhsEPGTYLqE9GX4+PPYyphR9HJtkWt4OaitKTZ9Yi3xvyzj2QSrlQ/vkEqVE4j39dDlKaaFTeIitnzdmiGPPqJqZMehXsWXhf+J90EGf7eexpLWafTGfjPzYXEW3D1d99NfEf8XoDFGpCnyfApI0OfGQ+pgk53LHyQ8dzkBAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743756830; c=relaxed/simple;
	bh=ujMPWAnf1O+bgsUZ8iB+TMoPNAqGfSKZOUzSlaV5O/s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BklIhObEUQQS1l2vYmAFKpIpwkA0vmJmqKV4THUTx1bGwMV6uFP8jO78xlz257yDj29+T/wteqjNZpUZb2HyQrDX/dF/GaTPAdeBfr13S4XXBMwQBIOB2T7W3625S24xMdcc5G+T42Q2y+SLshrNbVWtBmvDZMrwdrOLyLx16kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=V/nATDAD; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="V/nATDAD"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4766cb762b6so18289671cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 01:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743756827; x=1744361627; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ujMPWAnf1O+bgsUZ8iB+TMoPNAqGfSKZOUzSlaV5O/s=;
        b=V/nATDADvlhYMGWhL6TB4FAfT6QqAXbN5VzqgzAVN+TAwFjUsZlP0rlqZaNXOiOIYY
         ccBeDPyvZhYmwz9DePK3mCqLnRlmYrDnSUjAIM0lhbIR8PgxHaGTnDEEJWlqqhhW6XIn
         3NQGD+PyTHbQ4SvlK00Dsod9O7oVbVuZQTjCZC0kXw71M5QTn5D5iuEZU8yiif4Tlg+n
         pQ0Gd4O2/JLW5gPngK6yyi2VN6o1mcBTWtFBA+PXYNOFyvb2OYpsp0R6F3CXO/T+wc+n
         dsgDYhCPGKcaYs4xouwbloDmyqb3+80P/dhpg+LwA0yZ7e6sukPHKCInjmK1545Ufymi
         5+2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743756827; x=1744361627;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ujMPWAnf1O+bgsUZ8iB+TMoPNAqGfSKZOUzSlaV5O/s=;
        b=eXJjYHrRSatmEraM/enDnsMhrSiF3vV7OjMyY8VZhrgr7nJqO1PS3Qo29D4PGWa421
         mJ+zwBt0XNE6ZRt88ufIx9M93Nh9NsEh1QJh1Qkd0RzaiFqKrZPn7yXLP8J0utTSzJsx
         Zi33liGS7S7uaGquqw6ShQyjYGs7LY4RwcaaeaBowyZ/1ZCNF8yljZQLVjH9VULKBtjU
         sqHDSEo1QRxwWx1KVFBhDpVHve/hYgs31VjfPUDFPkJ/lrY0fqM/yFuyKlgoxAYo+bvW
         vtlhL4rs/tRoF7dgFZKWtktgLjgLDegdCEHVgT1vXw/4sp5udPibwNfwKZP/JEfvd2Pk
         iKWg==
X-Forwarded-Encrypted: i=1; AJvYcCWvvE+/Eq/eV/yEORUUQqW+8r5Nb6Yh1nLppgAkMjaCKRTnMeusYQagULGFZj4VQXpcDcyK2eGHuQ1XrCA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxBg2jgn8xceppNPgdPDSYvJRfo7FF/jXEsc5WpKh0mhLvVTdu
	7kL42KbgXXxOY4L8236KaLclK/k4pb5F4HcGSD0rrdoWB+1BO1DJLNI3+lLYLKv7Q2kYHtU7xRK
	ft8cGQ9aLAdFiVUcY6A+kUT/0W0SJIi7PkRwq
X-Gm-Gg: ASbGncvS3bmYlY0EnUDeCIaszFitJppx//rT4PaWvm1fKZsYHIr/sNfr/FvrseSYvbF
	/ayeiusuS2yCVK47YD3lJKEAduJIVMoIdno+4UCBXKVvXKPJlB7pA0DUJBh5UpawRN+1UmVIRoz
	Obiuc6ruZA/1eHZylRTnWxY4rr29o=
X-Google-Smtp-Source: AGHT+IEDvlcZZb4tFOjewKa5T6ATIyDdRK4SGeqCi554xhUd6jIH4AI3nWrbMiUMVwr+yZJxTIpJVIPkAIzZLyWMSKc=
X-Received: by 2002:ac8:578c:0:b0:476:6df0:954f with SMTP id
 d75a77b69052e-47924c86329mr33561751cf.10.1743756827275; Fri, 04 Apr 2025
 01:53:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250403113519.992462-1-i.abramov@mt-integration.ru>
 <Z-7N60DKIDLS2GXe@mini-arch> <20250404102919.8d08a70102d5200788d1f091@mt-integration.ru>
In-Reply-To: <20250404102919.8d08a70102d5200788d1f091@mt-integration.ru>
From: Eric Dumazet <edumazet@google.com>
Date: Fri, 4 Apr 2025 10:53:35 +0200
X-Gm-Features: AQ5f1JrJvO-P7srrVogKZHZUEQyOXnDzIFSrTNnEmr8jIXDbBAMV3uDIAoT6Pfs
Message-ID: <CANn89i+UQQ6GqhWisHQEL0ECNFoQqVrO+2Ee3oDzysdR7dh=Ag@mail.gmail.com>
Subject: Re: [PATCH net v2] net: Avoid calling WARN_ON() on -ENOMEM in netif_change_net_namespace()
To: Ivan Abramov <i.abramov@mt-integration.ru>
Cc: Stanislav Fomichev <stfomichev@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	syzbot+1df6ffa7a6274ae264db@syzkaller.appspotmail.com, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Kuniyuki Iwashima <kuniyu@amazon.com>, Stanislav Fomichev <sdf@fomichev.me>, Ahmed Zaki <ahmed.zaki@intel.com>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, "Eric W. Biederman" <ebiederm@xmission.com>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	lvc-project@linuxtesting.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 4, 2025 at 9:29=E2=80=AFAM Ivan Abramov <i.abramov@mt-integrati=
on.ru> wrote:
>
> On Thu, 3 Apr 2025 11:05:31 -0700, Stanislav Fomichev wrote:
> > On 04/03, Ivan Abramov wrote:
> >> It's pointless to call WARN_ON() in case of an allocation failure in
> >> device_rename(), since it only leads to useless splats caused by delib=
erate
> >> fault injections, so avoid it.
>
> > What if this happens in a non-fault injection environment? Suppose
> > the user shows up and says that he's having an issue with device
> > changing its name after netns change. There will be no way to diagnose
> > it, right?
>
> Failure to allocate a few hundred bytes in kstrdup doesn't seem
> practically possible and happens only in fault injection scenarios. Other
> types of failures in device_rename will still trigger WARN_ON.

If you want to fix this, fix it properly.

Do not paper around the issue by silencing a warning.
