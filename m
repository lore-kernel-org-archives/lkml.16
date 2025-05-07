Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1BE21C6FF5
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 10:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746614435; cv=none; b=t5wACzNPreGPhFZLTkMOkoJ89ejQg48k0BXfbsYkQNxagt7LwjHPbJghRWwGmmokFgPgSxhcHPCQntEISMCE3Ahctc4OJ05l0UPfauHY3+RdHrELTpoqdgLB+R0pl+i2MRQaimy3osthpEl2WDrxBHon0kJ+8Rt1mlkEjKqhOio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746614435; c=relaxed/simple;
	bh=6/fyKXdJ4DvdgGCJD0Nlf2ars3Nx3AG135w4Nl37rk0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MELebdxK3uuA7/ID/jMVN+En78saaqY5i5sXB7njOr6exoO/bWUxQKYYig4vZFzEnsyyIhv4bBIBN4dTdEnhunTu9L1wHtSZ9zHPOUwQIVKKL86ZdDvdc7nawCugwC0iQ3NIrOPagR7f5uxFXrrV8tlICb6zzdJmVYtuVHZv/oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 547AePvw062699;
	Wed, 7 May 2025 19:40:25 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.6] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 547AeOBM062693
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 7 May 2025 19:40:24 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <9c68743f-5efa-4a77-a29b-d3e8f2b2a462@I-love.SAKURA.ne.jp>
Date: Wed, 7 May 2025 19:40:21 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] lsm: introduce security_lsm_manage_policy hook
To: =?UTF-8?Q?Maxime_B=C3=A9lair?= <maxime.belair@canonical.com>,
        linux-security-module@vger.kernel.org
Cc: john.johansen@canonical.com, paul@paul-moore.com, jmorris@namei.org,
        serge@hallyn.com, mic@digikod.net, kees@kernel.org,
        stephen.smalley.work@gmail.com, casey@schaufler-ca.com,
        takedakn@nttdata.co.jp, linux-api@vger.kernel.org,
        apparmor@lists.ubuntu.com, linux-kernel@vger.kernel.org
References: <20250506143254.718647-1-maxime.belair@canonical.com>
 <20250506143254.718647-3-maxime.belair@canonical.com>
Content-Language: en-US
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <20250506143254.718647-3-maxime.belair@canonical.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Anti-Virus-Server: fsav301.rs.sakura.ne.jp
X-Virus-Status: clean

On 2025/05/06 23:32, Maxime Bélair wrote:
> diff --git a/security/lsm_syscalls.c b/security/lsm_syscalls.c
> index dcaad8818679..b39e6635a7d5 100644
> --- a/security/lsm_syscalls.c
> +++ b/security/lsm_syscalls.c
> @@ -122,5 +122,10 @@ SYSCALL_DEFINE3(lsm_list_modules, u64 __user *, ids, u32 __user *, size,
>  SYSCALL_DEFINE5(lsm_manage_policy, u32, lsm_id, u32, op, void __user *, buf, u32
>  		__user *, size, u32, flags)
>  {
> -	return 0;
> +	size_t usize;
> +
> +	if (get_user(usize, size))
> +		return -EFAULT;
> +
> +	return security_lsm_manage_policy(lsm_id, op, buf, usize, flags);
>  }

syzbot will report user-controlled unbounded huge size memory allocation attempt. ;-)

This interface might be fine for AppArmor, but TOMOYO won't use this interface because
TOMOYO's policy is line-oriented ASCII text data where the destination is switched via
pseudo‑filesystem's filename; use of filename helps restricting which type of policy
can be manipulated by which process.

