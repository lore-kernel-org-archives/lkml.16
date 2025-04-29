Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB8621325C
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 13:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745934843; cv=none; b=UJGUD9fgzGhCKj2aQZY/TSAITFxZ6sR/h6mwaaX9IxFATheBSMvrJp3q8UTtd/9jM9breBxXXG354M3OYt1a8/v+JlDxxSNkCHPcsjkDlxLrbCNgSxSGQu6pyMPqCnuS77XPPv+fT06RdNteO3U+9qGb0l7ggyjPpn7RbKFsTqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745934843; c=relaxed/simple;
	bh=uHMOP+tW+JRTQngEZVT7r2eQkXXsdFP+qdkfIisZk/8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=KLrjK/n1tDq8wSrGCFyvzPk5Ye1AdTzCJnb0Bf83mDdss8aS7m7aeq1+excZ3vgfV+sj8bsgKRi95R9ys1LllzGc5EXFxvDytWebWDTFoI07UxvHYpp/HH8lj3YxnmNJk5KX1ft63FP1R60ebBM8oHv5a1GqhnvkJh9MVpmgya8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io; spf=pass smtp.mailfrom=rosenzweig.io; dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b=Rkam68wZ; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="Rkam68wZ"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1745934839;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E1lLURUsSdwGQwA1DpK4H0AkncQTf8FYKvvqWja0pLQ=;
	b=Rkam68wZr3GwpXXOltzrIfaHGz2wSBbLk2/ZSBAUayXSEqmhoO/gBRFhfe4VLJDH8ENfO9
	q5WtRKdHRG7MawzWAugt8HQAIqpI8TcOTxjK+/7R0aBVQU+YdK6Fj6jtgVHt/Xircm6rKz
	9ZkygCJ6CotJd7YZXS5c9QvU4jJF2WiBimV187N0GyJZ4slP3OS4BFmj3JGCg+lMfOsnLq
	KinrflfSea4V8hqRo22O2lfgWCjexZHiHy6CXzWLr2ATANxhJLCpgjAPoNaK5Gvpiw+lDt
	6kzHaMAU/kse2Ffku084rc+bJaMhUFEIj0txBCZfd8UhIsd89ekxlb70exK+PA==
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>, 
 Maciej Falkowski <maciej.falkowski@linux.intel.com>, 
 Lizhi Hou <lizhi.hou@amd.com>, Aun-Ali Zaidi <admin@kodeit.net>, 
 Aditya Garg <gargaditya08@live.com>
Cc: dri-devel@lists.freedesktop.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
In-Reply-To: <PN3PR01MB95970778982F28E4A3751392B8B72@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
References: <PN3PR01MB95970778982F28E4A3751392B8B72@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Subject: Re: [PATCH] drm/appletbdrm: Make appletbdrm depend on X86
Message-Id: <174593483784.171975.17962822910849331538.b4-ty@rosenzweig.io>
Date: Tue, 29 Apr 2025 09:53:57 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


On Thu, 10 Apr 2025 23:50:01 +0530, Aditya Garg wrote:
> The appletbdrm driver is exclusively for Touch Bars on x86 Intel Macs.
> The M1 Macs have a separate driver. So, lets avoid compiling it for
> other architectures.
> 
> 

Applied, thanks!

[1/1] drm/appletbdrm: Make appletbdrm depend on X86
      commit: de5fbbe1531f645c8b56098be8d1faf31e46f7f0

Best regards,
-- 
Alyssa Rosenzweig <alyssa@rosenzweig.io>

