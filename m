Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C771421A458
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 09:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743155129; cv=none; b=BzgcFnmVscfYjn2j2kSDaJrUqUx85F/yPtO8TjTXe3IlT8QQvh78+sb8CJ5b53n7ZWGrEX5HXcKA16c7h2Cp63v+grYwi+5twR19uSDn0U2FyazT9w4oUDow3u8qwaP4dmmSXBAAzE87Pfkwi+Z/I2DCxs12WKJBshLsI/NAtfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743155129; c=relaxed/simple;
	bh=5Cs1VhxIx23P0yMjASi7V/4dI6H8aliXgmTd9VxuMg4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F90Z4A4XKoDAsj7+1iHmrWzdFi8KUAcitR6i4O5inZXROZQlEEDNDJzr9TMq5cQB4YSs9qhpDJUhg8fDYlU8TX9J2lj+pbgh3f0MWeHqajcuF6awiPkRSeZKa0JBPzU3yy21hbz+CxogXNMlmvZ8h3KX0efcOWCYpvmzvRDctlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=T3AQWw9h; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="T3AQWw9h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1743155108; x=1743759908; i=markus.elfring@web.de;
	bh=ymBq8lQ1iPd7IBlnK/ub4od+vL6Ja03I0kcTM3LmbH8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=T3AQWw9hwIN7HeOdx41tR+LaLXYd36qtYKmHH2UreaDftKel2rGJJsFeDvbasvn5
	 qEWdefSZqb/5PRR7Ip+w9bHIquaM6/SJVwzV8n80lsndKL4J7Tslbq4+rBLlZYsVn
	 w4gxCeWnFX0UiakmfBA2Diukc3Dhp48+RfcJtdl34/nGea6MjUePZ27OyxZsTg7WW
	 6Lpx37jhtgstmDHUEET5JccRmDTA3WEljmNSZDotzK57l/LT3U6L9rPTS5vDjrmqi
	 YS1KMKmzjkxPOYDrQotcWzjmmDdg2hV69YloggPr0X8ONc3CkqFae6u1vUKUXNFLi
	 7cSM30GmSf+ZJNEqUQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.33]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M3V6G-1txY2b3tPm-000sdG; Fri, 28
 Mar 2025 10:45:07 +0100
Message-ID: <48e363a6-00d5-4374-8c73-a1a0d9c7c387@web.de>
Date: Fri, 28 Mar 2025 10:44:19 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] mm/page_alloc: Consolidate unlikely handling in
 page_expected_state
To: Ye Liu <liuye@kylinos.cn>, linux-mm@kvack.org
Cc: Ye Liu <ye.liu@linux.dev>, LKML <linux-kernel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Sidhartha Kumar <sidhartha.kumar@oracle.com>
References: <20250328014757.1212737-1-ye.liu@linux.dev>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250328014757.1212737-1-ye.liu@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:71634MduVWjU36iNjxiNP42rMX5v8YC/4ENU4CvMN43VJ9cDDj8
 M1LS2GugVQiYljsd1Cshs/i+gMCu9EcyP0sdzz0LGDv9/GnCG3KJz0MSu2qOobdnuLYFdcE
 BmuVpv//Tkpku/WWZsIrAUmRZd1RcY1vFtfAQKw8u8PZQechUsISwUpoVzE49SHuI2MVLSd
 q6GK6lzxmBYhzyUM4XdqQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:BjKbcwqZCkE=;vNWR6Aw63S3MIyEvu1pUwRewkeF
 ZNOFDZFBiaSOFd5aa2t5Jo+ln2A/fdbgGs0ESnVH9Oxh2oZ4j2r8MebZReIA2QLwj4CbTI3B8
 25xMR0pae6D4gcCL+0LutAvBHVO94XO614QfEXQj0rwETSgLxLS+a0ZogSrYWrm6sldyqs1U5
 xAFHObykIiw3dZSLnaBrlEoXgcZJtgLrzcHnI6zLr0UOYJ4Gojy7Ph0tWykcoS1TsK4Ay3cSe
 vBICreAvvCI01JwPn62NYvcbnIX5o8HeiDi1gUmK6EzaYnviQ6+4vrIn0vzrDPQ1zw6MH8jAd
 F8km3Ups51HydvjcIIC3eiXFIfC7HiHx1Ct2C+qnElWW+elM/H4Pf87iBGPkf/XcNy8QyC/0f
 cJnS2C9JgkHASIcKGEiW9KMc/W8Aev6vUOHu0V+cSLUowHGeG7Zb2GT1Z3kRkArisG85JbRCo
 UH/LcvimPkaYDikjdQtmvNQ1cCELNfuKoRdZgHBmFJziLpJqz27Te0IAo7m1xO6kMJYXnq1a4
 7JAXyrTwjeeadPOrpLw7gqUnHiBUyDnG8MRGDZz0iAoag65LtWXoqoQfrQP97QmyF48xVSQ4i
 8KR+wwJZ3Qb/9p2yCmjhDh16QzBs6Gc/kjQlHM16eNxVfMWH3+Dd9tndD9f5DQAPvpxLG/nk5
 fi8Wui2p/NXLfgCtZSi8vDvWhO4kOICGKK7rFex/zLTKxvYEyUFmOCQZWowKvR/lAsVmDeb8j
 oL7aSSPqMjGsoRxPYhXjEW+6ZMoEIqVGSFmTIhoz9JYeaM/odiyu8eKyCRH6yvb0mEaY3DcwN
 zEX2tqwEiKdt6gAdSuaWbyn+dvt1tlgJCxl2yVV491H4By9bmGUBQXjVfPE104BII8nq3UdWP
 fXkB+n7lOFVFDrwhGU2NpP4YjveXTNyK6JFUw+iz4dAzv9k6SAzEImuE0/c7mKjLjdwJMdXEe
 VDrFfBl72O5pJ5HUUAMgVEn/JmW80V77W65XEKK+0FzmigTr1DSB7TsiSaXB+BqE+0ty8+Bz7
 WZ2Hd5F+iXbk8gjgh2GQ5xNyQr4ByK3MGDhbJcMx2z2QLLBkpRvzR3OPYQM8EaT7wiGbxvG3A
 E9j/WZ2ebvEGJVlI29Iw5+f2xqxTYd/1hG0QMAfCJb96Bi68+uH0mvkirKBTaizgpXaDI2TEL
 u2ZSrP/eMkF8Vra/+5FJl6MvNpNKde85CFk3znev1tEk/PoX19wmLzzPnBii4s4ZTZ96ei6/n
 GSZiz6URTdF30JBzRG1l+xWWFZ7X3F8bnTOSEa00F87uPXF4LeF/4D+dl6UCJi/OcDa3cyyz/
 SOAf3CPiPDdoauVpSQ/0dpKH0Kk4lSqcDg3ZWkFZF8SLZvQ2lYlG0MK313AvPUtWqWSHTdrds
 5rQb7/sRIB1VcuaksKeRbtSIZZq6DTZlFwY4QunienMbjbpT42yQvcG1PADhGfsLbfKG7kWJG
 2tFz9PZEeugF63LR3bzc4zztV3wYCj2y/N2S2EWLSvTjfjJJK

=E2=80=A6
> ---
> V4: =E2=80=A6 and append parentheses to all function names.

Collateral evolution for summary phrases?


> V3: Delete 'This patch'.
> V2: return true instead of false in the PageHWPoison branch.
> ---
>  mm/page_alloc.c | 24 ++++++++----------------
=E2=80=A6

How do you think about to replace repeated marker lines by line breaks?

Regards,
Markus
