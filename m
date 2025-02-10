Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B49917557
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 13:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739193609; cv=none; b=WiX3dAkZJ79ujG21F9CM/qD+5WDhZeJfg6lqsT45Z6SncHAqoKTJEEohzgqGGixAxyjB+LtPuOLp3eMV5CvvfmctXIjTgXpTOAgMa1eXHt4KVhlDThhHRXvLQnnbOkS9cCHCowgfs6bQTVHQQ/e0hTwfGi8xTipCOlMxVG8lp3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739193609; c=relaxed/simple;
	bh=bDfNItufhj396XvhTXqhAR1YGvBhYOA8KeWvXiz9ISQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rRChAWRyPfxkqSfXHkPs1Thr9l86Wxav51Evjq5BZYkomERFPpLgfo3duQhhcebliXcMgjTPtgo32rNj7iHtU8oMfS5egTSy6TIN45p89tAFurT72X5YaMRTwB3BaeoZbfPfBB7sUB1Ve7q7aPvdGh3MK1TDfKyxIou1Pa4L+es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Ys4Jb2024z9sPd;
	Mon, 10 Feb 2025 13:53:51 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GWWcMCNTIkz5; Mon, 10 Feb 2025 13:53:51 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Ys4Jb1B4cz9rvV;
	Mon, 10 Feb 2025 13:53:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 0DF058B768;
	Mon, 10 Feb 2025 13:53:51 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id XRV61BvPDzm7; Mon, 10 Feb 2025 13:53:50 +0100 (CET)
Received: from [10.25.207.138] (unknown [10.25.207.138])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D06718B763;
	Mon, 10 Feb 2025 13:53:50 +0100 (CET)
Message-ID: <8ddc01a2-80b1-4283-a402-7f7c58c075c8@csgroup.eu>
Date: Mon, 10 Feb 2025 13:53:48 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc/mm/fault: Use str_write_read() helper function
To: Thorsten Blum <thorsten.blum@linux.dev>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20250210100648.1440-2-thorsten.blum@linux.dev>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250210100648.1440-2-thorsten.blum@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 10/02/2025 à 11:06, Thorsten Blum a écrit :
> Remove hard-coded strings by using the str_write_read() helper function.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>


Not sure you saw it, there's also one in:

linus/master:arch/powerpc/platforms/ps3/device-init.c:727:  const char 
*op = write ? "write" : "read";

> ---
>   arch/powerpc/mm/fault.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
> index c156fe0d53c3..806c74e0d5ab 100644
> --- a/arch/powerpc/mm/fault.c
> +++ b/arch/powerpc/mm/fault.c
> @@ -17,6 +17,7 @@
>   #include <linux/kernel.h>
>   #include <linux/errno.h>
>   #include <linux/string.h>
> +#include <linux/string_choices.h>
>   #include <linux/types.h>
>   #include <linux/pagemap.h>
>   #include <linux/ptrace.h>
> @@ -218,7 +219,7 @@ static bool bad_kernel_fault(struct pt_regs *regs, unsigned long error_code,
>   	// Read/write fault blocked by KUAP is bad, it can never succeed.
>   	if (bad_kuap_fault(regs, address, is_write)) {
>   		pr_crit_ratelimited("Kernel attempted to %s user page (%lx) - exploit attempt? (uid: %d)\n",
> -				    is_write ? "write" : "read", address,
> +				    str_write_read(is_write), address,
>   				    from_kuid(&init_user_ns, current_uid()));
>   
>   		// Fault on user outside of certain regions (eg. copy_tofrom_user()) is bad
> @@ -625,7 +626,7 @@ static void __bad_page_fault(struct pt_regs *regs, int sig)
>   	case INTERRUPT_DATA_STORAGE:
>   	case INTERRUPT_H_DATA_STORAGE:
>   		pr_alert("BUG: %s on %s at 0x%08lx\n", msg,
> -			 is_write ? "write" : "read", regs->dar);
> +			 str_write_read(is_write), regs->dar);
>   		break;
>   	case INTERRUPT_DATA_SEGMENT:
>   		pr_alert("BUG: %s at 0x%08lx\n", msg, regs->dar);

