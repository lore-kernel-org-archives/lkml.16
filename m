Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F89D78F5B
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 01:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738632506; cv=none; b=M8q+CYmGlPsZMa5bORp+8R8eNMtq8ytbggtGnLo1XE0Lbalsv3wrifWPqzlAV8MLr4wjwbOMKTFz+TAb231JSCvGCiHnMGuXiSbF6jdNKaq88wP7Co61loLSf2cjaUshsPCkEE0QTZ0wW9s7t4p53f5zRWteZ4QACq/WhGebPW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738632506; c=relaxed/simple;
	bh=zRDb8IOYGvmlXWuVKT5AYO2bgAWZILWEV5h6yMwNaSU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hfC0D2X8odEiL3KwVPi3XADZSdBhFsIR3gvJ+3VNrumEJJChVMsNpbJwQBNyBhi5KqFdVyLCetZQK3XWNBXVTSUw1xKk15k7NMj+anYHHWgb3EQQ4XzJghMj0YrDrZ4kf7sqcLP7jQwwHVd0/WbPlDCscKlWZvVyLoC5FJfuOmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H6WT0SlC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H6WT0SlC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDD86C4CEE0;
	Tue,  4 Feb 2025 01:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738632505;
	bh=zRDb8IOYGvmlXWuVKT5AYO2bgAWZILWEV5h6yMwNaSU=;
	h=From:To:Cc:Subject:Date:From;
	b=H6WT0SlCNkTE2TL3CSWKa74bNMQaABQltk4ugPu7I82Cqk8Zm5019mb4B+o6JmPxw
	 T1NCmyBqItGKMbqdlp61APCYjE3PJUc12+HjEeD7HkjMS3xF/7sBFaYtQYzVAmcj8c
	 07ccJqfP35y854Ozcr4f/8eOUyqbFVcDFZoTLc2xsM6hbqxF8QWrpK6Q1Zssc8PeXZ
	 ud29tkm51IEfdOj9IsZjpmoHyUtTts/PYd8eTHI0Jk66foZ9VOsdGWGEyaFxkpArex
	 dm8Dj1UoiJPe3YdTTWVCqUyDarxD/I1nouPoV0JNRHC2AQOeKo3rnW48YMczk9eNUy
	 IfMvIkdRNuXNw==
From: carlos.bilbao@kernel.org
To: apw@canonical.com,
	joe@perches.com,
	dwaipayanray1@gmail.com,
	lukas.bulwahn@gmail.com
Cc: bilbao@vt.edu,
	linux-kernel@vger.kernel.org,
	Carlos Bilbao <carlos.bilbao@kernel.org>
Subject: [PATCH 0/1] checkpatch: add --branch option to check commits in current branch
Date: Mon,  3 Feb 2025 19:28:21 -0600
Message-ID: <20250204012822.1379477-1-carlos.bilbao@kernel.org>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Carlos Bilbao <carlos.bilbao@kernel.org>

I thought it would help to add an option --branch in checkpatch.pl to
check multiple commits within a branch. In my experience, after creating
a new experimental branch, I often need to generate multiple patches and
run the script on each one individually. If there's an issue, I've to go
back, which IMHO is little tedious. That's why I think this option may
help reduce manual work. Below are some tests on the expected behavior.

No new commits since upstream:

$ git checkout -b up-to-date
$ git branch --set-upstream-to=check_branch up-to-date
$ ./scripts/checkpatch.pl --branch
Using as upstream branch: check_branch
No commits found between check_branch and up-to-date. Exiting.

With two new commits:

$ git commit --allow-empty -m "Commit 1"
$ git commit --allow-empty -m "Commit 2"
$ ./scripts/checkpatch.pl --branch
Using as upstream branch: check_branch
Checking 2 commits...
ERROR: Does not appear to be a unified-diff format patch

As edge case, with unconfigured upstream:

18:54 [linux][check_branch ?]$ git branch
* check_branch
  docs-next
18:54 [linux][check_branch ?]$ ./scripts/checkpatch.pl --branch
No explicit upstream branch found in reflog, trying git branch -vv.
No upstream branch found. Would you like to specify one? [y/n] n
Using as upstream branch: master
No commits found between master and check_branch. Exiting.

but if the user is willing to help:

18:54 [linux][check_branch ?]$ ./scripts/checkpatch.pl --branch
No explicit upstream branch found in reflog, trying git branch -vv.
No upstream branch found. Would you like to specify one? [y/n] y
Please enter: docs-next
Using as upstream branch: docs-next
Checking 1 commits...
WARNING: Missing commit description - Add an appropriate one

ERROR: Missing Signed-off-by: line(s)

total: 1 errors, 1 warnings, 89 lines checked

NOTE: For some of the reported defects, checkpatch may be able to
      mechanically convert to the typical style using --fix or --fix-inplace.

Commit 90dd5899dfd3 ("test") has style problems, please review.

NOTE: If any of the errors are false positives, please report
      them to the maintainer, see CHECKPATCH in MAINTAINERS.
18:54 [linux][check_branch ?]$


Carlos:
  checkpatch: add --branch option to check commits in current branch

