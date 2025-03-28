Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 633241537C6
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 12:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.236.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743164411; cv=none; b=bf8zavOdBw9mRkoh6MvLXGJuhso2RSrBViEmn70KXRDPUsDbDSkdImRHXyTBff0Ev7z5tmCAUtWBX2eyRAlUG1qVOpyJhomtrf5Yzf3zz9Xo+aLoXsodmaKcWq4dH1HbKtKCBsNQi4yWG5SbhsPDYpDAjtx6V2UvBv1WmTSmzfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743164411; c=relaxed/simple;
	bh=UCjH2Ms8cWcrH8DKbIjBq3dQ2+iqiaqyMgj4HCuqX/8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=DApFKenD3J6hBiCKMJB/vIDQECWWyeeAZ5uJE3paKleiHtQbm+AARMtO1ydaB9pcnUY8pz7paa2aZPqzPoonS9ZzW60rCbnKVeH521DE1mB+xWlfJb0pjyr6oh2upvfHoXlkXPCimDMmLb1kKjOa7EJ+FFrL09tbdZc7gGCuvt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.236.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4ZPJhQ0sv0z9vdk;
	Fri, 28 Mar 2025 12:48:54 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VHeEn-jhQIqn; Fri, 28 Mar 2025 12:48:54 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4ZPJhP2w1Bz9tjl;
	Fri, 28 Mar 2025 12:48:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 827338B76E;
	Fri, 28 Mar 2025 12:48:53 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id wUjXM0YDApDW; Fri, 28 Mar 2025 12:48:53 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 3C80F8B763;
	Fri, 28 Mar 2025 12:48:53 +0100 (CET)
Message-ID: <d021d85f-e00e-4795-878f-ee53a5fd886c@csgroup.eu>
Date: Fri, 28 Mar 2025 12:48:53 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [main-line]Build warnings on PowerPC system
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
 Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 LKML <linux-kernel@vger.kernel.org>
References: <61cf556c-4947-4bd6-af63-892fc0966dad@linux.ibm.com>
 <8797a1c4-dc58-4a85-bc51-a3d4131e7930@linux.ibm.com>
 <b5713b0b-a278-424c-8ba3-3aec01454e94@linux.ibm.com>
 <38653c58-a5c4-496f-9b52-e7bc3e447423@linux.ibm.com>
 <516febac-b2ba-48a0-83a4-ab259e972541@linux.ibm.com>
 <b37c7a1a-9ec8-417e-9d9d-adeffe409df8@csgroup.eu>
 <e18df940-bb30-44c9-9384-7325e8d02d25@linux.ibm.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <e18df940-bb30-44c9-9384-7325e8d02d25@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 28/03/2025 à 12:14, Madhavan Srinivasan a écrit :
> 
>>>> diff --git a/arch/powerpc/boot/wrapper b/arch/powerpc/boot/wrapper
>>>> index 1db60fe13802..09ceb5a42d81 100755
>>>> --- a/arch/powerpc/boot/wrapper
>>>> +++ b/arch/powerpc/boot/wrapper
>>>> @@ -235,7 +235,7 @@ fi
>>>>    # suppress some warnings in recent ld versions
>>>>    nowarn="-z noexecstack"
>>>>    if ! ld_is_lld; then
>>>> -       if [ "$LD_VERSION" -ge "$(echo 2.39 | ld_version)" ]; then
>>>> +       if [ "$LD_VERSION" -ge "$(echo 2.35 | ld_version)" ]; then
>>>>                   nowarn="$nowarn --no-warn-rwx-segments"
>>>>           fi
>>>>    fi
>>> Above change fixes the issue. No warnings observed. Thank you!!
>>
>> Take care, this must be a special version of binutils.
>>
>> With regular 2.36.1 I get following error:
>>
>> $ /opt/gcc/gcc-8.5.0-nolibc/powerpc64-linux/bin/powerpc64-linux-ld --version
>> GNU ld (GNU Binutils) 2.36.1
>> Copyright (C) 2021 Free Software Foundation, Inc.
>> This program is free software; you may redistribute it under the terms of
>> the GNU General Public License version 3 or (at your option) a later version.
>> This program has absolutely no warranty.
>>
>> $ /opt/gcc/gcc-8.5.0-nolibc/powerpc64-linux/bin/powerpc64-linux-ld --no-warn-rwx-segments test.o
>> /opt/gcc/gcc-8.5.0-nolibc/powerpc64-linux/bin/powerpc64-linux-ld: unrecognized option '--no-warn-rwx-segments'
>> /opt/gcc/gcc-8.5.0-nolibc/powerpc64-linux/bin/powerpc64-linux-ld: use the --help option for usage information
>>
> 
> Nice catch. Thanks Christophe.
> 
> May be we need to handle this special/specific case with an
> additional check
> 
> diff --git a/arch/powerpc/boot/wrapper b/arch/powerpc/boot/wrapper
> index 1db60fe13802..d3779c20e548 100755
> --- a/arch/powerpc/boot/wrapper
> +++ b/arch/powerpc/boot/wrapper
> @@ -237,6 +237,8 @@ nowarn="-z noexecstack"
>   if ! ld_is_lld; then
>          if [ "$LD_VERSION" -ge "$(echo 2.39 | ld_version)" ]; then
>                  nowarn="$nowarn --no-warn-rwx-segments"
> +        elif [ "$LD_VERSION" -eq "235020000" ]; then
> +                nowarn="$nowarn --no-warn-rwx-segments"
>          fi
>   fi
> 

I think it is not the official version of 2.35.2, it is a modified 
version from a distribution. It doesn't exist in the official 2.35.2:

$ git remote -v
origin	https://sourceware.org/git/binutils-gdb.git (fetch)
origin	https://sourceware.org/git/binutils-gdb.git (push)

$ git grep rwx-segments origin/binutils-2_35-branch
[empty]

What about doing something like commit 0d362be5b142 ("Makefile: link 
with -z noexecstack --no-warn-rwx-segments") ?

Christophe
