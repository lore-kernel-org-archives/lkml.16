Received: from out199-6.us.a.mail.aliyun.com (out199-6.us.a.mail.aliyun.com [47.90.199.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C56A21C9F7
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 06:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=47.90.199.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749537213; cv=none; b=k8YHCqKbqx3hUUR1oCEibLJGVGgOqAcmCTDa3PfGdb+eiv4pJt3LYI2SCwIc8auI7c67kkjlp100jofY/7rUpc4Y6sf9SlEj1sgp7ZiaaiUrKpy4m00e6hWyp9iJwHB88cDd8JfW1k26ACx0DuHQvDn19vED78jcg4E2d+Jp3us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749537213; c=relaxed/simple;
	bh=rWftAVIi3ezAWEzu0LX+ud0lhGSgut3rQF8/6crwapg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Hf3Nl1TLbEZaxOkLBT9YMux4SMR6mMPFoXtRT4P+GZeRNPYWnmL5cLPj66ABJ+jnCGRN73+9GqSgR/wNmmX86QC80WQwpzcTpFTWn80wwA0wvlGZW15R0PQmcnIHitUVfyrajThrblvOROcsY8okeMyutfsXWDANJk8wsF7EUO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=cJIAOthn; arc=none smtp.client-ip=47.90.199.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="cJIAOthn"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1749537192; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=3oyypOe9fHfM9091ox3pdfsYfxRCIntvYNrup2mV6v8=;
	b=cJIAOthn4aVpHuDCSUvZCeybzpc1L8P5PH78L8PJ38qlen9ANIv6VX2kb90JmrWq/mqH83tz02oCKFLHCZ2UkMy65eSmf0t8i3ah+bdKQbwONJXx9QiE97meoejPDhIbDBwWTnZPpWTdApafefaAP88OpD1eOvx4DcaKvP5UFGc=
Received: from DESKTOP-5N7EMDA(mailfrom:ying.huang@linux.alibaba.com fp:SMTPD_---0WdYD5JX_1749537191 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 10 Jun 2025 14:33:12 +0800
From: "Huang, Ying" <ying.huang@linux.alibaba.com>
To: Li Zhijian <lizhijian@fujitsu.com>
Cc: linux-mm@kvack.org,  akpm@linux-foundation.org,
  linux-kernel@vger.kernel.org,  Ying Huang <huang.ying.caritas@gmail.com>
Subject: Re: [PATCH] mm/memory-tier: Fix abstract distance calculation overflow
In-Reply-To: <20250610062751.2365436-1-lizhijian@fujitsu.com> (Li Zhijian's
	message of "Tue, 10 Jun 2025 14:27:51 +0800")
References: <20250610062751.2365436-1-lizhijian@fujitsu.com>
Date: Tue, 10 Jun 2025 14:33:10 +0800
Message-ID: <877c1kcdi1.fsf@DESKTOP-5N7EMDA>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ascii

Li Zhijian <lizhijian@fujitsu.com> writes:

> In mt_perf_to_adistance(), the calculation of abstract distance (adist)
> involves multiplying several int values including MEMTIER_ADISTANCE_DRAM.
> ```
> *adist = MEMTIER_ADISTANCE_DRAM *
> 		(perf->read_latency + perf->write_latency) /
> 		(default_dram_perf.read_latency + default_dram_perf.write_latency) *
> 		(default_dram_perf.read_bandwidth + default_dram_perf.write_bandwidth) /
> 		(perf->read_bandwidth + perf->write_bandwidth);
> ```
> Since these values can be large, the multiplication may exceed the maximum
> value of an int (INT_MAX) and overflow (Our platform did), leading to an
> incorrect adist.
>
> Change MEMTIER_ADISTANCE_DRAM to be a long constant by writing it with the
> 'L' suffix. This prevents the overflow because the multiplication will then
> be done in the long type which has a larger range.
>
> Fixes: 3718c02dbd4c ("acpi, hmat: calculate abstract distance with HMAT")
> Cc: Ying Huang <huang.ying.caritas@gmail.com>
> Signed-off-by: Li Zhijian <lizhijian@fujitsu.com>

Good catch!  Feel free to add

Reviewed-by: Huang Ying <ying.huang@linux.alibaba.com>

in the future version.

---
Best Regards,
Huang, Ying

[snip]
