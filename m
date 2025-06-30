Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83AC3199BC
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 02:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751252250; cv=none; b=FTbKVe2D8JeMQWd6PhNR2VLiLeo+Wl60rgMKXOtCa0TD81VOqQ86MaLotaPyGWCR6DolDReMvndZNuW6D+LO7SCgDJg+q2CsZEqFZMBVmWiso46Jh/kWmnMoKkI/aOFodPi8BQzanzMY6JKxSKajEwqHdaPPcwTxzHkWHkldVu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751252250; c=relaxed/simple;
	bh=gavhzufaX7qZ5o/K4UzozwBlVKLcjlAwzbzwC8jqkP4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E36F79ApWisgQmalMwtn/0gjYD2HYhvY6ayEl3m3F8xmAmUaRC0JD31wy3w639d6/Og6co4ADbJCiIetUzloxfVJ4cvOZanZLzEgJUJWQhOR3Ah3IeU+RfFPxJZaJXBp/RS7DP3q6Vl//gewSEZuKng2PuWypSrYYdZc1b4SASU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=rAnmjJkh; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="rAnmjJkh"
Message-ID: <2949fb39-7e94-40a6-ad75-636a194f0b2f@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751252245;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gavhzufaX7qZ5o/K4UzozwBlVKLcjlAwzbzwC8jqkP4=;
	b=rAnmjJkhdBA7NtAxus/OFYJUF6BLGaQWqxTLkg4F3vXBTphK2FnoBwgwRjIrtv2BLeMYPN
	0dS7o53RL1TCHB/2h8azmkX1syuGuZdjnP5sYJET8ECgSWM2lDwmCjqB0Tli3O/Wa2ifOy
	W2sWzJV2SUAyp5ueXm0YQm9u+xmnS6s=
Date: Mon, 30 Jun 2025 10:57:18 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3 0/3 linux next] Docs/zh_CN: Translate networking docs
 to Simplified Chinese
To: jiang.kun2@zte.com.cn
Cc: alexs@kernel.org, corbet@lwn.net, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, xu.xin16@zte.com.cn, yang.yang29@zte.com.cn,
 wang.yaxin@zte.com.cn, fan.yu9@zte.com.cn, he.peilin@zte.com.cn,
 tu.qiang35@zte.com.cn, qiu.yutan@zte.com.cn, zhang.yunkai@zte.com.cn,
 ye.xingchen@zte.com.cn
References: <20250630104028091JYqwlWt_OOKp3u4LK6A_1@zte.com.cn>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20250630104028091JYqwlWt_OOKp3u4LK6A_1@zte.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


在 6/30/25 10:40 AM, jiang.kun2@zte.com.cn 写道:
> Ping

You sent out this patch set last Friday and then pushed for a response

on the mailing list on Monday (when the usual timeframe is two weeks),

which is not a friendly way to collaborate.

Not everyone works on weekends—at least I need time to rest.

Yanteng

