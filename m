Received: from ip197-132-198-217.pool-bba.aruba.it (ip197-132-198-217.pool-bba.aruba.it [217.198.132.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74F7522F
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 22:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.198.132.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738276348; cv=none; b=WssuDH/r5TBDZRPMdaNejqS1QIhPZWWEgIxxCGnQGhCsdeMCLbwe1iHWhCPtvNw4GYVVkoYU2qz5EFSWYrDyHG6w3CzNyX5BpNWIXLwqUvD2yx20LngRk1kbQSifzuW+fo+eO1YcPR3ocbYOaRK2IAI9URrBYtuvcuzXEnnuyL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738276348; c=relaxed/simple;
	bh=m+0bIP9PdavvxnmQ75xPOu7LJx+XNYC+p9HEGjgdmXs=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=a4+XkaQUsYy2Yal+SZK8FQZzDElBX0YoJjU2MoXnXwxQgxMdcag16X7BiAD5fvJB0yFjsfRDmzbjl736ARPBbvNHR+Q6sk0JHuiK5t4gtDYPsfH1NDpgXCfLaD1IOjTymQDgKGnRNSUG6aOjogbhiS9RZq5Pm0Ik3g5vfaPKyr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prosemail.net; spf=pass smtp.mailfrom=prosemail.net; dkim=pass (1024-bit key) header.d=prosemail.net header.i=@prosemail.net header.b=qy2gLWZR; arc=none smtp.client-ip=217.198.132.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prosemail.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prosemail.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=prosemail.net header.i=@prosemail.net header.b="qy2gLWZR"
Received: by ip197-132-198-217.pool-bba.aruba.it (prosemail) with ESMTPSA id 883A8640E7A;
	Thu, 30 Jan 2025 23:32:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prosemail.net;
	s=mail; t=1738276338;
	bh=kGgh6HiO45ZqrSDVcuKYgDuP1wwphqxM3CwudF25H8Y=;
	h=Date:Subject:To:References:From:Cc:In-Reply-To;
	b=qy2gLWZR8v46GjMlRaqrJHWzpLl/SFxfCmCNBOdq5K6izYI9CmmlCeK8V0EjCU1/m
	 W5TpiIQbBwHArSR4xsjuofNUighDblpG1O8PUnKyM97f+JDiDQYKc2Uqxf0ogL0OXY
	 2EB3eN8paOZobLQ2REb71118DiQqjuTS0Lbb4/Hw=
Message-ID: <8415a24a-a19e-46f6-bb56-dfd529143dd9@prosemail.net>
Date: Thu, 30 Jan 2025 23:31:50 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: lib/maple_tree.c:4056:1: error: the frame size of 1144 bytes is
 larger than 1024 bytes
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>
References: <60cee319-4914-4a98-b74d-32e06fb3cbd8@prosemail.net>
 <hxxufpccovvtnoypt4bukrpt4qrhiydlena5tdxqdxpmlduiii@2wac57fy4mqj>
Content-Language: en-US
From: Scall <scall@prosemail.net>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 maple-tree@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Wei Yang <richard.weiyang@gmail.com>
In-Reply-To: <hxxufpccovvtnoypt4bukrpt4qrhiydlena5tdxqdxpmlduiii@2wac57fy4mqj>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/30/25 5:13 PM, Liam R. Howlett wrote:
> Do you have KASAN or lock debugging on?

No, I don't.

> Does the issue go away when reverting 8c7904a8cd0df ("maple_tree: i is
> always less than or equal to mas_end") ?

That commit has not been backported to the kernel version I tried to 
build (6.12.11, currently the latest stable version).

Good news: I learned that the issue has already been solved in the 
mainline version with commit 5059aa6334fcf ("maple_tree: memset 
maple_big_node as a whole") and backporting it is the solution.
