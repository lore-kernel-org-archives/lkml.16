Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8CB1FB3;
	Fri,  9 May 2025 00:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746752142; cv=none; b=g1f5FXHiqVgWbl3N7B5OD6heJV8lgvaig/oxBkkBTsdY+DJ4XXnPviBo7Ev2Jb0ii5Dfu7bm+JM2rWk/9jSV9p4IcD+7VOcKtdAe0mMHNpkS4BYJLuQy1NqRn5OlR9IFiCFh3ET3lOy+df2cUtGp7GiToN/cw29iYV0SHWIEodg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746752142; c=relaxed/simple;
	bh=eTn9W/L1nGkQsdzjJjRUCj2PWr8huBWV8nhOzCKqDJs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UrdGCld6QocPWknrX0SgBW8G9wdIN1dTyA+SFuaPLO+ZaSp+uiE4JX+hYWtFhh7BrBiwc49RwCMrrpN3C/sa/sswh+4md0YpZr1Qrof3NDsp3+bxyQmAnQMtLaLT1yNqjC0rWI+nEf0vCUE3sZWhJYfY5in0k3g/4wpKo8WsBRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=D7ivdiFT; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="D7ivdiFT"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=25OViHPlrDjlfagbh2iibN4Jl3Oh2Bhcbq18Fx0Ge1g=; b=D7ivdiFTtpG6ebtUmZmjZwDVYz
	vfgxQXYR71pXVP1jzgcmSXzP736Kq6uFfWLtgIWzX9xX9tLrnJ7gWZUWsq+HB0AxCJymsFddOAJ7q
	sg/5Kp8NO7NxSLtO3yLwduwliJpU3irKqG+0YQSpjXbBf18o0+vKr9J/G42eIeDbbCyEU4PkesNed
	44d+a05LFjFegNU7U5unXpKRTqkspJuFEYeCuJm4+m0+yUdD8P65nU4GhkB13KvxyyAB2M8gKpnc/
	G/+uIQdvuClUOKnlEyScmwgdO53ZT82C8RMezcsEIywYFbBjUgtTiqrwt/BEMW9GnY8CSWJE3p0Fy
	rafAZMhA==;
Received: from [50.39.124.201] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDC1b-000000028r4-2aJW;
	Fri, 09 May 2025 00:55:39 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH] Docs: driver-api/basics: add kobject_event interfaces
Date: Thu,  8 May 2025 17:55:38 -0700
Message-ID: <20250509005538.685678-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the kernel-doc comments from lib/kobject_uevent.c to the
"Kernel objects manipulation" section of driver API Basics.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>
---
 Documentation/driver-api/basics.rst |    3 +++
 1 file changed, 3 insertions(+)

--- linux-next-20250508.orig/Documentation/driver-api/basics.rst
+++ linux-next-20250508/Documentation/driver-api/basics.rst
@@ -108,6 +108,9 @@ Kernel objects manipulation
 .. kernel-doc:: lib/kobject.c
    :export:
 
+.. kernel-doc:: lib/kobject_uevent.c
+   :export:
+
 Kernel utility functions
 ------------------------
 
