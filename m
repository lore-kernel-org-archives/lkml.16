Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A51266568
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 15:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750435015; cv=none; b=Di9FgS8JQEjow1aiHs0/yyYOeE+HgMkQIrVsUKiOpP9Od4z+NzwzAbnKGPbAnpgSh4qCedz7/W7Jn/uSfRSBJoZPE8b0FaVQteeJ95UcWddtDjnSdshvSiTH2rNw6kmFRdIRSUGMU7+vkR7W2fgPwERvENZ8ZEs263jSnpQaljA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750435015; c=relaxed/simple;
	bh=uvxBpESCMbHsgEzjJh55zIXNCELP+P6fl0LG0UEW5u8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F6sF1ZqC/s7EkQRzBRCVIqZ1t4XUHpwL0BXwZvEUMOmzTYuiOmtUeBdqV2DeDWYMno/PXsXBN3fY5qMwMB5rXeaoUyaxOBp/CjjliBSyFOW07qvZ4bAbxBgAU623+16MNFIhAbaeqYNsiIrXMmVkXQJZ8JKWdxfxz3g+kGP76Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VntyLvqX; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VntyLvqX"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-31223a4cddeso1476726a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 08:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750435013; x=1751039813; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jLFMN9XGHEQncN/Rk0oc/2KOZAjQWflIL1sv4KEiWjw=;
        b=VntyLvqXK38iTRkc7avjExvWzAJyhgURw6AKV+BBS7BR8EIgcJHCY95z/E3NcIiaEV
         lWIbl+FaueDupkLEPkgaTHiCHAqT8mmdKyyUI99/BXmIcnwHa1rLKeJkNzJ/EDAPwG90
         oqc4LpI+jjfQvYbt4bP+m3h0SEtkRW1aPM8cIB/YH6jXt1yvwS4wHuYF8vpkP/PnIXbF
         dZYtmsV0JooeLvDxnG4nMqMiScukYfHH83w4m1Q+OOuQoCY+FWxNMiub+zUOtBafDUYZ
         gozSGhsgt/UisYqkOM/B6CEW04LFwT9hHLw7M05SPgm9x+fqkpvuXcFt2TrgkE9CREO0
         c2Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750435013; x=1751039813;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jLFMN9XGHEQncN/Rk0oc/2KOZAjQWflIL1sv4KEiWjw=;
        b=v/FDDaqeyD6rgiitTlicVrFBiNTsI258uZLEQjm7SdTX9/YQcuYFMw5men3kuNLj1Q
         sjsm+e7X6YUluCkq+BVpNbugYSj9kOMVc1PCNkmiyH5p04fOivXOljoJoQnU2dLkUCQm
         DnNdnxLLDsvL1nWwrWEj74zFV2tNHcaI+C9LRhcNPy7yVtFDNxRTJs7OGwvPAVdpx5YJ
         o5FM9VoEF9l1jxp7ElrKhI2CJQ+M8XWrm5kN+yQtW4Hqwqs8aQtzb/vUMFQp08xPSDD2
         IaI/odTRNp+Tsckc2o6xcFU/gDak5IS61ccf1ww1NIH5VndLd5/H4HPQqVr64ZBRj3sv
         zMOA==
X-Forwarded-Encrypted: i=1; AJvYcCVxBJuqMIjU4aI0Zqaogeo9F+5dvmFa/TXHbWgaB9Yzu3oHqVuVTBYQOhO3/HAD9Y9nowh9fEUbAEB1Lng=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywwi52n+4TQ5Kt8rNXp1t06Ue5qqgseWr8TOa/C+vx7JcrWlbaO
	kODjgxL9Z1NnKPW/WjIymvQyTaEbk94LO+MpS/7tfcsIL1DU067ElCwiMwrlwv6sUz/TxtFrIt1
	4ucMD/Xz/7yKniJpAApJMI5WAgl9927fZ5vGyrlFl
X-Gm-Gg: ASbGncuZbanhupzXp5qp2bH7Oa+lzY6J64tuvfOJGaffWknVqBpwRRuOdOVUo4o6zd5
	6Ei/Vqk7xuoC/+RCI5dscmCq4UkoY+y+X32CnMA+80ABrxoJisBHb0Upfh3dwgmLnXc+TXc6Nfa
	jq4NOg5Ra2osO0Sgp09zj0TjwaPtwDhPOJgW87CkuD4Z8FKu9qxzGN5gQPkCE3qJ5gDA33RmtTi
	sM=
