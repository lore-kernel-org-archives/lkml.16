Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E359923BE;
	Tue, 24 Jun 2025 02:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.30.148.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750731537; cv=none; b=ANv8zMYNHvNrQDsfwYyohX/x5LAr2mESya5tKen7U946AO4fTuOVdZku3cLFTVhaqzMhxpHCe6R/DKPO7QzHeHeaVlolJQ7Waj6StptB8x7riTkWmzIn9k3Q+vo8J9ij5vtVwd0I1Vi/Ylj9BZwyggaKL/nLQVfvSsSPSgOjlXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750731537; c=relaxed/simple;
	bh=R1OK7e99Vg7ltRnz0BT+Vs0V+tPexjh7mJ2T+pFxwbo=;
	h=Date:Message-ID:In-Reply-To:References:Mime-Version:From:To:Cc:
	 Subject:Content-Type; b=kWoXgMJ5XK5gA5j6J52fF7OLtGn1Qvo9wOzRcpmvY9Bahg2GAXz/aVobrtJYSJ7ciLlsH/nV89ZyIsSFxj0x7r6l+MLStDRUp+naa1z3RLnha88PtkkC/M8KBHdlVwv4/95gvAoyQCq7ssGL9YJ6FSh+LZMDH4iVVaBwaOhQeSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=160.30.148.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4bR7t32ngRz5DXWj;
	Tue, 24 Jun 2025 10:18:51 +0800 (CST)
Received: from szxlzmapp02.zte.com.cn ([10.5.231.79])
	by mse-fl1.zte.com.cn with SMTP id 55O2IYeG096824;
	Tue, 24 Jun 2025 10:18:34 +0800 (+08)
	(envelope-from yang.yang29@zte.com.cn)
Received: from mapi (szxlzmapp04[null])
	by mapi (Zmail) with MAPI id mid14;
	Tue, 24 Jun 2025 10:18:35 +0800 (CST)
Date: Tue, 24 Jun 2025 10:18:35 +0800 (CST)
X-Zmail-TransId: 2b06685a0afbffffffffc7c-f4ac5
X-Mailer: Zmail v1.0
Message-ID: <20250624101835869AZSKLr2_kXapp5khYIQ7H@zte.com.cn>
In-Reply-To: <20250619225152603EIiJTlhHy4mFMv1dVTzue@zte.com.cn>
References: 20250619211843633h05gWrBDMFkEH6xAVm_5y@zte.com.cn,20250619225152603EIiJTlhHy4mFMv1dVTzue@zte.com.cn
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
X-MAIL:mse-fl1.zte.com.cn 55O2IYeG096824
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 685A0B0B.001/4bR7t32ngRz5DXWj

> For latency-sensitive scenarios, such as industrial control, communications,
> or automotive, I think this tool is useful. And it may be better if it support
> showing whole delay of system by reading PSI, just like the first few lines of
> information output by the top command.

Another suggestion, we can provide a new command to control the display of
either the total memory delay for tasks or detailed memory delays. This approach
offers two benefits: first, it better aligns with PSI results; second, it offers choices
for users with different interests (e.g., some users may not have enabled or are
not concerned about swap delay). The implementation can follow the dynamic
command approach similar to top.

If it's OK to you, may send follow-up patch. For the initial patch:
> + * delaytop.c - task delay monitoring tool.
> + * This tool provides real-time monitoring and statistics of
> + * system, container, and task-level delays, including CPU,
Since the tool cover 'system' delay, we may say:
delaytop.c - system-wide delay monitoring tool.

> + * This tool provides real-time monitoring and statistics of
> + * system, container, and task-level delays, including CPU,
> + * memory, IO, and IRQ and delay accounting. It supports both
I am confused with the words 'and delay accouting', they are all
delays.

> +	if (bind(fd, (struct sockaddr *) &local, sizeof(local)) < 0) {
> +		close(fd); 
> +		return -1;
We better tell user what happend, and pelase check other code
that may also fail.

> +	rc = recv(nl_sd, &resp, sizeof(resp), 0);
Please check if close(nl_sd) is called.
