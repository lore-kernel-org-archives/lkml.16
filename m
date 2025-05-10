Received: from mail.fastemail60.com (mail.fastemail60.com [102.222.20.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E58266B74
	for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 18:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=102.222.20.253
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746901145; cv=none; b=n87hEDXXHkXhW3Uy1rMc+0mTR6NNLVAsUVjXjnh4uUf24ONrGNj8EL3SnuMgPFVdNeu5E/k31vH40Eyi/ihQx/LVYy20cyjhJIcLVbX3zbOGlHlKFhH+HJ70kPrKqIazquY4d+1kNinnBndj+EOdVXIwDFxoAa07/1Dx1liuvbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746901145; c=relaxed/simple;
	bh=0kM12Ki2v7eI61I1WvQrX7nQw+DKE1uiGUA45uahRZc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AhGR2AM6pY6KXb9HkNAc7erVGERRdrk6FWjfIosjqHf/fxDyBq1ykZNslHT2dXjPI+/f2n6l6YumRsXHl0Ryfj+1kjLxrdfvIjSbqh0yvxob3ArWCNQoF4SVChRDMnjGxLRb7BwLWTkBjgo4J7KsRvqov1n1AvRmak1PLXsioWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fastemail60.com; spf=none smtp.mailfrom=fastemail60.com; dkim=pass (2048-bit key) header.d=fastemail60.com header.i=@fastemail60.com header.b=WwviCgJc; arc=none smtp.client-ip=102.222.20.253
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fastemail60.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fastemail60.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastemail60.com header.i=@fastemail60.com header.b="WwviCgJc"
Received: from fastemail60.com (unknown [194.156.79.202])
	by mail.fastemail60.com (Postfix) with ESMTPA id C4569887AD1
	for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 16:32:08 +0200 (SAST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.fastemail60.com C4569887AD1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastemail60.com;
	s=202501; t=1746887530;
	bh=0kM12Ki2v7eI61I1WvQrX7nQw+DKE1uiGUA45uahRZc=;
	h=Reply-To:From:To:Subject:Date:From;
	b=WwviCgJcovWv8tzalAMJatzEh+EHti7VXHPDMhwg6rWKLzeTOZyVbKUVn/XS0oARa
	 6uKcly5gQcr+CAMmu/IfWD1TFu03PKja3xsT2b4Vctiqhcjv/KQVhmGcOd3AT62B4k
	 cm8XVXonxKaE1oN9T5hP7ky8GnDXBX6tZCrpkUm1MF9O/+jgrxWgMTyLe082UU7yB9
	 BdIK5ksBgUptm/ubhWQVNxIQJmsXXtZe8pDjzDt17/evFpyKiT+u68QKkmHXWsvxw4
	 LNIz43ZvEbSHtsvqdwp7GC96tLWq5AiePzwWJvTazDZIjrctFg0+eyeEZPzg6QUKJC
	 xtEyVR+msKk+g==
Reply-To: import@herragontradegroup.cz
From: Philip Burchett<info@fastemail60.com>
To: linux-kernel@vger.kernel.org
Subject: Inquiry
Date: 10 May 2025 10:32:08 -0400
Message-ID: <20250510103208.EB4FA99DD8455E43@fastemail60.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (mail.fastemail60.com [0.0.0.0]); Sat, 10 May 2025 16:32:10 +0200 (SAST)

Greetings, Supplier.

Please give us your most recent catalog; we would want to order=20
from you.

I look forward to your feedback.


Philip Burchett
