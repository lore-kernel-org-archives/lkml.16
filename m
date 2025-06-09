Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3D641C69;
	Mon,  9 Jun 2025 21:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749502959; cv=none; b=sQkwDRP3lfbAkiVh0ggw9welq1x9lVOZdO9YswHiKHP67NnWN3O+zffjHAE1FIlVQUtZA+mG912p3dahcsXIzvVj3tpT2t8ajyKS/qRd+TDdpWGkunr1uzXBwjH8xVM/51Mc6ha94gSxo86IWLIkFvqmSdocODNJOMipaQ7kKFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749502959; c=relaxed/simple;
	bh=3ssZcQjnF8HWSgBeQIh8tjzYceUXiAnxwsSJrjp5Zp8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=UP6kPeZp/j7PoEweNQOI3hteghWlnDWOapWYmx1GfHVaxZU7ZIWJ4C47d6WZpHCsk3M5UM/dseUXayPwRal/Oo+cnpjwXW1u5sI0E8YyheaWDiqPqBHr/HfHRzaBN8QzNOGF0UgXVLCbqQXqcfslqDWCbKWyNpD71Cs3IpJs9CI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Yf+y82i8; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Yf+y82i8"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 8E1AC41F32
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1749502957; bh=3ssZcQjnF8HWSgBeQIh8tjzYceUXiAnxwsSJrjp5Zp8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Yf+y82i86Q+NfLCbS5j6z6m07rAJFNIESKzXz1+5D1pHiba96VgHgJSIfp8YGN+VU
	 Q0Ang6QUWWwxnVeetOxWITYXAqsxSdWaKq2adypbNSG09qDET0hkpiOtHhumjXrp7N
	 pyyAiyA4r714mCqZrTrinaT/A0riCchNiKKwB4TWPc7XZno2GBG8KpzN2+sYb4mUi2
	 jkfyLYxN5QdjoPx8L7/tSR2c9m3DtG0F1jay+wo7Nl5n+1u/XHQ1talZBNc7umvG1L
	 vubiptek0zGOO8/GspC9wylizq3HuDzVRaQvdiSKUFq+g9qZgldWq1WEQfiVbcfpaQ
	 AxwYo2kfmnOKg==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 8E1AC41F32;
	Mon,  9 Jun 2025 21:02:37 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Shashank Balaji <shashank.mahadasyam@sony.com>, Juri Lelli
 <juri.lelli@redhat.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Shinya Takumi
 <shinya.takumi@sony.com>, Shashank Balaji <shashank.mahadasyam@sony.com>
Subject: Re: [PATCH v2 0/2] sched_deadline, docs: update rt-app examples,
 add cgroup v2 cpuset HOWTO
In-Reply-To: <20250527-sched-deadline-cpu-affinity-v2-0-b8b40a4feefa@sony.com>
References: <20250527-sched-deadline-cpu-affinity-v2-0-b8b40a4feefa@sony.com>
Date: Mon, 09 Jun 2025 15:02:36 -0600
Message-ID: <87h60oaas3.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Shashank Balaji <shashank.mahadasyam@sony.com> writes:

> The main goal of this patchset is to add the cgroup v2 cpuset controller HOWTO.
> In v1 of this series, Juri commented that rt-app no longer takes command-line
> options. So I ended up converting the rt-app examples to either use chrt instead
> or use config.json.
>
> Signed-off-by: Shashank Balaji <shashank.mahadasyam@sony.com>
> ---
> Changes in v2:
> - update rt-app examples to either use a chrt example or use config.json
> - Link to v1: https://lore.kernel.org/r/20250522-sched-deadline-cpu-affinity-v1-1-2172c683acac@sony.com
>

Applied, thanks.

jon
