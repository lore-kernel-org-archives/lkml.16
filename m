Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7602E1494C3
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 12:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750855392; cv=none; b=nwqka7/IVOtyJADPq6BduYLZO1+4hiH63qiaI3mfjFw91dzGRVA04wKEq2Ae7MNVCbenQ++FpdG1KhsFMbS386Xp/+mPMqtakwxxwbVt6fLsnR0T2Y+tToWVIVgG8KmIRJQjqPn9DfmmsLKSqV/DYg38xLobBnZWnxqlchn3zJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750855392; c=relaxed/simple;
	bh=uUm8z4DDqnoyzeKE8J+2e5V5wvfZ5wjvDsnffS2MKQk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=a/iARWE6t+kLNArk3ZVsvpY73QxW/c5IqwsuPk3wJ4o9ObJSNDlyjJvREekwlx4dMhn2Qn+KBbZOohOeqt+wyRO40sddmG/NUrKKb7KbPsbQzMVZd9//hvMTNR+vudb4NCXWgZG7QKUAmIveBiYzL7+48E+OZgFhidfBVDDJHCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PLE+I5Io; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PLE+I5Io"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 113D1C4CEEA;
	Wed, 25 Jun 2025 12:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750855392;
	bh=uUm8z4DDqnoyzeKE8J+2e5V5wvfZ5wjvDsnffS2MKQk=;
	h=From:Date:Subject:To:Cc:From;
	b=PLE+I5IoVX+EzU+d5TW9oOdwxeMSzQjJtzaO/igi5QqlXIs3h2D+1qQIzHlYqRpv6
	 +XzmGQFqffBpIRKfHWzOWOYnASppKDADgZ+7MLEmt+EjQ3Nz1CfU+0qe6+Cxizjl/W
	 zrNLBw8hIbaA5lFsF8zRdjphVGonT54SWLrBw0jEfzYaMdwyjcWZVYWb5j/60QVOQg
	 czCZIzH/wRkIe1CCjCqBe6RwB89d7ElrNaMVjK8wO5OUiR0xlFMk/LXXmklhqMHjYO
	 jsewZdUJUens+dPoZx44UjCMiLPHZ9mntxooZsTi4suxRF3nJ0Dly1Hx8TGLeWJI7H
	 OBRYh72ZIt1ZA==
From: Simon Horman <horms@kernel.org>
Date: Wed, 25 Jun 2025 13:43:05 +0100
Subject: [PATCH] compiler_types: correct spelling of suppressing
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-compiler-types-spell-v1-1-8fc747fed6e0@kernel.org>
X-B4-Tracking: v=1; b=H4sIANjuW2gC/x3MQQqDMBBG4avIrDtgRyLYqxQXrf7RgVRDRsQSv
 LvB5bd4L5MhKYxeVaaEXU3XpeD5qGiYP8sE1rGYpBZXt+J4WH9RAxJv/whjiwiBpYGHiBu/Hai
 kMcHrcW/f/Xle1AcixWYAAAA=
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Kees Cook <kees@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 linux-kernel@vger.kernel.org, Simon Horman <horms@kernel.org>
X-Mailer: b4 0.14.0

Correct spelling of suppressing as flagged by codespell.

Signed-off-by: Simon Horman <horms@kernel.org>
---
 include/linux/compiler_types.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/compiler_types.h b/include/linux/compiler_types.h
index 2b77d12e07b2..aa9de144c15b 100644
--- a/include/linux/compiler_types.h
+++ b/include/linux/compiler_types.h
@@ -392,7 +392,7 @@ struct ftrace_likely_data {
  *  1) the original use -- identifying if a CPU is 'stuck' in idle state based
  *     on it's instruction pointer. See cpu_in_idle().
  *
- *  2) supressing instrumentation around where cpuidle disables RCU; where the
+ *  2) suppressing instrumentation around where cpuidle disables RCU; where the
  *     function isn't strictly required for #1, this is interchangeable with
  *     noinstr.
  */

