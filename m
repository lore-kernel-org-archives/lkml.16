Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09A119007D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 13:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749733941; cv=none; b=njYFRj2MaE8W3etfdzMm4SFMgvU1PfARoMeqqS6KHub9l9K7FQyYlA1xLJ6eIapIQA2J1Q6OgXNCuitKnWeENGJ2mx212UJn+6+8QTmBcMniT5NCEeIt+AIXYIL3pvYXTBkpe3D5ROdyTk6NVeHC4zI8kh2xxjaPo69HfxncAew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749733941; c=relaxed/simple;
	bh=fwK4Jz6/rNR1kYgfA3kD7NYVQkNvkfNxHWEgIYg3Vis=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qvYDqHW1xNfQMBGRH+O/bh9Z4XFQxu+vA/0DudzdrJzFtYCU/JzERB1rNv444prfMEJWfxo0zx52vNT1Fq2PSvrMBEjyx2+8XjRLqcGPLeRa5IfR/4IhRtU8xiEwyA1iXAfRAZSBlpYd+HRBlEH7dnYgEps/9r88LejThHlwKjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass smtp.mailfrom=ghiti.fr; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0C319431EB;
	Thu, 12 Jun 2025 13:12:09 +0000 (UTC)
Message-ID: <221b0b7c-1879-4944-b9c4-cfb9fad9ae91@ghiti.fr>
Date: Thu, 12 Jun 2025 15:12:09 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: defconfig: run savedefconfig to reorder it
To: Yixun Lan <dlan@gentoo.org>
Cc: Conor Dooley <conor@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Guodong Xu <guodong@riscstar.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 spacemit@lists.linux.dev
References: <20250611-01-riscv-defconfig-v1-1-b48fc3517498@gentoo.org>
 <92faa45d-0f3a-4bb6-afae-180c2b28fb65@ghiti.fr>
 <20250612093227-GYA130879@gentoo>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250612093227-GYA130879@gentoo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdduheduiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnheptdfhleefjeegheevgeeljeellefgvefhkeeiffekueejteefvdevhfelvdeggeeinecukfhppedvtddtudemkeeiudemfeefkedvmegvfheltdemfhduvggsmehfugelrgemrgguudgumeeifhehsgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemfeefkedvmegvfheltdemfhduvggsmehfugelrgemrgguudgumeeifhehsgdphhgvlhhopeglkffrggeimedvtddtudemkeeiudemfeefkedvmegvfheltdemfhduvggsmehfugelrgemrgguudgumeeifhehsggnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepledprhgtphhtthhopegulhgrnhesghgvnhhtohhordhorhhgpdhrtghpthhtoheptghonhhorheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtohepp
 hgrlhhmvghrsegurggssggvlhhtrdgtohhmpdhrtghpthhtoheprghouhesvggvtghsrdgsvghrkhgvlhgvhidrvgguuhdprhgtphhtthhopehguhhoughonhhgsehrihhstghsthgrrhdrtghomhdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: alex@ghiti.fr

On 6/12/25 11:32, Yixun Lan wrote:
> Hi Alexandre,
>
> On 10:37 Thu 12 Jun     , Alexandre Ghiti wrote:
>> Hi Yixun,
>>
>> On 6/11/25 16:56, Yixun Lan wrote:
>>> Changes to defconfig should be always updated via 'make
>>> savedefconfig', run this command to make it aligned again.
>>>
>>> This will ease the effort of reviewing changes of defconfig
>>> in the future.
>>>
>>> Signed-off-by: Yixun Lan <dlan@gentoo.org>
>>> ---
>>> Update PDMA config bring in unnecessary changes[1], let's fix
>>> it by run savedefconfig first.
>>
>> It would be easier if this patch was part of the PDMA series since the
>> last patch will depend on it: @Guodong can you integrate this patch to
>> your next revision of your patchset?
>>
> I'd rather make this patch independent, as nothing strongly ralated with PDMA,
> and it probably would take several rounds for PDMA patch to be settled down..
>
> Besides, there is no problem for PDMA patch to depend on this patch if
> needed (easy to use b4 to handle this..)
>
> The idea here is to get this patch merged as early as possible, as it's
> quite straightforward, and other people may have similar problem instead
> of PDMA here


Ok makes sense, so let's Guodong deal with that then.

Thanks,

Alex


>
>> Thanks,
>>
>> Alex
>>
