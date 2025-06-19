Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0AF288A8
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 03:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750305040; cv=none; b=tcxX7yFh2ZXW7lIJ57KEI52YimvTbl97mimVohq7n5CrPV3XtvmbaK7AOjXYzQERxgjFHG0/etstxi0k5vgnV+OLNZQkiXR6/QIKAW7Gb52qH3ALofQcoICkNc7QGI5AeoBEH2tx7EUMzGOlYQUjrgd1OBEF5xQ1/Z+bHG/JB0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750305040; c=relaxed/simple;
	bh=pqrw6/9BHgywfLi/lqVFm9DkWmg99AULXG9dRn96nww=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C/YKL8KPXBr7WgxaUYOfiet1IFbNZiROcqLyLfBB9IF7CQ3RK/PJcYdBnK7PT8eKjkrt+w75gmqwO90EhbJqu/8N42Mlk9pGrnBAJJaa9xn/z9CaOuby/HV52mqdK2lDGJt1+Mt7NoJuqwBhi9fwb69BdMrUEjFNRKTKnTFXC/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=et0by071; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="et0by071"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-553be4d2fbfso275088e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 20:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1750305037; x=1750909837; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YolbIVvniBT6751HPBANG23kZ3+67ebn78JoEy5EXfU=;
        b=et0by071JYesZMGFbJS/1l2LxGRkML9qAC3ulbjxsL4HJuoxN1+AzccOvDeZ9u5KI7
         U1PNGnn+UNaqIY84DwMjXUMITUuxP7fFBVN13sKeZYjIYI+vbpbkROfQ7T5ZeAwpOqdn
         8vPnb2nXb6rjl2bQZVXvQgQWiRClrI80Ly4F8Xnr5WloopWp6It3bLVAdymPDF0nSvJ0
         4xm2FtA0+vaFQLsvbzHRyl6NgaNZJCjmlxMRHK+5ehoJAuubHxyVikepbel3l4FzgBJd
         RZFf3MQt14Aj+NeMx8dUfoKOlWC/+pknWu8bCZ3lbL5Bcd3uAH9LWtspcVn2bFW6pFxm
         iQBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750305037; x=1750909837;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YolbIVvniBT6751HPBANG23kZ3+67ebn78JoEy5EXfU=;
        b=c3+/zh+0TGdmE+bj3VqctD2tT6nAcel/PKqiPVzfq3wP4ybXSmp9ydJajgP6I2LHqs
         rjPBtfN/lRKJE9ER26SL8XXwG5ox8Wh7h9Cyx7MLbp113nvdjSyNv+oI3sgWos8GYQJ7
         ti2AEllc5cnOxEfd0yk8gg7slFkwCpLoeEjmDlu4r/6alVtw+bnQilS4MvpHEm0/F0pn
         CH6sZFrd1ssl8O2QLppHD6JWBj957rNm8xAaDABZovc9/fUI5YxRk+xXgszfR8YvuURj
         MqviIIF8R46zPQXBpz16mrPVyzVi6ppU5hDqBqHyWCUOl0W4Rx4+HRoaV41OO50396d1
         FWmw==
X-Forwarded-Encrypted: i=1; AJvYcCUdhqvODyzaa9lruxTDTm08ywwCS5wrjnEi+8MClsNbW6aOCmsBa06ao6FN5mnnBk5aZsvpbN4F6mtTl5w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcjUvfjGtQG/emugoDBC1eGxwWNA0ckBW5VCJIV9NWtjuvAWxI
	euFOW8AM7dmXB6VEG0T4MGenPmGxfAfcqzaMp09pOp/AJTjTKtDKWhHgAH+Pe5DU0Uzo7H8Y7JU
	aD1Xoh8AyMsTXox9fuBxmKGpwFJtwx5kr5VEIg7sITA==
X-Gm-Gg: ASbGnctTppt8SSbzvULC1LvAe2E1AjseDc0qXwqUVjZ7tOTdIQcnlNST8jYULnJJgUN
	BUwuHwHZ9sssDCjhPoLduRKRKeexNVyLF8OM5mpqP+zI0TibIR0VbrgFmqonBhkZdr8fwAdcciV
	ieKxtYH8mM9K/iBlCWKL0EYnYJ0zHQ3wjyzOlqrYBIHDHymrR9t33anzoOCA==
