Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC0128CF58
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 08:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750147677; cv=none; b=nbw6QkmAix59pOAHVgubt1QvZIzVj6Qeu6LpwN1+f3h2DPxCMbBfq8eQ+LhMWcsNI7loDBNWUZG8cTCZYR1cCT4Bc/TSvVkSqLQPtp/w7Gx2TUXg500aENpYJQJNkh+cj0jsnBSZrLcSO+31Qy0lDGkXUfobtXBGDi4yjDifUsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750147677; c=relaxed/simple;
	bh=qC9LP02eFjdCcwHhwELwXffDQ37VNRcHuFmDlE6+KJA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fd1S8GdrtX0NRI8jAjcORL13US6pAPKf+MNsa4lQ3oi9eiU3st7YzV3V8Fzk7rLjgHWjRMyeN3NNrB3livTnxMr26udVH8Ek0/ax2RJnwIImMiilofDkolhtawISw1BfWqM9JEuONfULuMwF+eRu4A1HCFgmT4DBMrliJfd13kM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yArNxGBk; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yArNxGBk"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3138b2f0249so4905368a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 01:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750147675; x=1750752475; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LmeLrUwwnwwo3sgPhPcUqQRjTMnBauDJO3rcb03/yNc=;
        b=yArNxGBkZt7X0s2bFqC6xIMdlLwGTohinLEGM6BY/b63RvL4riikSbFhD/JRjCHeRv
         7MBcUykOqnyg2P9F9LirAFC9f/zI3/cYaSWiZx63TeC5eZQ9+C03knl74CWPUkaKLOuY
         GtFM29axZIoSHWwbCwdGpIUQrIb48JXmBbKEE7hX+cllGAY9TVZrSUSN3pORZJzVkR/H
         S/6vGXR09AbP4VXoIM6m6TpGasWUpJvMHgFvteRXG8bE1BdhO5xfX5gzUWbK9Rp/e3bs
         CGp7EMZ9Mgb/4kl0Jhe+q4gCxk2oXM8EcqmvM8RH2pASxM2VtP+9j9WtqiYqpd/LWlh4
         pkyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750147675; x=1750752475;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LmeLrUwwnwwo3sgPhPcUqQRjTMnBauDJO3rcb03/yNc=;
        b=R7dL93q1+0av8X7P7W353forJJVlCOCstcZjUhnabcyu2n81Iyl4z+gsPb2uEJjgwn
         MMvzeo3xzurPeuf416AAfHdvFPThB3p4mcFEAJ4XJ4nOOJoZS+WRzLHsmg5tMC9mDK3L
         vWSaXROTKTULkdjiP5si6RpLFjTiqfV8fp5CZ1TrCf7Zs8nV1db3PKfAw5ExaDwakQJu
         JBPTNiZgAZwq9dTbAybTsau4JqhZXWgQEffJQKEy3X8FjzwbK/sOtAij2+xGE/PIsGc+
         JXavbpwdI0ToD8bOYYQ8QZCAsG6eKcZ6B9FCb9TJP+R7YtGB8AgAwCZIaBTSbFltLbpE
         OeCw==
X-Forwarded-Encrypted: i=1; AJvYcCUrJmw26IplJP61soG5ATB9ue5OCG1TCyLpGQIip3HzoQ/RXz1J4AZmQx1xbpqFPAtwXM1qStG0crLjyU4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkPcdRVstUp3Z9JGBDPiyxVqkKhxlVsvI/2KHDC9IReQAznFsc
	a0f5tegA32EWTGiRETleseTl5PwiyN3kOsNLvCj0D+IviBocSu4l69GvqbO6WCnHcs2P+qDkL+T
	CTxq4ScRdTUJlS2kQONLH/41SnLpgp2Udh0mWls1T
X-Gm-Gg: ASbGncvFJPq+Qj4B71XN8TomURQ8P1IcB7Uel3iqsBTs4KZRgqKXxVvzBlp04QbDY7w
	S2bjJLBuIQ89GQGO4UbR9PEsJl8d03yzeYuXZtil8PrWkcXUFDNohhGhAXbM3N1UeIbv4Rsis/3
	25/LUm6s/i18s9AEQ2NvoF8Ti/2rw6EJVcvx1iv7C7UwvvBMIvOEGIaI3VqBJVs/AybSFFSgSqA
	A==
X-Google-Smtp-Source: AGHT+IG/K3xiNRrowKWZCZRWAgbDclQsYxQ5yXc4KTy2ffgH6OYptWVbiypTQUO1d6cHGt3hf4eQTqf2wTREe9I6gdQ=
X-Received: by 2002:a17:90b:57e8:b0:30e:5c7f:5d26 with SMTP id
 98e67ed59e1d1-313f1dab662mr20309855a91.24.1750147675309; Tue, 17 Jun 2025
 01:07:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <tencent_6BBB12330F9EEB1B9A4B791B262506BA6708@qq.com> <68511db3.050a0220.2608ac.000f.GAE@google.com>
In-Reply-To: <68511db3.050a0220.2608ac.000f.GAE@google.com>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Tue, 17 Jun 2025 10:07:43 +0200
X-Gm-Features: AX0GCFvQV5Ez8VWi8f1ixwaVxMJTI5PM7Y6T8IF5Pn1p6d3zBDgkx76_UgXc0-g
Message-ID: <CANp29Y5Pnbn2AkF_a_iR0_=-oQNtmzx8QkZUHfHfU0QVfYRf=g@mail.gmail.com>
Subject: Re: [syzbot] [jfs?] WARNING: fs/jfs/jfs_dmap.c:LINE at dbAdjTree,
 CPU: jfsCommit/NUM
To: syzbot <syzbot+077d9ebda84f426a6a1e@syzkaller.appspotmail.com>
Cc: eadavis@qq.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

#syz dup: WARNING in dbAdjTree

On Tue, Jun 17, 2025 at 9:48=E2=80=AFAM syzbot
<syzbot+077d9ebda84f426a6a1e@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot has tested the proposed patch and the reproducer did not trigger a=
ny issue:
>
> Reported-by: syzbot+077d9ebda84f426a6a1e@syzkaller.appspotmail.com
> Tested-by: syzbot+077d9ebda84f426a6a1e@syzkaller.appspotmail.com
>
> Tested on:
>
> commit:         4325743c Add linux-next specific files for 20250617
> git tree:       linux-next
> console output: https://syzkaller.appspot.com/x/log.txt?x=3D1479437058000=
0
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3D70c73b370b132=
354
> dashboard link: https://syzkaller.appspot.com/bug?extid=3D077d9ebda84f426=
a6a1e
> compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e0775=
7-1~exp1~20250514183223.118), Debian LLD 20.1.6
> patch:          https://syzkaller.appspot.com/x/patch.diff?x=3D10a09e8258=
0000
>
> Note: testing is done by a robot and is best-effort only.
>
> --
> You received this message because you are subscribed to the Google Groups=
 "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion visit https://groups.google.com/d/msgid/syzkaller=
-bugs/68511db3.050a0220.2608ac.000f.GAE%40google.com.
