Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35841E570D
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 09:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747129337; cv=none; b=r5gEXugfcZmP+FBBSA242JQo60vfLfL7RWGysuwyLRF9r3vRIlJpFP4hQYb30esa6370HPwjaIkpQXz5sLnlAHgUI6ln9jTvwqLcEbB0uURpnef0R2AJjUi1eqzyFQ2R8+kj/To7MLSvZLokVQS6N5XLGjIAQcBSnrrb5v18tBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747129337; c=relaxed/simple;
	bh=gbD9r76EgD8pOn38U6ofM7c5nj1E/khd6ekYQTBsaV4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=e8zjWSlF352tLDNGe4ghKwr0kEdNQEDyb5PjB5HALYbnpqx/RwiTm5UIDdcZdAKJBFYjrGjO75dIm9rmhx9DQeoWlwnjz4BRyagmVoczkg5qvIRGDMTKlZAUvLC8ih0ZEVTcMssaLyIbebXZfzi2nAnoC7Mq5EWCcEKxwy3ZE4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=nk5mhCKc; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="nk5mhCKc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747129326;
	bh=gbD9r76EgD8pOn38U6ofM7c5nj1E/khd6ekYQTBsaV4=;
	h=Date:From:Subject:To:Cc:From;
	b=nk5mhCKc7dS6TXT8THcgYILVTXBh7d8n04xFmFy4szxn/XW2N+YltnKPsv0Pt7WMr
	 EelKtucefOD4s6+7J7bD6R5i14/W2l9lbZAkwAI9W/NICd/NdkEtXscRDVXaWE4Dnx
	 +fnuZgWpPRvHIBKwv7S54SHr1Ar1Da50PW4M79Y26Jvjk0gRSGcK/lsrTPrRqd3z/o
	 S+CmU52dNKlkBEuWTku+Iyfg6co1Vqrzr3B7j2hPcQ2UBuNe7jfxgzaQmq8L4P2lTQ
	 a1tbUdu8LbzPTerUVzCQDU/xNu6JXd1m/9DoH2O5GgSh2xmnBQ1O/MA3cMcljmDr+1
	 fL8u3h0QcX6SA==
Received: from [192.168.50.250] (unknown [171.76.80.110])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7759117E0E2D;
	Tue, 13 May 2025 11:42:04 +0200 (CEST)
Message-ID: <eb9281cc-de91-48a4-bbd6-f67ddc67a9dd@collabora.com>
Date: Tue, 13 May 2025 15:11:56 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Vignesh Raman <vignesh.raman@collabora.com>
Subject: amlogic: Synchronous Abort with v6.15-rc6
To: linux-amlogic <linux-amlogic@lists.infradead.org>
Cc: neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, sboyd@kernel.org,
 daniels <daniels@collabora.com>, Daniel Stone <daniel@fooishbar.org>,
 lumag@kernel.org, robdclark <robdclark@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

The Amlogic Meson G12B (A311D) SoC board (meson-g12b-a311d-khadas-vim3) 
fails to boot with the following logs,

https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/76210200

02:58:27.819: Starting kernel ...
02:58:27.819: "Synchronous Abort" handler, esr 0x96000010, far 0x51000d8
02:58:27.819: "Synchronous Abort" handler, esr 0x96000010, far 0x51000c8
02:58:27.819: elr: 0000000001002a48 lr : 0000000001002c88 (reloc)
02:58:27.819: elr: 00000000f2f26a48 lr : 00000000f2f26c88
02:58:27.819: x0 : 00000000050fffc0 x1 : 0000000001004383
02:58:27.819: x2 : 00000000f2f6a358 x3 : 000000000000003f
02:58:27.819: x4 : 00000000f4fefffc x5 : 0000000000000010
02:58:27.819: x6 : 00000000f4e5b000 x7 : 00000000050fffa0
02:58:27.819: x8 : 0000000000000008 x9 : 0000000000000001
02:58:27.820: x10: 0000000000000010 x11: 0000000000000004
02:58:27.820: x12: 00000000f4fefc00 x13: 0000000000000000
02:58:27.820: x14: 00000000f4fefc00 x15: 0000000000000000
02:58:27.820: x16: 00000000f2f6d0e0 x17: 0000000000c0c0c0
02:58:27.820: x18: 00000000f0f21d90 x19: 00000000050fffc0
02:58:27.820: x20: 0000000000000000 x21: 000000007ffe9000
02:58:27.820: x22: 0000000000001710 x23: 00000000f0f0e8c0
02:58:27.820: x24: 0000000000000000 x25: 0000000000000000
02:58:27.820: x26: 0000000000000000 x27: 0000000000000000
02:58:27.820: x28: 00000000f0f4f790 x29: 00000000050fff60
02:58:27.820: Code: a9025bf5 f9001bf7 f9400641 36000141 (f9408663)
02:58:27.820: Resetting CPU ...

The board boots successfully in v6.14-rc7, but the issue appears 
starting from v6.15-rc1. These tests were run in drm-ci.

On bisecting the kernel, the first bad commit identified by git biscet is,

59c35416f4246aee66b5f5523fdc950b83325d82 is the first bad commit
commit 59c35416f4246aee66b5f5523fdc950b83325d82
Merge: 472863ab2aca e988adcb5dee
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat Mar 29 17:23:34 2025 -0700

     Merge tag 'clk-for-linus' of 
git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux

Please could you look into this issue. Thank you.

Regards,
Vignesh
