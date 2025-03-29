Received: from out162-62-57-64.mail.qq.com (out162-62-57-64.mail.qq.com [162.62.57.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC12A12CDAE
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 09:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743241553; cv=none; b=pYviSGqzQZRW/8KzijWzuQVphCYXanAEQvCiaTvGdR07fcuRzaiZOITjW85X23IQo2pFXgte5/24Ikl8gALkPICOObqEFJt7VsqULiIH6gp+GwBRHUVhDqQYYhp0HHEekHTLkQrpGN4gE9JV6FjD3PhyBRHTUdahO81JVQ/SEXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743241553; c=relaxed/simple;
	bh=uO0d9BIDO/bpbSee2FKDT0UDLR8JNdmMg5johFY31FI=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=F7pI7bE4vuxvGOvPFZLuWD5RGEUFYMMWcnI7I2KCZCgB4iYkAWYxjDq65X/8/SA1hxh18f/O5o3lgOfFZSlxSZrgwEW6pGqRdZ6TYDnC6ad4q6NiWCNv64LmGGzKP78nyh+izG+cWZV35ym9AXpYnqc7AuhHVp9JDpad2lKOtt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=Red54.com; spf=pass smtp.mailfrom=red54.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=gE2qjxcV; arc=none smtp.client-ip=162.62.57.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=Red54.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=red54.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="gE2qjxcV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1743241542; bh=uO0d9BIDO/bpbSee2FKDT0UDLR8JNdmMg5johFY31FI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gE2qjxcVLpvI7phK862sAG6G8inP0C4BwJdrKNZC37FghUGF/dmJT010gwQMTM0Gz
	 MG3H25VX6LDhbY0b0HsSMwwkIXc40joLyxx25zcxNV46T2Iw0E1zOjjOzB+AhuqTMn
	 58b3Y4ap9jpYmhKWwWzfbvap+OBQNH4iH1RIU0Vo=
Received: from mail.red54.com ([139.99.8.57])
	by newxmesmtplogicsvrszc13-0.qq.com (NewEsmtp) with SMTP
	id B322E276; Sat, 29 Mar 2025 17:44:50 +0800
X-QQ-mid: xmsmtpt1743241490tcmriygi4
Message-ID: <tencent_928F84F5CCDFC9B34B7BCACF5CA00FED5006@qq.com>
X-QQ-XMAILINFO: MS1AjjpKGz7zRbIxx+8FqvSySv5AXR1Lmczx1Nt7aCHo87XWcgg8G0EVJOaogC
	 xoCgfKRUze0yM6BvTD1elL3nJujcnfp3GTNhUvQHTcPSmCUg4+QUEGgnl7M3eSw3/G0BeTrjra2z
	 xYs17lUibplv4iZmETmvQwYA81FJW5oi8JIb8E9QCrrzmE04EMUQoSQHt5qkw/o/AlwCw0dNe8aK
	 NlryLNuW2/oP2eUkL0peUmRtGxZhSFtngcdSknY/CZ3zBnFyN+jazuFwvFDz92mvLxzRL+jWUyhu
	 3HzZ3nGNMhnKmLEQCxFeHFyM+lnZem/52sSGZ+DTNYAydBm2cXHET0HL8FuOTaRegSSEbS6K0mFS
	 lMNLU4OvoH+yxe++I/7/nsopNFD3H1JeJh8x9ZQpdkezfHQEXpUMBel7LFVYumNhn5gQFIJjCWID
	 bVr7BJg3PbEBLs6del7AnFWq+A3twoRaJrHfct9qVpBd8iwSlNgwgC5PjqUydCJ/WamXrrpoTos+
	 9io9kpB8wijNSD3V75uLmhN7d3McYejqdt7KiCskIwuqCbY4/4xS6lzSTiPZe9Yc/xx/fpCozClM
	 veDhqjtNuLK8RSh1sc3bGYgmqdU5xj53CC30FzgiE3+8C4mxuj1/+yk9E1gh7smbjfgAc2VsB1YV
	 6eD//ilmQs69FDW+bQDpERqNjDwORNfx6196w8nBVLd/CWvfn0NiAp/3na2tWA9Duo3c/t9KLs0T
	 6ZpHRhudjdWPovKX1nQh9C9ZGoLStGde/Pjay7P6/CttbWP7RYTo8bzJ+7JXEeQUWdqNPAsoQsPm
	 5QqGgzbFVn7towYOgS6nDq+vCBQBLe/tzapqBGq+MlwDNM4Sg0UHlzAl2KlBTDtDitgF/fbGZbYm
	 Y5d6V0gNtHZ2ocyGS5oip+PN3xlHTn93l/MzsPzH5XOHSmaLFzovPx7d0oFZVZuR7+ZI6bHxEw1s
	 V+5e9Jm5fXdR9GFvngLg==
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
Sender: yeking@red54.com
From: =?UTF-8?q?=E8=B0=A2=E8=87=B4=E9=82=A6=20=28XIE=20Zhibang=29?= <Yeking@Red54.com>
To: chenhuacai@kernel.org
Cc: Yeking@red54.com,
	guoren@kernel.org,
	jiaxun.yang@flygoat.com,
	kernel@xen0n.name,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev
Subject: Re: Re: [PATCH] LoongArch: Kconfig: Fix help text of CMDLINE_EXTEND
Date: Sat, 29 Mar 2025 09:44:47 +0000
X-OQ-MSGID: <20250329094448.74837-1-Yeking@Red54.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAAhV-H5T3DLFfzPg4Zgzn7JbzqoNZdYn5_F06QNHS230xq-1MA@mail.gmail.com>
References: <CAAhV-H5T3DLFfzPg4Zgzn7JbzqoNZdYn5_F06QNHS230xq-1MA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi, Huacai,

> How about replace "to the built-in command line" with "with the
> built-in command line" and keep others unchanged?
It seems that the use of the preposition "with" does not conform to the regular
collocation of "append" and may lead to ambiguity.
You can consult an LLM such as DeepSeek, Qwen, or ChatGPT.

Zhibang

