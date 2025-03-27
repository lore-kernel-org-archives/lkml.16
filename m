Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA81A1CD1F
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 23:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743117321; cv=none; b=FZwrb7sJvGl3x/09qu/l9sbVj2vTlMlAJQ+WjX2WtBRA7fKb+it57C8fqXOmiUUHMq422Ql2YWzvI0qM0CcWDvympfIEYImKeaywHG5lVGC8qlit0GVzKA7T5mJq1MdXgGZxh9AEmSmdxu2Mcl2VwMaJqG9Fq6FAruwtkHA5iW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743117321; c=relaxed/simple;
	bh=PbxKRKJMnTr++LZkr4K9ZxzEGX1yJ9+tmlA6sgbmuGc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AIkKNMu6tDBt0cR2yR38Q0iStLLoNTiPnuRQCAXPtDDrLcwvesRLpPTGDSL0UxrAfdThphu4MCkcQinZUg2+WqtgXi/PJXjTmJGrUgdv+V9QJnQbPS4SW2dV3J/tvbHYdeWu9+2j4WQX6G5sYnlB8L9jj/uMiXY2BIU6yL8bnMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=ShwFKUbA; arc=none smtp.client-ip=198.252.153.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="ShwFKUbA"
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4ZNzyv0QB9z9vCs;
	Thu, 27 Mar 2025 23:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1743117319; bh=PbxKRKJMnTr++LZkr4K9ZxzEGX1yJ9+tmlA6sgbmuGc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ShwFKUbA+lT7HGMZu0wkaEWjSlr6ts8D8SEHsZj5QmOtnAY6Qt7q0UyeF0N+EKaUk
	 JRQopJe7X2xGGndlMRGJVJJEtZaleuXRUyGRoq6WAiKRGf6BCFMUAnmp/aB5VZyttE
	 PSn7uHjpXY7tXDcZs6VozSLpNOQSIMUfdzAKNHUo=
X-Riseup-User-ID: D80CFB4C7053B1AAB01FB91CE0F5CF143CCAD2E8C2237F22306FC1927F2B3F16
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4ZNzys01jczJn9R;
	Thu, 27 Mar 2025 23:15:16 +0000 (UTC)
Message-ID: <f4bff0cc-54fb-4391-a216-c0412d966d97@riseup.net>
Date: Fri, 28 Mar 2025 00:15:13 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2] x86/i8253: fix possible deadlock when turning off the
 PIT
To: Thomas Gleixner <tglx@linutronix.de>, x86@kernel.org,
 linux-kernel@vger.kernel.org
Cc: dwmw@amazon.co.uk, mhkelley@outlook.com, mingo@kernel.org
References: <20250327152258.3097-1-ffmancera@riseup.net> <87ecyixuna.ffs@tglx>
 <1a89af34-8f7a-486b-a7f8-0a56d0447ce7@riseup.net> <878qoqxjew.ffs@tglx>
 <87y0wqw0gg.ffs@tglx>
Content-Language: en-US
From: "Fernando F. Mancera" <ffmancera@riseup.net>
In-Reply-To: <87y0wqw0gg.ffs@tglx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/03/2025 23:52, Thomas Gleixner wrote:
> On Thu, Mar 27 2025 at 22:17, Thomas Gleixner wrote:
>> Though I really want people to sit down and think about the factual
>> impact of a tool based problem observation. Tools are good in detecting
>> problems, but they are patently bad in properly analysing them. And no,
>> AI is not going to fix that anytime soon, quite the contrary.
> 
> May I recommend you to ask your favorite AI model of the moment the
> following question:

Just in case I gave the wrong impression, I do not like LLMs at all and 
do not use them. They strip out your personality from emails/messages 
and hallucinate a lot.

> 
>   "Explain the discussion in the email thread starting at:
>    https://lore.kernel.org/all/20250327152258.3097-1-ffmancera@riseup.net"
> 
> I'm sure that I'm patently bad at AI prompt engineering, but that does
> not justify the utter insanities which these models threw back at me.
> 
>   ChapGPT:
> 
>     "....
>      This patch adds a selftest (automated test) for the nftables
>      flowtable feature using a netdevice. It targets the netfilter
>      subsystem, which is responsible for packet filtering, NAT, and other
>      packet mangling in the Linux kernel."
>

Here it is hallucinating using content from a different patch I sent a 
while ago. Adding some tests to nftables about flowtables. Probably it 
just spotted my email and started to generate text from it.

>   Grok:
> 
>     See
> 
>          https://tglx.de/~tglx/grok.html
>     
>     for the full glory of AI hallucinations.
> 

Now, my name is Felipe. Great, good to know. Ah, and I also maintain a 
network driver too, awesome.

> At least those two were halfways reasonable:
> 
>   Gemini:
> 
>     "API REQUEST ERROR Reason: Unknown."
> 
>   Claude:
> 
>     "I don't have access to the specific URL you've provided ...
>      my knowledge cutoff was in October 2024 ..."
> 
> Seriously?
> 

