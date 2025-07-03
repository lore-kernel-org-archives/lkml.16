Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D5C259CAF
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 16:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751560781; cv=none; b=Oy7gHGt6IgM8O/JyoU/I/aW8Qs1eAJjwLSIe9PQ8MuwESg/d/rf04qftJ33x5v7ECmHw0InGJ4nKNut3flwNwuBlQaBugHyP8UMw9wDZWTYuazm6u80k5v6jdu3lo6Wl/aYHJOyBYhlTt16i2S23IN/JQLWbwLResFiT3tkiRrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751560781; c=relaxed/simple;
	bh=AJBCLhZWdjOBgCD1smyX71MFhrqFmFPh/WG4+1amZyU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pxKtca/H0vY/e2izRzn+pmJJ852SXu2n5h2O+tXIQ2baDWUNoXGDrIqrdSo8BmvVnzMMJACLXDuCYGUQAwo2RXnhn+Ju7HoukMnp/O3hDUg4yq87X+T8zFay0OXC72tvafvot9mB5a5qtFZhjaCRmiIFVmKJEJA3sKMSRZxdniw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com; spf=none smtp.mailfrom=mojatatu.com; dkim=pass (2048-bit key) header.d=mojatatu-com.20230601.gappssmtp.com header.i=@mojatatu-com.20230601.gappssmtp.com header.b=Nli/qseQ; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mojatatu-com.20230601.gappssmtp.com header.i=@mojatatu-com.20230601.gappssmtp.com header.b="Nli/qseQ"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7426c44e014so224467b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 09:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu-com.20230601.gappssmtp.com; s=20230601; t=1751560779; x=1752165579; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vFvcp/2SBfCsuhz1Gt3KZ5rIg4J2coSjWWNFBPpEbm4=;
        b=Nli/qseQ5GGn4qMpDZpc15eds604ciZzWvClSfi15GJMo2XKSLI1HeML8uTdXaBnbU
         Vh4Sp8q+kBl1lYDEJkzKtwolplK03Jmv7hqr29iC1/BaOPt4aRurqUAh2kMXdalf1JEk
         1pPE7zBnBWPp5hyLLadOuvJTR7Oz/r7MiSAoNW9QKbOF3SOkWiNf9nU3Nsip6oh+3UEo
         u85GUIx6BKONPpvlg0lpLdYOXMUHsm3RJbCv/HonCZWrRkX5opAduU5S8mUxpeQw1m+E
         RUrZc93dB48FoufsuqoMRQSdzWesNMKxFAQ7qXsJnqqN4T3gScMV1c8asmvvcNFeDpid
         tQYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751560779; x=1752165579;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vFvcp/2SBfCsuhz1Gt3KZ5rIg4J2coSjWWNFBPpEbm4=;
        b=TrzyCpHSBfl/fP5AmMpsqggieXtXVssaJ7S0LbJJJVFT1CajwlEoniLOuA7Tvqice0
         kJiSpLXmLAY//Ss/TtrVo42skg1+NWGBiF4i2xhCkLVnwgTE6L8Oc9sX3cPmxXcRvYuy
         Si1wg74dRB98F+sWwaQVBKD6Oo0oSySRHZpos1vLwC4Ka4xrkAK+Wpxzlnw3fLDyiG7Q
         gjo5y9Gdt3OQ5TH4oiez7pQeWUg6hi0uHX9dFmZtldv80vxRWNXbb+sM+2Xmt7mtkGL/
         ZeFM5CTVeChqt5r/vqzA1lGwh+EcCHpVwWKBphDDPeLhE1pNxp0hA56IqLjRIHdc13vp
         l+9w==
