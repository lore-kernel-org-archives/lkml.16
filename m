Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945C121883F;
	Thu, 19 Jun 2025 14:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750342412; cv=none; b=rMghthV0YI/X4xVJoKNyIV4Su6Dw3wI+yjPZv16dx+jcQDbbYnHn1b7AvtC5kv2RrIVTD9aJVcH9kGfAUFyEWE3rZmaRJbEcmB13DR9qBWDXTR6t9ezuDfDccKtV5rO4VbkmxysyeUQ9V4HJbGjuwkz3Nn7SVt224in/4ClkSg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750342412; c=relaxed/simple;
	bh=U6yVuvluXAhR/fr0dFbQGKpCGEQa4jO8zcrBl72oYAs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c20sYx/YJ1MB4KiXE2dO4b/GS5NZ2Rf4FveAYIMCRRSu/0ltJrBpBMiabXxwkRPYm82eQb4o5WkZsSFmRgV2VmHwlpq2/mmrho4A8D6/yhdQAmU6/yv6/2H7Sj2bKywlqUXswrxCvq0seL6Z01N3YmS8zZcLU6rKPw9r4L97o0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from [192.168.0.110] (unknown [114.241.87.235])
	by APP-03 (Coremail) with SMTP id rQCowACH2VHxGlRoB2WXBw--.1804S2;
	Thu, 19 Jun 2025 22:13:07 +0800 (CST)
Message-ID: <b73c0d8e-9869-469e-a46a-ddec9328885e@iscas.ac.cn>
Date: Thu, 19 Jun 2025 22:13:05 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] regulator: spacemit: support SpacemiT P1 regulators
To: Alex Elder <elder@riscstar.com>, lee@kernel.org, lgirdwood@gmail.com,
 broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, dlan@gentoo.org
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, troymitchell988@gmail.com, guodong@riscstar.com,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250613210150.1468845-1-elder@riscstar.com>
 <20250613210150.1468845-4-elder@riscstar.com>
 <acac9522-fb19-4659-8e1a-544bf75f3864@iscas.ac.cn>
 <6504c609-f8b5-42e3-88ad-5cbee30a52ed@riscstar.com>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <6504c609-f8b5-42e3-88ad-5cbee30a52ed@riscstar.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowACH2VHxGlRoB2WXBw--.1804S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Xw1xtryfJrWkGF4rtF1UZFb_yoW8Jr1fpF
	4av3sIkwn5JFW8Zr4Durn7X3WFgF48Xa47Jr15Xr43Z34DWa129Fs2ka1Yvay8Xr95GF12
	9w4qqryvkFyDZrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvqb7Iv0xC_Zr1lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY
	1x0262kKe7AKxVW8ZVWrXwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
	C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
	wI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
	v20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2
	jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0x
	ZFpf9x07jgPEfUUUUU=
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/

On 6/19/25 21:23, Alex Elder wrote:
> On 6/19/25 1:15 AM, Vivian Wang wrote:
>> Also, consider naming this consistently: "spacemit-p1", or
>> "spacemit-p1-regulator"?
>
> Let me see if I understand your comment, by explaining the
> naming I used.
>
> The PMIC driver could support a different PMIC.  Its OF
> match table specifies a compatible string with matching
> data, and the data describes attributes of the P1 PMIC.
> So that driver uses MOD_NAME "spacemit-pmic".
>
> This driver describes specifically the regulators found
> in the P1 PMIC, so it uses "spacemit-p1-regulator" as
> its MOD_NAME.
>
> You might still be right; but does this change what you
> are suggesting?

Oh sorry it was simpler than that. It's just I've noted that this 
regulator module file is called "spacemit-p1":

> +obj-$(CONFIG_REGULATOR_SPACEMIT_P1) += spacemit-p1.o

... but the MOD_NAME is "spacemit-p1-regulator", and I was wondering if 
it made sense to rename the module to also "spacemit-p1-regulator". In 
addition to consistency, modules are free to have all sorts of names in 
Linux, but the names have to be unique, so if this is only the regulator 
driver part, the name should reflect that.

Vivian "dramforever" Wang


