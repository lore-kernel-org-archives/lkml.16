Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1131C5F1F;
	Mon, 10 Feb 2025 10:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739182704; cv=none; b=gcW9Gn+bKdnIrTlNa6NyjhJAP3mdsJRKFsjtt96dXi5cOViLPdgxixKNs4HXlZjEFTO+rP7gl3SAr0uLCIHePSNfF+YW4rdJfVVf0LAVfd8XS3EpnMGt4rRYIjhFfpEaM4rSKbQA7ikuzsF0K4n9EMy4rAcRwf2f2sNvowwaROA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739182704; c=relaxed/simple;
	bh=LI59JQtyPV/HF12ShAdqHJX2HFF3NXc8/5bk+IONPNM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=raoHHuRsIlSqI0R0d7e/ryHcoViV9+i+huj+4s/YkWZHHAQ1UQ1196OApwfVM4UcWcirHilaqBhLfP0A/zvLpGy7OckzCK4w3x/eaVK+1rGi21ZgFhRWS66k93MSJqYWxukbvXFRiAwqmPLbss2ybzDMzQ3pMuy9A1M2t8m+Rdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nO62iX7S; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nO62iX7S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFD75C4CEEB;
	Mon, 10 Feb 2025 10:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739182704;
	bh=LI59JQtyPV/HF12ShAdqHJX2HFF3NXc8/5bk+IONPNM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nO62iX7S28S3shm7FksdxtyPreI2cGS6vi10HoQx+ObzswtwhDDeWQtpScBku+cfh
	 gFhql5aAGvyOhNISZ5EmnbovIYanDSAbdfvNYT+CKFtBe6ShOJXPBPH62dZPUtSFsH
	 /9DXMZ5Za8qeXXjLFCBjJMQBdOUmiKF9a8r90j1LbiNP7OuZPI3Fz/XJt3ZLjQ3cy7
	 OMmb8sI73yuK0P0M54zqtxXza6o7rx4Jrr4iEiW7RQFwdUnO4k3Fsk2ZOmgg/S37TM
	 /1gYxlDf5k72He6hNuyZAtv/irgoR/KpiU0WidVNS2SX97c5eB1TEpJO0gNkTo0o2C
	 8nocUmRXPqJ7A==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1thQru-00000006Cia-0CEy;
	Mon, 10 Feb 2025 11:18:22 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Jonathan Corbet" <corbet@lwn.net>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	Chao Yu <mchehab+huawei@kernel.org>,
	Jaegeuk Kim <mchehab+huawei@kernel.org>,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
Subject: [PATCH 07/27] ABI: sysfs-fs-f2fs: fix date tags
Date: Mon, 10 Feb 2025 11:17:56 +0100
Message-ID: <336ab631c0636e419282a38e7dd5b5cfb52fcd2d.1739182025.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1739182025.git.mchehab+huawei@kernel.org>
References: <cover.1739182025.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Some date tags are missing colons. Add them to comply with
ABI description and produce right results when converted to html/pdf.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/ABI/testing/sysfs-fs-f2fs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 3e1630c70d8a..e44bb614964b 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -347,7 +347,7 @@ Description:	Used to control configure extension list:
 		- [c] means add/del cold file extension
 
 What:		/sys/fs/f2fs/<disk>/unusable
-Date		April 2019
+Date:		April 2019
 Contact:	"Daniel Rosenberg" <drosen@google.com>
 Description:	If checkpoint=disable, it displays the number of blocks that
 		are unusable.
@@ -355,7 +355,7 @@ Description:	If checkpoint=disable, it displays the number of blocks that
 		would be unusable if checkpoint=disable were to be set.
 
 What:		/sys/fs/f2fs/<disk>/encoding
-Date		July 2019
+Date:		July 2019
 Contact:	"Daniel Rosenberg" <drosen@google.com>
 Description:	Displays name and version of the encoding set for the filesystem.
 		If no encoding is set, displays (none)
-- 
2.48.1

