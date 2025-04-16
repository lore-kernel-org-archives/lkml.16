Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E0F238D5B
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 12:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744805184; cv=none; b=cCi0JCkA8IHpA0m1DutEYD9IYptanR22jlHoatAQqT7O6dXcEtBhtpPqSbzREOxebJbBpQhXAzVfgpy9AWk58p2JE5pz+RPRZ5nF/SMlNzSDvuG2dymPj5Wk5kCuTSJh22js9NYtTOO8CoKBF4sn+6MsTqfTZAYH+5xfL1J2YiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744805184; c=relaxed/simple;
	bh=KjF68NCnMRGqZzLfIPvI9nELbRNgpssMj1H6sf6H8JM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DOXWjLrG4OAqczlFxL5w+vR70zbdTV78a/Tw5mDJMfA7IvBluLUpApyfAbKZQLqZqOEXXYhPnrWaDqbUA70Rv76jki7ieAW6BiOTUY8UfIPPWQbgHvmUuEDxJxvBI7Qr9OG/XRtPYYg7JfcOLrIWcWvMigmA1IS5PzmuZv02IKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=afJ3JEj5; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=7hAqJzOo; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="afJ3JEj5";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="7hAqJzOo"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744805180;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+X2hsuA59wU5wfmzTXigIqMAC2mDoN02nGLGBH9t0mc=;
	b=afJ3JEj5LvrWQ/4uscOT9M0SpM2OOAGiZAP7F1IdQEQmUl1hZHMq4NF1Ozax2ezs2sAkvi
	Ap7s0Aa33/DUhDX7JEmsuAoCVEtUEnU4Ob2PLULhRl7zQmrT0AWtMfr8fHsVHI99nBRiAQ
	i+s+WSC5PMDvKHABtnDITW7QeCgZm4EHXB5CFDLfKIiT5QppZJXY9uwYNP84qo2+J9n9Vy
	ovE8trTrwD2MTFVa0eWDbCJEiK2BfBBeSvPSjnW1a+RRDzEj9lJtkmvEQp5IBRfeg5iqaT
	MnA0QzEqn/Al2+QGwMGMlIhVJZjc5iwtW927Jvcuy2bTd/OEeVH+EtKLOzwvLA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744805180;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+X2hsuA59wU5wfmzTXigIqMAC2mDoN02nGLGBH9t0mc=;
	b=7hAqJzOogtwb92BkCjYeC+qN5lAwTCr0g5S5A3CrMHafFOBcp1E+mF0gj+dweoM5zLqN2Y
	s/JCMJTi4DML/bDQ==
Subject: [PATCH 00/10] tools/nolibc: split out functionality into new
 headers
Date: Wed, 16 Apr 2025 14:06:15 +0200
Message-Id: <20250416-nolibc-split-sys-v1-0-a069a3f1d145@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIADid/2cC/x3MQQ5AMBBA0avIrE1CizauIhbUYJKmpCNCxN01l
 m/x/wNCkUmgzR6IdLLwFhLKPAO3DmEh5CkZVKHqoiobDJvn0aHsng+UW5DMbLXVyg3GQMr2SDN
 f/7Lr3/cDcDv75mIAAAA=
X-Change-ID: 20250416-nolibc-split-sys-e7f83832ca77
To: Willy Tarreau <w@1wt.eu>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744805177; l=2228;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=KjF68NCnMRGqZzLfIPvI9nELbRNgpssMj1H6sf6H8JM=;
 b=wD3W5mM/Dv6yY80RSjJioejwCxyPH6CGxjg65qfv1VSdcelhnHnciQXfpcv8T85YNaX97ub3S
 lSMqHAFw2YWC91hfRaiyvXRes21moUqBvF5oo2loIGBG7NIrEE0MSyF
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

Porting applications to nolibc is made harder by the lack of standard
header names. Split out the existing functionality from the big catch-all
headers into new dedicated ones.

This series does not introduce any new logic.

The last patch for sys/wait.h will conflict with 
"tools/nolibc: implement waitpid() in terms of waitid()" [0].
But as both patches will go through the nolibc tree anyways we can take
care of the conflict there.

Based on linux-nolibc.git/next

[0] https://lore.kernel.org/lkml/20250411-nolibc-kselftest-harness-v3-21-4d9c0295893f@linutronix.de/

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
Thomas Weißschuh (10):
      tools/nolibc: prepare for headers in subdirectories
      tools/nolibc: add elf.h
      tools/nolibc: move open() and friends to fcntl.h
      tools/nolibc: move getauxval() to sys/auxv.h
      tools/nolibc: move mmap() and friends to sys/mman.h
      tools/nolibc: move stat() and friends to sys/stat.h
      tools/nolibc: move syscall() to sys/syscall.h
      tools/nolibc: move gettimeofday() to sys/time.h
      tools/nolibc: add sys/types.h shim
      tools/nolibc: move wait() and friends to sys/wait.h

 tools/include/nolibc/Makefile      |  11 +-
 tools/include/nolibc/dirent.h      |   1 +
 tools/include/nolibc/elf.h         |  15 +++
 tools/include/nolibc/fcntl.h       |  69 +++++++++++
 tools/include/nolibc/nolibc.h      |   8 ++
 tools/include/nolibc/stdlib.h      |  26 -----
 tools/include/nolibc/sys.h         | 230 -------------------------------------
 tools/include/nolibc/sys/auxv.h    |  41 +++++++
 tools/include/nolibc/sys/mman.h    |  63 ++++++++++
 tools/include/nolibc/sys/stat.h    |  74 ++++++++++++
 tools/include/nolibc/sys/syscall.h |  19 +++
 tools/include/nolibc/sys/time.h    |  36 ++++++
 tools/include/nolibc/sys/types.h   |   7 ++
 tools/include/nolibc/sys/wait.h    |  71 ++++++++++++
 tools/include/nolibc/unistd.h      |   6 -
 15 files changed, 414 insertions(+), 263 deletions(-)
---
base-commit: 7c73c10b906778384843b9d3ac6c2224727bbf5c
change-id: 20250416-nolibc-split-sys-e7f83832ca77

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>

