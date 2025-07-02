Received: from mail-m15580.qiye.163.com (mail-m15580.qiye.163.com [101.71.155.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E67D275B06;
	Wed,  2 Jul 2025 13:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751461625; cv=none; b=ZHKcpvA1LI3H9oW4zl/15Z9eIrPS5iCVqEPMxH+omVkKrfQH0YNt2mlsM6mHaW/xYIivfmToUFsrJFXDCuwAKL2zJZUYBJZZv1cQsLGyC3f0gy/aPmnLFZ/GgBAuRyOTm+8vd0mTC6/UmCoyfseok1FxawgQRg0EhnRYnyd+cDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751461625; c=relaxed/simple;
	bh=C86Nj4j8sa5kMJmGRiyGwOaW3dqu2Ko61hQwEyhr7CU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gpnoiNtCSdlpuouLQr85FX2WNUCtHHLsILVglQuMmAj6iwl/IDMLA8UvavsZFPIv17RQ5FAHHY4t9Ql+de+6shXjqDuTzp7WVzenSG1g3ZfnKKCFlmeb0ZurVMfvCirh2g+EzTTJyizUfrDwFJR9sVB5+faG8l2e/q2lAx/qnR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=D1W3z4I5; arc=none smtp.client-ip=101.71.155.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="D1W3z4I5"
Received: from localhost.localdomain (unknown [117.184.129.134])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1aaecf0f1;
	Wed, 2 Jul 2025 20:31:33 +0800 (GMT+08:00)
From: Albert Yang <yangzh0906@thundersoft.com>
To: krzk@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/8] arm64: dts: bst: add support for Black Sesame Technologies C1200 CDCU1.0 board
Date: Wed,  2 Jul 2025 20:31:33 +0800
Message-Id: <20250702123133.3613126-1-yangzh0906@thundersoft.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <a570b833-0619-4d1a-909f-971ba08f4202@kernel.org>
References: <a570b833-0619-4d1a-909f-971ba08f4202@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaT09IVk0fT0hKQhlKT0oYSFYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSkxVSkNPVUpJQlVKSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpOTEpVSk
	tLVUpCS0tZBg++
X-HM-Tid: 0a97cb1ef7a409cckunm04f03588425578
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MT46CTo6FzExPE4PSUMtHT4C
	ERcwFENVSlVKTE5KT05CT0JPQkxKVTMWGhIXVQIaFRwBE0tCS007DxMOFR8eCQgUHQ9VGBQWRVlX
	WRILWUFZSkpMVUpDT1VKSUJVSkhPWVdZCAFZQUhKS003Bg++
DKIM-Signature:a=rsa-sha256;
	b=D1W3z4I516N9g+9guQ8Xs6Vx0djrJ7Kyp6y6mXfU1NrGA7bFh4L1GkPyLVCy9hQRSuEKgkQo2dfNkWIQlwbN2MV8qq3e87xdbK55EEnCoJYdeOTkcT27knWGsH2hnoS2FFBZj39HGeMTnIS5Al+dui9Ule2qfQdQeSaEglrY6zE=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=GvRC5yQrOK6GqqxZKCbY7Q/4BSYWG7oUxuoBfHuLWOg=;
	h=date:mime-version:subject:message-id:from;

Hi Krzysztof,

Thank you for your detailed review and feedback. I have addressed all the issues you mentioned:

> This is messed. SoB does not go to changelog. Apply your patch and look
> at result - do you see SoB? No, because changelog is stripped.
> submitting patches explains how this is supposed to look like.

Fixed. Moved Signed-off-by lines to the correct position in commit message, 
outside of the changelog section.

> Nothing improved. I asked to follow DTS coding style in ordering.

Fixed. Reordered all nodes according to DTS coding style:
- Root level nodes: alphabetically ordered (clk_mmc → cpus → psci → soc → timer)
- SoC nodes: ordered by address (uart0@20008000 → mmc0@22200000 → gic@32800000)
- Applied consistent ordering throughout the dtsi file

> l2-cache. Otherwise it is incomplete, so add the second one.

Fixed. Renamed l2-cache-1 to l2-cache as per standard naming convention.

> Why do you have multiple memory nodes, not one?

Fixed. Consolidated multiple memory nodes into a single memory node with 
multiple reg entries as required by Device Tree specification:

Before (incorrect):
  memory@800151000 { reg = <0x8 0x00151000 0x0 0x1000>; };
  memory@800254000 { reg = <0x8 0x00254000 0x0 0x1000>; };
  ...

After (correct):
  memory@800151000 {
    reg = <0x8 0x00151000 0x0 0x1000>,
          <0x8 0x00254000 0x0 0x1000>,
          <0x8 0x10000000 0x0 0x30000000>,
          <0x8 0xc0000000 0x1 0x0>,
          <0xc 0x00000000 0x0 0x40000000>;
  };

> It does not look like you tested the DTS against bindings. Please run
> `make dtbs_check W=1`

Fixed. Ran `make dtbs_check W=1` and verified no schema violations. 
DTB builds successfully without warnings.

> This is not a DTS patch. (regarding defconfig)

Fixed. Moved all defconfig changes to a separate dedicated commit as suggested.
The DTS commit now only contains device tree related changes.

Additionally, I have addressed all feedback from the v1 review:
- Fixed reserved-memory node naming (mmc0-reserved@5160000)
- Corrected all property ordering according to DTS coding style
- Ensured all nodes follow standard naming conventions

All changes have been tested with:
- make ARCH=arm64 bst/bstc1200-cdcu1.0-adas_4c2g.dtb W=1 (successful)
- DTB validation passes without errors

I will send v3 with all these fixes applied.

Best regards,
Albert Yang
