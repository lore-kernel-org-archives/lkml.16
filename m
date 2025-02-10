Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C08E1C5F10;
	Mon, 10 Feb 2025 10:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739182704; cv=none; b=QXU8d7cGUYAi40iCB7hfWpcv/3oOjxKdQwh48RmqYOG4psOg5+mPsK2MkWwwqvsypUA3KWhlxJm4EBfPn1RM80yAzGVfSxkhO/7sqlLSbK6rSkhhe7CpyfVdHt57SVITVoV3tbUoMkTKVldTeXTbtIg3fFMjGIeYsPoy1G3HSiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739182704; c=relaxed/simple;
	bh=erz4OcTOvbnxgyfwrQKNDa0AznbtN3e8j1C5SQqASZI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JWzCIizy7P4sNUK3kOcRZv2VUfjCASlWn1gLRdmmL5TqW4Q+rifkb+kolg8qSTaD4yUSgedbFoqAaOQmMVZisnjQ6ghwaCz2cao5R2PwCRkT/Wd3aJv8Gf1cIXLzAB8t0QRd7cDvu4kmKoBIukRiI66xTep9STaCDJdLs8P9VUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tJuJo/Za; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tJuJo/Za"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC8F7C4CEE5;
	Mon, 10 Feb 2025 10:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739182703;
	bh=erz4OcTOvbnxgyfwrQKNDa0AznbtN3e8j1C5SQqASZI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tJuJo/Za2UZaLzMPkWM3ErN6CEdY1JXAh9kUsv7ercsTEbVbPzt66nmVGL0xVLwWM
	 jCdc7e+jNQfCM0vKlvrnpegE6LbNJaOFPNKGu1aY0T0RzDwCsySFBopa8bFJwo7EKZ
	 nuy8BpLx3VjaJH747vIO/jtMMO+bRlMSfERbD8r4D2EUnEFS/1zWaUw+U0pBj+0sFu
	 iuvm26DZ609zLPb7/I4DyqgZGmDhBA8eOG4jRsHoAfPEWPyycR9l+ktT1iZrvmo54U
	 DjNrbOg+x/HER0eFMWPu4IIwZhZgzk3eGU/+JqMcIGHLlWHFi8dZYFpi/CZgFEYget
	 EF8lf8xsf+I5A==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1thQru-00000006CiW-05GM;
	Mon, 10 Feb 2025 11:18:22 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Jonathan Corbet" <corbet@lwn.net>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 06/27] ABI: sysfs-driver-dma-idxd: fix date tags
Date: Mon, 10 Feb 2025 11:17:55 +0100
Message-ID: <d5b7641e7a6ed461d889db5198cb557a68f27a6d.1739182025.git.mchehab+huawei@kernel.org>
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
 Documentation/ABI/stable/sysfs-driver-dma-idxd | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/stable/sysfs-driver-dma-idxd b/Documentation/ABI/stable/sysfs-driver-dma-idxd
index f2ec42949a54..4a355e6747ae 100644
--- a/Documentation/ABI/stable/sysfs-driver-dma-idxd
+++ b/Documentation/ABI/stable/sysfs-driver-dma-idxd
@@ -246,14 +246,14 @@ Description:	Controls whether PRS disable is turned on for the workqueue.
 		capability.
 
 What:		/sys/bus/dsa/devices/wq<m>.<n>/occupancy
-Date		May 25, 2021
+Date:		May 25, 2021
 KernelVersion:	5.14.0
 Contact:	dmaengine@vger.kernel.org
 Description:	Show the current number of entries in this WQ if WQ Occupancy
 		Support bit WQ capabilities is 1.
 
 What:		/sys/bus/dsa/devices/wq<m>.<n>/enqcmds_retries
-Date		Oct 29, 2021
+Date:		Oct 29, 2021
 KernelVersion:	5.17.0
 Contact:	dmaengine@vger.kernel.org
 Description:	Indicate the number of retires for an enqcmds submission on a sharedwq.
-- 
2.48.1

