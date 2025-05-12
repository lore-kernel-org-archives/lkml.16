Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7D3195;
	Mon, 12 May 2025 02:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747016604; cv=none; b=BCNKg3JeFG7SNcLv13QXydkQ8wE7TLkgjlMRLCJdK/nmhKhViT2niV8qyLCfHb8dkFZUvIxUkvgWCCbK5n3Z1fwLnskoiPVgK2gazgd+y8mOBVJoenGktAAaObFZrY8aLPx2ie/gJwYcMoKq7aaLawNUncWY86Pu+1FmYcKtooE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747016604; c=relaxed/simple;
	bh=yAB5LyrtN+FS0esHAtIwzCdcCFJcUO7gVkLtVbAI5lw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iUXQM/gQ3gdaX5PV0khfyR7x28V3xB/NGo0MPDUGP6GCDX+C7wFO4xhB94hUHI0hGXEX9FOLqM//fab3TEg4v81r9iYEuOIdiBRuwr9uThZKIYGkdbPfJj30TZbbB0AVIR9KvaHKXACM4dbB63KIO5BaSr9we/q/+Eu4yLuWxNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z0FCZl6a; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z0FCZl6a"
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3d81cba18e1so34013715ab.3;
        Sun, 11 May 2025 19:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747016602; x=1747621402; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WZyhMsP21C11jZnfJwl5SYCwAR53Po10KU2bYlVY3YM=;
        b=Z0FCZl6aEne/+jzd+7kXnkXzzYCTLka772mr1PoqJKdVhZwIjYFzJz8nfcxkStfYXV
         IRg2wXL/eBbNbE78Jq7L91DYAx6UToDAdQX55lJXxPRExJZ5FEBr+HmvvzfJ/XcCkmiE
         kpfbASyYmb6mMBkotEj3c085yvIvAyYY18Gzh/sVbS2r7suWnFW68M0e+V4lt2zlH4HL
         By+JWzGcLYEuKXLqhHtH4Bln1T32LKBfXtwoZ8QY49l0n2i8PLqWXjI82CuBkUtDQBec
         pJgguRJZ+1855Ou+wdqhRfEMz/7E1NvXlTAZfMQ9sT3U7fbxV6U/d0LX77agGBReFLke
         4DmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747016602; x=1747621402;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WZyhMsP21C11jZnfJwl5SYCwAR53Po10KU2bYlVY3YM=;
        b=bkWCnLb4ZGVPPm8QK9MraD5LnpsxSR92VSJzENoAzOeRscmWvgD0+dRL9ji6BNUJAO
         lxd8wghgIeM8hbTaLQdOC6sVM7gG3501CbvFJB2Jru79JRYnceaPGPyRMToGNB1Pqvdb
         X01cax9bkGSWnOP78jkQMQ4r2fMnf5cPeSkZVX+DxzLiojVA010vJoH82Tii19zF4GXo
         tkU21P0mgXjqJv9rUs+jzw7vqHmf9ovTT7TWmrEp65kOAA496oq0HrXVNBLNWoBE6fWZ
         UPTybW4mW9ZabpHQ8d712x486nUTdTJs16CpnPDNHvUhQ4qdY4ybj1k9pprYqAiwtPRu
         o5ew==
X-Forwarded-Encrypted: i=1; AJvYcCU28K2nO8FkYRr03LsPGSdDT/yQjiNhozLnYLpy4ZnB55ERXtxjfh34JmCzEe3/vlrlNdMxigpPAqOVCAkG@vger.kernel.org, AJvYcCWNfKHGEZSuGG3J7NtROf5kb+gRoqQFZgceOMY2j2QliIZuZB7EgoVADHgxcFBCr6sR38AOQlax7PY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx61B3iDTBJWBKFM8QFSYnKJmPvUjdFVevhJXWClU3xkWqx/EFp
	rxbCa/NFwf4Hzo9lDRQvLGKn6W8UwamIGAPOuM60c+SiK+yIVsm7UlnWsE0SuurH2/GHTIfX4Hq
	dZu7m9M7RmyA0iYgXMsao43bVDWk=
X-Gm-Gg: ASbGncuVPGagP2BeoHkEuVhxLlpMomLvKa70gUL97X1gqoqu9UpiwBkYzXQ0IbOYiIZ
	om0bYRohyP6IPZoVTtFxCMHHvIBNS80IMoRHNioqZFE7mtVt20zNb0Xq5ry7lPIHJwHQTr4mKFC
	t7dw6XPS68qNwxbYrET5o0zzgkR7Fw8TgE