X-Forwarded-Encrypted: i=1; AJvYcCWpyiMicp7XmR6eNm4rbIcWSxtPd3KQzdPmkw/DPG8mbw/ErfxZsnr2L/SxCCAydgPrM40VS/NLxNrcMpo=@vger.kernel.org
X-Gm-Message-State: AOJu0YynwTaXZULOPeAsXkQv9MxEJPeuHiT5S05AHfn3elgewzzw55gX
	wJNjcJSRAw1Q+6Up0oVxBxkcWjvDEYSxkoA7gwLfxSKsHiUOgg6/JekavtrBKOMKmNHH++GRv2r
	bSjYduMa1hcfyiHh4dzGHS4PFEVumaNJ2Ldtvpvuc1g2s+VPAWSI=
X-Gm-Gg: ASbGncuO3oJWjNQiSVaQA5+F2qXk3H8gy0sovciGR7BsabeonbPfdugGgVzKshlHXQM
	JnPfBrKI3tplIAHle9k9n9lif9f76PE0vlcG1zP2PMRzcUaac4I54yJYOS/Av23bJFQJh2lAkvh
	wXvLKlP7j73aM8hXIZGGgcDqYkmt8j1f3Vi2HDxcj/RQ==
X-Google-Smtp-Source: AGHT+IFz/tty/KbZCIqVMSBW/IY7VmKn+WafAd4UBuzZLL76rgE18vyMvHSfq4cziXjtk/ACaLQVoVekX+BYY7KEhzs=
X-Received: by 2002:a05:6a00:1788:b0:748:edf5:95de with SMTP id
 d2e1a72fcca58-74cd165c1a0mr4540738b3a.10.1751560778870; Thu, 03 Jul 2025
 09:39:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <68663c93.a70a0220.5d25f.0857.GAE@google.com> <68666a48.a00a0220.c7b3.0003.GAE@google.com>
 <CAM0EoM=JWBb-Ap8Wutic8-7k7_+5rrt-t65h5Bv-iyiJ+JtOCA@mail.gmail.com>
In-Reply-To: <CAM0EoM=JWBb-Ap8Wutic8-7k7_+5rrt-t65h5Bv-iyiJ+JtOCA@mail.gmail.com>
From: Jamal Hadi Salim <jhs@mojatatu.com>
Date: Thu, 3 Jul 2025 12:39:27 -0400
X-Gm-Features: Ac12FXyWQz0PUHIUtvscAG_GY56CKkqB8RuzS5xnkfPHcGQKJxY1PmvlH9ooA_w
Message-ID: <CAM0EoM=TwzOF9Osb4qtHzxdBcHewKFq_nAYAqx64UTjOF_Z55w@mail.gmail.com>
Subject: Re: Lion, can you take a look at his? WAS(Re: [syzbot] [net?] general
 protection fault in htb_qlen_notify
To: syzbot <syzbot+d8b58d7b0ad89a678a16@syzkaller.appspotmail.com>, 
	Lion <nnamrec@gmail.com>
Cc: David Miller <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Simon Horman <horms@kernel.org>, Jiri Pirko <jiri@resnulli.us>, Jakub Kicinski <kuba@kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, 
	Linux Kernel Network Developers <netdev@vger.kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	syzkaller-bugs <syzkaller-bugs@googlegroups.com>, Cong Wang <xiyou.wangcong@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 3, 2025 at 11:05=E2=80=AFAM Jamal Hadi Salim <jhs@mojatatu.com>=
 wrote:
>
> On Thu, Jul 3, 2025 at 7:32=E2=80=AFAM syzbot
> <syzbot+d8b58d7b0ad89a678a16@syzkaller.appspotmail.com> wrote:
> >
> > syzbot has found a reproducer for the following issue on:
> >
> > HEAD commit:    bd475eeaaf3c Merge branch '200GbE' of git://git.kernel.=
org..
> > git tree:       net

[..]
> It is triggered by your patch. On the first try, removing your patch
> seems to fix it.
> It may have nothing to do with your patch i.e your patch may have
> opened it up to trigger an existing bug.
> You removed that if n=3D0, len=3D0 check which earlier code was using to
> terminate the processing.
>

Ok, after some more digging - this is not a bug you caused but rather
one you exposed.
We are looking into it.

cheers,
jamal
> cheers,
> jamal
