Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0D9A8BE5
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 18:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.236.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747160442; cv=none; b=hQWK/aPlk/l97N0l7lchYYL8w2rfttlX+cdDXqSKLRkCSeBGwgTS2RcEi0aW2508K/ABJHzGP9JFiDQXPetJnlBHessOIz5HkiLIG8fdXBDlskN8GkbqA+7PO3/4gdKEK/pJ2ywcdXxfJemKJepCFFSFU4vq7XQQSjJgaRwBkoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747160442; c=relaxed/simple;
	bh=lbU7PsDeFHTHzzKcBJFxEoAyrcA5ffcrvJX4aCbNe9w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i1un39XMSGfMTih+2t8gM4JbcDThfnDa7dryslUafrmgsxlZAcaIugCggHEmz0axHGEV7pXFYQfvNQGq9rVF6PbFT8761AmPu/vtaUeakh1m6ihIQcbdqjZlzEcpMz/ZUlScumPL7/ZjrdzszBQ1aLz5QoOiM7/iyuOsf9sPIFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.236.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4ZxkVJ4CxBz9sB6;
	Tue, 13 May 2025 19:48:40 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G_pXDJnk3gqN; Tue, 13 May 2025 19:48:40 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4ZxkVJ39wtz9s9J;
	Tue, 13 May 2025 19:48:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 61B228B765;
	Tue, 13 May 2025 19:48:40 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id mu0GiejjUCCv; Tue, 13 May 2025 19:48:40 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 9A6598B763;
	Tue, 13 May 2025 19:48:39 +0200 (CEST)
Message-ID: <922be2ed-aed2-4c55-b7b0-37abfc745500@csgroup.eu>
Date: Tue, 13 May 2025 19:48:38 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc: Transliterate author name and remove FIXME
To: Thorsten Blum <thorsten.blum@linux.dev>,
 Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20241110162139.5179-2-thorsten.blum@linux.dev>
 <87v7wuy3p5.fsf@mpe.ellerman.id.au>
 <55B1EE24-BEC9-4A8D-84B0-ED32FCC070A5@linux.dev>
 <87v7weodqn.fsf@mpe.ellerman.id.au>
 <d9e232bb-5069-4526-b781-f4e316bda95d@csgroup.eu>
 <774CD605-AE6F-4D37-AB50-B9676858CDFA@linux.dev>
 <504A9138-865E-4CB3-8E1C-E19C4B86F1D3@linux.dev>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <504A9138-865E-4CB3-8E1C-E19C4B86F1D3@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 13/05/2025 à 16:10, Thorsten Blum a écrit :
> On 7. Jan 2025, at 13:16, Thorsten Blum wrote:
>> On 23. Nov 2024, at 11:19, Christophe Leroy wrote:
>>> Isn't our file just a copy of the one from binutils ? Shouldn't we adjust it based on commit https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Fbminor%2Fbinutils-gdb%2Fcommit%2F2ce18a16268a&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7Cab93fab4ad1e43fbaaee08dd9227edf0%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638827422381661999%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=pYe0b3WZhhmX3IHNh58Ogf%2BFMLYsdA7zn93%2B74D%2F%2FsA%3D&reserved=0 ?
>>
>> It looks like it's a copy and the name is spelled the same as in my patch:
>>
>>   "Mimi Phuong-Thao Vo"
>>
>> What's missing to get this merged?
> 
> Does it make sense to resubmit this or do we leave the name and the
> FIXME as is?

Thanks for the ping, your patch is not lost, it is still here: 
https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20241110162139.5179-2-thorsten.blum@linux.dev/

Maddy, what do you think about the way forward ?

Thanks
Christophe