X-Google-Smtp-Source: AGHT+IHpltUrLNuq9nIorOoo+2iB2Q1zkjadBe7Khn4P/l9/IDmG1oDSjSumBXfasQEgDqAn9JdNEGve8qxaN277HJw=
X-Received: by 2002:a05:6512:3989:b0:553:543d:d996 with SMTP id
 2adb3069b0e04-553b6f0f91bmr5767343e87.33.1750305036765; Wed, 18 Jun 2025
 20:50:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <8029d719-9dc2-4c7d-af71-4f6ae99fe256@redhat.com>
 <CACSyD1Mmt54dVRiBibcGsum_rRV=_SwP=dxioAxq=EDmPRnY2Q@mail.gmail.com>
 <aC4J9HDo2LKXYG6l@slm.duckdns.org> <CACSyD1MvwPT7i5_PnEp32seeb7X_svdCeFtN6neJ0=QPY1hDsw@mail.gmail.com>
 <aC90-jGtD_tJiP5K@slm.duckdns.org> <CACSyD1P+wuSP2jhMsLHBAXDxGoBkWzK54S5BRzh63yby4g0OHw@mail.gmail.com>
 <aDCnnd46qjAvoxZq@slm.duckdns.org> <CACSyD1OWe-PkUjmcTtbYCbLi3TrxNQd==-zjo4S9X5Ry3Gwbzg@mail.gmail.com>
 <x7wdhodqgp2qcwnwutuuedhe6iuzj2dqzhazallamsyzdxsf7k@n2tcicd4ai3u>
 <CACSyD1My_UJxhDHNjvRmTyNKHcxjhQr0_SH=wXrOFd+dYa0h4A@mail.gmail.com> <pkzbpeu7w6jc6tzijldiqutv4maft2nyfjsbmobpjfr5kkn27j@e6bflvg7mewi>
In-Reply-To: <pkzbpeu7w6jc6tzijldiqutv4maft2nyfjsbmobpjfr5kkn27j@e6bflvg7mewi>
From: Zhongkun He <hezhongkun.hzk@bytedance.com>
Date: Thu, 19 Jun 2025 11:49:58 +0800
X-Gm-Features: Ac12FXx40uf43iyBgKM0BLFSLGPsXPQ2pByqjOiXn1b6gvpuapC4lhHK5kvY7Zo
Message-ID: <CACSyD1MhCaAzycSUSQfirLaLp22mcabVr3jfaRbJqFRkX2VoFw@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] cpuset: introduce non-blocking cpuset.mems
 setting option
To: =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>
Cc: Tejun Heo <tj@kernel.org>, Waiman Long <llong@redhat.com>, cgroups@vger.kernel.org, 
	linux-kernel@vger.kernel.org, muchun.song@linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2025 at 5:05=E2=80=AFPM Michal Koutn=C3=BD <mkoutny@suse.co=
m> wrote:
>
> On Wed, Jun 18, 2025 at 10:46:02AM +0800, Zhongkun He <hezhongkun.hzk@byt=
edance.com> wrote:
> > It is unnecessary to adjust memory affinity periodically from userspace=
,
> > as it is a costly operation.
>
> It'd be always costly when there's lots of data to migrate.
>
> > Instead, we need to shrink cpuset.mems to explicitly specify the NUMA
> > node from which newly allocated pages should come, and migrate the
> > pages once in userspace slowly  or adjusted by numa balance.
>
> IIUC, the issue is that there's no set_mempolicy(2) for 3rd party
> threads (it only operates on current) OR that the migration path should
> be optimized to avoid those latencies -- do you know what is the
> contention point?

Hi Michal

In our scenario, when we shrink the allowed cpuset.mems =E2=80=94for exampl=
e,
from nodes 1, 2, 3 to just nodes 2,3=E2=80=94there may still be a large num=
ber of pages
residing on node 1. Currently, modifying cpuset.mems triggers synchronous m=
emory
migration, which results in prolonged and unacceptable service downtime und=
er
cgroup v2. This behavior has become a major blocker for us in adopting
cgroup v2.

Tejun suggested adding an interface to control the migration rate, and
I plan to try
that later. However, we believe that the cpuset.migrate interface in
cgroup v1 is also
sufficient for our use case and is easier to work with.  :)

Thanks,
Zhongkun

>
> Thanks,
> Michal
