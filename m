Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5A715442A
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 14:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751638161; cv=none; b=UlF1bkJUtAPIfqWB8joR807kjYSfcg8KN5GfRGM67HPTkTufm1W/t2E2ka+L92FS4tCAqe6EbxtA0gNvD+UJM08ot7VkeptwZ/M1NcEUdT4mczG8C83Afk5HlkADfkWJyanH5oRZo/YakYhd7W7M1WhlFE7IUUcpBOibVOb+ItY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751638161; c=relaxed/simple;
	bh=o22SaSnsu1WQHnkqdRIoFabdISDaqeXDNKGirIv8oyo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RSz6xr8Fb7/ZApECwpSlNiuu2M/xun3wDBLEqKJ1S0wlxcDzQIV3g0U0PGjbxR3g8WhjkTS9Y8YiK+eqzARvtIQ02wf0HQ4hKmZ1Zc9XPNclK4xJs0cVGP5WC4Y1Gz86gsBGiy3/+eWvB+xFWRAaa+J9PVrg572CsbYFdxKdD58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bsp6p3th; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bsp6p3th"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751638158;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VOrNKDtv4mY2pT9EDlIkWqiS73OnVUntUZCbjMuDRfM=;
	b=bsp6p3th/9BrQTvtMFZPeNjue/uCrzsDeqkz4Zex+Dms8djRRLK+td9SCZf1qpvXVYDT8s
	Au383oCj0kyhAwB7mwXdV0ii0mg9ZQhN0dQuRegXBL/d4dvVVYiQMBXFp6teA165a8Ag4p
	ATxS2SVuZmTZ4d8p/WICkbkoZy7cr7g=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-116-OZtYlprlPYKNiJvJURiP4w-1; Fri, 04 Jul 2025 10:09:17 -0400
X-MC-Unique: OZtYlprlPYKNiJvJURiP4w-1
X-Mimecast-MFC-AGG-ID: OZtYlprlPYKNiJvJURiP4w_1751638156
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-32b4ef4055fso7080711fa.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 07:09:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751638156; x=1752242956;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VOrNKDtv4mY2pT9EDlIkWqiS73OnVUntUZCbjMuDRfM=;
        b=TYoTKWiKFAamCCN+9z/HL4205XDwu4MNjoCopD1rj4gKjf21g/7ZxFvw7dfvH8FDqO
         llj7HBJ6dUwcJBaJu9r3PJ01dxrKg5e/zSZdTLhOVxYBZlri5M+UA24VprmdAccg+LAt
         seMeqnIFJmjCEv5viK1egwiJSWPOAvKurUosq2ly+PXD6OjjfPHS3E+GlvyJiLwgR3xW
         +JQFgPXJiA2fxlpYDgsQqRg1kWGcPwx3iwKuUTbjtr8OJroadMDh+2bx+pRJL9XVxT5K
         LNv1/o7mB8WibccnvcnasQ+aftlSPKjw6p+yqW6nMkkjg+JW8zxFhut+6dgNzREveogI
         6Vmg==
X-Forwarded-Encrypted: i=1; AJvYcCWWkVLHxM9xTUzmMJe+78+3ZsjM5avaC75TZoB413jIQZcLhWCWbRoEEQ1rx1I75qKcmfRUsv495YMPTZE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYdCiqr8boVLrHojPI2bL7VZIoyjws1dKN5dY3zibcCwd85wUY
	wiA4jEQQctD6rR6YMkgplqXtqseOEhmZHKmujhOZtvWlxp5WI6BL2W4Y0rgazhwynJr/dWWMpcI
	zDKEbfEhS7VMHTYDxk5/ve+o6q73x+MGCSCnPiWAHcs2Qe+Igo4ipF3pGGaOH46QKoLnjHjIkFL
	WtXGsNIL51dSYiDbpj7nfSBXYOTBHJdgqP/O8/1V67
X-Gm-Gg: ASbGnctJtvaiPBWU2aCGm0KSdBr8dGlhrnlv9qVyAc6AhN8ymJ8UyxKcaFNykGjJKVo
	gK+sK9dDSv6L5qt7G9WgUULGyD69g2ONF6mSBH7Tv7it1ly4CUoxxrPOO01FrSJWsoty3vkgWOO
	abkw==
