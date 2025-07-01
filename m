Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B619426B0B9
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 10:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751364117; cv=none; b=Dz4XCX/LF90LBz3C4trKmnuxsAU+mkfwOwFCbwSz4UZVKiJ+m/eupxBju/QXWJKdwSp670COxthV6EcL8Y+1jnOHJa8gvWUivPo7INjvq5Gm0p+sn1tyC1efqOvv9jgX0Jr+XCuh6vQ/jvl7R2RGrHvsXoNywwzQhQ2poni4ETk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751364117; c=relaxed/simple;
	bh=NvbjkUgdlWSy3WOQbPWAgbYm4pYFUwIcipL4RztdTgg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jnl3GX1+ikWPC/JgOZCckyOrNiDax+G9B1EKSeUhqmlLB0b/FwIrQh4ZR84JiVYMqWKCDMFUuSwpHkgFLLRkYJsG9SSvxuITjLD+h8J1RjWSfySoiOFHZq0DIjrm/Fsbt6WJlteU0zUc95IWEZcKExW8tyJeR9ehh3AwP7F/NbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 561A1lZv068590;
	Tue, 1 Jul 2025 19:01:47 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.6] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 561A1kQM068582
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 1 Jul 2025 19:01:47 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <8cf8c12d-65fc-4e3d-9c2e-fd7d40d38613@I-love.SAKURA.ne.jp>
Date: Tue, 1 Jul 2025 19:01:46 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] AppArmor: add support for lsm_config_self_policy
 and lsm_config_system_policy
To: =?UTF-8?Q?Maxime_B=C3=A9lair?= <maxime.belair@canonical.com>,
        linux-security-module@vger.kernel.org
Cc: john.johansen@canonical.com, paul@paul-moore.com, jmorris@namei.org,
        serge@hallyn.com, mic@digikod.net, kees@kernel.org,
        stephen.smalley.work@gmail.com, casey@schaufler-ca.com,
        takedakn@nttdata.co.jp, song@kernel.org, rdunlap@infradead.org,
        linux-api@vger.kernel.org, apparmor@lists.ubuntu.com,
        linux-kernel@vger.kernel.org
References: <20250701091904.395837-1-maxime.belair@canonical.com>
 <20250701091904.395837-4-maxime.belair@canonical.com>
Content-Language: en-US
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <20250701091904.395837-4-maxime.belair@canonical.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Anti-Virus-Server: fsav105.rs.sakura.ne.jp
X-Virus-Status: clean

On 2025/07/01 18:17, Maxime Bélair wrote:
> +static int apparmor_lsm_config_self_policy(u32 lsm_id, u32 op, void __user *buf,
> +				      size_t size, u32 flags)
> +{
> +	char *name;
> +	long name_size;
> +	int ret;
> +
> +	if (op != LSM_POLICY_LOAD || flags)
> +		return -EOPNOTSUPP;
> +	if (size > AA_PROFILE_NAME_MAX_SIZE)
> +		return -E2BIG;
> +
> +	name = kmalloc(size, GFP_KERNEL);
> +	if (!name)
> +		return -ENOMEM;
> +
> +
> +	name_size = strncpy_from_user(name, buf, size);
> +	if (name_size < 0) {
> +		kfree(name);
> +		return name_size;
> +	}
> +
> +	ret = aa_change_profile(name, AA_CHANGE_STACK);

If size == 0, name == ZERO_SIZE_PTR and name_size == 0.
Then, aa_change_profile() will oops due to ZERO_SIZE_PTR deref.

> +
> +	kfree(name);
> +
> +	return ret;
> +}
> +
> +/**
> + * apparmor_lsm_config_system_policy - Load or replace a system policy
> + * @lsm_id: AppArmor ID (LSM_ID_APPARMOR). Unused here
> + * @op: operation to perform. Currently, only LSM_POLICY_LOAD is supported
> + * @buf: user-supplied buffer in the form "<ns>\0<policy>"
> + *        <ns> is the namespace to load the policy into (empty string for root)
> + *        <policy> is the policy to load
> + * @size: size of @buf
> + * @flags: reserved for future uses; must be zero
> + *
> + * Returns: 0 on success, negative value on error
> + */
> +static int apparmor_lsm_config_system_policy(u32 lsm_id, u32 op, void __user *buf,
> +				      size_t size, u32 flags)
> +{
> +	loff_t pos = 0; // Partial writing is not currently supported
> +	char name[AA_PROFILE_NAME_MAX_SIZE];
> +	long name_size;
> +
> +	if (op != LSM_POLICY_LOAD || flags)
> +		return -EOPNOTSUPP;
> +	if (size > AA_PROFILE_MAX_SIZE)
> +		return -E2BIG;
> +
> +	name_size = strncpy_from_user(name, buf, AA_PROFILE_NAME_MAX_SIZE);
> +	if (name_size < 0)
> +		return name_size;
> +	else if (name_size == AA_PROFILE_NAME_MAX_SIZE)
> +		return -E2BIG;
> +
> +	return aa_profile_load_ns_name(name, name_size, buf + name_size + 1,
> +				       size - name_size - 1, &pos);

If size == 0 and *name == '\0', name_size == 0. Then, size will be -1 at aa_profile_load_ns_name()
and WARN_ON_ONCE() in __kvmalloc_node_noprof() from kvzalloc() from policy_update() will trigger?

You need more stricter checks to verify that @buf is in the form "<ns>\0<policy>".
strncpy_from_user() should not try to read more than @size bytes.

> +}
> +
> +



Also, in [PATCH v4 2/3], why do you need lines below?
These functions are supposed to be called via only syscalls, aren't these?

+EXPORT_SYMBOL(security_lsm_config_self_policy);
+EXPORT_SYMBOL(security_lsm_config_system_policy);

