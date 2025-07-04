Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977FD2877C3
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 12:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751632122; cv=none; b=IrxqcpoYRvR+IBFU9txaUdlrYOhEVWFChJyE83oRLGK6Y7OzIlttsjcu4ZLoHtB+3YvZym0SKgdTXCijNZrc56HVdVtTjudXXCJ1duPH6dqnpeiGeURBKPyQygj6+b+og4Kzy2n/2d6t6j5xpOt8C/wBYlZ+Lv4Q3WHkzKduQEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751632122; c=relaxed/simple;
	bh=fWDtZkYvja0d0cqVA2EkPJQg2VejnXy1kmVW6B7lLxQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L+7uCT4pFlax/W+csqPDqnGEeStCXb5w5I3SE9lF9qpkaYQH0VaZCv0Cd9aMaElAANf4CS5t7WKLmxGvURbuZZLpOXyCzIjnQFjA/ejD3BsK+B67VglJWll7JwpPlRSoN33989wMAfByQovzrj7HuNpnSqHPmlcT8Zua4qkdoQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass smtp.mailfrom=ghiti.fr; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id 263D14398D;
	Fri,  4 Jul 2025 12:28:31 +0000 (UTC)
Message-ID: <8160f56d-967d-4fa0-b996-0e0a2aa8be20@ghiti.fr>
Date: Fri, 4 Jul 2025 14:28:31 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: ftrace: Fix the logic issue in DYNAMIC_FTRACE
 selection
To: Miao Chen <chenmiao.ku@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250703084502.394406-1-chenmiao.ku@gmail.com>
 <f7e12c6d-892e-4ca3-9ef0-fbb524d04a48@ghiti.fr>
 <20250703114018.6fab0b8a@batman.local.home>
 <5ac2c90c-5907-40ce-a31e-05cb6d88fa52@ghiti.fr>
 <CAKxVwgeDcqo83ZV+xBcHwNuMk6yeU+yp7RYo22OARAVOBgrsJQ@mail.gmail.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <CAKxVwgeDcqo83ZV+xBcHwNuMk6yeU+yp7RYo22OARAVOBgrsJQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvfeduhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnhepieffvdeiveeuhfegvddvuefhveejhfffudffhfdufeeuudegtdfguddthfetledvnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepvddttddumeekiedumeeffeekvdemvghfledtmeegkegufeemvdejkegumedvrgdtmegrrgeijeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemfeefkedvmegvfheltdemgeekugefmedvjeekugemvdgrtdemrggrieejpdhhvghloheplgfkrfggieemvddttddumeekiedumeeffeekvdemvghfledtmeegkegufeemvdejkegumedvrgdtmegrrgeijegnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepjedprhgtphhtthhopegthhgvnhhmihgrohdrkhhusehgmhgrihhlrdgtohhmpdhrtghpthhtoheprhhoshhtvgguthesghhoohgumhhishdrohhrghdprhgtphhtthhopehprghulhdrfigrl
 hhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphhtthhopegrohhusegvvggtshdrsggvrhhkvghlvgihrdgvughupdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: alex@ghiti.fr

Hi Chen Miao,

On 7/4/25 04:06, Miao Chen wrote:
> Hello Alex,
>
> Should I wait for Steven to finish his work before starting mine? He 
> seems to be refactoring a lot of CONFIG logic, which might cause 
> conflicts.


I would say no, don't wait for Steven since his work won't land in 6.16, 
we need a fix to prevent build failures for this release.

Thanks,

Alex


>
> Thanks,
>
> Chen Miao
>
> Alexandre Ghiti <alex@ghiti.fr> 于2025年7月4日周五 00:06写道：
>
>     Hi Steve,
>
>     On 7/3/25 17:40, Steven Rostedt wrote:
>     > On Thu, 3 Jul 2025 15:00:02 +0200
>     > Alexandre Ghiti <alex@ghiti.fr> wrote:
>     >
>     >
>     >> We could support static ftrace, but I don't think we should, so
>     I agree
>     >> with this patch. In fact I had just prepared a patch for this here
>     >>
>     https://github.com/linux-riscv/linux/pull/556/commits/0481092a5bec3818658981c11f629e06e66382b3
>     >> which is a bit more complete since I have removed some dead code.
>     >>
>     >> Let's see what other people think about supporting static
>     ftrace, I have
>     >> added Steven in cc if he has an opinion.
>     > Yes, please only support the dynamic ftrace. The static is there
>     only
>     > to help archs to get ftrace up and running. Once dynamic is
>     supported,
>     > static should not be used.
>     >
>     > Hmm, maybe I should just remove the prompt for DYNAMIC_FTRACE.
>     >
>     > That is, once it is supported by an architecture, it should be
>     the only
>     > thing used.
>     >
>     > -- Steve
>
>
>     Thanks for your input.
>
>     @ChenMiao: can you come up with a v2 that, in addition, deletes
>     the dead
>     code and with a commit log that explains what Steven said? If not
>     possible for you, let me know and I'll do it.
>
>     Thanks,
>
>     Alex
>
