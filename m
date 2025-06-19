Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D850414F98;
	Thu, 19 Jun 2025 06:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750313008; cv=none; b=trVaFvU/30cqCV4Q6v2am28C8p6og5SBmcWqaC5h3HkzRqkkeKRigrbaE0mipHxJTc1ZXw/cBWOtmLtNOnsFmHHUrkdkg2d09aSnWJmkcKjskMxDkngE5nwdFM7MtPX3tojLwEc/HBFJ4YOF4tU2oiiY5YwIOx08HN0M456kxA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750313008; c=relaxed/simple;
	bh=Hx6dDfBI/0hQY9A2qgY8931u45fNYGeo9/rMq5NN1RY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mJD7w8wmCgmMLiilmdIv46DjpIEnkproz3Kh0wvvJSCJy40+o6P7jLosFd2znSRayGeG8VigQf4HOcJQr+CkDzQ/tE3/bDavyu5O6Ad+Z2M+aP65iNzA0K+XpaAjcZ6s9L540wf05RgeYx9GejZbE6xfhlzHFAvRcDCYTPUnDN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from [192.168.33.139] (unknown [210.73.43.2])
	by APP-01 (Coremail) with SMTP id qwCowAA359UdqFNolI6KBw--.6418S2;
	Thu, 19 Jun 2025 14:03:10 +0800 (CST)
Message-ID: <123a7558-fda9-4b56-b6ae-a29d704419ac@iscas.ac.cn>
Date: Thu, 19 Jun 2025 14:03:09 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] dt-bindings: mfd: add support the SpacmiT P1 PMIC
To: Alex Elder <elder@riscstar.com>, lee@kernel.org, lgirdwood@gmail.com,
 broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, dlan@gentoo.org
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, troymitchell988@gmail.com, guodong@riscstar.com,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250613210150.1468845-1-elder@riscstar.com>
 <20250613210150.1468845-2-elder@riscstar.com>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <20250613210150.1468845-2-elder@riscstar.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:qwCowAA359UdqFNolI6KBw--.6418S2
X-Coremail-Antispam: 1UD129KBjvdXoW7XryxCw47JF45ZF1fWFyfZwb_yoWDAFX_ur
	93uayDtrsrJFn2kas0van7AryfGr42yr4xXay3JFy8J395Z3Z8u3ZrJry7ArWrXrWUZrn3
	Jrn3Xr40q3WjgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb-8YjsxI4VWDJwAYFVCjjxCrM7AC8VAFwI0_Xr0_Wr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_JFC_Wr1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
	8E87Iv6xkF7I0E14v26F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7
	MxkF7I0En4kS14v26r4a6rW5MxkIecxEwVAFwVW8AwCF04k20xvY0x0EwIxGrwCFx2IqxV
	CFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r10
	6r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxV
	WUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG
	6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr
	1UYxBIdaVFxhVjvjDU0xZFpf9x07jm4E_UUUUU=
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/

Hi Alex,

Before the patch body, there's a typo in the subject line: "SpacmiT" ->
"SpacemiT".

On 6/14/25 05:01, Alex Elder wrote:
> Enable the SpacemiT P1, which is an I2C-controlled PMIC.  Initially we
> only the regulators will be supported.
>
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
>  .../devicetree/bindings/mfd/spacemit,p1.yaml  | 86 +++++++++++++++++++
>  1 file changed, 86 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
>
> <snip>
>
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        pmic@41 {
> +            compatible = "spacemit,p1";
> +            reg = <0x41>;
> +            interrupts = <64>;
> +

(Not really a review, just a note.)

I couldn't believe it at first, but it looks like the SpacemiT K1 really
does have PLIC interrupt 64 dedicated to receiving PMIC interrupt [1]
over pin "PMIC_INT_N".

Regards,
Vivian "dramforever" Wang

[1]: https://developer.spacemit.com/documentation?token=AZsXwVrqaisaDGkUqMWcNuMVnPb

> <snip>

