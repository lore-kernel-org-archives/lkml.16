Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48537155321
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 06:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738910468; cv=none; b=KSqxAmqhNMf51UfqO6Vh/HMCmvfjJIP5VOcBwmkOio9mllWHiIRCfFIx1QWuwMuSMN5FUQ8+AAkbSL7omjNUaVhXBFgCa/R/rnxdwR/B+dUSw7n2OwTTrVu10JPdUQBYI3QcLx6W8MfwrlOmYRrPTN41ybdlrsAc2HHqvuf0BAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738910468; c=relaxed/simple;
	bh=ArR7zYz86Ez4uhd4rwMLooklYz+b7WuD2cq4ty32OB0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c7bPVQVJMZuGIEGuedJpN2grvwSmLuSycBr5aJiYJCnooYFapb+WwXx6xgOcyIRbEGc27FeWbHWTtL4oILz5UQXs8Sy+gKniol2qKcsnsIoHoGQdIZ6ZKXaAfsp8lHD8F7WqgmQXT6k0WH49vHgopk+qPX/NGrD4yyDi8Ux8hGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=Px8TfBYE; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="Px8TfBYE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=6M/gjwMYToGUfPcFCFm7i2+C+QJkneKtwonDxid/34k=; b=Px8TfBYE0jIW359A0p8Yycs5N8
	4Jd+LOyhVSz1WyJYQgz9gT+iAqxHEtb5LKW+VHDjdusS5XubY09+cedrC5jYfKkOlW13bAqJDggTG
	sdTFzd87h0gFtktP/o+cqOuAgKleOTB5K7QpJKY6DgQWfnJjwoF7OiqMlqYKT4uopVNYZcO/hLuhJ
	ZiRVnTavvhpY5+ob1z6M6dTRp4Ma9cjjZCziKZepA9zAigysoH+YGxVguRKmVCikDMIcErLVbxzK/
	MORgdmR92hF77ip13HTW/fsV5QINGYUg4uUyRG2hmisoyOuksFPsqdyDntwmXv5uFXJx2rwMwoVrO
	W1MgmiuA==;
Received: from [58.29.143.236] (helo=localhost)
	by fanzine2.igalia.com with utf8esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1tgI2m-005ghO-59; Fri, 07 Feb 2025 07:40:58 +0100
From: Changwoo Min <changwoo@igalia.com>
To: tj@kernel.org,
	void@manifault.com,
	arighi@nvidia.com
Cc: kernel-dev@igalia.com,
	linux-kernel@vger.kernel.org,
	Changwoo Min <changwoo@igalia.com>
Subject: [PATCH v2 0/2] sched_ext: Add a core event and update scx schedulers
Date: Fri,  7 Feb 2025 15:40:50 +0900
Message-ID: <20250207064052.399227-1-changwoo@igalia.com>
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

ChangeLog v1 -> v2:
  - Instrument the event at select_task_rq_scx() when ops.select_cpu()
    is not provided.

Changwoo Min (2):
  sched_ext: Add an event, SCX_EV_ENQ_SLICE_DFL
  sched_ext: Print an event, SCX_EV_ENQ_SLICE_DFL, in scx_qmap/central

 kernel/sched/ext.c                | 16 +++++++++++++++-
 tools/sched_ext/scx_central.bpf.c |  2 ++
 tools/sched_ext/scx_qmap.bpf.c    |  2 ++
 3 files changed, 19 insertions(+), 1 deletion(-)

-- 
2.48.1

