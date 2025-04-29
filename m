Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82B8284B52
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 02:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745893087; cv=none; b=qqFBx3JdXX4LbenzcpYGBsguvmMAI8NBOQL82UFLush4wpaO17vniS6WZD+haizv/DFB0fze5RsI1uFCoN4Q3w5xbW2v6FMYJWyo4rzRoBhXYqk7N53WiC77Jvf5tQchUuX8wuwYW3lM8QFi6+V9luvIuXe+Hb63Ds3t9UniDOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745893087; c=relaxed/simple;
	bh=WqI3BDt2ktsqzmLmXUsvdTN+ybpt4JxjyySqnvpfTDU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B3+HItYl6Po6aaEUs2VAskB07/HGwRxWvsOvb1zoEO6RenkdUyLIefFw3G98ZI9lZsCdNMWUY0k+IMmZiCZRcT9nq3Ub3qcBqgdVBvT7GzVf19LRx8em3JLUKjHOeqxyYmC3DJOBlnOnTJtDcJKtjZXCfJ+m/nCq1KBZEjeN+Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8ED3C4CEE4;
	Tue, 29 Apr 2025 02:18:06 +0000 (UTC)
Message-ID: <42674c5a-42fe-4846-bf90-340310393fea@linux-m68k.org>
Date: Tue, 29 Apr 2025 12:18:04 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] m68k: Enable dead code elimination
To: Daniel Palmer <daniel@0x0f.com>
Cc: geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org,
 linux-kernel@vger.kernel.org
References: <20250416114240.2929832-1-daniel@0x0f.com>
 <ac188e54-7f23-4ecd-805c-c0437a53247a@linux-m68k.org>
 <CAFr9PXmrVUL1HubP04iHR1ObhaNo+mObg7FC+-HpTF7QR0og3g@mail.gmail.com>
Content-Language: en-US
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <CAFr9PXmrVUL1HubP04iHR1ObhaNo+mObg7FC+-HpTF7QR0og3g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Daniel,

On 29/4/25 10:04, Daniel Palmer wrote:
> Hi Greg,
> 
> On Mon, 28 Apr 2025 at 08:37, Greg Ungerer <gerg@linux-m68k.org> wrote:
>> I notice that some other architectures (arm and powerpc) have version
>> checks on gcc or ld in the config. Do you know if there is any version
>> limitations for m68k here?
> 
> I'm not sure about that. I'll try to work out why they have the checks
> and see if that affects m68k too.
> I'm using GCC13 so probably new enough that most things work.

FWIW, the oldest toolchain I had lying around was based on gcc 8.3.0
and binutils 2.32. This patch worked fine on that.

Regards
Greg