X-Received: by 2002:a2e:a582:0:b0:32b:488a:f519 with SMTP id 38308e7fff4ca-32f00c889efmr7833551fa.6.1751638155212;
        Fri, 04 Jul 2025 07:09:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFB59XkjZpu9peglaAwPR2m1GGWoAEsmWmWQsl6Xf4+KVDJYuU5UV6fbyjB8kcFQIhNwsxoqChY3uFHFh3qQYw=
X-Received: by 2002:a2e:a582:0:b0:32b:488a:f519 with SMTP id
 38308e7fff4ca-32f00c889efmr7832341fa.6.1751638153263; Fri, 04 Jul 2025
 07:09:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250625201853.84062-1-stuart.w.hayes@gmail.com>
 <20250703114656.GE17686@lst.de> <CA+-xHTH2rxWwAao0EuNbhubqA2mrXOTZ7r1p-hcTieieomx75g@mail.gmail.com>
 <2025070408-starlight-pandemic-0266@gregkh>
In-Reply-To: <2025070408-starlight-pandemic-0266@gregkh>
From: David Jeffery <djeffery@redhat.com>
Date: Fri, 4 Jul 2025 10:09:01 -0400
X-Gm-Features: Ac12FXxMPP32h9UySF1ham11qALBr4OrI6VVO4XXxXfqe7L1atg--F_Y1lT2gNE
Message-ID: <CA+-xHTFKh0VUJ0r4K5L5b0dmrs9d1+cNkqf4HvKa4E-r_+u2CA@mail.gmail.com>
Subject: Re: [PATCH v10 0/5] shut down devices asynchronously
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Christoph Hellwig <hch@lst.de>, Stuart Hayes <stuart.w.hayes@gmail.com>, linux-kernel@vger.kernel.org, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Martin Belanger <Martin.Belanger@dell.com>, 
	"Oliver O'Halloran" <oohall@gmail.com>, Daniel Wagner <dwagner@suse.de>, Keith Busch <kbusch@kernel.org>, 
	Lukas Wunner <lukas@wunner.de>, Jeremy Allison <jallison@ciq.com>, Jens Axboe <axboe@fb.com>, 
	Sagi Grimberg <sagi@grimberg.me>, linux-nvme@lists.infradead.org, 
	Nathan Chancellor <nathan@kernel.org>, Jan Kiszka <jan.kiszka@seimens.com>, 
	Bert Karwatzki <spasswolf@web.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 4, 2025 at 9:45=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Fri, Jul 04, 2025 at 09:38:15AM -0400, David Jeffery wrote:
> > On Thu, Jul 3, 2025 at 7:47=E2=80=AFAM Christoph Hellwig <hch@lst.de> w=
rote:
> > >
> > > On Wed, Jun 25, 2025 at 03:18:48PM -0500, Stuart Hayes wrote:
> > > > Address resource and timing issues when spawning a unique async thr=
ead
> > > > for every device during shutdown:
> > > >   * Make the asynchronous threads able to shut down multiple device=
s,
> > > >     instead of spawning a unique thread for every device.
> > > >   * Modify core kernel async code with a custom wake function so it
> > > >     doesn't wake up threads waiting to synchronize every time the c=
ookie
> > > >     changes
> > >
> > > Given all these thread spawning issues, why can't we just go back
> > > to the approach that kicks off shutdown asynchronously and then waits
> > > for it without spawning all these threads?
> > >
> >
> > The async subsystem fix is something that should be fixed regardless
> > of async shutdown. Async shutdown's use just exposed its thundering
> > herd behavior which is easily fixed.
>
> Great, then please submit that on its own and get the maintainer of that
> subsystem to agree and accept it as I have no way to judge that code at
> all.

Unfortunately, it does not have a maintainer listed and sees limited
activity. Would CC-ing some of the recent developers of kernel/async.c
to ask them to review be recommended in this situation?

David Jeffery

