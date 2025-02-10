Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68EB01C5D77
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 12:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739189619; cv=none; b=nVUV/Ai1Z3yq/pa0EKzCONb+LK+ySx2lnjWimpj9AgEdKNc14WdqboBTruv4Fp8Vlw89fwGnSMHMAUiXEawx1pAlQ2LXmTBSxoN6JWs+iQq1qt+pPq0WMtAqp2lL+shx/9jsx7nzJdorxWiSrx3R0SBzzHRqlfdaIRrXnzTiP4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739189619; c=relaxed/simple;
	bh=U6lNUJZfY6M2RmjNFRJPDIko8DCyY03KL80HyfAzovs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bnsjROM2qfuWBJFJWs0IA9bHNnPtJ+NxlBos4piiWnrWt8ZxQ4GC6N5JNfnLIUJZxWnoKxREvbfPTz9mt1O1yLmcJyShVa9ePd1JYPcNDnH7p5yimSdz2GfRBV1Vw5HDPV/lD03gQeznjvO8Yteq9UHzmGt8g4XHTreJfni2Yro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3A07012FC;
	Mon, 10 Feb 2025 04:13:58 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 430773F5A1;
	Mon, 10 Feb 2025 04:13:35 -0800 (PST)
Date: Mon, 10 Feb 2025 12:13:32 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Paul Benoit <paul@os.amperecomputing.com>
Cc: linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3] firmware: smccc: Support optional Arm SMC SOC_ID name
Message-ID: <Z6ntbLvjjtcW92_Z@bogus>
References: <20241114030452.10149-1-paul@os.amperecomputing.com>
 <20241218001338.6247-1-paul@os.amperecomputing.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241218001338.6247-1-paul@os.amperecomputing.com>

Mostly minor coding style comments from me, otherwise LGTM.

On Tue, Dec 17, 2024 at 04:13:38PM -0800, Paul Benoit wrote:

Split the commit into multiple paragraphs, it looks too crowded 😄.

> Issue Number 1.6 of the Arm SMC Calling Convention introduces an
> optional SOC_ID name string.

> If available, point the 'machine' field of

      ^^^^ I prefer implemented instead of available.

> the SoC Device Attributes at this string so that it will appear under
> /sys/bus/soc/devices/soc0/machine.

Break into new paragraph here.

> On Arm SMC compliant SoCs, this will
> allow things like 'lscpu' to eventually get a SoC provider model name
> from there rather than each tool/utility needing to get a possibly
> inconsistent, obsolete, or incorrect model/machine name from its own
> hardcoded model/machine name table.
>
> Signed-off-by: Paul Benoit <paul@os.amperecomputing.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: Sudeep Holla <sudeep.holla@arm.com>
> Cc: linux-arm-kernel@lists.infradead.org
> ---
> 
> v2->v3: Add conditionalization to exclude SOC_ID Name from 32-bit builds.
> v1->v2: Address code review identified issues.
> 
>  drivers/firmware/smccc/soc_id.c | 79 +++++++++++++++++++++++++++++++++
>  include/linux/arm-smccc.h       | 37 +++++++++++++++
>  2 files changed, 116 insertions(+)
> 
> diff --git a/drivers/firmware/smccc/soc_id.c b/drivers/firmware/smccc/soc_id.c
> index 1990263fbba0..3b50ff5d2cbd 100644
> --- a/drivers/firmware/smccc/soc_id.c
> +++ b/drivers/firmware/smccc/soc_id.c
> @@ -32,6 +32,12 @@
>  static struct soc_device *soc_dev;
>  static struct soc_device_attribute *soc_dev_attr;
>  
> +static char __init *smccc_soc_name_init(void);
> +

Not really needed if you move you code before smccc_soc_init()

> +#ifdef CONFIG_ARM64
> +static char __ro_after_init smccc_soc_id_name[136] = "";

Move all in one block under #ifdef, details below.

