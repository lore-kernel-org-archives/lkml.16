Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25AB025B673
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 18:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739210538; cv=none; b=ewsM25EpelMxoolIma2TfXXL/WkpekbxuvXpIBZrAoR1QDqKCcTfTQx/vgm8rTc5N+mYnXJKfR9HtRs5pWsY5fIKfWX1ChWlubCm6e3/ymDWfFdtk5dNqwAEJL7ybnGT7Qkgp2boTico3JFbCUS5SPnpIzz0Me60EohIe7Yvvno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739210538; c=relaxed/simple;
	bh=wwcW4s7lbsy3JqjN1vBCfiKwMG4uwXMR+XXdLf5vvtA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B6/tseZfZ+k3xhCjRSO+9zT2tNDEMvgAgXVfbhB96cIXcidkCxtl1ze6pwTgjv0OkpM1gawoDRcWgz53atr89DEStcIXX/68xYCEfcId5gbjZ3HnVSmTGdZ5d6gatYqeSRHTqAxs+cqQxFJvBWvVDb0ooFgVrI5w91QxdOJwfUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=T56q+nxa; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="T56q+nxa"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5de63846e56so4084055a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 10:02:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739210535; x=1739815335; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P1AoIYKhUQYthkM+b7DM+PhCN3E0YRDQtLY8EwoTFpE=;
        b=T56q+nxa6yPJcHTCthH1/w1jksJDhQRHsrYmDIEDB6ZUkJMhiWVMF4LtfhpXlRtKrj
         Md31fl1dXwZfoSzWiuvNfROxziTB+/JsmnXYexg1R+o1GmQzgfe2mxdw3kxVjwrVqv4C
         Tqin7AYcfgitfWwGQH8Ohsx0jA8StT1NYh9Zu390T9kuIfY/tkDoAmHR2von7sshUuBY
         8uo0F49t2Oue2RSz4MFpRUSqDhfAkOg3VGu4XUyiMeZnmWBls/d/erBz8iBim+EpQiaR
         EYAkAB2/rqnJHaEKjTbI6Z+S99xKldHScNk44pnIbYugcFvIUCOS2/l0idDU3l9MAfbT
         I4Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739210535; x=1739815335;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P1AoIYKhUQYthkM+b7DM+PhCN3E0YRDQtLY8EwoTFpE=;
        b=EMugumZCGKx4DBsjE+KMTM0VYNjYr8e8yvB/jWTsiQ1JQBzxWCUVFnxtzngq/bn07m
         gw0hQTddUyWr5400d4TnKm+5Fes6F8dPwQuQIsVHvQPwonCs+vw2g6C+d41h0XU/7aR9
         HUdh9fpIk8L1Uk+YLI1yhIyXEqN09nNT40dvwTPC/SX3UixBBgChRQ6+KiI055NlGscW
         LBD66HGQ3zdEHKrOPC2UJPlfVLphMlVxHDB/R6/9iox0gjowSswV3LArnQ3D0mHLdgeB
         oShI0Dg8MR+H6U7z9PsINtBoAua6LVc1qpWINpTDEaS0wJVCLH3LQStATREciWsbLahM
         xAfA==
X-Forwarded-Encrypted: i=1; AJvYcCWwUv53ww48mm8g94MsoGZkI9AP/YYDppW8pJ+rUw0Rlnbw/v/sgt5NakSpEcT69wr+VVSTT9OLND3LqjU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjpkAWqMvcu1yABpXSpwZqz7lXJql4aQK2cX5W9ql542rCucAe
	Z8EUk2dyiLLsMfvcAiTgEPXgwz8a+2KYE3hqNZYYB61ARle1dTsmpW0UB/n0cjdGGDVgEwWQKln
	PBO6tVM/1c9/T8djNfCFPHEZjvDvIgWvXRGnK
X-Gm-Gg: ASbGncsTBJHCSlnIRCbdOSFGSlNoxzIQejuZbdXObgkdg2ugSu5kznvem8w1vcqmpgJ
	Rx98uq3qo36qlse9YoCZJfJP7hf1vpVagnBJSlc+q4fNGc4580xoI7zQh5iJ+0n2uWwB4U4pB
X-Google-Smtp-Source: AGHT+IH8ZKlmWqGatL/05q4I6EbeYv/I4UekMZL/f53Hy1oqHjOPi2I1z6w+sAY/m4ExME8ZsLPOdDIiRqtNW3QmL0E=
X-Received: by 2002:a05:6402:254e:b0:5dc:7374:2638 with SMTP id
 4fb4d7f45d1cf-5de9a394514mr562968a12.7.1739210535283; Mon, 10 Feb 2025
 10:02:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1739162392-6356-1-git-send-email-shradhagupta@linux.microsoft.com>
 <1739162428-6679-1-git-send-email-shradhagupta@linux.microsoft.com>
 <CANn89iJ3cT6BWLmFpdkxn6EeeLTM7rF0pwWGArq1gG8pk8orsg@mail.gmail.com>
 <20250210175753.GA17857@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
 <20250210175931.GA18891@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
In-Reply-To: <20250210175931.GA18891@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 10 Feb 2025 19:02:04 +0100
X-Gm-Features: AWEUYZmLsYoZEOH6YNuIVHjfw7eUJXLBkixuRMkcVqPr_NV6iDzV95fpJeh3KUo
Message-ID: <CANn89i+ovDB+qLBV3DEx5eB4vDZq=X+rWUZgR7qHjDLc4=UN2w@mail.gmail.com>
Subject: Re: [PATCH v2 net-next 1/2] net: mana: Allow tso_max_size to go up-to GSO_MAX_SIZE
To: Shradha Gupta <shradhagupta@linux.microsoft.com>
Cc: linux-hyperv@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, "K. Y. Srinivasan" <kys@microsoft.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Long Li <longli@microsoft.com>, Konstantin Taranov <kotaranov@microsoft.com>, 
	Souradeep Chakrabarti <schakrabarti@linux.microsoft.com>, Erick Archer <erick.archer@outlook.com>, 
	Shradha Gupta <shradhagupta@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 10, 2025 at 6:59=E2=80=AFPM Shradha Gupta
<shradhagupta@linux.microsoft.com> wrote:
>
> On Mon, Feb 10, 2025 at 09:57:53AM -0800, Shradha Gupta wrote:
> > On Mon, Feb 10, 2025 at 04:55:54PM +0100, Eric Dumazet wrote:
> > > On Mon, Feb 10, 2025 at 5:40???AM Shradha Gupta
> > > <shradhagupta@linux.microsoft.com> wrote:
> > > >
> > > > Allow the max aggregated pkt size to go up-to GSO_MAX_SIZE for MANA=
 NIC.
> > > > This patch only increases the max allowable gso/gro pkt size for MA=
NA
> > > > devices and does not change the defaults.
> > > > Following are the perf benefits by increasing the pkt aggregate siz=
e from
> > > > legacy gso_max_size value(64K) to newer one(up-to 511K)
> > > >
> > > > for i in {1..10}; do netperf -t TCP_RR  -H 10.0.0.5 -p50000 -- -r80=
000,80000
> > > > -O MIN_LATENCY,P90_LATENCY,P99_LATENCY,THROUGHPUT|tail -1; done
> > >
> > > Was this tested with IPv6 ?
> >
> > Hi Eric,
> > yes, sanity and functional testing where performed(manually) and passed=
 on azure
> > VMs with IPv6.
> Forgot to mention that the tests were performed on both IPv4 and IPv6
> and these numbers are from IPv4 testing

Where is the IPv6 jumbo header removed ?
