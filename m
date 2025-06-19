Received: from mxct.zte.com.cn (mxct.zte.com.cn [183.62.165.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C626217A30F;
	Thu, 19 Jun 2025 14:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=183.62.165.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750344721; cv=none; b=DGfa4SvWx0AbAiuzXZitM57yzjjy14Kh4bzdzhdgVlY4RGkFNkfIxpAHRipVZ+TKfTfGCUvAdYd2Oqx7TaQ5KwtvOEgUWkI78/xdXcE22tGb04prghXt2FcWXgpQsUtlZPazNvgV2RlUuHhXddBdZyTlxAhnOsrpwlUCqFGLVcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750344721; c=relaxed/simple;
	bh=DiKE0GctfAflmziKG348lyHIP5QberAm0uVi5a+CheA=;
	h=Date:Message-ID:In-Reply-To:References:Mime-Version:From:To:Cc:
	 Subject:Content-Type; b=oT4m5byEPpFTZzVEtGPXVKrWDZ6VqPOnZfpxwmqRWJSA+Iep5Qt539zbNnjhILMagxsnrPuS1FZYKo5iyIsDXbUOdsoLZCZzRJ5fy3gaQKZcJFLDTcC/QwSBmSOnl+hkCYpFgWMn80lvG6WymyDe8E9vuungy+5i2xWH8t56slc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=183.62.165.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4bNNqC1csCz501bP;
	Thu, 19 Jun 2025 22:51:51 +0800 (CST)
Received: from szxlzmapp03.zte.com.cn ([10.5.231.207])
	by mse-fl2.zte.com.cn with SMTP id 55JEpn75019165;
	Thu, 19 Jun 2025 22:51:49 +0800 (+08)
	(envelope-from yang.yang29@zte.com.cn)
Received: from mapi (szxlzmapp04[null])
	by mapi (Zmail) with MAPI id mid14;
	Thu, 19 Jun 2025 22:51:52 +0800 (CST)
Date: Thu, 19 Jun 2025 22:51:52 +0800 (CST)
X-Zmail-TransId: 2b0668542408ffffffffbed-cd742
X-Mailer: Zmail v1.0
Message-ID: <20250619225152603EIiJTlhHy4mFMv1dVTzue@zte.com.cn>
In-Reply-To: <20250619211843633h05gWrBDMFkEH6xAVm_5y@zte.com.cn>
References: 20250619211843633h05gWrBDMFkEH6xAVm_5y@zte.com.cn
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <yang.yang29@zte.com.cn>
To: <wang.yaxin@zte.com.cn>, <fan.yu9@zte.com.cn>
Cc: <bsingharora@gmail.com>, <akpm@linux-foundation.org>, <david@redhat.com>,
        <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
        <linux-doc@vger.kernel.org>, <wang.yong12@zte.com.cn>,
        <he.peilin@zte.com.cn>, <tu.qiang35@zte.com.cn>,
        <qiu.yutan@zte.com.cn>, <zhang.yunkai@zte.com.cn>,
        <ye.xingchen@zte.com.cn>, <xu.xin16@zte.com.cn>,
        <jiang.kun2@zte.com.cn>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCBsaW51eCBuZXh0XSB0b29scy9hY2NvdW50aW5nL2RlbGF5dG9wOiBhZGQgZGVsYXl0b3AKIHRvIHJlY29yZCB0b3AtbiB0YXNrIGRlbGF5?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 55JEpn75019165
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 68542407.000/4bNNqC1csCz501bP

> Solution
> ========
> To address these limitations, we introduce the "delaytop" with
> the following capabilities:
> 1. system view: monitors latency metrics (CPU, I/O, memory, IRQ,
> etc.) for all system processes
> 2. supports field-based sorting (e.g., default sort by CPU latency
> in descending order)
> 3. dynamic interactive interface:
> focus on specific processes with --pid;
> limit displayed entries with --processes 20;
> control monitoring duration with --iterations;
For latency-sensitive scenarios, such as industrial control, communications,
or automotive, I think this tool is useful. And it may be better if it support
showing whole delay of system by reading PSI, just like the first few lines of
information output by the top command.
