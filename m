Received: from mail-m49236.qiye.163.com (mail-m49236.qiye.163.com [45.254.49.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D48D2DCF68
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 09:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751536671; cv=none; b=oT5ycuOe0sxmj91Tx3vKZ4SPtPyirXUj3njoFkvXJ2LqsvK0iPVAa68SEqDZyOtUfNWZSqgXqTfaxfYh5defebWUU4ljopxXnZKyS3XXXaPt+MxhTR044aWvsBqZsG0L5Ni+bAaLNf/Jr9dGhOIbH50+9OafKZVnJhSRLuMqG1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751536671; c=relaxed/simple;
	bh=vVskXXiuyCBJ3SlftbGvCJVwgWO/SADLWkCG/dfPZn8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NS26P81teBN82iAt8IjhIJEg7Jwqs5u5MgH3CWRmxPyY2piqBaJvA7ZEJk8oM3NgsDRFg16u05PfieZZezMM14vpozzvwDqAbR1RvdPHb/Gh5ftIlqyma48x1ETY+B9XwWu05hudn9BDooRPB+GWFu1ZQfDepWV+d5YctrgCihM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=NBqBLOYn; arc=none smtp.client-ip=45.254.49.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="NBqBLOYn"
Received: from localhost.localdomain (unknown [117.184.129.134])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1accb52e0;
	Thu, 3 Jul 2025 17:22:14 +0800 (GMT+08:00)
From: Albert Yang <yangzh0906@thundersoft.com>
To: krzk@kernel.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/8] arm64: Kconfig: add ARCH_BST for bst silicons
Date: Thu,  3 Jul 2025 17:22:13 +0800
Message-Id: <20250703092213.222474-1-yangzh0906@thundersoft.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <d676ddc8-0e4a-456a-8aa2-15ba898c44de@kernel.org>
References: <d676ddc8-0e4a-456a-8aa2-15ba898c44de@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDGEoeVk9NTE9LHxofHRofTVYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSkxVSkNPVUpJQlVKSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpOTE5VSk
	tLVUpCS0tZBg++
X-HM-Tid: 0a97cf97ff7f09cckunmb83f96175e4255
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Mjo6Mxw5MjE9HkI8Fj0NH0hK
	EEoaCQlVSlVKTE5KTkhPTkhOTUlPVTMWGhIXVQIaFRwBE0tCS007DxMOFR8eCQgUHQ9VGBQWRVlX
	WRILWUFZSkpMVUpDT1VKSUJVSkhPWVdZCAFZQUpDSUo3Bg++
DKIM-Signature:a=rsa-sha256;
	b=NBqBLOYnDCn/2rlXT10GVPpUFrc06QR5PA2DEARJJ7Tko0jmjtlrXKxUA2Cftzxp685Pr3C8FNS/0yWYMPoajYQWahA0ElXugzahBEfppwO7wNcJodTmNCGQMi+mLRcqMN5HNLsRBSYZMeh3ZadBWoj9xVAVZhb3Iss9h5bXsEY=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=srX6kH0UrTbZhO+d3+7kFfFmGiVeOERQzXEmjHHH1Q0=;
	h=date:mime-version:subject:message-id:from;

Hi Krzysztof,

Thank you for the feedback.

> All your patches come in some big delays (this one came 2.5h later).
> Maybe there is something with mail server on your side?

You are right, there seems to be an issue with mail delivery timing. I will investigate this and consider using b4 send for future submissions to ensure reliable delivery.

> Why this change?

You are absolutely correct to point this out. The extra blank lines at the end of the file were added accidentally and serve no purpose. I have removed them.

Changes made:
1. Removed the unnecessary blank lines at the end of Kconfig.platforms
2. Corrected changelog placement:
   - Initially I incorrectly placed changelog in the commit message
   - Per Linux kernel documentation, changelog should be placed after the "---" separator
   - Removed changelog from commit message to follow proper kernel conventions
   - The changelog will be included after "---" when sending patches via git format-patch

The updated commit properly describes the purpose and scope of the configuration option without any extraneous whitespace changes, and follows correct Linux kernel commit message format.

Best regards,
Albert Yang
