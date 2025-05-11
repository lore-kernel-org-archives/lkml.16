Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04202BE4A
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 22:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747003707; cv=none; b=lLJFNC6DIMTcDjor3bDVCKoNqnrHU+hltSIRYQZNkfZM52QVbRj/bDvifXisXGd3SAeqEOJ+k5FPiXTiAYbDrKfuxgvYGAT+cy/KHvaJBgx5Nqleq2Q11RwxRq083bvwvoxL12opHPsOlLOKQjdYSHQBZ2EXYST0B9BgIxjpH1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747003707; c=relaxed/simple;
	bh=47c3gc5PplHhImxNk+EbCl1d27T08Fk1z3X8yHbDdqA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kSvdk6tuFjQqZT7xnw1eG8nFJRjN47z7jDGMe3FJvPpAgxKEjIsXpvoSD0uKOjX0lZwIhCNg0mWHT6VEcoD3a6xgmRDWhPFLnwSgU7s6nfIRor3O1u4IxEEpldbZg6awucrWU1yh0DPSnFn0CxiAKc50aArrE9vpSPL0F6OXG6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=SP5wsqC8; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="SP5wsqC8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=xaumbpd0LAQMjPPLEz1gi5QlKM0cf/Gm3WRTcfteEmM=; b=SP5wsqC8jBWkGEceIYauYLau2M
	NuB9KGb2JQLKOQ/QWJwR8GmlTGmbY/ixDQgVOVZADJG306TT6JHMiPKyLp2+wIkppAyFmD6oSQ0yx
	60VskNQrxqwPk273H0M1vC2bAtr4mNAAtCT4R68Jaf5Yvswc2uMSD4TkjTx5dljgXK9PRKwAlqYt/
	6VxEAtnYCspoi+lK6VPevenmUufLYjyuwSG3ehUiDTqSERV5fkDzPpCPkbhkDJWJ1g9e9AELffaU9
	hL5xv1MTKLZZbVEJJ713xJ4IZQHYyuysTtLB3yudkWa4JnSX3/AStZCipg91DXumJ5n6RNUI0Yi3E
	f5QPiWeg==;
Received: from [191.204.192.64] (helo=localhost.localdomain)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1uEFNj-006nqn-Rh; Mon, 12 May 2025 00:48:04 +0200
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: "Alex Deucher" <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	siqueira@igalia.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	"Raag Jadav" <raag.jadav@intel.com>,
	rodrigo.vivi@intel.com,
	jani.nikula@linux.intel.com,
	Xaver Hugl <xaver.hugl@gmail.com>,
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	kernel-dev@igalia.com,
	amd-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
Subject: [PATCH v2 2/3] drm/doc: Add a section about "App information" for the wedge API
Date: Sun, 11 May 2025 19:47:44 -0300
Message-ID: <20250511224745.834446-3-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250511224745.834446-1-andrealmeid@igalia.com>
References: <20250511224745.834446-1-andrealmeid@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a section about "App information" for the wedge API.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
 Documentation/gpu/drm-uapi.rst | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
index 69f72e71a96e..826abe265a24 100644
--- a/Documentation/gpu/drm-uapi.rst
+++ b/Documentation/gpu/drm-uapi.rst
@@ -446,6 +446,21 @@ telemetry information (devcoredump, syslog). This is useful because the first
 hang is usually the most critical one which can result in consequential hangs or
 complete wedging.
 
+App information
+---------------
+
+The information about which application (if any) caused the device to get in the
+wedge state is useful for userspace if they want to notify the user about what
+happened (e.g. the compositor display a message to the user "The <app name>
+caused a graphical error and the system recovered") or to implement policies
+(e.g. the daemon may "ban" an app that keeps resetting the device). If the app
+information is not available, the uevent will display as ``PID=-1`` and
+``APP=none``. Otherwise, ``PID`` and ``APP`` will advertise about the guilty
+app.
+
+The reliability of this information is driver and hardware specific, and should
+be taken with a caution regarding it's precision.
+
 Consumer prerequisites
 ----------------------
 
-- 
2.49.0

