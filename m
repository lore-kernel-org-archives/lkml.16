Received: from r3-20.sinamail.sina.com.cn (r3-20.sinamail.sina.com.cn [202.108.3.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883E425E839
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 12:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750855415; cv=none; b=mDNjyPg68Ppx6Uaku66bxtfe+1tRVJcdo25+SSvl918bBxoVuV+aNdQpfz/8XWVvldaR6b70d8x6DzXXKG5SRiGym6TaYukjBmM1gzXrduFCwJfSzanLQNJCIK4LNZr6e9P5WefoGC07dgVnVUbfIgfx20WE/HELlM6g1qrwEto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750855415; c=relaxed/simple;
	bh=Dg7mH0vwJEi2eAh5xEyPZOekPMs11EObN+kXsnWP8fs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l50+JclYIHRKo+1sygt33Dpz4botXB9pyLq2s1WRBmexn/LZqKYbqGQ7dX6GToVWhxDabfZbYxUXzDPoV5rzzjk/NCukKJ1opN2U9cO2U1QeeU2jnFdesrYp/UH5tyt/i3erbupQupI28woxL6rS1XbSbgxL3N6pgM6DoccKemw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; arc=none smtp.client-ip=202.108.3.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.58.236])
	by sina.com (10.54.253.32) with ESMTP
	id 685BEE5E000047FB; Wed, 25 Jun 2025 20:41:04 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 2724294456994
X-SMAIL-UIID: CE051FA91B6D46C19CB0EFFAAB0AF47D-20250625-204104-1
From: Hillf Danton <hdanton@sina.com>
To: Qu Wenruo <quwenruo.btrfs@gmx.com>
Cc: Edward Adam Davis <eadavis@qq.com>,
	syzbot+fa90fcaa28f5cd4b1fc1@syzkaller.appspotmail.com,
	clm@fb.com,
	josef@toxicpanda.com,
	linux-btrfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH next] btrfs: fix deadlock in btrfs_read_chunk_tree
Date: Wed, 25 Jun 2025 20:40:50 +0800
Message-ID: <20250625124052.1778-1-hdanton@sina.com>
In-Reply-To: <063b1e52-0769-403b-ae05-7b999223a1f2@gmx.com>
References: <685aa401.050a0220.2303ee.0009.GAE@google.com> <tencent_C857B761776286CB137A836B096C03A34405@qq.com> <20250624235635.1661-1-hdanton@sina.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 25 Jun 2025 20:19:06 +0930 Qu Wenruo wrote:
> =E5=9C=A8 2025/6/25 09:26, Hillf Danton =E5=86=99=E9=81=93:
> > On Wed, 25 Jun 2025 06:00:09 +0930 Qu Wenruo wrote:
> >> =3DE5=3D9C=3DA8 2025/6/25 00:00, Edward Adam Davis =3DE5=3D86=3D99=3DE9=
> =3D81=3D93:
> >>> Remove the lock uuid_mutex outside of sget_fc() to avoid the deadlock
> >>> reported by [1].
> >>> =3D20
> >>> [1]
> >>> -> #1 (&type->s_umount_key#41/1){+.+.}-{4:4}:
> >>>          lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5871
> >>>          down_write_nested+0x9d/0x200 kernel/locking/rwsem.c:1693
> >>>          alloc_super+0x204/0x970 fs/super.c:345
> >=20
> > Given kzalloc [3], the syzbot report is false positive (a known lockdep
> > issue) as nobody else should acquire s->s_umount lock.
> >=20
> > [3] https://web.git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.=
> git/tree/fs/super.c?id=3D7aacdf6feed1#n319
> 
> Not a false alert either.
> 
> sget_fc() can return an existing super block, we can race between a=20
> mount and an unmount on the same super block.
> 
> In that case it's going to cause problem.
> 
> This is already fixed in the v4 (and later v5) patchset:
> 
> https://lore.kernel.org/linux-btrfs/cover.1750724841.git.wqu@suse.com/
> 
Can v5 survive the syzbot test?
