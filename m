Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9DA199E80
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 08:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739004153; cv=none; b=s3ujVFfCyPi0cyE59WF0ZznFMVoTNqI0ZXrUjM5AX9//DLFCcrQUZ7fX4AtkN5le5OLj2GAyIDxB3VYOIVBzJJnJS0XFNnHWBXlTQ41pNiG2HxQ5iqrlEdt9j7ggPzUsNeZ/KXN5C3wbHt39Biw2yb0uzxZNeIwp7gCG6ovbXvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739004153; c=relaxed/simple;
	bh=OnswMqoPkF9z36iAbkxYNl5EtFRYfEKhNPu0aM3gi7k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QmyItDJldH+X5scZo8bl2/8aRi+7grk9avHTcidqDt09UeE0y7iWop6zyvV60oUx97dnYqrDYZBNID8S9lOSA8U7OkdEYrGKclYsTWWVZWfE9VsMWbJzwkECZnrgOEXbqk2y7Loi6EYqSFVAWPQe3U/zbzKHo8MH3cYsEcWMTLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L6f++uYH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L6f++uYH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7A98C4CED6;
	Sat,  8 Feb 2025 08:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739004152;
	bh=OnswMqoPkF9z36iAbkxYNl5EtFRYfEKhNPu0aM3gi7k=;
	h=From:To:Cc:Subject:Date:From;
	b=L6f++uYHNp0C6xlhBbx6y+8B21QuNPjqwmnQiRokqlhcy52r16RdC2hYJ+APTYSqP
	 vbqDiRy0gOZL/eSd7hNqkT2QJhrgtgeMoh7bQ55JMWSvce2gZzPN5lOta+hVeVvJ4J
	 dSREdHEyO2/QyfPpBtVkbIFCAY7PJM9+m2n7e5KNQcLQh16igPjcoaQK4mtPZWCX7j
	 rZUBFYzZ98HptJ8ucTVXnS34FEBKH6LrQZo30rHZBpdp1xeaMgn6Cfb1A5Cq+cD7+e
	 DJZyU9PgOMuEfHl1oIH+my/r6sfggGTMOBMv+/yN+zroxH29mGXuKE/6xIg9TzzWWv
	 rBLuOX8EtCa6w==
From: Tejun Heo <tj@kernel.org>
To: void@manifault.com,
	arighi@nvidia.com,
	multics69@gmail.com
Cc: linux-kernel@vger.kernel.org,
	sched-ext@meta.com
Subject: [PATCHSET sched_ext/for-6.15] sched_ext: Event counter updates
Date: Fri,  7 Feb 2025 22:42:14 -1000
Message-ID: <20250208084229.1274399-1-tj@kernel.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This patchset contains the following three event counter updates:

 0001-tool-sched_ext-Event-counter-dumping-updates.patch
 0002-sched_ext-Count-SCX_EV_DISPATCH_LOCAL_DSQ_OFFLINE-in.patch
 0003-sched_ext-Add-SCX_EV_ENQ_SKIP_MIGRATION_DISABLED.patch

This patchset depends on two pending migration disabled handling patches on
top of sched_ext/for-614-fixes and the event counter addition in
sched_ext/for-6.15 and thus is on top of:

 sched_ext/for-6.14-fixes
 + Two migration disabled handling update patches
   http://lkml.kernel.org/r/Z6Zz79AUub1YuHwD@slm.duckdns.org
 + sched_ext/for-6.15

The following branch shows how these patches will be applied:

 git://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext.git scx-evs

diffstat follows. Thanks.

 kernel/sched/ext.c                |   25 +++++++++++++++++++------
 tools/sched_ext/scx_central.bpf.c |   21 ---------------------
 tools/sched_ext/scx_qmap.bpf.c    |   16 ++++++++--------
 3 files changed, 27 insertions(+), 35 deletions(-)

--
tejun
