Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79142609E3
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 14:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746023827; cv=none; b=M+UQOYOsINSmgoQ7zKOSmqpfLfzIXiqP4+5fRGIQdnoXN4Lm87j9sjzymIqJACDCXL948ULLoTj3dL9k328T8qAbXYNwitLZHwl5qqcXfG9u7/qVRuy4V03rzokYq4dsf+VH67ZMAIsGHL3DnLdcCARDDmyG/XskwrPRO7Ub7MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746023827; c=relaxed/simple;
	bh=Cw01BMeCM6YvnE7+TtUzkEpxFldrGUjEnSxcsjrIT4c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MHTQXyv2mMZmAtQS/1A1eoOKc/tPMMNsybJzG4PGs+dPmRSTwGhjV5Zr/RSo5tos7vRQuFvdFtQcOXDQq3rzGSCi1nHiGLijiQXBsQP4tWu7JTYiA0tPOKi2QebQOn4WC48uEQx+gsDLO9mbAMTSP1YwCA+1wu/2Lc4u9abgIS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=sQNIXZ86; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="sQNIXZ86"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DC4AC4CEE9;
	Wed, 30 Apr 2025 14:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1746023827;
	bh=Cw01BMeCM6YvnE7+TtUzkEpxFldrGUjEnSxcsjrIT4c=;
	h=Date:From:To:Cc:Subject:From;
	b=sQNIXZ86gygyH4kzJtUk54VZIp45q6TMW0t9/c95Hx3woh+QEhSdjpQUnTj+vMyZs
	 Texavzc0yfxjD387doQyurxbPFZdOLeMT4CbL6UFjrwobI0pr3m57ufpKQbfO5GMkt
	 SggjEhVaaZHWQ50H+uAzCHJCRu8poS0hykBOh5xY=
Date: Wed, 30 Apr 2025 16:36:59 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: "conduct@kernel.org" <conduct@kernel.org>,
	tech-board <tech-board@lists.linux-foundation.org>
Subject: Code of Conduct Committee report for April 2024 - March 2025
Message-ID: <2025043021-reprogram-gloss-acb5@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Linux Kernel Code of Conduct Committee: March 31, 2025

Updates to the Code of Conduct documents:
 - The Code of Conduct documentation has been updated to clearly
   outline the enforcement when Unacceptable Behavior Code
   of Conduct Violations take place, and outline the Technical
   Advisory Board's role in approving remedial actions recommended
   by the Code of Conduct Committee.

Reference:
   https://docs.kernel.org/process/code-of-conduct-interpretation.html#code-of-conduct-interpretation

In the period of April 1, 2024 through March 31, 2025, the Code of
Conduct Committee received the following reports:

Reports received: 17

Development process related reports:
 - Education and coaching on maintainers' right to accept or reject
   patches. Clarifying the expectations that developers can't demand
   their patches to be reviewed and/or accepted by the community.

   These reports were about a developer demanding their patch to be
   accepted even after repeated attempts by maintainers advising the
   developers to understand the development process.

Code of Conduct scope and enforcement related reports:
 - Education and coaching on the role and scope of the Code of Conduct.

   Several reports from people outside the kernel community reporting
   past incidents before the Code of Conduct was adopted. Reports
   resolved clarifying the scope and validity of reports about past
   incidents before adopting the Code of Conduct.

Insensitive comments reports:
 - Education and coaching on the role and scope of the Code of Conduct.

   Reports about Office of Foreign Assets Control (OFAC) related actions
   and offhand comments in technical discussions that do not rise to the
   level of violations.

Unacceptable behavior or comments in email: 6
- 4 reports resolved instituting remedial measures on two individuals
  restricting their participation in development process.

  -- Rejecting pull requests from an individual for a full release cycle.
     Reference: 1

  -- Banning an individual for 3 months from Linux kernel mailing lists.
     Reference: 2

- References:
  -- 1. https://lore.kernel.org/all/6740fc3aabec0_5eb129497@dwillia2-xfh.jf.intel.com.notmuch/
  -- 2. https://lore.kernel.org/all/67cf7499597e9_1198729450@dwillia2-xfh.jf.intel.com.notmuch/

- Others
  - Resolved with the individuals making amends for their behaviors.

We would like to thank the Linux kernel community members who have
supported the adoption of the Code of Conduct and who continue to
uphold the professional standards of our community. If you have
questions about this report, please write to <conduct@kernel.org>.

Please visit the following Code of Conduct link below for information
about the Code of Conduct Committee and previous reports:

- https://www.kernel.org/code-of-conduct.html


greg k-h
(On behalf of the Code of Conduct Committee)
