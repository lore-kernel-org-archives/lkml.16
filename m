Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E8810E9
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 03:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738898053; cv=none; b=qZ5MYvr+R2eMl8xPK24NpR/o891nqjcvYiJ035KS0TdXfSa9CyPuo9YVaa6AbIToSmR05+t2NUsFIMaa0Jy2UpRDe+r1NKw1A3r+RYUtmMsD8HgcbwfT1OA90Uf3gA8vXhPSHfPk0pq2m2C4nadljzC2OKXFtJoiJh43+ZLLDYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738898053; c=relaxed/simple;
	bh=1vOB0zY+sVtBs8/hdBgcDEW/4y4b2muAt3B9V6/LzMo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=syVyVJKDP+3ncWtl36PXaeqJr3CP7UowHhKUWFNuEKUEsl1ILlj7Hg1Tl7WZZlplOycv9raQGE/ydQcN9iJxCl4KGOcr4v0UhRA6FqI1xUs4f4ZUqnV/zWrmb9OpCgh5prZcLXoURIdjv0a9ENj9+Q3M9+lfC0AyMFkMkDpIMi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=nn5wEvJH; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="nn5wEvJH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=XQOoyHwtaFCSoenDZCGy28a756VXPkK5kpiMXF76FJk=; b=nn5wEvJHjpuLg/vKV/9n0HMWrA
	zS12QqT9WV7kXxvgcZzQQncpbFQ2+zEiG/w6oN7itpGCSO0Afh96KzBVjxHilLz5hNe7CM2q1K4y5
	c+RDyPuQCbBs3KEMf9+Y3S0440nTyTmr4xMRrpSnHWJQ6uOj3Uyxi6QlTEbY8skpheiSj6JEqbSqx
	SvoUq3Jdck+XtwIJNAx6C30qYtTBnfYZFYOaVDqD+u0jl36yruRUKrbgI/Sa2FNiNprqqx4UzjoA2
	l8eALLnY1LB82jwxAGAz/Tou/ncd2X3a9Ypt7vTownvWIbvu8UK6GkupodU/POgU4CVum/+MOT2xu
	MLKlnySA==;
Received: from [58.29.143.236] (helo=localhost)
	by fanzine2.igalia.com with utf8esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1tgEoO-005Ybj-M9; Fri, 07 Feb 2025 04:13:55 +0100
From: Changwoo Min <changwoo@igalia.com>
To: tj@kernel.org,
	void@manifault.com,
	arighi@nvidia.com
Cc: kernel-dev@igalia.com,
	linux-kernel@vger.kernel.org,
	Changwoo Min <changwoo@igalia.com>
Subject: [PATCH 0/2] sched_ext: Add a core event and update scx schedulers
Date: Fri,  7 Feb 2025 12:13:36 +0900
Message-ID: <20250207031338.393045-1-changwoo@igalia.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset introduces a new event, SCX_EV_ENQ_SLICE_DFL, and updates
two scx schedulers -- scx_qmap and scx_central -- to print out the new
event.

SCX_EV_ENQ_SLICE_DFL counts how many times the tasks' time slice is set
to the default value (SCX_SLICE_DFL) by the sched_ext core in the enqueue
and pick_next paths.

Scheduling a task with SCX_SLICE_DFL unintentionally would be a source
of latency spikes because SCX_SLICE_DFL is relatively long (20 msec).
Thus, soaring the SCX_EV_ENQ_SLICE_DFL value would be a sign of BPF
scheduler bugs, causing latency spikes.

Changwoo Min (2):
  sched_ext: Add an event, SCX_EV_ENQ_SLICE_DFL
  sched_ext: Print an event, SCX_EV_ENQ_SLICE_DFL, in scx_qmap/central

 kernel/sched/ext.c                | 15 ++++++++++++++-
 tools/sched_ext/scx_central.bpf.c |  2 ++
 tools/sched_ext/scx_qmap.bpf.c    |  2 ++
 3 files changed, 18 insertions(+), 1 deletion(-)

-- 
2.48.1

