Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9C9204597
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 14:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738592222; cv=none; b=ndRnHRclfUe5PQqLJL+pXSAjbmkNWio3VPwKge5snEp1vAzN3c8MSU2DfWzMNO21zHXd+Hega9iZhZdN+DWNZ236v9ANnNCBMhi0CRIpm9Xdbkab6+OzpiwHOhHuCXlqx6Y5CbTVUKt+kDLeOdXhkKCzSxHjBm3dVJz1ecg/gQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738592222; c=relaxed/simple;
	bh=rSwGd6tPFlDft6gTiA3tgMhlpZo5TWeucDCsPfZOPgE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q1UBBCuUCmfcpYrzu8UgDSdMnGABQLiKTEhQP63rRWnLsDuF9CzPlHyAY3ABTEbQ8ZsAFWLn5UibyjOjrCPfWc0R6zHUyqDLTmlu1sG+jjh3Ra4VLJxaUdxW/l8vK6IUkSAGqtLt6bCljBLiZBRQBwfvlCEub6e4xHgWM9HZwYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=ghTLyyBq; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="ghTLyyBq"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=uE9srKOxwwYJI9QaFwCrIW/rFtGixcuVq6NlgP/4g3I=; b=ghTLyyBqVMfqQEw0Lov6JbvQe0
	iXBFWHV66qHjYtyywX4RLFLJa6dH8oDvvkOPEGquXSPSgAveEARXUY+214C3USTZmKlBTVPesd7uW
	6Kirw9qbvTrcw25rfdE/g5vgVetj4cp4yv6PjNSn38VF0XWm8v66iQwU8KBKva0r4YKtTkYpxD7xL
	24tLVerjsbZyNn2qL/gHz6OuwMDEl8puwXKtFNStyvDJ+ugyAHGrazLEN+c/uAZEdbDVLpRAS9l75
	SAVNX+gZfOmDTsuL9yMY2GSsjGv1egg3XeaCT6tmm3VyM5NGa0ovlsGw60qYvNkuu9LipohADZ978
	nt/uhzXQ==;
Received: from [179.100.5.131] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1texFW-0034Uv-1x; Mon, 03 Feb 2025 15:16:36 +0100
Message-ID: <84568b5e-4e6b-4c6e-b5d0-ba77d8fe087b@igalia.com>
Date: Mon, 3 Feb 2025 11:16:31 -0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] futex: Drop ROBUST_LIST_LIMIT
To: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Florian Weimer
 <fweimer@redhat.com>, Ingo Molnar <mingo@redhat.com>,
 Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, Vinicius Peixoto <vpeixoto@lkcamp.dev>
References: <20250127202608.223864-1-andrealmeid@igalia.com>
 <875xlzl6lq.fsf@oldenburg.str.redhat.com>
 <20250203132926.GE14028@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <20250203132926.GE14028@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Em 03/02/2025 10:29, Peter Zijlstra escreveu:
> On Tue, Jan 28, 2025 at 08:50:41AM +0100, Florian Weimer wrote:
>> * André Almeida:
>>
>>> As requested by Peter at [1], this patchset drops the
>>> ROBUST_LIST_LIMIT. This is achieve by simply rewriting the processed
>>> list element ->next to point to the head->list address, destroying the
>>> linked list to avoid any circular list.
> 
> Well, I suggested we do this for a new robust list.
> 
>> Furthermore, I'm not entirely sure
>> if this is entirely backwards-compatible.
> 
> I share Florian's concern about backward compat here. It might work, it
> might not.
> 
> I was just saying that if we're going to be doing new robust lists, we
> should try and fix all the known wrongs, and this one lets us get rid of the limit.
> 

Oh, now I see, thanks for the clarification. I will add this for the new 
interface then.

In the meanwhile, if you can a look at  patch 3/4 "selftests/futex: 
Create test for robust list" that would help to make sure the new 
interface don't mess with the old one.
