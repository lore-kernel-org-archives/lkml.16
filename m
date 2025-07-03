Received: from mail-m32120.qiye.163.com (mail-m32120.qiye.163.com [220.197.32.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3EBB2DE6FC;
	Thu,  3 Jul 2025 05:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751518985; cv=none; b=lZYkNO8so6/zc824RCQal7a6++IwGAxvmH934onwa3bLRD/gJg9vVeLCNMZ4A9sCvdQOoZK5FLQzR3+sn485VNQ5M0FfDajX4aUX6k2bI9EO7S19O6A6sOOj4P0CmP7dq28rFEwPvm2ojszU72TpjjdLueyfuU1kGmukSfT041E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751518985; c=relaxed/simple;
	bh=iYMKqf5avjr+g3XPzcixJlsuO4LQdPf1nBoLZVMiQng=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TgbKLYJP0UrwmwnrPz5M63y5clY23wq3K2pTvN00ZIXy8ZeWQBcycOWkrZuhq7Nva3V8aColPwdjmn4tUVoqfhMWXC/MW/ytI4bvF6IW6LIO/ungExFqynA2TzJsw7Q+s4hAO8u0PuI102xC4MliVuT4MDgo1oKI8UVHR8yiBZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=BSMAk/mc; arc=none smtp.client-ip=220.197.32.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="BSMAk/mc"
Received: from localhost.localdomain (unknown [117.184.129.134])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1ac2888fc;
	Thu, 3 Jul 2025 13:02:53 +0800 (GMT+08:00)
From: Albert Yang <yangzh0906@thundersoft.com>
To: krzk@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/8] dt-bindings: vendor-prefixes: Add Black Sesame Technologies Co., Ltd.
Date: Thu,  3 Jul 2025 13:02:52 +0800
Message-Id: <20250703050252.4104290-1-yangzh0906@thundersoft.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <c9160561-3792-4230-a7f6-57caf35f9a1d@kernel.org>
References: <c9160561-3792-4230-a7f6-57caf35f9a1d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaGk1JVk4eH0MdTU4fGU1CH1YVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSkxVSkNPVUpJQlVKSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpOTEpVSk
	tLVUpCS0tZBg++
X-HM-Tid: 0a97ceaa8d0f09cckunm8b3059b7562d72
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Pgg6Dxw5TTE6AkwaNRIZECwP
	FhFPCiJVSlVKTE5KTkpDQkxPSUNJVTMWGhIXVQIaFRwBE0tCS007DxMOFR8eCQgUHQ9VGBQWRVlX
	WRILWUFZSkpMVUpDT1VKSUJVSkhPWVdZCAFZQUlISE83Bg++
DKIM-Signature:a=rsa-sha256;
	b=BSMAk/mc2Z372jIJuTVax7HuBGA6/5qf85k6ZJ4aDgiV1HSfEOWoftJO3dRUNdWzYwlZWjltXq+IIYs9yQCBxYga/UETLBXlgL9obgjGrDFT0G+t43F+1Drp96Ja97Z2MuLps86oni4mSWCyhg92IQKyyb1n6dtA6TW+OqX5/4U=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=iYMKqf5avjr+g3XPzcixJlsuO4LQdPf1nBoLZVMiQng=;
	h=date:mime-version:subject:message-id:from;

Hi Krzysztof,

Thank you for your feedback.

> Why is this attached to v1?

I apologize for the confusion. This is indeed v2 of the patch series. The patch itself hasn't changed from v1 because it already received Rob Herring's Acked-by in the v1 review.

> Where is the changelog?

You are right to ask for this. For this specific patch (1/8), there is no changelog because it received "Acked-by: Rob Herring (Arm) <robh@kernel.org>" in v1 and required no modifications. However, I should have included a note in the cover letter explaining that some patches were unchanged from v1.

The changes in v2 were primarily in other patches of the series (DTS consolidation, defconfig separation, etc.) based on your previous review feedback.

> Most of your emails did not reach mailing list. I also did not get them.
> ... and the huge amount of CC list, mostly redundant and not relevant to
> this work, could explain that. Don't Cc random people.

You are absolutely correct, and I apologize for this. I used get_maintainer.pl without proper filtering, which resulted in an unnecessarily large CC list. For future submissions, I will:

1. Limit TO/CC to only directly relevant maintainers and lists
2. Use a more targeted recipient list
3. Consider using b4 send if delivery issues persist

> Anyway, fix above points - all three - and resend after 24h at least.

I will prepare v3 with:
1. Proper changelog documentation in the cover letter
2. Reduced and targeted recipient lists
3. Clear indication of which patches changed vs. which carried forward acks

Thank you for your patience and guidance on proper submission practices.

Best regards,
Albert Yang
