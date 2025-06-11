Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 569C229ACC6;
	Wed, 11 Jun 2025 14:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.236.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749651639; cv=none; b=UoQdN0bf4XPgnqwGfkoP9pfIUgdI71MRagsWlh5CnxRwah7uX5cL+Msc03z4xZ50UjWBOzFsNG1AutUDi5bZx+JrZH2ppIT2hgAnB8bxcmxAXa5ZCaDi1o0GxGej4sBNQ12ddJBilte3PY9vUYsb81wQ50NKIoS44yldz8IXfh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749651639; c=relaxed/simple;
	bh=lrsNJweeZYaMaTbdcd2GbbAYTKskhj3jd9U8ksOBE9c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WKxlKPwzdh6mZkp6llo5VsBDLyeqFya7MVmEOYMtoXY7xoi5tSJOEyxUywBOr7+CNOEEz4Pmai8X874xuKsvxdpABWJ8lnoaeBbnz8mlkLzI+oaz4iVMC1AdCbLJq3T4pqPD4zATwQ0UMMURakv0vJUopAz7EzHHIM6qK1opUjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.236.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bHRnp6q9mz9t1J;
	Wed, 11 Jun 2025 15:48:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yiP35XkF9PLz; Wed, 11 Jun 2025 15:48:30 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bHRnp65M1z9sqT;
	Wed, 11 Jun 2025 15:48:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id CBBD18B77A;
	Wed, 11 Jun 2025 15:48:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 0Cm2GCpeF4lX; Wed, 11 Jun 2025 15:48:30 +0200 (CEST)
Received: from [10.25.207.146] (unknown [10.25.207.146])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A32698B769;
	Wed, 11 Jun 2025 15:48:30 +0200 (CEST)
Message-ID: <051e9722-44ad-4547-af5d-3e42c8cfe8d9@csgroup.eu>
Date: Wed, 11 Jun 2025 15:48:30 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: pcm: Convert multiple {get/put}_user to
 user_access_begin/user_access_end()
To: David Laight <david.laight.linux@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-sound@vger.kernel.org, Herve Codina <herve.codina@bootlin.com>,
 Mark Brown <broonie@kernel.org>
References: <bf9288392b1d4b9e92fe29212d9cb933c5b3fbae.1749296015.git.christophe.leroy@csgroup.eu>
 <20250610205358.07b1cc05@pumpkin>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250610205358.07b1cc05@pumpkin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 10/06/2025 à 21:53, David Laight a écrit :
> On Sat,  7 Jun 2025 13:37:42 +0200
> Christophe Leroy <christophe.leroy@csgroup.eu> wrote:
> 
>> With user access protection (Called SMAP on x86 or KUAP on powerpc)
>> each and every call to get_user() or put_user() performs heavy
>> operations to unlock and lock kernel access to userspace.
>>
>> To avoid that, perform user accesses by blocks using
>> user_access_begin/user_access_end() and unsafe_get_user()/
>> unsafe_put_user() and alike.
> 
> Did you consider using masked_user_access_begin() ?
> It removes a conditional branch and lfence as well.

Thanks, was not aware of that new function, allthought I remember some 
discussion about masked user access.

Looks like this is specific to x86 at the time being. I would have 
expected that to be transparent to the consumer. Allthought looking at 
strncpy_from_user() I understand the benefit of keeping it separate.

However is it worth the effort and the ugliness of having to do (copied 
from fs/select.c):

		if (can_do_masked_user_access())
			from = masked_user_access_begin(from);
		else if (!user_read_access_begin(from, sizeof(*from)))
			return -EFAULT;

In addition I would expect a masked_user_read_access_begin() and a 
masked_write_access_begin(). It looks odd (and would be wrong on 
powerpc) to not be able to differentiate between read and write in the 
begin yet using user_read_access_end() at the end, ref get_sigset_argpack()

Christophe
