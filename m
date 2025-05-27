Received: from jpms-ob01.noc.sony.co.jp (jpms-ob01.noc.sony.co.jp [211.125.140.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00EC52741CD;
	Tue, 27 May 2025 14:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.125.140.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748357767; cv=none; b=mAnkuQ0lEkTsBsdjHc0WMLDXL3yiVkK6Aq2pOLYYpkQ+1r8ACkinbS3SRqvCMf/0AQ4+CqfBTwVoXUB0PEaSTtCiDEfSK33YvxhZVzUWP0NvULJQj1q0p3VkW9XlM0U2BAX/nPOvxz22buxqhJGd2y+iUNdcDkEP1xkH5jraIhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748357767; c=relaxed/simple;
	bh=eHjuqyD/lQ2vZbdAqRApvQJs6xFS6RwU6ELtBYhM/1Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cFY48o+nx3i7JAfNXGxcCw0XyFogCLIFHF3sCotDbwuDo9jI/0oOS33o/5A5gur5dwaeaP0vUquYcdwYxx0Id4b5pyVfPWLqmh0T5Sovl3h33hItHn09amvgVQojKFVFzinmJWAlW/3silT8Vb29PFqJKYTqn3sbR82LKYP1AfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=imp5Goyi; arc=none smtp.client-ip=211.125.140.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="imp5Goyi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=sony.com; s=s1jp; t=1748357765; x=1779893765;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=SAxZMW8DM6vr+NwIFGrS4q745icm/7PJVP1QCR1Pedw=;
  b=imp5GoyiL+FcyvHqZruykVJME22oyODZ3n/CUKaae76XoBX7cIp9SeOm
   yxxHZlPgbmjYnVNkd3EADdiWCJ+KCx+MEOS6do+DUovfJGj0NxRd8k+jS
   Fku8KaJPc4eH3TiTVM43NN3nL2642CyE3mQ534nzLYKIz/bq8nYaxhYbg
   MxvLUVRtLKGy6W9qOhjqZmzaVoCJI7tqmftyqt+FLpXSfiJ/v1zv7Agk6
   P6D27Wggh5nuRc+wp+rQodv5Roz4u2q5nACuaygCuPBDKePCFSqLGZjMl
   kIGo3Xpz6aaIpDPjqlY+0KpaWhukm/hKi7xoh9kmQ4/ys3EuhWrcNZlMe
   A==;
Received: from unknown (HELO jpmta-ob02.noc.sony.co.jp) ([IPv6:2001:cf8:0:6e7::7])
  by jpms-ob01.noc.sony.co.jp with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 23:56:03 +0900
X-IronPort-AV: E=Sophos;i="6.15,318,1739804400"; 
   d="scan'208";a="534627491"
Received: from unknown (HELO [127.0.1.1]) ([IPv6:2001:cf8:1:573:0:dddd:6b3e:119e])
  by jpmta-ob02.noc.sony.co.jp with ESMTP; 27 May 2025 23:56:03 +0900
From: Shashank Balaji <shashank.mahadasyam@sony.com>
Subject: [PATCH v2 0/2] sched_deadline, docs: update rt-app examples, add
 cgroup v2 cpuset HOWTO
Date: Tue, 27 May 2025 23:55:56 +0900
Message-Id: <20250527-sched-deadline-cpu-affinity-v2-0-b8b40a4feefa@sony.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHzSNWgC/43NTQ6CMBCG4auQWTumreIPK+9hWJTpVCbRlrRIJ
 IS7WzmBy+dbvN8CmZNwhqZaIPEkWWIoMLsKqLfhwSiuGIwytaqNwUw9O3Rs3VMCIw1vtN5LkHH
 GTnVHdl45R1cohSGxl89Wv7fFveQxpnk7m/Rv/a87adRo9NnQ6XKwZOmWY5j3FF/Qruv6Ba0EJ
 qrFAAAA
X-Change-ID: 20250522-sched-deadline-cpu-affinity-b0b4edf0ddc9
To: Jonathan Corbet <corbet@lwn.net>, Juri Lelli <juri.lelli@redhat.com>, 
 Peter Zijlstra <peterz@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Shinya Takumi <shinya.takumi@sony.com>, 
 Shashank Balaji <shashank.mahadasyam@sony.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1047;
 i=shashank.mahadasyam@sony.com; h=from:subject:message-id;
 bh=eHjuqyD/lQ2vZbdAqRApvQJs6xFS6RwU6ELtBYhM/1Y=;
 b=owGbwMvMwCV2mPH4Ij++H1mMp9WSGDJML9WdKQ3r+ddbYDW/I0sx6oz258omN+amI4kVDQ/LF
 vywuPewo5SFQYyLQVZMkeWdzLoLB60sm74eZ/gGM4eVCWQIAxenAExk2lKG/36B/3If3GjTF358
 8N9iftFb+mUfzVbZvLN99ffC0T9N26oZ/kf3bCo3jNfn+L/kS+rZ4uALDWuD+PznTM/b8nSCw7d
 DRXwA
X-Developer-Key: i=shashank.mahadasyam@sony.com; a=openpgp;
 fpr=EE1CAED0C13A3982F5C700F6C301C7A24E0EF86A

The main goal of this patchset is to add the cgroup v2 cpuset controller HOWTO.
In v1 of this series, Juri commented that rt-app no longer takes command-line
options. So I ended up converting the rt-app examples to either use chrt instead
or use config.json.

Signed-off-by: Shashank Balaji <shashank.mahadasyam@sony.com>
---
Changes in v2:
- update rt-app examples to either use a chrt example or use config.json
- Link to v1: https://lore.kernel.org/r/20250522-sched-deadline-cpu-affinity-v1-1-2172c683acac@sony.com

---
Shashank Balaji (2):
      sched_deadline, docs: replace rt-app examples with chrt or use config.json
      sched_deadline, docs: add affinity setting with cgroup2 cpuset controller

 Documentation/scheduler/sched-deadline.rst | 77 ++++++++++++++++++++----------
 1 file changed, 53 insertions(+), 24 deletions(-)
---
base-commit: 914873bc7df913db988284876c16257e6ab772c6
change-id: 20250522-sched-deadline-cpu-affinity-b0b4edf0ddc9

Best regards,
-- 
Shashank Balaji <shashank.mahadasyam@sony.com>

