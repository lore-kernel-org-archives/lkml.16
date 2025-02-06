Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6EB19CCEA
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 17:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738864326; cv=none; b=F+1G44z5lycRhEtl8ARpKjZ1BirW00aEEiTQ9em+lAe+rwGZpi9J9bCWZ+gkZ6f3LmOREeBe75V05gPuWIrbazizV/6GQ9oQV1d1MI2742kPWcCyDLC83m6l3qaJwjnLQZLuTVDJJ3N/npRWitOj7oFmI3Wi74FxxcsbEp3nV5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738864326; c=relaxed/simple;
	bh=y2F/Mrs1PMB7/mklR8DSDT40aSINZpcATSrtC1gHSk4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sBjCR3oGV3mxYKOL62pgBg/RoPtCIT4VdPOYvMQTBpT1KdwaBQtxT+Vr0KEzG/vN4InmigbMpx92XkKcyJ9UluG8sy+knLCT+AhB74Ew6xm8HTvBhkfNnzIDOZ0fZ0boA63iBDD7Qc1lu0KJqF/jh/N/KJuECe118TfqXP5KF+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=bsrWMPvH; arc=none smtp.client-ip=199.89.1.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="bsrWMPvH"
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4Ypl6X3l6ZzlgTw4;
	Thu,  6 Feb 2025 17:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mr01; t=1738864319; x=1741456320; bh=3V29R
	/FUzloylojLKpvGdZK98QEV5HhdKRv7olNVCsI=; b=bsrWMPvHJSSYmKgTWNCBF
	1G4CYwV6/9In0Dl2VcLqydRzHGAVF5H8Y/lpFMXAPltdLW7PaYNmUx3lCf9pz0nv
	Mm66AeQ1ygx8dJvVlXV1hhvhKqyNyraB8MI99HQffOqWk7tPVggY1lgqamEaZv4m
	dPRGzbglCvAhxd276FfIZ5tlPhtpY0lAa6znYE3+jg+RpnysZ1YaAMfya3G8fWug
	UzKuDamDGSyUZ2k/W6iqwfnxkKwcijjnxQe+g3tzGloC5T7n8F6fFoT63eggQv+p
	qFIfgK8gIg7bYx4OsRiZpdBHBhQ557e6o+al7bZietdtH1fGiYdo3FRUWy05OSVx
	w==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id 89KxZ51uYYIL; Thu,  6 Feb 2025 17:51:59 +0000 (UTC)
Received: from bvanassche.mtv.corp.google.com (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4Ypl6H118bzlgTwJ;
	Thu,  6 Feb 2025 17:51:50 +0000 (UTC)
From: Bart Van Assche <bvanassche@acm.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Will Deacon <will@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Marco Elver <elver@google.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Jann Horn <jannh@google.com>,
	linux-kernel@vger.kernel.org,
	Bart Van Assche <bvanassche@acm.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Sathya Prakash <sathya.prakash@broadcom.com>
Subject: [PATCH RFC 12/33] scsi: mpi3mr: Fix locking in an error path
Date: Thu,  6 Feb 2025 09:50:53 -0800
Message-ID: <20250206175114.1974171-13-bvanassche@acm.org>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
In-Reply-To: <20250206175114.1974171-1-bvanassche@acm.org>
References: <20250206175114.1974171-1-bvanassche@acm.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Make all error paths unlock rioc->bsg_cmds.mutex.

This bug has been detected by the Clang thread-safety analyzer.

Cc: Martin K. Petersen <martin.petersen@oracle.com>
Cc: Sathya Prakash <sathya.prakash@broadcom.com>
Fixes: fb231d7deffb ("scsi: mpi3mr: Support for preallocation of SGL BSG =
data buffers part-2")
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 drivers/scsi/mpi3mr/mpi3mr_app.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/scsi/mpi3mr/mpi3mr_app.c b/drivers/scsi/mpi3mr/mpi3m=
r_app.c
index 7589f48aebc8..f4b5813e6fc4 100644
--- a/drivers/scsi/mpi3mr/mpi3mr_app.c
+++ b/drivers/scsi/mpi3mr/mpi3mr_app.c
@@ -2339,6 +2339,7 @@ static long mpi3mr_bsg_process_mpt_cmds(struct bsg_=
job *job)
 	}
=20
 	if (!mrioc->ioctl_sges_allocated) {
+		mutex_unlock(&mrioc->bsg_cmds.mutex);
 		dprint_bsg_err(mrioc, "%s: DMA memory was not allocated\n",
 			       __func__);
 		return -ENOMEM;