X-Google-Smtp-Source: AGHT+IGlC42zb8vDWg4AdcpNBkw6kQLXOVdEVVhKiKEi+FEf8PRmfMjgtqSTDp9VyYGZrA0DQNlEsR0V9wYodBKb4jw=
X-Received: by 2002:a17:90a:d888:b0:311:be51:bde8 with SMTP id
 98e67ed59e1d1-3159d8c532cmr5647414a91.20.1750435013192; Fri, 20 Jun 2025
 08:56:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <68552aae.a00a0220.137b3.003f.GAE@google.com> <a3781077-5f71-45e1-bd73-1a85d927fecd@linux.dev>
 <8a3ec239-7504-4c1a-86e7-4911be42e0a0@linux.dev>
In-Reply-To: <8a3ec239-7504-4c1a-86e7-4911be42e0a0@linux.dev>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Fri, 20 Jun 2025 17:56:40 +0200
X-Gm-Features: AX0GCFv-ONGi5vchutHvuFs0_g6k6clWB_YsqBacDdJpJXEBWBX-aVyBHib85Ko
Message-ID: <CANp29Y5yssN5p-QwyB=ci4HwY9EUSC0aKcAenU_CyXiu_zhxFA@mail.gmail.com>
Subject: Re: [syzbot] Monthly rdma report (Jun 2025)
To: Zhu Yanjun <yanjun.zhu@linux.dev>
Cc: syzbot <syzbot+list130c9052d10c27bfc9e9@syzkaller.appspotmail.com>, 
	linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jun 20, 2025 at 5:24=E2=80=AFPM Zhu Yanjun <yanjun.zhu@linux.dev> w=
rote:
>
>
>
> =E5=9C=A8 2025/6/20 8:12, Zhu Yanjun =E5=86=99=E9=81=93:
> > =E5=9C=A8 2025/6/20 2:32, syzbot =E5=86=99=E9=81=93:
> >> Hello rdma maintainers/developers,
> >>
> >> This is a 31-day syzbot report for the rdma subsystem.
> >> All related reports/information can be found at:
> >> https://syzkaller.appspot.com/upstream/s/rdma
> >>
> >> During the period, 0 new issues were detected and 0 were fixed.
> >> In total, 8 issues are still open and 65 have already been fixed.
> >>
> >> Some of the still happening issues:
> >>
> >> Ref Crashes Repro Title
> >> <1> 462     No    INFO: task hung in rdma_dev_change_netns
> >>                    https://syzkaller.appspot.com/bug?
> >> extid=3D73c5eab674c7e1e7012e
> >> <2> 338     Yes   WARNING in rxe_pool_cleanup
> >>                    https://syzkaller.appspot.com/bug?
> >> extid=3D221e213bf17f17e0d6cd
> >> <3> 72      No    INFO: task hung in add_one_compat_dev (3)
> >>                    https://syzkaller.appspot.com/bug?
> >> extid=3D6dee15fdb0606ef7b6ba
> >> <4> 50      No    INFO: task hung in rdma_dev_exit_net (6)
> >>                    https://syzkaller.appspot.com/bug?
> >> extid=3D3658758f38a2f0f062e7
> >> <5> 28      Yes   WARNING in gid_table_release_one (3)
> >>                    https://syzkaller.appspot.com/bug?
> >> extid=3Db0da83a6c0e2e2bddbd4
> >> <6> 5       No    WARNING in rxe_skb_tx_dtor
> >>                    https://syzkaller.appspot.com/bug?
> >> extid=3D8425ccfb599521edb153
> >
> > To this rxe_skb_tx_dtor problem, I think I have posted a fix. Do you
> > make tests with it?

In general, syzbot can test patches for the bugs it reported:
https://github.com/google/syzkaller/blob/master/docs/syzbot.md#testing-patc=
hes

But syzbot hasn't (yet) managed to find a reproducer for that specific
issue, so there's no way for the tool to test the candidate fix.

>
> Should I file an official commit to confirm if this problem is fixed or n=
ot?
>
> Yanjun.Zhu
>
> >
> > The link should be: https://lore.kernel.org/
> > all/6813a531.050a0220.14dd7d.0018.GAE@google.com/T/
> >
> > Best Regards,
> > Yanjun.Zhu
> >
> >>
> >> ---
> >> This report is generated by a bot. It may contain errors.
> >> See https://goo.gl/tpsmEJ for more information about syzbot.
> >> syzbot engineers can be reached at syzkaller@googlegroups.com.
> >>
> >> To disable reminders for individual bugs, reply with the following
> >> command:
> >> #syz set <Ref> no-reminders
> >>
> >> To change bug's subsystems, reply with:
> >> #syz set <Ref> subsystems: new-subsystem
> >>
> >> You may send multiple commands in a single email message.
> >
>
> --
> Best Regards,
> Yanjun.Zhu
>

--=20
Aleksandr
