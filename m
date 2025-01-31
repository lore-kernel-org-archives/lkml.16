Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6071547E4
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 22:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738362560; cv=none; b=EAHGHNSRYeYsUBhxfTwUeLbmz/825ZWCcdDlduxbQRHQtYlHKEAjUOy0rGDKoe3VmECij0hpXiiGizcXmSvOl/dSydleERWmszuDDRWP9ekF+aYKW2BR6oEXl9ec46wPia2dl3gVP3fG/8cGlB6XdX+0cMikcE/ytsbso7fx8bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738362560; c=relaxed/simple;
	bh=QYCqaewGw/fEDB0FLcm50v51JOesOr9vxV6zfWBMiGs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MPxUIJ6MGkY7DQxlX5AvuNsceGMf+uw4Ou1QxhvZjoffasHlSeDjkEvd3N93Sgzr0L4qVJuLO12b5mFb9FzgsUlJwi7yKb877nMpRuyh18UReiIjPpn4+FyzHiN6Vsbjfat3+mS7pw4o4FvE3/7ML5SGBp9x6K61SNuYMHvDLb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eoFKkdk8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eoFKkdk8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADEEDC4CED1;
	Fri, 31 Jan 2025 22:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738362559;
	bh=QYCqaewGw/fEDB0FLcm50v51JOesOr9vxV6zfWBMiGs=;
	h=From:To:Cc:Subject:Date:From;
	b=eoFKkdk8f7T2ouE7ZjJ3CmuOMBotbZO1zogE4bWRslI3y/3Q6Bb0VI467cptW9jvK
	 Z6986fInKW0yFnSyHHMGwWJQ7Plkt3HWnGz/M6hKlWKoExR+1I1WoR6XgonTLh0PbU
	 1kr6qcSUNnbO6rwjf5J87iHHV4dqnuccJNUZZQcJO+xBSjcsW9DDoyzkCaVDQRP+dw
	 hwi6+TRCFyYLCW6nr35YvA7QheGz/kODNM620g1A4iItfRxqiMYi9ctZUSoOcAMX/f
	 BkaIwoemdgbdlWISSqOu3Zik2w13M3H3AeVSuZjwkrZv5Sp7nhc2ggvx8CKBjWRTmf
	 7CtdkXQMru2LQ==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Subject: [PATCH 0/2 v8] add ioctl/sysfs to donate file-backed pages
Date: Fri, 31 Jan 2025 22:27:55 +0000
Message-ID: <20250131222914.1634961-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Note, let me keep improving this patch set, while trying to get some feedbacks
from MM and API folks from [1].

If users clearly know which file-backed pages to reclaim in system view, they
can use this ioctl() to register in advance and reclaim all at once later.

I'd like to propose this API in F2FS only, since
1) the use-case is quite limited in Android at the moment. Once it's generall
accepted with more use-cases, happy to propose a generic API such as fadvise.
Please chime in, if there's any needs.

2) it's file-backed pages which requires to maintain the list of inode objects.
I'm not sure this fits in MM tho, also happy to listen to any feedback.

[1] https://lore.kernel.org/lkml/Z4qmF2n2pzuHqad_@google.com/

Change log from v7:
 - change the sysfs entry to reclaim pages in all f2fs mounts

Change log from v6:
 - change sysfs entry name to reclaim_caches_kb

Jaegeuk Kim (2):
  f2fs: register inodes which is able to donate pages
  f2fs: add a sysfs entry to request donate file-backed pages

Jaegeuk Kim (2):
  f2fs: register inodes which is able to donate pages
  f2fs: add a sysfs entry to request donate file-backed pages

 Documentation/ABI/testing/sysfs-fs-f2fs |  7 ++
 fs/f2fs/debug.c                         |  3 +
 fs/f2fs/f2fs.h                          | 14 +++-
 fs/f2fs/file.c                          | 60 +++++++++++++++++
 fs/f2fs/inode.c                         | 14 ++++
 fs/f2fs/shrinker.c                      | 90 +++++++++++++++++++++++++
 fs/f2fs/super.c                         |  1 +
 fs/f2fs/sysfs.c                         | 63 +++++++++++++++++
 include/uapi/linux/f2fs.h               |  7 ++
 9 files changed, 258 insertions(+), 1 deletion(-)

-- 
2.48.1.362.g079036d154-goog

