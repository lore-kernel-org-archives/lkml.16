Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 568B713BC35
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 09:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739094611; cv=none; b=SaqT+GPgBhuTFZevLYRJlZ5YTa851nm686+hOMjA6AZZ/YxNEEvz2AK5znWhe2rjAPsEBBrvtXf873nYb+QlkqaXQflakjQT1L6wFhBSPIGIwF4vOwDjuk6Wd3hIE/pYWkIwRKkYi90bDBXM0+L04l1caodlAi1v5rkTzgWUogs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739094611; c=relaxed/simple;
	bh=QngNH/3AFGpyd2j0z4moOus+woUOO4OUsOSaohhRAT0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P3+ot9THX2SPAaiW0Sb4O6Qh9P0TmBz6lG5NuZ7UCcJhG4xRh8Si1tjiLlwF2DQjC3aePuvcrdzxSi6nSmHOGHGVcmrIxNTs8/M1dHAW9ubVM4eqmQ2xzRX8zajgC7h9LyfKUBeQZkxCm7tAYFJipaZcbKB0s2J6xEdoDsQSG3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4YrMXQ0N35z9sPd;
	Sun,  9 Feb 2025 10:16:38 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aNuFw5IlXRuw; Sun,  9 Feb 2025 10:16:37 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4YrMXP6dxTz9rvV;
	Sun,  9 Feb 2025 10:16:37 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D19888B764;
	Sun,  9 Feb 2025 10:16:37 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id kpTQIB64sT6S; Sun,  9 Feb 2025 10:16:37 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 124738B763;
	Sun,  9 Feb 2025 10:16:37 +0100 (CET)
Message-ID: <505dcbf1-c185-4bc3-9615-041dfd6344e5@csgroup.eu>
Date: Sun, 9 Feb 2025 10:16:35 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH] fadump: Use str_yes_no() helper in
 fadump_show_config()
To: Thorsten Blum <thorsten.blum@linux.dev>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>, Hari Bathini <hbathini@linux.ibm.com>,
 Sourabh Jain <sourabhjain@linux.ibm.com>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 "Aneesh Kumar K.V (IBM)" <aneesh.kumar@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>
Cc: Baoquan He <bhe@redhat.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20250209081704.2758-2-thorsten.blum@linux.dev>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250209081704.2758-2-thorsten.blum@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Le 09/02/2025 à 09:17, Thorsten Blum a écrit :
> Remove hard-coded strings by using the str_yes_no() helper function.
> 
> Reviewed-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Any reason for resending ? Your patch is not lost, see 
https://patchwork.ozlabs.org/project/linuxppc-dev/list/?submitter=89400

If there is a reason that you don't want to put in the commit message, 
just put it here below under the ---

> ---
>   arch/powerpc/kernel/fadump.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
> index 4b371c738213..8c531533dd3e 100644
> --- a/arch/powerpc/kernel/fadump.c
> +++ b/arch/powerpc/kernel/fadump.c
> @@ -289,10 +289,8 @@ static void __init fadump_show_config(void)
>   	if (!fw_dump.fadump_supported)
>   		return;
>   
> -	pr_debug("Fadump enabled    : %s\n",
> -				(fw_dump.fadump_enabled ? "yes" : "no"));
> -	pr_debug("Dump Active       : %s\n",
> -				(fw_dump.dump_active ? "yes" : "no"));
> +	pr_debug("Fadump enabled    : %s\n", str_yes_no(fw_dump.fadump_enabled));
> +	pr_debug("Dump Active       : %s\n", str_yes_no(fw_dump.dump_active));
>   	pr_debug("Dump section sizes:\n");
>   	pr_debug("    CPU state data size: %lx\n", fw_dump.cpu_state_data_size);
>   	pr_debug("    HPTE region size   : %lx\n", fw_dump.hpte_region_size);

