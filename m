Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D443FFD
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 11:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743421915; cv=none; b=lTZa2ak/KfHlfBJzRC8bNKVgQOKPDIO6t7eeDt/62Vw5NBZhCMRe6ivsfFrMk1bKoEi6sx8CJZxCwbJOA0bGhty8XC7dgA5BCtW2m/6oDCxBb5dxhCMEKTM2ZHbAYp+gDW9pAZwvF0lKhq4Z2lsYywv53bsM1SJWq+qu0UDNeGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743421915; c=relaxed/simple;
	bh=JYasPDyd31+lthnRKb/rMR49kUASPtsi3cElSCnTw1g=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=czgXO0+lv9N3XZ390HFp04tpoxtLqXZE/S0Mp5YmJD8xAqSU+9ySCdzGm8ydTQouahka3pScqGXYVdNYiHRu32xbOAV7+lWt+MOjweGkonjOGPDQ5aDrgq8dnUUTQ13ErfpGvR10tAE2EdhYz7s/l+qh1Ng9Djy2ZRtKXeW5Xpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=po5Lu4iE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="po5Lu4iE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0597C4CEE3
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 11:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743421914;
	bh=JYasPDyd31+lthnRKb/rMR49kUASPtsi3cElSCnTw1g=;
	h=From:Date:Subject:To:Cc:From;
	b=po5Lu4iE6/RTvzsNy1hQadtjag//xTaWnIjqKv8+yv3Jhiion0V+1iqmPJl/YCw3n
	 EhUXxUp/cPI6VDNo+K3adYf6SAmVA57ZXqwthTxI/p9pFE/Bdjw1Fe4zzIUdp0iIOA
	 zFDh3GmhNkrOCBDi1eb/b4MkGjTzvkVg5hgIA8chYEozwXUp1hMczueptficdPhl6e
	 oCtthfl5BpRh1ZlfybcD9F74CVcIrdpJKGPZJG6w+RbF5/AZKSSk29HH4/LMNuziOh
	 NjNpxaW/5FFDrRve/nYIPt9FjD5rd6fYsHWVznauY6ygUpBnqLEjj9cWkFvANshchD
	 cRxMmaTWHfigQ==
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-2c82007eaadso1307032fac.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 04:51:54 -0700 (PDT)
X-Gm-Message-State: AOJu0YzB4XiJavVBFujmvOaIpD+E/tBdU+fc73meMoBRm2buRgng/zR3
	DwEj33K4L8htlL5EHC0DD3crHb9pE7tV5ByM6gn72mQMhLNv3CoI4K+jquoJrAcWF/tY6MqVtIT
	PUsogFPbqsjcrBpUhNidPbZ9Tpa8=
X-Google-Smtp-Source: AGHT+IHY+ChbEZueJq5rkht6+r0myphBxVQC9Crs2thNcli2u2MNsq/ftoxwVrMl8Z7Wi0ixMWnDpC/EXUOQLgov9x8=
X-Received: by 2002:a05:6871:7bc2:b0:29e:4578:5f74 with SMTP id
 586e51a60fabf-2cbcf474c24mr5183736fac.4.1743421914226; Mon, 31 Mar 2025
 04:51:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Mon, 31 Mar 2025 20:51:40 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_E0eM8dfoU1HVQ+DW4YKMsrzfJbGTsQELjfy=R+omndw@mail.gmail.com>
X-Gm-Features: AQ5f1JrJdhXu6R9lCxriX6sA8cwbwS-r2QQ5-xffNh_2g-8QJXClWi6htIuJXNU
Message-ID: <CAKYAXd_E0eM8dfoU1HVQ+DW4YKMsrzfJbGTsQELjfy=R+omndw@mail.gmail.com>
Subject: [GIT PULL] exfat update for 6.15-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sungjong Seo <sj1557.seo@samsung.com>, 
	"Yuezhang.Mo" <Yuezhang.Mo@sony.com>
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

This is exfat update pull request for v6.15-rc1. I add description of
this pull request on below. Please pull exfat with following ones.

Thanks!

The following changes since commit 1a9239bb4253f9076b5b4b2a1a4e8d7defd77a95:

  Merge tag 'net-next-6.15' of
git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next
(2025-03-26 21:48:21 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/exfat.git
tags/exfat-for-6.15-rc1

for you to fetch changes up to c73e680d1f84059e1b1ea82a537f6ccc1c563eb4:

  exfat: call bh_read in get_block only when necessary (2025-03-29
22:03:11 +0900)

----------------------------------------------------------------
Description for this pull request:
 - Fix the random stack corruption and incorrect error returns in
   exfat_get_block().
 - Optimize exfat_get_block() by improving checking corner cases.
 - Fix an endless loop by self-linked chain in exfat_find_last_cluster.
 - Remove dead EXFAT_CLUSTERS_UNTRACKED codes.
 - Add missing shutdown check.
 - Improve the delete performance with discard mount option.

----------------------------------------------------------------
Sungjong Seo (3):
      exfat: fix random stack corruption after get_block
      exfat: fix potential wrong error return from get_block
      exfat: call bh_read in get_block only when necessary

Yuezhang Mo (4):
      exfat: support batch discard of clusters when freeing clusters
      exfat: remove count used cluster from exfat_statfs()
      exfat: fix the infinite loop in exfat_find_last_cluster()
      exfat: fix missing shutdown check

 fs/exfat/balloc.c   |  14 ------
 fs/exfat/exfat_fs.h |   2 -
 fs/exfat/fatent.c   |  31 +++++++++++-
 fs/exfat/file.c     |  29 ++++++++++-
 fs/exfat/inode.c    | 142 ++++++++++++++++++++++++++++++----------------------
 fs/exfat/super.c    |  10 ----
 6 files changed, 140 insertions(+), 88 deletions(-)
