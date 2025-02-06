Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9211A9B46
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 20:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738873477; cv=none; b=bBlaqFf68rp7NCThA80z3fcfhqlzPZZRfEKygrCbX8kPBmL9oVjTI1aWosgxq/mE0W+aMgcCfWaWLW00NzQhhyPrUyhz+gJu+1uouPggJJQPxwPliv3pJGo0U7NTcBtzgs3eHXV04RBaBLMdR4VsdqVO3WsFW2GKdoimzNaeUV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738873477; c=relaxed/simple;
	bh=Ju/TUhVKE/cZ/J9yTpBKpw0jfk9S75VKJCf/VUiMoSI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zelvu6GQOFpgVR69kiHD/+7lT2U3OMiQnVfljxPQ4W4hCLt0TgTKJTuumMtRx9evO/yzOtQpPNmy4CijWPMXNOunAxqUM+fzjrirXOewyzM+MneCJDAROFo/KarDh2M/B6a6z/werDxJGu8jMvW4erkZKoUSDjfScbpGaTwz6Bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=PEri0RDL; arc=none smtp.client-ip=199.89.1.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="PEri0RDL"
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4YppVV4L75zlgTwF;
	Thu,  6 Feb 2025 20:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1738873470; x=1741465471; bh=Ju/TUhVKE/cZ/J9yTpBKpw0j
	fk9S75VKJCf/VUiMoSI=; b=PEri0RDLInev5yWByTM3RJ9U/N2QYfBcde3kXqHh
	NvPhazYh92A54JmUMvWpbMUen6wCFZ/jbq8W64yh+xLOxB8nR9Jxv7N5lMONF1ZV
	wdPDv73dXSnWSIpFEhdJPnZkbNcjS9xPBuzjWHih5f9CWFZ48/jIzWk2B/r9usyv
	FvZZ/WXNcJ7zc9r+r1KPzByg2msjGNvSNlTSMjhd5JJaCsIJeMRF3pff7qsYZbtH
	MIMzXDRFqKlCHYIhJlnZQuH8hEKKP/RSf0ZqSReFfWrDFa5OvhwD8EOyXuAhaecc
	EvH8WxxZZA7fs368PYMKBoJJXO0s2NUfs1PY51j1I6/bxg==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id gnQPWVpISK2x; Thu,  6 Feb 2025 20:24:30 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4YppVM67tZzlgTw4;
	Thu,  6 Feb 2025 20:24:27 +0000 (UTC)
Message-ID: <7e52f219-6a23-4e55-a719-0519267dd1e6@acm.org>
Date: Thu, 6 Feb 2025 12:24:26 -0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 24/33] drm: zynqmp_dp: Fix a deadlock in
 zynqmp_dp_ignore_hpd_set()
To: Sean Anderson <sean.anderson@linux.dev>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Marco Elver <elver@google.com>, Nick Desaulniers <ndesaulniers@google.com>,
 Nathan Chancellor <nathan@kernel.org>, Kees Cook <kees@kernel.org>,
 Jann Horn <jannh@google.com>, linux-kernel@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>
References: <20250206175114.1974171-1-bvanassche@acm.org>
 <20250206175114.1974171-25-bvanassche@acm.org>
 <25e047ee-cc48-42a0-9ee2-88753114f4a4@linux.dev>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <25e047ee-cc48-42a0-9ee2-88753114f4a4@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/6/25 11:22 AM, Sean Anderson wrote:
> Since this patch is marked RFC will it be applied soon? I am about to
> send a patch which conflicts with this one. I would like to just add
> this patch to my series.

Hi Sean,

Thanks for having taken a look. Please include this patch in your patch
series if you want it to be merged in the upstream kernel soon.

Bart.

