Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB22A2356B9
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 16:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.236.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746809436; cv=none; b=M2KIa0S5ezb7OF2pUU3SyFZiIp3M65KzG3PtLIZH5ueqMukm78FRMkxMb+c6RZSV1vT+deLwTUBgJNlNT3sBuq73A0ufDEDNM36FLlRFq9j06Y7MGfcJZuq7ItTagAVccgebv1Ppr+X+gUQCITD3qLEGDrS4vrgGei74xRtR6eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746809436; c=relaxed/simple;
	bh=1jT1yorK6spsB2LsqYn5aVHCdjls6dUPcNPyt5eG2BY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nXE0a2a3OcJVcAaEOTsrffw1hj6Ieu2OMilBvNtMNdU15DvCg4CLxJtj5hp5azWRvCUS/rCmRhhwi8wbkLaWCq0U0k9zZu4LCYiaGkbZMhpOomqzsug3sV/LXaftCLKMHAvghjm3SwL1TTHXrGzrjnkqFN16ELiSz/N01+LFhI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.236.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4ZvDfC6QXQz9s36;
	Fri,  9 May 2025 18:16:51 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bmZ_rCyi93iu; Fri,  9 May 2025 18:16:51 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4ZvDfC5bgPz9s2l;
	Fri,  9 May 2025 18:16:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B57FD8B776;
	Fri,  9 May 2025 18:16:51 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id tsIaKHYPXzrZ; Fri,  9 May 2025 18:16:51 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 353888B768;
	Fri,  9 May 2025 18:16:51 +0200 (CEST)
Message-ID: <40ccd7fb-a1c8-4fb0-8813-0575c4afe505@csgroup.eu>
Date: Fri, 9 May 2025 18:16:50 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] soc: fsl: qe: remove unused qe_ic_from_irq function
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, qiang.zhao@nxp.com,
 leoyang.li@nxp.com, nathan@kernel.org,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Tom Rix <trix@redhat.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20230320125202.1721775-1-trix@redhat.com>
 <174680087395.258053.1870729490363422870.b4-ty@linaro.org>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <174680087395.258053.1870729490363422870.b4-ty@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 09/05/2025 à 16:28, Krzysztof Kozlowski a écrit :
> 
> On Mon, 20 Mar 2023 08:52:02 -0400, Tom Rix wrote:
>> clang with W=1 reports
>> drivers/soc/fsl/qe/qe_ic.c:235:29: error: unused function
>>    'qe_ic_from_irq' [-Werror,-Wunused-function]
>> static inline struct qe_ic *qe_ic_from_irq(unsigned int virq)
>>                              ^
>> The use of this function was removed with
>> commit d7c2878cfcfa ("soc: fsl: qe: remove unused qe_ic_set_* functions")
>>
>> [...]
> 
> 
> Commit from 2021:
> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fall%2F1619002613-18216-1-git-send-email-jiapeng.chong%40linux.alibaba.com%2F&data=05%7C02%7Cchristophe.leroy2%40cs-soprasteria.com%7Cd5ee085f1ff64e69aec608dd8f05d608%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638823977413929827%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=kaeZGwikWMhIhz9iC6ZEVs%2Ffbd9UsZHJz7vBbODUHgg%3D&reserved=0
> 
> did not apply, but this applies.
> 
> I am annoying hitting this warning on every W=1 build, so:


Acked-by: Christophe Leroy <christophe.leroy@csgroup.eu>



> 
> Applied, thanks!
> 
> [1/1] soc: fsl: qe: remove unused qe_ic_from_irq function
>        https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fkrzk%2Flinux-dt%2Fc%2Fd47f1233374597c348696c3da2142cc92a36fc90&data=05%7C02%7Cchristophe.leroy2%40cs-soprasteria.com%7Cd5ee085f1ff64e69aec608dd8f05d608%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638823977413952218%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=HzwgkKFqffwtkmoskS9Y1OhlXShSW%2B%2BZLKxc3k3fCpA%3D&reserved=0
> 
> Best regards,

