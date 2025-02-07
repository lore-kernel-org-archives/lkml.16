Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C22B1A01C6
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 23:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738972268; cv=none; b=OZJhaaXiX9OdJMYyzBY+eM5JlcD1lXqsJE//QKqqK2kkqP3g9Z8J1DGL2UkhCidgSMRAn2rh1AIeFIyplgui0Haa5BERVk1t2lkpF7IdpxTXL+xhCX5zMG4fj2Q0uySEDbEgvFIK8Gsk4UY59PMdTko/nMJLxw4LYCdChe1v7HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738972268; c=relaxed/simple;
	bh=Vq+09W4mgj9fEbqYP3sdkSQxq68Duobqs14XfGePAEQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EChwGxpO0SOgaqwRRYBYdg22lTpKUOtuqYwCNttK4f/LXqiMDRKqkP8J5BnW4v8IoD43DwQFuEyTlaJ0RU/nOwj7sizOX9+z/bDBEBzQY1srLzb4gPPd5Bowug8HF6C2iNnYZbnjhL4EtNJshl9xzgHrxcpWTRU65qeHDzt1Yas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=riAlfKEU; arc=none smtp.client-ip=199.89.1.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="riAlfKEU"
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4YqW2J4sf5zlgTwl;
	Fri,  7 Feb 2025 23:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1738972260; x=1741564261; bh=Vq+09W4mgj9fEbqYP3sdkSQx
	q68Duobqs14XfGePAEQ=; b=riAlfKEU19YiNv/nG7PN3m0g1lmwSZTvcfoZCjKM
	rUeLF+be5lpSDQs2QfE20QFC0pvMZj5AY9sR0a8dWaWe6tdv6eJQMms9s0hstZed
	V1PC9iXeMfp66vf+ONQXWSMBaHrlMH9ujpc507ovljRyrG4RvJSNnejmF5hD1cfc
	3GrvV0b2nv5ZMRPDwVbMGDYKMDoppppkz3A3b+JHh/iI8xHQyIoLlFfmznG068Td
	E4zx7ouUFFUiDP6K2/KGsNHjCyNcB034tiTYuRJDLBB+agp/QpVPYJAuoNK4mhI5
	tiow2uk3Kln3A3gs6nGiFw2RGIPB/J77nrPMgspALVvYPQ==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id 8592HZxvcuNV; Fri,  7 Feb 2025 23:51:00 +0000 (UTC)
Received: from [192.168.51.14] (c-73-231-117-72.hsd1.ca.comcast.net [73.231.117.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4YqW264Zj7zlgTwQ;
	Fri,  7 Feb 2025 23:50:54 +0000 (UTC)
Message-ID: <c0bc8997-606f-4f45-98b1-8439aea416ca@acm.org>
Date: Fri, 7 Feb 2025 15:50:50 -0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 03/33] locking: Introduce <linux/thread_safety.h>
To: Marco Elver <elver@google.com>
Cc: Christoph Hellwig <hch@lst.de>, Peter Zijlstra <peterz@infradead.org>,
 Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Nathan Chancellor <nathan@kernel.org>, Kees Cook <kees@kernel.org>,
 Jann Horn <jannh@google.com>, linux-kernel@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, Boqun Feng <boqun.feng@gmail.com>,
 Waiman Long <longman@redhat.com>
References: <20250206175114.1974171-1-bvanassche@acm.org>
 <20250206175114.1974171-4-bvanassche@acm.org> <20250207035345.GA4920@lst.de>
 <567ceff3-bbd9-4724-a80d-3db46ee40c98@acm.org>
 <CANpmjNOQDgmyXQZGbHoPJi+Mr0rkZ=SH3NMkbRSfhueNyDAhog@mail.gmail.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <CANpmjNOQDgmyXQZGbHoPJi+Mr0rkZ=SH3NMkbRSfhueNyDAhog@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/7/25 3:19 PM, Marco Elver wrote:
> This is not a problem as I have demonstrated with my approach.

That's not what my email is about. My email is about whether or not to
continue supporting the sparse locking context annotations.

Bart.
