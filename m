Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7FA914B092
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 16:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751558814; cv=none; b=A7mpQUGymXQqcWhNrrTa38blsW3zTS3aEYt0KjQ2pctTYNGBKtmALeDZd6yqieNlMeJpfZAT8HyM7J/SEIqcpGC58HGEZSLRztq3M7F/kSarkl5BvxEwpkqiBSvcwwka5TxkVeOAdo3pdaEKADlI/+Gux7PF9Mr3CYcyfSj0/Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751558814; c=relaxed/simple;
	bh=3fM8QbpLi5S9eWL6BnFcgOU3p+EMTb87jhKTAOfai7E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PQQIk113WDdgndR9T4bpOQ+1mruOTvHUVcr9XnvTyD0oz9KiSQ/K2S17PPI2xTfxSTVsJXlsTSS1HmKeBcTJVsSOkf9UNAzwBxaP4SZpo1o81Gm16G2xQfywt0KA+51a0BicGXZisufRA1eq46vcVqjXs5P/PZOnhautby1ya3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass smtp.mailfrom=ghiti.fr; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id 03A5041C7D;
	Thu,  3 Jul 2025 16:06:41 +0000 (UTC)
Message-ID: <5ac2c90c-5907-40ce-a31e-05cb6d88fa52@ghiti.fr>
Date: Thu, 3 Jul 2025 18:06:41 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: ftrace: Fix the logic issue in DYNAMIC_FTRACE
 selection
To: Steven Rostedt <rostedt@goodmis.org>
Cc: ChenMiao <chenmiao.ku@gmail.com>,
 Linux RISCV <linux-riscv@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250703084502.394406-1-chenmiao.ku@gmail.com>
 <f7e12c6d-892e-4ca3-9ef0-fbb524d04a48@ghiti.fr>
 <20250703114018.6fab0b8a@batman.local.home>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250703114018.6fab0b8a@batman.local.home>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvtdejudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnhepheeihfdutdduudekteekheehtdffudfhveeffedtfeevfffgueffjeejjeefkeeunecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepvddttddumeekiedumeeffeekvdemvghfledtmedvugegleemhegsudelmegrsgguieemkehfiegsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeeffeekvdemvghfledtmedvugegleemhegsudelmegrsgguieemkehfiegspdhhvghloheplgfkrfggieemvddttddumeekiedumeeffeekvdemvghfledtmedvugegleemhegsudelmegrsgguieemkehfiegsngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopeekpdhrtghpthhtoheprhhoshhtvgguthesghhoohgumhhishdrohhrghdprhgtphhtthhopegthhgvnhhmihgrohdrkhhusehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhinhhug
 idqrhhishgtvhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphhtthhopegrohhusegvvggtshdrsggvrhhkvghlvgihrdgvughupdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: alex@ghiti.fr

Hi Steve,

On 7/3/25 17:40, Steven Rostedt wrote:
> On Thu, 3 Jul 2025 15:00:02 +0200
> Alexandre Ghiti <alex@ghiti.fr> wrote:
>
>
>> We could support static ftrace, but I don't think we should, so I agree
>> with this patch. In fact I had just prepared a patch for this here
>> https://github.com/linux-riscv/linux/pull/556/commits/0481092a5bec3818658981c11f629e06e66382b3
>> which is a bit more complete since I have removed some dead code.
>>
>> Let's see what other people think about supporting static ftrace, I have
>> added Steven in cc if he has an opinion.
> Yes, please only support the dynamic ftrace. The static is there only
> to help archs to get ftrace up and running. Once dynamic is supported,
> static should not be used.
>
> Hmm, maybe I should just remove the prompt for DYNAMIC_FTRACE.
>
> That is, once it is supported by an architecture, it should be the only
> thing used.
>
> -- Steve


Thanks for your input.

@ChenMiao: can you come up with a v2 that, in addition, deletes the dead 
code and with a commit log that explains what Steven said? If not 
possible for you, let me know and I'll do it.

Thanks,

Alex

