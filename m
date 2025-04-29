Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFA17225768
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 12:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.236.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745929237; cv=none; b=O0hwF2MA3owaVVwtTurU1TuSbJqv3qpXOUNHhTauAn971d47gHRyEShF8ZYTLFQoWfy5kho2qD34sZY3FKKjYz0pRu0BVErqRlQGdfVjeZkdieKaPzVlktpaF6U4Kq++mEX62S36zA7Iu2jf0hEka97n3SumbLGXVGX3/J0jHxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745929237; c=relaxed/simple;
	bh=K5XX62vEbOYhpHhxRl2d8OTgf+JX7nvoBnPZLwugcV8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LJQ2Qvh+3Q5Rlxqqzd5Mnph+KAFg5CyXPgbQ5rqqeF1+MTXbp/eZV5n16C2XrpWdI//DL03N9BZEOeP++yGMCNb8vtpm3JcqudsVnq0mAhPSTnTj6/1K4BTgmER8Q4CBjnXTriRvat8zOtpBuKQ3g+LmV/NeQLsk2BXBE4so0LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.236.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4ZmzNt5G8Rz9sB2;
	Tue, 29 Apr 2025 13:58:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EuswGPPqwCmv; Tue, 29 Apr 2025 13:58:38 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4ZmzNt4bxgz9s92;
	Tue, 29 Apr 2025 13:58:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 992A18B766;
	Tue, 29 Apr 2025 13:58:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id kJveHg6ejLpf; Tue, 29 Apr 2025 13:58:38 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 3D42D8B763;
	Tue, 29 Apr 2025 13:58:38 +0200 (CEST)
Message-ID: <17c35382-36c2-44e6-b553-e66a32a8c47e@csgroup.eu>
Date: Tue, 29 Apr 2025 13:58:38 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH] bus: fsl-mc: Use strscpy() instead of
 strscpy_pad()
To: Ioana Ciornei <ioana.ciornei@nxp.com>,
 Thorsten Blum <thorsten.blum@linux.dev>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20250429104149.66334-1-thorsten.blum@linux.dev>
 <kko4akbacnugkdughit5ty6vpzg4wjiif3rh4w75hd67v34nre@ngpqhwjb5l4p>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <kko4akbacnugkdughit5ty6vpzg4wjiif3rh4w75hd67v34nre@ngpqhwjb5l4p>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 29/04/2025 à 13:47, Ioana Ciornei a écrit :
> On Tue, Apr 29, 2025 at 12:41:48PM +0200, Thorsten Blum wrote:
>> Both destination buffers are already zero-initialized, making strscpy()
>> sufficient for safely copying 'obj_type'. The additional NUL-padding
>> performed by strscpy_pad() is unnecessary.
>>
>> If the destination buffer has a fixed length, strscpy() automatically
>> determines its size using sizeof() when the argument is omitted. This
>> makes the explicit size arguments unnecessary.
>>
>> No functional changes intended.
>>
>> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> 
> Reviewed-by: Ioana Ciornei <ioana.ciornei@nxp.com>
> 
> Christophe, could you also pick-up this patch when you have a chance?
> 

Sure I will take it when time comes, but again I'd expect an explanation 
inside the patch (below the ---) for the resend. I now have this patch 
twice in the list and don't know why, see 
https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=&submitter=&state=&q=&archive=&delegate=61610

Christophe
