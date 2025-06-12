Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E07267F78
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 14:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749740334; cv=none; b=fTn+UVyIaIjthZeocBDkGQbCf+A446y7+F81BeC+/7Bk+n5aPfkxhqGEJQ0krpV6xlqm+CbCkZFibu4WaN2md75wOtDEGqKfHY/WEekUDeTA+y0YgyUc2sqduZgQqFlIg5V2+nGISaZ6Hre5RUsbUtiu7IiUx6Y6lRv7F7zkWTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749740334; c=relaxed/simple;
	bh=LMZP3Iit/zo/pN1qqkBLVVhcxAYQH/mYPWspVWFPNvY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oo73Mb3Al8Y38YhExfxZbhYY3OhsrD/QbyQnh4Igr/GeRZab8Ma93Bkbz88NigRiA7+yVMp4ls0OhwSW0SLj+VZFvqy8FcnXNGTLE/LjrY8shwCRwH/CgEcQqzQsZsO+Vwpu5jnDSWyb0J06JO3qocHclM+qP13TG0gCbIuvC+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c+a9WpEd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c+a9WpEd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2ACBC4CEEA;
	Thu, 12 Jun 2025 14:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749740334;
	bh=LMZP3Iit/zo/pN1qqkBLVVhcxAYQH/mYPWspVWFPNvY=;
	h=Date:From:To:Cc:Subject:From;
	b=c+a9WpEdbRr0g1a4FBFoLtsmK3mSOqCYLNnCqrCLqLQdGlOyUHHHocSSZmWK4gxoH
	 u+dgVq3sym19SZVpV6YtAQiRArAaFbLOzyAburzP5KTICGXzSfjAL4FLlJYh6JoP5/
	 mRobzdJ5P+ImGv4T6m7ETJgNL7JsevwkT9b9NF1lrUTojSrS4oQdZmM0nZR9scdfQz
	 SVS4xucHpWGBsH0hR7K3H1FyIGsjgZGWNYOHO6jXY1BWgU0u8ZnqwsgJkH6J/NVX/0
	 tfu6pC2THdyGnHEFy3+Dywfgz5aJq0G1ZFDu/CQ4//3pgoykKfWjSI+HccAnWc6CQ9
	 zwSyfxAEfF7OQ==
Date: Thu, 12 Jun 2025 11:58:51 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Adrian Hunter <adrian.hunter@intel.com>,
	Breno Leitao <leitao@debian.org>, Ian Rogers <irogers@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	James Clark <james.clark@linaro.org>, Jiri Olsa <jolsa@kernel.org>,
	Kan Liang <kan.liang@linux.intel.com>,
	Namhyung Kim <namhyung@kernel.org>
Subject: [PATCH 1/1 fyi] perf beauty: Update copy of linux/socket.h with the
 kernel sources
Message-ID: <aErrK24XLUILFH_P@x1>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tldr; Just FYI, I'm carrying this on the perf tools tree.

Full explanation:

There used to be no copies, with tools/ code using kernel headers
directly. From time to time tools/perf/ broke due to legitimate kernel
hacking. At some point Linus complained about such direct usage. Then we
adopted the current model.

See further details at:

 https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/include/uapi/README

To pick the changes in:

  b1e904999542ad67 ("net: pass const to msg_data_left()")

That don't result in any changes in the tables generated from that
header.

This silences this perf build warning:

  Warning: Kernel ABI header differences:
    diff -u tools/perf/trace/beauty/include/linux/socket.h include/linux/socket.h

Please see tools/include/uapi/README for details.

Cc: Adrian Hunter <adrian.hunter@intel.com>
Cc: Breno Leitao <leitao@debian.org>
Cc: Ian Rogers <irogers@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: James Clark <james.clark@linaro.org>
Cc: Jiri Olsa <jolsa@kernel.org>
Cc: Kan Liang <kan.liang@linux.intel.com>
Cc: Namhyung Kim <namhyung@kernel.org>
Link: https://lore.kernel.org/r/
Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
---
 tools/perf/trace/beauty/include/linux/socket.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/trace/beauty/include/linux/socket.h b/tools/perf/trace/beauty/include/linux/socket.h
index c3322eb3d6865d5e..3b262487ec06032b 100644
--- a/tools/perf/trace/beauty/include/linux/socket.h
+++ b/tools/perf/trace/beauty/include/linux/socket.h
@@ -168,7 +168,7 @@ static inline struct cmsghdr * cmsg_nxthdr (struct msghdr *__msg, struct cmsghdr
 	return __cmsg_nxthdr(__msg->msg_control, __msg->msg_controllen, __cmsg);
 }
 
-static inline size_t msg_data_left(struct msghdr *msg)
+static inline size_t msg_data_left(const struct msghdr *msg)
 {
 	return iov_iter_count(&msg->msg_iter);
 }
-- 
2.49.0

