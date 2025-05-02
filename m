Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F9EC22A7F8
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 08:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.236.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746175840; cv=none; b=SDsojFUnLpp8WfXViJSXE55iloM1+bs6GH2u/yV680dcV2S/V7XKGtYeVYI7+Z83flsRakDILTltzFqcs5imdPOhQ18VgAPixWcxSJ6lz9i+lE6zlUW9mjttPCnjR3oa6RhPgh9Hoxmq2cF1A3YwxsIySkSdL8ZCRF2J1u4BMmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746175840; c=relaxed/simple;
	bh=3HZuf3hABWhUbSGWlfLsZ9K0VvtjgygovfJ+zNCxYac=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aXR1gm2FGmvCDWvEDaCpE7D3sdV+SlPTQoLfSyN1aiLtVwlzcReJDlrlFeojphZkGZ1JuRcUZKobghUz9br5HZ1vwet4wQMeTYOFhuaI/EnP9k2P/rVGBLeHC+1FSxXcmlmoaIaop9hLiPTf9q8yun0iKqFIKBrSl3t94Xtn8f4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.236.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4Zpkmt4f6Bz9sHR;
	Fri,  2 May 2025 10:37:02 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7dqorby3kjTm; Fri,  2 May 2025 10:37:02 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4Zpkmt3wB0z9sFT;
	Fri,  2 May 2025 10:37:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 80DB28B765;
	Fri,  2 May 2025 10:37:02 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id irIy3YzPPw7A; Fri,  2 May 2025 10:37:02 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 0AAAD8B763;
	Fri,  2 May 2025 10:37:02 +0200 (CEST)
Message-ID: <35d38a98-7f5c-413d-9c93-7d9ff783b8a7@csgroup.eu>
Date: Fri, 2 May 2025 10:37:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc/powernv: Enable CPU idle state detection for
 POWER11
To: Aboorva Devarajan <aboorvad@linux.ibm.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>, linux-kernel@vger.kernel.org
References: <20250421070718.162783-1-aboorvad@linux.ibm.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250421070718.162783-1-aboorvad@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 21/04/2025 à 09:07, Aboorva Devarajan a écrit :
> [Vous ne recevez pas souvent de courriers de aboorvad@linux.ibm.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
> Extend idle state detection to POWER11 by updating the PVR check.
> This ensures POWER11 correctly recognizes supported stop states,
> similar to POWER9 and POWER10.
> 
> Reviewed-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> Signed-off-by: Aboorva Devarajan <aboorvad@linux.ibm.com>
> 
> ---
> 
> Without Patch: (Power11 - PowerNV systems)
> 
> CPUidle driver: powernv_idle
> CPUidle governor: menu
> analyzing CPU 927:
> 
> Number of idle states: 1
> Available idle states: snooze
> snooze:
> Flags/Description: snooze
> Latency: 0
> Usage: 251631
> Duration: 207497715900
> 
> With Patch: (Power11 - PowerNV systems)
> 
> CPUidle driver: powernv_idle
> CPUidle governor: menu
> analyzing CPU 959:
> 
> Number of idle states: 4
> Available idle states: snooze stop0_lite stop0 stop3
> snooze:
> Flags/Description: snooze
> Latency: 0
> Usage: 2
> Duration: 33
> stop0_lite:
> Flags/Description: stop0_lite
> Latency: 1
> Usage: 1
> Duration: 52
> stop0:
> Flags/Description: stop0
> Latency: 10
> Usage: 13
> Duration: 1920
> stop3:
> Flags/Description: stop3
> Latency: 45
> Usage: 381
> Duration: 21638478
> 
> 
>   arch/powerpc/platforms/powernv/idle.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/powernv/idle.c b/arch/powerpc/platforms/powernv/idle.c
> index d98b933e4984..10f4d7d5eb44 100644
> --- a/arch/powerpc/platforms/powernv/idle.c
> +++ b/arch/powerpc/platforms/powernv/idle.c
> @@ -1171,8 +1171,8 @@ static void __init pnv_arch300_idle_init(void)
>          u64 max_residency_ns = 0;
>          int i;
> 
> -       /* stop is not really architected, we only have p9,p10 drivers */
> -       if (!pvr_version_is(PVR_POWER10) && !pvr_version_is(PVR_POWER9))
> +       /* stop is not really architected, we only have p9,p10 and p11 drivers */
> +       if (!(PVR_VER(mfspr(SPRN_PVR)) >= PVR_POWER9))

Isn't this test too permissive ?

#define PVR_POWER9	0x004E
#define PVR_POWER10	0x0080
#define PVR_POWER11	0x0082
#define PVR_BE		0x0070
#define PVR_PA6T	0x0090

#define PVR_VER_E500V1	0x8020
#define PVR_VER_E500V2	0x8021
#define PVR_VER_E500MC	0x8023
#define PVR_VER_E5500	0x8024
#define PVR_VER_E6500	0x8040
#define PVR_VER_7450	0x8000
#define PVR_VER_7455	0x8001
#define PVR_VER_7447	0x8002
#define PVR_VER_7447A	0x8003
#define PVR_VER_7448	0x8004

>                  return;
> 
>          /*
> @@ -1189,8 +1189,8 @@ static void __init pnv_arch300_idle_init(void)
>                  struct pnv_idle_states_t *state = &pnv_idle_states[i];
>                  u64 psscr_rl = state->psscr_val & PSSCR_RL_MASK;
> 
> -               /* No deep loss driver implemented for POWER10 yet */
> -               if (pvr_version_is(PVR_POWER10) &&
> +               /* No deep loss driver implemented for POWER10 and POWER11 yet */
> +               if ((PVR_VER(mfspr(SPRN_PVR)) >= PVR_POWER10) &&
>                                  state->flags & (OPAL_PM_TIMEBASE_STOP|OPAL_PM_LOSE_FULL_CONTEXT))
>                          continue;
> 
> --
> 2.49.0
> 