X-Google-Smtp-Source: AGHT+IEuH6nOyvLaQ5zxqspmL/6pNAvDmL14tsAQ2iM2CURq1N74lAODObqPcgdaLwF4uKNZazOqMMDFAdBWYh4RCx4=
X-Received: by 2002:a05:6e02:12c4:b0:3d4:244b:db1d with SMTP id
 e9e14a558f8ab-3da7e1e2f6amr123277275ab.6.1747016601747; Sun, 11 May 2025
 19:23:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAL+tcoCVjihJc=exL4hJDaLFr=CrMx=2JgYO_F_m12-LP9Lc-A@mail.gmail.com>
 <aCFPRhfxKUeRu1Qh@gallifrey>
In-Reply-To: <aCFPRhfxKUeRu1Qh@gallifrey>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Mon, 12 May 2025 10:22:45 +0800
X-Gm-Features: AX0GCFutCEE_ey7c_2GpNPRcUFt88d_sFj3zmZKQO6BQr_r54gZw92rzxktXLAY
Message-ID: <CAL+tcoBKZ4FMk9ozFidWUgfrEyRBrHCsh4cMMbTOA_e-wn0UJQ@mail.gmail.com>
Subject: Re: [PATCH] relay: Remove unused relay_late_setup_files
To: "Dr. David Alan Gilbert" <linux@treblig.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, andriy.shevchenko@linux.intel.com, 
	corbet@lwn.net, linux-doc@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, viro@zeniv.linux.org.uk, 
	Jens Axboe <axboe@kernel.dk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 12, 2025 at 9:30=E2=80=AFAM Dr. David Alan Gilbert
<linux@treblig.org> wrote:
>
> * Jason Xing (kerneljasonxing@gmail.com) wrote:
> > Hi All,
>
> Hi Jason,
>
> > I noticed this patch "relay: Remove unused relay_late_setup_files"
> > appears in the mm branch already[1], which I totally missed. Sorry for
> > joining the party late.
> >
> > I have a different opinion on this. For me, I'm very cautious about
> > what those so-called legacy interfaces are and how they can work in
> > different cases and what the use case might be... There are still a
> > small number of out-of-tree users like me heavily relying on relayfs
> > mechanism. So my humble opinion is that if you want to remove
> > so-called dead code, probably clearly state why it cannot be used
> > anymore in the future.
>
> We've got lots of deadcode, why it's dead varies a lot; for example
> people forgetting to clean it up after other patches etc - so this
> _could_ be used but hasn't been for well over 7 years.
>
> > Dr. David, I appreciate your patch, but please do not simply do the
> > random cleanup work __here__. If you take a deep look at the relayfs,
> > you may find there are other interfaces/functions no one uses in the
> > kernel tree.
>
> Actually, that was the only interface in relay that I found unused.

Not really. More than this single one, say, __relay_write() and
subbuf_start_reserve()...

>
> > I'm now checking this kind of patch in relayfs one by one to avoid
> > such a thing happening. I'm trying to maintain it as much as possible
> > since we internally use it in the networking area to output useful
> > information in the hot paths, a little bit like blktrace. BTW, relayfs
> > is really a wonderful one that helps kernel modules communicate with
> > userspace very efficiently. I'm trying to revive it if I can.
>
> If you've got a use for that function, then I'm more than happy to sugges=
t
> just dropping my patch.
>
> However, it is a fairly chunky function that is built into distro
> kernels - so I think it should have a little thought put to it.
>
> As I say, if you are using it, it's fine by me just to drop this patch.

For now, I'm not using it but still considering what the use case
might be in the future. As I mentioned earlier, I'm trying to make
relayfs more robust with more realistic functions.

IMHO, it's not really a dead code to me unless you can clarify why
it's obsolete instead of claiming "no one is using it". If you insist
on the point, then most of relayfs would be removed, which is
apparently not what I'm wishing for.

Probably it will be finally removed, but not at the moment. Evidence
is still not clear to me :S

For sure, the last call would be made by Andrew and Jens. Please help
review this patch one more time. Thanks!

Thanks,
Jason

>
> Dave
>
> > [1]: https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/commit=
/?h=3Dmm-everything&id=3D46aa76118ee365c25911806e34d28fc2aa5ef997
> >
> > Thanks,
> > Jason
> --
>  -----Open up your eyes, open up your mind, open up your code -------
> / Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \
> \        dave @ treblig.org |                               | In Hex /
>  \ _________________________|_____ http://www.treblig.org   |_______/