> +#endif
> +
>  static int __init smccc_soc_init(void)
>  {
>  	int soc_id_rev, soc_id_version;
> @@ -72,6 +78,7 @@ static int __init smccc_soc_init(void)
>  	soc_dev_attr->soc_id = soc_id_str;
>  	soc_dev_attr->revision = soc_id_rev_str;
>  	soc_dev_attr->family = soc_id_jep106_id_str;
> +	soc_dev_attr->machine = smccc_soc_name_init();
>  
>  	soc_dev = soc_device_register(soc_dev_attr);
>  	if (IS_ERR(soc_dev)) {
> @@ -93,3 +100,75 @@ static void __exit smccc_soc_exit(void)
>  	kfree(soc_dev_attr);
>  }
>  module_exit(smccc_soc_exit);

Generally it good to have module_{init,exit} at the end of the file.
Move you additions above these.

> +
> +
> +#ifdef CONFIG_ARM64
> +static inline void str_fragment_from_reg(char *dst, unsigned long reg)
> +{
> +	dst[0] = (reg >> 0)  & 0xff;
> +	dst[1] = (reg >> 8)  & 0xff;
> +	dst[2] = (reg >> 16) & 0xff;
> +	dst[3] = (reg >> 24) & 0xff;
> +	dst[4] = (reg >> 32) & 0xff;
> +	dst[5] = (reg >> 40) & 0xff;
> +	dst[6] = (reg >> 48) & 0xff;
> +	dst[7] = (reg >> 56) & 0xff;
> +}
> +#endif
> +
> +static char __init *smccc_soc_name_init(void)
> +{
> +#ifdef CONFIG_ARM64
> +	struct arm_smccc_1_2_regs args;
> +	struct arm_smccc_1_2_regs res;
> +	size_t len;
> +
> +	/*
> +	 * Issue Number 1.6 of the Arm SMC Calling Convention
> +	 * specification introduces an optional "name" string
> +	 * to the ARM_SMCCC_ARCH_SOC_ID function.  Fetch it if
> +	 * available.
> +	 */
> +	args.a0 = ARM_SMCCC_ARCH_SOC_ID;
> +	args.a1 = 2;    /* SOC_ID name */
> +	arm_smccc_1_2_invoke(&args, &res);
> +	if ((u32)res.a0 == 0) {
> +		const unsigned int regsize = sizeof(res.a1);
> +
> +		/*
> +		 * Copy res.a1..res.a17 to the smccc_soc_id_name string
> +		 * 8 bytes at a time.  As per Issue 1.6 of the Arm SMC
> +		 * Calling Convention, the string will be NUL terminated
> +		 * and padded, from the end of the string to the end of the
> +		 * 136 byte buffer, with NULs.
> +		 */
> +		str_fragment_from_reg(smccc_soc_id_name + 0*regsize, res.a1);
> +		str_fragment_from_reg(smccc_soc_id_name + 1*regsize, res.a2);
> +		str_fragment_from_reg(smccc_soc_id_name + 2*regsize, res.a3);
> +		str_fragment_from_reg(smccc_soc_id_name + 3*regsize, res.a4);
> +		str_fragment_from_reg(smccc_soc_id_name + 4*regsize, res.a5);
> +		str_fragment_from_reg(smccc_soc_id_name + 5*regsize, res.a6);
> +		str_fragment_from_reg(smccc_soc_id_name + 6*regsize, res.a7);
> +		str_fragment_from_reg(smccc_soc_id_name + 7*regsize, res.a8);
> +		str_fragment_from_reg(smccc_soc_id_name + 8*regsize, res.a9);
> +		str_fragment_from_reg(smccc_soc_id_name + 9*regsize, res.a10);
> +		str_fragment_from_reg(smccc_soc_id_name + 10*regsize, res.a11);
> +		str_fragment_from_reg(smccc_soc_id_name + 11*regsize, res.a12);
> +		str_fragment_from_reg(smccc_soc_id_name + 12*regsize, res.a13);
> +		str_fragment_from_reg(smccc_soc_id_name + 13*regsize, res.a14);
> +		str_fragment_from_reg(smccc_soc_id_name + 14*regsize, res.a15);
> +		str_fragment_from_reg(smccc_soc_id_name + 15*regsize, res.a16);
> +		str_fragment_from_reg(smccc_soc_id_name + 16*regsize, res.a17);
> +
> +		len = strnlen(smccc_soc_id_name, sizeof(smccc_soc_id_name));
> +		if (len) {
> +			if (len == sizeof(smccc_soc_id_name))
> +				pr_warn(FW_BUG "Ignoring improperly formatted Name\n");
> +			else
> +				return smccc_soc_id_name;
> +		}
> +	}
> +#endif
> +
> +	return NULL;
> +}

Can we improve readability with

#ifdef CONFIG_ARM64

static char __ro_after_init smccc_soc_id_name[136] = "";

<both str_fragment_from_reg and smccc_soc_name_init here>

#else
static char __init *smccc_soc_name_init(void)
{
	return NULL;
}

#endif

> diff --git a/include/linux/arm-smccc.h b/include/linux/arm-smccc.h
> index 67f6fdf2e7cd..9d444e5862fe 100644
> --- a/include/linux/arm-smccc.h
> +++ b/include/linux/arm-smccc.h
> @@ -607,6 +607,12 @@ asmlinkage void __arm_smccc_hvc(unsigned long a0, unsigned long a1,
>  			___res->a0 = SMCCC_RET_NOT_SUPPORTED;		\
>  	} while (0)
>  
> +#define __fail_smccc_1_2(___res)					\
> +	do {								\
> +		if (___res)						\
> +			___res->a0 = SMCCC_RET_NOT_SUPPORTED;		\
> +	} while (0)
> +
>  /*
>   * arm_smccc_1_1_invoke() - make an SMCCC v1.1 compliant call
>   *
> @@ -639,5 +645,36 @@ asmlinkage void __arm_smccc_hvc(unsigned long a0, unsigned long a1,
>  		method;							\
>  	})
>  
> +/*
> + * arm_smccc_1_2_invoke() - make an SMCCC v1.2 compliant call
> + *
> + * @args: SMC args are in the a0..a17 fields of the arm_smcc_1_2_regs structure
> + * @res: result values from registers 0 to 17
> + *
> + * This macro will make either an HVC call or an SMC call depending on the
> + * current SMCCC conduit. If no valid conduit is available then -1
> + * (SMCCC_RET_NOT_SUPPORTED) is returned in @res.a0 (if supplied).
> + *
> + * The return value also provides the conduit that was used.
> + */
> +#define arm_smccc_1_2_invoke(args, res) ({				\
> +		struct arm_smccc_1_2_regs *__args = args;		\

I think we can move this macro and the above under CONFIG_ARM64 as
arm_smccc_1_2_regs is defined only for ARM64 for now. Otherwise one
could use this macro and get undefined compiler errors for the structure.

-- 
Regards,
Sudeep
