Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9BD2676CC;
	Tue,  8 Apr 2025 10:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744106997; cv=none; b=Fa0+FyT+6VVTRmORbEmRCnKXU65xOsN7FB45p6H0FIo4Wmzbalb0+bGpiNxKxubql04mSMjthe03EEyGpAh6nLvTjxVeAU8XasiNJAgkC6IO1gyNSqNge/ORNvLRbtmav7iUieGaoyebSSpS6/T/7deMyQtIsb2rXsRkIEzRvPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744106997; c=relaxed/simple;
	bh=U8UoBsYILY5xqJ321naGG+BcFzDB5+hrgzzoiF2VkSo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q7OJS7IRyqYpLTRBRTEkWdo/E/CcuoZrqndqMZ3RnIuGVpnqMrPFVWguwtXEfZ19QPHYeJcrTo6i/UQLAPnk/IYwSf3iKHYJlKDBVw3lep0hxediXt+xnbuwGWlSst4cBe7Af49qa00Tq//urS7vq0TFcCuI/1A+shddGkbjfXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rcOE7OfE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rcOE7OfE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8249C4CEF2;
	Tue,  8 Apr 2025 10:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744106996;
	bh=U8UoBsYILY5xqJ321naGG+BcFzDB5+hrgzzoiF2VkSo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rcOE7OfEnieJBl+Dh4TzJjVksZuBjv4swHs2xJ/RgtmarrCnRoG0xxaT0g72EZMnk
	 TPeyvfqnMUs7R5z0uqwMB+jseH+9kvaW0hoBYzPa+Xgni6kanVQhLtRSkfEZBjcfhV
	 QnK6nqczbewWFNgb95N2OQSLrFjPiJAG/3fa72Luk0mFH4oVPPe29O4L3i6RHRretT
	 eTja0OLeUMjUVyGON8iMtgynz208cU9UJpo82fEunPAxxEkJrB8SBk3PpXi+VYRi8x
	 YIyLk9/aHxxXoV1YLBAfKEdMV4VhGWvsXU2dAInmOO/MQ2JGSnoiUoVNcqJHABl9+5
	 sPua4WDcKjTXw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab@kernel.org>)
	id 1u25tt-00000008RWG-1qN7;
	Tue, 08 Apr 2025 18:09:49 +0800
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 21/33] docs: sphinx: kerneldoc: use kernel-doc.py script
Date: Tue,  8 Apr 2025 18:09:24 +0800
Message-ID: <a81d8db099d9cef5161deaef40ac9056bf9802a3.1744106242.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1744106241.git.mchehab+huawei@kernel.org>
References: <cover.1744106241.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>

Switch to the new version when producing documentation.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/Makefile | 2 +-
 Documentation/conf.py  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/Makefile b/Documentation/Makefile
index 63094646df28..c022b97c487e 100644
--- a/Documentation/Makefile
+++ b/Documentation/Makefile
@@ -60,7 +60,7 @@ endif #HAVE_LATEXMK
 # Internal variables.
 PAPEROPT_a4     = -D latex_paper_size=a4
 PAPEROPT_letter = -D latex_paper_size=letter
-KERNELDOC       = $(srctree)/scripts/kernel-doc
+KERNELDOC       = $(srctree)/scripts/kernel-doc.py
 KERNELDOC_CONF  = -D kerneldoc_srctree=$(srctree) -D kerneldoc_bin=$(KERNELDOC)
 ALLSPHINXOPTS   =  $(KERNELDOC_CONF) $(PAPEROPT_$(PAPER)) $(SPHINXOPTS)
 ifneq ($(wildcard $(srctree)/.config),)
diff --git a/Documentation/conf.py b/Documentation/conf.py
index 3dad1f90b098..b126f6760b5f 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -540,7 +540,7 @@ pdf_documents = [
 # kernel-doc extension configuration for running Sphinx directly (e.g. by Read
 # the Docs). In a normal build, these are supplied from the Makefile via command
 # line arguments.
-kerneldoc_bin = '../scripts/kernel-doc'
+kerneldoc_bin = '../scripts/kernel-doc.py'
 kerneldoc_srctree = '..'
 
 # ------------------------------------------------------------------------------
-- 
2.49.0

