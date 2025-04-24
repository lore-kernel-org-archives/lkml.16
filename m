Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4BC2D052
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 17:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745515982; cv=none; b=N81cP9x+e2BwBsHKQxJ+TMFQ31UW4IsKvxRm2Y93TXJNn9rnycnBmCCvS4t0B5LJ1+6gKbysfzxwHZIhA3Dj5CPEGsWr5VxT5zXrCN3ZdZc/hfhMs7RU+a8d5s6bb+VBM6zyFN88krLgnpox0AnXD0u3CiGrLRjw1I+aMP+PdWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745515982; c=relaxed/simple;
	bh=qROrdVTlDFGPvlKsadh4yJQebSSf3FSiX0BFm3vXcWM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=C6q6lStB0gbaossAHrxuNnb+KmkeRcd/9ODU362+wn+VhWvWBzqpE9qT4T9nNji6d1yLyn5zrbXFnO7RuEhpVQD6exI/hTziQK8V6+xN5SMHybC1zuh43kGbYlBjHOVHO+8ID+Un6WNS+cxZNdomjRseMoDA289YHXgxe0lRpHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qR4X/n66; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qR4X/n66"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28F44C4CEE3;
	Thu, 24 Apr 2025 17:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745515982;
	bh=qROrdVTlDFGPvlKsadh4yJQebSSf3FSiX0BFm3vXcWM=;
	h=From:Date:Subject:To:Cc:From;
	b=qR4X/n66IR4M6QT9AbDjwXkhnmSCesHg3Gu3qnVDnrbFuqkQGSKbLhyFuhK7PzAd1
	 Ms3B8zYRPcGgKiO8FiC9T0WyR6WW9XsvAiiA2Zr8VnYL3BDNMHaAyBQt+Quk/aIZrf
	 NATftlFfDPv94dxzaTjSW1EvKvlR7e9pl1kmZPqq0ES7TH4HQEtDycT/JEUsMUV/3d
	 /wJGj/W4jdPQXqrpSexo8kg6bdalsRP53ys2084G8iGDZqFmZiA/n711Ck6gr6s2iN
	 i1ry8b4ayo3yImlmRlbcINi5ZUtZriWbjt2FpLFGEUvnubwWFFSnRRhN5q1hSEF4Rd
	 fxcqL1jD5yydQ==
From: Simon Horman <horms@kernel.org>
Date: Thu, 24 Apr 2025 18:32:56 +0100
Subject: [PATCH] checkpatch: Correct spelling of complicated
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-checkpatch-spell-v1-1-23c448e2b5e8@kernel.org>
X-B4-Tracking: v=1; b=H4sIAMd1CmgC/x3MQQqAIBBA0avIrBNKiqKrRAsdxxwSE40IorsnL
 d/i/wcKZaYCs3gg08WFj1jRNQLQ67iRZFsNqlVD26teoifckz7Ry5IoBKkRnR6dmYyxULOUyfH
 9L5f1fT/yn67HYgAAAA==
To: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
 Dwaipayan Ray <dwaipayanray1@gmail.com>, 
 Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.0

Address spelling of complicated as flagged by codespell.

Signed-off-by: Simon Horman <horms@kernel.org>
---
 scripts/checkpatch.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 3d22bf863eec..9d917eb36705 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3323,7 +3323,7 @@ sub process {
 # A correctly formed commit description is:
 #    commit <SHA-1 hash length 12+ chars> ("Complete commit subject")
 # with the commit subject '("' prefix and '")' suffix
-# This is a fairly compilicated block as it tests for what appears to be
+# This is a fairly complicated block as it tests for what appears to be
 # bare SHA-1 hash with  minimum length of 5.  It also avoids several types of
 # possible SHA-1 matches.
 # A commit match can span multiple lines so this block attempts to find a

