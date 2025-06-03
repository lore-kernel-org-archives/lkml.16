Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B1C623371F
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 15:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.236.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748965838; cv=none; b=Ogh7tu/qSsArSBiCmhak23BiM93paipg7Jp5Tt8YHz29Ab7NA3+3qSFi79iGoisMiOYfhJrBuxM/tyE05sA5iy2Mh4WpjII6oXi/mHhT4AOrlLyisI4D+V5fZ+WiyLXtEBsHM/w7E+Bzkn+gtU7hTujMe+tNia7Imjp5Nb6oFuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748965838; c=relaxed/simple;
	bh=qiG+VozOOI6wPT+ROdYw/xlw72Su6sc3Ss8/AnXjA/4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=NQsKIO3vwt0oeZEJ6kEheFIAf75iKCfuhKjPMqqPDzNbfOyg/fzSFHIhXj9OuuYVDhhIY2f8vIkrkoEeCQKDHpAaxEWuNyVcFdJw1N3CfK5rjk43yLRPYsWIzUCoZ+btG7pU/hb3BPvuVQtKbTj3ER/Ah5UEhRMXwDNAF4Gz+is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.236.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bBZfc6crxz9vY0;
	Tue,  3 Jun 2025 17:40:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pu_TPIGHgN7w; Tue,  3 Jun 2025 17:40:24 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bBZfc5sbgz9sd1;
	Tue,  3 Jun 2025 17:40:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C4A9E8B767;
	Tue,  3 Jun 2025 17:40:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id Tgixx4hrf_Oi; Tue,  3 Jun 2025 17:40:24 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 5F3318B763;
	Tue,  3 Jun 2025 17:40:24 +0200 (CEST)
Message-ID: <f3602ce2-c5b4-4ed2-a4e9-c89534452ac8@csgroup.eu>
Date: Tue, 3 Jun 2025 17:40:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] Remove unaligned/packed_struct.h header
To: Julian Vetter <julian@outer-limits.org>, Arnd Bergmann <arnd@arndb.de>,
 "Jason A . Donenfeld" <Jason@zx2c4.com>, Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-kernel@vger.kernel.org
References: <20250603132414.3676142-1-julian@outer-limits.org>
Content-Language: fr-FR
In-Reply-To: <20250603132414.3676142-1-julian@outer-limits.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 03/06/2025 à 15:24, Julian Vetter a écrit :
> The functions in this header are deprecated and are not used anymore.
> So, remove the header entirely.

Your patch seems uncomplete.

$ git grep get_unaligned_cpu linus/master
linus/master:include/linux/jhash.h:             a += 
__get_unaligned_cpu32(k);
linus/master:include/linux/jhash.h:             b += 
__get_unaligned_cpu32(k + 4);
linus/master:include/linux/jhash.h:             c += 
__get_unaligned_cpu32(k + 8);
linus/master:include/linux/unaligned/packed_struct.h:static inline u16 
__get_unaligned_cpu16(const void *p)
linus/master:include/linux/unaligned/packed_struct.h:static inline u32 
__get_unaligned_cpu32(const void *p)
linus/master:include/linux/unaligned/packed_struct.h:static inline u64 
__get_unaligned_cpu64(const void *p)
linus/master:tools/include/linux/jhash.h:               a += 
__get_unaligned_cpu32(k);
linus/master:tools/include/linux/jhash.h:               b += 
__get_unaligned_cpu32(k + 4);
linus/master:tools/include/linux/jhash.h:               c += 
__get_unaligned_cpu32(k + 8);
linus/master:tools/include/linux/unaligned/packed_struct.h:static inline 
u16 __get_unaligned_cpu16(const void *p)
linus/master:tools/include/linux/unaligned/packed_struct.h:static inline 
u32 __get_unaligned_cpu32(const void *p)
linus/master:tools/include/linux/unaligned/packed_struct.h:static inline 
u64 __get_unaligned_cpu64(const void *p)

Christophe


> 
> Signed-off-by: Julian Vetter <julian@outer-limits.org>
> ---
>   include/linux/unaligned.h               |  1 -
>   include/linux/unaligned/packed_struct.h | 46 -------------------------
>   2 files changed, 47 deletions(-)
>   delete mode 100644 include/linux/unaligned/packed_struct.h
> 
> diff --git a/include/linux/unaligned.h b/include/linux/unaligned.h
> index 4a9651017e3c..18c4b0c00e2a 100644
> --- a/include/linux/unaligned.h
> +++ b/include/linux/unaligned.h
> @@ -6,7 +6,6 @@
>    * This is the most generic implementation of unaligned accesses
>    * and should work almost anywhere.
>    */
> -#include <linux/unaligned/packed_struct.h>
>   #include <asm/byteorder.h>
>   #include <vdso/unaligned.h>
>   
> diff --git a/include/linux/unaligned/packed_struct.h b/include/linux/unaligned/packed_struct.h
> deleted file mode 100644
> index f4c8eaf4d012..000000000000
> --- a/include/linux/unaligned/packed_struct.h
> +++ /dev/null
> @@ -1,46 +0,0 @@
> -#ifndef _LINUX_UNALIGNED_PACKED_STRUCT_H
> -#define _LINUX_UNALIGNED_PACKED_STRUCT_H
> -
> -#include <linux/types.h>
> -
> -struct __una_u16 { u16 x; } __packed;
> -struct __una_u32 { u32 x; } __packed;
> -struct __una_u64 { u64 x; } __packed;
> -
> -static inline u16 __get_unaligned_cpu16(const void *p)
> -{
> -	const struct __una_u16 *ptr = (const struct __una_u16 *)p;
> -	return ptr->x;
> -}
> -
> -static inline u32 __get_unaligned_cpu32(const void *p)
> -{
> -	const struct __una_u32 *ptr = (const struct __una_u32 *)p;
> -	return ptr->x;
> -}
> -
> -static inline u64 __get_unaligned_cpu64(const void *p)
> -{
> -	const struct __una_u64 *ptr = (const struct __una_u64 *)p;
> -	return ptr->x;
> -}
> -
> -static inline void __put_unaligned_cpu16(u16 val, void *p)
> -{
> -	struct __una_u16 *ptr = (struct __una_u16 *)p;
> -	ptr->x = val;
> -}
> -
> -static inline void __put_unaligned_cpu32(u32 val, void *p)
> -{
> -	struct __una_u32 *ptr = (struct __una_u32 *)p;
> -	ptr->x = val;
> -}
> -
> -static inline void __put_unaligned_cpu64(u64 val, void *p)
> -{
> -	struct __una_u64 *ptr = (struct __una_u64 *)p;
> -	ptr->x = val;
> -}
> -
> -#endif /* _LINUX_UNALIGNED_PACKED_STRUCT_H */

