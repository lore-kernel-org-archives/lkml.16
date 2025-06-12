Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD132BDC20
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 16:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749744739; cv=none; b=ok3DnkbFcjd6k5RnoVzjF7CopiXbbwXp4CzZ5VHuiAq/5xlq2PkU7RLElauvR/gsRTb3lSQtlU/EhW0/Wsee7g350H42o9zVAAWZq8gc5osFk6s2M9oqGDRqrjDYd4K5JdZPLcnPb/ordw6bljm/Szvnz64dLETYEhZ61Yk9Rik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749744739; c=relaxed/simple;
	bh=lxgoEntNjVchjtLgiHQvoENTwEKia/YtQ5rdh5fn2qk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vAMCXEH6Z8Vuzt0RRzRjobIUJYpiEE4LffIAEX3852+Gmv5KedjURMj3KNdPV6+NEEx9CY5uVK4TkEUybySYMq51GMlo3EH96s+5WHpCWQWiXeSO895MHP9RW558V7IctdXrApABTyL5pfNejEcQhwALRvf655s1ofFXzNjKgXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Mv39LFn8; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Mv39LFn8"
Message-ID: <755cf90e-acf5-46d1-9ac4-2ea06c93e873@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749744734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wf6edq/KAq3HGPYGLrCGiQwCp9O3FQOz/ZxfLHqxjnQ=;
	b=Mv39LFn8I5zouEC0f5T5xA7Xv20Js1UKmX9aq967+MLRIlPdA0S9b4I6NAKjg4UhnCp1Aq
	9bjf3Ohzf2I6+9qkAmCcwwuAyj7Wlg8zTKUzI3WYwgKOg19uS2u9+WI25/4r3VQwyBp336
	L82OKqGzbTX+EFofYeDNXIjZEm+r4KE=
Date: Thu, 12 Jun 2025 09:12:09 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [GIT PULL] ARC updates for 6.16
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Vineet Gupta <vgupta@kernel.org>
Cc: arcml <linux-snps-arc@lists.infradead.org>,
 lkml <linux-kernel@vger.kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
 Yu-Chun Lin <eleanor15x@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Jason Gunthorpe <jgg@ziepe.ca>
References: <4cb508de-3af3-4796-ac74-2c082a578588@kernel.org>
 <CAHk-=wgda=j0VNdx1gTos_4DL986Z2cKotgpVsn36T-JmNshXg@mail.gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vineet Gupta <vineet.gupta@linux.dev>
Content-Language: en-US
In-Reply-To: <CAHk-=wgda=j0VNdx1gTos_4DL986Z2cKotgpVsn36T-JmNshXg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT



On 6/12/25 08:26, Linus Torvalds wrote:
> On Wed, 11 Jun 2025 at 20:29, Vineet Gupta <vgupta@kernel.org> wrote:
>>   git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-6.16-rc1
> So this is signed and I pulled, but your key has expired. And I don't
> find a new key on kernel.org or the normal keyservers.
>
> Please don't put expiration dates on your keys and then not refresh
> them. Or tell me where to find updated key/.

Sorry about this and thx for pulling anyways.

Back when ii had happened I did extend the date on the key and AFAIKR did
--send-keys to pgp.mit.edu
I've redone this and today also sent it over for inclusion into kernel.org pgp repo.

pub   rsa4096 2013-02-16 [SC] [expires: 2029-12-08]
      397A6E0AE47A85E76B74B08969D7F1DDE28AC25E
uid           [ unknown] Vineet Gupta (kernel) <vgupta@kernel.org>
uid           [ unknown] Vineet Gupta (linux) <vineet.gupta@linux.dev>
uid           [ unknown] Vineet Gupta (personal) <vineetg76@gmail.com>
uid           [ unknown] Vineet Gupta (alias) <vgupta@synopsys.com>
uid           [ unknown] Vineet Gupta (official) <vineet.gupta1@synopsys.com>
uid           [ unknown] [jpeg image of size 24452]


Thx,
-Vineet
