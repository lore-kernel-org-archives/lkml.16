Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A26E199EBB
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 04:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744604642; cv=none; b=q31oXO6ytEacd5CzSC4LEPAeuOMUGmvluv5dz3pXUeCDe/y63YWDlRsRzn3l2WgP6zylmm0BhjorXlx8ovSSkO12+8naiMOSjO5k+gtkNo/eWSJ7B4FhGNoRf6k7TqILzyCh/O9aq/g7yy5z8/22+vVOlPHNjOu03DsLj2//wTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744604642; c=relaxed/simple;
	bh=GWSTSTj5Bi+IH0R5CruPau9fafbM4cxQUNt4l71H7HE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i3Qln6dTFwcw7S3Nw4STSghjnlKIPkHdbws79RlHH1KC919n9k8OQLZgqmwMvb3MLHPzoP6E1nj0ZBabRCKeOZZgfnpFD5rXmjbdYPpl0yYLVgZkrDo8e9x+H/ChT/j660Ol2E/gczsARTGbW91sOOS2lvpU+GwmKXTIFFHFqkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=TaHORxwJ; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="TaHORxwJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1744604592;
	bh=vcBvQjCcKGTrIg0j33ponHXhhjiRBvJT7ni4uKW+6io=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=TaHORxwJGjkMlWQ6DvaiSFcDHwBjhirleE0buc6RI6VHC78POrZc0tliKnMPTYelT
	 4kQJpokI/Tcb3C57+lZmh9ITPrumkQ+dgbr/aTtP/is4GVidhGPa6hguQ2cMxukD02
	 e81ScJgzTIDpIzmF6vML1OM7mBHybb9xIrlG6uLY=
X-QQ-mid: zesmtpip3t1744604581tfe496c65
X-QQ-Originating-IP: 7C3dqLLuc1N76D3N37XRg6r6cRRotqPQhGGx9dlUBM0=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 14 Apr 2025 12:22:59 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 2176129901492631011
EX-QQ-RecipientCnt: 8
From: WangYuli <wangyuli@uniontech.com>
To: akpm@linux-foundation.org
Cc: mingo@kernel.org,
	tglx@linutronix.de,
	linux-kernel@vger.kernel.org,
	zhanjun@uniontech.com,
	niecheng1@uniontech.com,
	guanwentao@uniontech.com,
	WangYuli <wangyuli@uniontech.com>
Subject: [PATCH v2 0/5] treewide: Rename del_timer[_sync] in comment
Date: Mon, 14 Apr 2025 12:22:51 +0800
Message-ID: <37A1CE32D2AEA134+20250414042251.61846-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: OEX5jM8j0kQw+Gu5BKbslAGhc5b8avFee4gxKM6JLNOACBEL+nLTpTlF
	ymJi95IerpekFu0jQITKuyF+fmxZ974+rONAj7Wgg/POHUuV1EsUJeAKgUF0KZfUZLlnQOj
	qcoCTLJNR+gghcFT/rooU3VOsyYX6mbPj8L7jlb+Pr+65PfxBJ3ZNQ7cz5KS4iiPyt+apdZ
	WpWN0k9mg98eUOX+YbredEj28BVAz+vsS+i0+D1fvCmLNEF9XaRmkL8FrNZp3mvcV7NIys5
	Ua9Yd2xxZ+E2Og/rEUjArAAoBw8DXLertZ/Iut9aQpqFdTtlio8PsDxkAYvmCB2ayiN6bD3
	7MPnRXT4GHI7WmVhLwatPuE4ge+cz7Dldh4tjVJ9FXgBaZ+B4oUjYJyR7+NurCXjsXuUa8m
	owSK3H72KrNjg3w1jN2FEJhGNP+l4yJiSUI1Vte835O7neeeQM1Etno/YnqUUD6W5pHNTp6
	qZ/LpsXVYQZXRlQ3ZNgrZ6SSFuh369CJRMjsOkeYb1vAJoHTKYmGnSptBSJbgmCMrocsiUk
	s72SGhPYJBew1vTKSqSCrfFeXhPGgCgAl1oa+fSBNfAWrKkTia6bhEHAEago3LF4hfrNR7b
	RJOX5JTms+8ljzXAwAsvMGBy+YVF1owJM7SzU3ETJdAZ4bvRyS/LGT2d4D0A9jJ9CRatkE5
	lpWtqjr9Ao7EMpJrPERgOvuf5NWsycVGbPDzxKd4CYSnEEEn5cKhYaLhMhu23etvfG97hFw
	hVdA3fan697a7Hr5n6OOH73/MTcPQ+L67jA2V39j5+39PgWUcT5JZ3uI3ydHqtU9ZihJSYY
	jM1zby7XQos5CInMHC4p29+iubr1d+5+9d3DTERNqtx3VOWb5SHiKxjPRIJGPuwJcFskw1F
	UmNmhKlCgJasFskCMI3ZzR7Z0qAqV8mTMbyZoddaCr/B0zRCWm4PY3gQ2lf0XTecc4i0sn8
	F8G936yaMuiF0sTPNLfNd0OPEyghbCu5vlzmBaEn0QAsbt+xxWv1+elQLTADglbhvUEktFU
	RSz5OJZg==
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0

Commit 8fa7292fee5c ("treewide: Switch/rename to timer_delete[_sync]()")
switched del_timer[_sync] to timer_delete[_sync], but did not modify some
comments. Now fix them.

NOTE:
  1. This is not a straightforward global replacement operation.
Certain changelogs located within comments should be skipped.
  2. Commit ("cfs2: o2net_idle_timer: Rename del_timer_sync in comment")
has been already added in the -mm mm-nonmm-unstable branch.[1] This change
introduces the addition of an "Acked-by" tag from Joseph Qi.[2]

[1]. https://lore.kernel.org/all/20250411223021.73435C4CEE2@smtp.kernel.org/
[2]. https://lore.kernel.org/all/207bef0c-c26f-49c5-8c08-c89e0eab9c45@linux.alibaba.com/

WangYuli (5):
  bna: bnad_dim_timeout: Rename del_timer_sync in comment
  ocfs2: o2net_idle_timer: Rename del_timer_sync in comment
  scsi: scsi_transport_fc: Rename del_timer in comment
  ipvs: ip_vs_conn_expire_now: Rename del_timer in comment
  ALSA: korg1212: snd_korg1212_prepare: Rename del_timer in comment

 drivers/net/ethernet/brocade/bna/bnad.c | 2 +-
 drivers/scsi/scsi_transport_fc.c        | 2 +-
 fs/ocfs2/cluster/tcp.c                  | 2 +-
 net/netfilter/ipvs/ip_vs_conn.c         | 2 +-
 sound/pci/korg1212/korg1212.c           | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.49.0

